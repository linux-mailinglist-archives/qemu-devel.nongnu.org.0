Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD6331E321
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:42:30 +0100 (CET)
Received: from localhost ([::1]:37956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWSj-000134-6U
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWQx-0007gk-5Q
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:39 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWQu-0004Zg-N1
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:38 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 189so32072pfy.6
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ChSDu9KMIIDbw7eUjDHT7R30zKxq07lKROnYqWY1Oxw=;
 b=mNRceI3GHZqsv8R1B/eXQAS6a7UfUWH4D89LCfYwnaCexNF9EEyDCWs0tNno3Z0x82
 uMUYxHoiSf6FifwGQESzcolcbLtOHRxvpIz5PeEvgxLeiCHyPDvowcIKPWH4AjCqWItq
 ayNOAwprH+DD6cQpbcXxRpzTtUlbRW6eDfEZSCX8FtyAypwv4SyXV5qN5KqKUp43WRWG
 12sLP7tpezx26Gq+ouLwTsO5pqBeP8uEMmabfF3ukYya74I6IAwVdvaxNPib6LXXVsc/
 pkOQbfbR05F9fRg3ghmBIF/ze+NYvXxKusrT/ocyfFy8tNEYav++bQTvwtlJJD45ya8Y
 KPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ChSDu9KMIIDbw7eUjDHT7R30zKxq07lKROnYqWY1Oxw=;
 b=eVMfBVO4lzuvsnXjQbMWB6ZkuJJoxX1qMnrAes4rYEXIOLmPdE8Ih7o4DD73iumLUQ
 cIKzVXpphZeTaLIWDO1iFKCvaJEy91mNpXhLmUSPPT8ELsp1QR7pzikWJ0q+NKwIThuP
 LXz28wmtz28dXqU7ONpeqSOzoPq32IZ1phADXnYA0K2QrH/gfGx5YfJ+8aD85Uy/3keJ
 oy2b+gKi7DOh+pN9rUXTHFCaDd9mTGc1XvQsPerMxkn+dnvMoKyPdl6sVKFPh6HNseHZ
 QlLz8wS3BSmFld2qpq5bC4W/uKPLoDCY16kqtXA2BC5aWzmCi7TnYCgk4sgacEFbCY2a
 X/2w==
X-Gm-Message-State: AOAM533NdRS6chJFjZBdIDEYC4dIHb3tKBce2cYnLQPtuulRcY8jzXdw
 l0a7y9//eWKGtpwWXenYzjCv+vBu67c0NA==
X-Google-Smtp-Source: ABdhPJwlaGbsvmW2y6KLwvP4EpcDdORhm7DFCGXy00uqbL849QYPUkwcRTm36LdpVSYXtNeUJUmatQ==
X-Received: by 2002:a63:d355:: with SMTP id u21mr1577968pgi.133.1613605234869; 
 Wed, 17 Feb 2021 15:40:34 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/35] Hexagon (target/hexagon) README
Date: Wed, 17 Feb 2021 15:39:51 -0800
Message-Id: <20210217234023.1742406-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Gives an introduction and overview to the Hexagon target

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1612763186-18161-3-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/README | 235 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)
 create mode 100644 target/hexagon/README

diff --git a/target/hexagon/README b/target/hexagon/README
new file mode 100644
index 0000000000..b0b2435070
--- /dev/null
+++ b/target/hexagon/README
@@ -0,0 +1,235 @@
+Hexagon is Qualcomm's very long instruction word (VLIW) digital signal
+processor(DSP).
+
+The following versions of the Hexagon core are supported
+    Scalar core: v67
+    https://developer.qualcomm.com/downloads/qualcomm-hexagon-v67-programmer-s-reference-manual
+
+We presented an overview of the project at the 2019 KVM Forum.
+    https://kvmforum2019.sched.com/event/Tmwc/qemu-hexagon-automatic-translation-of-the-isa-manual-pseudcode-to-tiny-code-instructions-of-a-vliw-architecture-niccolo-izzo-revng-taylor-simpson-qualcomm-innovation-center
+
+*** Tour of the code ***
+
+The qemu-hexagon implementation is a combination of qemu and the Hexagon
+architecture library (aka archlib).  The three primary directories with
+Hexagon-specific code are
+
+    qemu/target/hexagon
+        This has all the instruction and packet semantics
+    qemu/target/hexagon/imported
+        These files are imported with very little modification from archlib
+        *.idef                  Instruction semantics definition
+        macros.def              Mapping of macros to instruction attributes
+        encode*.def             Encoding patterns for each instruction
+        iclass.def              Instruction class definitions used to determine
+                                legal VLIW slots for each instruction
+    qemu/linux-user/hexagon
+        Helpers for loading the ELF file and making Linux system calls,
+        signals, etc
+
+We start with scripts that generate a bunch of include files.  This
+is a two step process.  The first step is to use the C preprocessor to expand
+macros inside the architecture definition files.  This is done in
+target/hexagon/gen_semantics.c.  This step produces
+    <BUILD_DIR>/target/hexagon/semantics_generated.pyinc.
+That file is consumed by the following python scripts to produce the indicated
+header files in <BUILD_DIR>/target/hexagon
+        gen_opcodes_def.py              -> opcodes_def_generated.h.inc
+        gen_op_regs.py                  -> op_regs_generated.h.inc
+        gen_printinsn.py                -> printinsn_generated.h.inc
+        gen_op_attribs.py               -> op_attribs_generated.h.inc
+        gen_helper_protos.py            -> helper_protos_generated.h.inc
+        gen_shortcode.py                -> shortcode_generated.h.inc
+        gen_tcg_funcs.py                -> tcg_funcs_generated.c.inc
+        gen_tcg_func_table.py           -> tcg_func_table_generated.c.inc
+        gen_helper_funcs.py             -> helper_funcs_generated.c.inc
+
+Qemu helper functions have 3 parts
+    DEF_HELPER declaration indicates the signature of the helper
+    gen_helper_<NAME> will generate a TCG call to the helper function
+    The helper implementation
+
+Here's an example of the A2_add instruction.
+    Instruction tag        A2_add
+    Assembly syntax        "Rd32=add(Rs32,Rt32)"
+    Instruction semantics  "{ RdV=RsV+RtV;}"
+
+By convention, the operands are identified by letter
+    RdV is the destination register
+    RsV, RtV are source registers
+
+The generator uses the operand naming conventions (see large comment in
+hex_common.py) to determine the signature of the helper function.  Here are the
+results for A2_add
+
+helper_protos_generated.h.inc
+    DEF_HELPER_3(A2_add, s32, env, s32, s32)
+
+tcg_funcs_generated.c.inc
+    static void generate_A2_add(
+                    CPUHexagonState *env,
+                    DisasContext *ctx,
+                    Insn *insn,
+                    Packet *pkt)
+    {
+        TCGv RdV = tcg_temp_local_new();
+        const int RdN = insn->regno[0];
+        TCGv RsV = hex_gpr[insn->regno[1]];
+        TCGv RtV = hex_gpr[insn->regno[2]];
+        gen_helper_A2_add(RdV, cpu_env, RsV, RtV);
+        gen_log_reg_write(RdN, RdV);
+        ctx_log_reg_write(ctx, RdN);
+        tcg_temp_free(RdV);
+    }
+
+helper_funcs_generated.c.inc
+    int32_t HELPER(A2_add)(CPUHexagonState *env, int32_t RsV, int32_t RtV)
+    {
+        uint32_t slot __attribute__((unused)) = 4;
+        int32_t RdV = 0;
+        { RdV=RsV+RtV;}
+        return RdV;
+    }
+
+Note that generate_A2_add updates the disassembly context to be processed
+when the packet commits (see "Packet Semantics" below).
+
+The generator checks for fGEN_TCG_<tag> macro.  This allows us to generate
+TCG code instead of a call to the helper.  If defined, the macro takes 1
+argument.
+    C semantics (aka short code)
+
+This allows the code generator to override the auto-generated code.  In some
+cases this is necessary for correct execution.  We can also override for
+faster emulation.  For example, calling a helper for add is more expensive
+than generating a TCG add operation.
+
+The gen_tcg.h file has any overrides. For example, we could write
+    #define fGEN_TCG_A2_add(GENHLPR, SHORTCODE) \
+        tcg_gen_add_tl(RdV, RsV, RtV)
+
+The instruction semantics C code relies heavily on macros.  In cases where the
+C semantics are specified only with macros, we can override the default with
+the short semantics option and #define the macros to generate TCG code.  One
+example is L2_loadw_locked:
+    Instruction tag        L2_loadw_locked
+    Assembly syntax        "Rd32=memw_locked(Rs32)"
+    Instruction semantics  "{ fEA_REG(RsV); fLOAD_LOCKED(1,4,u,EA,RdV) }"
+
+In gen_tcg.h, we use the shortcode
+#define fGEN_TCG_L2_loadw_locked(SHORTCODE) \
+    SHORTCODE
+
+There are also cases where we brute force the TCG code generation.
+Instructions with multiple definitions are examples.  These require special
+handling because qemu helpers can only return a single value.
+
+In addition to instruction semantics, we use a generator to create the decode
+tree.  This generation is also a two step process.  The first step is to run
+target/hexagon/gen_dectree_import.c to produce
+    <BUILD_DIR>/target/hexagon/iset.py
+This file is imported by target/hexagon/dectree.py to produce
+    <BUILD_DIR>/target/hexagon/dectree_generated.h.inc
+
+*** Key Files ***
+
+cpu.h
+
+This file contains the definition of the CPUHexagonState struct.  It is the
+runtime information for each thread and contains stuff like the GPR and
+predicate registers.
+
+macros.h
+
+The Hexagon arch lib relies heavily on macros for the instruction semantics.
+This is a great advantage for qemu because we can override them for different
+purposes.  You will also notice there are sometimes two definitions of a macro.
+The QEMU_GENERATE variable determines whether we want the macro to generate TCG
+code.  If QEMU_GENERATE is not defined, we want the macro to generate vanilla
+C code that will work in the helper implementation.
+
+translate.c
+
+The functions in this file generate TCG code for a translation block.  Some
+important functions in this file are
+
+    gen_start_packet - initialize the data structures for packet semantics
+    gen_commit_packet - commit the register writes, stores, etc for a packet
+    decode_and_translate_packet - disassemble a packet and generate code
+
+genptr.c
+gen_tcg.h
+
+These files create a function for each instruction.  It is mostly composed of
+fGEN_TCG_<tag> definitions followed by including tcg_funcs_generated.c.inc.
+
+op_helper.c
+
+This file contains the implementations of all the helpers.  There are a few
+general purpose helpers, but most of them are generated by including
+helper_funcs_generated.c.inc.  There are also several helpers used for debugging.
+
+
+*** Packet Semantics ***
+
+VLIW packet semantics differ from serial semantics in that all input operands
+are read, then the operations are performed, then all the results are written.
+For exmaple, this packet performs a swap of registers r0 and r1
+    { r0 = r1; r1 = r0 }
+Note that the result is different if the instructions are executed serially.
+
+Packet semantics dictate that we defer any changes of state until the entire
+packet is committed.  We record the results of each instruction in a side data
+structure, and update the visible processor state when we commit the packet.
+
+The data structures are divided between the runtime state and the translation
+context.
+
+During the TCG generation (see translate.[ch]), we use the DisasContext to
+track what needs to be done during packet commit.  Here are the relevant
+fields
+
+    reg_log            list of registers written
+    reg_log_idx        index into ctx_reg_log
+    pred_log           list of predicates written
+    pred_log_idx       index into ctx_pred_log
+    store_width        width of stores (indexed by slot)
+
+During runtime, the following fields in CPUHexagonState (see cpu.h) are used
+
+    new_value             new value of a given register
+    reg_written           boolean indicating if register was written
+    new_pred_value        new value of a predicate register
+    pred_written          boolean indicating if predicate was written
+    mem_log_stores        record of the stores (indexed by slot)
+
+*** Debugging ***
+
+You can turn on a lot of debugging by changing the HEX_DEBUG macro to 1 in
+internal.h.  This will stream a lot of information as it generates TCG and
+executes the code.
+
+To track down nasty issues with Hexagon->TCG generation, we compare the
+execution results with actual hardware running on a Hexagon Linux target.
+Run qemu with the "-d cpu" option.  Then, we can diff the results and figure
+out where qemu and hardware behave differently.
+
+The stacks are located at different locations.  We handle this by changing
+env->stack_adjust in translate.c.  First, set this to zero and run qemu.
+Then, change env->stack_adjust to the difference between the two stack
+locations.  Then rebuild qemu and run again. That will produce a very
+clean diff.
+
+Here are some handy places to set breakpoints
+
+    At the call to gen_start_packet for a given PC (note that the line number
+        might change in the future)
+        br translate.c:602 if ctx->base.pc_next == 0xdeadbeef
+    The helper function for each instruction is named helper_<TAG>, so here's
+        an example that will set a breakpoint at the start
+        br helper_A2_add
+    If you have the HEX_DEBUG macro set, the following will be useful
+        At the start of execution of a packet for a given PC
+            br helper_debug_start_packet if env->gpr[41] == 0xdeadbeef
+        At the end of execution of a packet for a given PC
+            br helper_debug_commit_end if env->this_PC == 0xdeadbeef
-- 
2.25.1


