-- Custom snippets: Blade, PHP/Laravel, Filament, Alpine.js
-- LuaSnip extra is loaded in lua/config/lazy.lua

return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local fmt = require("luasnip.extras.fmt").fmt

      -- ─── BLADE ───────────────────────────────────────────────────────────────

      ls.add_snippets("blade", {
        -- Livewire
        s("wire:model", { t('wire:model="'), i(1, "property"), t('"') }),
        s("wire:click", { t('wire:click="'), i(1, "method"), t('"') }),
        s("wire:submit", { t('wire:submit.prevent="'), i(1, "submit"), t('"') }),

        -- Blade directives
        s("@if", {
          t("@if("), i(1, "condition"), t({ ")", "\t" }), i(2), t({ "", "@endif" }),
        }),
        s("@foreach", {
          t("@foreach("), i(1, "$items as $item"), t({ ")", "\t" }), i(2), t({ "", "@endforeach" }),
        }),
        s("@forelse", {
          t("@forelse("), i(1, "$items as $item"), t({ ")", "\t" }),
          i(2), t({ "", "@empty", "\t" }), i(3), t({ "", "@endforelse" }),
        }),
        s("@for", {
          t("@for("), i(1, "$i = 0; $i < 10; $i++"), t({ ")", "\t" }), i(2), t({ "", "@endfor" }),
        }),
        s("@while", {
          t("@while("), i(1, "condition"), t({ ")", "\t" }), i(2), t({ "", "@endwhile" }),
        }),
        s("@auth", { t({ "@auth", "\t" }), i(1), t({ "", "@endauth" }) }),
        s("@guest", { t({ "@guest", "\t" }), i(1), t({ "", "@endguest" }) }),
        s("@can", {
          t("@can('"), i(1, "permission"), t({ "')", "\t" }), i(2), t({ "", "@endcan" }),
        }),
        s("@section", {
          t("@section('"), i(1, "name"), t({ "')", "\t" }), i(2), t({ "", "@endsection" }),
        }),
        s("@extends", { t("@extends('"), i(1, "layouts.app"), t("')") }),
        s("@yield", { t("@yield('"), i(1, "content"), t("')") }),
        s("@include", { t("@include('"), i(1, "partials.component"), t("')") }),
        s("@component", {
          t("@component('"), i(1, "components.name"), t({ "')", "\t" }), i(2), t({ "", "@endcomponent" }),
        }),
        s("@push", {
          t("@push('"), i(1, "scripts"), t({ "')", "\t" }), i(2), t({ "", "@endpush" }),
        }),
        s("@stack", { t("@stack('"), i(1, "scripts"), t("')") }),
        s("@livewire", { t("@livewire('"), i(1, "component-name"), t("')") }),
        s("@csrf", { t("@csrf") }),
        s("@method", { t("@method('"), i(1, "PUT"), t("')") }),

        -- Alpine.js
        s("alpine.data", { t('x-data="{ '), i(1), t(' }"') }),
        s("alpine.show", { t('x-show="'), i(1, "condition"), t('"') }),
        s("alpine.if", { t('x-if="'), i(1, "condition"), t('"') }),
        s("alpine.for", { t('x-for="'), i(1, "item in items"), t('"') }),
        s("alpine.on", { t("x-on:"), i(1, "click"), t('="'), i(2, "handler"), t('"') }),
        s("alpine.model", { t('x-model="'), i(1, "property"), t('"') }),
      })

      -- ─── PHP / LARAVEL ────────────────────────────────────────────────────────

      ls.add_snippets("php", {
        -- Routes
        s("route.get", fmt("Route::get('{}', [{}::class, '{}']);", { i(1, "/path"), i(2, "Controller"), i(3, "method") })),
        s("route.post", fmt("Route::post('{}', [{}::class, '{}']);", { i(1, "/path"), i(2, "Controller"), i(3, "method") })),
        s("route.put", fmt("Route::put('{}', [{}::class, '{}']);", { i(1, "/path"), i(2, "Controller"), i(3, "method") })),
        s("route.delete", fmt("Route::delete('{}', [{}::class, '{}']);", { i(1, "/path"), i(2, "Controller"), i(3, "method") })),
        s("route.resource", fmt("Route::resource('{}', {}::class);", { i(1, "resource"), i(2, "Controller") })),
        s("route.apiResource", fmt("Route::apiResource('{}', {}::class);", { i(1, "resource"), i(2, "Controller") })),

        -- Controller method
        s(
          "controller",
          fmt(
            [[
public function {}(Request $request)
{{
    {}
}}
]],
            { i(1, "method"), i(2, "//") }
          )
        ),

        -- Model
        s(
          "model",
          fmt(
            [[
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class {} extends Model
{{
    use HasFactory;

    protected $fillable = [
        {}
    ];
}}
]],
            { i(1, "ModelName"), i(2, "'column'") }
          )
        ),

        -- Migrations
        s(
          "migration.create",
          fmt(
            [[
Schema::create('{}', function (Blueprint $table) {{
    $table->id();
    {}
    $table->timestamps();
}});
]],
            { i(1, "table_name"), i(2, "$table->string('column');") }
          )
        ),
        s(
          "migration.table",
          fmt(
            [[
Schema::table('{}', function (Blueprint $table) {{
    {}
}});
]],
            { i(1, "table_name"), i(2, "$table->string('column');") }
          )
        ),

        -- Validation
        s(
          "validate",
          fmt(
            [[
$validated = $request->validate([
    {} => ['required', {}],
]);
]],
            { i(1, "'field'"), i(2, "'string'") }
          )
        ),

        -- Eloquent relationships
        s("belongsTo", fmt("public function {}(): BelongsTo\n{{\n    return $this->belongsTo({}::class);\n}}", { i(1, "relation"), i(2, "Model") })),
        s("hasMany", fmt("public function {}(): HasMany\n{{\n    return $this->hasMany({}::class);\n}}", { i(1, "relation"), i(2, "Model") })),
        s("hasOne", fmt("public function {}(): HasOne\n{{\n    return $this->hasOne({}::class);\n}}", { i(1, "relation"), i(2, "Model") })),
        s("belongsToMany", fmt("public function {}(): BelongsToMany\n{{\n    return $this->belongsToMany({}::class);\n}}", { i(1, "relation"), i(2, "Model") })),

        -- Livewire
        s(
          "livewire",
          fmt(
            [[
<?php

namespace App\Livewire;

use Livewire\Component;

class {} extends Component
{{
    {}

    public function render()
    {{
        return view('livewire.{}');
    }}
}}
]],
            { i(1, "ComponentName"), i(2, "public $property;"), i(3, "component-name") }
          )
        ),
        s(
          "livewire.filament",
          fmt(
            [[
<?php

namespace App\Livewire;

use Livewire\Component;

class {} extends Component
{{
    {}

    public function render()
    {{
        return view('livewire.{}');
    }}
}}
]],
            { i(1, "ComponentName"), i(2, "public $property;"), i(3, "component-name") }
          )
        ),

        -- Factory
        s(
          "factory",
          fmt(
            [[
public function definition(): array
{{
    return [
        {} => fake()->{}(),
    ];
}}
]],
            { i(1, "'field'"), i(2, "word") }
          )
        ),

        -- Tests
        s(
          "test",
          fmt(
            [[
public function test_{}(): void
{{
    {}

    $this->assertTrue(true);
}}
]],
            { i(1, "feature_name"), i(2, "// Arrange & Act") }
          )
        ),
        s(
          "pest.test",
          fmt(
            [[
test('{}', function () {{
    {}

    expect(true)->toBeTrue();
}});
]],
            { i(1, "feature name"), i(2, "// Arrange & Act") }
          )
        ),

        -- ─── FILAMENT ──────────────────────────────────────────────────────────

        s(
          "filament.resource",
          fmt(
            [[
<?php

namespace App\Filament\Resources;

use App\Filament\Resources\{}Resource\Pages;
use App\Models\{};
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class {}Resource extends Resource
{{
    protected static ?string $model = {}::class;

    protected static ?string $navigationIcon = 'heroicon-o-{}';

    public static function form(Form $form): Form
    {{
        return $form
            ->schema([
                {}
            ]);
    }}

    public static function table(Table $table): Table
    {{
        return $table
            ->columns([
                {}
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }}

    public static function getRelations(): array
    {{
        return [];
    }}

    public static function getPages(): array
    {{
        return [
            'index'  => Pages\List{}::route('/'),
            'create' => Pages\Create{}::route('/create'),
            'edit'   => Pages\Edit{}::route('/{{record}}/edit'),
        ];
    }}
}}
]],
            {
              i(1, "Model"), i(2, "Model"), i(3, "Model"), i(4, "Model"),
              i(5, "rectangle-stack"),
              i(6, "Forms\\Components\\TextInput::make('name')->required()"),
              i(7, "Tables\\Columns\\TextColumn::make('name')"),
              i(8, "Model"), i(9, "Model"), i(10, "Model"),
            }
          )
        ),

        -- Form components
        s("filament.form.text", fmt("Forms\\Components\\TextInput::make('{}')\n    ->required()\n    ->maxLength(255),", { i(1, "field") })),
        s("filament.form.textarea", fmt("Forms\\Components\\Textarea::make('{}')\n    ->required()\n    ->columnSpanFull(),", { i(1, "field") })),
        s("filament.form.select", fmt("Forms\\Components\\Select::make('{}')\n    ->options({})\n    ->required(),", { i(1, "field"), i(2, "[]") })),
        s("filament.form.toggle", fmt("Forms\\Components\\Toggle::make('{}')\n    ->required(),", { i(1, "field") })),
        s("filament.form.datepicker", fmt("Forms\\Components\\DatePicker::make('{}')\n    ->required(),", { i(1, "field") })),
        s(
          "filament.form.repeater",
          fmt(
            [[
Forms\Components\Repeater::make('{}')
    ->schema([
        {}
    ])
    ->columns(2),
]],
            { i(1, "items"), i(2, "Forms\\Components\\TextInput::make('name')") }
          )
        ),
        s(
          "filament.form.section",
          fmt(
            [[
Forms\Components\Section::make('{}')
    ->schema([
        {}
    ])
    ->columns(2),
]],
            { i(1, "Section Title"), i(2, "// components") }
          )
        ),

        -- Table columns
        s("filament.table.text", fmt("Tables\\Columns\\TextColumn::make('{}')\n    ->searchable()\n    ->sortable(),", { i(1, "field") })),
        s("filament.table.badge", fmt("Tables\\Columns\\BadgeColumn::make('{}')\n    ->colors({}),", { i(1, "status"), i(2, "['success' => 'active']") })),
        s("filament.table.boolean", fmt("Tables\\Columns\\IconColumn::make('{}')\n    ->boolean(),", { i(1, "field") })),
        s("filament.table.image", fmt("Tables\\Columns\\ImageColumn::make('{}')\n    ->circular(),", { i(1, "avatar") })),

        -- Actions
        s(
          "filament.action",
          fmt(
            [[
Tables\Actions\Action::make('{}')
    ->icon('heroicon-o-{}')
    ->action(function ({} $record) {{
        {}
    }}),
]],
            { i(1, "action_name"), i(2, "check"), i(3, "Model"), i(4, "// logic") }
          )
        ),

        -- Widget
        s(
          "filament.widget",
          fmt(
            [[
<?php

namespace App\Filament\Widgets;

use Filament\Widgets\{}Widget;

class {} extends {}Widget
{{
    protected static ?int $sort = {};

    protected function getData(): array
    {{
        return [
            {}
        ];
    }}
}}
]],
            { i(1, "Chart"), i(2, "WidgetName"), i(3, "Chart"), i(4, "1"), i(5, "// data") }
          )
        ),

        -- Page
        s(
          "filament.page",
          fmt(
            [[
<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;

class {} extends Page
{{
    protected static ?string $navigationIcon = 'heroicon-o-{}';

    protected static string $view = 'filament.pages.{}';

    {}
}}
]],
            { i(1, "PageName"), i(2, "document-text"), i(3, "page-name"), i(4, "") }
          )
        ),

        -- Relation Manager
        s(
          "filament.relation",
          fmt(
            [[
<?php

namespace App\Filament\Resources\{}Resource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;

class {}RelationManager extends RelationManager
{{
    protected static string $relationship = '{}';

    public function form(Form $form): Form
    {{
        return $form
            ->schema([
                {}
            ]);
    }}

    public function table(Table $table): Table
    {{
        return $table
            ->columns([
                {}
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }}
}}
]],
            {
              i(1, "Parent"), i(2, "Relation"), i(3, "relation"),
              i(4, "Forms\\Components\\TextInput::make('name')"),
              i(5, "Tables\\Columns\\TextColumn::make('name')"),
            }
          )
        ),
      })
    end,
  },
}
