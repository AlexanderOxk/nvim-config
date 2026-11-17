return {
  settings = {
    basedpyright = {
      -- Let Ruff handle import sorting
      disableOrganizeImports = true,
      analysis = {
        diagnosticSeverityOverrides = {
          -- Avoid noise on third-party libraries returning Any
          reportAny = false,

          -- Let Ruff handle unused variables, imports, and arguments
          reportUnusedImport = false,
          reportUnusedVariable = false,

          -- Silence warnings when ignoring return values
          reportUnusedCallResult = false,
        },
      },
    },
  },
}
