Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3773542EE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:41:50 +0200 (CEST)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQQH-0008RZ-1k
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHA-00019w-2R
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:24 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQH1-0001gN-L1
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:23 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so7658693wmy.5
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p27G6Mpux4Qspdx5EdK3xzLt3ibjSRL9rOzmrpq9xh8=;
 b=TeHPgyCz4zXUk9MjVsXCqgeGLtp2tma0rytvmmO76JkoZl1RWEt08R+99QB1IkoaIv
 rtBc5ksfnoSjUtsXvUlbbxEqDN/ofXbCIDWecBdjrUjYaHdcBryOrjNC5jWaRG4pUiRC
 F8Jith0tNt7CosGMjSX1uqLX/BhLGhRqD7eQCysLBSijIH+qt8AwIkpgFBceWrKGHnVN
 MBek8kYqT39JCGOkUkT5NHPNhkVBy03A2ZsS/qsS6Mfp0weV58rPuDPB/6PtCjyEUCya
 aXj6GiR3Mvws2Cs7dw7wugrs1jjR9Nky5Wg7EKFDusM4XX3tC8HlSn/Y9Q6TDtSssj6n
 VgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p27G6Mpux4Qspdx5EdK3xzLt3ibjSRL9rOzmrpq9xh8=;
 b=iYaxGED0koVZViTZ3dbzLckUHnvvtgx9oDzk3gt32baUvvJ9XgmMnBwXezGzTkAHKg
 tNPpCqe3UnNWM/bKf4xAr6GekB2VCIGjMEOq0M3fgn519//NOVUkg0KdRpobsNUSOIR7
 K6dFd9X8vlzusxyd0JTeL9QB0SCjiKT2LH31gBF5a+ZnunZ70UzaC3Um0Poi4akMengi
 B/v3lgrqXWPjDjJqfvDxC395OhNnjBLE9+ITtMOmA3ScbneTy6CNmND7M/zlwGeN5VfW
 wSOX3c3yikGB5xN+aHhsf6806NKSsISAYRyjOWWhYbB3pC8K9fTLOHSWLhBCo99VhhoH
 cNJQ==
X-Gm-Message-State: AOAM531uJ5xYFG/ELmQfKQgoYs8+qLb5FCJVPdQmGiISbuLid9AHCAiZ
 Ek0fFdlcdCv2HDSThd4oCCdoyKnU8xR/lQ==
X-Google-Smtp-Source: ABdhPJwaKdkP6+dYBQH5DJ6rrQUXVEoK3vLDqZBR9Q2zs+tGNjxWBcARNH2pS+LMfS9iHk0urBVirA==
X-Received: by 2002:a05:600c:1913:: with SMTP id
 j19mr25349799wmq.155.1617633133883; 
 Mon, 05 Apr 2021 07:32:13 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:13 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 06/27] arc: semfunc.c tcg code generator.
Date: Mon,  5 Apr 2021 15:31:17 +0100
Message-Id: <20210405143138.17016-7-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

TCG generator scripts for semfunc.c file.

Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
---
 target/arc/semfunc_generator/Gemfile          |   3 +
 target/arc/semfunc_generator/README           |  35 ++
 .../classes/CreateInternalVars.rb             | 117 ++++
 .../classes/DecomposeExpressions.rb           |  45 ++
 .../classes/IdentifyQEmuStaticInferedParts.rb |  91 +++
 .../semfunc_generator/classes/QEmuCompiler.rb |  15 +
 .../classes/QEmuTranslator.rb                 | 269 +++++++++
 .../classes/SemanticFunctionAST.rb            | 466 +++++++++++++++
 .../classes/SpaghettiCodePass.rb              |  55 ++
 .../classes/SpaghettiCodePass1.rb             |  66 +++
 .../semfunc_generator/classes/UnfoldCode.rb   | 305 ++++++++++
 target/arc/semfunc_generator/init.rb          |  15 +
 .../arc/semfunc_generator/modules/Compiler.rb |  42 ++
 .../modules/ConstantTables.rb                 |  57 ++
 target/arc/semfunc_generator/modules/Pass.rb  |  11 +
 .../SemanticFunctionASTBlockOperators.rb      | 145 +++++
 .../modules/SemanticFunctionASTFactory.rb     |  55 ++
 .../semfunc_generator/modules/Translator.rb   | 102 ++++
 .../modules/TranslatorAST.rb                  |  80 +++
 .../modules/TranslatorFinal.rb                | 103 ++++
 .../parsers/SemanticFunctionParser.tab.rb     | 553 ++++++++++++++++++
 .../parsers/SemanticFunctionParser.y          | 126 ++++
 .../semfunc_generator/regenerate_semfunc.rb   | 245 ++++++++
 23 files changed, 3001 insertions(+)
 create mode 100644 target/arc/semfunc_generator/Gemfile
 create mode 100644 target/arc/semfunc_generator/README
 create mode 100644 target/arc/semfunc_generator/classes/CreateInternalVars.rb
 create mode 100644 target/arc/semfunc_generator/classes/DecomposeExpressions.rb
 create mode 100644 target/arc/semfunc_generator/classes/IdentifyQEmuStaticInferedParts.rb
 create mode 100644 target/arc/semfunc_generator/classes/QEmuCompiler.rb
 create mode 100644 target/arc/semfunc_generator/classes/QEmuTranslator.rb
 create mode 100644 target/arc/semfunc_generator/classes/SemanticFunctionAST.rb
 create mode 100644 target/arc/semfunc_generator/classes/SpaghettiCodePass.rb
 create mode 100644 target/arc/semfunc_generator/classes/SpaghettiCodePass1.rb
 create mode 100644 target/arc/semfunc_generator/classes/UnfoldCode.rb
 create mode 100644 target/arc/semfunc_generator/init.rb
 create mode 100644 target/arc/semfunc_generator/modules/Compiler.rb
 create mode 100644 target/arc/semfunc_generator/modules/ConstantTables.rb
 create mode 100644 target/arc/semfunc_generator/modules/Pass.rb
 create mode 100644 target/arc/semfunc_generator/modules/SemanticFunctionASTBlockOperators.rb
 create mode 100644 target/arc/semfunc_generator/modules/SemanticFunctionASTFactory.rb
 create mode 100644 target/arc/semfunc_generator/modules/Translator.rb
 create mode 100644 target/arc/semfunc_generator/modules/TranslatorAST.rb
 create mode 100644 target/arc/semfunc_generator/modules/TranslatorFinal.rb
 create mode 100644 target/arc/semfunc_generator/parsers/SemanticFunctionParser.tab.rb
 create mode 100644 target/arc/semfunc_generator/parsers/SemanticFunctionParser.y
 create mode 100644 target/arc/semfunc_generator/regenerate_semfunc.rb

diff --git a/target/arc/semfunc_generator/Gemfile b/target/arc/semfunc_generator/Gemfile
new file mode 100644
index 0000000000..ad695b4d11
--- /dev/null
+++ b/target/arc/semfunc_generator/Gemfile
@@ -0,0 +1,3 @@
+source 'http://rubygems.org'
+
+gem 'racc'
diff --git a/target/arc/semfunc_generator/README b/target/arc/semfunc_generator/README
new file mode 100644
index 0000000000..965e79b894
--- /dev/null
+++ b/target/arc/semfunc_generator/README
@@ -0,0 +1,35 @@
+Helper file for ARC instruction traslation functions.
+
+The code generator was implemented using ruby language.
+In order to change the content of semfunc.c file these scripts should be used.
+
+Ruby instalation process:
+
+The recommended way to obtain a compatible ruby is to install it in a user
+local directory using RVM.
+Instructions to install RVM can be found in https://rvm.io/.
+
+Using RVM one can install Ruby interpreter executing the following
+steps/commands.
+
+Install Ruby version 2.6:
+  # rvm install ruby-2.6
+Set ruby version 2.6 as current in use.
+  # rvm use 2.6
+Create an isolated environment for the required ruby dependencies.
+  # rvm gemset create arc_generator
+Install bundler tool
+  # gem install bundler
+Bundle tool reads the Gemfile file and installs project dependencies.
+  # cd ${QEMU_SOURCE}/target/arc/semfunc_generator & bundle install
+
+
+In order to regenerate the semfunc.c file, please execute the following command.
+  # ruby regenerate_semfunc.rb > ../semfunc.c
+
+By default the tool reads the semfunc.c file and prints the new content for
+the same file.
+The information of what is generated is presented as comment in the file.
+In order to change the functionality of those functions one should change the
+"pseudo code" in the comments, which is what is used to generate the
+semantically similar TCG code.
diff --git a/target/arc/semfunc_generator/classes/CreateInternalVars.rb b/target/arc/semfunc_generator/classes/CreateInternalVars.rb
new file mode 100644
index 0000000000..05b2eac7ab
--- /dev/null
+++ b/target/arc/semfunc_generator/classes/CreateInternalVars.rb
@@ -0,0 +1,117 @@
+class CreateInternalVars
+  private
+
+  # extend SemanticFunctionASTFactory
+  include Pass
+  include ConstantTables
+  extend TranslatorAST
+
+
+
+  def self.translation_rules
+    ret = {}
+
+    create_var = Proc.new { |stmt, repl, mappings, to_do|
+
+      var = stmt.object[:lhs]
+      rhs = stmt.object[:rhs]
+      if(@@vars[var.object[:name]].nil? && var.object[:name] !~ /@.+/)
+        # puts "VAR = #{var.object[:name]}"
+        if(var.hasAttr?(:static))
+          defVar = SemanticFunctionAST.function("defStaticVariable", stmt.getAttr(:static), stmt.object[:lhs])
+        else
+	  #puts "NAME = #{rhs.object.inspect}"
+	  #puts "L = #{LIST_OF_FUNCTIONS.index(rhs.object[:name])}"
+
+
+	  defVar = SemanticFunctionAST.function("defVariable", stmt.object[:lhs])
+	  #if(rhs.object[:type] == :func && !TEMP_CREATING_FUNCTIONS.index(rhs.object[:name]).nil?)
+	  #  #puts " IN HERE"
+	  #  stmt.object[:lhs].setAttr(:reference, true)
+          #  defVar = SemanticFunctionAST.function("defReference", stmt.object[:lhs])
+	  #else
+	  #  defVar = SemanticFunctionAST.function("defVariable", stmt.object[:lhs])
+
+
+
+	  #end
+        end
+        # to_do[:pre_pend].push(defVar)
+        @@vars[var.object[:name]] = defVar
+        # @@vars1[var.object[:name]] = {
+        #   defVar: defVar,
+        #   stmt: stmt,
+        #   block: stmt.find_parent_node_with_type(:block)
+        # }
+      # elsif(@@vars[var.object[:name]].nil? && var.object[:name] =~ /@.+/)
+      end
+    }
+
+    match = SemanticFunctionAST.new(type: :assign,
+                                    lhs: SemanticFunctionAST.var("a"),
+                                    rhs: SemanticFunctionAST.var("_"))
+    ret[match] = create_var
+
+    match = Proc.new { |ast|
+      ret = { result: false, mappings: {} }
+      ret = { result: true, mappings: {} } if(ast.object[:type] == :if)
+      ret
+    }
+    ret[match] = Proc.new { |stmt_ast, repl, mappings, to_do|
+      generate(stmt_ast.object[:then])
+      generate(stmt_ast.object[:else])
+      nil
+    }
+
+    return ret
+  end
+
+
+  public
+  def self.task(ast)
+    @@vars = {}
+    # @@vars1 = {}
+    self.generate(ast)
+    # puts "AST = #{ast.class}"
+    # puts ast.debug
+
+    # NOTE: Add free variables to end of semfunc.
+    new_stmt_list = SemanticFunctionAST.createStmtListFromArray(@@vars.values)
+    new_stmt_list.append_in_stmt_list(ast)
+    ast = new_stmt_list
+
+    list = []
+    @@vars.each_pair do |var_name, func|
+
+      # puts "VAR: #{var_name}"
+      # puts "STMT: #{@@vars1[var_name][:stmt]}"
+      # puts "BLOCK:\n#{@@vars1[var_name][:block].class}"
+
+      # list.push(var_name) if func.object[:type] == :func &&
+      #                        (func.object[:name] == "defVariable" ||
+      #                         func.object[:name] == "defReference")
+
+      if(func.object[:type] == :func)
+        if(func.object[:name] == "defVariable")
+          list.push(SemanticFunctionAST.function("freeVariable", SemanticFunctionAST.var(var_name)))
+        elsif(func.object[:name] == "defReference")
+          list.push(SemanticFunctionAST.function("freeReference", SemanticFunctionAST.var(var_name)))
+        end
+      end
+    end
+    # list = list.map do |var_name|
+    #   SemanticFunctionAST.function("freeVariable", SemanticFunctionAST.var(var_name))
+    # end
+    stmt_list = SemanticFunctionAST.createStmtListFromArray(list)
+    ast.append_in_stmt_list(stmt_list)
+
+    # @@vars.each_pair do |k, v|
+    #   puts "FREE: #{k} : #{v.pp}"
+    #   ast.prepend_in_stmt_list(SemanticFunctionAST.function("freeVariable", SemanticFunctionAST.createVar(k)))
+    # end
+
+    # puts ast.pp
+
+    return ast
+  end
+end
diff --git a/target/arc/semfunc_generator/classes/DecomposeExpressions.rb b/target/arc/semfunc_generator/classes/DecomposeExpressions.rb
new file mode 100644
index 0000000000..c353cc90bb
--- /dev/null
+++ b/target/arc/semfunc_generator/classes/DecomposeExpressions.rb
@@ -0,0 +1,45 @@
+class DecomposeExpressions
+  private
+
+  extend SemanticFunctionASTFactory
+  include Pass
+
+  def self.traverse(ast)
+  end
+
+  def self.expandConditions(ast)
+    object = ast.object
+    case(object[:type])
+    when :var
+    else
+      return ast
+    end
+    return ret
+  end
+
+  public
+  def self.task(ast)
+    # reset_counters
+    tmp_vars_for_nodes = {}
+    current_stmt = nil
+
+    ast.traverse_LR_TB() do |ast, to_do|
+      object = ast.object
+      case(object[:type])
+      when :func
+        if(object[:name] == "IF")
+          to_do[:pre_pend] += ast.object[:args][0].create_stmts_for_expression()
+
+          var = to_do[:pre_pend][-1].object[:lhs]
+
+          ast.object[:args][0] = SemanticFunctionAST.new(type: :bincond, name: "==", lhs: var, rhs: createVar("true"))
+        end
+      else
+
+      end
+      true
+    end
+
+    return ast
+  end
+end
diff --git a/target/arc/semfunc_generator/classes/IdentifyQEmuStaticInferedParts.rb b/target/arc/semfunc_generator/classes/IdentifyQEmuStaticInferedParts.rb
new file mode 100644
index 0000000000..536f9fdd49
--- /dev/null
+++ b/target/arc/semfunc_generator/classes/IdentifyQEmuStaticInferedParts.rb
@@ -0,0 +1,91 @@
+class IdentifyQEmuStaticInferedParts
+  private
+
+  # extend SemanticFunctionASTFactory
+  include Pass
+  extend Translator
+
+  public
+
+  rules = {}
+  def self.translation_rules
+    ret = {}
+    functions = {
+      "shouldExecuteDelaySlot" => "bool",
+      "getAAFlag" => "int",
+      "getZZFlag" => "int",
+      "getFFlag" => "int",
+      "getFlagX" => "bool",
+      "nextReg" => "TCGvPtr",
+      "instructionHasRegisterOperandIn" => "bool",
+      "targetHasOption" => "bool",
+      "Ext64" => "TCGv_i64",
+      "SignExt64" => "TCGv_i64",
+      "SignExtend" => "TCGv",
+      "getNFlag" => "TCGv",
+      "Zero" => "TCGv",
+    }.each_pair do |name, type|
+      ret[SemanticFunctionAST.function(name)] = SemanticFunctionAST.var(type)
+    end
+    # ret[SemanticFunctionAST.function("shouldExecuteDelaySlot")] = SemanticFunctionAST.var("bool")
+    # ret[SemanticFunctionAST.function("getAAFlag")] = SemanticFunctionAST.var("int")
+    # ret[SemanticFunctionAST.function("getZZFlag")] = SemanticFunctionAST.var("int")
+    return ret;
+  end
+  def self.task(ast)
+    static_variables = {}
+
+    ast.traverse_LR_BT do |ast|
+
+      rules = {
+      }
+
+      match = self.find_matching_rule(ast)
+      if(match)
+        if(match[:replacement])
+          ast.setAttr(:static, match[:replacement])
+        end
+      else
+        case(ast.object[:type])
+        when :var
+          name = ast.object[:name]
+          ast.setAttr(:static, static_variables[name]) if static_variables[name] != nil && ast.object[:name] !~ /@.+/
+        when :assign
+          name = ast.object[:lhs].object[:name]
+          if(ast.object[:rhs].hasAttr?(:static))
+            ast.object[:lhs].setAttr(:static, ast.object[:rhs].getAttr(:static))
+            ast.setAttr(:static, ast.object[:rhs].getAttr(:static))
+            static_variables[name] = ast.object[:rhs].getAttr(:static) if static_variables[name].nil?
+          end
+        when :if
+          ast.setAttr(:static, ast.object[:cond].getAttr(:static)) if(ast.object[:cond].hasAttr?(:static))
+        when :unicond
+          ast.setAttr(:static, ast.object[:rhs].getAttr(:static)) if(ast.object[:rhs].hasAttr?(:static))
+        when :bincond
+          if(ast.object[:lhs].hasAttr?(:static) && ast.object[:rhs].hasAttr?(:static))
+            # TODO: Static elements might not have same type. Create a warning
+            ast.setAttr(:static, ast.object[:lhs].getAttr(:static))
+
+          elsif(ast.object[:lhs].hasAttr?(:static))
+            tmp = ast.object[:rhs]
+            if(tmp.object[:type] == :number || tmp.object[:type] == :var )
+              tmp.setAttr(:static, ast.object[:lhs].getAttr(:static))
+              ast.setAttr(:static, ast.object[:lhs].getAttr(:static))
+            end
+
+            # TODO: Verify if other conditions are possible as well.
+            # For example, verify if bincond for static and non static conjunctions.
+            # Currently no validation is being performed.
+          elsif(ast.object[:rhs].hasAttr?(:static))
+            tmp = ast.object[:lhs]
+            if(tmp.object[:type] == :number || tmp.object[:type] == :var )
+              tmp.setAttr(:static, ast.object[:rhs].getAttr(:static))
+              ast.setAttr(:static, ast.object[:rhs].getAttr(:static))
+            end
+          end
+        end
+      end
+      false
+    end
+  end
+end
diff --git a/target/arc/semfunc_generator/classes/QEmuCompiler.rb b/target/arc/semfunc_generator/classes/QEmuCompiler.rb
new file mode 100644
index 0000000000..9860d878bc
--- /dev/null
+++ b/target/arc/semfunc_generator/classes/QEmuCompiler.rb
@@ -0,0 +1,15 @@
+class QEmuCompiler
+  include Compiler
+
+  def initialize()
+    @passes = [
+      IdentifyQEmuStaticInferedParts,
+      SpaghettiCodePass,
+      DecomposeExpressions,
+      UnfoldCode,
+      CreateInternalVars,
+    ]
+    @translator = QEmuTranslator
+  end
+
+end
diff --git a/target/arc/semfunc_generator/classes/QEmuTranslator.rb b/target/arc/semfunc_generator/classes/QEmuTranslator.rb
new file mode 100644
index 0000000000..1b739d2614
--- /dev/null
+++ b/target/arc/semfunc_generator/classes/QEmuTranslator.rb
@@ -0,0 +1,269 @@
+class QEmuTranslator
+
+  extend TranslatorFinal
+  include ConstantTables
+
+  def self.translation_rules
+    ret = {
+      SemanticFunctionAST.function("defLabel", SemanticFunctionAST.var("name")) =>
+        "TCGLabel *$name = gen_new_label()",
+      SemanticFunctionAST.function("setLabel", SemanticFunctionAST.var("name")) =>
+        "gen_set_label($name)",
+      SemanticFunctionAST.function("createTmpVar", SemanticFunctionAST.var("name")) =>
+        "TCGv $name = tcg_temp_new()",
+      SemanticFunctionAST.function("defVariable", SemanticFunctionAST.var("name")) =>
+        "TCGv $name = tcg_temp_local_new()",
+      SemanticFunctionAST.function("freeVariable", SemanticFunctionAST.var("name")) =>
+        "tcg_temp_free($name)",
+      SemanticFunctionAST.function("freeReference", SemanticFunctionAST.var("name")) =>
+        "if($name != NULL) tcg_temp_free($name)",
+      SemanticFunctionAST.function("defReference", SemanticFunctionAST.var("name")) =>
+        "TCGv $name = NULL /* REFERENCE */",
+
+      SemanticFunctionAST.assign(
+        SemanticFunctionAST.var("a"),
+        SemanticFunctionAST.function("HELPER",
+                                     SemanticFunctionAST.var("helper"),
+                                     SemanticFunctionAST.var("..."))) =>
+        "ARC_HELPER($helper, $a, $varargs_)",
+      SemanticFunctionAST.function("HELPER",
+                                   SemanticFunctionAST.var("helper"),
+                                   SemanticFunctionAST.var("...")) =>
+      "ARC_HELPER($helper, NULL, $varargs_)",
+
+      SemanticFunctionAST.function("goto", SemanticFunctionAST.var("label")) => "tcg_gen_br($label)",
+
+      # SemanticFunctionAST.function("_func", SemanticFunctionAST.var("a")) => "$func($a)",
+      # SemanticFunctionAST.function("_func", SemanticFunctionAST.number("1")) => "$func($1)",
+
+      SemanticFunctionAST.parse_stmt("a = b") => "tcg_gen_mov_tl($a, $b)",
+      SemanticFunctionAST.parse_stmt("a = 1") => "tcg_gen_movi_tl($a, $1)",
+    }
+
+    match = SemanticFunctionAST.function("defStaticVariable", SemanticFunctionAST.var("type"), SemanticFunctionAST.var("name"))
+    ret[match] = Proc.new { |stmt_ast, repl, mappings, to_do|
+      ret = "#{mappings["type"]} #{mappings["name"]}"
+      if mappings["type"] == "TCGvPtr"
+        ret = "TCGv #{mappings["name"]} = NULL"
+      end
+      if mappings["type"] == "TCGv"
+        ret = "TCGv #{mappings["name"]} = tcg_temp_local_new()"
+      end
+      ret
+    }
+
+    match = Proc.new { |ast|
+      ret = { result: false, mappings: {} }
+      ret = { result: true, mappings: {} } if(ast.object[:type] == :if)
+      ret
+    }
+    ret[match] = Proc.new { |stmt_ast, repl, mappings, to_do|
+      tmp =  "  if (#{stmt_ast.object[:cond].pp}) {\n"
+      tmp += @translator.generate(stmt_ast.object[:then], false)
+      tmp += "    }\n"
+      if(stmt_ast.object[:else].valid?)
+        tmp += "  else {\n"
+        tmp += @translator.generate(stmt_ast.object[:else], false)
+        tmp += "    }\n"
+      end
+      return tmp
+    }
+
+    # Any other static statement.
+    match = Proc.new { |ast|
+      ret = { result: false, mappings: {} }
+      ret = { result: true, mappings: {} } if(ast.hasAttr?(:static))
+      ret
+    }
+    ret[match] = Proc.new { |stmt_ast, repl, mappings, to_do|
+      tmp =  stmt_ast.pp
+      tmp
+    }
+
+
+    {
+      "+": "add",
+      "-": "sub",
+      "*": "mul",
+      "/": "div",
+      "&": "and",
+      "|": "or",
+      "^": "xor",
+      "<<": "shl",
+      ">>": "shr",
+
+    }.each_pair do |k, v|
+      ret[SemanticFunctionAST.parse_stmt("a = b #{k} c")] = "tcg_gen_#{v}_tl($a, $b, $c)"
+      ret[SemanticFunctionAST.parse_stmt("a = b #{k} 1")] = "tcg_gen_#{v}i_tl($a, $b, $1)"
+      ret[SemanticFunctionAST.parse_stmt("a = 2 #{k} c")] = "tcg_gen_#{v}fi_tl($a, $2, $c)"
+    end
+
+
+    options1 = {
+      SemanticFunctionAST.var("b") => "$b",
+      SemanticFunctionAST.number("1") => "$1",
+      SemanticFunctionAST.function("_func1", SemanticFunctionAST.var("...")) => "$func1($varargs_func1)"
+    }
+    options2 = {
+      SemanticFunctionAST.var("c") => "$c",
+      SemanticFunctionAST.number("2") => "$2",
+      SemanticFunctionAST.function("_func2", SemanticFunctionAST.var("...")) => "$func2($varargs_func2)"
+    }
+
+
+    # Combinations of options
+    options1.each_pair do |m1, r1|
+      options2.each_pair do |m2, r2|
+        next if m1.object[:type] == :number && m2.object[:type] == :number
+
+        reverted_immediate = false
+        #Revert immediate value and condition
+        if(m1.object[:type] == :number)
+          tmp = [m1, r1]
+          m1 = m2; r2 = r1
+          reverted_immediate = true
+          m2 = tmp[0]; r2 = tmp[1]
+        end
+        type = "i" if(m2.object[:type] == :number)
+
+        {
+          "&&": "and",
+          "||": "or",
+          "^^": "xor",
+        }.each_pair do |k, v|
+          op = v
+
+          # A = B && C (for example)
+          rhs = SemanticFunctionAST.new(type: :bincond, name: k.to_s, lhs: m1.clone, rhs: m2.clone)
+          match = SemanticFunctionAST.new(type: :assign, lhs: SemanticFunctionAST.var("a"), rhs: rhs)
+          ret[match] = "tcg_gen_#{op}_tl($a, #{r1}, #{r2})"
+
+        end
+
+        {
+          "==": "TCG_COND_EQ",
+          "!=": "TCG_COND_NE",
+          "<": "TCG_COND_LT",
+          ">": "TCG_COND_GT",
+          "<=": "TCG_COND_LE",
+          ">=": "TCG_COND_GE",
+        }.each_pair do |k, v|
+
+          op = v
+          if(reverted_immediate == true)
+            case (k)
+            when "<"
+              op = "TCG_COND_GE"
+            when ">"
+              op = "TCG_COND_LE"
+            when "<="
+              op = "TCG_COND_GT"
+            when ">="
+              op = "TCG_COND_LT"
+            end
+          end
+
+          # A = B == C (for example)
+          rhs = SemanticFunctionAST.new(type: :bincond, name: k.to_s, lhs: m1.clone, rhs: m2.clone)
+          match = SemanticFunctionAST.new(type: :assign, lhs: SemanticFunctionAST.var("a"), rhs: rhs)
+          ret[match] = "tcg_gen_setcond#{type}_tl(#{op}, $a, #{r1}, #{r2})"
+
+          # IF(cond, label1, label2) # TODO: Label2 is expected to be equal to label1
+          cond = SemanticFunctionAST.new(type: :bincond, name: k.to_s, lhs: m1.clone, rhs: m2.clone)
+          ifcond_match = SemanticFunctionAST.function("IF", cond,
+            SemanticFunctionAST.var("label1"),
+            SemanticFunctionAST.var("label2")
+          )
+          ret[ifcond_match] = "tcg_gen_brcond#{type}_tl(#{op}, #{r1}, #{r2}, $label1)"
+          # Proc.new { |stmt_ast, repl, mappings, to_do|
+            # mappings.each_pair do |k, v|
+            #   mappings[k] = "arc_#{v}" if (v =~ /^(true|false)$/)
+            # end
+          # }
+        end
+      end
+    end
+
+    {
+      "!": nil,
+    }.each_pair do |k, v|
+      [:unicond, :uniop].each do |type|
+        rhs = SemanticFunctionAST.new(type: type, name: k.to_s, rhs: SemanticFunctionAST.var("b"))
+        match = SemanticFunctionAST.new(type: :assign, lhs: SemanticFunctionAST.var("a"), rhs: rhs)
+        ret[match] = "tcg_gen_xori_tl($a, $b, 1);\ntcg_gen_andi_tl($a, $a, 1)"
+
+        rhs1 = SemanticFunctionAST.new(type: type, name: k.to_s, rhs: SemanticFunctionAST.function("_func", SemanticFunctionAST.var("...")))
+        match1 = SemanticFunctionAST.new(type: :assign, lhs: SemanticFunctionAST.var("a"), rhs: rhs1)
+        ret[match1] = "tcg_gen_xori_tl($a, $func($varargs_func), 1);\ntcg_gen_andi_tl($a, $a, 1)"
+      end
+    end
+
+    {
+      "~": "not",
+    }.each_pair do |k, v|
+      [:unicond, :uniop].each do |type|
+        rhs = SemanticFunctionAST.new(type: type, name: k.to_s, rhs: SemanticFunctionAST.var("b"))
+        match = SemanticFunctionAST.new(type: :assign, lhs: SemanticFunctionAST.var("a"), rhs: rhs)
+        ret[match] = "tcg_gen_#{v}_tl($a, $b)"
+
+        rhs1 = SemanticFunctionAST.new(type: type, name: k.to_s, rhs: SemanticFunctionAST.function("_func", SemanticFunctionAST.var("...")))
+        match1 = SemanticFunctionAST.new(type: :assign, lhs: SemanticFunctionAST.var("a"), rhs: rhs1)
+        ret[match1] = "tcg_gen_#{v}_tl($a, $func($varargs_func))"
+      end
+    end
+
+    DIRECT_TCG_FUNC_TRANSLATIONS.each_pair do |f1, f2|
+      #ret[SemanticFunctionAST.assign(SemanticFunctionAST.var("a"), SemanticFunctionAST.function(f, SemanticFunctionAST.var("...")))] = "#{f}($a, $varargs_)"
+      match = SemanticFunctionAST.assign(SemanticFunctionAST.var("a"), SemanticFunctionAST.function(f1, SemanticFunctionAST.var("...")))
+      ret[match] = Proc.new { |stmt_ast, repl, mappings, to_do|
+	ret = ""
+	if(mappings["varargs_"].class == Array)
+	  mappings["varargs_"] = mappings["varargs_"].map { |a| a.debug() }.join(", ")
+	end
+	if(mappings["varargs_"] =~ /^$/)
+	  ret = "#{f2}($a)"
+	else
+	  ret = "#{f2}($a, $varargs_)"
+	end
+	ret
+      }
+    end
+
+    TEMP_CREATING_FUNCTIONS.each do |f|
+      #ret[SemanticFunctionAST.assign(SemanticFunctionAST.var("a"), SemanticFunctionAST.function(f, SemanticFunctionAST.var("...")))] = "#{f}($a, $varargs_)"
+      match = SemanticFunctionAST.assign(SemanticFunctionAST.var("a"), SemanticFunctionAST.function(f, SemanticFunctionAST.var("...")))
+      ret[match] = Proc.new { |stmt_ast, repl, mappings, to_do|
+	ret = ""
+	if(mappings["varargs_"].class == Array)
+	  mappings["varargs_"] = mappings["varargs_"].map { |a| a.debug() }.join(", ")
+	end
+	if(mappings["varargs_"] =~ /^$/)
+	  ret = "#{f}($a)"
+	else
+	  ret = "#{f}($a, $varargs_)"
+	end
+	ret
+      }
+    end
+
+    ret[SemanticFunctionAST.assign(SemanticFunctionAST.var("a"), SemanticFunctionAST.function("_func", SemanticFunctionAST.var("...")))] =
+      "tcg_gen_mov_tl($a, $func($varargs_func))"
+
+    #  "$a = $func($varargs_func)"
+    #ret[SemanticFunctionAST.assign(SemanticFunctionAST.var("a"), SemanticFunctionAST.function("_func", SemanticFunctionAST.var("...")))] = Proc.new { |stmt_ast, repl, mappings, to_do|
+    #  lhs = stmt_ast.object[:lhs]
+    #  if(lhs.hasAttr?(:reference))
+    #    tmp =  stmt_ast.pp
+    #  else
+    #    tmp = "tcg_gen_mov_tl()"
+    #  end
+    #  tmp = "tcg_gen_mov_tl()"
+    #  tmp
+    #}
+    ret[SemanticFunctionAST.function("_func", SemanticFunctionAST.var("..."))] = "$func($varargs_func)"
+
+
+
+    return ret
+  end
+end
diff --git a/target/arc/semfunc_generator/classes/SemanticFunctionAST.rb b/target/arc/semfunc_generator/classes/SemanticFunctionAST.rb
new file mode 100644
index 0000000000..b617bb7093
--- /dev/null
+++ b/target/arc/semfunc_generator/classes/SemanticFunctionAST.rb
@@ -0,0 +1,466 @@
+class SemanticFunctionAST
+
+  include Enumerable
+  extend SemanticFunctionASTFactory
+  include SemanticFunctionASTBlockOperators
+
+  def each(&block)
+    yield self
+    @object.each_pair do |k, e|
+      if(e.class == SemanticFunctionAST)
+        e.each(&block)
+      end
+    end
+  end
+
+  def find_parent_node_with_type(type, parents = {})
+    if(self.object[:type] == type)
+      return self
+    else
+      if(parents[self] != nil)
+        parents[self].find_parent_node_with_type(type, parents)
+      else
+        return nil
+      end
+    end
+  end
+
+
+  def initialize(params)
+    @object = params
+  end
+
+  def clone
+    new_elem = SemanticFunctionAST.new({})
+    self.object.each_pair do |k, v|
+      if(v.class == SemanticFunctionAST)
+        new_elem.object[k] = v.clone
+      elsif v.class == Array
+        new_elem.object[k] = Array.new
+        v.each_with_index do |e, i|
+          new_elem.object[k][i] = e.clone
+        end
+      else
+        begin
+          new_elem.object[k] = v.clone
+        rescue
+          new_elem.object[k] = v
+        end
+      end
+    end
+    return new_elem
+  end
+
+  def self.error(string)
+    SemanticFunctionAST.new({ type: 'error', message: string })
+  end
+
+  def self.nothing
+    SemanticFunctionAST.new({ type: :nothing })
+  end
+
+  def self.var(name)
+    SemanticFunctionAST.new({ type: :var, name: name })
+  end
+
+  def self.number(number)
+    SemanticFunctionAST.new({ type: :number, number: number })
+  end
+
+  def self.assign(lhs, rhs)
+    return SemanticFunctionAST.new({ type: :assign, lhs: lhs, rhs: rhs })
+  end
+
+  def self.function(name, *args)
+    return SemanticFunctionAST.new({ type: :func, name: name, args: args || [] })
+  end
+
+  def self.bincond(name, lhs, rhs)
+    return SemanticFunctionAST.new({ type: :bincond, name: name, lhs: lhs, rhs: rhs })
+  end
+
+  def self.unicond(name, rhs)
+    return SemanticFunctionAST.new({ type: :unicond, name: name, rhs: rhs })
+  end
+
+  def self.parse(string)
+    #puts "Parsing: #{string}"
+    SemanticFunctionParser.new.parse(string)
+  end
+  def self.parse_stmt(str)
+    ast = self.parse(str)
+    return ast.object[:list].object[:head]
+  end
+
+  def getAttr(name)
+    return nil if(object[:attrs] == nil || object[:attrs][name] == nil)
+    return object[:attrs][name]
+  end
+  def hasAttr?(name)
+    getAttr(name) != nil
+  end
+  def setAttr(name, value)
+    object[:attrs] = object[:attrs] || {}
+    object[:attrs][name] = value
+  end
+
+  def valid?
+    @object[:type] != :nothing
+  end
+  def shouldSeparate?
+    # return true
+    return (@object[:type] != :block)
+  end
+
+  def object
+    return @object
+  end
+
+  def traverse(data, &block)
+    cont = yield @object, data
+    if(cont)
+      @object.each_pair do |k,v|
+        v.traverse(data, &block) if v.class == SemanticFunctionAST
+        v.each { |v1| v1.traverse(data, &block) } if v.class == Array
+      end
+    end
+  end
+
+  def graphviz(filename = "/tmp/tmp.png", g = nil, parent = nil)
+    first_call = false
+    if(g == nil)
+      first_call = true
+      g = GraphViz.new( :G, :type => :digraph )
+    end
+
+    label = []
+
+    node = g.add_nodes("n#{g.node_count}")
+    @object.each_pair do |k,v|
+      if v.class == SemanticFunctionAST
+        v.graphviz(filename, g, node)
+      elsif v.class == Array
+        v.each do |v1|
+          v1.graphviz(filename, g, node)
+        end
+      else
+        label.push("#{k}: #{v}")
+      end
+    end
+    node[:label] = label.join("\n")
+    g.add_edges(parent, node) if(parent != nil)
+
+    if(first_call)
+      g.output(:png => filename)
+    end
+  end
+
+  def traverseASTWithMethodName(data, method_name)
+    cont = self.send(method_name, data)
+    if(cont)
+      @object.each_pair do |k,v|
+        v.traverseASTWithMethodName(data, method_name) if v.class == SemanticFunctionAST
+      end
+    end
+  end
+
+  def SemanticFunctionAST.IF(cond, ifthen, ifelse)
+    ifthen = ifthen || SemanticFunctionAST.nothing
+    ifelse = ifelse || SemanticFunctionAST.nothing
+    return SemanticFunctionAST.new(type: :function, name: "IF", args: [cond, ifthen, ifelse])
+  end
+
+  def constructDefinitions(data = {})
+    #puts " -- #{ object[:type] } ------------------------ "
+    data.each_pair do |k, v|
+      #puts k
+      #puts (v == nil) ? "NIL" : v.debug
+    end
+
+    case object[:type]
+    when :assign
+      # #puts " =========> #{self.debug}"
+      new_data = object[:rhs].constructDefinitions(data)
+      data[object[:lhs].object[:name]] = new_data["_"]
+      #puts "================== #{object[:lhs].object[:name]} => #{new_data["_"].inspect}"
+      return data
+    when :var
+      if data[object[:name]]
+        #puts " VAR NAME = #{object[:name]} = #{data[object[:name]].debug}"
+        data["_"] = data[object[:name]].clone
+      else
+        data["_"] = self.clone
+      end
+      return data
+    when :func
+      new_func = self.object.clone
+
+      new_func[:args].map! do |arg|
+        if(arg.valid?)
+          new_data = arg.constructDefinitions(data.clone)
+          arg = new_data["_"]
+        end
+        arg
+      end
+      data[object[:name]] = SemanticFunctionAST.new(new_func)
+      data["_"] = data[object[:name]]
+
+
+      return data
+    when :if
+      # One function IF(COND, THEN, ELSE)
+      cond_data = object[:cond].constructDefinitions(data.clone)
+      then_data = object[:then].constructDefinitions(data.clone)
+      else_data = object[:else].constructDefinitions(data.clone)
+
+      elems = (then_data.keys + else_data.keys).uniq
+
+      elems.each do |k|
+        td = then_data[k] || SemanticFunctionAST.nothing
+        ed = else_data[k] || SemanticFunctionAST.nothing
+
+        if(data[k] != then_data[k] || data[k] != else_data[k] || data[k])
+          #puts "SAME #{k}"
+          #puts "SAME1 #{then_data[k].debug}" if then_data[k]
+          #puts "SAME2 #{else_data[k].debug}" if else_data[k]
+          data[k] = SemanticFunctionAST.IF(cond_data["_"], td, ed)
+        else
+          #puts "DIFFERENT #{k}"
+          #puts "DIFFERENT1 #{then_data[k].debug}" if then_data[k]
+          #puts "DIFFERENT2 #{else_data[k].debug}" if else_data[k]
+        end
+      end
+
+      cond_data.each_pair do |k, v|
+        data[k] = v if (data[k] != v)
+      end
+
+      # puts " == #{SemanticFunctionAST.new(object).debug(false) } =="
+      # data.each_pair do |k, v|
+      #   puts "      #{k} : #{v.debug(false)}"
+      # end
+
+      data["_"] = SemanticFunctionAST.nothing
+      return {}
+
+    # when :while
+    #   cond_data = object[:cond].constructDefinitions(data.clone)
+    #   loop_data = object[:loop].constructDefinitions(data.clone)
+    #
+    #   loop_dat.each { |k| data[k] = SemanticFunctionAST.new(type: :function, name: "WHILE", args: [cond_data["_"], loop_data[k]]) }
+    #   data["_"] = SemanticFunctionAST.nothing
+    else
+      # puts self.inspect
+      # puts self.object[:type]
+      elems = {}  #Pre-fill semantic function table
+
+      object.clone.each_pair do |k, v|
+        if (v.class == SemanticFunctionAST)
+          data.merge!(v.constructDefinitions(data))
+          elems[k] = data["_"] || SemanticFunctionAST.nothing
+        elsif (v.class == Array)
+          v = v.map do |v1|
+            v1.constructDefinitions(data)
+            data["_"] || SemanticFunctionAST.nothing
+          end
+          elems[k] = v
+        else
+          elems[k] = v
+        end
+        # v.traverseASTWithMethodName(data, :constructDefinitions) if(v.class == SemanticFunctionAST)
+      end
+      data["_"] = SemanticFunctionAST.new(elems)
+    end
+
+    return data
+  end
+
+  def debug(pn = false)
+    begin
+      case @object[:type]
+        when /error/
+	      return "--- ERROR: #{@object[:message]} ---"
+        when /block/
+	      return "{ #{@object[:list].debug(pn)} }"
+        when /stmt_list/
+	      return "#{@object[:head].debug(pn)}; #{@object[:tail].debug(pn)}"
+        when /if/
+	      ret = "if(#{@object[:cond].debug(pn)}) #{@object[:then].debug(pn)}"
+	      ret += " else #{@object[:else].debug(pn)}" if @object[:else].valid?
+	      return ret
+        when /while/
+	      return "while(#{@object[:cond].debug(pn)}) #{@object[:loop].debug(pn)}"
+        when /bincond/
+	      return "#{@object[:lhs].debug(pn)} #{@object[:name]} #{@object[:rhs].debug(pn)}"
+        when /unicond/
+	      return "#{@object[:name]} #{@object[:rhs].debug(pn)}"
+        when /cond/
+	      return @object[:value].debug(pn)
+        when /func/
+	      return "#{@object[:name]} (#{@object[:args].map{|a| a.debug(pn)}.join(", ")})"
+        when /expr_block/
+	      return "(#{@object[:value].debug(pn)})"
+        when /assign/
+	      return "#{@object[:lhs].debug(pn)} = #{@object[:rhs].debug(pn)}"
+        when /binop/
+          return "#{@object[:lhs].debug(pn)}#{@object[:name]}#{@object[:rhs].debug(pn)}"
+        when /uniop/
+          return "#{@object[:name]}#{@object[:rhs].debug(pn)}"
+        when /var/
+          return "#{@object[:name]}"
+        when /number/
+          return "#{@object[:number]}"
+        when /nothing/
+          return "NOTHING" if(pn == true)
+        else
+          puts @object.inspect
+          raise "Object type is invalid"
+      end
+    rescue Exception => e
+      return "FAILED TO _DEBUG\n#{self.inspect}\nException at: #{e.backtrace}"
+    end
+  end
+
+  def debug_encoded()
+    ret = debug(false)
+    begin
+    ret = ret.gsub("+","%2B")
+    ret = ret.gsub(";","%3B")
+    ret = URI.encode(ret)
+    rescue
+      ret = "ERROR"
+    end
+    return ret
+  end
+
+  def pp(ind = 0)
+    ss = " " * ind
+
+    begin
+    case @object[:type]
+      when /error/
+        return "--- ERROR: #{@object[:message]} ---"
+      when /block/
+	ret = "#{ss}{\n"
+	ret+= "#{@object[:list].pp(ind + 2)}"
+	ret+= "#{ss}}"
+	return ret
+      when /stmt_list/
+        ret = ""
+        if(object[:head].is_a?(SemanticFunctionAST))
+		ret += "#{ss}#{@object[:head].pp(ind)}" if @object[:head].valid?
+          ret += ";" if @object[:head].shouldSeparate?
+        else
+          ret += "// INVALID (#{object[:head].inspect})"
+        end
+        ret += "     (static)" if @object[:head].hasAttr?(:static)
+        # ret += "     (#{@object[:head].object[:attrs].inspect})"
+        ret += "\n"
+      # ret += "#{ss}" if @object[:tail][:type] != "stmt_list"
+        if(object[:tail].is_a?(SemanticFunctionAST))
+	  ret += "#{@object[:tail].pp(ind)}" if @object[:tail].valid?
+        else
+          ret += "// INVALID (#{object[:tail].inspect})"
+        end
+        # puts " --- \n#{ret}"
+	return ret
+      when /if/
+        ret = "if(#{@object[:cond].pp(ind)})\n"
+        ret += "#{@object[:then].pp(ind+2)}"
+        if @object[:else].valid?
+          ret += "\n"
+          ret += "#{ss}else\n"
+          ret += "#{@object[:else].pp(ind+2)}"
+        end
+        return ret
+      when /while/
+        return "#{ss}while(#{@object[:cond].pp(ind)})\n#{@object[:loop].pp(ind )}"
+      when /bincond/
+        ret = ""
+        ret += "(#{@object[:lhs].pp(ind)} #{@object[:name]} #{@object[:rhs].pp(ind)})"
+        return ret
+      when /unicond/
+        return "#{@object[:name]}#{@object[:rhs].pp(ind)}"
+      when /cond/
+        return @object[:value].pp(ind)
+      when /func/
+        ret = ""
+        ret += "#{@object[:name]} (#{@object[:args].map{|a| a.pp(ind)}.join(", ")})"
+      when /expr_block/
+        return "(#{@object[:value].pp(ind)})"
+      when /assign/
+        return "#{@object[:lhs].pp(ind)} = #{@object[:rhs].pp(ind)}"
+      when /binop/
+        return "(#{@object[:lhs].pp(ind)} #{@object[:name]} #{@object[:rhs].pp(ind)})"
+      when /uniop/
+        return "#{@object[:name]}#{@object[:rhs].pp(ind)}"
+      when /var/
+        return "#{@object[:name]}"
+      when /number/
+        return "#{@object[:number]}"
+      when /nothing/
+	return ""
+      else
+        raise "Object type is invalid"
+    end
+    rescue
+      raise "Failed pretty printing #{stmt.inspect}"
+    end
+  end
+
+  def ppf(ind = 0)
+    ss = " " * ind
+
+    case @object[:type]
+      when /error/
+        return "--- ERROR: #{@object[:message]} ---"
+      when /bincond/
+        return "#{@object[:lhs].ppf(ind)} #{@object[:name]} #{@object[:rhs].ppf(ind)}"
+      when /unicond/
+        return "#{@object[:name]} #{@object[:rhs].ppf(ind)}"
+      when /cond/
+        return @object[:value].ppf(ind)
+      when /func/
+        return "#{@object[:name]} (\n#{ss}  #{@object[:args].map{ |a| a.ppf(ind+2) }.join(",\n#{ss}  ")})"
+      when /expr_block/
+        return "(#{@object[:value].ppf(ind)})"
+      when /assign/
+        return "#{@object[:lhs].ppf(ind)} = #{@object[:rhs].ppf(ind)}"
+      when /binop/
+        return "#{@object[:lhs].ppf(ind)}#{@object[:name]}#{@object[:rhs].ppf(ind)}"
+      when /uniop/
+        return "#{@object[:name]}#{@object[:rhs].ppf(ind)}"
+      when /var/
+        return "#{@object[:name]}"
+      when /number/
+        return "#{@object[:number]}"
+      when /nothing/
+        return "NOTHING"
+	return ""
+      else
+        raise "Object type is invalid"
+    end
+  end
+
+
+  def to_c(r={})
+    case @object[:type]
+      when /binop/
+        return "( #{@object[:lhs].to_c(r)} #{@object[:name]} #{@object[:rhs].to_c(r)} )"
+      when /uniop/
+        return "( #{@object[:name]}#{@object[:rhs].to_c(r)} )"
+      when /func/
+        return "( #{@object[:name]} ( #{@object[:param].map {|p| p.to_c(r) }.join(",") } ) )"
+      when /var/
+        var_name = @object[:var].to_sym
+        #puts "VAR_NAME= #{var_name}"
+        return r[var_name] if r[var_name] != nil
+        return @object[:var]
+      when /number/
+        return "#{@object[:number]}"
+      else
+        raise "Object type is invalid #{self}"
+    end
+
+  end
+end
diff --git a/target/arc/semfunc_generator/classes/SpaghettiCodePass.rb b/target/arc/semfunc_generator/classes/SpaghettiCodePass.rb
new file mode 100644
index 0000000000..0c9ff3e013
--- /dev/null
+++ b/target/arc/semfunc_generator/classes/SpaghettiCodePass.rb
@@ -0,0 +1,55 @@
+class SpaghettiCodePass
+  private
+
+  # extend SemanticFunctionASTFactory
+  include Pass
+
+  def self.spaghetify(ast)
+    ret = []
+    object = ast.object
+
+    case(object[:type])
+    when :block
+      ret += spaghetify(object[:list])
+    when :stmt_list
+      ret += spaghetify(object[:head])
+      ret += spaghetify(object[:tail])
+    when :if
+
+      cond = ast.object[:cond]
+
+      if(cond.hasAttr?(:static))
+        ast.object[:then] = SemanticFunctionAST.block(SemanticFunctionAST.createStmtListFromArray(spaghetify(ast.object[:then])))
+        ast.object[:else] = SemanticFunctionAST.block(SemanticFunctionAST.createStmtListFromArray(spaghetify(ast.object[:else])))
+        ret.push(ast)
+      else
+        done_label = SemanticFunctionAST.createTmpVar("done")
+        else_label = SemanticFunctionAST.createTmpVar("else")
+        else_label = done_label unless object[:else].valid?
+
+        ret.push(SemanticFunctionAST.defLabel(else_label)) if object[:else].valid?
+        ret.push(SemanticFunctionAST.defLabel(done_label))
+
+        ret.push(SemanticFunctionAST.function("IF", SemanticFunctionAST.notCond(object[:cond].clone), else_label, done_label))
+
+        ret += spaghetify(object[:then])
+        if object[:else].valid?
+          ret.push(SemanticFunctionAST.function("goto", done_label))
+          ret.push(SemanticFunctionAST.setLabel(else_label))
+          ret += spaghetify(object[:else])
+        end
+        ret.push(SemanticFunctionAST.setLabel(done_label))
+      end
+    else
+      ret.push(ast) if ast.valid?
+    end
+
+    return ret
+  end
+
+  public
+  def self.task(ast)
+    # reset_counters
+    return SemanticFunctionAST.createStmtListFromArray(spaghetify(ast))
+  end
+end
diff --git a/target/arc/semfunc_generator/classes/SpaghettiCodePass1.rb b/target/arc/semfunc_generator/classes/SpaghettiCodePass1.rb
new file mode 100644
index 0000000000..c38b279c48
--- /dev/null
+++ b/target/arc/semfunc_generator/classes/SpaghettiCodePass1.rb
@@ -0,0 +1,66 @@
+class SpaghettiCodePass1
+  private
+
+  # extend SemanticFunctionASTFactory
+  include Pass
+  extend Translator
+
+  def self.translation_rules
+    ret = {}
+
+    match = SemanticFunctionAST.new(type: :if, name: "_")
+    ret[match] =
+      Proc.new { |stmt, repl, mappings, to_do|
+
+        binop_lhs = stmt.object[:rhs].object[:lhs]
+        binop_rhs = stmt.object[:rhs].object[:rhs]
+        changed_lhs = false
+        changed_rhs = false
+
+        if(binop_lhs.object[:type] != :var && binop_lhs.object[:type] != :number)
+          # puts "IN 1 #{binop_lhs.inspect}"
+          var = SemanticFunctionAST.createTmpVar("temp")
+          tmp = [
+            # SemanticFunctionAST.function("createTmpVar", var),
+          ]
+          to_do[:pre_pend] = tmp + to_do[:pre_pend]
+          assign = SemanticFunctionAST.new(type: :assign, lhs: var, rhs: binop_lhs)
+          self.replace(assign, to_do)
+          binop_lhs = var
+          changed_lhs = true
+        end
+
+        if(binop_rhs.object[:type] != :var && binop_rhs.object[:type] != :number)
+          # puts "IN 2 #{binop_rhs.inspect}"
+          var = SemanticFunctionAST.createTmpVar("temp")
+          tmp = [
+            # SemanticFunctionAST.function("createTmpVar", var),
+            assign = SemanticFunctionAST.new(type: :assign, lhs: var, rhs: binop_rhs)
+          ]
+          to_do[:pre_pend] = tmp + to_do[:pre_pend]
+          self.replace(assign, to_do)
+          binop_rhs = var
+          changed_rhs = true
+        end
+
+        if(changed_lhs == true || changed_rhs == true)
+          new_stmt = stmt.clone
+          new_stmt.object[:rhs].object[:lhs] = binop_lhs
+          new_stmt.object[:rhs].object[:rhs] = binop_rhs
+          to_do[:pre_pend].push(new_stmt)
+          # to_do[:remove] = true
+          stmt.object[:type] = :nothing
+        end
+      }
+
+    return ret
+  end
+
+  public
+  def self.task(ast)
+    self.generate(ast)
+    # puts "AST = #{ast.class}"
+    # puts ast.debug
+    return ast
+  end
+end
diff --git a/target/arc/semfunc_generator/classes/UnfoldCode.rb b/target/arc/semfunc_generator/classes/UnfoldCode.rb
new file mode 100644
index 0000000000..0146407a96
--- /dev/null
+++ b/target/arc/semfunc_generator/classes/UnfoldCode.rb
@@ -0,0 +1,305 @@
+class UnfoldCode
+  private
+
+  # extend SemanticFunctionASTFactory
+  include Pass
+  include ConstantTables
+  extend TranslatorAST
+
+  def self.translation_rules
+    ret = {}
+
+    match = Proc.new { |ast|
+      ret = { result: false, mappings: {} }
+      # ret = { result: true, mappings: {} } if(ast.hasAttr?(static))
+      ret = { result: true, mappings: {} } if(ast.object[:type] == :if)
+      ret
+    }
+    ret[match] = Proc.new { |stmt_ast, repl, mappings, to_do|
+      case(stmt_ast.object[:type])
+      when :if
+        self.generate(stmt_ast.object[:then])
+        self.generate(stmt_ast.object[:else])
+      end
+    }
+
+    # match = Proc.new { |ast|
+    #   ret = { result: false, mappings: {} }
+    #   ret = {result: true, mappings: {} } if (ast.object[:type] == :variable && ast.object[:name] =~ /^(true|false)$/ && !ast.hasAttr?(:static))
+    # }
+    # ret[match] = Proc.new { |ast|
+    #   return SemanticFunctionAST.variable("arc_#{ast.object[:name]}")
+    # }
+
+    match = SemanticFunctionAST.new(type: :assign,
+                                    lhs: SemanticFunctionAST.var("a"),
+                                    rhs: SemanticFunctionAST.new(type: :binop, name: "_"))
+
+    # match = Proc.new { |ast|
+    #   ret = { result: false, mappings: {} }
+    #   # ret = { result: true, mappings: {} } if(ast.hasAttr?(static))
+    #   if(ast.object[:type] == :assign &&
+    #      ast.object[:rhs].object[:type] != :func &&
+    #      ast.object[:rhs].object[:type] != :var &&
+    #      ast.object[:rhs].object[:type] != :number)
+    #       ret = { result: true, mappings: {} }
+    #   end
+    #   ret
+    # }
+
+
+    def self.binOpProcess(stmt, repl, mappings, to_do)
+      # puts "STMT = #{stmt.debug}"
+
+      binop_lhs = stmt.object[:rhs].object[:lhs]
+      binop_rhs = stmt.object[:rhs].object[:rhs]
+      changed_lhs = false
+      changed_rhs = false
+
+      if(binop_lhs.object[:type] != :var && binop_lhs.object[:type] != :number)
+        # puts "IN 1 #{binop_lhs.inspect}"
+        var = SemanticFunctionAST.createTmpVar("temp")
+        tmp = [
+          # SemanticFunctionAST.function("createTmpVar", var),
+          assign = SemanticFunctionAST.new(type: :assign, lhs: var, rhs: binop_lhs)
+        ]
+        to_do[:pre_pend] = tmp + to_do[:pre_pend]
+        self.replace(assign, to_do)
+        binop_lhs = var
+        changed_lhs = true
+      end
+
+      if(binop_rhs.object[:type] != :var && binop_rhs.object[:type] != :number)
+        # puts "IN 2 #{binop_rhs.inspect}"
+        var = SemanticFunctionAST.createTmpVar("temp")
+        tmp = [
+          # SemanticFunctionAST.function("createTmpVar", var),
+          assign = SemanticFunctionAST.new(type: :assign, lhs: var, rhs: binop_rhs)
+        ]
+        to_do[:pre_pend] = tmp + to_do[:pre_pend]
+        self.replace(assign, to_do)
+        binop_rhs = var
+        changed_rhs = true
+      end
+
+      if(changed_lhs == true || changed_rhs == true)
+        new_stmt = stmt.clone
+        new_stmt.object[:rhs].object[:lhs] = binop_lhs
+        new_stmt.object[:rhs].object[:rhs] = binop_rhs
+        to_do[:pre_pend].push(new_stmt)
+        # to_do[:remove] = true
+        stmt.object[:type] = :nothing
+      end
+    end
+                                    # puts "IAMHERE"
+    ret[match] =
+      Proc.new { |stmt, repl, mappings, to_do|
+        self.binOpProcess(stmt, repl, mappings, to_do)
+      }
+
+
+    # Do not convert special IF function
+    func_match =
+    Proc.new { |stmt, repl, mappings, to_do|
+      changed = false
+      new_stmt = nil
+      # puts "BLA => #{stmt.debug}"
+      args = stmt.object[:args]
+      new_args = []
+      args.each_with_index do |arg, i|
+        new_args[i] = arg
+
+        if(arg.object[:type] != :var) # && arg.object[:type] != :number)
+          var = SemanticFunctionAST.createTmpVar("temp")
+          # arg_var = self.replace(arg.clone, to_do)
+          # puts arg_var.inspect
+          tmp = [
+            # SemanticFunctionAST.function("createTmpVar", var),
+            assign = SemanticFunctionAST.new(type: :assign, lhs: var, rhs: arg)
+          ]
+          to_do[:pre_pend] = tmp + to_do[:pre_pend]
+          self.replace(assign, to_do)
+          arg = var
+          new_args[i] = var
+          changed = true
+        end
+      end
+
+      if(changed)
+        new_stmt = SemanticFunctionAST.function(stmt.object[:name], *new_args)
+        to_do[:pre_pend].push(new_stmt)
+        stmt.object[:type] = :nothing
+      end
+
+      new_stmt
+    }
+
+    assign_func_match =
+      Proc.new { |stmt, repl, mappings, to_do|
+        # puts "FUNC_MATCH"
+        lhs = stmt.object[:lhs]
+        rhs = stmt.object[:rhs]
+
+        if(lhs.object[:type] == :var &&
+            rhs.object[:type] == :func && TEMP_CREATING_FUNCTIONS.index(rhs.object[:name]))
+          # puts "INSIDE"
+            var = SemanticFunctionAST.createTmpVar("temp")
+            assign = SemanticFunctionAST.assign(var, rhs)
+            new_stmt = func_match.call(rhs, repl, mappings, to_do)
+            if(new_stmt != nil)
+              assign = SemanticFunctionAST.assign(var, to_do[:pre_pend].pop)
+            end
+            to_do[:pre_pend].push(assign)
+            assign = SemanticFunctionAST.assign(lhs, var)
+            to_do[:pre_pend].push(assign)
+
+            stmt.object[:type] = :nothing
+        else
+          new_stmt = func_match.call(stmt.object[:rhs], repl, mappings, to_do)
+          if(new_stmt != nil)
+            new_stmt = SemanticFunctionAST.assign(stmt.object[:lhs], to_do[:pre_pend].pop)
+            to_do[:pre_pend].push(new_stmt)
+            stmt.object[:type] = :nothing
+          end
+        end
+      }
+
+
+    ret[SemanticFunctionAST.function("IF", SemanticFunctionAST.var("..."))] = nil
+    ret[SemanticFunctionAST.function("_", SemanticFunctionAST.var("..."))] = func_match
+
+    match = Proc.new { |ast|
+      ret = { result: false, mappings: {} }
+      # ret = { result: true, mappings: {} } if(ast.hasAttr?(static))
+      if(ast.object[:type] == :assign && ast.object[:rhs].object[:type] == :func)
+        ret = { result: true, mappings: {} }
+      end
+      ret
+    }
+    ret[match] = assign_func_match
+
+
+    assign_cond_match =
+    Proc.new { |stmt, repl, mappings, to_do|
+      # puts " BINCOND = #{stmt.pp}"
+
+      cond = stmt.object[:rhs]
+      changed = false
+
+      if(cond.object[:type] == :bincond)
+        elems = { lhs: cond.object[:lhs], rhs: cond.object[:rhs] }
+      elsif(cond.object[:type] == :unicond)
+        elems = { rhs: cond.object[:rhs] }
+      end
+
+      elems.clone.each_pair do |k, v|
+        if(v.object[:type] == :func && TEMP_CREATING_FUNCTIONS.index(v.object[:name]))
+          var = SemanticFunctionAST.createTmpVar("temp")
+          assign = SemanticFunctionAST.assign(var, v)
+          new_stmt = func_match.call(v, repl, mappings, to_do)
+          if(new_stmt != nil)
+            assign = SemanticFunctionAST.assign(var, to_do[:pre_pend].pop)
+          end
+          to_do[:pre_pend].push(assign)
+          elems[k] = var
+          changed = true
+        end
+      end
+
+      if(changed == true)
+        if(cond.object[:type] == :bincond)
+          new_cond = SemanticFunctionAST.bincond(cond.object[:name], elems[:lhs], elems[:rhs])
+          new_stmt = SemanticFunctionAST.assign(stmt.object[:lhs], new_cond)
+        elsif(cond.object[:type] == :unicond)
+          new_cond = SemanticFunctionAST.unicond(cond.object[:name], elems[:rhs])
+          new_stmt = SemanticFunctionAST.assign(stmt.object[:lhs], new_cond)
+        end
+        to_do[:pre_pend].push(new_stmt)
+        stmt.object[:type] = :nothing
+      end
+    }
+    match = Proc.new { |ast|
+      ret = { result: false, mappings: {} }
+      # ret = { result: true, mappings: {} } if(ast.hasAttr?(static))
+      if(ast.object[:type] == :assign && ast.object[:rhs].object[:type] == :bincond)
+        ret = { result: true, mappings: {} }
+      end
+      if(ast.object[:type] == :assign && ast.object[:rhs].object[:type] == :unicond)
+        ret = { result: true, mappings: {} }
+      end
+      ret
+    }
+    ret[match] = assign_cond_match
+
+
+    if_cond_match =
+    Proc.new { |stmt, repl, mappings, to_do|
+      # puts " BINCOND = #{stmt.pp}"
+      cond = stmt.object[:cond]
+
+      changed = false
+      elems = { cond: bincond.object[:cond] }
+
+      elems.clone.each_pair do |k, v|
+        if(v.object[:type] == :func && TEMP_CREATING_FUNCTIONS.index(v.object[:name]))
+          var = SemanticFunctionAST.createTmpVar("temp")
+          assign = SemanticFunctionAST.assign(var, v)
+          new_stmt = func_match.call(v, repl, mappings, to_do)
+          if(new_stmt != nil)
+            assign = SemanticFunctionAST.assign(var, to_do[:pre_pend].pop)
+          end
+          to_do[:pre_pend].push(assign)
+          elems[k] = var
+          changed = true
+        end
+      end
+
+      if(changed == true)
+        new_bincond = SemanticFunctionAST.bincond(bincond.object[:name], elems[:lhs], elems[:rhs])
+        new_stmt = SemanticFunctionAST.assign(stmt.object[:lhs], new_bincond)
+        to_do[:pre_pend].push(new_stmt)
+        stmt.object[:type] = :nothing
+      end
+    }
+    match = Proc.new { |ast|
+      ret = { result: false, mappings: {} }
+      # ret = { result: true, mappings: {} } if(ast.hasAttr?(static))
+      if(ast.object[:type] == :if)
+        ret = { result: true, mappings: {} }
+      end
+      ret
+    }
+    ret[match] = if_cond_match
+
+
+    # match = SemanticFunctionAST.new(type: :assign,
+    #                                 lhs: SemanticFunctionAST.var("a"),
+    #                                 rhs: SemanticFunctionAST.function("_", SemanticFunctionAST.var("...")))
+    # ret[match] = Proc.new { |stmt, repl, mappings, to_do|
+    #   # puts "BLA -------------"
+    #   # puts stmt.debug
+    #   # puts " ------------- "
+    #
+    #   new_func = func_match.call(stmt.object[:rhs], repl, mappings, to_do)
+    #
+    #   if(new_func != nil)
+    #     new_stmt = SemanticFunctionAST.assign(stmt.object[:lhs], new_func)
+    #     to_do[:pre_pend].push(new_stmt)
+    #     stmt.object[:type] = :nothing
+    #   end
+    # }
+
+    return ret
+
+  end
+
+
+  public
+  def self.task(ast)
+    # SemanticFunctionAST.reset_counters()
+    self.generate(ast)
+    # puts "AST = #{ast.class}"
+    # puts ast.debug
+    return ast
+  end
+end
diff --git a/target/arc/semfunc_generator/init.rb b/target/arc/semfunc_generator/init.rb
new file mode 100644
index 0000000000..20a51a9fbf
--- /dev/null
+++ b/target/arc/semfunc_generator/init.rb
@@ -0,0 +1,15 @@
+require 'rubygems'
+#require 'graphviz'
+
+project_root = File.dirname(File.absolute_path(__FILE__))
+Dir.glob(project_root + "/parsers/*.rb").each do |file|
+  require file
+end
+
+Dir.glob(project_root + "/modules/*.rb").each do |file|
+  require file
+end
+
+Dir.glob(project_root + "/classes/*.rb").each do |file|
+  require file
+end
diff --git a/target/arc/semfunc_generator/modules/Compiler.rb b/target/arc/semfunc_generator/modules/Compiler.rb
new file mode 100644
index 0000000000..c63f55c1ff
--- /dev/null
+++ b/target/arc/semfunc_generator/modules/Compiler.rb
@@ -0,0 +1,42 @@
+module Compiler
+  def optimize(ast, log = [], debug = false)
+    log.push({ name: 'start', ast: ast })
+    SemanticFunctionAST.reset_counters()
+    @passes.each do |pass|
+      ast = ast.clone
+      ast = pass.task(ast)
+      log.push({ name: pass.name, ast: ast })
+      # puts " -- #{pass.name} --"
+      # puts ast.pp
+    end
+    if(debug == true)
+      log.each do |v|
+        puts v[:name] + ":"
+        puts "  => #{v[:ast].pp}"
+      end
+    end
+    return ast
+  end
+
+  def getAST(input)
+    if(input.class == String)
+      input = SemanticFunctionAST.parse(input)
+    elsif(input.class != SemanticFunctionAST)
+      abort()
+    end
+    return input
+  end
+
+  def generate(input, log = [], debug = false)
+    ast = getAST(input)
+    ast = self.optimize(ast, log, debug)
+    # puts ast.class
+    return @translator.generate(ast, debug)
+  end
+
+  def compile(code, log = [], debug = false)
+    ast = getAST(code)
+    ast = optimize(ast, log, debug)
+    return ast
+  end
+end
diff --git a/target/arc/semfunc_generator/modules/ConstantTables.rb b/target/arc/semfunc_generator/modules/ConstantTables.rb
new file mode 100644
index 0000000000..047665c4ab
--- /dev/null
+++ b/target/arc/semfunc_generator/modules/ConstantTables.rb
@@ -0,0 +1,57 @@
+module ConstantTables
+
+  TEMP_CREATING_FUNCTIONS = [
+    "CarryADD",
+    "CarrySUB",
+    "OverflowADD",
+    "OverflowSUB",
+    "getCCFlag",
+
+    "Carry",
+
+    "getCFlag",
+    "getMemory",
+    # "SignExtend",
+    # "getNFlag",
+    "getPC",
+    "nextInsnAddressAfterDelaySlot",
+    "nextInsnAddress",
+    "getPCL",
+    "unsignedLT",
+    "unsignedGE",
+    "logicalShiftRight",
+    "logicalShiftLeft",
+    "arithmeticShiftRight",
+    "rotateLeft",
+    "rotateRight",
+    "getBit",
+    "getRegIndex",
+    "readAuxReg",
+    "extractBits",
+    "getRegister",
+    "ARC_HELPER",
+    # "nextReg",
+    "CLZ",
+    "CTZ",
+
+    "MAC",
+    "MACU",
+
+    "divSigned",
+    "divUnsigned",
+    "divRemainingSigned",
+    "divRemainingUnsigned",
+    "getLF",
+    "setLF",
+    "hasInterrupts",
+    "NoFurtherLoadsPending"
+  ]
+
+
+  DIRECT_TCG_FUNC_TRANSLATIONS = {
+    "CLZ" => "tcg_gen_clz_tl",
+    "CTZ" => "tcg_gen_ctz_tl",
+    "CRLSB" => "tcg_gen_clrsb_tl",
+    "SignExtend16to32" => "tcg_gen_ext16s_tl"
+  }
+end
diff --git a/target/arc/semfunc_generator/modules/Pass.rb b/target/arc/semfunc_generator/modules/Pass.rb
new file mode 100644
index 0000000000..b4f0382d6a
--- /dev/null
+++ b/target/arc/semfunc_generator/modules/Pass.rb
@@ -0,0 +1,11 @@
+module Pass
+
+  def name
+    return self.class
+  end
+
+  def execute(ast)
+    return task(ast)
+  end
+
+end
diff --git a/target/arc/semfunc_generator/modules/SemanticFunctionASTBlockOperators.rb b/target/arc/semfunc_generator/modules/SemanticFunctionASTBlockOperators.rb
new file mode 100644
index 0000000000..774c43dcc8
--- /dev/null
+++ b/target/arc/semfunc_generator/modules/SemanticFunctionASTBlockOperators.rb
@@ -0,0 +1,145 @@
+module SemanticFunctionASTBlockOperators
+
+  def prepend_in_stmt_list(elem, parents = {})
+    parent = parents[self]
+    # puts self
+    # parent = parents[parent] if parent.object[:type] != :stmt_list && parent.object[:type] != :block
+
+    if(parent != nil)
+      new_stmt_list = SemanticFunctionAST.new(type: :stmt_list, head: elem, tail: self)
+      parents[new_stmt_list] = parent
+      parents[self] = new_stmt_list
+
+      parent.object.each_pair do |k, v|
+        parent.object[k] = new_stmt_list if(v == self)
+      end
+    end
+  end
+
+  def append_in_stmt_list(stmt_list, parents = {})
+    return stmt_list if self.object[:type] == :nothing
+    raise "self is not of type :stmt_list\n#{self.inspect}" if self.object[:type] != :stmt_list
+
+    if(self.object[:tail].object[:type] == :nothing)
+      self.object[:tail] = stmt_list
+    else
+      self.object[:tail].append_in_stmt_list(stmt_list, parents)
+    end
+  end
+
+  def remove_from_stmt_list(parents = {})
+    elem = self.find_parent_node_with_type(:stmt_list, parents)
+    # puts parents.inspect
+    parent = parents[elem]
+    puts "BLING => #{parent.debug}"
+    parents.each_pair do |k, v|
+      puts "#{k.debug} => #{v.debug}"
+    end
+    puts parent
+    parent.object.each_pair do |k, v|
+      if(v == elem)
+        parent.object[k] = elem.object[:tail]
+        parents[parent.object[k]] = parent
+      end
+    end
+  end
+
+  def create_stmts_for_expression(tmp_vars = {})
+    ret = []
+    self.object.each_pair do |k, v|
+      if(v.class == SemanticFunctionAST && v.valid?)
+        ret += v.create_stmts_for_expression(tmp_vars)
+      end
+    end
+
+    case(object[:type])
+    when :binop
+    when :bincond
+      var = SemanticFunctionAST.createTmpVar("temp")
+      rhs = SemanticFunctionAST.new(type: object[:type], name: object[:name], lhs: tmp_vars[object[:lhs]], rhs: tmp_vars[object[:rhs]])
+      ret += [
+        # SemanticFunctionAST.function("createTmpVar", var),
+        SemanticFunctionAST.new(type: :assign, lhs: var, rhs: rhs)
+      ]
+      tmp_vars[self] = var
+    when :uniop
+    when :unicond
+      var = SemanticFunctionAST.createTmpVar("temp")
+      rhs = SemanticFunctionAST.new(type: object[:type], name: object[:name], rhs: tmp_vars[object[:rhs]])
+      ret += [
+        # SemanticFunctionAST.function("createTmpVar", var),
+        SemanticFunctionAST.new(type: :assign, lhs: var, rhs: rhs)
+      ]
+      tmp_vars[self] = var
+    else
+      tmp_vars[self] = self
+    end
+    return ret
+  end
+
+
+  def traverse_LR_TB(to_do = {}, parents = {}, &block)
+    to_do[self] ||= { pre_pend: [], post_pend: [], remove: false }
+
+    do_childs = yield self, to_do[self]
+
+    if(do_childs == true)
+      @object.each_pair do |k, e|
+        if(e.class == SemanticFunctionAST)
+          if(self.object[:type] == :stmt_list || self.object[:type] == :block)
+            parents[e] = self
+          else
+            parents[e] = parents[self]
+          end
+          e.traverse_LR_TB(to_do, parents, &block)
+        end
+      end
+    end
+
+    # If it is back to the head of the recursion
+    if(parents[self] == nil)
+      to_do.each_pair do |elem, to_do|
+        to_do[:pre_pend].each do |elem1|
+          elem.prepend_in_stmt_list(elem1, parents)
+        end
+
+        if(to_do[:remove] == true)
+          elem.remove_from_stmt_list(parents)
+        end
+      end
+    end
+    return self
+  end
+
+  def traverse_LR_BT(to_do = {}, parents = {}, &block)
+    to_do[self] ||= { pre_pend: [], post_pend: [], remove: false }
+
+    @object.each_pair do |k, e|
+      if(e.class == SemanticFunctionAST)
+        if(self.object[:type] == :stmt_list || self.object[:type] == :block)
+          parents[e] = self
+        else
+          parents[e] = parents[self]
+        end
+        e.traverse_LR_BT(to_do, parents, &block)
+      end
+    end
+
+    yield self, to_do[self]
+
+    # If it is back to the head of the recursion
+    if(parents[self] == nil)
+      to_do.each_pair do |elem, to_do|
+        to_do[:pre_pend].each do |elem1|
+          elem.prepend_in_stmt_list(elem1, parents)
+        end
+
+        if(to_do[:remove] == true)
+          elem.remove_from_stmt_list(parents)
+        end
+      end
+    end
+    return self
+  end
+
+end
diff --git a/target/arc/semfunc_generator/modules/SemanticFunctionASTFactory.rb b/target/arc/semfunc_generator/modules/SemanticFunctionASTFactory.rb
new file mode 100644
index 0000000000..14df3bcd67
--- /dev/null
+++ b/target/arc/semfunc_generator/modules/SemanticFunctionASTFactory.rb
@@ -0,0 +1,55 @@
+module SemanticFunctionASTFactory
+
+  def createIf(cond, else_label, done_label)
+    return SemanticFunctionAST.function("IF", cond.clone,
+                SemanticFunctionAST.function("goto", else_label),
+                SemanticFunctionAST.function("goto", done_label))
+    return SemanticFunctionAST.new(type: :func, name: "IF", args: [
+      cond.clone,
+      SemanticFunctionAST.new(type: :func, name: "goto", args: [ else_label ]),
+      SemanticFunctionAST.new(type: :func, name: "goto", args: [ done_label ])
+    ])
+  end
+
+  def createVar(varname)
+    return SemanticFunctionAST.new(type: :var, name: varname)
+  end
+
+  def notCond(cond)
+    return SemanticFunctionAST.new(type: :unicond, name: "!", rhs: cond)
+  end
+
+  def defLabel(label)
+    return SemanticFunctionAST.new(type: :func, name: "defLabel", args: [ label ])
+  end
+
+  def setLabel(label)
+    return SemanticFunctionAST.new(type: :func, name: "setLabel", args: [ label ])
+  end
+
+  def block(stmt_list)
+    return SemanticFunctionAST.new(type: :block, list: stmt_list)
+  end
+
+  def reset_counters
+    @__Label_counts = {}
+  end
+  def createTmpVar(label_prefix)
+    @__Label_counts ||= {}
+    @__Label_counts[label_prefix] ||= 0
+    @__Label_counts[label_prefix] += 1
+    count = @__Label_counts[label_prefix]
+    ret = createVar("#{label_prefix}_#{count}")
+    # puts ret.inspect
+    return ret
+  end
+
+  def createStmtListFromArray(array)
+    if(array.count > 0)
+      return SemanticFunctionAST.new(type: :stmt_list, head: array.shift, tail: createStmtListFromArray(array))
+    else
+      return SemanticFunctionAST.nothing
+    end
+  end
+
+end
diff --git a/target/arc/semfunc_generator/modules/Translator.rb b/target/arc/semfunc_generator/modules/Translator.rb
new file mode 100644
index 0000000000..d532e96363
--- /dev/null
+++ b/target/arc/semfunc_generator/modules/Translator.rb
@@ -0,0 +1,102 @@
+module Translator
+
+  # def map_for_variable
+  #   if(rule_pattern.object[:name] =~ /^_(.*)$/)
+  #     name = $1
+  #     if name == ""
+  #       name = "unname#{unname}"
+  #       unname += 1
+  #     end
+  #     return name
+  #   end
+
+  # Function that verifies is AST is compatible with AST Pattern
+  # The function results a hash of the mapping of variables and number elements
+  # the rule pattern
+  def is_a_match(ast, rule_pattern, unname = 1)
+    ret = { result: true, mappings: {} }
+
+    if(rule_pattern.class == Proc)
+
+      return rule_pattern.call(ast)
+    end
+
+    return ret if(rule_pattern.class == TrueClass)
+    ret[:result] &= false if(rule_pattern == nil || ast == nil)
+
+    if(ret[:result] == false)
+      return ret
+    end
+
+    if(rule_pattern.object[:name] =~ /^_(.*)$/)
+      name = $1
+      if name == ""
+        name = "unname#{unname}"
+        unname += 1
+      end
+
+      ret[:result] &= false if(ast.object[:type] != rule_pattern.object[:type]) if(rule_pattern.object[:type] != :var)
+      ret[:mappings][name] = ast.object[:name]
+    else
+      ret[:result] &= false if(ast.object[:type] != rule_pattern.object[:type])
+
+  # if(ast.object[:type] == :func)
+      if(ast.object[:name].class == String && ast.object[:type] != :var)
+        # puts "NOW THIS"
+        # puts ast.debug
+        # puts rule_pattern.inspect
+        ret[:result] = false if (ast.object[:name] != rule_pattern.object[:name])
+      end
+
+      if(ast.object[:type] == :var)
+        ret[:mappings][rule_pattern.object[:name]] = ast.object[:name]
+      elsif(ast.object[:type] == :number)
+        ret[:mappings][rule_pattern.object[:number]] = ast.object[:number].to_s
+      end
+    end
+
+    # puts "RULE = #{rule_pattern.debug}"
+    # puts "AST  = #{ast.debug}"
+
+    if(ret[:result] == true)
+
+      if(rule_pattern.object[:type] == :func)
+        rule_pattern.object[:args].each_with_index do |arg_rule, i|
+          if(arg_rule.object[:type] == :var && arg_rule.object[:name] == "...")
+            # puts ast.inspect
+            ret[:mappings]["varargs_#{name}"] = ast.object[:args][i..-1] || []
+          elsif(ast.object[:args][i])
+            tmp = is_a_match(ast.object[:args][i], arg_rule, unname)
+            ret[:result] &= tmp[:result]
+            ret[:mappings].merge!(tmp[:mappings])
+          else
+            ret[:result] &= false
+          end
+        end
+      end
+
+      rule_pattern.object.each_pair do |k, v|
+        if(v.class == SemanticFunctionAST)
+          tmp = is_a_match(ast.object[k], v, unname)
+          ret[:result] &= tmp[:result]
+          ret[:mappings].merge!(tmp[:mappings])
+        end
+      end
+    end
+
+    return ret
+  end
+
+  def find_matching_rule(ast)
+    rules = self.translation_rules
+
+    rules.each_pair do |k, v|
+      tmp = is_a_match(ast, k)
+      if(tmp[:result] == true)
+        return { replacement: v, mappings: tmp[:mappings], index: rules.keys.index(k) }
+      end
+    end
+    return nil
+  end
+
+end
diff --git a/target/arc/semfunc_generator/modules/TranslatorAST.rb b/target/arc/semfunc_generator/modules/TranslatorAST.rb
new file mode 100644
index 0000000000..595b9437e6
--- /dev/null
+++ b/target/arc/semfunc_generator/modules/TranslatorAST.rb
@@ -0,0 +1,80 @@
+require_relative "Translator.rb"
+
+module TranslatorAST
+
+  include Translator
+
+  def replace_variable(str, variable, replace)
+    return str.gsub(/(\$#{variable})([^$a-zA-Z_])/, "#{replace}\\2")
+  end
+
+  def replace(stmt_ast, to_do = {})
+    match = find_matching_rule(stmt_ast)
+    if(match)
+      repl = match[:replacement]
+      mappings = match[:mappings]
+
+      if(repl.class == SemanticFunctionAST)
+        repl.traverse_LR_TB do |ast|
+          ast.object.each_pair do |ok1, ov1|
+            if(ov1.class == String && ov1 =~ /^\$(.+)$/)
+              repl.object[ok1] = mappings[$1]
+            end
+          end
+        end
+
+        # mappings.each_pair do |k, v|
+        #   if(v.class == String)
+        #     # repl = repl.gsub(/(\$#{k})([^a-zA-Z_]+)/, "#{v}\\2")
+        #     repl = replace_variable(repl, k, v)
+        #   elsif(v.class == Array)
+        #     tmp = v.map { |e| e.debug }.join(", ")
+        #     repl = replace_variable(repl, k, tmp)
+        #   end
+        # end
+        return repl
+      elsif(repl.class == Proc)
+        repl.call(stmt_ast, repl, mappings, to_do)
+      elsif(repl == nil)
+        # Do nothing
+      else
+        return "CAN'T REPLACE ELEMENT OF CLASS #{repl.class}"
+      end
+    else
+      ret = "/*\n"
+      ret += "FAILED TO MATCH { #{stmt_ast.debug }}\n"
+      ret += " -----------------------\n"
+      ret += stmt_ast.inspect
+      ret += "\n -----------------------\n"
+      ret += "*/"
+      return ret
+    end
+  end
+
+  def generate_for_stmt(ast, to_do)
+    object = ast.object
+    case(object[:type])
+    when :assign, :func, :if
+      # puts ast.inspect
+      # puts "HERE at #{object[:type]} (#{ast.debug})"
+      tmp = replace(ast, to_do)
+      ret = false
+    when :stmt_list, :block
+      ret = true
+    else
+      # puts "Stopping at #{object[:type]}"
+      ret = false
+    end
+    return ret
+  end
+
+  def generate(full_ast)
+    result = ""
+    full_ast.traverse_LR_TB do |ast, to_do|
+      ret = generate_for_stmt(ast, to_do)
+      ret
+    end
+    return result
+  end
+
+end
diff --git a/target/arc/semfunc_generator/modules/TranslatorFinal.rb b/target/arc/semfunc_generator/modules/TranslatorFinal.rb
new file mode 100644
index 0000000000..9ca9e080b5
--- /dev/null
+++ b/target/arc/semfunc_generator/modules/TranslatorFinal.rb
@@ -0,0 +1,103 @@
+require_relative 'Translator.rb'
+
+module TranslatorFinal
+
+  include Translator
+
+  def replace_variable(str, variable, replace)
+    # puts "REPLACE #{str}. #{variable}, #{replace}"
+    replace = replace.gsub("@", "")
+    #  = $1 if replace =~ /\@(.+)/
+    return str.gsub(/(\$#{variable})([^$a-zA-Z_])?/, "#{replace}\\2")
+  end
+
+  def replace(stmt_ast, to_do = {}, debug = true)
+    ret = ""
+    match = find_matching_rule(stmt_ast)
+    if(match)
+      repl = match[:replacement]
+      mappings = match[:mappings]
+
+      ret += "  // Rule with index #{match[:index]}\n" if debug == true
+
+      if(repl.class == String)
+        mappings.each_pair do |k, v|
+
+          if(v.class == String)
+            # puts v.inspect
+            # puts "TRUE" if(v =~ /(true|false)/)
+
+            # repl = repl.gsub(/(\$#{k})([^a-zA-Z_]+)/, "#{v}\\2")
+            # if(!stmt_ast.hasAttr?(:static))
+              v = "arc_#{v}" if (v =~ /(true|false)/)
+            # end
+            repl = replace_variable(repl, k, v)
+
+          elsif(v.class == Array)
+            # puts "STMT_AST = #{stmt_ast.pp}"
+            tmp = v.map { |e| e.debug }.join(", ")
+            repl = replace_variable(repl, k, tmp)
+          end
+        end
+        return ret + repl
+      elsif(repl.class == Proc)
+        repl = repl.call(stmt_ast, repl, mappings, to_do)
+        if(repl.class == String)
+          if(!stmt_ast.hasAttr?(:static))
+            v = "arc_#{v}" if (v =~ /(true|false)/)
+          end
+          mappings.each_pair { |k, v| repl = replace_variable(repl, k, v) }
+          ret += repl
+        else
+          ret += "RESULT SHOULD BE A String ELEMENT."
+        end
+        return ret
+      else
+        return "CAN'T REPLACE ELEMENT OF CLASS #{repl.class}"
+      end
+    else
+      ret = "/*\n"
+      ret += "FAILED TO MATCH { #{stmt_ast.debug }}\n"
+      ret += " -----------------------\n"
+      ret += stmt_ast.inspect
+      ret += "\n -----------------------\n"
+      ret += "*/"
+      return ret
+    end
+  end
+
+  def generate(full_ast, debug = false)
+    result = ""
+    full_ast.traverse_LR_TB do |ast, to_do|
+      ret = true
+      object = ast.object
+      case(object[:type])
+      when :if
+        result +=  "  if (#{object[:cond].pp}) {\n"
+        tmp = generate(object[:then], debug)
+        result += "  #{tmp};\n"
+        result += "    }\n"
+        if(object[:else].valid?)
+          result += "  else {\n"
+          tmp = generate(object[:else], debug)
+          result += "  #{tmp};\n"
+          result += "    }\n"
+        end
+        ret = false
+      when :assign, :func
+        # puts "HERE at #{object[:type]} (#{ast.debug})"
+        tmp = replace(ast, to_do, debug)
+        result += "  #{tmp};\n"
+        ret = false
+      when :stmt_list, :block
+        ret = true
+      else
+        # puts "Stopping at #{object[:type]}"
+        ret = false
+      end
+      ret
+    end
+    return result
+  end
+
+end
diff --git a/target/arc/semfunc_generator/parsers/SemanticFunctionParser.tab.rb b/target/arc/semfunc_generator/parsers/SemanticFunctionParser.tab.rb
new file mode 100644
index 0000000000..e0634d5a33
--- /dev/null
+++ b/target/arc/semfunc_generator/parsers/SemanticFunctionParser.tab.rb
@@ -0,0 +1,553 @@
+#
+# DO NOT MODIFY!!!!
+# This file is automatically generated by Racc 1.4.12
+# from Racc grammer file "".
+#
+
+require 'racc/parser.rb'
+class SemanticFunctionParser < Racc::Parser
+
+module_eval(<<'...end SemanticFunctionParser.y/module_eval...', 'SemanticFunctionParser.y', 66)
+
+def parse(str)
+  orig_str = str
+  str = str.gsub(" ", "").gsub("\n", "").gsub("\r", "")
+  @yydebug = true
+  @q = []
+  until str.empty?
+    append = ""
+    case str
+      when /\A(if)/
+        @q.push [:IF, $1]
+      when /\A(else)/
+        @q.push [:ELSE, $1]
+      when /\A(while)/
+        @q.push [:WHILE, $1]
+      when /\A(&&|\|\||\^\^)/
+        @q.push [:BINCOND, $1]
+      when /\A(&|\||\^|<<|>>|-|\+|\/|\*)/
+        @q.push [:BINOP, $1]
+      when /\A(==|!=|<=|<|>=|>)/
+        @q.push [:BINCOMP, $1]
+      when /\A([\~!])/
+        @q.push [:UNIOP, $1]
+      when /\A(a)\]/
+        @q.push [:STRING, $1]
+        append = "]"
+      when /\A(^[a-zA-Z][a-zA-Z0-9]*)\(/
+        @q.push [:FUNC, $1]
+        append = '('
+      when /\A(@?[a-zA-Z_][a-zA-Z0-9_]*)/
+        @q.push [:VAR, $1]
+      when /\A0x([0-9a-fA-F])+/
+        @q.push [:HEX_NUMBER, $&.to_i(16)]
+      when /\A\d+/
+        @q.push [:NUMBER, $&.to_i]
+      when /\A.|\n/o
+        s = $&
+        @q.push [s, s]
+#     # when /\A([\+\-\*\/]|<<|>>|&)/
+#     #   @q.push [:BINOP, $1]
+    end
+    str = append + $'
+  end
+  @q.push [false, '$end']
+#  begin
+    do_parse
+#  rescue
+#    return SemanticFunctionAST.error("Error parsing: --#{orig_str}--")
+#  end
+end
+
+ def next_token
+  @q.shift
+ end
+
+ def on_error(t, val, vstack)
+   raise ParseError, sprintf("\nparse error on value %s (%s)",
+                             val.inspect, token_to_str(t) || '?')
+ end
+
+...end SemanticFunctionParser.y/module_eval...
+##### State transition tables begin ###
+
+racc_action_table = [
+     7,     7,     8,     8,    53,    52,     2,     2,    12,    11,
+    51,     9,     9,     7,     7,     8,     8,     7,    17,     8,
+    10,    10,    18,     2,     9,     9,    53,    52,     9,     7,
+     7,     8,     8,    10,    10,     2,     2,    10,    19,    47,
+     9,     9,    29,    20,     9,    28,    62,    21,    33,    10,
+    10,    34,    35,    10,    39,    47,     9,    37,    53,    52,
+    33,    22,    62,    34,    35,    10,    39,    23,     9,    37,
+    24,    24,    33,    53,    52,    34,    35,    10,    39,    58,
+     9,    37,    47,    50,    33,    53,    52,    34,    35,    10,
+    29,    67,     9,    28,    47,    59,    33,    60,    47,    34,
+    35,    10,    29,    63,     9,    28,    47,    70,    33,    53,
+   nil,    34,    35,    10,    39,   nil,     9,    37,   nil,   nil,
+    33,   nil,   nil,    34,    35,    10,    39,   nil,     9,    37,
+   nil,   nil,    33,   nil,   nil,    34,    35,    10,    29,   nil,
+     9,    28,   nil,   nil,    33,   nil,   nil,    34,    35,    10,
+    39,   nil,     9,    37,   nil,   nil,    33,   nil,   nil,    34,
+    35,    10,    39,   nil,     9,    37,   nil,   nil,    33,   nil,
+   nil,    34,    35,    10,    39,   nil,     9,    37,   nil,   nil,
+    33,   nil,   nil,    34,    35,    10,    47,   -26,   -26 ]
+
+racc_action_check = [
+     0,     2,     0,     2,    36,    36,     0,     2,     2,     1,
+    36,     0,     2,    16,    24,    16,    24,    51,     5,    51,
+     0,     2,     7,    51,    16,    24,    44,    44,    51,    58,
+    70,    58,    70,    16,    24,    58,    70,    51,     8,    49,
+    58,    70,    17,     9,    17,    17,    49,    11,    17,    58,
+    70,    17,    17,    17,    18,    56,    18,    18,    55,    55,
+    18,    13,    56,    18,    18,    18,    19,    14,    19,    19,
+    15,    25,    19,    41,    41,    19,    19,    19,    20,    41,
+    20,    20,    27,    33,    20,    57,    57,    20,    20,    20,
+    28,    57,    28,    28,    38,    42,    28,    45,    48,    28,
+    28,    28,    29,    50,    29,    29,    54,    64,    29,    65,
+   nil,    29,    29,    29,    37,   nil,    37,    37,   nil,   nil,
+    37,   nil,   nil,    37,    37,    37,    39,   nil,    39,    39,
+   nil,   nil,    39,   nil,   nil,    39,    39,    39,    47,   nil,
+    47,    47,   nil,   nil,    47,   nil,   nil,    47,    47,    47,
+    52,   nil,    52,    52,   nil,   nil,    52,   nil,   nil,    52,
+    52,    52,    53,   nil,    53,    53,   nil,   nil,    53,   nil,
+   nil,    53,    53,    53,    60,   nil,    60,    60,   nil,   nil,
+    60,   nil,   nil,    60,    60,    60,    43,    43,    43 ]
+
+racc_action_pointer = [
+    -3,     9,    -2,   nil,   nil,     7,   nil,    10,    26,    31,
+   nil,    47,   nil,    51,    57,    53,    10,    30,    42,    54,
+    66,   nil,   nil,   nil,    11,    54,   nil,    76,    78,    90,
+   nil,   nil,   nil,    64,   nil,   nil,    -3,   102,    88,   114,
+   nil,    66,    82,   180,    19,    81,   nil,   126,    92,    33,
+    83,    14,   138,   150,   100,    51,    49,    78,    26,   nil,
+   162,   nil,   nil,   nil,   103,   102,   nil,   nil,   nil,   nil,
+    27,   nil ]
+
+racc_action_default = [
+   -37,   -37,   -37,    -4,    -5,   -37,    -7,   -37,   -37,   -37,
+   -36,   -37,    -1,   -37,   -37,    -4,    -5,   -37,   -37,   -37,
+   -21,    72,    -2,    -3,   -30,   -31,   -29,    -6,   -37,   -37,
+   -15,   -16,   -32,   -37,   -34,   -35,   -37,   -37,   -26,   -37,
+   -16,   -37,   -37,   -17,   -18,   -20,   -28,   -37,   -12,   -37,
+   -37,   -37,   -37,   -37,   -12,   -25,   -26,   -37,   -37,   -11,
+   -21,   -13,   -14,   -33,    -9,   -23,   -24,   -22,   -10,   -19,
+   -37,    -8 ]
+
+racc_goto_table = [
+     1,     5,    13,     5,     6,    42,     6,    27,   nil,   nil,
+    43,    31,    36,    41,   nil,   nil,    14,     5,    48,    49,
+     6,    15,    31,    31,   nil,     5,    16,    54,     6,    56,
+    26,    55,   nil,    57,   nil,    25,   nil,    61,    46,   nil,
+    16,    31,   nil,    25,   nil,    69,    65,    66,    16,   nil,
+    43,    64,     5,   nil,   nil,     6,   nil,   nil,    68,     5,
+   nil,   nil,     6,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
+    71,     5,   nil,   nil,     6 ]
+
+racc_goto_check = [
+     1,     5,     1,     5,     7,     9,     7,     6,   nil,   nil,
+     6,    10,     8,     8,   nil,   nil,     2,     5,     6,     6,
+     7,     3,    10,    10,   nil,     5,     4,     6,     7,     6,
+     2,     8,   nil,     8,   nil,     3,   nil,     6,     2,   nil,
+     4,    10,   nil,     3,   nil,     9,     8,     8,     4,   nil,
+     6,     1,     5,   nil,   nil,     7,   nil,   nil,     1,     5,
+   nil,   nil,     7,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
+     1,     5,   nil,   nil,     7 ]
+
+racc_goto_pointer = [
+   nil,     0,    14,    19,    24,     1,   -10,     4,    -6,   -15,
+    -6,   nil ]
+
+racc_goto_default = [
+   nil,   nil,   nil,     3,     4,    32,    38,    30,    44,   nil,
+    40,    45 ]
+
+racc_reduce_table = [
+  0, 0, :racc_error,
+  2, 25, :_reduce_1,
+  3, 25, :_reduce_2,
+  3, 25, :_reduce_3,
+  1, 25, :_reduce_4,
+  1, 27, :_reduce_5,
+  3, 27, :_reduce_6,
+  1, 27, :_reduce_7,
+  7, 28, :_reduce_8,
+  5, 28, :_reduce_9,
+  5, 28, :_reduce_10,
+  4, 31, :_reduce_11,
+  2, 30, :_reduce_12,
+  3, 30, :_reduce_13,
+  3, 30, :_reduce_14,
+  1, 30, :_reduce_15,
+  1, 30, :_reduce_16,
+  1, 35, :_reduce_17,
+  1, 35, :_reduce_18,
+  3, 33, :_reduce_19,
+  1, 33, :_reduce_20,
+  0, 33, :_reduce_21,
+  3, 32, :_reduce_22,
+  3, 32, :_reduce_23,
+  3, 32, :_reduce_24,
+  2, 32, :_reduce_25,
+  1, 32, :_reduce_26,
+  1, 32, :_reduce_27,
+  3, 26, :_reduce_28,
+  2, 26, :_reduce_29,
+  2, 26, :_reduce_30,
+  1, 26, :_reduce_31,
+  1, 34, :_reduce_32,
+  3, 34, :_reduce_33,
+  1, 34, :_reduce_34,
+  1, 34, :_reduce_35,
+  1, 29, :_reduce_36 ]
+
+racc_reduce_n = 37
+
+racc_shift_n = 72
+
+racc_token_table = {
+  false => 0,
+  :error => 1,
+  :UMINUS => 2,
+  :IF => 3,
+  :ELSE => 4,
+  :WHILE => 5,
+  :BINOP => 6,
+  :BINCOMP => 7,
+  :BINCOND => 8,
+  "{" => 9,
+  "}" => 10,
+  "=" => 11,
+  "(" => 12,
+  ")" => 13,
+  :FUNC => 14,
+  :UNIOP => 15,
+  "," => 16,
+  ";" => 17,
+  "[" => 18,
+  :STRING => 19,
+  "]" => 20,
+  :NUMBER => 21,
+  :HEX_NUMBER => 22,
+  :VAR => 23 }
+
+racc_nt_base = 24
+
+racc_use_result_var = true
+
+Racc_arg = [
+  racc_action_table,
+  racc_action_check,
+  racc_action_default,
+  racc_action_pointer,
+  racc_goto_table,
+  racc_goto_check,
+  racc_goto_default,
+  racc_goto_pointer,
+  racc_nt_base,
+  racc_reduce_table,
+  racc_token_table,
+  racc_shift_n,
+  racc_reduce_n,
+  racc_use_result_var ]
+
+Racc_token_to_s_table = [
+  "$end",
+  "error",
+  "UMINUS",
+  "IF",
+  "ELSE",
+  "WHILE",
+  "BINOP",
+  "BINCOMP",
+  "BINCOND",
+  "\"{\"",
+  "\"}\"",
+  "\"=\"",
+  "\"(\"",
+  "\")\"",
+  "FUNC",
+  "UNIOP",
+  "\",\"",
+  "\";\"",
+  "\"[\"",
+  "STRING",
+  "\"]\"",
+  "NUMBER",
+  "HEX_NUMBER",
+  "VAR",
+  "$start",
+  "block",
+  "stmt_list",
+  "stmt",
+  "block_stmt",
+  "var",
+  "expr",
+  "func",
+  "cond",
+  "func_args",
+  "leaf",
+  "arg" ]
+
+Racc_debug_parser = false
+
+##### State transition tables end #####
+
+# reduce 0 omitted
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 12)
+  def _reduce_1(val, _values, result)
+     return SemanticFunctionAST.new({ type: :block, list: SemanticFunctionAST.nothing })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 13)
+  def _reduce_2(val, _values, result)
+     return val[1]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 14)
+  def _reduce_3(val, _values, result)
+     return SemanticFunctionAST.new({ type: :block, list: val[1] })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 15)
+  def _reduce_4(val, _values, result)
+     return SemanticFunctionAST.new({ type: :block, list: SemanticFunctionAST.new({ type: :stmt_list, head: val[0], tail: SemanticFunctionAST.nothing }) })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 17)
+  def _reduce_5(val, _values, result)
+     return val[0]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 18)
+  def _reduce_6(val, _values, result)
+     return SemanticFunctionAST.new({ type: :assign, lhs: val[0], rhs: val[2] })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 19)
+  def _reduce_7(val, _values, result)
+     return val[0]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 21)
+  def _reduce_8(val, _values, result)
+     return SemanticFunctionAST.new({ type: :if, cond: val[2], then: val[4], else: val[6] })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 22)
+  def _reduce_9(val, _values, result)
+     return SemanticFunctionAST.new({ type: :if, cond: val[2], then: val[4], else: SemanticFunctionAST.nothing })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 23)
+  def _reduce_10(val, _values, result)
+     return SemanticFunctionAST.new({ type: :while, cond: val[2], loop: val[4] })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 25)
+  def _reduce_11(val, _values, result)
+     return SemanticFunctionAST.new({ type: :func, name: val[0], args: val[2] })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 27)
+  def _reduce_12(val, _values, result)
+     return SemanticFunctionAST.new({ type: :uniop, name: val[0], rhs: val[1] })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 28)
+  def _reduce_13(val, _values, result)
+     return SemanticFunctionAST.new({ type: :binop, name: val[1], lhs: val[0], rhs: val[2] })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 29)
+  def _reduce_14(val, _values, result)
+     return val[1]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 30)
+  def _reduce_15(val, _values, result)
+     return val[0]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 31)
+  def _reduce_16(val, _values, result)
+     return val[0]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 33)
+  def _reduce_17(val, _values, result)
+    val[0]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 34)
+  def _reduce_18(val, _values, result)
+    val[0]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 37)
+  def _reduce_19(val, _values, result)
+     return [val[0]] + val[2]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 38)
+  def _reduce_20(val, _values, result)
+     return [val[0]]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 39)
+  def _reduce_21(val, _values, result)
+     return []
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 41)
+  def _reduce_22(val, _values, result)
+     return val[1]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 42)
+  def _reduce_23(val, _values, result)
+     return SemanticFunctionAST.new({ type: :bincond, name: val[1], lhs: val[0], rhs: val[2] })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 43)
+  def _reduce_24(val, _values, result)
+     return SemanticFunctionAST.new({ type: :bincond, name: val[1], lhs: val[0], rhs: val[2] })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 44)
+  def _reduce_25(val, _values, result)
+     return SemanticFunctionAST.new({ type: :unicond, name: val[0], rhs: val[1] })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 45)
+  def _reduce_26(val, _values, result)
+     val[0]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 46)
+  def _reduce_27(val, _values, result)
+     val[0]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 50)
+  def _reduce_28(val, _values, result)
+     return SemanticFunctionAST.new({ type: :stmt_list, head: val[0], tail: val[2]})
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 51)
+  def _reduce_29(val, _values, result)
+     return SemanticFunctionAST.new({ type: :stmt_list, head: val[0], tail: val[1]})
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 52)
+  def _reduce_30(val, _values, result)
+     return SemanticFunctionAST.new({ type: :stmt_list, head: val[0], tail: SemanticFunctionAST.nothing })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 53)
+  def _reduce_31(val, _values, result)
+     return SemanticFunctionAST.new({ type: :stmt_list, head: val[0], tail: SemanticFunctionAST.nothing })
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 55)
+  def _reduce_32(val, _values, result)
+     return val[0]
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 56)
+  def _reduce_33(val, _values, result)
+     return SemanticFunctionAST.new(type: :string, value: val[0])
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 57)
+  def _reduce_34(val, _values, result)
+     return SemanticFunctionAST.new(type: :number, number: val[0])
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 58)
+  def _reduce_35(val, _values, result)
+     return SemanticFunctionAST.new(type: :number, number: val[0])
+    result
+  end
+.,.,
+
+module_eval(<<'.,.,', 'SemanticFunctionParser.y', 60)
+  def _reduce_36(val, _values, result)
+     return SemanticFunctionAST.new(type: :var, name: val[0])
+    result
+  end
+.,.,
+
+def _reduce_none(val, _values, result)
+  val[0]
+end
+
+end   # class SemanticFunctionParser
diff --git a/target/arc/semfunc_generator/parsers/SemanticFunctionParser.y b/target/arc/semfunc_generator/parsers/SemanticFunctionParser.y
new file mode 100644
index 0000000000..31cec1734c
--- /dev/null
+++ b/target/arc/semfunc_generator/parsers/SemanticFunctionParser.y
@@ -0,0 +1,126 @@
+class SemanticFunctionParser
+
+prechigh
+  nonassoc UMINUS IF ELSE WHILE
+#  left '*' '/'
+#  left '+' '-'
+  left BINOP BINCOMP
+  left BINCOND
+preclow
+
+rule
+
+  block: '{' '}' { return SemanticFunctionAST.new({ type: :block, list: SemanticFunctionAST.nothing }) }
+  block: '{' block '}'     { return val[1] }
+       | '{' stmt_list '}' { return SemanticFunctionAST.new({ type: :block, list: val[1] }) }
+       | stmt		   { return SemanticFunctionAST.new({ type: :block, list: SemanticFunctionAST.new({ type: :stmt_list, head: val[0], tail: SemanticFunctionAST.nothing }) }) }
+
+  stmt: block_stmt       { return val[0] }
+      | var '=' expr	   { return SemanticFunctionAST.new({ type: :assign, lhs: val[0], rhs: val[2] }) }
+      | func  { return val[0] }
+
+  block_stmt: IF '(' cond ')' block ELSE block  { return SemanticFunctionAST.new({ type: :if, cond: val[2], then: val[4], else: val[6] }) }
+            | IF '(' cond ')' block		  { return SemanticFunctionAST.new({ type: :if, cond: val[2], then: val[4], else: SemanticFunctionAST.nothing }) }
+            | WHILE '(' cond ')' block	  { return SemanticFunctionAST.new({ type: :while, cond: val[2], loop: val[4] }) }
+
+  func: FUNC '(' func_args ')'	{ return SemanticFunctionAST.new({ type: :func, name: val[0], args: val[2] }) }
+
+  expr: UNIOP expr	{ return SemanticFunctionAST.new({ type: :uniop, name: val[0], rhs: val[1] }) }
+      | expr BINOP expr	{ return SemanticFunctionAST.new({ type: :binop, name: val[1], lhs: val[0], rhs: val[2] }) }
+      | '(' expr ')'	{ return val[1] }
+      | func    { return val[0] }
+      | leaf		{ return val[0] }
+
+  arg: expr {val[0]}
+     | cond {val[0]}
+#     | '{' stmt_list '}' { return SemanticFunctionAST.new({ type: :block, list: val[1] }) }
+
+  func_args: arg ',' func_args	  { return [val[0]] + val[2] }
+	   | arg		  { return [val[0]] }
+     |          { return [] }
+
+  cond: '(' cond ')' { return val[1] }
+      | cond BINCOND cond   { return SemanticFunctionAST.new({ type: :bincond, name: val[1], lhs: val[0], rhs: val[2] }) }
+      | cond BINCOMP cond   { return SemanticFunctionAST.new({ type: :bincond, name: val[1], lhs: val[0], rhs: val[2] }) }
+      | UNIOP cond	    { return SemanticFunctionAST.new({ type: :unicond, name: val[0], rhs: val[1] }) }
+      | expr		    { val[0] }
+      | leaf		    { val[0] }
+#      | expr		    { return SemanticFunctionAST.new({ type: :cond, value: val[0] }) }
+#      | leaf		    { return SemanticFunctionAST.new({ type: :cond, value: val[0] }) }
+
+  stmt_list: stmt ';' stmt_list   { return SemanticFunctionAST.new({ type: :stmt_list, head: val[0], tail: val[2]}) }
+           | block_stmt stmt_list { return SemanticFunctionAST.new({ type: :stmt_list, head: val[0], tail: val[1]}) }
+           | stmt ';'             { return SemanticFunctionAST.new({ type: :stmt_list, head: val[0], tail: SemanticFunctionAST.nothing }) }
+           | stmt                 { return SemanticFunctionAST.new({ type: :stmt_list, head: val[0], tail: SemanticFunctionAST.nothing }) }
+
+  leaf: var               { return val[0] }
+      | '[' STRING ']'  { return SemanticFunctionAST.new(type: :string, value: val[0]) }
+      | NUMBER            { return SemanticFunctionAST.new(type: :number, number: val[0]) }
+      | HEX_NUMBER        { return SemanticFunctionAST.new(type: :number, number: val[0]) }
+
+  var: VAR                { return SemanticFunctionAST.new(type: :var, name: val[0]) }
+
+end
+
+---- inner
+
+def parse(str)
+  orig_str = str
+  str = str.gsub(" ", "").gsub("\n", "").gsub("\r", "")
+  @yydebug = true
+  @q = []
+  until str.empty?
+    append = ""
+    case str
+      when /\A(if)/
+        @q.push [:IF, $1]
+      when /\A(else)/
+        @q.push [:ELSE, $1]
+      when /\A(while)/
+        @q.push [:WHILE, $1]
+      when /\A(&&|\|\||\^\^)/
+        @q.push [:BINCOND, $1]
+      when /\A(&|\||\^|<<|>>|-|\+|\/|\*)/
+        @q.push [:BINOP, $1]
+      when /\A(==|!=|<=|<|>=|>)/
+        @q.push [:BINCOMP, $1]
+      when /\A([\~!])/
+        @q.push [:UNIOP, $1]
+      when /\A(a)\]/
+        @q.push [:STRING, $1]
+        append = "]"
+      when /\A(^[a-zA-Z][a-zA-Z0-9]*)\(/
+        @q.push [:FUNC, $1]
+        append = '('
+      when /\A(@?[a-zA-Z_][a-zA-Z0-9_]*)/
+        @q.push [:VAR, $1]
+      when /\A0x([0-9a-fA-F])+/
+        @q.push [:HEX_NUMBER, $&.to_i(16)]
+      when /\A\d+/
+        @q.push [:NUMBER, $&.to_i]
+      when /\A.|\n/o
+        s = $&
+        @q.push [s, s]
+#     # when /\A([\+\-\*\/]|<<|>>|&)/
+#     #   @q.push [:BINOP, $1]
+    end
+    str = append + $'
+  end
+  @q.push [false, '$end']
+#  begin
+    do_parse
+#  rescue
+#    return SemanticFunctionAST.error("Error parsing: --#{orig_str}--")
+#  end
+end
+
+ def next_token
+  @q.shift
+ end
+
+ def on_error(t, val, vstack)
+   raise ParseError, sprintf("\nparse error on value %s (%s)",
+                             val.inspect, token_to_str(t) || '?')
+ end
+
+---- footer
diff --git a/target/arc/semfunc_generator/regenerate_semfunc.rb b/target/arc/semfunc_generator/regenerate_semfunc.rb
new file mode 100644
index 0000000000..61936f9d7c
--- /dev/null
+++ b/target/arc/semfunc_generator/regenerate_semfunc.rb
@@ -0,0 +1,245 @@
+#!/usr/bin/env ruby
+
+require 'erb'
+require_relative 'init.rb'
+
+HEADER = <<EOF
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synppsys Inc.
+ * Contributed by Cupertino Miranda <cmiranda@synopsys.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * http://www.gnu.org/licenses/lgpl-2.1.html
+ */
+
+#include "qemu/osdep.h"
+#include "translate.h"
+#include "target/arc/semfunc.h"
+
+EOF
+
+ERB_TEMPLATE = <<EOF
+/*
+ * <%= @name %>
+<%= print_lists("   Variables", @variables) %>
+<%= print_lists("   Functions", @functions) %>
+ * --- code ---
+<%= @pretty_code %>
+ */
+
+int
+arc_gen_<%= @name %>(DisasCtxt *ctx<%= @tcg_variables %>)
+{
+    int ret = DISAS_NEXT;
+<%= @tcg_code %>
+    return ret;
+}
+
+
+EOF
+
+def print_lists(name, elems, max_length = 80, prefix: " * ")
+  ret = ""
+  to_print = prefix + name + ": "
+
+  elems.each_with_index do |e, i|
+    if(to_print.length + e.length + 2 > max_length)
+      ret += to_print.gsub(/ $/, "") + "\n"
+      to_print = prefix + (" " * (name.length + 2))
+    end
+
+    to_print += e
+    to_print += ", " if i + 1 != elems.length
+  end
+
+  ret += to_print
+  return ret.split("\n").map { |a| a.gsub(/[ \t]+$/, "") }.join("\n")
+end
+
+
+def error(line_num, message)
+  puts "Error at semfunc.c:#{line_num} -- #{message}"
+  exit(-1)
+end
+
+EMPTY_ENTRY = {
+  name: "invalid",
+  code: ""
+}
+
+funcs = {}
+funcs_in_order = []
+
+current_func = nil
+func_name = nil
+in_comment = false
+in_code = false
+in_field_read = nil
+line_num = 1;
+File.read("../semfunc.c").each_line do |l|
+    if(l =~ /^\/[*]/)
+        #  puts "ENTERED IN COMMENT at line #{line_num}"
+        in_comment = true
+    elsif (in_comment == true && l =~ /\*\/[ \t]*$/)
+        in_comment = false
+        if(in_code == true)
+          #  puts "END_COMMENT at line #{line_num}"
+          #  puts current_func[:code]
+          current_func[:ast] = SemanticFunctionParser.new.parse(current_func[:code])
+          funcs[func_name] = current_func
+          funcs_in_order.push(func_name)
+        end
+        in_code = false
+    elsif (in_comment == true)
+      if(l =~ /^ [*][ ]+([A-Z0-9_]+)$/)
+        func_name = $1
+        current_func = EMPTY_ENTRY.clone()
+        current_func["Variables"] = []
+        current_func["Functions"] = []
+        current_func[:name] = func_name
+        current_func[:code] = ""
+      elsif(in_field_read != nil && l =~ /^ [*][ \t]+([@a-zA-Z0-9, ]+)$/)
+        data = $1
+        data.split(/,[ ]*/).each do |d_entry|
+          current_func[in_field_read].push(d_entry)
+        end
+      elsif(l =~ /^ [*][ \t]+([a-zA-Z]+): ([@a-zA-Z0-9, ]+)$/)
+        field = $1
+        data = $2
+        if(current_func[field].nil?)
+          error(line_num, "Field '#{field}' not valid.")
+        end
+        data.split(/,[ ]*/).each do |d_entry|
+          #puts "#{field} = #{d_entry}"
+          current_func[field].push(d_entry)
+        end
+        in_field_read = field
+      elsif(l =~ /^ [*] --- code ---$/)
+        in_field_read = nil
+        in_code = true
+      elsif(in_code)
+        current_func[:code] = "#{current_func[:code]}#{l[3..-1]}"
+      end
+    end
+    line_num += 1
+end
+
+def fix_indentation_tcg_code(code)
+
+  ret = ""
+  in_comment = false
+  indent = 0
+  #puts code
+
+  code.split("\n").each_with_index do |line, idx|
+
+    if(in_comment == false)
+      if(line =~ /^[ \t]+$/)
+        #ret += "1: "
+        ret += "\n"
+      elsif(line =~ /^[ \t;]+$/)
+        #ret += "2: \n"
+        ret += ""
+      else
+        indent -= (line.scan(/}/).size - 1) * 4
+
+        #ret += "9: "
+        line =~ /^[ \t]*(.+)$/
+        code = $1
+        ret += "#{" "*indent}#{$1}\n"
+
+        indent += (line.scan(/{/).size - 1) * 4
+      end
+    end
+
+  end
+
+  ret1 = ""
+  in_else = nil
+  else_content = ""
+  perhaps_else = false;
+  ret.split("\n").each_with_index do |line, i|
+    if(line.index("else {") != nil)
+      #puts "1- #{line}"
+       in_else = i
+       else_content = " else {\n"
+    elsif(line.index("}") != nil && in_else != nil)
+      if(in_else + 1 != i)
+        #puts "2- #{line}"
+        else_content += line
+        ret1 += else_content + "\n"
+      end
+      else_content = ""
+      in_else = nil
+    elsif(line.index("}") != nil && in_else == nil)
+      ret1 += line
+      else_content += line
+      perhaps_else = true
+    else
+      if(in_else != nil)
+        perhaps_else = false
+        #puts "3- #{line}"
+        else_content += line + "\n"
+      else
+        #puts "4- #{line}"
+        ret1 += "\n" if(perhaps_else == true)
+        ret1 += "#{line}\n"
+        perhaps_else = false
+      end
+    end
+  end
+  return ret1
+end
+
+
+class FuncBinding
+  def initialize(data, opts)
+    @name = data[:name]
+    @functions = data["Functions"]
+    @variables = data["Variables"]
+    @code = data[:code].gsub(/\t/, '')
+    @pretty_code = data[:code].split("\n").map { |l| " * #{l}" }.join("\n")
+    @ast = SemanticFunctionParser.new.parse(@code)
+    tcg_code = QEmuCompiler.new.generate(@ast, [], opts[:debug])
+    @tcg_code = fix_indentation_tcg_code(tcg_code)
+    @tcg_variables = @variables.map { |a| "TCGv #{a.gsub("@", "")}"}.unshift("").join(", ")
+  end
+end
+
+
+# Options parsing
+opts = { debug: false }
+while(ARGV.count > 0)
+  opt = ARGV.shift
+  if(opt == '-f' && (tmp = ARGV.shift) != nil)
+    opts[:filter] = tmp
+  elsif(opt == '-d')
+    puts "HERE"
+    opts[:debug] = true
+  end
+end
+
+puts HEADER
+funcs_in_order.each do |name|
+  next if(opts[:filter] && opts[:filter] != name)
+  data = funcs[name]
+  #puts name
+  next if data[:code].nil?
+  erb = ERB.new(ERB_TEMPLATE)
+  MyClass = erb.def_class(FuncBinding, 'render()')
+  puts MyClass.new(data, opts).render()
+  self.class.send(:remove_const, :MyClass)
+end
-- 
2.20.1


