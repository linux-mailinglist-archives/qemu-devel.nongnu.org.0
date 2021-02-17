Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404CD31E349
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:55:45 +0100 (CET)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWfY-0007e1-8o
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRe-0000wZ-DR
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:22 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRX-0004jm-56
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:22 -0500
Received: by mail-pl1-x62c.google.com with SMTP id g20so215645plo.2
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OVRS4mBybApnULSHrOfHU/FtHgRCaP56h3KYL3W42uk=;
 b=Z7qkC/pFy0mZsWYs1s/FIQrJOPtQDAjrNtrfyoXQJ1S0HHaEDD+zmOmnAgDJhpF/F9
 3udl2bwr0D9S7BU+/GPJrBkkD1om27tjM3UwpnBLEIu5QQAtxdXympe6DyFJQ6LarwMD
 BQkjcUpIk8Xj++NmiFPXTbsr/S0MK+1clF2t/Z3NvN0IsV+lNFvq0Ucs9wf/3Zn8plJG
 uS5yiOyaKsxFpVsrG2tV5cWH+9Vwu/OeGGk4zzyxJCXVJe0gxoZAgwdyb2OT9osAnJhk
 PZG1+PM+VUbCzOm0FU88SjIvFzbsgpBukPSq5+91gu4XqzGco4JhLnn0Dkl+oKG80tw2
 moyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OVRS4mBybApnULSHrOfHU/FtHgRCaP56h3KYL3W42uk=;
 b=kiBXYeyur8FJppZEu+bE6eA6ywEYwBBR1/Fq0EfilFCexsnzuNRoCcBnOhQu0ozNi8
 vwXcSSCREEfn989EKINNtfgFDpsb9tlFHAADWPLqqKqIfRvDBmKgJL0z3DRICP1qHJko
 KVDzg/U2ocHDDLhlUfP5fjUzdswJgEvQpsjzG48EBD0TLt8psxJuZFx3eR5ASZXnnOpL
 N7O35JZdnKmi2Y0w6Zggls/6Wv+CGzbA4tAvfeS9cxJlcpeyV9hG4iwuc8q1Eq2bcAED
 p6pMTcfi444domudsQhnlL48llTfRvuKK/WzTKwMdCaWDzvJeVKdnGjzprEsmH3OszLN
 BVqg==
X-Gm-Message-State: AOAM531TbHuKuwXshhAhHItsPg4uHX+XSlAVpZUpR94uzqOCBTznzrTH
 xGAIlXE/8rpgHrEwm/cebWbAYPteAQMO2w==
X-Google-Smtp-Source: ABdhPJyfKPyoEks3MATZI+mBT9XSlGcO5DWKWp5m8uhv51ZaCLugGTYHWWwJdlOiw6/d6GEWrk26sw==
X-Received: by 2002:a17:902:7c18:b029:e2:de98:59c9 with SMTP id
 x24-20020a1709027c18b02900e2de9859c9mr1356813pll.4.1613605271480; 
 Wed, 17 Feb 2021 15:41:11 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/35] Hexagon (target/hexagon/imported) arch import
Date: Wed, 17 Feb 2021 15:40:07 -0800
Message-Id: <20210217234023.1742406-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Imported from the Hexagon architecture library
    imported/macros.def
        The macro definitions specify instruction attributes that are applied
        to each instruction that references the macro. The generator will
        recursively apply attributes to each instruction that used the macro.
    imported/allidefs.def
        Top level instruction definition file
    imported/*.idef
        Instruction definition files
        These files are input to the first phase of the generator
        (gen_semantics.c) to create a python include file with the
        instruction semantics and attributes.  The python include
        file is fed to the second phase to generate various header files.
    imported/encode*.def
        Instruction encoding bit patterns for every instruction

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-19-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/imported/allidefs.def       |   30 +
 target/hexagon/imported/alu.idef           | 1258 ++++++++++++
 target/hexagon/imported/branch.idef        |  326 +++
 target/hexagon/imported/compare.idef       |  619 ++++++
 target/hexagon/imported/encode.def         |  124 ++
 target/hexagon/imported/encode_pp.def      | 2110 ++++++++++++++++++++
 target/hexagon/imported/encode_subinsn.def |  149 ++
 target/hexagon/imported/float.idef         |  312 +++
 target/hexagon/imported/ldst.idef          |  286 +++
 target/hexagon/imported/macros.def         | 1531 ++++++++++++++
 target/hexagon/imported/mpy.idef           | 1208 +++++++++++
 target/hexagon/imported/shift.idef         | 1066 ++++++++++
 target/hexagon/imported/subinsns.idef      |  149 ++
 target/hexagon/imported/system.idef        |   68 +
 14 files changed, 9236 insertions(+)
 create mode 100644 target/hexagon/imported/allidefs.def
 create mode 100644 target/hexagon/imported/alu.idef
 create mode 100644 target/hexagon/imported/branch.idef
 create mode 100644 target/hexagon/imported/compare.idef
 create mode 100644 target/hexagon/imported/encode.def
 create mode 100644 target/hexagon/imported/encode_pp.def
 create mode 100644 target/hexagon/imported/encode_subinsn.def
 create mode 100644 target/hexagon/imported/float.idef
 create mode 100644 target/hexagon/imported/ldst.idef
 create mode 100755 target/hexagon/imported/macros.def
 create mode 100644 target/hexagon/imported/mpy.idef
 create mode 100644 target/hexagon/imported/shift.idef
 create mode 100644 target/hexagon/imported/subinsns.idef
 create mode 100644 target/hexagon/imported/system.idef

diff --git a/target/hexagon/imported/allidefs.def b/target/hexagon/imported/allidefs.def
new file mode 100644
index 0000000000..2aace29888
--- /dev/null
+++ b/target/hexagon/imported/allidefs.def
@@ -0,0 +1,30 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Top level instruction definition file
+ */
+
+#include "branch.idef"
+#include "ldst.idef"
+#include "compare.idef"
+#include "mpy.idef"
+#include "alu.idef"
+#include "float.idef"
+#include "shift.idef"
+#include "system.idef"
+#include "subinsns.idef"
diff --git a/target/hexagon/imported/alu.idef b/target/hexagon/imported/alu.idef
new file mode 100644
index 0000000000..45cc529fbc
--- /dev/null
+++ b/target/hexagon/imported/alu.idef
@@ -0,0 +1,1258 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * ALU Instructions
+ */
+
+
+/**********************************************/
+/* Add/Sub instructions                       */
+/**********************************************/
+
+Q6INSN(A2_add,"Rd32=add(Rs32,Rt32)",ATTRIBS(),
+"Add 32-bit registers",
+{ RdV=RsV+RtV;})
+
+Q6INSN(A2_sub,"Rd32=sub(Rt32,Rs32)",ATTRIBS(),
+"Subtract 32-bit registers",
+{ RdV=RtV-RsV;})
+
+#define COND_ALU(TAG,OPER,DESCR,SEMANTICS)\
+Q6INSN(TAG##t,"if (Pu4) "OPER,ATTRIBS(A_ARCHV2),DESCR,{if(fLSBOLD(PuV)){SEMANTICS;} else {CANCEL;}})\
+Q6INSN(TAG##f,"if (!Pu4) "OPER,ATTRIBS(A_ARCHV2),DESCR,{if(fLSBOLDNOT(PuV)){SEMANTICS;} else {CANCEL;}})\
+Q6INSN(TAG##tnew,"if (Pu4.new) " OPER,ATTRIBS(A_ARCHV2),DESCR,{if(fLSBNEW(PuN)){SEMANTICS;} else {CANCEL;}})\
+Q6INSN(TAG##fnew,"if (!Pu4.new) "OPER,ATTRIBS(A_ARCHV2),DESCR,{if(fLSBNEWNOT(PuN)){SEMANTICS;} else {CANCEL;}})
+
+COND_ALU(A2_padd,"Rd32=add(Rs32,Rt32)","Conditionally Add 32-bit registers",RdV=RsV+RtV)
+COND_ALU(A2_psub,"Rd32=sub(Rt32,Rs32)","Conditionally Subtract 32-bit registers",RdV=RtV-RsV)
+COND_ALU(A2_paddi,"Rd32=add(Rs32,#s8)","Conditionally Add Register and immediate",fIMMEXT(siV); RdV=RsV+siV)
+COND_ALU(A2_pxor,"Rd32=xor(Rs32,Rt32)","Conditionally XOR registers",RdV=RsV^RtV)
+COND_ALU(A2_pand,"Rd32=and(Rs32,Rt32)","Conditionally AND registers",RdV=RsV&RtV)
+COND_ALU(A2_por,"Rd32=or(Rs32,Rt32)","Conditionally OR registers",RdV=RsV|RtV)
+
+COND_ALU(A4_psxtb,"Rd32=sxtb(Rs32)","Conditionally sign-extend byte", RdV=fSXTN(8,32,RsV))
+COND_ALU(A4_pzxtb,"Rd32=zxtb(Rs32)","Conditionally zero-extend byte", RdV=fZXTN(8,32,RsV))
+COND_ALU(A4_psxth,"Rd32=sxth(Rs32)","Conditionally sign-extend halfword", RdV=fSXTN(16,32,RsV))
+COND_ALU(A4_pzxth,"Rd32=zxth(Rs32)","Conditionally zero-extend halfword", RdV=fZXTN(16,32,RsV))
+COND_ALU(A4_paslh,"Rd32=aslh(Rs32)","Conditionally zero-extend halfword", RdV=RsV<<16)
+COND_ALU(A4_pasrh,"Rd32=asrh(Rs32)","Conditionally zero-extend halfword", RdV=RsV>>16)
+
+
+Q6INSN(A2_addsat,"Rd32=add(Rs32,Rt32):sat",ATTRIBS(),
+"Add 32-bit registers with saturation",
+{ RdV=fSAT(fSE32_64(RsV)+fSE32_64(RtV)); })
+
+Q6INSN(A2_subsat,"Rd32=sub(Rt32,Rs32):sat",ATTRIBS(),
+"Subtract 32-bit registers with saturation",
+{ RdV=fSAT(fSE32_64(RtV) - fSE32_64(RsV)); })
+
+
+Q6INSN(A2_addi,"Rd32=add(Rs32,#s16)",ATTRIBS(),
+"Add a signed immediate to a register",
+{ fIMMEXT(siV); RdV=RsV+siV;})
+
+
+Q6INSN(C4_addipc,"Rd32=add(pc,#u6)",ATTRIBS(),
+"Add immediate to PC",
+{ RdV=fREAD_PC()+fIMMEXT(uiV);})
+
+
+
+/**********************************************/
+/* Single-precision HL forms                  */
+/* These insns and the SP mpy are the ones    */
+/* that can do .HL stuff                      */
+/**********************************************/
+#define STD_HL_INSN(TAG,OPER,AOPER,ATR,SEM)\
+Q6INSN(A2_##TAG##_ll, OPER"(Rt.L32,Rs.L32)"AOPER,    ATR,"",{SEM(fGETHALF(0,RtV),fGETHALF(0,RsV));})\
+Q6INSN(A2_##TAG##_lh, OPER"(Rt.L32,Rs.H32)"AOPER,    ATR,"",{SEM(fGETHALF(0,RtV),fGETHALF(1,RsV));})\
+Q6INSN(A2_##TAG##_hl, OPER"(Rt.H32,Rs.L32)"AOPER,    ATR,"",{SEM(fGETHALF(1,RtV),fGETHALF(0,RsV));})\
+Q6INSN(A2_##TAG##_hh, OPER"(Rt.H32,Rs.H32)"AOPER,    ATR,"",{SEM(fGETHALF(1,RtV),fGETHALF(1,RsV));})
+
+#define SUBSTD_HL_INSN(TAG,OPER,AOPER,ATR,SEM)\
+Q6INSN(A2_##TAG##_ll, OPER"(Rt.L32,Rs.L32)"AOPER,    ATR,"",{SEM(fGETHALF(0,RtV),fGETHALF(0,RsV));})\
+Q6INSN(A2_##TAG##_hl, OPER"(Rt.L32,Rs.H32)"AOPER,    ATR,"",{SEM(fGETHALF(0,RtV),fGETHALF(1,RsV));})
+
+
+#undef HLSEM
+#define HLSEM(A,B) RdV=fSXTN(16,32,(A+B))
+SUBSTD_HL_INSN(addh_l16,"Rd32=add","",ATTRIBS(),HLSEM)
+
+#undef HLSEM
+#define HLSEM(A,B) RdV=fSATH(A+B)
+SUBSTD_HL_INSN(addh_l16_sat,"Rd32=add",":sat",ATTRIBS(),HLSEM)
+
+#undef HLSEM
+#define HLSEM(A,B) RdV=fSXTN(16,32,(A-B))
+SUBSTD_HL_INSN(subh_l16,"Rd32=sub","",ATTRIBS(),HLSEM)
+
+#undef HLSEM
+#define HLSEM(A,B) RdV=fSATH(A-B)
+SUBSTD_HL_INSN(subh_l16_sat,"Rd32=sub",":sat",ATTRIBS(),HLSEM)
+
+#undef HLSEM
+#define HLSEM(A,B) RdV=(A+B)<<16
+STD_HL_INSN(addh_h16,"Rd32=add",":<<16",ATTRIBS(),HLSEM)
+
+#undef HLSEM
+#define HLSEM(A,B) RdV=(fSATH(A+B))<<16
+STD_HL_INSN(addh_h16_sat,"Rd32=add",":sat:<<16",ATTRIBS(),HLSEM)
+
+#undef HLSEM
+#define HLSEM(A,B) RdV=(A-B)<<16
+STD_HL_INSN(subh_h16,"Rd32=sub",":<<16",ATTRIBS(),HLSEM)
+
+#undef HLSEM
+#define HLSEM(A,B) RdV=(fSATH(A-B))<<16
+STD_HL_INSN(subh_h16_sat,"Rd32=sub",":sat:<<16",ATTRIBS(),HLSEM)
+
+
+
+
+Q6INSN(A2_aslh,"Rd32=aslh(Rs32)",ATTRIBS(),
+"Arithmetic Shift Left by Halfword",{ RdV=RsV<<16; })
+
+Q6INSN(A2_asrh,"Rd32=asrh(Rs32)",ATTRIBS(),
+"Arithmetic Shift Right by Halfword",{ RdV=RsV>>16; })
+
+
+/* 64-bit versions */
+
+Q6INSN(A2_addp,"Rdd32=add(Rss32,Rtt32)",ATTRIBS(),
+"Add",
+{ RddV=RssV+RttV;})
+
+Q6INSN(A2_addpsat,"Rdd32=add(Rss32,Rtt32):sat",ATTRIBS(A_ARCHV3),
+"Add",
+{ fADDSAT64(RddV,RssV,RttV);})
+
+Q6INSN(A2_addspl,"Rdd32=add(Rss32,Rtt32):raw:lo",ATTRIBS(A_ARCHV3),
+"Add",
+{ RddV=RttV+fSXTN(32,64,fGETWORD(0,RssV));})
+
+Q6INSN(A2_addsph,"Rdd32=add(Rss32,Rtt32):raw:hi",ATTRIBS(A_ARCHV3),
+"Add",
+{ RddV=RttV+fSXTN(32,64,fGETWORD(1,RssV));})
+
+Q6INSN(A2_subp,"Rdd32=sub(Rtt32,Rss32)",ATTRIBS(),
+"Sub",
+{ RddV=RttV-RssV;})
+
+/* NEG and ABS */
+
+Q6INSN(A2_negsat,"Rd32=neg(Rs32):sat",ATTRIBS(),
+"Arithmetic negate register", { RdV = fSAT(-fCAST8s(RsV)); })
+
+Q6INSN(A2_abs,"Rd32=abs(Rs32)",ATTRIBS(),
+"Absolute Value register", { RdV = fABS(RsV); })
+
+Q6INSN(A2_abssat,"Rd32=abs(Rs32):sat",ATTRIBS(),
+"Arithmetic negate register", { RdV = fSAT(fABS(fCAST4_8s(RsV))); })
+
+Q6INSN(A2_vconj,"Rdd32=vconj(Rss32):sat",ATTRIBS(A_ARCHV2),
+"Vector Complex conjugate of Rss",
+{  fSETHALF(1,RddV,fSATN(16,-fGETHALF(1,RssV)));
+   fSETHALF(0,RddV,fGETHALF(0,RssV));
+   fSETHALF(3,RddV,fSATN(16,-fGETHALF(3,RssV)));
+   fSETHALF(2,RddV,fGETHALF(2,RssV));
+})
+
+
+/* 64-bit versions */
+
+Q6INSN(A2_negp,"Rdd32=neg(Rss32)",ATTRIBS(),
+"Arithmetic negate register", { RddV = -RssV; })
+
+Q6INSN(A2_absp,"Rdd32=abs(Rss32)",ATTRIBS(),
+"Absolute Value register", { RddV = fABS(RssV); })
+
+
+/* MIN and MAX  R */
+
+Q6INSN(A2_max,"Rd32=max(Rs32,Rt32)",ATTRIBS(),
+"Maximum of two registers",
+{ RdV = fMAX(RsV,RtV); })
+
+Q6INSN(A2_maxu,"Rd32=maxu(Rs32,Rt32)",ATTRIBS(),
+"Maximum of two registers (unsigned)",
+{ RdV = fMAX(fCAST4u(RsV),fCAST4u(RtV)); })
+
+Q6INSN(A2_min,"Rd32=min(Rt32,Rs32)",ATTRIBS(),
+"Minimum of two registers",
+{ RdV = fMIN(RtV,RsV); })
+
+Q6INSN(A2_minu,"Rd32=minu(Rt32,Rs32)",ATTRIBS(),
+"Minimum of two registers (unsigned)",
+{ RdV = fMIN(fCAST4u(RtV),fCAST4u(RsV)); })
+
+/* MIN and MAX Pairs */
+#if 1
+Q6INSN(A2_maxp,"Rdd32=max(Rss32,Rtt32)",ATTRIBS(A_ARCHV3),
+"Maximum of two register pairs",
+{ RddV = fMAX(RssV,RttV); })
+
+Q6INSN(A2_maxup,"Rdd32=maxu(Rss32,Rtt32)",ATTRIBS(A_ARCHV3),
+"Maximum of two register pairs (unsigned)",
+{ RddV = fMAX(fCAST8u(RssV),fCAST8u(RttV)); })
+
+Q6INSN(A2_minp,"Rdd32=min(Rtt32,Rss32)",ATTRIBS(A_ARCHV3),
+"Minimum of two register pairs",
+{ RddV = fMIN(RttV,RssV); })
+
+Q6INSN(A2_minup,"Rdd32=minu(Rtt32,Rss32)",ATTRIBS(A_ARCHV3),
+"Minimum of two register pairs (unsigned)",
+{ RddV = fMIN(fCAST8u(RttV),fCAST8u(RssV)); })
+#endif
+
+/**********************************************/
+/* Register and Immediate Transfers           */
+/**********************************************/
+
+Q6INSN(A2_nop,"nop",ATTRIBS(A_IT_NOP),
+"Nop (32-bit encoding)",
+ fHIDE( { }  ))
+
+
+Q6INSN(A4_ext,"immext(#u26:6)",ATTRIBS(A_IT_EXTENDER),
+"This instruction carries the 26 most-significant immediate bits for the next instruction",
+{ fHIDE(); })
+
+
+Q6INSN(A2_tfr,"Rd32=Rs32",ATTRIBS(),
+"tfr register",{ RdV=RsV;})
+
+Q6INSN(A2_tfrsi,"Rd32=#s16",ATTRIBS(),
+"transfer signed immediate to register",{ fIMMEXT(siV); RdV=siV;})
+
+Q6INSN(A2_sxtb,"Rd32=sxtb(Rs32)",ATTRIBS(),
+"Sign extend byte", {RdV = fSXTN(8,32,RsV);})
+
+Q6INSN(A2_zxth,"Rd32=zxth(Rs32)",ATTRIBS(),
+"Zero extend half", {RdV = fZXTN(16,32,RsV);})
+
+Q6INSN(A2_sxth,"Rd32=sxth(Rs32)",ATTRIBS(),
+"Sign extend half", {RdV = fSXTN(16,32,RsV);})
+
+Q6INSN(A2_combinew,"Rdd32=combine(Rs32,Rt32)",ATTRIBS(),
+"Combine two words into a register pair",
+{ fSETWORD(0,RddV,RtV);
+  fSETWORD(1,RddV,RsV);
+})
+
+Q6INSN(A4_combineri,"Rdd32=combine(Rs32,#s8)",ATTRIBS(),
+"Combine a word and an immediate into a register pair",
+{ fIMMEXT(siV); fSETWORD(0,RddV,siV);
+  fSETWORD(1,RddV,RsV);
+})
+
+Q6INSN(A4_combineir,"Rdd32=combine(#s8,Rs32)",ATTRIBS(),
+"Combine a word and an immediate into a register pair",
+{ fIMMEXT(siV); fSETWORD(0,RddV,RsV);
+  fSETWORD(1,RddV,siV);
+})
+
+
+
+Q6INSN(A2_combineii,"Rdd32=combine(#s8,#S8)",ATTRIBS(A_ARCHV2),
+"Set two small immediates",
+{ fIMMEXT(siV); fSETWORD(0,RddV,SiV); fSETWORD(1,RddV,siV); })
+
+Q6INSN(A4_combineii,"Rdd32=combine(#s8,#U6)",ATTRIBS(),"Set two small immediates",
+{ fIMMEXT(UiV); fSETWORD(0,RddV,UiV); fSETWORD(1,RddV,siV); })
+
+
+Q6INSN(A2_combine_hh,"Rd32=combine(Rt.H32,Rs.H32)",ATTRIBS(),
+"Combine two halfs into a register", {RdV = (fGETUHALF(1,RtV)<<16) | fGETUHALF(1,RsV);})
+
+Q6INSN(A2_combine_hl,"Rd32=combine(Rt.H32,Rs.L32)",ATTRIBS(),
+"Combine two halfs into a register", {RdV = (fGETUHALF(1,RtV)<<16) | fGETUHALF(0,RsV);})
+
+Q6INSN(A2_combine_lh,"Rd32=combine(Rt.L32,Rs.H32)",ATTRIBS(),
+"Combine two halfs into a register", {RdV = (fGETUHALF(0,RtV)<<16) | fGETUHALF(1,RsV);})
+
+Q6INSN(A2_combine_ll,"Rd32=combine(Rt.L32,Rs.L32)",ATTRIBS(),
+"Combine two halfs into a register", {RdV = (fGETUHALF(0,RtV)<<16) | fGETUHALF(0,RsV);})
+
+Q6INSN(A2_tfril,"Rx.L32=#u16",ATTRIBS(),
+"Set low 16-bits, leave upper 16 unchanged",{ fSETHALF(0,RxV,uiV);})
+
+Q6INSN(A2_tfrih,"Rx.H32=#u16",ATTRIBS(),
+"Set high 16-bits, leave low 16 unchanged",{ fSETHALF(1,RxV,uiV);})
+
+Q6INSN(A2_tfrcrr,"Rd32=Cs32",ATTRIBS(),
+"transfer control register to general register",{ RdV=CsV;})
+
+Q6INSN(A2_tfrrcr,"Cd32=Rs32",ATTRIBS(),
+"transfer general register to control register",{ CdV=RsV;})
+
+Q6INSN(A4_tfrcpp,"Rdd32=Css32",ATTRIBS(),
+"transfer control register to general register",{ RddV=CssV;})
+
+Q6INSN(A4_tfrpcp,"Cdd32=Rss32",ATTRIBS(),
+"transfer general register to control register",{ CddV=RssV;})
+
+
+/**********************************************/
+/* Logicals                                   */
+/**********************************************/
+
+Q6INSN(A2_and,"Rd32=and(Rs32,Rt32)",ATTRIBS(),
+"logical AND",{ RdV=RsV&RtV;})
+
+Q6INSN(A2_or,"Rd32=or(Rs32,Rt32)",ATTRIBS(),
+"logical OR",{ RdV=RsV|RtV;})
+
+Q6INSN(A2_xor,"Rd32=xor(Rs32,Rt32)",ATTRIBS(),
+"logical XOR",{ RdV=RsV^RtV;})
+
+Q6INSN(M2_xor_xacc,"Rx32^=xor(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"logical XOR with XOR accumulation",{ RxV^=RsV^RtV;})
+
+Q6INSN(M4_xor_xacc,"Rxx32^=xor(Rss32,Rtt32)",,
+"logical XOR with XOR accumulation",{ RxxV^=RssV^RttV;})
+
+
+
+Q6INSN(A4_andn,"Rd32=and(Rt32,~Rs32)",,
+"And-Not", { RdV = (RtV & ~RsV); })
+
+Q6INSN(A4_orn,"Rd32=or(Rt32,~Rs32)",,
+"Or-Not", { RdV = (RtV | ~RsV); })
+
+
+Q6INSN(A4_andnp,"Rdd32=and(Rtt32,~Rss32)",,
+"And-Not", { RddV = (RttV & ~RssV); })
+
+Q6INSN(A4_ornp,"Rdd32=or(Rtt32,~Rss32)",,
+"Or-Not", { RddV = (RttV | ~RssV); })
+
+
+
+
+/********************/
+/* Compound add-add */
+/********************/
+
+Q6INSN(S4_addaddi,"Rd32=add(Rs32,add(Ru32,#s6))",ATTRIBS(),
+        "3-input add",
+        { RdV = RsV + RuV + fIMMEXT(siV); })
+
+
+Q6INSN(S4_subaddi,"Rd32=add(Rs32,sub(#s6,Ru32))",ATTRIBS(),
+        "3-input sub",
+        { RdV = RsV - RuV + fIMMEXT(siV); })
+
+
+
+/****************************/
+/* Compound logical-logical */
+/****************************/
+
+Q6INSN(M4_and_and,"Rx32&=and(Rs32,Rt32)",ATTRIBS(),
+"Compound And-And", { RxV &= (RsV & RtV); })
+
+Q6INSN(M4_and_andn,"Rx32&=and(Rs32,~Rt32)",ATTRIBS(),
+"Compound And-Andn", { RxV &= (RsV & ~RtV); })
+
+Q6INSN(M4_and_or,"Rx32&=or(Rs32,Rt32)",ATTRIBS(),
+"Compound And-Or", { RxV &= (RsV | RtV); })
+
+Q6INSN(M4_and_xor,"Rx32&=xor(Rs32,Rt32)",ATTRIBS(),
+"Compound And-xor", { RxV &= (RsV ^ RtV); })
+
+
+
+Q6INSN(M4_or_and,"Rx32|=and(Rs32,Rt32)",ATTRIBS(),
+"Compound Or-And", { RxV |= (RsV & RtV); })
+
+Q6INSN(M4_or_andn,"Rx32|=and(Rs32,~Rt32)",ATTRIBS(),
+"Compound Or-AndN", { RxV |= (RsV & ~RtV); })
+
+Q6INSN(M4_or_or,"Rx32|=or(Rs32,Rt32)",ATTRIBS(),
+"Compound Or-Or", { RxV |= (RsV | RtV); })
+
+Q6INSN(M4_or_xor,"Rx32|=xor(Rs32,Rt32)",ATTRIBS(),
+"Compound Or-xor", { RxV |= (RsV ^ RtV); })
+
+
+Q6INSN(S4_or_andix,"Rx32=or(Ru32,and(Rx32,#s10))",ATTRIBS(),
+"Compound Or-And", { RxV = RuV | (RxV & fIMMEXT(siV)); })
+
+Q6INSN(S4_or_andi,"Rx32|=and(Rs32,#s10)",ATTRIBS(),
+"Compound Or-And", { RxV = RxV | (RsV & fIMMEXT(siV)); })
+
+Q6INSN(S4_or_ori,"Rx32|=or(Rs32,#s10)",ATTRIBS(),
+"Compound Or-And", { RxV = RxV | (RsV | fIMMEXT(siV)); })
+
+
+
+
+Q6INSN(M4_xor_and,"Rx32^=and(Rs32,Rt32)",ATTRIBS(),
+"Compound Xor-And", { RxV ^= (RsV & RtV); })
+
+Q6INSN(M4_xor_or,"Rx32^=or(Rs32,Rt32)",ATTRIBS(),
+"Compound Xor-Or", { RxV ^= (RsV | RtV); })
+
+Q6INSN(M4_xor_andn,"Rx32^=and(Rs32,~Rt32)",ATTRIBS(),
+"Compound Xor-And", { RxV ^= (RsV & ~RtV); })
+
+
+
+
+
+
+Q6INSN(A2_subri,"Rd32=sub(#s10,Rs32)",ATTRIBS(A_ARCHV2),
+"Subtract register from immediate",{ fIMMEXT(siV); RdV=siV-RsV;})
+
+Q6INSN(A2_andir,"Rd32=and(Rs32,#s10)",ATTRIBS(A_ARCHV2),
+"logical AND with immediate",{ fIMMEXT(siV); RdV=RsV&siV;})
+
+Q6INSN(A2_orir,"Rd32=or(Rs32,#s10)",ATTRIBS(A_ARCHV2),
+"logical OR with immediate",{ fIMMEXT(siV); RdV=RsV|siV;})
+
+
+
+
+Q6INSN(A2_andp,"Rdd32=and(Rss32,Rtt32)",ATTRIBS(),
+"logical AND pair",{ RddV=RssV&RttV;})
+
+Q6INSN(A2_orp,"Rdd32=or(Rss32,Rtt32)",ATTRIBS(),
+"logical OR pair",{ RddV=RssV|RttV;})
+
+Q6INSN(A2_xorp,"Rdd32=xor(Rss32,Rtt32)",ATTRIBS(),
+"logical eXclusive OR pair",{ RddV=RssV^RttV;})
+
+Q6INSN(A2_notp,"Rdd32=not(Rss32)",ATTRIBS(),
+"logical NOT pair",{ RddV=~RssV;})
+
+Q6INSN(A2_sxtw,"Rdd32=sxtw(Rs32)",ATTRIBS(),
+"Sign extend 32-bit word to 64-bit pair",
+{ RddV = fCAST4_8s(RsV); })
+
+Q6INSN(A2_sat,"Rd32=sat(Rss32)",ATTRIBS(),
+"Saturate to 32-bit Signed",
+{ RdV = fSAT(RssV); })
+
+Q6INSN(A2_roundsat,"Rd32=round(Rss32):sat",ATTRIBS(),
+"Round & Saturate to 32-bit Signed",
+{ fHIDE(size8s_t tmp;) fADDSAT64(tmp,RssV,0x080000000ULL); RdV = fGETWORD(1,tmp); })
+
+Q6INSN(A2_sath,"Rd32=sath(Rs32)",ATTRIBS(),
+"Saturate to 16-bit Signed",
+{ RdV = fSATH(RsV); })
+
+Q6INSN(A2_satuh,"Rd32=satuh(Rs32)",ATTRIBS(),
+"Saturate to 16-bit Unsigned",
+{ RdV = fSATUH(RsV); })
+
+Q6INSN(A2_satub,"Rd32=satub(Rs32)",ATTRIBS(),
+"Saturate to 8-bit Unsigned",
+{ RdV = fSATUB(RsV); })
+
+Q6INSN(A2_satb,"Rd32=satb(Rs32)",ATTRIBS(A_ARCHV2),
+"Saturate to 8-bit Signed",
+{ RdV = fSATB(RsV); })
+
+/**********************************************/
+/* Vector Add                                 */
+/**********************************************/
+
+Q6INSN(A2_vaddub,"Rdd32=vaddub(Rss32,Rtt32)",ATTRIBS(),
+"Add vector of bytes",
+{
+        fHIDE(int i;)
+        for (i = 0; i < 8; i++) {
+            fSETBYTE(i,RddV,(fGETUBYTE(i,RssV)+fGETUBYTE(i,RttV)));
+        }
+})
+
+Q6INSN(A2_vaddubs,"Rdd32=vaddub(Rss32,Rtt32):sat",ATTRIBS(),
+"Add vector of bytes",
+{
+        fHIDE(int i;)
+        for (i = 0; i < 8; i++) {
+            fSETBYTE(i,RddV,fSATUN(8,fGETUBYTE(i,RssV)+fGETUBYTE(i,RttV)));
+        }
+})
+
+Q6INSN(A2_vaddh,"Rdd32=vaddh(Rss32,Rtt32)",ATTRIBS(),
+"Add vector of half integers",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fGETHALF(i,RssV)+fGETHALF(i,RttV));
+        }
+})
+
+Q6INSN(A2_vaddhs,"Rdd32=vaddh(Rss32,Rtt32):sat",ATTRIBS(),
+"Add vector of half integers with saturation",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fSATN(16,fGETHALF(i,RssV)+fGETHALF(i,RttV)));
+        }
+})
+
+Q6INSN(A2_vadduhs,"Rdd32=vadduh(Rss32,Rtt32):sat",ATTRIBS(),
+"Add vector of unsigned half integers with saturation",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fSATUN(16,fGETUHALF(i,RssV)+fGETUHALF(i,RttV)));
+        }
+})
+
+Q6INSN(A5_vaddhubs,"Rd32=vaddhub(Rss32,Rtt32):sat",ATTRIBS(),
+"Add vector of half integers with saturation and pack to unsigned bytes",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETBYTE(i,RdV,fSATUB(fGETHALF(i,RssV)+fGETHALF(i,RttV)));
+        }
+})
+
+Q6INSN(A2_vaddw,"Rdd32=vaddw(Rss32,Rtt32)",ATTRIBS(),
+"Add vector of words",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,fGETWORD(i,RssV)+fGETWORD(i,RttV));
+        }
+})
+
+Q6INSN(A2_vaddws,"Rdd32=vaddw(Rss32,Rtt32):sat",ATTRIBS(),
+"Add vector of words with saturation",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,fSATN(32,fGETWORD(i,RssV)+fGETWORD(i,RttV)));
+        }
+})
+
+
+
+Q6INSN(S4_vxaddsubw,"Rdd32=vxaddsubw(Rss32,Rtt32):sat",ATTRIBS(),
+"Cross vector add-sub words with saturation",
+{
+        fSETWORD(0,RddV,fSAT(fGETWORD(0,RssV)+fGETWORD(1,RttV)));
+        fSETWORD(1,RddV,fSAT(fGETWORD(1,RssV)-fGETWORD(0,RttV)));
+})
+Q6INSN(S4_vxsubaddw,"Rdd32=vxsubaddw(Rss32,Rtt32):sat",ATTRIBS(),
+"Cross vector sub-add words with saturation",
+{
+        fSETWORD(0,RddV,fSAT(fGETWORD(0,RssV)-fGETWORD(1,RttV)));
+        fSETWORD(1,RddV,fSAT(fGETWORD(1,RssV)+fGETWORD(0,RttV)));
+})
+
+
+
+Q6INSN(S4_vxaddsubh,"Rdd32=vxaddsubh(Rss32,Rtt32):sat",ATTRIBS(),
+"Cross vector add-sub halfwords with saturation",
+{
+        fSETHALF(0,RddV,fSATH(fGETHALF(0,RssV)+fGETHALF(1,RttV)));
+        fSETHALF(1,RddV,fSATH(fGETHALF(1,RssV)-fGETHALF(0,RttV)));
+
+        fSETHALF(2,RddV,fSATH(fGETHALF(2,RssV)+fGETHALF(3,RttV)));
+        fSETHALF(3,RddV,fSATH(fGETHALF(3,RssV)-fGETHALF(2,RttV)));
+
+})
+Q6INSN(S4_vxsubaddh,"Rdd32=vxsubaddh(Rss32,Rtt32):sat",ATTRIBS(),
+"Cross vector sub-add halfwords with saturation",
+{
+        fSETHALF(0,RddV,fSATH(fGETHALF(0,RssV)-fGETHALF(1,RttV)));
+        fSETHALF(1,RddV,fSATH(fGETHALF(1,RssV)+fGETHALF(0,RttV)));
+
+        fSETHALF(2,RddV,fSATH(fGETHALF(2,RssV)-fGETHALF(3,RttV)));
+        fSETHALF(3,RddV,fSATH(fGETHALF(3,RssV)+fGETHALF(2,RttV)));
+})
+
+
+
+
+Q6INSN(S4_vxaddsubhr,"Rdd32=vxaddsubh(Rss32,Rtt32):rnd:>>1:sat",ATTRIBS(),
+"Cross vector add-sub halfwords with shift, round, and saturation",
+{
+        fSETHALF(0,RddV,fSATH((fGETHALF(0,RssV)+fGETHALF(1,RttV)+1)>>1));
+        fSETHALF(1,RddV,fSATH((fGETHALF(1,RssV)-fGETHALF(0,RttV)+1)>>1));
+
+        fSETHALF(2,RddV,fSATH((fGETHALF(2,RssV)+fGETHALF(3,RttV)+1)>>1));
+        fSETHALF(3,RddV,fSATH((fGETHALF(3,RssV)-fGETHALF(2,RttV)+1)>>1));
+
+})
+Q6INSN(S4_vxsubaddhr,"Rdd32=vxsubaddh(Rss32,Rtt32):rnd:>>1:sat",ATTRIBS(),
+"Cross vector sub-add halfwords with shift, round, and saturation",
+{
+        fSETHALF(0,RddV,fSATH((fGETHALF(0,RssV)-fGETHALF(1,RttV)+1)>>1));
+        fSETHALF(1,RddV,fSATH((fGETHALF(1,RssV)+fGETHALF(0,RttV)+1)>>1));
+
+        fSETHALF(2,RddV,fSATH((fGETHALF(2,RssV)-fGETHALF(3,RttV)+1)>>1));
+        fSETHALF(3,RddV,fSATH((fGETHALF(3,RssV)+fGETHALF(2,RttV)+1)>>1));
+})
+
+
+
+
+
+/**********************************************/
+/* 1/2 Vector operations                      */
+/**********************************************/
+
+
+Q6INSN(A2_svavgh,"Rd32=vavgh(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Avg vector of half integers",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETHALF(i,RdV,((fGETHALF(i,RsV)+fGETHALF(i,RtV))>>1));
+        }
+})
+
+Q6INSN(A2_svavghs,"Rd32=vavgh(Rs32,Rt32):rnd",ATTRIBS(A_ARCHV2),
+"Avg vector of half integers with rounding",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETHALF(i,RdV,((fGETHALF(i,RsV)+fGETHALF(i,RtV)+1)>>1));
+        }
+})
+
+
+
+Q6INSN(A2_svnavgh,"Rd32=vnavgh(Rt32,Rs32)",ATTRIBS(A_ARCHV2),
+"Avg vector of half integers",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETHALF(i,RdV,((fGETHALF(i,RtV)-fGETHALF(i,RsV))>>1));
+        }
+})
+
+
+Q6INSN(A2_svaddh,"Rd32=vaddh(Rs32,Rt32)",ATTRIBS(),
+"Add vector of half integers",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETHALF(i,RdV,fGETHALF(i,RsV)+fGETHALF(i,RtV));
+        }
+})
+
+Q6INSN(A2_svaddhs,"Rd32=vaddh(Rs32,Rt32):sat",ATTRIBS(),
+"Add vector of half integers with saturation",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETHALF(i,RdV,fSATN(16,fGETHALF(i,RsV)+fGETHALF(i,RtV)));
+        }
+})
+
+Q6INSN(A2_svadduhs,"Rd32=vadduh(Rs32,Rt32):sat",ATTRIBS(),
+"Add vector of unsigned half integers with saturation",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETHALF(i,RdV,fSATUN(16,fGETUHALF(i,RsV)+fGETUHALF(i,RtV)));
+        }
+})
+
+
+Q6INSN(A2_svsubh,"Rd32=vsubh(Rt32,Rs32)",ATTRIBS(),
+"Sub vector of half integers",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETHALF(i,RdV,fGETHALF(i,RtV)-fGETHALF(i,RsV));
+        }
+})
+
+Q6INSN(A2_svsubhs,"Rd32=vsubh(Rt32,Rs32):sat",ATTRIBS(),
+"Sub vector of half integers with saturation",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETHALF(i,RdV,fSATN(16,fGETHALF(i,RtV)-fGETHALF(i,RsV)));
+        }
+})
+
+Q6INSN(A2_svsubuhs,"Rd32=vsubuh(Rt32,Rs32):sat",ATTRIBS(),
+"Sub vector of unsigned half integers with saturation",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETHALF(i,RdV,fSATUN(16,fGETUHALF(i,RtV)-fGETUHALF(i,RsV)));
+        }
+})
+
+
+
+
+/**********************************************/
+/* Vector Reduce Add                          */
+/**********************************************/
+
+Q6INSN(A2_vraddub,"Rdd32=vraddub(Rss32,Rtt32)",ATTRIBS(),
+"Sum: two vectors of unsigned bytes",
+{
+        fHIDE(int i;)
+        RddV = 0;
+        for (i=0;i<4;i++) {
+            fSETWORD(0,RddV,(fGETWORD(0,RddV) + (fGETUBYTE(i,RssV)+fGETUBYTE(i,RttV))));
+        }
+        for (i=4;i<8;i++) {
+            fSETWORD(1,RddV,(fGETWORD(1,RddV) + (fGETUBYTE(i,RssV)+fGETUBYTE(i,RttV))));
+        }
+})
+
+Q6INSN(A2_vraddub_acc,"Rxx32+=vraddub(Rss32,Rtt32)",ATTRIBS(),
+"Sum: two vectors of unsigned bytes",
+{
+        fHIDE(int i;)
+        for (i = 0; i < 4; i++) {
+            fSETWORD(0,RxxV,(fGETWORD(0,RxxV) + (fGETUBYTE(i,RssV)+fGETUBYTE(i,RttV))));
+        }
+        for (i = 4; i < 8; i++) {
+            fSETWORD(1,RxxV,(fGETWORD(1,RxxV) + (fGETUBYTE(i,RssV)+fGETUBYTE(i,RttV))));
+        }
+})
+
+
+
+Q6INSN(M2_vraddh,"Rd32=vraddh(Rss32,Rtt32)",ATTRIBS(A_ARCHV3),
+"Sum: two vectors of halves",
+{
+        fHIDE(int i;)
+        RdV = 0;
+        for (i=0;i<4;i++) {
+            RdV += (fGETHALF(i,RssV)+fGETHALF(i,RttV));
+        }
+})
+
+Q6INSN(M2_vradduh,"Rd32=vradduh(Rss32,Rtt32)",ATTRIBS(A_ARCHV3),
+"Sum: two vectors of unsigned halves",
+{
+        fHIDE(int i;)
+        RdV = 0;
+        for (i=0;i<4;i++) {
+            RdV += (fGETUHALF(i,RssV)+fGETUHALF(i,RttV));
+        }
+})
+
+/**********************************************/
+/* Vector Sub                                 */
+/**********************************************/
+
+Q6INSN(A2_vsubub,"Rdd32=vsubub(Rtt32,Rss32)",ATTRIBS(),
+"Sub vector of bytes",
+{
+        fHIDE(int i;)
+        for (i = 0; i < 8; i++) {
+            fSETBYTE(i,RddV,(fGETUBYTE(i,RttV)-fGETUBYTE(i,RssV)));
+        }
+})
+
+Q6INSN(A2_vsububs,"Rdd32=vsubub(Rtt32,Rss32):sat",ATTRIBS(),
+"Sub vector of bytes",
+{
+        fHIDE(int i;)
+        for (i = 0; i < 8; i++) {
+            fSETBYTE(i,RddV,fSATUN(8,fGETUBYTE(i,RttV)-fGETUBYTE(i,RssV)));
+        }
+})
+
+Q6INSN(A2_vsubh,"Rdd32=vsubh(Rtt32,Rss32)",ATTRIBS(),
+"Sub vector of half integers",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fGETHALF(i,RttV)-fGETHALF(i,RssV));
+        }
+})
+
+Q6INSN(A2_vsubhs,"Rdd32=vsubh(Rtt32,Rss32):sat",ATTRIBS(),
+"Sub vector of half integers with saturation",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fSATN(16,fGETHALF(i,RttV)-fGETHALF(i,RssV)));
+        }
+})
+
+Q6INSN(A2_vsubuhs,"Rdd32=vsubuh(Rtt32,Rss32):sat",ATTRIBS(),
+"Sub vector of unsigned half integers with saturation",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fSATUN(16,fGETUHALF(i,RttV)-fGETUHALF(i,RssV)));
+        }
+})
+
+Q6INSN(A2_vsubw,"Rdd32=vsubw(Rtt32,Rss32)",ATTRIBS(),
+"Sub vector of words",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,fGETWORD(i,RttV)-fGETWORD(i,RssV));
+        }
+})
+
+Q6INSN(A2_vsubws,"Rdd32=vsubw(Rtt32,Rss32):sat",ATTRIBS(),
+"Sub vector of words with saturation",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,fSATN(32,fGETWORD(i,RttV)-fGETWORD(i,RssV)));
+        }
+})
+
+
+
+
+/**********************************************/
+/* Vector Abs                                 */
+/**********************************************/
+
+Q6INSN(A2_vabsh,"Rdd32=vabsh(Rss32)",ATTRIBS(),
+"Negate vector of half integers",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fABS(fGETHALF(i,RssV)));
+        }
+})
+
+Q6INSN(A2_vabshsat,"Rdd32=vabsh(Rss32):sat",ATTRIBS(),
+"Negate vector of half integers",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fSATH(fABS(fGETHALF(i,RssV))));
+        }
+})
+
+Q6INSN(A2_vabsw,"Rdd32=vabsw(Rss32)",ATTRIBS(),
+"Absolute Value vector of words",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,fABS(fGETWORD(i,RssV)));
+        }
+})
+
+Q6INSN(A2_vabswsat,"Rdd32=vabsw(Rss32):sat",ATTRIBS(),
+"Absolute Value vector of words",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,fSAT(fABS(fGETWORD(i,RssV))));
+        }
+})
+
+/**********************************************/
+/* Vector SAD                                 */
+/**********************************************/
+
+
+Q6INSN(M2_vabsdiffw,"Rdd32=vabsdiffw(Rtt32,Rss32)",ATTRIBS(A_ARCHV2),
+"Absolute Differences: vector of words",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,fABS(fGETWORD(i,RttV) - fGETWORD(i,RssV)));
+        }
+})
+
+Q6INSN(M2_vabsdiffh,"Rdd32=vabsdiffh(Rtt32,Rss32)",ATTRIBS(A_ARCHV2),
+"Absolute Differences: vector of halfwords",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fABS(fGETHALF(i,RttV) - fGETHALF(i,RssV)));
+        }
+})
+
+Q6INSN(M6_vabsdiffb,"Rdd32=vabsdiffb(Rtt32,Rss32)",ATTRIBS(),
+"Absolute Differences: vector of halfwords",
+{
+        fHIDE(int i;)
+        for (i=0;i<8;i++) {
+            fSETBYTE(i,RddV,fABS(fGETBYTE(i,RttV) - fGETBYTE(i,RssV)));
+        }
+})
+
+Q6INSN(M6_vabsdiffub,"Rdd32=vabsdiffub(Rtt32,Rss32)",ATTRIBS(),
+"Absolute Differences: vector of halfwords",
+{
+        fHIDE(int i;)
+        for (i=0;i<8;i++) {
+            fSETBYTE(i,RddV,fABS(fGETUBYTE(i,RttV) - fGETUBYTE(i,RssV)));
+        }
+})
+
+
+
+Q6INSN(A2_vrsadub,"Rdd32=vrsadub(Rss32,Rtt32)",ATTRIBS(),
+"Sum of Absolute Differences: vector of unsigned bytes",
+{
+        fHIDE(int i;)
+        RddV = 0;
+        for (i = 0; i < 4; i++) {
+            fSETWORD(0,RddV,(fGETWORD(0,RddV) + fABS((fGETUBYTE(i,RssV) - fGETUBYTE(i,RttV)))));
+        }
+        for (i = 4; i < 8; i++) {
+            fSETWORD(1,RddV,(fGETWORD(1,RddV) + fABS((fGETUBYTE(i,RssV) - fGETUBYTE(i,RttV)))));
+        }
+})
+
+Q6INSN(A2_vrsadub_acc,"Rxx32+=vrsadub(Rss32,Rtt32)",ATTRIBS(),
+"Sum of Absolute Differences: vector of unsigned bytes",
+{
+        fHIDE(int i;)
+        for (i = 0; i < 4; i++) {
+            fSETWORD(0,RxxV,(fGETWORD(0,RxxV) + fABS((fGETUBYTE(i,RssV) - fGETUBYTE(i,RttV)))));
+        }
+        for (i = 4; i < 8; i++) {
+            fSETWORD(1,RxxV,(fGETWORD(1,RxxV) + fABS((fGETUBYTE(i,RssV) - fGETUBYTE(i,RttV)))));
+        }
+})
+
+
+/**********************************************/
+/* Vector Average                             */
+/**********************************************/
+
+Q6INSN(A2_vavgub,"Rdd32=vavgub(Rss32,Rtt32)",ATTRIBS(),
+"Average vector of unsigned bytes",
+{
+        fHIDE(int i;)
+        for (i = 0; i < 8; i++) {
+            fSETBYTE(i,RddV,((fGETUBYTE(i,RssV) + fGETUBYTE(i,RttV))>>1));
+        }
+})
+
+Q6INSN(A2_vavguh,"Rdd32=vavguh(Rss32,Rtt32)",ATTRIBS(),
+"Average vector of unsigned halfwords",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,(fGETUHALF(i,RssV)+fGETUHALF(i,RttV))>>1);
+        }
+})
+
+Q6INSN(A2_vavgh,"Rdd32=vavgh(Rss32,Rtt32)",ATTRIBS(),
+"Average vector of halfwords",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,(fGETHALF(i,RssV)+fGETHALF(i,RttV))>>1);
+        }
+})
+
+Q6INSN(A2_vnavgh,"Rdd32=vnavgh(Rtt32,Rss32)",ATTRIBS(),
+"Negative Average vector of halfwords",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,(fGETHALF(i,RttV)-fGETHALF(i,RssV))>>1);
+        }
+})
+
+Q6INSN(A2_vavgw,"Rdd32=vavgw(Rss32,Rtt32)",ATTRIBS(),
+"Average vector of words",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,(fSXTN(32,33,fGETWORD(i,RssV))+fSXTN(32,33,fGETWORD(i,RttV)))>>1);
+        }
+})
+
+Q6INSN(A2_vnavgw,"Rdd32=vnavgw(Rtt32,Rss32)",ATTRIBS(A_ARCHV2),
+"Average vector of words",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,(fSXTN(32,33,fGETWORD(i,RttV))-fSXTN(32,33,fGETWORD(i,RssV)))>>1);
+        }
+})
+
+Q6INSN(A2_vavgwr,"Rdd32=vavgw(Rss32,Rtt32):rnd",ATTRIBS(),
+"Average vector of words",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,(fSXTN(32,33,fGETWORD(i,RssV))+fSXTN(32,33,fGETWORD(i,RttV))+1)>>1);
+        }
+})
+
+Q6INSN(A2_vnavgwr,"Rdd32=vnavgw(Rtt32,Rss32):rnd:sat",ATTRIBS(A_ARCHV2),
+"Average vector of words",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,fSAT((fSXTN(32,33,fGETWORD(i,RttV))-fSXTN(32,33,fGETWORD(i,RssV))+1)>>1));
+        }
+})
+
+Q6INSN(A2_vavgwcr,"Rdd32=vavgw(Rss32,Rtt32):crnd",ATTRIBS(A_ARCHV2),
+"Average vector of words with convergent rounding",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,(fCRND(fSXTN(32,33,fGETWORD(i,RssV))+fSXTN(32,33,fGETWORD(i,RttV)))>>1));
+        }
+})
+
+Q6INSN(A2_vnavgwcr,"Rdd32=vnavgw(Rtt32,Rss32):crnd:sat",ATTRIBS(A_ARCHV2),
+"Average negative vector of words with convergent rounding",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,fSAT(fCRND(fSXTN(32,33,fGETWORD(i,RttV))-fSXTN(32,33,fGETWORD(i,RssV)))>>1));
+        }
+})
+
+Q6INSN(A2_vavghcr,"Rdd32=vavgh(Rss32,Rtt32):crnd",ATTRIBS(A_ARCHV2),
+"Average vector of halfwords with conv rounding",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fCRND(fGETHALF(i,RssV)+fGETHALF(i,RttV))>>1);
+        }
+})
+
+Q6INSN(A2_vnavghcr,"Rdd32=vnavgh(Rtt32,Rss32):crnd:sat",ATTRIBS(A_ARCHV2),
+"Average negative vector of halfwords with conv rounding",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fSATH(fCRND(fGETHALF(i,RttV)-fGETHALF(i,RssV))>>1));
+        }
+})
+
+
+Q6INSN(A2_vavguw,"Rdd32=vavguw(Rss32,Rtt32)",ATTRIBS(),
+"Average vector of unsigned words",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,(fZXTN(32,33,fGETUWORD(i,RssV))+fZXTN(32,33,fGETUWORD(i,RttV)))>>1);
+        }
+})
+
+Q6INSN(A2_vavguwr,"Rdd32=vavguw(Rss32,Rtt32):rnd",ATTRIBS(),
+"Average vector of unsigned words",
+{
+        fHIDE(int i;)
+        for (i=0;i<2;i++) {
+            fSETWORD(i,RddV,(fZXTN(32,33,fGETUWORD(i,RssV))+fZXTN(32,33,fGETUWORD(i,RttV))+1)>>1);
+        }
+})
+
+Q6INSN(A2_vavgubr,"Rdd32=vavgub(Rss32,Rtt32):rnd",ATTRIBS(),
+"Average vector of unsigned bytes",
+{
+        fHIDE(int i;)
+        for (i = 0; i < 8; i++) {
+            fSETBYTE(i,RddV,((fGETUBYTE(i,RssV)+fGETUBYTE(i,RttV)+1)>>1));
+        }
+})
+
+Q6INSN(A2_vavguhr,"Rdd32=vavguh(Rss32,Rtt32):rnd",ATTRIBS(),
+"Average vector of unsigned halfwords with rounding",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,(fGETUHALF(i,RssV)+fGETUHALF(i,RttV)+1)>>1);
+        }
+})
+
+Q6INSN(A2_vavghr,"Rdd32=vavgh(Rss32,Rtt32):rnd",ATTRIBS(),
+"Average vector of halfwords with rounding",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,(fGETHALF(i,RssV)+fGETHALF(i,RttV)+1)>>1);
+        }
+})
+
+Q6INSN(A2_vnavghr,"Rdd32=vnavgh(Rtt32,Rss32):rnd:sat",ATTRIBS(A_ARCHV2),
+"Negative Average vector of halfwords with rounding",
+{
+        fHIDE(int i;)
+        for (i=0;i<4;i++) {
+            fSETHALF(i,RddV,fSATH((fGETHALF(i,RttV)-fGETHALF(i,RssV)+1)>>1));
+        }
+})
+
+
+/* Rounding Instruction */
+
+Q6INSN(A4_round_ri,"Rd32=round(Rs32,#u5)",ATTRIBS(),"Round", {RdV = fRNDN(RsV,uiV)>>uiV; })
+Q6INSN(A4_round_rr,"Rd32=round(Rs32,Rt32)",ATTRIBS(),"Round", {RdV = fRNDN(RsV,fZXTN(5,32,RtV))>>fZXTN(5,32,RtV); })
+Q6INSN(A4_round_ri_sat,"Rd32=round(Rs32,#u5):sat",ATTRIBS(),"Round", {RdV = (fSAT(fRNDN(RsV,uiV)))>>uiV; })
+Q6INSN(A4_round_rr_sat,"Rd32=round(Rs32,Rt32):sat",ATTRIBS(),"Round", {RdV = (fSAT(fRNDN(RsV,fZXTN(5,32,RtV))))>>fZXTN(5,32,RtV); })
+
+
+Q6INSN(A4_cround_ri,"Rd32=cround(Rs32,#u5)",ATTRIBS(),"Convergent Round", {RdV = fCRNDN(RsV,uiV); })
+Q6INSN(A4_cround_rr,"Rd32=cround(Rs32,Rt32)",ATTRIBS(),"Convergent Round", {RdV = fCRNDN(RsV,fZXTN(5,32,RtV)); })
+
+
+#define CROUND(DST,SRC,SHIFT) \
+        fHIDE(size16s_t rndbit_128;)\
+        fHIDE(size16s_t tmp128;)\
+        fHIDE(size16s_t src_128;)\
+        if (SHIFT == 0) { \
+            DST = SRC;\
+        } else if ((SRC & (size8s_t)((1LL << (SHIFT - 1)) - 1LL)) == 0) { \
+            src_128 = fCAST8S_16S(SRC);\
+            rndbit_128 = fCAST8S_16S(1LL);\
+            rndbit_128 = fSHIFTL128(rndbit_128, SHIFT);\
+            rndbit_128 = fAND128(rndbit_128, src_128);\
+            rndbit_128 = fSHIFTR128(rndbit_128, 1);\
+            tmp128 = fADD128(src_128, rndbit_128);\
+            tmp128 = fSHIFTR128(tmp128, SHIFT);\
+            DST =  fCAST16S_8S(tmp128);\
+        } else {\
+            size16s_t rndbit_128 =  fCAST8S_16S((1LL << (SHIFT - 1))); \
+            size16s_t src_128 =  fCAST8S_16S(SRC); \
+            size16s_t tmp128 = fADD128(src_128, rndbit_128);\
+            tmp128 = fSHIFTR128(tmp128, SHIFT);\
+            DST =  fCAST16S_8S(tmp128);\
+        }
+
+Q6INSN(A7_croundd_ri,"Rdd32=cround(Rss32,#u6)",ATTRIBS(),"Convergent Round",
+{
+CROUND(RddV,RssV,uiV);
+})
+
+Q6INSN(A7_croundd_rr,"Rdd32=cround(Rss32,Rt32)",ATTRIBS(),"Convergent Round",
+{
+CROUND(RddV,RssV,fZXTN(6,32,RtV));
+})
+
+
+
+
+
+
+
+
+
+Q6INSN(A7_clip,"Rd32=clip(Rs32,#u5)",ATTRIBS(),"Clip to  #s5", {   fCLIP(RdV,RsV,uiV);})
+Q6INSN(A7_vclip,"Rdd32=vclip(Rss32,#u5)",ATTRIBS(),"Clip to  #s5",
+{
+fHIDE(size4s_t tmp;)
+fCLIP(tmp, fGETWORD(0, RssV), uiV);
+fSETWORD(0, RddV, tmp);
+fCLIP(tmp,fGETWORD(1, RssV), uiV);
+fSETWORD(1, RddV, tmp);
+}
+)
+
+
+
+/**********************************************/
+/* V4: Cross Vector Min/Max                   */
+/**********************************************/
+
+
+#define VRMINORMAX(TAG,STR,OP,SHORTTYPE,SETTYPE,GETTYPE,NEL,SHIFT) \
+Q6INSN(A4_vr##TAG##SHORTTYPE,"Rxx32=vr"#TAG#SHORTTYPE"(Rss32,Ru32)",ATTRIBS(), \
+"Choose " STR " elements of a vector", \
+{ \
+        fHIDE(int i; size8s_t TAG; size4s_t addr;) \
+        TAG = fGET##GETTYPE(0,RxxV); \
+        addr = fGETWORD(1,RxxV); \
+        for (i = 0; i < NEL; i++) { \
+            if (TAG OP fGET##GETTYPE(i,RssV)) { \
+                TAG = fGET##GETTYPE(i,RssV); \
+                addr = RuV | i<<SHIFT; \
+            } \
+        } \
+        fSETWORD(0,RxxV,TAG); \
+        fSETWORD(1,RxxV,addr); \
+})
+
+#define RMINMAX(SHORTTYPE,SETTYPE,GETTYPE,NEL,SHIFT) \
+VRMINORMAX(min,"minimum",>,SHORTTYPE,SETTYPE,GETTYPE,NEL,SHIFT) \
+VRMINORMAX(max,"maximum",<,SHORTTYPE,SETTYPE,GETTYPE,NEL,SHIFT)
+
+
+RMINMAX(h,HALF,HALF,4,1)
+RMINMAX(uh,HALF,UHALF,4,1)
+RMINMAX(w,WORD,WORD,2,2)
+RMINMAX(uw,WORD,UWORD,2,2)
+
+#undef RMINMAX
+#undef VRMINORMAX
+
+/**********************************************/
+/* Vector Min/Max                             */
+/**********************************************/
+
+#define VMINORMAX(TAG,STR,FUNC,SHORTTYPE,SETTYPE,GETTYPE,NEL) \
+Q6INSN(A2_v##TAG##SHORTTYPE,"Rdd32=v"#TAG#SHORTTYPE"(Rtt32,Rss32)",ATTRIBS(), \
+"Choose " STR " elements of two vectors", \
+{ \
+        fHIDE(int i;) \
+        for (i = 0; i < NEL; i++) { \
+            fSET##SETTYPE(i,RddV,FUNC(fGET##GETTYPE(i,RttV),fGET##GETTYPE(i,RssV))); \
+        } \
+})
+
+#define VMINORMAX3(TAG,STR,FUNC,SHORTTYPE,SETTYPE,GETTYPE,NEL) \
+Q6INSN(A6_v##TAG##SHORTTYPE##3,"Rxx32=v"#TAG#SHORTTYPE"3(Rtt32,Rss32)",ATTRIBS(), \
+"Choose " STR " elements of two vectors", \
+{ \
+        fHIDE(int i;) \
+        for (i = 0; i < NEL; i++) { \
+            fSET##SETTYPE(i,RxxV,FUNC(fGET##GETTYPE(i,RxxV),FUNC(fGET##GETTYPE(i,RttV),fGET##GETTYPE(i,RssV)))); \
+        } \
+})
+
+#define MINMAX(SHORTTYPE,SETTYPE,GETTYPE,NEL) \
+VMINORMAX(min,"minimum",fMIN,SHORTTYPE,SETTYPE,GETTYPE,NEL) \
+VMINORMAX(max,"maximum",fMAX,SHORTTYPE,SETTYPE,GETTYPE,NEL)
+
+MINMAX(b,BYTE,BYTE,8)
+MINMAX(ub,BYTE,UBYTE,8)
+MINMAX(h,HALF,HALF,4)
+MINMAX(uh,HALF,UHALF,4)
+MINMAX(w,WORD,WORD,2)
+MINMAX(uw,WORD,UWORD,2)
+
+#undef MINMAX
+#undef VMINORMAX
+#undef VMINORMAX3
+
+
+/**********************************************/
+/* Vector Min/Max                             */
+/**********************************************/
+
+
+Q6INSN(A4_modwrapu,"Rd32=modwrap(Rs32,Rt32)",ATTRIBS(),
+"Wrap to an unsigned modulo buffer",
+{
+        if (RsV < 0) {
+            RdV = RsV + fCAST4u(RtV);
+        } else if (fCAST4u(RsV) >= fCAST4u(RtV)) {
+            RdV = RsV - fCAST4u(RtV);
+        } else {
+            RdV = RsV;
+        }
+})
diff --git a/target/hexagon/imported/branch.idef b/target/hexagon/imported/branch.idef
new file mode 100644
index 0000000000..88f5f48cce
--- /dev/null
+++ b/target/hexagon/imported/branch.idef
@@ -0,0 +1,326 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+
+/*********************************************/
+/* Jump instructions                         */
+/*********************************************/
+
+#define A_JDIR A_JUMP
+#define A_CJNEWDIR A_JUMP
+#define A_CJOLDDIR A_JUMP
+#define A_NEWVALUEJ A_JUMP,A_DOTNEWVALUE,A_MEMLIKE_PACKET_RULES
+#define A_JINDIR A_JUMP,A_INDIRECT
+#define A_JINDIRNEW A_JUMP,A_INDIRECT
+#define A_JINDIROLD A_JUMP,A_INDIRECT
+
+Q6INSN(J2_jump,"jump #r22:2",ATTRIBS(A_JDIR), "direct unconditional jump",
+{fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);})
+
+Q6INSN(J2_jumpr,"jumpr Rs32",ATTRIBS(A_JINDIR), "indirect unconditional jump",
+{fJUMPR(RsN,RsV,COF_TYPE_JUMPR);})
+
+#define OLDCOND_JUMP(TAG,OPER,OPER2,ATTRIB,DESCR,SEMANTICS) \
+Q6INSN(TAG##t,"if (Pu4) "OPER":nt "OPER2,ATTRIB,DESCR,{fBRANCH_SPECULATE_STALL(fLSBOLD(PuV),,SPECULATE_NOT_TAKEN,12,0); if (fLSBOLD(PuV)) { SEMANTICS; }}) \
+Q6INSN(TAG##f,"if (!Pu4) "OPER":nt "OPER2,ATTRIB,DESCR,{fBRANCH_SPECULATE_STALL(fLSBOLDNOT(PuV),,SPECULATE_NOT_TAKEN,12,0); if (fLSBOLDNOT(PuV)) { SEMANTICS; }}) \
+Q6INSN(TAG##tpt,"if (Pu4) "OPER":t "OPER2,ATTRIB,DESCR,{fBRANCH_SPECULATE_STALL(fLSBOLD(PuV),,SPECULATE_TAKEN,12,0); if (fLSBOLD(PuV)) { SEMANTICS; }}) \
+Q6INSN(TAG##fpt,"if (!Pu4) "OPER":t "OPER2,ATTRIB,DESCR,{fBRANCH_SPECULATE_STALL(fLSBOLDNOT(PuV),,SPECULATE_TAKEN,12,0); if (fLSBOLDNOT(PuV)) { SEMANTICS; }})
+
+OLDCOND_JUMP(J2_jump,"jump","#r15:2",ATTRIBS(A_CJOLDDIR),"direct conditional jump",
+fIMMEXT(riV);fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);)
+
+OLDCOND_JUMP(J2_jumpr,"jumpr","Rs32",ATTRIBS(A_JINDIROLD),"indirect conditional jump",
+fJUMPR(RsN,RsV,COF_TYPE_JUMPR);)
+
+#define NEWCOND_JUMP(TAG,OPER,OPER2,ATTRIB,DESCR,SEMANTICS)\
+Q6INSN(TAG##tnew,"if (Pu4.new) "OPER":nt "OPER2,ATTRIB,DESCR,{fBRANCH_SPECULATE_STALL(fLSBNEW(PuN),, SPECULATE_NOT_TAKEN , 12,0)} {if(fLSBNEW(PuN)){SEMANTICS;}})\
+Q6INSN(TAG##fnew,"if (!Pu4.new) "OPER":nt "OPER2,ATTRIB,DESCR,{fBRANCH_SPECULATE_STALL(fLSBNEWNOT(PuN),, SPECULATE_NOT_TAKEN , 12,0)} {if(fLSBNEWNOT(PuN)){SEMANTICS;}})\
+Q6INSN(TAG##tnewpt,"if (Pu4.new) "OPER":t "OPER2,ATTRIB,DESCR,{fBRANCH_SPECULATE_STALL(fLSBNEW(PuN),, SPECULATE_TAKEN , 12,0)} {if(fLSBNEW(PuN)){SEMANTICS;}})\
+Q6INSN(TAG##fnewpt,"if (!Pu4.new) "OPER":t "OPER2,ATTRIB,DESCR,{fBRANCH_SPECULATE_STALL(fLSBNEWNOT(PuN),, SPECULATE_TAKEN , 12,0)} {if(fLSBNEWNOT(PuN)){SEMANTICS;}})
+
+NEWCOND_JUMP(J2_jump,"jump","#r15:2",ATTRIBS(A_CJNEWDIR,A_ARCHV2),"direct conditional jump",
+fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMPNEW);)
+
+NEWCOND_JUMP(J2_jumpr,"jumpr","Rs32",ATTRIBS(A_JINDIRNEW,A_ARCHV3),"indirect conditional jump",
+fJUMPR(RsN,RsV,COF_TYPE_JUMPR);)
+
+
+
+Q6INSN(J4_hintjumpr,"hintjr(Rs32)",ATTRIBS(A_JINDIR),"hint indirect conditional jump",
+{fHINTJR(RsV);})
+
+
+/*********************************************/
+/* Compound Compare-Jumps                    */
+/*********************************************/
+Q6INSN(J2_jumprz,"if (Rs32!=#0) jump:nt #r13:2",ATTRIBS(A_CJNEWDIR,A_ARCHV3),"direct conditional jump if register true",
+{fBRANCH_SPECULATE_STALL((RsV!=0), , SPECULATE_NOT_TAKEN,12,0) if (RsV != 0) { fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})
+
+Q6INSN(J2_jumprnz,"if (Rs32==#0) jump:nt #r13:2",ATTRIBS(A_CJNEWDIR,A_ARCHV3),"direct conditional jump if register false",
+{fBRANCH_SPECULATE_STALL((RsV==0), , SPECULATE_NOT_TAKEN,12,0) if (RsV == 0) {fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})
+
+Q6INSN(J2_jumprzpt,"if (Rs32!=#0) jump:t #r13:2",ATTRIBS(A_CJNEWDIR,A_ARCHV3),"direct conditional jump if register true",
+{fBRANCH_SPECULATE_STALL((RsV!=0), , SPECULATE_TAKEN,12,0) if (RsV != 0) { fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})
+
+Q6INSN(J2_jumprnzpt,"if (Rs32==#0) jump:t #r13:2",ATTRIBS(A_CJNEWDIR,A_ARCHV3),"direct conditional jump if register false",
+{fBRANCH_SPECULATE_STALL((RsV==0), , SPECULATE_TAKEN,12,0) if (RsV == 0) {fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})
+
+Q6INSN(J2_jumprgtez,"if (Rs32>=#0) jump:nt #r13:2",ATTRIBS(A_CJNEWDIR,A_ARCHV3),"direct conditional jump if register greater or equal to zero",
+{fBRANCH_SPECULATE_STALL((RsV>=0), , SPECULATE_NOT_TAKEN,12,0) if (RsV>=0) { fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})
+
+Q6INSN(J2_jumprgtezpt,"if (Rs32>=#0) jump:t #r13:2",ATTRIBS(A_CJNEWDIR,A_ARCHV3),"direct conditional jump if register greater or equal to zero",
+{fBRANCH_SPECULATE_STALL((RsV>=0), , SPECULATE_TAKEN,12,0) if (RsV>=0) { fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})
+
+Q6INSN(J2_jumprltez,"if (Rs32<=#0) jump:nt #r13:2",ATTRIBS(A_CJNEWDIR,A_ARCHV3),"direct conditional jump if register less than or equal to zero",
+{fBRANCH_SPECULATE_STALL((RsV<=0), , SPECULATE_NOT_TAKEN,12,0) if (RsV<=0) { fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})
+
+Q6INSN(J2_jumprltezpt,"if (Rs32<=#0) jump:t #r13:2",ATTRIBS(A_CJNEWDIR,A_ARCHV3),"direct conditional jump if register less than or equal to zero",
+{fBRANCH_SPECULATE_STALL((RsV<=0), , SPECULATE_TAKEN,12,0) if (RsV<=0) { fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})
+
+
+
+/*********************************************/
+/* V4 Compound Compare-Jumps                 */
+/*********************************************/
+
+
+/* V4 compound compare jumps (CJ) */
+#define STD_CMPJUMP(TAG,TST,TSTSEM)\
+Q6INSN(J4_##TAG##_tp0_jump_nt, "p0="TST"; if (p0.new) jump:nt #r9:2", ATTRIBS(A_CJNEWDIR,A_NEWCMPJUMP),"compound compare-jump", {fPART1(fWRITE_P0(f8BITSOF(TSTSEM)))  fBRANCH_SPECULATE_STALL(fLSBNEW0,,SPECULATE_NOT_TAKEN,13,0)  if (fLSBNEW0) {fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})\
+Q6INSN(J4_##TAG##_fp0_jump_nt, "p0="TST"; if (!p0.new) jump:nt #r9:2", ATTRIBS(A_CJNEWDIR,A_NEWCMPJUMP),"compound compare-jump",{fPART1(fWRITE_P0(f8BITSOF(TSTSEM)))  fBRANCH_SPECULATE_STALL(fLSBNEW0NOT,,SPECULATE_NOT_TAKEN,13,0) if (fLSBNEW0NOT) {fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})\
+Q6INSN(J4_##TAG##_tp0_jump_t,  "p0="TST"; if (p0.new) jump:t #r9:2", ATTRIBS(A_CJNEWDIR,A_NEWCMPJUMP),"compound compare-jump",  {fPART1(fWRITE_P0(f8BITSOF(TSTSEM)))  fBRANCH_SPECULATE_STALL(fLSBNEW0,,SPECULATE_TAKEN,13,0)      if (fLSBNEW0) {fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})\
+Q6INSN(J4_##TAG##_fp0_jump_t,  "p0="TST"; if (!p0.new) jump:t #r9:2", ATTRIBS(A_CJNEWDIR,A_NEWCMPJUMP),"compound compare-jump", {fPART1(fWRITE_P0(f8BITSOF(TSTSEM)))  fBRANCH_SPECULATE_STALL(fLSBNEW0NOT,,SPECULATE_TAKEN,13,0)     if (fLSBNEW0NOT) {fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})\
+Q6INSN(J4_##TAG##_tp1_jump_nt, "p1="TST"; if (p1.new) jump:nt #r9:2", ATTRIBS(A_CJNEWDIR,A_NEWCMPJUMP),"compound compare-jump", {fPART1(fWRITE_P1(f8BITSOF(TSTSEM)))  fBRANCH_SPECULATE_STALL(fLSBNEW1,,SPECULATE_NOT_TAKEN,13,0)  if (fLSBNEW1) {fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})\
+Q6INSN(J4_##TAG##_fp1_jump_nt, "p1="TST"; if (!p1.new) jump:nt #r9:2", ATTRIBS(A_CJNEWDIR,A_NEWCMPJUMP),"compound compare-jump",{fPART1(fWRITE_P1(f8BITSOF(TSTSEM)))  fBRANCH_SPECULATE_STALL(fLSBNEW1NOT,,SPECULATE_NOT_TAKEN,13,0) if (fLSBNEW1NOT) {fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})\
+Q6INSN(J4_##TAG##_tp1_jump_t,  "p1="TST"; if (p1.new) jump:t #r9:2", ATTRIBS(A_CJNEWDIR,A_NEWCMPJUMP),"compound compare-jump",  {fPART1(fWRITE_P1(f8BITSOF(TSTSEM)))  fBRANCH_SPECULATE_STALL(fLSBNEW1,,SPECULATE_TAKEN,13,0)      if (fLSBNEW1) {fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})\
+Q6INSN(J4_##TAG##_fp1_jump_t,  "p1="TST"; if (!p1.new) jump:t #r9:2", ATTRIBS(A_CJNEWDIR,A_NEWCMPJUMP),"compound compare-jump", {fPART1(fWRITE_P1(f8BITSOF(TSTSEM)))  fBRANCH_SPECULATE_STALL(fLSBNEW1NOT,,SPECULATE_TAKEN,13,0)     if (fLSBNEW1NOT) {fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})
+
+
+STD_CMPJUMP(cmpeqi,"cmp.eq(Rs16,#U5)",(RsV==UiV))
+STD_CMPJUMP(cmpgti,"cmp.gt(Rs16,#U5)",(RsV>UiV))
+STD_CMPJUMP(cmpgtui,"cmp.gtu(Rs16,#U5)",(fCAST4u(RsV)>UiV))
+
+STD_CMPJUMP(cmpeqn1,"cmp.eq(Rs16,#-1)",(RsV==-1))
+STD_CMPJUMP(cmpgtn1,"cmp.gt(Rs16,#-1)",(RsV>-1))
+STD_CMPJUMP(tstbit0,"tstbit(Rs16,#0)",(RsV & 1))
+
+STD_CMPJUMP(cmpeq,"cmp.eq(Rs16,Rt16)",(RsV==RtV))
+STD_CMPJUMP(cmpgt,"cmp.gt(Rs16,Rt16)",(RsV>RtV))
+STD_CMPJUMP(cmpgtu,"cmp.gtu(Rs16,Rt16)",(fCAST4u(RsV)>RtV))
+
+
+
+/* V4 jump and transfer (CJ) */
+Q6INSN(J4_jumpseti,"Rd16=#U6 ; jump #r9:2",ATTRIBS(A_JDIR), "direct unconditional jump and set register to immediate",
+{fIMMEXT(riV); fPCALIGN(riV); RdV=UiV; fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);})
+
+Q6INSN(J4_jumpsetr,"Rd16=Rs16 ; jump #r9:2",ATTRIBS(A_JDIR), "direct unconditional jump and transfer register",
+{fIMMEXT(riV); fPCALIGN(riV); RdV=RsV; fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);})
+
+
+/* V4 new-value jumps (NCJ) */
+#define STD_CMPJUMPNEWRS(TAG,TST,TSTSEM)\
+Q6INSN(J4_##TAG##_jumpnv_t, "if ("TST") jump:t #r9:2", ATTRIBS(A_NEWVALUEJ),"compound compare-jump",{fBRANCH_SPECULATE_STALL(TSTSEM,,SPECULATE_TAKEN,13,0);if (TSTSEM) {fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})\
+Q6INSN(J4_##TAG##_jumpnv_nt,"if ("TST") jump:nt #r9:2",ATTRIBS(A_NEWVALUEJ),"compound compare-jump",{fBRANCH_SPECULATE_STALL(TSTSEM,,SPECULATE_NOT_TAKEN,13,0); if (TSTSEM) {fIMMEXT(riV); fPCALIGN(riV); fBRANCH(fREAD_PC()+riV,COF_TYPE_JUMP);}})
+
+
+
+
+STD_CMPJUMPNEWRS(cmpeqi_t,"cmp.eq(Ns8.new,#U5)",(fNEWREG(NsN)==(UiV)))
+STD_CMPJUMPNEWRS(cmpeqi_f,"!cmp.eq(Ns8.new,#U5)",(fNEWREG(NsN)!=(UiV)))
+STD_CMPJUMPNEWRS(cmpgti_t,"cmp.gt(Ns8.new,#U5)",(fNEWREG(NsN)>(UiV)))
+STD_CMPJUMPNEWRS(cmpgti_f,"!cmp.gt(Ns8.new,#U5)",!(fNEWREG(NsN)>(UiV)))
+STD_CMPJUMPNEWRS(cmpgtui_t,"cmp.gtu(Ns8.new,#U5)",(fCAST4u(fNEWREG(NsN))>(UiV)))
+STD_CMPJUMPNEWRS(cmpgtui_f,"!cmp.gtu(Ns8.new,#U5)",!(fCAST4u(fNEWREG(NsN))>(UiV)))
+
+
+STD_CMPJUMPNEWRS(cmpeqn1_t,"cmp.eq(Ns8.new,#-1)",(fNEWREG(NsN)==(-1)))
+STD_CMPJUMPNEWRS(cmpeqn1_f,"!cmp.eq(Ns8.new,#-1)",(fNEWREG(NsN)!=(-1)))
+STD_CMPJUMPNEWRS(cmpgtn1_t,"cmp.gt(Ns8.new,#-1)",(fNEWREG(NsN)>(-1)))
+STD_CMPJUMPNEWRS(cmpgtn1_f,"!cmp.gt(Ns8.new,#-1)",!(fNEWREG(NsN)>(-1)))
+STD_CMPJUMPNEWRS(tstbit0_t,"tstbit(Ns8.new,#0)",((fNEWREG(NsN)) & 1))
+STD_CMPJUMPNEWRS(tstbit0_f,"!tstbit(Ns8.new,#0)",!((fNEWREG(NsN)) & 1))
+
+
+STD_CMPJUMPNEWRS(cmpeq_t, "cmp.eq(Ns8.new,Rt32)", (fNEWREG(NsN)==RtV))
+STD_CMPJUMPNEWRS(cmpgt_t, "cmp.gt(Ns8.new,Rt32)", (fNEWREG(NsN)>RtV))
+STD_CMPJUMPNEWRS(cmpgtu_t,"cmp.gtu(Ns8.new,Rt32)",(fCAST4u(fNEWREG(NsN))>fCAST4u(RtV)))
+STD_CMPJUMPNEWRS(cmplt_t, "cmp.gt(Rt32,Ns8.new)", (RtV>fNEWREG(NsN)))
+STD_CMPJUMPNEWRS(cmpltu_t,"cmp.gtu(Rt32,Ns8.new)",(fCAST4u(RtV)>fCAST4u(fNEWREG(NsN))))
+STD_CMPJUMPNEWRS(cmpeq_f, "!cmp.eq(Ns8.new,Rt32)", (fNEWREG(NsN)!=RtV))
+STD_CMPJUMPNEWRS(cmpgt_f, "!cmp.gt(Ns8.new,Rt32)", !(fNEWREG(NsN)>RtV))
+STD_CMPJUMPNEWRS(cmpgtu_f,"!cmp.gtu(Ns8.new,Rt32)",!(fCAST4u(fNEWREG(NsN))>fCAST4u(RtV)))
+STD_CMPJUMPNEWRS(cmplt_f, "!cmp.gt(Rt32,Ns8.new)", !(RtV>fNEWREG(NsN)))
+STD_CMPJUMPNEWRS(cmpltu_f,"!cmp.gtu(Rt32,Ns8.new)",!(fCAST4u(RtV)>fCAST4u(fNEWREG(NsN))))
+
+
+
+
+
+/*********************************************/
+/* Subroutine Call instructions              */
+/*********************************************/
+
+#define CDIR_STD   A_CALL
+#define CINDIR_STD A_CALL,A_INDIRECT
+
+Q6INSN(J2_call,"call #r22:2",ATTRIBS(CDIR_STD), "direct unconditional call",
+{fIMMEXT(riV); fPCALIGN(riV); fCALL(fREAD_PC()+riV); })
+
+Q6INSN(J2_callt,"if (Pu4) call #r15:2",ATTRIBS(CDIR_STD),"direct conditional call if true",
+{fIMMEXT(riV); fPCALIGN(riV); fBRANCH_SPECULATE_STALL(fLSBOLD(PuV),,SPECULATE_NOT_TAKEN,12,0); if (fLSBOLD(PuV)) { fCALL(fREAD_PC()+riV); }})
+
+Q6INSN(J2_callf,"if (!Pu4) call #r15:2",ATTRIBS(CDIR_STD),"direct conditional call if false",
+{fIMMEXT(riV); fPCALIGN(riV); fBRANCH_SPECULATE_STALL(fLSBOLDNOT(PuV),,SPECULATE_NOT_TAKEN,12,0);if (fLSBOLDNOT(PuV)) { fCALL(fREAD_PC()+riV); }})
+
+Q6INSN(J2_callr,"callr Rs32",ATTRIBS(CINDIR_STD), "indirect unconditional call",
+{ fCALLR(RsV); })
+
+Q6INSN(J2_callrt,"if (Pu4) callr Rs32",ATTRIBS(CINDIR_STD),"indirect conditional call if true",
+{fBRANCH_SPECULATE_STALL(fLSBOLD(PuV),,SPECULATE_NOT_TAKEN,12,0);if (fLSBOLD(PuV)) { fCALLR(RsV); }})
+
+Q6INSN(J2_callrf,"if (!Pu4) callr Rs32",ATTRIBS(CINDIR_STD),"indirect conditional call if false",
+{fBRANCH_SPECULATE_STALL(fLSBOLDNOT(PuV),,SPECULATE_NOT_TAKEN,12,0);if (fLSBOLDNOT(PuV)) { fCALLR(RsV); }})
+
+
+
+
+/*********************************************/
+/* HW Loop instructions                      */
+/*********************************************/
+
+Q6INSN(J2_loop0r,"loop0(#r7:2,Rs32)",ATTRIBS(),"Initialize HW loop 0",
+{ fIMMEXT(riV); fPCALIGN(riV);
+  fWRITE_LOOP_REGS0(/*sa,lc*/ fREAD_PC()+riV, RsV);
+  fSET_LPCFG(0);
+})
+
+Q6INSN(J2_loop1r,"loop1(#r7:2,Rs32)",ATTRIBS(),"Initialize HW loop 1",
+{ fIMMEXT(riV); fPCALIGN(riV);
+  fWRITE_LOOP_REGS1(/*sa,lc*/ fREAD_PC()+riV, RsV);
+})
+
+Q6INSN(J2_loop0i,"loop0(#r7:2,#U10)",ATTRIBS(),"Initialize HW loop 0",
+{ fIMMEXT(riV); fPCALIGN(riV);
+  fWRITE_LOOP_REGS0(/*sa,lc*/ fREAD_PC()+riV, UiV);
+  fSET_LPCFG(0);
+})
+
+Q6INSN(J2_loop1i,"loop1(#r7:2,#U10)",ATTRIBS(),"Initialize HW loop 1",
+{ fIMMEXT(riV); fPCALIGN(riV);
+  fWRITE_LOOP_REGS1(/*sa,lc*/ fREAD_PC()+riV, UiV);
+})
+
+
+Q6INSN(J2_ploop1sr,"p3=sp1loop0(#r7:2,Rs32)",ATTRIBS(A_ARCHV2),"Initialize HW loop 0",
+{ fIMMEXT(riV); fPCALIGN(riV);
+  fWRITE_LOOP_REGS0(/*sa,lc*/ fREAD_PC()+riV, RsV);
+  fSET_LPCFG(1);
+  fWRITE_P3(0);
+})
+Q6INSN(J2_ploop1si,"p3=sp1loop0(#r7:2,#U10)",ATTRIBS(A_ARCHV2),"Initialize HW loop 0",
+{ fIMMEXT(riV); fPCALIGN(riV);
+  fWRITE_LOOP_REGS0(/*sa,lc*/ fREAD_PC()+riV, UiV);
+  fSET_LPCFG(1);
+  fWRITE_P3(0);
+})
+
+Q6INSN(J2_ploop2sr,"p3=sp2loop0(#r7:2,Rs32)",ATTRIBS(A_ARCHV2),"Initialize HW loop 0",
+{ fIMMEXT(riV); fPCALIGN(riV);
+  fWRITE_LOOP_REGS0(/*sa,lc*/ fREAD_PC()+riV, RsV);
+  fSET_LPCFG(2);
+  fWRITE_P3(0);
+})
+Q6INSN(J2_ploop2si,"p3=sp2loop0(#r7:2,#U10)",ATTRIBS(A_ARCHV2),"Initialize HW loop 0",
+{ fIMMEXT(riV); fPCALIGN(riV);
+  fWRITE_LOOP_REGS0(/*sa,lc*/ fREAD_PC()+riV, UiV);
+  fSET_LPCFG(2);
+  fWRITE_P3(0);
+})
+
+Q6INSN(J2_ploop3sr,"p3=sp3loop0(#r7:2,Rs32)",ATTRIBS(A_ARCHV2),"Initialize HW loop 0",
+{ fIMMEXT(riV); fPCALIGN(riV);
+  fWRITE_LOOP_REGS0(/*sa,lc*/ fREAD_PC()+riV, RsV);
+  fSET_LPCFG(3);
+  fWRITE_P3(0);
+})
+Q6INSN(J2_ploop3si,"p3=sp3loop0(#r7:2,#U10)",ATTRIBS(A_ARCHV2),"Initialize HW loop 0",
+{ fIMMEXT(riV); fPCALIGN(riV);
+  fWRITE_LOOP_REGS0(/*sa,lc*/ fREAD_PC()+riV, UiV);
+  fSET_LPCFG(3);
+  fWRITE_P3(0);
+})
+
+
+
+Q6INSN(J2_endloop01,"endloop01",ATTRIBS(A_HWLOOP0_END,A_HWLOOP1_END),"Loopend for inner and outer loop",
+{
+
+  /* V2: With predicate control */
+  if (fGET_LPCFG) {
+    fHIDE( if (fGET_LPCFG >= 2) { /* Nothing */ } else )
+    if (fGET_LPCFG==1) {
+       fWRITE_P3(0xff);
+    }
+    fSET_LPCFG(fGET_LPCFG-1);
+  }
+
+  /* check if iterate */
+  if (fREAD_LC0>1) {
+    fBRANCH(fREAD_SA0,COF_TYPE_LOOPEND0);
+    /* decrement loop count */
+    fWRITE_LC0(fREAD_LC0-1);
+  } else {
+    /* check if iterate */
+    if (fREAD_LC1>1) {
+      fBRANCH(fREAD_SA1,COF_TYPE_LOOPEND1);
+      /* decrement loop count */
+      fWRITE_LC1(fREAD_LC1-1);
+    }
+  }
+
+})
+
+Q6INSN(J2_endloop0,"endloop0",ATTRIBS(A_HWLOOP0_END),"Loopend for inner loop",
+{
+
+  /* V2: With predicate control */
+  if (fGET_LPCFG) {
+    fHIDE( if (fGET_LPCFG >= 2) { /* Nothing */ } else )
+    if (fGET_LPCFG==1) {
+       fWRITE_P3(0xff);
+    }
+    fSET_LPCFG(fGET_LPCFG-1);
+  }
+
+  /* check if iterate */
+  if (fREAD_LC0>1) {
+    fBRANCH(fREAD_SA0,COF_TYPE_LOOPEND0);
+    /* decrement loop count */
+    fWRITE_LC0(fREAD_LC0-1);
+  }
+})
+
+Q6INSN(J2_endloop1,"endloop1",ATTRIBS(A_HWLOOP1_END),"Loopend for outer loop",
+{
+  /* check if iterate */
+  if (fREAD_LC1>1) {
+    fBRANCH(fREAD_SA1,COF_TYPE_LOOPEND1);
+    /* decrement loop count */
+    fWRITE_LC1(fREAD_LC1-1);
+  }
+})
diff --git a/target/hexagon/imported/compare.idef b/target/hexagon/imported/compare.idef
new file mode 100644
index 0000000000..3551467854
--- /dev/null
+++ b/target/hexagon/imported/compare.idef
@@ -0,0 +1,619 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Compare Instructions
+ */
+
+
+
+/*********************************************/
+/* Scalar compare instructions               */
+/*********************************************/
+
+Q6INSN(C2_cmpeq,"Pd4=cmp.eq(Rs32,Rt32)",ATTRIBS(),
+"Compare for Equal",
+{PdV=f8BITSOF(RsV==RtV);})
+
+Q6INSN(C2_cmpgt,"Pd4=cmp.gt(Rs32,Rt32)",ATTRIBS(),
+"Compare for signed Greater Than",
+{PdV=f8BITSOF(RsV>RtV);})
+
+Q6INSN(C2_cmpgtu,"Pd4=cmp.gtu(Rs32,Rt32)",ATTRIBS(),
+"Compare for Greater Than Unsigned",
+{PdV=f8BITSOF(fCAST4u(RsV)>fCAST4u(RtV));})
+
+Q6INSN(C2_cmpeqp,"Pd4=cmp.eq(Rss32,Rtt32)",ATTRIBS(),
+"Compare for Equal",
+{PdV=f8BITSOF(RssV==RttV);})
+
+Q6INSN(C2_cmpgtp,"Pd4=cmp.gt(Rss32,Rtt32)",ATTRIBS(),
+"Compare for signed Greater Than",
+{PdV=f8BITSOF(RssV>RttV);})
+
+Q6INSN(C2_cmpgtup,"Pd4=cmp.gtu(Rss32,Rtt32)",ATTRIBS(),
+"Compare for Greater Than Unsigned",
+{PdV=f8BITSOF(fCAST8u(RssV)>fCAST8u(RttV));})
+
+
+
+
+/*********************************************/
+/* Compare and put result in GPR             */
+/*  typically for function I/O               */
+/*********************************************/
+
+Q6INSN(A4_rcmpeqi,"Rd32=cmp.eq(Rs32,#s8)",ATTRIBS(),
+"Compare for Equal",
+{fIMMEXT(siV); RdV=(RsV==siV); })
+
+Q6INSN(A4_rcmpneqi,"Rd32=!cmp.eq(Rs32,#s8)",ATTRIBS(),
+"Compare for Equal",
+{fIMMEXT(siV); RdV=(RsV!=siV); })
+
+
+Q6INSN(A4_rcmpeq,"Rd32=cmp.eq(Rs32,Rt32)",ATTRIBS(),
+"Compare for Equal",
+{RdV=(RsV==RtV); })
+
+Q6INSN(A4_rcmpneq,"Rd32=!cmp.eq(Rs32,Rt32)",ATTRIBS(),
+"Compare for Equal",
+{RdV=(RsV!=RtV); })
+
+
+
+/*********************************************/
+/* Scalar compare instructions               */
+/*********************************************/
+
+
+Q6INSN(C2_bitsset,"Pd4=bitsset(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Compare for selected bits set",
+{PdV=f8BITSOF((RsV&RtV)==RtV);})
+
+Q6INSN(C2_bitsclr,"Pd4=bitsclr(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Compare for selected bits clear",
+{PdV=f8BITSOF((RsV&RtV)==0);})
+
+
+Q6INSN(C4_nbitsset,"Pd4=!bitsset(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Compare for selected bits set",
+{PdV=f8BITSOF((RsV&RtV)!=RtV);})
+
+Q6INSN(C4_nbitsclr,"Pd4=!bitsclr(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Compare for selected bits clear",
+{PdV=f8BITSOF((RsV&RtV)!=0);})
+
+
+
+/*********************************************/
+/* Scalar compare instructions W/ immediate  */
+/*********************************************/
+
+Q6INSN(C2_cmpeqi,"Pd4=cmp.eq(Rs32,#s10)",ATTRIBS(),
+"Compare for Equal",
+{fIMMEXT(siV); PdV=f8BITSOF(RsV==siV);})
+
+Q6INSN(C2_cmpgti,"Pd4=cmp.gt(Rs32,#s10)",ATTRIBS(),
+"Compare for signed Greater Than",
+{fIMMEXT(siV); PdV=f8BITSOF(RsV>siV);})
+
+Q6INSN(C2_cmpgtui,"Pd4=cmp.gtu(Rs32,#u9)",ATTRIBS(),
+"Compare for Greater Than Unsigned",
+{fIMMEXT(uiV); PdV=f8BITSOF(fCAST4u(RsV)>fCAST4u(uiV));})
+
+Q6INSN(C2_bitsclri,"Pd4=bitsclr(Rs32,#u6)",ATTRIBS(A_ARCHV2),
+"Compare for selected bits clear",
+{PdV=f8BITSOF((RsV&uiV)==0);})
+
+Q6INSN(C4_nbitsclri,"Pd4=!bitsclr(Rs32,#u6)",ATTRIBS(A_ARCHV2),
+"Compare for selected bits clear",
+{PdV=f8BITSOF((RsV&uiV)!=0);})
+
+
+
+
+Q6INSN(C4_cmpneqi,"Pd4=!cmp.eq(Rs32,#s10)",ATTRIBS(), "Compare for Not Equal", {fIMMEXT(siV); PdV=f8BITSOF(RsV!=siV);})
+Q6INSN(C4_cmpltei,"Pd4=!cmp.gt(Rs32,#s10)",ATTRIBS(), "Compare for Less Than or Equal", {fIMMEXT(siV); PdV=f8BITSOF(RsV<=siV);})
+Q6INSN(C4_cmplteui,"Pd4=!cmp.gtu(Rs32,#u9)",ATTRIBS(), "Compare for Less Than or Equal Unsigned", {fIMMEXT(uiV); PdV=f8BITSOF(fCAST4u(RsV)<=fCAST4u(uiV));})
+
+Q6INSN(C4_cmpneq,"Pd4=!cmp.eq(Rs32,Rt32)",ATTRIBS(), "And-Compare for Equal", {PdV=f8BITSOF(RsV!=RtV);})
+Q6INSN(C4_cmplte,"Pd4=!cmp.gt(Rs32,Rt32)",ATTRIBS(), "And-Compare for signed Greater Than", {PdV=f8BITSOF(RsV<=RtV);})
+Q6INSN(C4_cmplteu,"Pd4=!cmp.gtu(Rs32,Rt32)",ATTRIBS(), "And-Compare for Greater Than Unsigned", {PdV=f8BITSOF(fCAST4u(RsV)<=fCAST4u(RtV));})
+
+
+
+
+
+/* Predicate Logical Operations */
+
+Q6INSN(C2_and,"Pd4=and(Pt4,Ps4)",ATTRIBS(A_CRSLOT23),
+"Predicate AND",
+{PdV=PsV & PtV;})
+
+Q6INSN(C2_or,"Pd4=or(Pt4,Ps4)",ATTRIBS(A_CRSLOT23),
+"Predicate OR",
+{PdV=PsV | PtV;})
+
+Q6INSN(C2_xor,"Pd4=xor(Ps4,Pt4)",ATTRIBS(A_CRSLOT23),
+"Predicate XOR",
+{PdV=PsV ^ PtV;})
+
+Q6INSN(C2_andn,"Pd4=and(Pt4,!Ps4)",ATTRIBS(A_CRSLOT23),
+"Predicate AND NOT",
+{PdV=PtV & (~PsV);})
+
+Q6INSN(C2_not,"Pd4=not(Ps4)",ATTRIBS(A_CRSLOT23),
+"Logical NOT Predicate",
+{PdV=~PsV;})
+
+Q6INSN(C2_orn,"Pd4=or(Pt4,!Ps4)",ATTRIBS(A_ARCHV2,A_CRSLOT23),
+"Predicate OR NOT",
+{PdV=PtV | (~PsV);})
+
+
+
+
+
+Q6INSN(C4_and_and,"Pd4=and(Ps4,and(Pt4,Pu4))",ATTRIBS(A_CRSLOT23),
+"Compound And-And", { PdV = PsV & PtV & PuV; })
+
+Q6INSN(C4_and_or,"Pd4=and(Ps4,or(Pt4,Pu4))",ATTRIBS(A_CRSLOT23),
+"Compound And-Or", { PdV = PsV &  (PtV | PuV); })
+
+Q6INSN(C4_or_and,"Pd4=or(Ps4,and(Pt4,Pu4))",ATTRIBS(A_CRSLOT23),
+"Compound Or-And", { PdV = PsV | (PtV & PuV); })
+
+Q6INSN(C4_or_or,"Pd4=or(Ps4,or(Pt4,Pu4))",ATTRIBS(A_CRSLOT23),
+"Compound Or-Or", { PdV = PsV | PtV | PuV; })
+
+
+
+Q6INSN(C4_and_andn,"Pd4=and(Ps4,and(Pt4,!Pu4))",ATTRIBS(A_CRSLOT23),
+"Compound And-And", { PdV = PsV & PtV & (~PuV); })
+
+Q6INSN(C4_and_orn,"Pd4=and(Ps4,or(Pt4,!Pu4))",ATTRIBS(A_CRSLOT23),
+"Compound And-Or", { PdV = PsV &  (PtV | (~PuV)); })
+
+Q6INSN(C4_or_andn,"Pd4=or(Ps4,and(Pt4,!Pu4))",ATTRIBS(A_CRSLOT23),
+"Compound Or-And", { PdV = PsV | (PtV & (~PuV)); })
+
+Q6INSN(C4_or_orn,"Pd4=or(Ps4,or(Pt4,!Pu4))",ATTRIBS(A_CRSLOT23),
+"Compound Or-Or", { PdV = PsV | PtV | (~PuV); })
+
+
+Q6INSN(C2_any8,"Pd4=any8(Ps4)",ATTRIBS(A_CRSLOT23),
+"Logical ANY of low 8 predicate bits",
+{ PsV ? (PdV=0xff) : (PdV=0x00); })
+
+Q6INSN(C2_all8,"Pd4=all8(Ps4)",ATTRIBS(A_CRSLOT23),
+"Logical ALL of low 8 predicate bits",
+{ (PsV==0xff) ? (PdV=0xff) : (PdV=0x00); })
+
+Q6INSN(C2_vitpack,"Rd32=vitpack(Ps4,Pt4)",ATTRIBS(),
+"Pack the odd and even bits of two predicate registers",
+{ RdV = (PsV&0x55) | (PtV&0xAA); })
+
+/* Mux instructions */
+
+Q6INSN(C2_mux,"Rd32=mux(Pu4,Rs32,Rt32)",ATTRIBS(),
+"Scalar MUX",
+{ (fLSBOLD(PuV)) ? (RdV=RsV):(RdV=RtV); })
+
+
+Q6INSN(C2_cmovenewit,"if (Pu4.new) Rd32=#s12",ATTRIBS(A_ARCHV2),
+"Scalar conditional move",
+{ fIMMEXT(siV); if (fLSBNEW(PuN)) RdV=siV; else CANCEL;})
+
+Q6INSN(C2_cmovenewif,"if (!Pu4.new) Rd32=#s12",ATTRIBS(A_ARCHV2),
+"Scalar conditional move",
+{ fIMMEXT(siV); if (fLSBNEWNOT(PuN)) RdV=siV; else CANCEL;})
+
+Q6INSN(C2_cmoveit,"if (Pu4) Rd32=#s12",ATTRIBS(A_ARCHV2),
+"Scalar conditional move",
+{ fIMMEXT(siV); if (fLSBOLD(PuV)) RdV=siV; else CANCEL;})
+
+Q6INSN(C2_cmoveif,"if (!Pu4) Rd32=#s12",ATTRIBS(A_ARCHV2),
+"Scalar conditional move",
+{ fIMMEXT(siV); if (fLSBOLDNOT(PuV)) RdV=siV; else CANCEL;})
+
+
+
+Q6INSN(C2_ccombinewnewt,"if (Pu4.new) Rdd32=combine(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Conditionally combine two words into a register pair",
+{ if (fLSBNEW(PuN)) {
+    fSETWORD(0,RddV,RtV);
+    fSETWORD(1,RddV,RsV);
+  } else {CANCEL;}
+})
+
+Q6INSN(C2_ccombinewnewf,"if (!Pu4.new) Rdd32=combine(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Conditionally combine two words into a register pair",
+{ if (fLSBNEWNOT(PuN)) {
+    fSETWORD(0,RddV,RtV);
+    fSETWORD(1,RddV,RsV);
+  } else {CANCEL;}
+})
+
+Q6INSN(C2_ccombinewt,"if (Pu4) Rdd32=combine(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Conditionally combine two words into a register pair",
+{ if (fLSBOLD(PuV)) {
+    fSETWORD(0,RddV,RtV);
+    fSETWORD(1,RddV,RsV);
+  } else {CANCEL;}
+})
+
+Q6INSN(C2_ccombinewf,"if (!Pu4) Rdd32=combine(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Conditionally combine two words into a register pair",
+{ if (fLSBOLDNOT(PuV)) {
+    fSETWORD(0,RddV,RtV);
+    fSETWORD(1,RddV,RsV);
+  } else {CANCEL;}
+})
+
+
+
+Q6INSN(C2_muxii,"Rd32=mux(Pu4,#s8,#S8)",ATTRIBS(A_ARCHV2),
+"Scalar MUX immediates",
+{ fIMMEXT(siV); (fLSBOLD(PuV)) ? (RdV=siV):(RdV=SiV); })
+
+
+
+Q6INSN(C2_muxir,"Rd32=mux(Pu4,Rs32,#s8)",ATTRIBS(A_ARCHV2),
+"Scalar MUX register immediate",
+{ fIMMEXT(siV); (fLSBOLD(PuV)) ? (RdV=RsV):(RdV=siV); })
+
+
+Q6INSN(C2_muxri,"Rd32=mux(Pu4,#s8,Rs32)",ATTRIBS(A_ARCHV2),
+"Scalar MUX register immediate",
+{ fIMMEXT(siV); (fLSBOLD(PuV)) ? (RdV=siV):(RdV=RsV); })
+
+
+
+Q6INSN(C2_vmux,"Rdd32=vmux(Pu4,Rss32,Rtt32)",ATTRIBS(),
+"Vector MUX",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 8; i++) {
+        fSETBYTE(i,RddV,(fGETBIT(i,PuV)?(fGETBYTE(i,RssV)):(fGETBYTE(i,RttV))));
+    }
+})
+
+Q6INSN(C2_mask,"Rdd32=mask(Pt4)",ATTRIBS(),
+"Vector Mask Generation",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 8; i++) {
+        fSETBYTE(i,RddV,(fGETBIT(i,PtV)?(0xff):(0x00)));
+    }
+})
+
+/* VCMP */
+
+Q6INSN(A2_vcmpbeq,"Pd4=vcmpb.eq(Rss32,Rtt32)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 8; i++) {
+        fSETBIT(i,PdV,(fGETBYTE(i,RssV) == fGETBYTE(i,RttV)));
+    }
+})
+
+Q6INSN(A4_vcmpbeqi,"Pd4=vcmpb.eq(Rss32,#u8)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 8; i++) {
+        fSETBIT(i,PdV,(fGETUBYTE(i,RssV) == uiV));
+    }
+})
+
+Q6INSN(A4_vcmpbeq_any,"Pd4=any8(vcmpb.eq(Rss32,Rtt32))",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    PdV = 0;
+    for (i = 0; i < 8; i++) {
+        if (fGETBYTE(i,RssV) == fGETBYTE(i,RttV)) PdV = 0xff;
+    }
+})
+
+Q6INSN(A6_vcmpbeq_notany,"Pd4=!any8(vcmpb.eq(Rss32,Rtt32))",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    PdV = 0;
+    for (i = 0; i < 8; i++) {
+        if (fGETBYTE(i,RssV) == fGETBYTE(i,RttV)) PdV = 0xff;
+    }
+    PdV = ~PdV;
+})
+
+Q6INSN(A2_vcmpbgtu,"Pd4=vcmpb.gtu(Rss32,Rtt32)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 8; i++) {
+        fSETBIT(i,PdV,(fGETUBYTE(i,RssV) > fGETUBYTE(i,RttV)));
+    }
+})
+
+Q6INSN(A4_vcmpbgtui,"Pd4=vcmpb.gtu(Rss32,#u7)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 8; i++) {
+        fSETBIT(i,PdV,(fGETUBYTE(i,RssV) > uiV));
+    }
+})
+
+Q6INSN(A4_vcmpbgt,"Pd4=vcmpb.gt(Rss32,Rtt32)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 8; i++) {
+        fSETBIT(i,PdV,(fGETBYTE(i,RssV) > fGETBYTE(i,RttV)));
+    }
+})
+
+Q6INSN(A4_vcmpbgti,"Pd4=vcmpb.gt(Rss32,#s8)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 8; i++) {
+        fSETBIT(i,PdV,(fGETBYTE(i,RssV) > siV));
+    }
+})
+
+
+
+Q6INSN(A4_cmpbeq,"Pd4=cmpb.eq(Rs32,Rt32)",ATTRIBS(),
+"Compare bytes ",
+{
+    PdV=f8BITSOF(fGETBYTE(0,RsV) == fGETBYTE(0,RtV));
+})
+
+Q6INSN(A4_cmpbeqi,"Pd4=cmpb.eq(Rs32,#u8)",ATTRIBS(),
+"Compare bytes ",
+{
+    PdV=f8BITSOF(fGETUBYTE(0,RsV) == uiV);
+})
+
+Q6INSN(A4_cmpbgtu,"Pd4=cmpb.gtu(Rs32,Rt32)",ATTRIBS(),
+"Compare bytes ",
+{
+    PdV=f8BITSOF(fGETUBYTE(0,RsV) > fGETUBYTE(0,RtV));
+})
+
+Q6INSN(A4_cmpbgtui,"Pd4=cmpb.gtu(Rs32,#u7)",ATTRIBS(),
+"Compare bytes ",
+{
+    fIMMEXT(uiV);
+    PdV=f8BITSOF(fGETUBYTE(0,RsV) > fCAST4u(uiV));
+})
+
+Q6INSN(A4_cmpbgt,"Pd4=cmpb.gt(Rs32,Rt32)",ATTRIBS(),
+"Compare bytes ",
+{
+    PdV=f8BITSOF(fGETBYTE(0,RsV) > fGETBYTE(0,RtV));
+})
+
+Q6INSN(A4_cmpbgti,"Pd4=cmpb.gt(Rs32,#s8)",ATTRIBS(),
+"Compare bytes ",
+{
+    PdV=f8BITSOF(fGETBYTE(0,RsV) > siV);
+})
+
+Q6INSN(A2_vcmpheq,"Pd4=vcmph.eq(Rss32,Rtt32)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 4; i++) {
+        fSETBIT(i*2,PdV,  (fGETHALF(i,RssV) == fGETHALF(i,RttV)));
+        fSETBIT(i*2+1,PdV,(fGETHALF(i,RssV) == fGETHALF(i,RttV)));
+    }
+})
+
+Q6INSN(A2_vcmphgt,"Pd4=vcmph.gt(Rss32,Rtt32)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 4; i++) {
+        fSETBIT(i*2,  PdV,  (fGETHALF(i,RssV) > fGETHALF(i,RttV)));
+        fSETBIT(i*2+1,PdV,  (fGETHALF(i,RssV) > fGETHALF(i,RttV)));
+    }
+})
+
+Q6INSN(A2_vcmphgtu,"Pd4=vcmph.gtu(Rss32,Rtt32)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 4; i++) {
+        fSETBIT(i*2,  PdV,  (fGETUHALF(i,RssV) > fGETUHALF(i,RttV)));
+        fSETBIT(i*2+1,PdV,  (fGETUHALF(i,RssV) > fGETUHALF(i,RttV)));
+    }
+})
+
+Q6INSN(A4_vcmpheqi,"Pd4=vcmph.eq(Rss32,#s8)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 4; i++) {
+        fSETBIT(i*2,PdV,  (fGETHALF(i,RssV) == siV));
+        fSETBIT(i*2+1,PdV,(fGETHALF(i,RssV) == siV));
+    }
+})
+
+Q6INSN(A4_vcmphgti,"Pd4=vcmph.gt(Rss32,#s8)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 4; i++) {
+        fSETBIT(i*2,  PdV,  (fGETHALF(i,RssV) > siV));
+        fSETBIT(i*2+1,PdV,  (fGETHALF(i,RssV) > siV));
+    }
+})
+
+
+Q6INSN(A4_vcmphgtui,"Pd4=vcmph.gtu(Rss32,#u7)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 4; i++) {
+        fSETBIT(i*2,  PdV,  (fGETUHALF(i,RssV) > uiV));
+        fSETBIT(i*2+1,PdV,  (fGETUHALF(i,RssV) > uiV));
+    }
+})
+
+Q6INSN(A4_cmpheq,"Pd4=cmph.eq(Rs32,Rt32)",ATTRIBS(),
+"Compare halfwords ",
+{
+    PdV=f8BITSOF(fGETHALF(0,RsV) == fGETHALF(0,RtV));
+})
+
+Q6INSN(A4_cmphgt,"Pd4=cmph.gt(Rs32,Rt32)",ATTRIBS(),
+"Compare halfwords ",
+{
+    PdV=f8BITSOF(fGETHALF(0,RsV) > fGETHALF(0,RtV));
+})
+
+Q6INSN(A4_cmphgtu,"Pd4=cmph.gtu(Rs32,Rt32)",ATTRIBS(),
+"Compare halfwords ",
+{
+    PdV=f8BITSOF(fGETUHALF(0,RsV) > fGETUHALF(0,RtV));
+})
+
+Q6INSN(A4_cmpheqi,"Pd4=cmph.eq(Rs32,#s8)",ATTRIBS(),
+"Compare halfwords ",
+{
+    fIMMEXT(siV);
+    PdV=f8BITSOF(fGETHALF(0,RsV) == siV);
+})
+
+Q6INSN(A4_cmphgti,"Pd4=cmph.gt(Rs32,#s8)",ATTRIBS(),
+"Compare halfwords ",
+{
+    fIMMEXT(siV);
+    PdV=f8BITSOF(fGETHALF(0,RsV) > siV);
+})
+
+Q6INSN(A4_cmphgtui,"Pd4=cmph.gtu(Rs32,#u7)",ATTRIBS(),
+"Compare halfwords ",
+{
+    fIMMEXT(uiV);
+    PdV=f8BITSOF(fGETUHALF(0,RsV) > fCAST4u(uiV));
+})
+
+Q6INSN(A2_vcmpweq,"Pd4=vcmpw.eq(Rss32,Rtt32)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fSETBITS(3,0,PdV,(fGETWORD(0,RssV)==fGETWORD(0,RttV)));
+    fSETBITS(7,4,PdV,(fGETWORD(1,RssV)==fGETWORD(1,RttV)));
+})
+
+Q6INSN(A2_vcmpwgt,"Pd4=vcmpw.gt(Rss32,Rtt32)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fSETBITS(3,0,PdV,(fGETWORD(0,RssV)>fGETWORD(0,RttV)));
+    fSETBITS(7,4,PdV,(fGETWORD(1,RssV)>fGETWORD(1,RttV)));
+})
+
+Q6INSN(A2_vcmpwgtu,"Pd4=vcmpw.gtu(Rss32,Rtt32)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fSETBITS(3,0,PdV,(fGETUWORD(0,RssV)>fGETUWORD(0,RttV)));
+    fSETBITS(7,4,PdV,(fGETUWORD(1,RssV)>fGETUWORD(1,RttV)));
+})
+
+Q6INSN(A4_vcmpweqi,"Pd4=vcmpw.eq(Rss32,#s8)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fSETBITS(3,0,PdV,(fGETWORD(0,RssV)==siV));
+    fSETBITS(7,4,PdV,(fGETWORD(1,RssV)==siV));
+})
+
+Q6INSN(A4_vcmpwgti,"Pd4=vcmpw.gt(Rss32,#s8)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fSETBITS(3,0,PdV,(fGETWORD(0,RssV)>siV));
+    fSETBITS(7,4,PdV,(fGETWORD(1,RssV)>siV));
+})
+
+Q6INSN(A4_vcmpwgtui,"Pd4=vcmpw.gtu(Rss32,#u7)",ATTRIBS(),
+"Compare elements of two vectors ",
+{
+    fSETBITS(3,0,PdV,(fGETUWORD(0,RssV)>fCAST4u(uiV)));
+    fSETBITS(7,4,PdV,(fGETUWORD(1,RssV)>fCAST4u(uiV)));
+})
+
+Q6INSN(A4_boundscheck_hi,"Pd4=boundscheck(Rss32,Rtt32):raw:hi",ATTRIBS(),
+"Detect if a register is within bounds",
+{
+    fHIDE(size4u_t src;)
+    src = fGETUWORD(1,RssV);
+    PdV = f8BITSOF((fCAST4u(src) >= fGETUWORD(0,RttV)) && (fCAST4u(src) < fGETUWORD(1,RttV)));
+})
+
+Q6INSN(A4_boundscheck_lo,"Pd4=boundscheck(Rss32,Rtt32):raw:lo",ATTRIBS(),
+"Detect if a register is within bounds",
+{
+    fHIDE(size4u_t src;)
+    src = fGETUWORD(0,RssV);
+    PdV = f8BITSOF((fCAST4u(src) >= fGETUWORD(0,RttV)) && (fCAST4u(src) < fGETUWORD(1,RttV)));
+})
+
+Q6INSN(A4_tlbmatch,"Pd4=tlbmatch(Rss32,Rt32)",ATTRIBS(),
+"Detect if a VA/ASID matches a TLB entry",
+{
+    fHIDE(size4u_t TLBHI; size4u_t TLBLO; size4u_t MASK; size4u_t SIZE;)
+    MASK = 0x07ffffff;
+    TLBLO = fGETUWORD(0,RssV);
+    TLBHI = fGETUWORD(1,RssV);
+    SIZE = fMIN(6,fCL1_4(~fBREV_4(TLBLO)));
+    MASK &= (0xffffffff << 2*SIZE);
+    PdV = f8BITSOF(fGETBIT(31,TLBHI) && ((TLBHI & MASK) == (RtV & MASK)));
+})
+
+Q6INSN(C2_tfrpr,"Rd32=Ps4",ATTRIBS(),
+"Transfer predicate to general register", { RdV = fZXTN(8,32,PsV); })
+
+Q6INSN(C2_tfrrp,"Pd4=Rs32",ATTRIBS(),
+"Transfer general register to Predicate", { PdV = fGETUBYTE(0,RsV); })
+
+Q6INSN(C4_fastcorner9,"Pd4=fastcorner9(Ps4,Pt4)",ATTRIBS(A_CRSLOT23),
+"Determine whether the predicate sources define a corner",
+{
+    fHIDE(size4u_t tmp = 0; size4u_t i;)
+    fSETHALF(0,tmp,(PsV<<8)|PtV);
+    fSETHALF(1,tmp,(PsV<<8)|PtV);
+    for (i = 1; i < 9; i++) {
+        tmp &= tmp >> 1;
+    }
+    PdV = f8BITSOF(tmp != 0);
+})
+
+Q6INSN(C4_fastcorner9_not,"Pd4=!fastcorner9(Ps4,Pt4)",ATTRIBS(A_CRSLOT23),
+"Determine whether the predicate sources define a corner",
+{
+    fHIDE(size4u_t tmp = 0; size4u_t i;)
+    fSETHALF(0,tmp,(PsV<<8)|PtV);
+    fSETHALF(1,tmp,(PsV<<8)|PtV);
+    for (i = 1; i < 9; i++) {
+        tmp &= tmp >> 1;
+    }
+    PdV = f8BITSOF(tmp == 0);
+})
diff --git a/target/hexagon/imported/encode.def b/target/hexagon/imported/encode.def
new file mode 100644
index 0000000000..b9368d1284
--- /dev/null
+++ b/target/hexagon/imported/encode.def
@@ -0,0 +1,124 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * This just includes all encoding files
+ */
+
+#ifndef DEF_FIELD32
+#define __SELF_DEF_FIELD32
+#define DEF_FIELD32(...) /* nothing */
+#endif
+
+#ifndef DEF_CLASS32
+#define __SELF_DEF_CLASS32
+#define DEF_CLASS32(...) /* nothing */
+#endif
+
+#ifndef DEF_ANTICLASS32
+#define __SELF_DEF_ANTICLASS32
+#define DEF_ANTICLASS32(...) /* nothing */
+#endif
+
+#ifndef LEGACY_DEF_ENC32
+#define __SELF_DEF_LEGACY_DEF_ENC32
+#define LEGACY_DEF_ENC32(...) /* nothing */
+#endif
+
+#ifndef DEF_FIELDROW_DESC32
+#define __SELF_DEF_FIELDROW_DESC32
+#define DEF_FIELDROW_DESC32(...) /* nothing */
+#endif
+
+#ifndef DEF_ENC32
+#define __SELF_DEF_ENC32
+#define DEF_ENC32(...) /* nothing */
+#endif
+
+#ifndef DEF_PACKED32
+#define __SELF_DEF_PACKED32
+#define DEF_PACKED32(...) /* nothing */
+#endif
+
+#ifndef DEF_ENC_SUBINSN
+#define __SELF_DEF_ENC_SUBINSN
+#define DEF_ENC_SUBINSN(...) /* nothing */
+#endif
+
+#ifndef DEF_EXT_ENC
+#define __SELF_DEF_EXT_ENC
+#define DEF_EXT_ENC(...) /* nothing */
+#endif
+
+#ifndef DEF_EXT_SPACE
+#define __SELF_DEF_EXT_SPACE
+#define DEF_EXT_SPACE(...) /* nothing */
+#endif
+
+#include "encode_pp.def"
+#include "encode_subinsn.def"
+
+#ifdef __SELF_DEF_FIELD32
+#undef __SELF_DEF_FIELD32
+#undef DEF_FIELD32
+#endif
+
+#ifdef __SELF_DEF_CLASS32
+#undef __SELF_DEF_CLASS32
+#undef DEF_CLASS32
+#endif
+
+#ifdef __SELF_DEF_ANTICLASS32
+#undef __SELF_DEF_ANTICLASS32
+#undef DEF_ANTICLASS32
+#endif
+
+#ifdef __SELF_DEF_LEGACY_DEF_ENC32
+#undef __SELF_DEF_LEGACY_DEF_ENC32
+#undef LEGACY_DEF_ENC32
+#endif
+
+#ifdef __SELF_DEF_FIELDROW_DESC32
+#undef __SELF_DEF_FIELDROW_DESC32
+#undef DEF_FIELDROW_DESC32
+#endif
+
+#ifdef __SELF_DEF_ENC32
+#undef __SELF_DEF_ENC32
+#undef DEF_ENC32
+#endif
+
+#ifdef __SELF_DEF_EXT_SPACE
+#undef __SELF_DEF_EXT_SPACE
+#undef DEF_EXT_SPACE
+#endif
+
+
+#ifdef __SELF_DEF_PACKED32
+#undef __SELF_DEF_PACKED32
+#undef DEF_PACKED32
+#endif
+
+#ifdef __SELF_DEF_ENC_SUBINSN
+#undef __SELF_DEF_ENC_SUBINSN
+#undef DEF_ENC_SUBINSN
+#endif
+
+#ifdef __SELF_DEF_EXT_ENC
+#undef __SELF_DEF_EXT_ENC
+#undef DEF_EXT_ENC
+#endif
diff --git a/target/hexagon/imported/encode_pp.def b/target/hexagon/imported/encode_pp.def
new file mode 100644
index 0000000000..c21cb730af
--- /dev/null
+++ b/target/hexagon/imported/encode_pp.def
@@ -0,0 +1,2110 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Encodings for 32 bit instructions
+ *
+ */
+
+
+
+
+DEF_CLASS32("---- ---- -------- PP------ --------",ALL_PP)
+DEF_FIELD32("---- ---- -------- !!------ --------",Parse,"Packet/Loop parse bits")
+DEF_FIELD32("!!!! ---- -------- PP------ --------",ICLASS,"Instruction Class")
+
+#define ICLASS_EXTENDER   "0000"
+#define ICLASS_CJ         "0001"
+#define ICLASS_NCJ        "0010"
+#define ICLASS_V4LDST     "0011"
+#define ICLASS_V2LDST     "0100"
+#define ICLASS_J          "0101"
+#define ICLASS_CR         "0110"
+#define ICLASS_ALU2op     "0111"
+#define ICLASS_S2op       "1000"
+#define ICLASS_LD         "1001"
+#define ICLASS_ST         "1010"
+#define ICLASS_ADDI       "1011"
+#define ICLASS_S3op       "1100"
+#define ICLASS_ALU64      "1101"
+#define ICLASS_M          "1110"
+#define ICLASS_ALU3op     "1111"
+
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*     V4 Immediate Payload    */
+/*                             */
+/*                             */
+/*******************************/
+
+DEF_CLASS32(ICLASS_EXTENDER" ---- -------- PP------ --------",EXTENDER)
+DEF_ENC32(A4_ext, ICLASS_EXTENDER "iiii iiiiiiii PPiiiiii iiiiiiii")
+
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*     V2 PREDICATED LD/ST     */
+/*                             */
+/*                             */
+/*******************************/
+
+DEF_CLASS32(ICLASS_V2LDST" ---- -------- PP------ --------",V2LDST)
+DEF_CLASS32(ICLASS_V2LDST" ---1 -------- PP------ --------",V2LD)
+DEF_CLASS32(ICLASS_V2LDST" ---0 -------- PP------ --------",V2ST)
+DEF_CLASS32(ICLASS_V2LDST" 0--1 -------- PP------ --------",PLD)
+DEF_CLASS32(ICLASS_V2LDST" 0--0 -------- PP------ --------",PST)
+DEF_CLASS32(ICLASS_V2LDST" 1--1 -------- PP------ --------",GPLD)
+DEF_CLASS32(ICLASS_V2LDST" 1--0 -------- PP------ --------",GPST)
+
+DEF_FIELD32(ICLASS_V2LDST" 0!-- -------- PP------ --------",PMEM_Sense,"Sense")
+DEF_FIELD32(ICLASS_V2LDST" 0-!- -------- PP------ --------",PMEM_PredNew,"PredNew")
+DEF_FIELD32(ICLASS_V2LDST" ---1 !!------ PP------ --------",PMEML_Type,"Type")
+DEF_FIELD32(ICLASS_V2LDST" ---1 --!----- PP------ --------",PMEML_UN,"Unsigned")
+DEF_FIELD32(ICLASS_V2LDST" ---0 !!!----- PP------ --------",PMEMS_Type,"Type")
+
+#define STD_PLD_IOENC(TAG,OPC) \
+DEF_ENC32(L2_pload##TAG##t_io,   ICLASS_V2LDST" 0001 "OPC"  sssss  PP0ttiii  iiiddddd")\
+DEF_ENC32(L2_pload##TAG##f_io,   ICLASS_V2LDST" 0101 "OPC"  sssss  PP0ttiii  iiiddddd")\
+DEF_ENC32(L2_pload##TAG##tnew_io,ICLASS_V2LDST" 0011 "OPC"  sssss  PP0ttiii  iiiddddd")\
+DEF_ENC32(L2_pload##TAG##fnew_io,ICLASS_V2LDST" 0111 "OPC"  sssss  PP0ttiii  iiiddddd")
+
+STD_PLD_IOENC(rb,  "000")
+STD_PLD_IOENC(rub, "001")
+STD_PLD_IOENC(rh,  "010")
+STD_PLD_IOENC(ruh, "011")
+STD_PLD_IOENC(ri,  "100")
+STD_PLD_IOENC(rd,  "110") /* note dest reg field LSB=0, 1 is reserved */
+
+
+
+#define STD_PST_IOENC(TAG,OPC,SRC) \
+DEF_ENC32(S2_pstore##TAG##t_io,   ICLASS_V2LDST" 0000 "OPC"  sssss  PPi"SRC"  iiiii0vv")\
+DEF_ENC32(S2_pstore##TAG##f_io,   ICLASS_V2LDST" 0100 "OPC"  sssss  PPi"SRC"  iiiii0vv")\
+DEF_ENC32(S4_pstore##TAG##tnew_io,ICLASS_V2LDST" 0010 "OPC"  sssss  PPi"SRC"  iiiii0vv")\
+DEF_ENC32(S4_pstore##TAG##fnew_io,ICLASS_V2LDST" 0110 "OPC"  sssss  PPi"SRC"  iiiii0vv")
+
+STD_PST_IOENC(rb,    "000","ttttt")
+STD_PST_IOENC(rh,    "010","ttttt")
+STD_PST_IOENC(rf,    "011","ttttt")
+STD_PST_IOENC(ri,    "100","ttttt")
+STD_PST_IOENC(rd,    "110","ttttt")
+STD_PST_IOENC(rbnew, "101","00ttt")
+STD_PST_IOENC(rhnew, "101","01ttt")
+STD_PST_IOENC(rinew, "101","10ttt")
+
+
+
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*     V2 GP-RELATIVE LD/ST    */
+/*                             */
+/*                             */
+/*******************************/
+#define STD_LD_GP(TAG,OPC) \
+DEF_ENC32(L2_load##TAG##gp,   ICLASS_V2LDST" 1ii1 "OPC"  iiiii  PPiiiiii  iiiddddd")
+
+STD_LD_GP(rb,  "000")
+STD_LD_GP(rub, "001")
+STD_LD_GP(rh,  "010")
+STD_LD_GP(ruh, "011")
+STD_LD_GP(ri,  "100")
+STD_LD_GP(rd,  "110") /* note dest reg field LSB=0, 1 is reserved */
+
+#define STD_ST_GP(TAG,OPC,SRC) \
+DEF_ENC32(S2_store##TAG##gp,  ICLASS_V2LDST" 1ii0 "OPC"  iiiii  PPi"SRC"  iiiiiiii")
+
+STD_ST_GP(rb,   "000","ttttt")
+STD_ST_GP(rh,   "010","ttttt")
+STD_ST_GP(rf,   "011","ttttt")
+STD_ST_GP(ri,   "100","ttttt")
+STD_ST_GP(rd,   "110","ttttt")
+STD_ST_GP(rbnew,"101","00ttt")
+STD_ST_GP(rhnew,"101","01ttt")
+STD_ST_GP(rinew,"101","10ttt")
+
+
+
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*     V4LDST                  */
+/*                             */
+/*                             */
+/*******************************/
+
+
+DEF_CLASS32(ICLASS_V4LDST" ---- -------- PP------ --------",V4LDST)
+DEF_CLASS32(ICLASS_V4LDST" 0--- -------- PP------ --------",Pred_RplusR)
+DEF_CLASS32(ICLASS_V4LDST" 100- -------- PP------ --------",Pred_StoreImmed)
+DEF_CLASS32(ICLASS_V4LDST" 101- -------- PP------ --------",RplusR)
+DEF_CLASS32(ICLASS_V4LDST" 110- -------- PP------ --------",StoreImmed)
+DEF_CLASS32(ICLASS_V4LDST" 111- -------- PP------ --------",MemOp)
+
+
+
+
+/*******************************/
+/*    Pred (R+R)               */
+/*******************************/
+
+#define STD_PLD_RRENC(TAG,OPC) \
+DEF_ENC32(L4_pload##TAG##t_rr,   ICLASS_V4LDST" 00 00 "OPC"  sssss  PPittttt  ivvddddd")\
+DEF_ENC32(L4_pload##TAG##f_rr,   ICLASS_V4LDST" 00 01 "OPC"  sssss  PPittttt  ivvddddd")\
+DEF_ENC32(L4_pload##TAG##tnew_rr,ICLASS_V4LDST" 00 10 "OPC"  sssss  PPittttt  ivvddddd")\
+DEF_ENC32(L4_pload##TAG##fnew_rr,ICLASS_V4LDST" 00 11 "OPC"  sssss  PPittttt  ivvddddd")
+
+STD_PLD_RRENC(rb,  "000")
+STD_PLD_RRENC(rub, "001")
+STD_PLD_RRENC(rh,  "010")
+STD_PLD_RRENC(ruh, "011")
+STD_PLD_RRENC(ri,  "100")
+STD_PLD_RRENC(rd,  "110")
+
+#define STD_PST_RRENC(TAG,OPC,SRC) \
+DEF_ENC32(S4_pstore##TAG##t_rr,   ICLASS_V4LDST" 01 00 "OPC"  sssss  PPiuuuuu  ivv"SRC)\
+DEF_ENC32(S4_pstore##TAG##f_rr,   ICLASS_V4LDST" 01 01 "OPC"  sssss  PPiuuuuu  ivv"SRC)\
+DEF_ENC32(S4_pstore##TAG##tnew_rr,ICLASS_V4LDST" 01 10 "OPC"  sssss  PPiuuuuu  ivv"SRC)\
+DEF_ENC32(S4_pstore##TAG##fnew_rr,ICLASS_V4LDST" 01 11 "OPC"  sssss  PPiuuuuu  ivv"SRC)
+
+STD_PST_RRENC(rb,    "000","ttttt")
+STD_PST_RRENC(rh,    "010","ttttt")
+STD_PST_RRENC(rf,    "011","ttttt")
+STD_PST_RRENC(ri,    "100","ttttt")
+STD_PST_RRENC(rd,    "110","ttttt")
+STD_PST_RRENC(rbnew, "101","00ttt")
+STD_PST_RRENC(rhnew, "101","01ttt")
+STD_PST_RRENC(rinew, "101","10ttt")
+
+
+
+/*******************************/
+/*     Pred Store immediates   */
+/*******************************/
+
+#define V4_PSTI(TAG,OPC) \
+DEF_ENC32(S4_storei##TAG##t_io,    ICLASS_V4LDST" 100 00  "OPC"  sssss  PPIiiiii  ivvIIIII")\
+DEF_ENC32(S4_storei##TAG##f_io,    ICLASS_V4LDST" 100 01  "OPC"  sssss  PPIiiiii  ivvIIIII")\
+DEF_ENC32(S4_storei##TAG##tnew_io, ICLASS_V4LDST" 100 10  "OPC"  sssss  PPIiiiii  ivvIIIII")\
+DEF_ENC32(S4_storei##TAG##fnew_io, ICLASS_V4LDST" 100 11  "OPC"  sssss  PPIiiiii  ivvIIIII")
+
+V4_PSTI(rb, "00")
+V4_PSTI(rh, "01")
+V4_PSTI(ri, "10")
+
+
+
+/*******************************/
+/*    (R+R)                    */
+/*******************************/
+
+#define STD_LD_RRENC(TAG,OPC) \
+DEF_ENC32(L4_load##TAG##_rr,     ICLASS_V4LDST" 1010 "OPC"  sssss  PPittttt  i--ddddd")
+
+STD_LD_RRENC(rb,  "000")
+STD_LD_RRENC(rub, "001")
+STD_LD_RRENC(rh,  "010")
+STD_LD_RRENC(ruh, "011")
+STD_LD_RRENC(ri,  "100")
+STD_LD_RRENC(rd,  "110")
+
+#define STD_ST_RRENC(TAG,OPC,SRC) \
+DEF_ENC32(S4_store##TAG##_rr,     ICLASS_V4LDST" 1011 "OPC"  sssss  PPiuuuuu  i--"SRC)
+
+STD_ST_RRENC(rb,    "000","ttttt")
+STD_ST_RRENC(rh,    "010","ttttt")
+STD_ST_RRENC(rf,    "011","ttttt")
+STD_ST_RRENC(ri,    "100","ttttt")
+STD_ST_RRENC(rd,    "110","ttttt")
+STD_ST_RRENC(rbnew, "101","00ttt")
+STD_ST_RRENC(rhnew, "101","01ttt")
+STD_ST_RRENC(rinew, "101","10ttt")
+
+
+
+
+/*******************************/
+/*     Store immediates        */
+/*******************************/
+
+#define V4_STI(TAG,OPC) \
+DEF_ENC32(S4_storei##TAG##_io,     ICLASS_V4LDST" 110 -- "OPC"  sssss  PPIiiiii  iIIIIIII")
+
+
+V4_STI(rb, "00")
+V4_STI(rh, "01")
+V4_STI(ri, "10")
+
+
+/*******************************/
+/*     Memops                 */
+/*******************************/
+
+#define MEMOPENC(TAG,OPC) \
+DEF_ENC32(L4_add_##TAG##_io,         ICLASS_V4LDST" 111 0- " OPC "sssss  PP0iiiii  i00ttttt")\
+DEF_ENC32(L4_sub_##TAG##_io,         ICLASS_V4LDST" 111 0- " OPC "sssss  PP0iiiii  i01ttttt")\
+DEF_ENC32(L4_and_##TAG##_io,         ICLASS_V4LDST" 111 0- " OPC "sssss  PP0iiiii  i10ttttt")\
+DEF_ENC32(L4_or_##TAG##_io,          ICLASS_V4LDST" 111 0- " OPC "sssss  PP0iiiii  i11ttttt")\
+\
+DEF_ENC32(L4_iadd_##TAG##_io,        ICLASS_V4LDST" 111 1- " OPC "sssss  PP0iiiii  i00IIIII")\
+DEF_ENC32(L4_isub_##TAG##_io,        ICLASS_V4LDST" 111 1- " OPC "sssss  PP0iiiii  i01IIIII")\
+DEF_ENC32(L4_iand_##TAG##_io,        ICLASS_V4LDST" 111 1- " OPC "sssss  PP0iiiii  i10IIIII")\
+DEF_ENC32(L4_ior_##TAG##_io,         ICLASS_V4LDST" 111 1- " OPC "sssss  PP0iiiii  i11IIIII")
+
+
+
+MEMOPENC(memopw,"10")
+MEMOPENC(memoph,"01")
+MEMOPENC(memopb,"00")
+
+
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*           LOAD              */
+/*                             */
+/*                             */
+/*******************************/
+DEF_CLASS32(ICLASS_LD" ---- -------- PP------ --------",LD)
+
+
+DEF_CLASS32(ICLASS_LD" 0--- -------- PP------ --------",LD_ADDR_ROFFSET)
+DEF_CLASS32(ICLASS_LD" 101- -------- PP00---- --------",LD_ADDR_POST_IMMED)
+DEF_CLASS32(ICLASS_LD" 101- -------- PP01---- --------",LD_ADDR_ABS_UPDATE_V4)
+DEF_CLASS32(ICLASS_LD" 101- -------- PP1----- --------",LD_ADDR_POST_IMMED_PRED_V2)
+DEF_CLASS32(ICLASS_LD" 110- -------- PP-0---- 0-------",LD_ADDR_POST_REG)
+DEF_CLASS32(ICLASS_LD" 110- -------- PP-1---- --------",LD_ADDR_ABS_PLUS_REG_V4)
+DEF_CLASS32(ICLASS_LD" 100- -------- PP----1- --------",LD_ADDR_POST_CREG_V2)
+DEF_CLASS32(ICLASS_LD" 111- -------- PP------ 1-------",LD_ADDR_PRED_ABS_V4)
+
+DEF_FIELD32(ICLASS_LD" !!!- -------- PP------ --------",LD_Amode,"Amode")
+DEF_FIELD32(ICLASS_LD" ---! !!------ PP------ --------",LD_Type,"Type")
+DEF_FIELD32(ICLASS_LD" ---- --!----- PP------ --------",LD_UN,"Unsigned")
+
+#define STD_LD_ENC(TAG,OPC) \
+DEF_ENC32(L2_load##TAG##_io,   ICLASS_LD" 0 ii "OPC"  sssss  PPiiiiii  iiiddddd")\
+DEF_ENC32(L2_load##TAG##_pi,   ICLASS_LD" 1 01 "OPC"  xxxxx  PP00---i  iiiddddd")\
+DEF_ENC32(L4_load##TAG##_ap,   ICLASS_LD" 1 01 "OPC"  eeeee  PP01IIII  -IIddddd")\
+DEF_ENC32(L2_load##TAG##_pr,   ICLASS_LD" 1 10 "OPC"  xxxxx  PPu0----  0--ddddd")\
+DEF_ENC32(L4_load##TAG##_ur,   ICLASS_LD" 1 10 "OPC"  ttttt  PPi1IIII  iIIddddd")\
+
+
+#define STD_LDX_ENC(TAG,OPC) \
+DEF_ENC32(L2_load##TAG##_io,   ICLASS_LD" 0 ii "OPC"  sssss  PPiiiiii  iiiyyyyy")\
+DEF_ENC32(L2_load##TAG##_pi,   ICLASS_LD" 1 01 "OPC"  xxxxx  PP00---i  iiiyyyyy")\
+DEF_ENC32(L4_load##TAG##_ap,   ICLASS_LD" 1 01 "OPC"  eeeee  PP01IIII  -IIyyyyy")\
+DEF_ENC32(L2_load##TAG##_pr,   ICLASS_LD" 1 10 "OPC"  xxxxx  PPu0----  0--yyyyy")\
+DEF_ENC32(L4_load##TAG##_ur,   ICLASS_LD" 1 10 "OPC"  ttttt  PPi1IIII  iIIyyyyy")\
+
+
+#define STD_PLD_ENC(TAG,OPC) \
+DEF_ENC32(L2_pload##TAG##t_pi,    ICLASS_LD" 1 01 "OPC"  xxxxx  PP100tti  iiiddddd")\
+DEF_ENC32(L2_pload##TAG##f_pi,    ICLASS_LD" 1 01 "OPC"  xxxxx  PP101tti  iiiddddd")\
+DEF_ENC32(L2_pload##TAG##tnew_pi, ICLASS_LD" 1 01 "OPC"  xxxxx  PP110tti  iiiddddd")\
+DEF_ENC32(L2_pload##TAG##fnew_pi, ICLASS_LD" 1 01 "OPC"  xxxxx  PP111tti  iiiddddd")\
+DEF_ENC32(L4_pload##TAG##t_abs,   ICLASS_LD" 1 11 "OPC"  iiiii  PP100tti  1--ddddd")\
+DEF_ENC32(L4_pload##TAG##f_abs,   ICLASS_LD" 1 11 "OPC"  iiiii  PP101tti  1--ddddd")\
+DEF_ENC32(L4_pload##TAG##tnew_abs,ICLASS_LD" 1 11 "OPC"  iiiii  PP110tti  1--ddddd")\
+DEF_ENC32(L4_pload##TAG##fnew_abs,ICLASS_LD" 1 11 "OPC"  iiiii  PP111tti  1--ddddd")
+
+
+/*               0 000  misc: dealloc,loadw_locked,dcfetch      */
+STD_LD_ENC(rb,  "1 000")
+STD_LD_ENC(rub, "1 001")
+STD_LD_ENC(rh,  "1 010")
+STD_LD_ENC(ruh, "1 011")
+STD_LD_ENC(ri,  "1 100")
+STD_LD_ENC(rd,  "1 110") /* note dest reg field LSB=0, 1 is reserved */
+
+STD_PLD_ENC(rb,  "1 000")
+STD_PLD_ENC(rub, "1 001")
+STD_PLD_ENC(rh,  "1 010")
+STD_PLD_ENC(ruh, "1 011")
+STD_PLD_ENC(ri,  "1 100")
+STD_PLD_ENC(rd,  "1 110") /* note dest reg field LSB=0, 1 is reserved */
+
+
+DEF_CLASS32(    ICLASS_LD" 0--0 000----- PP------ --------",LD_MISC)
+DEF_ANTICLASS32(ICLASS_LD" 0--0 000----- PP------ --------",LD_ADDR_ROFFSET)
+DEF_ANTICLASS32(ICLASS_LD" 1010 000----- PP------ --------",LD_ADDR_POST_IMMED)
+DEF_ANTICLASS32(ICLASS_LD" 1100 000----- PP------ --------",LD_ADDR_POST_REG)
+DEF_ANTICLASS32(ICLASS_LD" 1110 000----- PP------ --------",LD_ADDR_POST_REG)
+
+DEF_ENC32(L2_deallocframe,    ICLASS_LD" 000 0 000 sssss PP0----- ---ddddd")
+DEF_ENC32(L4_return,          ICLASS_LD" 011 0 000 sssss PP0000-- ---ddddd")
+DEF_ENC32(L4_return_t,        ICLASS_LD" 011 0 000 sssss PP0100vv ---ddddd")
+DEF_ENC32(L4_return_f,        ICLASS_LD" 011 0 000 sssss PP1100vv ---ddddd")
+DEF_ENC32(L4_return_tnew_pt,  ICLASS_LD" 011 0 000 sssss PP0110vv ---ddddd")
+DEF_ENC32(L4_return_fnew_pt,  ICLASS_LD" 011 0 000 sssss PP1110vv ---ddddd")
+DEF_ENC32(L4_return_tnew_pnt, ICLASS_LD" 011 0 000 sssss PP0010vv ---ddddd")
+DEF_ENC32(L4_return_fnew_pnt, ICLASS_LD" 011 0 000 sssss PP1010vv ---ddddd")
+
+DEF_ENC32(L2_loadw_locked,ICLASS_LD" 001 0 000 sssss PP00---- -00ddddd")
+
+
+
+
+
+
+DEF_ENC32(L4_loadd_locked,ICLASS_LD" 001 0 000 sssss PP01---- -00ddddd")
+DEF_EXT_SPACE(EXTRACTW,   ICLASS_LD" 001 0 000 iiiii PP0iiiii -01iiiii")
+DEF_ENC32(Y2_dcfetchbo,   ICLASS_LD" 010 0 000 sssss PP0--iii iiiiiiii")
+
+
+
+
+
+
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*           STORE             */
+/*                             */
+/*                             */
+/*******************************/
+
+DEF_CLASS32(ICLASS_ST" ---- -------- PP------ --------",ST)
+
+DEF_FIELD32(ICLASS_ST" !!!- -------- PP------ --------",ST_Amode,"Amode")
+DEF_FIELD32(ICLASS_ST" ---! !!------ PP------ --------",ST_Type,"Type")
+DEF_FIELD32(ICLASS_ST" ---- --!----- PP------ --------",ST_UN,"Unsigned")
+
+DEF_CLASS32(ICLASS_ST" 0--1 -------- PP------ --------",ST_ADDR_ROFFSET)
+DEF_CLASS32(ICLASS_ST" 1011 -------- PP0----- 0-----0-",ST_ADDR_POST_IMMED)
+DEF_CLASS32(ICLASS_ST" 1011 -------- PP0----- 1-------",ST_ADDR_ABS_UPDATE_V4)
+DEF_CLASS32(ICLASS_ST" 1011 -------- PP1----- --------",ST_ADDR_POST_IMMED_PRED_V2)
+DEF_CLASS32(ICLASS_ST" 1111 -------- PP------ 1-------",ST_ADDR_PRED_ABS_V4)
+DEF_CLASS32(ICLASS_ST" 1101 -------- PP------ 0-------",ST_ADDR_POST_REG)
+DEF_CLASS32(ICLASS_ST" 1101 -------- PP------ 1-------",ST_ADDR_ABS_PLUS_REG_V4)
+DEF_CLASS32(ICLASS_ST" 1001 -------- PP------ ------1-",ST_ADDR_POST_CREG_V2)
+DEF_CLASS32(ICLASS_ST" 0--0 1------- PP------ --------",ST_MISC_STORELIKE)
+DEF_CLASS32(ICLASS_ST" 1--0 0------- PP------ --------",ST_MISC_BUSOP)
+DEF_CLASS32(ICLASS_ST" 0--0 0------- PP------ --------",ST_MISC_CACHEOP)
+
+
+#define STD_ST_ENC(TAG,OPC,SRC) \
+DEF_ENC32(S2_store##TAG##_io,   ICLASS_ST" 0 ii "OPC"  sssss  PPi"SRC"  iiiiiiii")\
+DEF_ENC32(S2_store##TAG##_pi,   ICLASS_ST" 1 01 "OPC"  xxxxx  PP0"SRC"  0iiii-0-")\
+DEF_ENC32(S4_store##TAG##_ap,   ICLASS_ST" 1 01 "OPC"  eeeee  PP0"SRC"  1-IIIIII")\
+DEF_ENC32(S2_store##TAG##_pr,   ICLASS_ST" 1 10 "OPC"  xxxxx  PPu"SRC"  0-------")\
+DEF_ENC32(S4_store##TAG##_ur,   ICLASS_ST" 1 10 "OPC"  uuuuu  PPi"SRC"  1iIIIIII")\
+
+
+#define STD_PST_ENC(TAG,OPC,SRC) \
+DEF_ENC32(S2_pstore##TAG##t_pi,    ICLASS_ST" 1 01 "OPC"  xxxxx  PP1"SRC"  0iiii0vv")\
+DEF_ENC32(S2_pstore##TAG##f_pi,    ICLASS_ST" 1 01 "OPC"  xxxxx  PP1"SRC"  0iiii1vv")\
+DEF_ENC32(S2_pstore##TAG##tnew_pi, ICLASS_ST" 1 01 "OPC"  xxxxx  PP1"SRC"  1iiii0vv")\
+DEF_ENC32(S2_pstore##TAG##fnew_pi, ICLASS_ST" 1 01 "OPC"  xxxxx  PP1"SRC"  1iiii1vv")\
+DEF_ENC32(S4_pstore##TAG##t_abs,   ICLASS_ST" 1 11 "OPC"  ---ii  PP0"SRC"  1iiii0vv")\
+DEF_ENC32(S4_pstore##TAG##f_abs,   ICLASS_ST" 1 11 "OPC"  ---ii  PP0"SRC"  1iiii1vv")\
+DEF_ENC32(S4_pstore##TAG##tnew_abs,ICLASS_ST" 1 11 "OPC"  ---ii  PP1"SRC"  1iiii0vv")\
+DEF_ENC32(S4_pstore##TAG##fnew_abs,ICLASS_ST" 1 11 "OPC"  ---ii  PP1"SRC"  1iiii1vv")
+
+
+/*                 0 0--  Store Misc */
+/*                 0 1xx  Available */
+STD_ST_ENC(rb,    "1 000","ttttt")
+STD_ST_ENC(rh,    "1 010","ttttt")
+STD_ST_ENC(rf,    "1 011","ttttt")
+STD_ST_ENC(ri,    "1 100","ttttt")
+STD_ST_ENC(rd,    "1 110","ttttt")
+STD_ST_ENC(rbnew, "1 101","00ttt")
+STD_ST_ENC(rhnew, "1 101","01ttt")
+STD_ST_ENC(rinew, "1 101","10ttt")
+
+STD_PST_ENC(rb,    "1 000","ttttt")
+STD_PST_ENC(rh,    "1 010","ttttt")
+STD_PST_ENC(rf,    "1 011","ttttt")
+STD_PST_ENC(ri,    "1 100","ttttt")
+STD_PST_ENC(rd,    "1 110","ttttt")
+STD_PST_ENC(rbnew, "1 101","00ttt")
+STD_PST_ENC(rhnew, "1 101","01ttt")
+STD_PST_ENC(rinew, "1 101","10ttt")
+
+
+
+/* User */
+/*                                   xx - st_misc */
+/*                                                */
+/*                               x bus/cache     */
+/*                                    x store/cache     */
+DEF_ENC32(S2_allocframe,   ICLASS_ST" 000 01 00xxxxx PP000iii iiiiiiii")
+DEF_ENC32(S2_storew_locked,ICLASS_ST" 000 01 01sssss PP-ttttt ------dd")
+DEF_ENC32(S4_stored_locked,ICLASS_ST" 000 01 11sssss PP0ttttt ------dd")
+DEF_ENC32(Y2_dczeroa,      ICLASS_ST" 000 01 10sssss PP0----- --------")
+
+
+DEF_ENC32(Y2_barrier,      ICLASS_ST" 100 00 00----- PP------ 000-----")
+DEF_ENC32(Y2_syncht,       ICLASS_ST" 100 00 10----- PP------ --------")
+
+
+
+DEF_ENC32(Y2_dccleana,     ICLASS_ST" 000 00 00sssss PP------ --------")
+DEF_ENC32(Y2_dcinva,       ICLASS_ST" 000 00 01sssss PP------ --------")
+DEF_ENC32(Y2_dccleaninva,  ICLASS_ST" 000 00 10sssss PP------ --------")
+
+/*******************************/
+/*                             */
+/*                             */
+/*           JUMP              */
+/*                             */
+/*                             */
+/*******************************/
+
+DEF_CLASS32(ICLASS_J" ---- -------- PP------ --------",J)
+DEF_CLASS32(ICLASS_J" 0--- -------- PP------ --------",JUMPR_MISC)
+DEF_CLASS32(ICLASS_J" 10-- -------- PP------ --------",UCJUMP)
+DEF_CLASS32(ICLASS_J" 110- -------- PP------ --------",CJUMP)
+DEF_FIELD32(ICLASS_J" 110- -------- PP--!--- --------",J_DN,"Dot-new")
+DEF_FIELD32(ICLASS_J" 110- -------- PP-!---- --------",J_PT,"Predict-taken")
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_J" 0000 -------- PP------ --------","[#0] PC=(Rs), R31=return")
+DEF_ENC32(J2_callr,     ICLASS_J" 0000  101sssss  PP------  --------")
+
+DEF_FIELDROW_DESC32(ICLASS_J" 0001 -------- PP------ --------","[#1] if (Pu) PC=(Rs), R31=return")
+DEF_ENC32(J2_callrt,    ICLASS_J" 0001  000sssss  PP----uu  --------")
+DEF_ENC32(J2_callrf,    ICLASS_J" 0001  001sssss  PP----uu  --------")
+
+DEF_FIELDROW_DESC32(ICLASS_J" 0010 -------- PP------ --------","[#2] PC=(Rs); ")
+DEF_ENC32(J2_jumpr,      ICLASS_J" 0010  100sssss  PP------  --------")
+DEF_ENC32(J4_hintjumpr,  ICLASS_J" 0010  101sssss  PP------  --------")
+
+DEF_FIELDROW_DESC32(ICLASS_J" 0011 -------- PP------ --------","[#3] if (Pu) PC=(Rs) ")
+DEF_ENC32(J2_jumprt,   ICLASS_J" 0011  010sssss  PP-00-uu  --------")
+DEF_ENC32(J2_jumprf,   ICLASS_J" 0011  011sssss  PP-00-uu  --------")
+DEF_ENC32(J2_jumprtpt,    ICLASS_J" 0011  010sssss  PP-10-uu  --------")
+DEF_ENC32(J2_jumprfpt,    ICLASS_J" 0011  011sssss  PP-10-uu  --------")
+DEF_ENC32(J2_jumprtnew,   ICLASS_J" 0011  010sssss  PP-01-uu  --------")
+DEF_ENC32(J2_jumprfnew,   ICLASS_J" 0011  011sssss  PP-01-uu  --------")
+DEF_ENC32(J2_jumprtnewpt, ICLASS_J" 0011  010sssss  PP-11-uu  --------")
+DEF_ENC32(J2_jumprfnewpt, ICLASS_J" 0011  011sssss  PP-11-uu  --------")
+
+DEF_FIELDROW_DESC32(ICLASS_J" 0100 -------- PP------ --------","[#4] (#u8) ")
+DEF_ENC32(J2_trap0,     ICLASS_J" 0100  00------  PP-iiiii  ---iii--")
+DEF_ENC32(J2_pause,     ICLASS_J" 0100  01------  PP-iiiii  ---iii--")
+
+DEF_FIELDROW_DESC32(ICLASS_J" 0110 -------- PP------ --------","[#6] icop(Rs) ")
+DEF_ENC32(Y2_icinva,    ICLASS_J" 0110  110sssss  PP000---  --------")
+
+DEF_FIELDROW_DESC32(ICLASS_J" 0111 -------- PP------ --------","[#7] () ")
+DEF_ENC32(Y2_isync,     ICLASS_J" 0111  11000000  PP0---00  00000010")
+
+/* JUMP */
+DEF_FIELDROW_DESC32(ICLASS_J" 100- -------- PP------ --------","[#8,9] PC=(#r22)")
+DEF_ENC32(J2_jump,      ICLASS_J" 100i  iiiiiiii  PPiiiiii  iiiiiii-")
+
+DEF_FIELDROW_DESC32(ICLASS_J" 101- -------- PP------ --------","[#10,11] PC=(#r22), R31=return")
+DEF_ENC32(J2_call,      ICLASS_J" 101i  iiiiiiii  PPiiiiii  iiiiiii0")
+
+DEF_FIELDROW_DESC32(ICLASS_J" 1100 -------- PP------ --------","[#12] if (Pu) PC=(#r15)")
+DEF_ENC32(J2_jumpt,  ICLASS_J" 1100  ii0iiiii  PPi00-uu  iiiiiii-")
+DEF_ENC32(J2_jumpf,  ICLASS_J" 1100  ii1iiiii  PPi00-uu  iiiiiii-")
+DEF_ENC32(J2_jumptpt,   ICLASS_J" 1100  ii0iiiii  PPi10-uu  iiiiiii-")
+DEF_ENC32(J2_jumpfpt,   ICLASS_J" 1100  ii1iiiii  PPi10-uu  iiiiiii-")
+DEF_ENC32(J2_jumptnew,  ICLASS_J" 1100  ii0iiiii  PPi01-uu  iiiiiii-")
+DEF_ENC32(J2_jumpfnew,  ICLASS_J" 1100  ii1iiiii  PPi01-uu  iiiiiii-")
+DEF_ENC32(J2_jumptnewpt,ICLASS_J" 1100  ii0iiiii  PPi11-uu  iiiiiii-")
+DEF_ENC32(J2_jumpfnewpt,ICLASS_J" 1100  ii1iiiii  PPi11-uu  iiiiiii-")
+
+DEF_FIELDROW_DESC32(ICLASS_J" 1101 -------- PP------ --------","[#13] if (Pu) PC=(#r15), R31=return")
+DEF_ENC32(J2_callt,     ICLASS_J" 1101  ii0iiiii  PPi-0-uu  iiiiiii-")
+DEF_ENC32(J2_callf,     ICLASS_J" 1101  ii1iiiii  PPi-0-uu  iiiiiii-")
+
+
+
+
+
+
+
+/*******************************/
+/*                             */
+/*        V4                   */
+/*   COMPOUND COMPARE-JUMPS    */
+/*                             */
+/*                             */
+/*******************************/
+
+
+/* EJP: this has to match what we have in htmldocs.py... so I will call it CJ, we can change it */
+DEF_CLASS32(ICLASS_CJ" 0--- -------- PP------ --------",CJ)
+
+DEF_FIELDROW_DESC32(ICLASS_CJ" 00-- -------- -------- --------","[#0-3]  pd=cmp.xx(R,#u5) ; if ([!]p0.new) jump:[h] #s9:2 ")
+DEF_FIELDROW_DESC32(ICLASS_CJ" 010- -------- -------- --------","[#4,5]  pd=cmp.eq(R,R) ; if ([!]p0.new) jump:[h] #s9:2 ")
+DEF_FIELDROW_DESC32(ICLASS_CJ" 0110 -------- -------- --------","[#6]    Rd=#u6 ; jump #s9:2 ")
+DEF_FIELDROW_DESC32(ICLASS_CJ" 0111 -------- -------- --------","[#7]    Rd=Rs ; jump #s9:2 ")
+
+
+#define CMPJMPI_ENC(TAG,OPC) \
+DEF_ENC32(TAG##i_tp0_jump_t,      ICLASS_CJ" 00 0 "OPC"  0iissss  PP1IIIII  iiiiiii-") \
+DEF_ENC32(TAG##i_fp0_jump_t,      ICLASS_CJ" 00 0 "OPC"  1iissss  PP1IIIII  iiiiiii-") \
+DEF_ENC32(TAG##i_tp0_jump_nt,     ICLASS_CJ" 00 0 "OPC"  0iissss  PP0IIIII  iiiiiii-") \
+DEF_ENC32(TAG##i_fp0_jump_nt,     ICLASS_CJ" 00 0 "OPC"  1iissss  PP0IIIII  iiiiiii-") \
+\
+DEF_ENC32(TAG##i_tp1_jump_t,      ICLASS_CJ" 00 1 "OPC"  0iissss  PP1IIIII  iiiiiii-") \
+DEF_ENC32(TAG##i_fp1_jump_t,      ICLASS_CJ" 00 1 "OPC"  1iissss  PP1IIIII  iiiiiii-") \
+DEF_ENC32(TAG##i_tp1_jump_nt,     ICLASS_CJ" 00 1 "OPC"  0iissss  PP0IIIII  iiiiiii-") \
+DEF_ENC32(TAG##i_fp1_jump_nt,     ICLASS_CJ" 00 1 "OPC"  1iissss  PP0IIIII  iiiiiii-")
+
+CMPJMPI_ENC(J4_cmpeq,"00")
+CMPJMPI_ENC(J4_cmpgt,"01")
+CMPJMPI_ENC(J4_cmpgtu,"10")
+
+
+#define CMPJMP1I_ENC(TAG,OPC) \
+DEF_ENC32(TAG##_tp0_jump_t,      ICLASS_CJ" 00 0  11  0iissss  PP1---"OPC"  iiiiiii-") \
+DEF_ENC32(TAG##_fp0_jump_t,      ICLASS_CJ" 00 0  11  1iissss  PP1---"OPC"  iiiiiii-") \
+DEF_ENC32(TAG##_tp0_jump_nt,     ICLASS_CJ" 00 0  11  0iissss  PP0---"OPC"  iiiiiii-") \
+DEF_ENC32(TAG##_fp0_jump_nt,     ICLASS_CJ" 00 0  11  1iissss  PP0---"OPC"  iiiiiii-") \
+\
+DEF_ENC32(TAG##_tp1_jump_t,      ICLASS_CJ" 00 1  11  0iissss  PP1---"OPC"  iiiiiii-") \
+DEF_ENC32(TAG##_fp1_jump_t,      ICLASS_CJ" 00 1  11  1iissss  PP1---"OPC"  iiiiiii-") \
+DEF_ENC32(TAG##_tp1_jump_nt,     ICLASS_CJ" 00 1  11  0iissss  PP0---"OPC"  iiiiiii-") \
+DEF_ENC32(TAG##_fp1_jump_nt,     ICLASS_CJ" 00 1  11  1iissss  PP0---"OPC"  iiiiiii-")
+
+CMPJMP1I_ENC(J4_cmpeqn1,"00")
+CMPJMP1I_ENC(J4_cmpgtn1,"01")
+CMPJMP1I_ENC(J4_tstbit0,"11")
+
+
+
+#define CMPJMPR_ENC(TAG,OPC) \
+DEF_ENC32(TAG##_tp0_jump_t,       ICLASS_CJ" 01 0 "OPC"  0iissss  PP10tttt  iiiiiii-") \
+DEF_ENC32(TAG##_fp0_jump_t,       ICLASS_CJ" 01 0 "OPC"  1iissss  PP10tttt  iiiiiii-") \
+DEF_ENC32(TAG##_tp0_jump_nt,      ICLASS_CJ" 01 0 "OPC"  0iissss  PP00tttt  iiiiiii-") \
+DEF_ENC32(TAG##_fp0_jump_nt,      ICLASS_CJ" 01 0 "OPC"  1iissss  PP00tttt  iiiiiii-") \
+\
+DEF_ENC32(TAG##_tp1_jump_t,       ICLASS_CJ" 01 0 "OPC"  0iissss  PP11tttt  iiiiiii-") \
+DEF_ENC32(TAG##_fp1_jump_t,       ICLASS_CJ" 01 0 "OPC"  1iissss  PP11tttt  iiiiiii-") \
+DEF_ENC32(TAG##_tp1_jump_nt,      ICLASS_CJ" 01 0 "OPC"  0iissss  PP01tttt  iiiiiii-") \
+DEF_ENC32(TAG##_fp1_jump_nt,      ICLASS_CJ" 01 0 "OPC"  1iissss  PP01tttt  iiiiiii-")
+
+CMPJMPR_ENC(J4_cmpeq,"00")
+CMPJMPR_ENC(J4_cmpgt,"01")
+CMPJMPR_ENC(J4_cmpgtu,"10")
+
+
+DEF_ENC32(J4_jumpseti,            ICLASS_CJ" 0110  --iidddd  PPIIIIII  iiiiiii-")
+DEF_ENC32(J4_jumpsetr,            ICLASS_CJ" 0111  --iissss  PP--dddd  iiiiiii-")
+
+
+DEF_EXT_SPACE(EXT_CJ,             ICLASS_CJ"1 iii  iiiiiiii  PPiiiiii  iiiiiiii")
+
+
+
+DEF_CLASS32(ICLASS_NCJ" 0--- -------- PP------ --------",NCJ)
+DEF_FIELDROW_DESC32(ICLASS_NCJ" 00-- -------- -------- --------","[#0-3] if (cmp.xx(R.new,R)) jump:[h] #s9:2 ")
+DEF_FIELDROW_DESC32(ICLASS_NCJ" 01-- -------- -------- --------","[#4-7] if (cmp.xx(R.new,#U5)) jump:[h] #s9:2 ")
+
+#define OPRJMP_ENC(TAG,OPC) \
+DEF_ENC32(TAG##_t_jumpnv_t,       ICLASS_NCJ" 00 "OPC"  0ii-sss  PP1ttttt  iiiiiii-") \
+DEF_ENC32(TAG##_f_jumpnv_t,       ICLASS_NCJ" 00 "OPC"  1ii-sss  PP1ttttt  iiiiiii-") \
+DEF_ENC32(TAG##_t_jumpnv_nt,      ICLASS_NCJ" 00 "OPC"  0ii-sss  PP0ttttt  iiiiiii-") \
+DEF_ENC32(TAG##_f_jumpnv_nt,      ICLASS_NCJ" 00 "OPC"  1ii-sss  PP0ttttt  iiiiiii-")
+
+OPRJMP_ENC(J4_cmpeq,   "000")
+OPRJMP_ENC(J4_cmpgt,   "001")
+OPRJMP_ENC(J4_cmpgtu,  "010")
+OPRJMP_ENC(J4_cmplt,   "011")
+OPRJMP_ENC(J4_cmpltu,  "100")
+
+
+#define OPIJMP_ENC(TAG,OPC) \
+DEF_ENC32(TAG##_t_jumpnv_t,       ICLASS_NCJ" 01 "OPC"  0ii-sss  PP1IIIII  iiiiiii-") \
+DEF_ENC32(TAG##_f_jumpnv_t,       ICLASS_NCJ" 01 "OPC"  1ii-sss  PP1IIIII  iiiiiii-") \
+DEF_ENC32(TAG##_t_jumpnv_nt,      ICLASS_NCJ" 01 "OPC"  0ii-sss  PP0IIIII  iiiiiii-") \
+DEF_ENC32(TAG##_f_jumpnv_nt,      ICLASS_NCJ" 01 "OPC"  1ii-sss  PP0IIIII  iiiiiii-")
+
+OPIJMP_ENC(J4_cmpeqi,  "000")
+OPIJMP_ENC(J4_cmpgti,  "001")
+OPIJMP_ENC(J4_cmpgtui, "010")
+
+
+#define OPI1JMP_ENC(TAG,OPC) \
+DEF_ENC32(TAG##_t_jumpnv_t,       ICLASS_NCJ" 01 "OPC"  0ii-sss  PP1-----  iiiiiii-") \
+DEF_ENC32(TAG##_f_jumpnv_t,       ICLASS_NCJ" 01 "OPC"  1ii-sss  PP1-----  iiiiiii-") \
+DEF_ENC32(TAG##_t_jumpnv_nt,      ICLASS_NCJ" 01 "OPC"  0ii-sss  PP0-----  iiiiiii-") \
+DEF_ENC32(TAG##_f_jumpnv_nt,      ICLASS_NCJ" 01 "OPC"  1ii-sss  PP0-----  iiiiiii-")
+
+OPI1JMP_ENC(J4_cmpeqn1,  "100")
+OPI1JMP_ENC(J4_cmpgtn1,  "101")
+OPI1JMP_ENC(J4_tstbit0,  "011")
+
+
+DEF_EXT_SPACE(EXT_NCJ,             ICLASS_NCJ"1 iii  iiiiiiii  PPiiiiii  iiiiiiii")
+
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*           CR                */
+/*                             */
+/*                             */
+/*******************************/
+
+
+
+DEF_CLASS32(ICLASS_CR" ---- -------- PP------ --------",CR)
+DEF_CLASS32(ICLASS_CR" -0-- -------- PP------ --------",CRUSER)
+DEF_CLASS32(ICLASS_CR" -1-- -------- PP------ --------",CRSUPER)
+
+DEF_FIELD32(ICLASS_CR" -!-- -------- PP------ --------",CR_sm,"Supervisor mode only")
+
+/* User CR ops */
+
+DEF_FIELDROW_DESC32(    ICLASS_CR" 0000  --------  PP------  --------","[#0] (Rs,#r8)")
+DEF_ENC32(J2_loop0r,    ICLASS_CR" 0000  000sssss  PP-iiiii  ---ii---")
+DEF_ENC32(J2_loop1r,    ICLASS_CR" 0000  001sssss  PP-iiiii  ---ii---")
+DEF_ENC32(J2_ploop1sr,  ICLASS_CR" 0000  101sssss  PP-iiiii  ---ii---")
+DEF_ENC32(J2_ploop2sr,  ICLASS_CR" 0000  110sssss  PP-iiiii  ---ii---")
+DEF_ENC32(J2_ploop3sr,  ICLASS_CR" 0000  111sssss  PP-iiiii  ---ii---")
+
+DEF_FIELDROW_DESC32(     ICLASS_CR" 0001  --------  PP------  --------","[#1] (Rs,#r13)")
+DEF_ENC32(J2_jumprz,     ICLASS_CR" 0001  00isssss  PPi0iiii  iiiiiii-")
+DEF_ENC32(J2_jumprzpt,   ICLASS_CR" 0001  00isssss  PPi1iiii  iiiiiii-")
+DEF_ENC32(J2_jumprnz,    ICLASS_CR" 0001  10isssss  PPi0iiii  iiiiiii-")
+DEF_ENC32(J2_jumprnzpt,  ICLASS_CR" 0001  10isssss  PPi1iiii  iiiiiii-")
+
+DEF_ENC32(J2_jumprgtez,  ICLASS_CR" 0001  01isssss  PPi0iiii  iiiiiii-")
+DEF_ENC32(J2_jumprgtezpt,ICLASS_CR" 0001  01isssss  PPi1iiii  iiiiiii-")
+DEF_ENC32(J2_jumprltez,  ICLASS_CR" 0001  11isssss  PPi0iiii  iiiiiii-")
+DEF_ENC32(J2_jumprltezpt,ICLASS_CR" 0001  11isssss  PPi1iiii  iiiiiii-")
+
+DEF_FIELDROW_DESC32(    ICLASS_CR" 0010  --------  PP------  --------","[#2] Cd=Rs ")
+DEF_ENC32(A2_tfrrcr,    ICLASS_CR" 0010  001sssss  PP------  ---ddddd")
+
+DEF_FIELDROW_DESC32(    ICLASS_CR" 0011  --------  PP------  --------","[#3] Cdd=Rss ")
+DEF_ENC32(A4_tfrpcp,    ICLASS_CR" 0011  001sssss  PP------  ---ddddd")
+
+DEF_FIELDROW_DESC32(    ICLASS_CR" 1000  --------  PP------  --------","[#8] Rdd=Css ")
+DEF_ENC32(A4_tfrcpp,    ICLASS_CR" 1000  000sssss  PP------  ---ddddd")
+
+DEF_FIELDROW_DESC32(    ICLASS_CR" 1001  --------  PP------  --------","[#9] (#r8,#U10)")
+DEF_ENC32(J2_ploop1si,  ICLASS_CR" 1001  101IIIII  PP-iiiii  IIIii-II")
+DEF_ENC32(J2_ploop2si,  ICLASS_CR" 1001  110IIIII  PP-iiiii  IIIii-II")
+DEF_ENC32(J2_ploop3si,  ICLASS_CR" 1001  111IIIII  PP-iiiii  IIIii-II")
+DEF_ENC32(J2_loop0i,    ICLASS_CR" 1001  000IIIII  PP-iiiii  IIIii-II")
+DEF_ENC32(J2_loop1i,    ICLASS_CR" 1001  001IIIII  PP-iiiii  IIIii-II")
+
+DEF_FIELDROW_DESC32(    ICLASS_CR" 1010  --------  PP------  --------","[#10] Rd=Cs ")
+DEF_ENC32(A2_tfrcrr,    ICLASS_CR" 1010  000sssss  PP------  ---ddddd")
+DEF_ENC32(C4_addipc,    ICLASS_CR" 1010  01001001  PP-iiiii  i--ddddd")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_CR" 1011  --------  PP0-----  --------","[#11] Pd=(Ps,Pt,Pu)")
+DEF_ENC32(C2_and,       ICLASS_CR" 1011  0000--ss  PP0---tt  ------dd")
+DEF_ENC32(C2_or,        ICLASS_CR" 1011  0010--ss  PP0---tt  ------dd")
+DEF_ENC32(C2_xor,       ICLASS_CR" 1011  0100--ss  PP0---tt  ------dd")
+DEF_ENC32(C2_andn,      ICLASS_CR" 1011  0110--ss  PP0---tt  ------dd")
+DEF_ENC32(C2_any8,      ICLASS_CR" 1011  1000--ss  PP0-----  ------dd")
+DEF_ENC32(C2_all8,      ICLASS_CR" 1011  1010--ss  PP0-----  ------dd")
+DEF_ENC32(C2_not,       ICLASS_CR" 1011  1100--ss  PP0-----  ------dd")
+DEF_ENC32(C2_orn,       ICLASS_CR" 1011  1110--ss  PP0---tt  ------dd")
+
+DEF_ENC32(C4_and_and,   ICLASS_CR" 1011  0001--ss  PP0---tt  uu----dd")
+DEF_ENC32(C4_and_or,    ICLASS_CR" 1011  0011--ss  PP0---tt  uu----dd")
+DEF_ENC32(C4_or_and,    ICLASS_CR" 1011  0101--ss  PP0---tt  uu----dd")
+DEF_ENC32(C4_or_or,     ICLASS_CR" 1011  0111--ss  PP0---tt  uu----dd")
+DEF_ENC32(C4_and_andn,  ICLASS_CR" 1011  1001--ss  PP0---tt  uu----dd")
+DEF_ENC32(C4_and_orn,   ICLASS_CR" 1011  1011--ss  PP0---tt  uu----dd")
+DEF_ENC32(C4_or_andn,   ICLASS_CR" 1011  1101--ss  PP0---tt  uu----dd")
+DEF_ENC32(C4_or_orn,    ICLASS_CR" 1011  1111--ss  PP0---tt  uu----dd")
+
+DEF_ENC32(C4_fastcorner9,       ICLASS_CR"1011 0000--ss  PP1---tt 1--1--dd")
+DEF_ENC32(C4_fastcorner9_not,   ICLASS_CR"1011 0001--ss  PP1---tt 1--1--dd")
+
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*           M                 */
+/*                             */
+/*                             */
+/*******************************/
+
+
+DEF_CLASS32(ICLASS_M" ---- -------- PP------ --------",M)
+DEF_FIELD32(ICLASS_M" !!!! -------- PP------ --------",M_RegType,"Register Type")
+DEF_FIELD32(ICLASS_M" ---- !!!----- PP------ --------",M_MajOp,"Major Opcode")
+DEF_FIELD32(ICLASS_M" ---- -------- PP------ !!!-----",M_MinOp,"Minor Opcode")
+
+
+
+#define SP_MPY(TAG,REGTYPE,DSTCHARS,SAT,RND,UNS)\
+DEF_ENC32(TAG##_ll_s0, ICLASS_M  REGTYPE "0"  UNS RND"sssss  PP-ttttt "SAT"00"   DSTCHARS)\
+DEF_ENC32(TAG##_lh_s0, ICLASS_M  REGTYPE "0"  UNS RND"sssss  PP-ttttt "SAT"01"   DSTCHARS)\
+DEF_ENC32(TAG##_hl_s0, ICLASS_M  REGTYPE "0"  UNS RND"sssss  PP-ttttt "SAT"10"   DSTCHARS)\
+DEF_ENC32(TAG##_hh_s0, ICLASS_M  REGTYPE "0"  UNS RND"sssss  PP-ttttt "SAT"11"   DSTCHARS)\
+DEF_ENC32(TAG##_ll_s1, ICLASS_M  REGTYPE "1"  UNS RND"sssss  PP-ttttt "SAT"00"   DSTCHARS)\
+DEF_ENC32(TAG##_lh_s1, ICLASS_M  REGTYPE "1"  UNS RND"sssss  PP-ttttt "SAT"01"   DSTCHARS)\
+DEF_ENC32(TAG##_hl_s1, ICLASS_M  REGTYPE "1"  UNS RND"sssss  PP-ttttt "SAT"10"   DSTCHARS)\
+DEF_ENC32(TAG##_hh_s1, ICLASS_M  REGTYPE "1"  UNS RND"sssss  PP-ttttt "SAT"11"   DSTCHARS)
+
+/* Double precision                   */
+#define MPY_ENC(TAG,REGTYPE,DSTCHARS,SAT,RNDNAC,UNS,SHFT,VMIN2)\
+DEF_ENC32(TAG, ICLASS_M REGTYPE SHFT UNS RNDNAC"sssss  PP0ttttt "SAT VMIN2 DSTCHARS)
+
+#define MPYI_ENC(TAG,REGTYPE,DSTCHARS,RNDNAC,UNS,SHFT)\
+DEF_ENC32(TAG, ICLASS_M REGTYPE SHFT UNS RNDNAC"sssss  PP0iiiii iii" DSTCHARS)
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 0000 -------- PP------ --------","[#0] Rd=(Rs,#u8)")
+MPYI_ENC(M2_mpysip,          "0000","ddddd","-","-","0"     )
+MPYI_ENC(M2_mpysin,          "0000","ddddd","-","-","1"     )
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 0001 -------- PP------ --------","[#1] Rx=(Rs,#u8)")
+MPYI_ENC(M2_macsip,          "0001","xxxxx","-","-","0"     )
+MPYI_ENC(M2_macsin,          "0001","xxxxx","-","-","1"     )
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 0010 -------- PP------ --------","[#2] Rx=(Rs,#s8)")
+MPYI_ENC(M2_accii,           "0010","xxxxx","-","-","0"     )
+MPYI_ENC(M2_naccii,          "0010","xxxxx","-","-","1"     )
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 0011 -------- PP------ --------","[#3] Ry=(Ru,(Rs,Ry)) ")
+DEF_ENC32(M4_mpyrr_addr,ICLASS_M" 0011 000sssss PP-yyyyy ---uuuuu")
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 0100 -------- PP------ --------","[#4] Rdd=(Rs,Rt)")
+DEF_FIELD32(ICLASS_M"         0100 -------- PP------ --!-----",Ma_tH,"Rt is High") /*Rt high */
+DEF_FIELD32(ICLASS_M"         0100 -------- PP------ -!------",Ma_sH,"Rs is High") /* Rs high */
+SP_MPY(M2_mpyd,              "0100","ddddd","-","0","0")
+SP_MPY(M2_mpyd_rnd,          "0100","ddddd","-","1","0")
+SP_MPY(M2_mpyud,             "0100","ddddd","-","0","1")
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 0101 -------- PP------ --------","[#5] Rdd=(Rs,Rt)")
+MPY_ENC(M2_dpmpyss_s0,       "0101","ddddd","0","0","0","0","00")
+MPY_ENC(M2_dpmpyuu_s0,       "0101","ddddd","0","0","1","0","00")
+MPY_ENC(M2_vmpy2s_s0,        "0101","ddddd","1","0","0","0","01")
+MPY_ENC(M2_vmpy2s_s1,        "0101","ddddd","1","0","0","1","01")
+MPY_ENC(M2_cmpyi_s0,         "0101","ddddd","0","0","0","0","01")
+MPY_ENC(M2_cmpyr_s0,         "0101","ddddd","0","0","0","0","10")
+MPY_ENC(M2_cmpys_s0,         "0101","ddddd","1","0","0","0","10")
+MPY_ENC(M2_cmpys_s1,         "0101","ddddd","1","0","0","1","10")
+MPY_ENC(M2_cmpysc_s0,        "0101","ddddd","1","0","1","0","10")
+MPY_ENC(M2_cmpysc_s1,        "0101","ddddd","1","0","1","1","10")
+MPY_ENC(M2_vmpy2su_s0,       "0101","ddddd","1","0","0","0","11")
+MPY_ENC(M2_vmpy2su_s1,       "0101","ddddd","1","0","0","1","11")
+MPY_ENC(M4_pmpyw,            "0101","ddddd","1","0","1","0","11")
+MPY_ENC(M4_vpmpyh,           "0101","ddddd","1","0","1","1","11")
+MPY_ENC(M5_vmpybuu,          "0101","ddddd","0","0","0","1","01")
+MPY_ENC(M5_vmpybsu,          "0101","ddddd","0","0","1","0","01")
+
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 0110 -------- PP------ --------","[#6] Rxx=(Rs,Rt)")
+DEF_FIELD32(ICLASS_M"         0110 -------- PP------ --!-----",Mb_tH,"Rt is High") /*Rt high */
+DEF_FIELD32(ICLASS_M"         0110 -------- PP------ -!------",Mb_sH,"Rs is High") /* Rs high */
+SP_MPY(M2_mpyd_acc,          "0110","xxxxx","0","0","0")
+SP_MPY(M2_mpyud_acc,         "0110","xxxxx","0","0","1")
+SP_MPY(M2_mpyd_nac,          "0110","xxxxx","0","1","0")
+SP_MPY(M2_mpyud_nac,         "0110","xxxxx","0","1","1")
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 0111 -------- PP------ --------","[#7] Rxx=(Rs,Rt)")
+MPY_ENC(M2_dpmpyss_acc_s0,   "0111","xxxxx","0","0","0","0","00")
+MPY_ENC(M2_dpmpyss_nac_s0,   "0111","xxxxx","0","1","0","0","00")
+MPY_ENC(M2_dpmpyuu_acc_s0,   "0111","xxxxx","0","0","1","0","00")
+MPY_ENC(M2_dpmpyuu_nac_s0,   "0111","xxxxx","0","1","1","0","00")
+MPY_ENC(M2_vmac2s_s0,        "0111","xxxxx","1","0","0","0","01")
+MPY_ENC(M2_vmac2s_s1,        "0111","xxxxx","1","0","0","1","01")
+MPY_ENC(M2_cmaci_s0,         "0111","xxxxx","0","0","0","0","01")
+MPY_ENC(M2_cmacr_s0,         "0111","xxxxx","0","0","0","0","10")
+MPY_ENC(M2_cmacs_s0,         "0111","xxxxx","1","0","0","0","10")
+MPY_ENC(M2_cmacs_s1,         "0111","xxxxx","1","0","0","1","10")
+MPY_ENC(M2_cmacsc_s0,        "0111","xxxxx","1","0","1","0","10")
+MPY_ENC(M2_cmacsc_s1,        "0111","xxxxx","1","0","1","1","10")
+MPY_ENC(M2_vmac2,            "0111","xxxxx","0","1","0","0","01")
+MPY_ENC(M2_cnacs_s0,         "0111","xxxxx","1","0","0","0","11")
+MPY_ENC(M2_cnacs_s1,         "0111","xxxxx","1","0","0","1","11")
+MPY_ENC(M2_cnacsc_s0,        "0111","xxxxx","1","0","1","0","11")
+MPY_ENC(M2_cnacsc_s1,        "0111","xxxxx","1","0","1","1","11")
+MPY_ENC(M2_vmac2su_s0,       "0111","xxxxx","1","1","1","0","01")
+MPY_ENC(M2_vmac2su_s1,       "0111","xxxxx","1","1","1","1","01")
+MPY_ENC(M4_pmpyw_acc,        "0111","xxxxx","1","1","0","0","11")
+MPY_ENC(M4_vpmpyh_acc,       "0111","xxxxx","1","1","0","1","11")
+MPY_ENC(M5_vmacbuu,          "0111","xxxxx","0","0","0","1","01")
+MPY_ENC(M5_vmacbsu,          "0111","xxxxx","0","0","1","1","01")
+
+
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 1000 -------- PP------ --------","[#8] Rdd=(Rss,Rtt)")
+MPY_ENC(M2_vrcmpyi_s0,       "1000","ddddd","0","0","0","0","00")
+MPY_ENC(M2_vdmpys_s0,        "1000","ddddd","1","0","0","0","00")
+MPY_ENC(M2_vdmpys_s1,        "1000","ddddd","1","0","0","1","00")
+MPY_ENC(M2_vrcmpyi_s0c,      "1000","ddddd","0","0","1","0","00")
+MPY_ENC(M2_vabsdiffw,        "1000","ddddd","0","1","0","0","00")
+MPY_ENC(M6_vabsdiffub,       "1000","ddddd","0","1","0","1","00")
+MPY_ENC(M2_vabsdiffh,        "1000","ddddd","0","1","1","0","00")
+MPY_ENC(M6_vabsdiffb,        "1000","ddddd","0","1","1","1","00")
+MPY_ENC(M2_vrcmpys_s1_h,     "1000","ddddd","1","1","0","1","00")
+MPY_ENC(M2_vrcmpys_s1_l,     "1000","ddddd","1","1","1","1","00")
+MPY_ENC(M2_vrcmpyr_s0c,      "1000","ddddd","0","1","1","0","01")
+MPY_ENC(M2_vrcmpyr_s0,       "1000","ddddd","0","0","0","0","01")
+MPY_ENC(A2_vraddub,          "1000","ddddd","0","0","1","0","01")
+MPY_ENC(M2_mmpyl_s0,         "1000","ddddd","1","0","0","0","01")
+MPY_ENC(M2_mmpyl_s1,         "1000","ddddd","1","0","0","1","01")
+MPY_ENC(M2_mmpyl_rs0,        "1000","ddddd","1","1","0","0","01")
+MPY_ENC(M2_mmpyl_rs1,        "1000","ddddd","1","1","0","1","01")
+MPY_ENC(M2_mmpyul_s0,        "1000","ddddd","1","0","1","0","01")
+MPY_ENC(M2_mmpyul_s1,        "1000","ddddd","1","0","1","1","01")
+MPY_ENC(M2_mmpyul_rs0,       "1000","ddddd","1","1","1","0","01")
+MPY_ENC(M2_mmpyul_rs1,       "1000","ddddd","1","1","1","1","01")
+MPY_ENC(M2_vrmpy_s0,         "1000","ddddd","0","0","0","0","10")
+MPY_ENC(A2_vrsadub,          "1000","ddddd","0","0","1","0","10")
+MPY_ENC(M2_vmpy2es_s0,       "1000","ddddd","1","0","0","0","10")
+MPY_ENC(M2_vmpy2es_s1,       "1000","ddddd","1","0","0","1","10")
+MPY_ENC(M2_vcmpy_s0_sat_i,   "1000","ddddd","1","0","1","0","10")
+MPY_ENC(M2_vcmpy_s0_sat_r,   "1000","ddddd","1","1","0","0","10")
+MPY_ENC(M2_vcmpy_s1_sat_i,   "1000","ddddd","1","0","1","1","10")
+MPY_ENC(M2_vcmpy_s1_sat_r,   "1000","ddddd","1","1","0","1","10")
+
+MPY_ENC(M2_mmpyh_s0,         "1000","ddddd","1","0","0","0","11")
+MPY_ENC(M2_mmpyh_s1,         "1000","ddddd","1","0","0","1","11")
+MPY_ENC(M2_mmpyh_rs0,        "1000","ddddd","1","1","0","0","11")
+MPY_ENC(M2_mmpyh_rs1,        "1000","ddddd","1","1","0","1","11")
+MPY_ENC(M2_mmpyuh_s0,        "1000","ddddd","1","0","1","0","11")
+MPY_ENC(M2_mmpyuh_s1,        "1000","ddddd","1","0","1","1","11")
+MPY_ENC(M2_mmpyuh_rs0,       "1000","ddddd","1","1","1","0","11")
+MPY_ENC(M2_mmpyuh_rs1,       "1000","ddddd","1","1","1","1","11")
+
+MPY_ENC(M4_vrmpyeh_s0,       "1000","ddddd","1","0","1","0","00")
+MPY_ENC(M4_vrmpyeh_s1,       "1000","ddddd","1","0","1","1","00")
+MPY_ENC(M4_vrmpyoh_s0,       "1000","ddddd","0","1","0","0","10")
+MPY_ENC(M4_vrmpyoh_s1,       "1000","ddddd","0","1","0","1","10")
+MPY_ENC(M5_vrmpybuu,         "1000","ddddd","0","0","0","1","01")
+MPY_ENC(M5_vrmpybsu,         "1000","ddddd","0","0","1","1","01")
+MPY_ENC(M5_vdmpybsu,         "1000","ddddd","0","1","0","1","01")
+
+MPY_ENC(F2_dfadd,            "1000","ddddd","0","0","0","0","11")
+MPY_ENC(F2_dfsub,            "1000","ddddd","0","0","0","1","11")
+MPY_ENC(F2_dfmpyfix,         "1000","ddddd","0","0","1","0","11")
+MPY_ENC(F2_dfmin,            "1000","ddddd","0","0","1","1","11")
+MPY_ENC(F2_dfmax,            "1000","ddddd","0","1","0","0","11")
+MPY_ENC(F2_dfmpyll,          "1000","ddddd","0","1","0","1","11")
+#ifdef ADD_DP_OPS
+MPY_ENC(F2_dfdivcheat,       "1000","ddddd","0","0","0","1","00")
+
+MPY_ENC(F2_dffixupn,         "1000","ddddd","0","1","0","1","11")
+MPY_ENC(F2_dffixupd,         "1000","ddddd","0","1","1","0","11")
+MPY_ENC(F2_dfrecipa,         "1000","ddddd","0","1","1","1","ee")
+#endif
+
+MPY_ENC(M7_dcmpyrw,          "1000","ddddd","0","0","0","1","10")
+MPY_ENC(M7_dcmpyrwc,         "1000","ddddd","0","0","1","1","10")
+MPY_ENC(M7_dcmpyiw,          "1000","ddddd","0","1","1","0","10")
+MPY_ENC(M7_dcmpyiwc,         "1000","ddddd","0","1","1","1","10")
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 1001 -------- PP------ --------","[#9] Rd=(Rss,Rtt)")
+MPY_ENC(M2_vdmpyrs_s0,       "1001","ddddd","0","0","0","0","00")
+MPY_ENC(M2_vdmpyrs_s1,       "1001","ddddd","0","0","0","1","00")
+
+MPY_ENC(M7_wcmpyrw,          "1001","ddddd","0","0","1","0","00")
+MPY_ENC(M7_wcmpyrw_rnd,      "1001","ddddd","0","0","1","1","00")
+MPY_ENC(M7_wcmpyiw,          "1001","ddddd","0","1","0","0","00")
+MPY_ENC(M7_wcmpyiw_rnd,      "1001","ddddd","0","1","0","1","00")
+
+MPY_ENC(M7_wcmpyrwc,         "1001","ddddd","0","1","1","0","00")
+MPY_ENC(M7_wcmpyrwc_rnd,     "1001","ddddd","0","1","1","1","00")
+MPY_ENC(M7_wcmpyiwc,         "1001","ddddd","1","0","0","0","00")
+MPY_ENC(M7_wcmpyiwc_rnd,     "1001","ddddd","1","0","0","1","00")
+
+
+
+MPY_ENC(M2_vradduh,          "1001","ddddd","-","-","-","0","01")
+MPY_ENC(M2_vrcmpys_s1rp_h,   "1001","ddddd","1","1","-","1","10")
+MPY_ENC(M2_vrcmpys_s1rp_l,   "1001","ddddd","1","1","-","1","11")
+MPY_ENC(M2_vraddh,           "1001","ddddd","1","1","-","0","11")
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 1010 -------- PP------ --------","[#10] Rxx=(Rss,Rtt)")
+MPY_ENC(M2_vrcmaci_s0,       "1010","xxxxx","0","0","0","0","00")
+MPY_ENC(M2_vdmacs_s0,        "1010","xxxxx","1","0","0","0","00")
+MPY_ENC(M2_vdmacs_s1,        "1010","xxxxx","1","0","0","1","00")
+MPY_ENC(M2_vrcmaci_s0c,      "1010","xxxxx","0","0","1","0","00")
+MPY_ENC(M2_vcmac_s0_sat_i,   "1010","xxxxx","1","0","1","0","00")
+MPY_ENC(M2_vcmac_s0_sat_r,   "1010","xxxxx","1","1","0","0","00")
+MPY_ENC(M2_vrcmpys_acc_s1_h, "1010","xxxxx","1","1","0","1","00")
+MPY_ENC(M2_vrcmpys_acc_s1_l, "1010","xxxxx","1","1","1","1","00")
+MPY_ENC(M2_vrcmacr_s0,       "1010","xxxxx","0","0","0","0","01")
+MPY_ENC(A2_vraddub_acc,      "1010","xxxxx","0","0","1","0","01")
+MPY_ENC(M2_mmacls_s0,        "1010","xxxxx","1","0","0","0","01")
+MPY_ENC(M2_mmacls_s1,        "1010","xxxxx","1","0","0","1","01")
+MPY_ENC(M2_mmacls_rs0,       "1010","xxxxx","1","1","0","0","01")
+MPY_ENC(M2_mmacls_rs1,       "1010","xxxxx","1","1","0","1","01")
+MPY_ENC(M2_mmaculs_s0,       "1010","xxxxx","1","0","1","0","01")
+MPY_ENC(M2_mmaculs_s1,       "1010","xxxxx","1","0","1","1","01")
+MPY_ENC(M2_mmaculs_rs0,      "1010","xxxxx","1","1","1","0","01")
+MPY_ENC(M2_mmaculs_rs1,      "1010","xxxxx","1","1","1","1","01")
+MPY_ENC(M2_vrcmacr_s0c,      "1010","xxxxx","0","1","1","0","01")
+MPY_ENC(M2_vrmac_s0,         "1010","xxxxx","0","0","0","0","10")
+MPY_ENC(A2_vrsadub_acc,      "1010","xxxxx","0","0","1","0","10")
+MPY_ENC(M2_vmac2es_s0,       "1010","xxxxx","1","0","0","0","10")
+MPY_ENC(M2_vmac2es_s1,       "1010","xxxxx","1","0","0","1","10")
+MPY_ENC(M2_vmac2es,          "1010","xxxxx","0","1","0","0","10")
+MPY_ENC(M2_mmachs_s0,        "1010","xxxxx","1","0","0","0","11")
+MPY_ENC(M2_mmachs_s1,        "1010","xxxxx","1","0","0","1","11")
+MPY_ENC(M2_mmachs_rs0,       "1010","xxxxx","1","1","0","0","11")
+MPY_ENC(M2_mmachs_rs1,       "1010","xxxxx","1","1","0","1","11")
+MPY_ENC(M2_mmacuhs_s0,       "1010","xxxxx","1","0","1","0","11")
+MPY_ENC(M2_mmacuhs_s1,       "1010","xxxxx","1","0","1","1","11")
+MPY_ENC(M2_mmacuhs_rs0,      "1010","xxxxx","1","1","1","0","11")
+MPY_ENC(M2_mmacuhs_rs1,      "1010","xxxxx","1","1","1","1","11")
+MPY_ENC(M4_vrmpyeh_acc_s0,   "1010","xxxxx","1","1","0","0","10")
+MPY_ENC(M4_vrmpyeh_acc_s1,   "1010","xxxxx","1","1","0","1","10")
+MPY_ENC(M4_vrmpyoh_acc_s0,   "1010","xxxxx","1","1","1","0","10")
+MPY_ENC(M4_vrmpyoh_acc_s1,   "1010","xxxxx","1","1","1","1","10")
+MPY_ENC(M5_vrmacbuu,         "1010","xxxxx","0","0","0","1","01")
+MPY_ENC(M5_vrmacbsu,         "1010","xxxxx","0","0","1","1","01")
+MPY_ENC(M5_vdmacbsu,         "1010","xxxxx","0","1","0","0","01")
+
+MPY_ENC(F2_dfmpylh,          "1010","xxxxx","0","0","0","0","11")
+MPY_ENC(F2_dfmpyhh,          "1010","xxxxx","0","0","0","1","11")
+#ifdef ADD_DP_OPS
+MPY_ENC(F2_dfmpyhh,          "1010","xxxxx","0","0","1","0","11")
+MPY_ENC(F2_dffma,            "1010","xxxxx","0","0","0","0","11")
+MPY_ENC(F2_dffms,            "1010","xxxxx","0","0","0","1","11")
+
+MPY_ENC(F2_dffma_lib,        "1010","xxxxx","0","0","1","0","11")
+MPY_ENC(F2_dffms_lib,        "1010","xxxxx","0","0","1","1","11")
+MPY_ENC(F2_dffma_sc,         "1010","xxxxx","0","1","1","1","uu")
+#endif
+
+
+MPY_ENC(M7_dcmpyrw_acc,      "1010","xxxxx","0","0","0","1","10")
+MPY_ENC(M7_dcmpyrwc_acc,     "1010","xxxxx","0","0","1","1","10")
+MPY_ENC(M7_dcmpyiw_acc,      "1010","xxxxx","0","1","1","0","10")
+MPY_ENC(M7_dcmpyiwc_acc,     "1010","xxxxx","1","0","1","0","10")
+
+
+
+
+/*
+*/
+
+DEF_FIELDROW_DESC32(ICLASS_M" 1011 -------- PP------ --------","[#11] Reserved")
+MPY_ENC(F2_sfadd,            "1011","ddddd","0","0","0","0","00")
+MPY_ENC(F2_sfsub,            "1011","ddddd","0","0","0","0","01")
+MPY_ENC(F2_sfmax,            "1011","ddddd","0","0","0","1","00")
+MPY_ENC(F2_sfmin,            "1011","ddddd","0","0","0","1","01")
+MPY_ENC(F2_sfmpy,            "1011","ddddd","0","0","1","0","00")
+MPY_ENC(F2_sffixupn,         "1011","ddddd","0","0","1","1","00")
+MPY_ENC(F2_sffixupd,         "1011","ddddd","0","0","1","1","01")
+
+DEF_FIELDROW_DESC32(ICLASS_M" 1100 -------- PP------ --------","[#12] Rd=(Rs,Rt)")
+DEF_FIELD32(ICLASS_M"         1100 -------- PP------ --!-----",Mc_tH,"Rt is High") /*Rt high */
+DEF_FIELD32(ICLASS_M"         1100 -------- PP------ -!------",Mc_sH,"Rs is High") /* Rs high */
+SP_MPY(M2_mpy,               "1100","ddddd","0","0","0")
+SP_MPY(M2_mpy_sat,           "1100","ddddd","1","0","0")
+SP_MPY(M2_mpy_rnd,           "1100","ddddd","0","1","0")
+SP_MPY(M2_mpy_sat_rnd,       "1100","ddddd","1","1","0")
+SP_MPY(M2_mpyu,              "1100","ddddd","0","0","1")
+
+DEF_FIELDROW_DESC32(ICLASS_M" 1101 -------- PP------ --------","[#13] Rd=(Rs,Rt)")
+/* EJP: same as mpyi MPY_ENC(M2_mpyui,            "1101","ddddd","0","0","1","0","00") */
+MPY_ENC(M2_mpyi,             "1101","ddddd","0","0","0","0","00")
+MPY_ENC(M2_mpy_up,           "1101","ddddd","0","0","0","0","01")
+MPY_ENC(M2_mpyu_up,          "1101","ddddd","0","0","1","0","01")
+MPY_ENC(M2_dpmpyss_rnd_s0,   "1101","ddddd","0","1","0","0","01")
+MPY_ENC(M2_cmpyrs_s0,        "1101","ddddd","1","1","0","0","10")
+MPY_ENC(M2_cmpyrs_s1,        "1101","ddddd","1","1","0","1","10")
+MPY_ENC(M2_cmpyrsc_s0,       "1101","ddddd","1","1","1","0","10")
+MPY_ENC(M2_cmpyrsc_s1,       "1101","ddddd","1","1","1","1","10")
+MPY_ENC(M2_vmpy2s_s0pack,    "1101","ddddd","1","1","0","0","11")
+MPY_ENC(M2_vmpy2s_s1pack,    "1101","ddddd","1","1","0","1","11")
+MPY_ENC(M2_hmmpyh_rs1,       "1101","ddddd","1","1","0","1","00")
+MPY_ENC(M2_hmmpyl_rs1,       "1101","ddddd","1","1","1","1","00")
+
+MPY_ENC(M2_hmmpyh_s1,        "1101","ddddd","0","1","0","1","00")
+MPY_ENC(M2_hmmpyl_s1,        "1101","ddddd","0","1","0","1","01")
+MPY_ENC(M2_mpy_up_s1,        "1101","ddddd","0","1","0","1","10")
+MPY_ENC(M2_mpy_up_s1_sat,    "1101","ddddd","0","1","1","1","00")
+MPY_ENC(M2_mpysu_up,         "1101","ddddd","0","1","1","0","01")
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 1110 -------- PP------ --------","[#14] Rx=(Rs,Rt)")
+DEF_FIELD32(ICLASS_M"         1110 -------- PP------ --!-----",Md_tH,"Rt is High") /*Rt high */
+DEF_FIELD32(ICLASS_M"         1110 -------- PP------ -!------",Md_sH,"Rs is High") /* Rs high */
+SP_MPY(M2_mpyu_acc,          "1110","xxxxx","0","0","1")
+SP_MPY(M2_mpy_acc,           "1110","xxxxx","0","0","0")
+SP_MPY(M2_mpy_acc_sat,       "1110","xxxxx","1","0","0")
+SP_MPY(M2_mpyu_nac,          "1110","xxxxx","0","1","1")
+SP_MPY(M2_mpy_nac,           "1110","xxxxx","0","1","0")
+SP_MPY(M2_mpy_nac_sat,       "1110","xxxxx","1","1","0")
+
+
+DEF_FIELDROW_DESC32(ICLASS_M" 1111 -------- PP------ --------","[#15] Rx=(Rs,Rt)")
+MPY_ENC(M2_maci,             "1111","xxxxx","0","0","0","0","00")
+MPY_ENC(M2_mnaci,            "1111","xxxxx","0","0","0","1","00")
+MPY_ENC(M2_acci,             "1111","xxxxx","0","0","0","0","01")
+MPY_ENC(M2_nacci,            "1111","xxxxx","0","0","0","1","01")
+MPY_ENC(M2_xor_xacc,         "1111","xxxxx","0","0","0","1","11")
+MPY_ENC(M2_subacc,           "1111","xxxxx","0","0","0","0","11")
+
+MPY_ENC(M4_mac_up_s1_sat,    "1111","xxxxx","0","1","1","0","00")
+MPY_ENC(M4_nac_up_s1_sat,    "1111","xxxxx","0","1","1","0","01")
+
+MPY_ENC(M4_and_and,          "1111","xxxxx","0","0","1","0","00")
+MPY_ENC(M4_and_or,           "1111","xxxxx","0","0","1","0","01")
+MPY_ENC(M4_and_xor,          "1111","xxxxx","0","0","1","0","10")
+MPY_ENC(M4_or_and,           "1111","xxxxx","0","0","1","0","11")
+MPY_ENC(M4_or_or,            "1111","xxxxx","0","0","1","1","00")
+MPY_ENC(M4_or_xor,           "1111","xxxxx","0","0","1","1","01")
+MPY_ENC(M4_xor_and,          "1111","xxxxx","0","0","1","1","10")
+MPY_ENC(M4_xor_or,           "1111","xxxxx","0","0","1","1","11")
+
+MPY_ENC(M4_or_andn,          "1111","xxxxx","0","1","0","0","00")
+MPY_ENC(M4_and_andn,         "1111","xxxxx","0","1","0","0","01")
+MPY_ENC(M4_xor_andn,         "1111","xxxxx","0","1","0","0","10")
+
+MPY_ENC(F2_sffma,            "1111","xxxxx","1","0","0","0","00")
+MPY_ENC(F2_sffms,            "1111","xxxxx","1","0","0","0","01")
+
+MPY_ENC(F2_sffma_lib,        "1111","xxxxx","1","0","0","0","10")
+MPY_ENC(F2_sffms_lib,        "1111","xxxxx","1","0","0","0","11")
+
+MPY_ENC(F2_sffma_sc,         "1111","xxxxx","1","1","1","0","uu")
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*           ALU32_2op         */
+/*                             */
+/*                             */
+/*******************************/
+DEF_CLASS32(ICLASS_ADDI" ---- -------- PP------ --------",ALU32_ADDI)
+
+DEF_CLASS32(ICLASS_ALU2op" ---- -------- PP------ --------",ALU32_2op)
+DEF_FIELD32(ICLASS_ALU2op" !--- -------- PP------ --------",A2_Rs,"No Rs read")
+DEF_FIELD32(ICLASS_ALU2op" -!!! -------- PP------ --------",A2_MajOp,"Major Opcode")
+DEF_FIELD32(ICLASS_ALU2op" ---- !!!----- PP------ --------",A2_MinOp,"Minor Opcode")
+
+DEF_FIELD32(ICLASS_ALU3op" -!!! -------- PP------ --------",A3_MajOp,"Major Opcode")
+DEF_FIELD32(ICLASS_ALU3op" ---- !!!----- PP------ --------",A3_MinOp,"Minor Opcode")
+DEF_CLASS32(ICLASS_ALU3op" ---- -------- PP------ --------",ALU32_3op)
+DEF_FIELD32(ICLASS_ALU3op" !--- -------- PP------ --------",A3_P,"Predicated")
+DEF_FIELD32(ICLASS_ALU3op" ---- -------- PP!----- --------",A3_DN,"Dot-new")
+DEF_FIELD32(ICLASS_ALU3op" ---- -------- PP------ !-------",A3_PS,"Predicate sense")
+
+
+/*************************/
+/* Our good friend addi  */
+/*************************/
+DEF_ENC32(A2_addi,    ICLASS_ADDI"  iiii iiisssss PPiiiiii iiiddddd")
+
+
+/*******************************/
+/* Standard ALU32 insns        */
+/*******************************/
+
+#define ALU32_IRR_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS)\
+DEF_ENC32(TAG, ICLASS_ALU2op" "MAJ4"  "MIN3"sssss  PP"SMOD1"iiiii "VMIN3 DSTCHARS)
+
+#define ALU32_RR_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS)\
+DEF_ENC32(TAG, ICLASS_ALU2op" "MAJ4"  "MIN3"sssss  PP"SMOD1"----- "VMIN3 DSTCHARS)
+
+#define CONDA32_RR_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS)\
+DEF_ENC32(TAG##t,   ICLASS_ALU2op" "MAJ4"  "MIN3"sssss  PP"SMOD1"-00uu "VMIN3 DSTCHARS)\
+DEF_ENC32(TAG##f,   ICLASS_ALU2op" "MAJ4"  "MIN3"sssss  PP"SMOD1"-10uu "VMIN3 DSTCHARS)\
+DEF_ENC32(TAG##tnew,ICLASS_ALU2op" "MAJ4"  "MIN3"sssss  PP"SMOD1"-01uu "VMIN3 DSTCHARS)\
+DEF_ENC32(TAG##fnew,ICLASS_ALU2op" "MAJ4"  "MIN3"sssss  PP"SMOD1"-11uu "VMIN3 DSTCHARS)
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 0000 -------- PP------ --------","[#0] (Pu) Rd=(Rs)")
+DEF_FIELD32(            ICLASS_ALU2op" 0000 -------- PP!----- --------",A32a_C,"Conditional")
+DEF_FIELD32(            ICLASS_ALU2op" 0000 -------- PP--!--- --------",A32a_S,"Predicate sense")
+DEF_FIELD32(            ICLASS_ALU2op" 0000 -------- PP---!-- --------",A32a_dn,"Dot-new")
+
+ALU32_RR_ENC(A2_aslh,                 "0000","000","0","---","ddddd")
+ALU32_RR_ENC(A2_asrh,                 "0000","001","0","---","ddddd")
+ALU32_RR_ENC(A2_tfr,                  "0000","011","0","---","ddddd")
+ALU32_RR_ENC(A2_sxtb,                 "0000","101","0","---","ddddd")
+ALU32_RR_ENC(A2_zxth,                 "0000","110","0","---","ddddd")
+ALU32_RR_ENC(A2_sxth,                 "0000","111","0","---","ddddd")
+
+CONDA32_RR_ENC(A4_paslh,               "0000","000","1","---","ddddd")
+CONDA32_RR_ENC(A4_pasrh,               "0000","001","1","---","ddddd")
+CONDA32_RR_ENC(A4_pzxtb,               "0000","100","1","---","ddddd")
+CONDA32_RR_ENC(A4_psxtb,               "0000","101","1","---","ddddd")
+CONDA32_RR_ENC(A4_pzxth,               "0000","110","1","---","ddddd")
+CONDA32_RR_ENC(A4_psxth,               "0000","111","1","---","ddddd")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 0001 -------- PP------ --------","[#1] Rx=(#u16)")
+DEF_ENC32(A2_tfril,     ICLASS_ALU2op" 0001 ii1xxxxx PPiiiiii iiiiiiii")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 0010 -------- PP------ --------","[#2] Rx=(#u16)")
+DEF_ENC32(A2_tfrih,     ICLASS_ALU2op" 0010 ii1xxxxx PPiiiiii iiiiiiii")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 0011 -------- PP------ --------","[#3] Rd=(Pu,Rs,#s8)")
+DEF_ENC32(C2_muxir,     ICLASS_ALU2op" 0011 0uusssss PP0iiiii iiiddddd")
+DEF_ENC32(C2_muxri,     ICLASS_ALU2op" 0011 1uusssss PP0iiiii iiiddddd")
+
+DEF_ENC32(A4_combineri, ICLASS_ALU2op" 0011 -00sssss PP1iiiii iiiddddd") /* Rdd = (Rs,#s8) */
+DEF_ENC32(A4_combineir, ICLASS_ALU2op" 0011 -01sssss PP1iiiii iiiddddd") /* Rdd = (Rs,#s8) */
+DEF_ENC32(A4_rcmpeqi,   ICLASS_ALU2op" 0011 -10sssss PP1iiiii iiiddddd") /* Rd = (Rs,#s8) */
+DEF_ENC32(A4_rcmpneqi,  ICLASS_ALU2op" 0011 -11sssss PP1iiiii iiiddddd") /* Rd = (Rs,#s8) */
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 0100 -------- PP------ --------","[#4] (Pu) Rd=(Rs,#s8)")
+DEF_FIELD32(            ICLASS_ALU2op" 0100 -------- PP!----- --------",A32a_DN,"Dot-new")
+DEF_FIELD32(            ICLASS_ALU2op" 0100 !------- PP------ --------",A32a_PS,"Predicate sense")
+DEF_ENC32(A2_paddit,    ICLASS_ALU2op" 0100 0uusssss PP0iiiii iiiddddd")
+DEF_ENC32(A2_padditnew, ICLASS_ALU2op" 0100 0uusssss PP1iiiii iiiddddd")
+DEF_ENC32(A2_paddif,    ICLASS_ALU2op" 0100 1uusssss PP0iiiii iiiddddd")
+DEF_ENC32(A2_paddifnew, ICLASS_ALU2op" 0100 1uusssss PP1iiiii iiiddddd")
+
+
+DEF_FIELDROW_DESC32(     ICLASS_ALU2op" 0101 -------- PP------ --------","[#5] Pd=(Rs,#s10)")
+DEF_ENC32(C2_cmpeqi,     ICLASS_ALU2op" 0101 00isssss PPiiiiii iii000dd")
+DEF_ENC32(C2_cmpgti,     ICLASS_ALU2op" 0101 01isssss PPiiiiii iii000dd")
+DEF_ENC32(C2_cmpgtui,    ICLASS_ALU2op" 0101 100sssss PPiiiiii iii000dd")
+
+DEF_ENC32(C4_cmpneqi,    ICLASS_ALU2op" 0101 00isssss PPiiiiii iii100dd")
+DEF_ENC32(C4_cmpltei,    ICLASS_ALU2op" 0101 01isssss PPiiiiii iii100dd")
+DEF_ENC32(C4_cmplteui,   ICLASS_ALU2op" 0101 100sssss PPiiiiii iii100dd")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 0110 -------- PP------ --------","[#6] Rd=(Rs,#s10)")
+ALU32_IRR_ENC(A2_andir,               "0110","00i","i","iii","ddddd")
+ALU32_IRR_ENC(A2_subri,               "0110","01i","i","iii","ddddd")
+ALU32_IRR_ENC(A2_orir,                "0110","10i","i","iii","ddddd")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 0111 -------- PP------ --------","[#7] Reserved")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 1000 -------- PP------ --------","[#8] Rd=#s16")
+DEF_ENC32(A2_tfrsi,     ICLASS_ALU2op" 1000 ii-iiiii PPiiiiii iiiddddd")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 1001 -------- PP------ --------","[#9] Reserved")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 101- -------- PP------ --------","[#10,#11] Rd=(Pu,#s8,#S8)")
+DEF_ENC32(C2_muxii,     ICLASS_ALU2op" 101u uIIIIIII PPIiiiii iiiddddd")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 1100 -------- PP------ --------","[#12] Rdd=(#s8,#S8)")
+DEF_ENC32(A2_combineii, ICLASS_ALU2op" 1100 0IIIIIII PPIiiiii iiiddddd")
+DEF_ENC32(A4_combineii, ICLASS_ALU2op" 1100 1--IIIII PPIiiiii iiiddddd")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 1101 -------- PP------ --------","[#13] Reserved")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 1110 -------- PP------ --------","[#14] (Pu) Rd=#s12")
+DEF_FIELD32(            ICLASS_ALU2op" 1110 ---0---- PP!----- --------",A32c_DN,"Dot-new")
+DEF_FIELD32(            ICLASS_ALU2op" 1110 !--0---- PP------ --------",A32c_PS,"Predicate sense")
+DEF_ENC32(C2_cmovenewit,ICLASS_ALU2op" 1110 0uu0iiii PP1iiiii iiiddddd")
+DEF_ENC32(C2_cmovenewif,ICLASS_ALU2op" 1110 1uu0iiii PP1iiiii iiiddddd")
+DEF_ENC32(C2_cmoveit,   ICLASS_ALU2op" 1110 0uu0iiii PP0iiiii iiiddddd")
+DEF_ENC32(C2_cmoveif,   ICLASS_ALU2op" 1110 1uu0iiii PP0iiiii iiiddddd")
+
+
+DEF_FIELDROW_DESC32(    ICLASS_ALU2op" 1111 -------- PP------ --------","[#15] nop")
+DEF_ENC32(A2_nop,       ICLASS_ALU2op" 1111 -------- PP------ --------")
+
+
+
+
+
+
+
+
+
+
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*    ALU32_3op                */
+/*                             */
+/*                             */
+/*******************************/
+
+
+#define V2A32_RRR_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS)\
+DEF_ENC32(TAG, ICLASS_ALU3op" "MAJ4"  "MIN3"sssss  PP"SMOD1"ttttt "VMIN3 DSTCHARS)
+
+#define V2A32_RR_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS)\
+DEF_ENC32(TAG, ICLASS_ALU3op" "MAJ4"  "MIN3"sssss  PP"SMOD1"----- "VMIN3 DSTCHARS)
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  0000 -------- PP------ --------","[#0] Reserved")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  0001 -------- PP------ --------","[#1] Rd=(Rs,Rt)")
+V2A32_RRR_ENC(A2_and,              "0001","000","-","---","ddddd")
+V2A32_RRR_ENC(A2_or,               "0001","001","-","---","ddddd")
+V2A32_RRR_ENC(A2_xor,              "0001","011","-","---","ddddd")
+V2A32_RRR_ENC(A4_andn,             "0001","100","-","---","ddddd")
+V2A32_RRR_ENC(A4_orn,              "0001","101","-","---","ddddd")
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  0010 -------- PP------ --------","[#2] Pd=(Rs,Rt)")
+V2A32_RRR_ENC(C2_cmpeq,            "0010","-00","-","---","000dd")
+V2A32_RRR_ENC(C2_cmpgt,            "0010","-10","-","---","000dd")
+V2A32_RRR_ENC(C2_cmpgtu,           "0010","-11","-","---","000dd")
+
+V2A32_RRR_ENC(C4_cmpneq,           "0010","-00","-","---","100dd")
+V2A32_RRR_ENC(C4_cmplte,           "0010","-10","-","---","100dd")
+V2A32_RRR_ENC(C4_cmplteu,          "0010","-11","-","---","100dd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  0011 -------- PP------ --------","[#3] Rd=(Rs,Rt)")
+V2A32_RRR_ENC(A2_add,              "0011","000","-","---","ddddd")
+V2A32_RRR_ENC(A2_sub,              "0011","001","-","---","ddddd")
+V2A32_RRR_ENC(A2_combine_hh,       "0011","100","-","---","ddddd")
+V2A32_RRR_ENC(A2_combine_hl,       "0011","101","-","---","ddddd")
+V2A32_RRR_ENC(A2_combine_lh,       "0011","110","-","---","ddddd")
+V2A32_RRR_ENC(A2_combine_ll,       "0011","111","-","---","ddddd")
+V2A32_RRR_ENC(A4_rcmpeq,           "0011","010","-","---","ddddd")
+V2A32_RRR_ENC(A4_rcmpneq,          "0011","011","-","---","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  0100 -------- PP------ --------","[#4] Rd=(Pu,Rs,Rt)")
+V2A32_RRR_ENC(C2_mux,              "0100","---","-","-uu","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  0101 -------- PP------ --------","[#5] Rdd=(Rs,Rt)")
+V2A32_RRR_ENC(A2_combinew,         "0101","0--","-","---","ddddd")
+V2A32_RRR_ENC(S2_packhl,           "0101","1--","-","---","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  0110 -------- PP------ --------","[#6] Rd=(Rs,Rt)")
+V2A32_RRR_ENC(A2_svaddh,           "0110","000","-","---","ddddd")
+V2A32_RRR_ENC(A2_svaddhs,          "0110","001","-","---","ddddd")
+V2A32_RRR_ENC(A2_svadduhs,         "0110","011","-","---","ddddd")
+V2A32_RRR_ENC(A2_svsubh,           "0110","100","-","---","ddddd")
+V2A32_RRR_ENC(A2_svsubhs,          "0110","101","-","---","ddddd")
+V2A32_RRR_ENC(A2_svsubuhs,         "0110","111","-","---","ddddd")
+V2A32_RRR_ENC(A2_addsat,           "0110","010","-","---","ddddd")
+V2A32_RRR_ENC(A2_subsat,           "0110","110","-","---","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  0111 -------- PP------ --------","[#7] Rd=(Rs,Rt)")
+V2A32_RRR_ENC(A2_svavgh,           "0111","-00","-","---","ddddd")
+V2A32_RRR_ENC(A2_svavghs,          "0111","-01","-","---","ddddd")
+V2A32_RRR_ENC(A2_svnavgh,          "0111","-11","-","---","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  1000 -------- PP------ --------","[#8] Reserved")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  1001 -------- PP------ --------","[#9] (Pu) Rd=(Rs,Rt)")
+V2A32_RRR_ENC(A2_pandt,            "1001","-00","0","0uu","ddddd")
+V2A32_RRR_ENC(A2_pandtnew,         "1001","-00","1","0uu","ddddd")
+V2A32_RRR_ENC(A2_pandf,            "1001","-00","0","1uu","ddddd")
+V2A32_RRR_ENC(A2_pandfnew,         "1001","-00","1","1uu","ddddd")
+V2A32_RRR_ENC(A2_port,             "1001","-01","0","0uu","ddddd")
+V2A32_RRR_ENC(A2_portnew,          "1001","-01","1","0uu","ddddd")
+V2A32_RRR_ENC(A2_porf,             "1001","-01","0","1uu","ddddd")
+V2A32_RRR_ENC(A2_porfnew,          "1001","-01","1","1uu","ddddd")
+V2A32_RRR_ENC(A2_pxort,            "1001","-11","0","0uu","ddddd")
+V2A32_RRR_ENC(A2_pxortnew,         "1001","-11","1","0uu","ddddd")
+V2A32_RRR_ENC(A2_pxorf,            "1001","-11","0","1uu","ddddd")
+V2A32_RRR_ENC(A2_pxorfnew,         "1001","-11","1","1uu","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  1010 -------- PP------ --------","[#10] Reserved")
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  1011 -------- PP------ --------","[#11] (Pu) Rd=(Rs,Rt)")
+V2A32_RRR_ENC(A2_paddt,            "1011","0-0","0","0uu","ddddd")
+V2A32_RRR_ENC(A2_paddtnew,         "1011","0-0","1","0uu","ddddd")
+V2A32_RRR_ENC(A2_paddf,            "1011","0-0","0","1uu","ddddd")
+V2A32_RRR_ENC(A2_paddfnew,         "1011","0-0","1","1uu","ddddd")
+V2A32_RRR_ENC(A2_psubt,            "1011","0-1","0","0uu","ddddd")
+V2A32_RRR_ENC(A2_psubtnew,         "1011","0-1","1","0uu","ddddd")
+V2A32_RRR_ENC(A2_psubf,            "1011","0-1","0","1uu","ddddd")
+V2A32_RRR_ENC(A2_psubfnew,         "1011","0-1","1","1uu","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  1100 -------- PP------ --------","[#12] Reserved")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  1101 -------- PP------ --------","[#13] (Pu) Rdd=(Rs,Rt)")
+V2A32_RRR_ENC(C2_ccombinewnewt,    "1101","000","1","0uu","ddddd")
+V2A32_RRR_ENC(C2_ccombinewnewf,    "1101","000","1","1uu","ddddd")
+V2A32_RRR_ENC(C2_ccombinewt,       "1101","000","0","0uu","ddddd")
+V2A32_RRR_ENC(C2_ccombinewf,       "1101","000","0","1uu","ddddd")
+
+
+
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU3op"  1110 -------- PP------ --------","[#14] Reserved")
+
+
+
+
+
+
+
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*    S                        */
+/*                             */
+/*                             */
+/*******************************/
+
+DEF_CLASS32(ICLASS_S2op" ---- -------- PP------ --------",S_2op)
+DEF_FIELD32(ICLASS_S2op" !!!! -------- PP------ --------",STYPEB_RegType,"Register Type")
+DEF_FIELD32(ICLASS_S2op" ---- !!------ PP------ --------",S2_MajOp,"Major Opcode")
+DEF_FIELD32(ICLASS_S2op" ---- -------- PP------ !!!-----",S2_MinOp,"Minor Opcode")
+
+DEF_CLASS32(ICLASS_S3op" ---- -------- PP------ --------",S_3op)
+DEF_FIELD32(ICLASS_S3op" !!!! -------- PP------ --------",STYPEA_RegType,"Register Type")
+DEF_FIELD32(ICLASS_S3op" ---- !!------ PP------ --------",S3_Maj,"Major Opcode")
+DEF_FIELD32(ICLASS_S3op" ---- -------- PP------ !!------",S3_Min,"Minor Opcode")
+
+
+#define SH_RRR_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS) \
+DEF_ENC32(TAG,ICLASS_S3op" "MAJ4"  "MIN3"sssss  PP"SMOD1"ttttt "VMIN3 DSTCHARS)
+
+#define SH_RRRiENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS) \
+DEF_ENC32(TAG,ICLASS_S3op" "MAJ4"  "MIN3"iiiii  PP"SMOD1"ttttt "VMIN3 DSTCHARS)
+
+#define SH_RRR_ENCX(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS) \
+DEF_ENC32(TAG,ICLASS_S3op" "MAJ4"  "MIN3"sssss  PP"SMOD1"xxxxx "VMIN3 DSTCHARS)
+
+#define SH3_RR_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS) \
+DEF_ENC32(TAG,ICLASS_S3op" "MAJ4"  "MIN3"sssss  PP"SMOD1"----- "VMIN3 DSTCHARS)
+
+#define SH_PPP_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS) \
+DEF_ENC32(TAG,ICLASS_S3op" "MAJ4"  "MIN3"---ss  PP"SMOD1"---tt "VMIN3 DSTCHARS)
+
+#define SH2_RR_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS) \
+DEF_ENC32(TAG,ICLASS_S2op" "MAJ4"  "MIN3"sssss  PP"SMOD1"----- "VMIN3 DSTCHARS)
+
+#define SH2_PPP_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS) \
+DEF_ENC32(TAG,ICLASS_S2op" "MAJ4"  "MIN3"---ss  PP"SMOD1"---tt "VMIN3 DSTCHARS)
+
+#define SH_RRI4_ENC(TAG,MAJ4,MIN3,VMIN3,DSTCHARS) \
+DEF_ENC32(TAG,ICLASS_S2op" "MAJ4" "MIN3 "sssss PP00iiii " VMIN3 DSTCHARS)
+
+#define SH_RRI5_ENC(TAG,MAJ4,MIN3,VMIN3,DSTCHARS) \
+DEF_ENC32(TAG,ICLASS_S2op" "MAJ4" "MIN3 "sssss PP0iiiii " VMIN3 DSTCHARS)
+
+#define SH_RRI6_ENC(TAG,MAJ4,MIN3,VMIN3,DSTCHARS) \
+DEF_ENC32(TAG,ICLASS_S2op" "MAJ4" "MIN3 "sssss PPiiiiii " VMIN3 DSTCHARS)
+
+#define RSHIFTTYPES(TAGEND,MAJ4,MIN3,SMOD1,DMOD1,DSTCHARS) \
+SH_RRR_ENC(S2_asr_r_##TAGEND,MAJ4,MIN3,SMOD1,"00"DMOD1,DSTCHARS) \
+SH_RRR_ENC(S2_lsr_r_##TAGEND,MAJ4,MIN3,SMOD1,"01"DMOD1,DSTCHARS) \
+SH_RRR_ENC(S2_asl_r_##TAGEND,MAJ4,MIN3,SMOD1,"10"DMOD1,DSTCHARS) \
+SH_RRR_ENC(S2_lsl_r_##TAGEND,MAJ4,MIN3,SMOD1,"11"DMOD1,DSTCHARS)
+
+
+#define I5SHIFTTYPES(TAGEND,MAJ4,MIN3,SMOD1,DSTCHARS) \
+SH_RRI5_ENC(S2_asr_i_##TAGEND,MAJ4,MIN3,SMOD1 "00",DSTCHARS) \
+SH_RRI5_ENC(S2_lsr_i_##TAGEND,MAJ4,MIN3,SMOD1 "01",DSTCHARS) \
+SH_RRI5_ENC(S2_asl_i_##TAGEND,MAJ4,MIN3,SMOD1 "10",DSTCHARS) \
+SH_RRI5_ENC(S6_rol_i_##TAGEND,MAJ4,MIN3,SMOD1 "11",DSTCHARS)
+
+#define I5SHIFTTYPES_NOROL(TAGEND,MAJ4,MIN3,SMOD1,DSTCHARS) \
+SH_RRI5_ENC(S2_asr_i_##TAGEND,MAJ4,MIN3,SMOD1 "00",DSTCHARS) \
+SH_RRI5_ENC(S2_lsr_i_##TAGEND,MAJ4,MIN3,SMOD1 "01",DSTCHARS) \
+SH_RRI5_ENC(S2_asl_i_##TAGEND,MAJ4,MIN3,SMOD1 "10",DSTCHARS)
+
+#define I5SHIFTTYPES_NOASR(TAGEND,MAJ4,MIN3,SMOD1,DSTCHARS) \
+SH_RRI5_ENC(S2_lsr_i_##TAGEND,MAJ4,MIN3,SMOD1 "01",DSTCHARS) \
+SH_RRI5_ENC(S2_asl_i_##TAGEND,MAJ4,MIN3,SMOD1 "10",DSTCHARS) \
+SH_RRI5_ENC(S6_rol_i_##TAGEND,MAJ4,MIN3,SMOD1 "11",DSTCHARS)
+
+#define I4SHIFTTYPES(TAGEND,MAJ4,MIN3,SMOD1,DSTCHARS) \
+SH_RRI4_ENC(S2_asr_i_##TAGEND,MAJ4,MIN3,SMOD1 "00",DSTCHARS) \
+SH_RRI4_ENC(S2_lsr_i_##TAGEND,MAJ4,MIN3,SMOD1 "01",DSTCHARS) \
+SH_RRI4_ENC(S2_asl_i_##TAGEND,MAJ4,MIN3,SMOD1 "10",DSTCHARS)
+
+#define I5ASHIFTTYPES(TAGEND,MAJ4,MIN3,SMOD1,DSTCHARS) \
+SH_RRI5_ENC(S2_asl_i_##TAGEND,MAJ4,MIN3,SMOD1 "10",DSTCHARS)
+
+#define I4ASHIFTTYPES(TAGEND,MAJ4,MIN3,SMOD1,DSTCHARS) \
+SH_RRI4_ENC(S2_asl_i_##TAGEND,MAJ4,MIN3,SMOD1 "10",DSTCHARS)
+
+#define I6SHIFTTYPES(TAGEND,MAJ4,MIN3,SMOD1,DSTCHARS) \
+SH_RRI6_ENC(S2_asr_i_##TAGEND,MAJ4,MIN3,SMOD1 "00",DSTCHARS) \
+SH_RRI6_ENC(S2_lsr_i_##TAGEND,MAJ4,MIN3,SMOD1 "01",DSTCHARS) \
+SH_RRI6_ENC(S2_asl_i_##TAGEND,MAJ4,MIN3,SMOD1 "10",DSTCHARS) \
+SH_RRI6_ENC(S6_rol_i_##TAGEND,MAJ4,MIN3,SMOD1 "11",DSTCHARS) \
+
+#define I6SHIFTTYPES_NOASR(TAGEND,MAJ4,MIN3,SMOD1,DSTCHARS) \
+SH_RRI6_ENC(S2_lsr_i_##TAGEND,MAJ4,MIN3,SMOD1 "01",DSTCHARS) \
+SH_RRI6_ENC(S2_asl_i_##TAGEND,MAJ4,MIN3,SMOD1 "10",DSTCHARS) \
+SH_RRI6_ENC(S6_rol_i_##TAGEND,MAJ4,MIN3,SMOD1 "11",DSTCHARS)
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op" 0000 -------- PP------ --------","[#0] Rdd=(Rss,#u6)")
+/* EJP: there is actually quite a bit of space here, look at the reserved bits */
+I6SHIFTTYPES(p,                 "0000","000","0","ddddd")
+I5SHIFTTYPES_NOROL(vw,          "0000","010","0","ddddd")
+I4SHIFTTYPES(vh,                "0000","100","0","ddddd")
+
+
+
+/* False assume an immediate */
+SH2_RR_ENC(S2_vsathub_nopack, "0000","000","-","1 00","ddddd")
+SH2_RR_ENC(S2_vsatwuh_nopack, "0000","000","-","1 01","ddddd")
+SH2_RR_ENC(S2_vsatwh_nopack,  "0000","000","-","1 10","ddddd")
+SH2_RR_ENC(S2_vsathb_nopack,  "0000","000","-","1 11","ddddd")
+
+SH_RRI4_ENC(S5_vasrhrnd,      "0000","001",    "0 00","ddddd")
+
+SH2_RR_ENC(A2_vabsh,          "0000","010","-","1 00","ddddd")
+SH2_RR_ENC(A2_vabshsat,       "0000","010","-","1 01","ddddd")
+SH2_RR_ENC(A2_vabsw,          "0000","010","-","1 10","ddddd")
+SH2_RR_ENC(A2_vabswsat,       "0000","010","-","1 11","ddddd")
+
+SH2_RR_ENC(A2_notp,           "0000","100","-","1 00","ddddd")
+SH2_RR_ENC(A2_negp,           "0000","100","-","1 01","ddddd")
+SH2_RR_ENC(A2_absp,           "0000","100","-","1 10","ddddd")
+SH2_RR_ENC(A2_vconj,          "0000","100","-","1 11","ddddd")
+
+SH2_RR_ENC(S2_deinterleave,   "0000","110","-","1 00","ddddd")
+SH2_RR_ENC(S2_interleave,     "0000","110","-","1 01","ddddd")
+SH2_RR_ENC(S2_brevp,          "0000","110","-","1 10","ddddd")
+SH_RRI6_ENC(S2_asr_i_p_rnd,   "0000","110",    "1 11","ddddd")
+
+SH2_RR_ENC(F2_conv_df2d,      "0000","111","0","0 00","ddddd")
+SH2_RR_ENC(F2_conv_df2ud,     "0000","111","0","0 01","ddddd")
+SH2_RR_ENC(F2_conv_ud2df,     "0000","111","0","0 10","ddddd")
+SH2_RR_ENC(F2_conv_d2df,      "0000","111","0","0 11","ddddd")
+#ifdef ADD_DP_OPS
+SH2_RR_ENC(F2_dffixupr,       "0000","111","0","1 00","ddddd")
+SH2_RR_ENC(F2_dfsqrtcheat,    "0000","111","0","1 01","ddddd")
+#endif
+SH2_RR_ENC(F2_conv_df2d_chop, "0000","111","0","1 10","ddddd")
+SH2_RR_ENC(F2_conv_df2ud_chop,"0000","111","0","1 11","ddddd")
+#ifdef ADD_DP_OPS
+SH2_RR_ENC(F2_dfinvsqrta,     "0000","111","1","0 ee","ddddd")
+#endif
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"    0001 -------- PP------ --------","[#1] Rdd=(Rss,#u6,#U6)")
+DEF_ENC32(S2_extractup,ICLASS_S2op" 0001 IIIsssss PPiiiiii IIIddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op" 0010 -------- PP------ --------","[#2] Rxx=(Rss,#u6)")
+I6SHIFTTYPES(p_nac,             "0010","00-","0","xxxxx")
+I6SHIFTTYPES(p_acc,             "0010","00-","1","xxxxx")
+I6SHIFTTYPES(p_and,             "0010","01-","0","xxxxx")
+I6SHIFTTYPES(p_or,              "0010","01-","1","xxxxx")
+I6SHIFTTYPES_NOASR(p_xacc,      "0010","10-","0","xxxxx")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"  0011 -------- PP------ --------","[#3] Rxx=(Rss,#u6,#U6)")
+DEF_ENC32(S2_insertp,ICLASS_S2op" 0011 IIIsssss PPiiiiii IIIxxxxx")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"  0100 -------- PP------ --------","[#4] Rdd=(Rs)")
+SH2_RR_ENC(S2_vsxtbh,            "0100","00-","-","00-","ddddd")
+SH2_RR_ENC(S2_vzxtbh,            "0100","00-","-","01-","ddddd")
+SH2_RR_ENC(S2_vsxthw,            "0100","00-","-","10-","ddddd")
+SH2_RR_ENC(S2_vzxthw,            "0100","00-","-","11-","ddddd")
+SH2_RR_ENC(A2_sxtw,              "0100","01-","-","00-","ddddd")
+SH2_RR_ENC(S2_vsplatrh,          "0100","01-","-","01-","ddddd")
+SH2_RR_ENC(S6_vsplatrbp,         "0100","01-","-","10-","ddddd")
+
+SH2_RR_ENC(F2_conv_sf2df,        "0100","1--","-","000","ddddd")
+SH2_RR_ENC(F2_conv_uw2df,        "0100","1--","-","001","ddddd")
+SH2_RR_ENC(F2_conv_w2df,         "0100","1--","-","010","ddddd")
+SH2_RR_ENC(F2_conv_sf2ud,        "0100","1--","-","011","ddddd")
+SH2_RR_ENC(F2_conv_sf2d,         "0100","1--","-","100","ddddd")
+SH2_RR_ENC(F2_conv_sf2ud_chop,   "0100","1--","-","101","ddddd")
+SH2_RR_ENC(F2_conv_sf2d_chop,    "0100","1--","-","110","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"   0101 -------- PP------ --------","[#5] Pd=(Rs,#u6)")
+DEF_ENC32(S2_tstbit_i,ICLASS_S2op" 0101 000sssss PP0iiiii ------dd")
+DEF_ENC32(C2_tfrrp,   ICLASS_S2op" 0101 010sssss PP------ ------dd")
+DEF_ENC32(C2_bitsclri,ICLASS_S2op" 0101 100sssss PPiiiiii ------dd")
+DEF_ENC32(S4_ntstbit_i,ICLASS_S2op"0101 001sssss PP0iiiii ------dd")
+DEF_ENC32(C4_nbitsclri,ICLASS_S2op"0101 101sssss PPiiiiii ------dd")
+DEF_ENC32(F2_sfclass,  ICLASS_S2op"0101 111sssss PP0iiiii ------dd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"   0110 -------- PP------ --------","[#6] Rdd=(Pt)")
+DEF_ENC32(C2_mask, ICLASS_S2op"    0110   --- -----  PP----tt --- ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"    0111 -------- PP------ --------","[#7] Rx=(Rs,#u4,#S6)")
+DEF_ENC32(S2_tableidxb,ICLASS_S2op" 0111 00isssss PPIIIIII iiixxxxx")
+DEF_ENC32(S2_tableidxh,ICLASS_S2op" 0111 01isssss PPIIIIII iiixxxxx")
+DEF_ENC32(S2_tableidxw,ICLASS_S2op" 0111 10isssss PPIIIIII iiixxxxx")
+DEF_ENC32(S2_tableidxd,ICLASS_S2op" 0111 11isssss PPIIIIII iiixxxxx")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"   1000 -------- PP------ --------","[#8] Rd=(Rss,#u6)")
+SH2_RR_ENC(S2_vsathub,            "1000","000","-","000","ddddd")
+SH2_RR_ENC(S2_vsatwh,             "1000","000","-","010","ddddd")
+SH2_RR_ENC(S2_vsatwuh,            "1000","000","-","100","ddddd")
+SH2_RR_ENC(S2_vsathb,             "1000","000","-","110","ddddd")
+SH2_RR_ENC(S2_clbp,               "1000","010","-","000","ddddd")
+SH2_RR_ENC(S2_cl0p,               "1000","010","-","010","ddddd")
+SH2_RR_ENC(S2_cl1p,               "1000","010","-","100","ddddd")
+SH2_RR_ENC(S2_ct0p,               "1000","111","-","010","ddddd")
+SH2_RR_ENC(S2_ct1p,               "1000","111","-","100","ddddd")
+SH2_RR_ENC(S2_vtrunohb,           "1000","100","-","000","ddddd")
+SH2_RR_ENC(S2_vtrunehb,           "1000","100","-","010","ddddd")
+SH2_RR_ENC(S2_vrndpackwh,         "1000","100","-","100","ddddd")
+SH2_RR_ENC(S2_vrndpackwhs,        "1000","100","-","110","ddddd")
+SH2_RR_ENC(A2_sat,                "1000","110","-","000","ddddd")
+SH2_RR_ENC(A2_roundsat,           "1000","110","-","001","ddddd")
+SH_RRI5_ENC(S2_asr_i_svw_trun,    "1000","110",    "010","ddddd")
+SH_RRI5_ENC(A4_bitspliti,         "1000","110",    "100","ddddd")
+
+SH_RRI5_ENC(A7_clip,              "1000","110",    "101","ddddd")
+SH_RRI5_ENC(A7_vclip,             "1000","110",    "110","ddddd")
+
+
+SH2_RR_ENC(S4_clbpnorm,           "1000","011","-","000","ddddd")
+SH_RRI6_ENC(S4_clbpaddi,          "1000","011",    "010","ddddd")
+SH2_RR_ENC(S5_popcountp,          "1000","011","-","011","ddddd")
+
+SH_RRI4_ENC(S5_asrhub_rnd_sat,    "1000","011",    "100","ddddd")
+SH_RRI4_ENC(S5_asrhub_sat,        "1000","011",    "101","ddddd")
+
+SH2_RR_ENC(F2_conv_df2sf,         "1000","000","-","001","ddddd")
+SH2_RR_ENC(F2_conv_ud2sf,         "1000","001","-","001","ddddd")
+SH2_RR_ENC(F2_conv_d2sf,          "1000","010","-","001","ddddd")
+SH2_RR_ENC(F2_conv_df2uw,         "1000","011","-","001","ddddd")
+SH2_RR_ENC(F2_conv_df2w,          "1000","100","-","001","ddddd")
+SH2_RR_ENC(F2_conv_df2uw_chop,    "1000","101","-","001","ddddd")
+SH2_RR_ENC(F2_conv_df2w_chop,     "1000","111","-","001","ddddd")
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"   1001 -------- PP------ --------","[#9] Rd=(Ps,Pt)")
+DEF_ENC32(C2_vitpack, ICLASS_S2op" 1001   -00 ---ss  PP----tt --- ddddd")
+DEF_ENC32(C2_tfrpr,   ICLASS_S2op" 1001   -1- ---ss  PP------ --- ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"   1010 -------- PP------ --------","[#10] Rdd=(Rss,#u6,#U6)")
+DEF_ENC32(S4_extractp,ICLASS_S2op" 1010 IIIsssss PPiiiiii IIIddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"   1011 -------- PP------ --------","[#11] Rd=(Rs)")
+SH2_RR_ENC(F2_conv_uw2sf,         "1011","001","-","000","ddddd")
+SH2_RR_ENC(F2_conv_w2sf,          "1011","010","-","000","ddddd")
+SH2_RR_ENC(F2_conv_sf2uw,         "1011","011","-","000","ddddd")
+SH2_RR_ENC(F2_conv_sf2w,          "1011","100","-","000","ddddd")
+SH2_RR_ENC(F2_conv_sf2uw_chop,    "1011","011","-","001","ddddd")
+SH2_RR_ENC(F2_conv_sf2w_chop,     "1011","100","-","001","ddddd")
+SH2_RR_ENC(F2_sffixupr,           "1011","101","-","000","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"      1100 -------- PP------ --------","[#12] Rd=(Rs,#u6)")
+I5SHIFTTYPES(r,                      "1100","000",            "0  ","ddddd")
+SH_RRI5_ENC(S2_asl_i_r_sat,          "1100","010",            "010","ddddd")
+SH_RRI5_ENC(S2_asr_i_r_rnd,          "1100","010",            "000","ddddd")
+
+SH2_RR_ENC(S2_svsathb,               "1100","10-","-",        "00-","ddddd")
+SH2_RR_ENC(S2_svsathub,              "1100","10-","-",        "01-","ddddd")
+
+SH_RRI5_ENC(A4_cround_ri,            "1100","111",            "00-","ddddd")
+SH_RRI6_ENC(A7_croundd_ri,           "1100","111",            "01-","ddddd")
+SH_RRI5_ENC(A4_round_ri,             "1100","111",            "10-","ddddd")
+SH_RRI5_ENC(A4_round_ri_sat,         "1100","111",            "11-","ddddd")
+
+DEF_ENC32(S2_setbit_i,   ICLASS_S2op" 1100   110sssss PP0iiiii 000ddddd")
+DEF_ENC32(S2_clrbit_i,   ICLASS_S2op" 1100   110sssss PP0iiiii 001ddddd")
+DEF_ENC32(S2_togglebit_i,ICLASS_S2op" 1100   110sssss PP0iiiii 010ddddd")
+
+DEF_ENC32(S4_clbaddi    ,ICLASS_S2op" 1100   001sssss PPiiiiii 000ddddd")
+
+
+
+/* False read #u6 */
+SH2_RR_ENC(S2_clb,                   "1100","000","-","1 00","ddddd")
+SH2_RR_ENC(S2_cl0,                   "1100","000","-","1 01","ddddd")
+SH2_RR_ENC(S2_cl1,                   "1100","000","-","1 10","ddddd")
+SH2_RR_ENC(S2_clbnorm,               "1100","000","-","1 11","ddddd")
+SH2_RR_ENC(S2_ct0,                   "1100","010","-","1 00","ddddd")
+SH2_RR_ENC(S2_ct1,                   "1100","010","-","1 01","ddddd")
+SH2_RR_ENC(S2_brev,                  "1100","010","-","1 10","ddddd")
+SH2_RR_ENC(S2_vsplatrb,              "1100","010","-","1 11","ddddd")
+SH2_RR_ENC(A2_abs,                   "1100","100","-","1 00","ddddd")
+SH2_RR_ENC(A2_abssat,                "1100","100","-","1 01","ddddd")
+SH2_RR_ENC(A2_negsat,                "1100","100","-","1 10","ddddd")
+SH2_RR_ENC(A2_swiz,                  "1100","100","-","1 11","ddddd")
+SH2_RR_ENC(A2_sath,                  "1100","110","-","1 00","ddddd")
+SH2_RR_ENC(A2_satuh,                 "1100","110","-","1 01","ddddd")
+SH2_RR_ENC(A2_satub,                 "1100","110","-","1 10","ddddd")
+SH2_RR_ENC(A2_satb,                  "1100","110","-","1 11","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"     1101 -------- PP------ --------","[#13] Rd=(Rs,#u6,#U6)")
+DEF_ENC32(S2_extractu,  ICLASS_S2op" 1101 0IIsssss PP0iiiii IIIddddd")
+DEF_ENC32(S4_extract,   ICLASS_S2op" 1101 1IIsssss PP0iiiii IIIddddd")
+DEF_ENC32(S2_mask,    ICLASS_S2op"   1101 0II----- PP1iiiii IIIddddd")
+
+
+
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"     1110 -------- PP------ --------","[#14] Rx=(Rs,#u6)")
+I5SHIFTTYPES(r_nac,       "1110","00-","0","xxxxx")
+I5SHIFTTYPES(r_acc,       "1110","00-","1","xxxxx")
+I5SHIFTTYPES(r_and,       "1110","01-","0","xxxxx")
+I5SHIFTTYPES(r_or,        "1110","01-","1","xxxxx")
+I5SHIFTTYPES_NOASR(r_xacc,"1110","10-","0","xxxxx")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S2op"     1111 -------- PP------ --------","[#15] Rs=(Rs,#u6,#U6)")
+DEF_ENC32(S2_insert,    ICLASS_S2op" 1111 0IIsssss PP0iiiii IIIxxxxx")
+
+
+
+
+
+/*************************/
+/* S_3_operand           */
+/*************************/
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 0000 -------- PP------ --------","[#0] Rdd=(Rss,Rtt,#u3)")
+SH_RRR_ENC(S2_valignib,         "0000","0--","-","iii","ddddd")
+SH_RRR_ENC(S2_vspliceib,        "0000","1--","-","iii","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 0001 -------- PP------ --------","[#1] Rdd=(Rss,Rtt)")
+SH_RRR_ENC(S2_extractup_rp,     "0001","00-","-","00-","ddddd")
+SH_RRR_ENC(S2_shuffeb,          "0001","00-","-","01-","ddddd")
+SH_RRR_ENC(S2_shuffob,          "0001","00-","-","10-","ddddd")
+SH_RRR_ENC(S2_shuffeh,          "0001","00-","-","11-","ddddd")
+
+SH_RRR_ENC(S2_shuffoh,          "0001","10-","-","000","ddddd")
+SH_RRR_ENC(S2_vtrunewh,         "0001","10-","-","010","ddddd")
+SH_RRR_ENC(S6_vtrunehb_ppp,     "0001","10-","-","011","ddddd")
+SH_RRR_ENC(S2_vtrunowh,         "0001","10-","-","100","ddddd")
+SH_RRR_ENC(S6_vtrunohb_ppp,     "0001","10-","-","101","ddddd")
+SH_RRR_ENC(S2_lfsp,             "0001","10-","-","110","ddddd")
+
+SH_RRR_ENC(S4_vxaddsubw,        "0001","01-","-","000","ddddd")
+SH_RRR_ENC(A5_vaddhubs,         "0001","01-","-","001","ddddd")
+SH_RRR_ENC(S4_vxsubaddw,        "0001","01-","-","010","ddddd")
+SH_RRR_ENC(S4_vxaddsubh,        "0001","01-","-","100","ddddd")
+SH_RRR_ENC(S4_vxsubaddh,        "0001","01-","-","110","ddddd")
+
+SH_RRR_ENC(S4_vxaddsubhr,       "0001","11-","-","00-","ddddd")
+SH_RRR_ENC(S4_vxsubaddhr,       "0001","11-","-","01-","ddddd")
+SH_RRR_ENC(S4_extractp_rp,      "0001","11-","-","10-","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 0010 -------- PP------ --------","[#2] Rdd=(Rss,Rtt,Pu)")
+SH_RRR_ENC(S2_valignrb,         "0010","0--","-","-uu","ddddd")
+SH_RRR_ENC(S2_vsplicerb,        "0010","100","-","-uu","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 0011 -------- PP------ --------","[#3] Rdd=(Rss,Rt)")
+RSHIFTTYPES(vw,                 "0011","00-","-","-","ddddd")
+RSHIFTTYPES(vh,                 "0011","01-","-","-","ddddd")
+RSHIFTTYPES(p,                  "0011","10-","-","-","ddddd")
+SH_RRR_ENC(S2_vcrotate,         "0011","11-","-","00-","ddddd")
+SH_RRR_ENC(S2_vcnegh,           "0011","11-","-","01-","ddddd")
+SH_RRR_ENC(S4_vrcrotate,        "0011","11-","i","11i","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 0100 -------- PP------ --------","[#4] Rd=(Rs,Rt,#u3)")
+DEF_ENC32(S2_addasl_rrri, ICLASS_S3op" 0100   000 sssss PP0ttttt iiiddddd")
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 0101 -------- PP------ --------","[#5] Rd=(Rss,Rt)")
+SH_RRR_ENC(S2_asr_r_svw_trun,   "0101","---","-","010","ddddd")
+SH_RRR_ENC(M4_cmpyi_wh,         "0101","---","-","100","ddddd")
+SH_RRR_ENC(M4_cmpyr_wh,         "0101","---","-","110","ddddd")
+SH_RRR_ENC(M4_cmpyi_whc,        "0101","---","-","101","ddddd")
+SH_RRR_ENC(M4_cmpyr_whc,        "0101","---","-","111","ddddd")
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 0110 -------- PP------ --------","[#6] Rd=(Rs,Rt)")
+SH_RRR_ENC(S2_asr_r_r_sat,      "0110","00-","-","00-","ddddd") \
+SH_RRR_ENC(S2_asl_r_r_sat,      "0110","00-","-","10-","ddddd")
+
+RSHIFTTYPES(r,                  "0110","01-","-","-","ddddd")
+
+SH_RRR_ENC(S2_setbit_r,         "0110","10-","-","00-","ddddd")
+SH_RRR_ENC(S2_clrbit_r,         "0110","10-","-","01-","ddddd")
+SH_RRR_ENC(S2_togglebit_r,      "0110","10-","-","10-","ddddd")
+SH_RRRiENC(S4_lsli,             "0110","10-","-","11i","ddddd")
+
+SH_RRR_ENC(A4_cround_rr,        "0110","11-","-","00-","ddddd")
+SH_RRR_ENC(A7_croundd_rr,       "0110","11-","-","01-","ddddd")
+SH_RRR_ENC(A4_round_rr,         "0110","11-","-","10-","ddddd")
+SH_RRR_ENC(A4_round_rr_sat,     "0110","11-","-","11-","ddddd")
+
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 0111 -------- PP------ --------","[#7] Pd=(Rs,Rt)")
+SH_RRR_ENC(S2_tstbit_r,         "0111","000","-","---","---dd")
+SH_RRR_ENC(C2_bitsset,          "0111","010","-","---","---dd")
+SH_RRR_ENC(C2_bitsclr,          "0111","100","-","---","---dd")
+SH_RRR_ENC(A4_cmpheq,           "0111","110","-","011","---dd")
+SH_RRR_ENC(A4_cmphgt,           "0111","110","-","100","---dd")
+SH_RRR_ENC(A4_cmphgtu,          "0111","110","-","101","---dd")
+SH_RRR_ENC(A4_cmpbeq,           "0111","110","-","110","---dd")
+SH_RRR_ENC(A4_cmpbgtu,          "0111","110","-","111","---dd")
+SH_RRR_ENC(A4_cmpbgt,           "0111","110","-","010","---dd")
+SH_RRR_ENC(S4_ntstbit_r,        "0111","001","-","---","---dd")
+SH_RRR_ENC(C4_nbitsset,         "0111","011","-","---","---dd")
+SH_RRR_ENC(C4_nbitsclr,         "0111","101","-","---","---dd")
+
+SH_RRR_ENC(F2_sfcmpge,          "0111","111","-","000","---dd")
+SH_RRR_ENC(F2_sfcmpuo,          "0111","111","-","001","---dd")
+SH_RRR_ENC(F2_sfcmpeq,          "0111","111","-","011","---dd")
+SH_RRR_ENC(F2_sfcmpgt,          "0111","111","-","100","---dd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 1000 -------- PP------ --------","[#8] Rx=(Rs,Rtt)")
+SH_RRR_ENC(S2_insert_rp,        "1000","---","-","---","xxxxx")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 1001 -------- PP------ --------","[#9] Rd=(Rs,Rtt)")
+SH_RRR_ENC(S2_extractu_rp,      "1001","00-","-","00-","ddddd")
+SH_RRR_ENC(S4_extract_rp,       "1001","00-","-","01-","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 1010 -------- PP------ --------","[#10] Rxx=(Rss,Rtt)")
+SH_RRR_ENC(S2_insertp_rp,       "1010","0--","0","---","xxxxx")
+SH_RRR_ENC(M4_xor_xacc,         "1010","10-","0","000","xxxxx")
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 1011 -------- PP------ --------","[#11] Rxx=(Rss,Rt)")
+RSHIFTTYPES(p_or,               "1011","000","-","-","xxxxx")
+RSHIFTTYPES(p_and,              "1011","010","-","-","xxxxx")
+RSHIFTTYPES(p_nac,              "1011","100","-","-","xxxxx")
+RSHIFTTYPES(p_acc,              "1011","110","-","-","xxxxx")
+RSHIFTTYPES(p_xor,              "1011","011","-","-","xxxxx")
+
+SH_RRR_ENCX(A4_vrmaxh,          "1011","001","0","001","uuuuu")
+SH_RRR_ENCX(A4_vrmaxuh,         "1011","001","1","001","uuuuu")
+SH_RRR_ENCX(A4_vrmaxw,          "1011","001","0","010","uuuuu")
+SH_RRR_ENCX(A4_vrmaxuw,         "1011","001","1","010","uuuuu")
+
+SH_RRR_ENCX(A4_vrminh,          "1011","001","0","101","uuuuu")
+SH_RRR_ENCX(A4_vrminuh,         "1011","001","1","101","uuuuu")
+SH_RRR_ENCX(A4_vrminw,          "1011","001","0","110","uuuuu")
+SH_RRR_ENCX(A4_vrminuw,         "1011","001","1","110","uuuuu")
+
+SH_RRR_ENC(S2_vrcnegh,          "1011","001","1","111","xxxxx")
+
+SH_RRR_ENC(S4_vrcrotate_acc,    "1011","101","i","--i","xxxxx")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 1100 -------- PP------ --------","[#12] Rx=(Rs,Rt)")
+RSHIFTTYPES(r_or,               "1100","00-","-","-","xxxxx")
+RSHIFTTYPES(r_and,              "1100","01-","-","-","xxxxx")
+RSHIFTTYPES(r_nac,              "1100","10-","-","-","xxxxx")
+RSHIFTTYPES(r_acc,              "1100","11-","-","-","xxxxx")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 1101 -------- PP------ --------","[#13] Reserved")
+DEF_FIELDROW_DESC32(ICLASS_S3op" 1110 -------- PP------ --------","[#14] Reserved")
+
+
+DEF_FIELDROW_DESC32(ICLASS_S3op" 1111 -------- PP------ --------","[#14] User Instruction")
+
+
+
+
+
+
+
+
+
+
+
+
+
+/*******************************/
+/*                             */
+/*                             */
+/*           ALU64             */
+/*                             */
+/*                             */
+/*******************************/
+DEF_CLASS32(ICLASS_ALU64" ---- -------- PP------ --------",ALU64)
+DEF_FIELD32(ICLASS_ALU64" !!!! -------- PP------ --------",ALU64_RegType,"Register Type")
+DEF_FIELD32(ICLASS_ALU64" 0--- !!!----- PP------ --------",A_MajOp,"Major Opcode")
+DEF_FIELD32(ICLASS_ALU64" 0--- -------- PP------ !!!-----",A_MinOp,"Minor Opcode")
+DEF_FIELD32(ICLASS_ALU64" 11-- -------- PP------ ---!!!!!",A_MajOp,"Major Opcode")
+
+
+
+#define ALU64_RRR_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS)\
+DEF_ENC32(TAG, ICLASS_ALU64" "MAJ4"  "MIN3"sssss  PP"SMOD1"ttttt "VMIN3 DSTCHARS)
+
+#define LEGACY_ALU64_RRR_ENC(TAG,MAJ4,MIN3,SMOD1,VMIN3,DSTCHARS)\
+LEGACY_DEF_ENC32(TAG, ICLASS_ALU64" "MAJ4"  "MIN3"sssss  PP"SMOD1"ttttt "VMIN3 DSTCHARS)
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 0000 -------- PP------ --------","[#0] Rd=(Rss,Rtt)")
+ALU64_RRR_ENC(S2_parityp,        "0000","---","-","---","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 0001 -------- PP------ --------","[#1] Rdd=(Pu,Rss,Rtt)")
+ALU64_RRR_ENC(C2_vmux,           "0001","---","-","-uu","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 0010 -------- PP------ --------","[#2] Pd=(Rss,Rtt)")
+ALU64_RRR_ENC(A2_vcmpweq,        "0010","0--","0","000","---dd")
+ALU64_RRR_ENC(A2_vcmpwgt,        "0010","0--","0","001","---dd")
+ALU64_RRR_ENC(A2_vcmpwgtu,       "0010","0--","0","010","---dd")
+ALU64_RRR_ENC(A2_vcmpheq,        "0010","0--","0","011","---dd")
+ALU64_RRR_ENC(A2_vcmphgt,        "0010","0--","0","100","---dd")
+ALU64_RRR_ENC(A2_vcmphgtu,       "0010","0--","0","101","---dd")
+ALU64_RRR_ENC(A2_vcmpbeq,        "0010","0--","0","110","---dd")
+ALU64_RRR_ENC(A2_vcmpbgtu,       "0010","0--","0","111","---dd")
+
+ALU64_RRR_ENC(A4_vcmpbeq_any,    "0010","0--","1","000","---dd")
+ALU64_RRR_ENC(A6_vcmpbeq_notany, "0010","0--","1","001","---dd")
+ALU64_RRR_ENC(A4_vcmpbgt,        "0010","0--","1","010","---dd")
+ALU64_RRR_ENC(A4_tlbmatch,       "0010","0--","1","011","---dd")
+ALU64_RRR_ENC(A4_boundscheck_lo, "0010","0--","1","100","---dd")
+ALU64_RRR_ENC(A4_boundscheck_hi, "0010","0--","1","101","---dd")
+
+ALU64_RRR_ENC(C2_cmpeqp,         "0010","100","-","000","---dd")
+ALU64_RRR_ENC(C2_cmpgtp,         "0010","100","-","010","---dd")
+ALU64_RRR_ENC(C2_cmpgtup,        "0010","100","-","100","---dd")
+
+ALU64_RRR_ENC(F2_dfcmpeq,        "0010","111","-","000","---dd")
+ALU64_RRR_ENC(F2_dfcmpgt,        "0010","111","-","001","---dd")
+ALU64_RRR_ENC(F2_dfcmpge,        "0010","111","-","010","---dd")
+ALU64_RRR_ENC(F2_dfcmpuo,        "0010","111","-","011","---dd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 0011 -------- PP------ --------","[#3] Rdd=(Rss,Rtt)")
+ALU64_RRR_ENC(A2_vaddub,         "0011","000","-","000","ddddd")
+ALU64_RRR_ENC(A2_vaddubs,        "0011","000","-","001","ddddd")
+ALU64_RRR_ENC(A2_vaddh,          "0011","000","-","010","ddddd")
+ALU64_RRR_ENC(A2_vaddhs,         "0011","000","-","011","ddddd")
+ALU64_RRR_ENC(A2_vadduhs,        "0011","000","-","100","ddddd")
+ALU64_RRR_ENC(A2_vaddw,          "0011","000","-","101","ddddd")
+ALU64_RRR_ENC(A2_vaddws,         "0011","000","-","110","ddddd")
+ALU64_RRR_ENC(A2_addp,           "0011","000","-","111","ddddd")
+
+ALU64_RRR_ENC(A2_vsubub,         "0011","001","-","000","ddddd")
+ALU64_RRR_ENC(A2_vsububs,        "0011","001","-","001","ddddd")
+ALU64_RRR_ENC(A2_vsubh,          "0011","001","-","010","ddddd")
+ALU64_RRR_ENC(A2_vsubhs,         "0011","001","-","011","ddddd")
+ALU64_RRR_ENC(A2_vsubuhs,        "0011","001","-","100","ddddd")
+ALU64_RRR_ENC(A2_vsubw,          "0011","001","-","101","ddddd")
+ALU64_RRR_ENC(A2_vsubws,         "0011","001","-","110","ddddd")
+ALU64_RRR_ENC(A2_subp,           "0011","001","-","111","ddddd")
+
+ALU64_RRR_ENC(A2_vavgub,         "0011","010","-","000","ddddd")
+ALU64_RRR_ENC(A2_vavgubr,        "0011","010","-","001","ddddd")
+ALU64_RRR_ENC(A2_vavgh,          "0011","010","-","010","ddddd")
+ALU64_RRR_ENC(A2_vavghr,         "0011","010","-","011","ddddd")
+ALU64_RRR_ENC(A2_vavghcr,        "0011","010","-","100","ddddd")
+ALU64_RRR_ENC(A2_vavguh,         "0011","010","-","101","ddddd")
+ALU64_RRR_ENC(A2_vavguhr,        "0011","010","-","11-","ddddd")
+
+ALU64_RRR_ENC(A2_vavgw,          "0011","011","-","000","ddddd")
+ALU64_RRR_ENC(A2_vavgwr,         "0011","011","-","001","ddddd")
+ALU64_RRR_ENC(A2_vavgwcr,        "0011","011","-","010","ddddd")
+ALU64_RRR_ENC(A2_vavguw,         "0011","011","-","011","ddddd")
+ALU64_RRR_ENC(A2_vavguwr,        "0011","011","-","100","ddddd")
+ALU64_RRR_ENC(A2_addpsat,        "0011","011","-","101","ddddd")
+ALU64_RRR_ENC(A2_addspl,         "0011","011","-","110","ddddd")
+ALU64_RRR_ENC(A2_addsph,         "0011","011","-","111","ddddd")
+
+ALU64_RRR_ENC(A2_vnavgh,         "0011","100","-","000","ddddd")
+ALU64_RRR_ENC(A2_vnavghr,        "0011","100","-","001","ddddd")
+ALU64_RRR_ENC(A2_vnavghcr,       "0011","100","-","010","ddddd")
+ALU64_RRR_ENC(A2_vnavgw,         "0011","100","-","011","ddddd")
+ALU64_RRR_ENC(A2_vnavgwr,        "0011","100","-","10-","ddddd")
+ALU64_RRR_ENC(A2_vnavgwcr,       "0011","100","-","11-","ddddd")
+
+ALU64_RRR_ENC(A2_vminub,         "0011","101","-","000","ddddd")
+ALU64_RRR_ENC(A2_vminh,          "0011","101","-","001","ddddd")
+ALU64_RRR_ENC(A2_vminuh,         "0011","101","-","010","ddddd")
+ALU64_RRR_ENC(A2_vminw,          "0011","101","-","011","ddddd")
+ALU64_RRR_ENC(A2_vminuw,         "0011","101","-","100","ddddd")
+ALU64_RRR_ENC(A2_vmaxuw,         "0011","101","-","101","ddddd")
+ALU64_RRR_ENC(A2_minp,           "0011","101","-","110","ddddd")
+ALU64_RRR_ENC(A2_minup,          "0011","101","-","111","ddddd")
+
+ALU64_RRR_ENC(A2_vmaxub,         "0011","110","-","000","ddddd")
+ALU64_RRR_ENC(A2_vmaxh,          "0011","110","-","001","ddddd")
+ALU64_RRR_ENC(A2_vmaxuh,         "0011","110","-","010","ddddd")
+ALU64_RRR_ENC(A2_vmaxw,          "0011","110","-","011","ddddd")
+ALU64_RRR_ENC(A2_maxp,           "0011","110","-","100","ddddd")
+ALU64_RRR_ENC(A2_maxup,          "0011","110","-","101","ddddd")
+ALU64_RRR_ENC(A2_vmaxb,          "0011","110","-","110","ddddd")
+ALU64_RRR_ENC(A2_vminb,          "0011","110","-","111","ddddd")
+
+ALU64_RRR_ENC(A2_andp,           "0011","111","-","000","ddddd")
+ALU64_RRR_ENC(A2_orp,            "0011","111","-","010","ddddd")
+ALU64_RRR_ENC(A2_xorp,           "0011","111","-","100","ddddd")
+ALU64_RRR_ENC(A4_andnp,          "0011","111","-","001","ddddd")
+ALU64_RRR_ENC(A4_ornp,           "0011","111","-","011","ddddd")
+
+ALU64_RRR_ENC(A4_modwrapu,       "0011","111","-","111","ddddd")
+
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 0100 -------- PP------ --------","[#4] Rdd=(Rs,Rt)")
+LEGACY_ALU64_RRR_ENC(S2_packhl,  "0100","--0","-","---","ddddd")
+ALU64_RRR_ENC(A4_bitsplit,       "0100","--1","-","---","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 0101 -------- PP------ --------","[#5] Rd=(Rs,Rt)")
+ALU64_RRR_ENC(A2_addh_l16_ll,    "0101","000","-","00-","ddddd")
+ALU64_RRR_ENC(A2_addh_l16_hl,    "0101","000","-","01-","ddddd")
+ALU64_RRR_ENC(A2_addh_l16_sat_ll,"0101","000","-","10-","ddddd")
+ALU64_RRR_ENC(A2_addh_l16_sat_hl,"0101","000","-","11-","ddddd")
+
+ALU64_RRR_ENC(A2_subh_l16_ll,    "0101","001","-","00-","ddddd")
+ALU64_RRR_ENC(A2_subh_l16_hl,    "0101","001","-","01-","ddddd")
+ALU64_RRR_ENC(A2_subh_l16_sat_ll,"0101","001","-","10-","ddddd")
+ALU64_RRR_ENC(A2_subh_l16_sat_hl,"0101","001","-","11-","ddddd")
+
+ALU64_RRR_ENC(A2_addh_h16_ll,    "0101","010","-","000","ddddd")
+ALU64_RRR_ENC(A2_addh_h16_lh,    "0101","010","-","001","ddddd")
+ALU64_RRR_ENC(A2_addh_h16_hl,    "0101","010","-","010","ddddd")
+ALU64_RRR_ENC(A2_addh_h16_hh,    "0101","010","-","011","ddddd")
+ALU64_RRR_ENC(A2_addh_h16_sat_ll,"0101","010","-","100","ddddd")
+ALU64_RRR_ENC(A2_addh_h16_sat_lh,"0101","010","-","101","ddddd")
+ALU64_RRR_ENC(A2_addh_h16_sat_hl,"0101","010","-","110","ddddd")
+ALU64_RRR_ENC(A2_addh_h16_sat_hh,"0101","010","-","111","ddddd")
+
+ALU64_RRR_ENC(A2_subh_h16_ll,    "0101","011","-","000","ddddd")
+ALU64_RRR_ENC(A2_subh_h16_lh,    "0101","011","-","001","ddddd")
+ALU64_RRR_ENC(A2_subh_h16_hl,    "0101","011","-","010","ddddd")
+ALU64_RRR_ENC(A2_subh_h16_hh,    "0101","011","-","011","ddddd")
+ALU64_RRR_ENC(A2_subh_h16_sat_ll,"0101","011","-","100","ddddd")
+ALU64_RRR_ENC(A2_subh_h16_sat_lh,"0101","011","-","101","ddddd")
+ALU64_RRR_ENC(A2_subh_h16_sat_hl,"0101","011","-","110","ddddd")
+ALU64_RRR_ENC(A2_subh_h16_sat_hh,"0101","011","-","111","ddddd")
+
+LEGACY_ALU64_RRR_ENC(A2_addsat,  "0101","100","-","0--","ddddd")
+LEGACY_ALU64_RRR_ENC(A2_subsat,  "0101","100","-","1--","ddddd")
+
+ALU64_RRR_ENC(A2_min,            "0101","101","-","0--","ddddd")
+ALU64_RRR_ENC(A2_minu,           "0101","101","-","1--","ddddd")
+
+ALU64_RRR_ENC(A2_max,            "0101","110","-","0--","ddddd")
+ALU64_RRR_ENC(A2_maxu,           "0101","110","-","1--","ddddd")
+
+ALU64_RRR_ENC(S4_parity,         "0101","111","-","---","ddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 0110 -------- PP------ --------","[#6] Rd=#u10 ")
+DEF_ENC32(F2_sfimm_p,     ICLASS_ALU64" 0110   00i ----- PPiiiiii iiiddddd")
+DEF_ENC32(F2_sfimm_n,     ICLASS_ALU64" 0110   01i ----- PPiiiiii iiiddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 0111 -------- PP------ --------","[#7] Rd=(Rs,Rt,#u6)")
+DEF_ENC32(M4_mpyrr_addi,  ICLASS_ALU64" 0111   0ii sssss PPittttt iiiddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 1000 -------- PP------ --------","[#8] Rd=(Rs,#u6,#U6)")
+DEF_ENC32(M4_mpyri_addi,  ICLASS_ALU64" 1000   Iii sssss PPiddddd iiiIIIII")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 1001 -------- PP------ --------","[#9] Rdd=#u10 ")
+DEF_ENC32(F2_dfimm_p,     ICLASS_ALU64" 1001   00i ----- PPiiiiii iiiddddd")
+DEF_ENC32(F2_dfimm_n,     ICLASS_ALU64" 1001   01i ----- PPiiiiii iiiddddd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 1010 -------- PP------ --------","[#10] Rx=(Rs,Rx,#s10)")
+DEF_ENC32(S4_or_andix,    ICLASS_ALU64" 1010   01i xxxxx PPiiiiii iiiuuuuu")
+DEF_ENC32(S4_or_andi,     ICLASS_ALU64" 1010   00i sssss PPiiiiii iiixxxxx")
+DEF_ENC32(S4_or_ori,      ICLASS_ALU64" 1010   10i sssss PPiiiiii iiixxxxx")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 1011 -------- PP------ --------","[#11] Rd=(Rs,Rd,#s6)")
+DEF_ENC32(S4_addaddi,     ICLASS_ALU64" 1011   0ii sssss PPiddddd iiiuuuuu")
+DEF_ENC32(S4_subaddi,     ICLASS_ALU64" 1011   1ii sssss PPiddddd iiiuuuuu")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64"     1100 -------- PP------ --------","[#12] Pd=(Rss,#s8)")
+DEF_ENC32(A4_vcmpbeqi,   ICLASS_ALU64"1100 000sssss PP-iiiii iii00-dd")
+DEF_ENC32(A4_vcmpbgti,   ICLASS_ALU64"1100 001sssss PP-iiiii iii00-dd")
+DEF_ENC32(A4_vcmpbgtui,  ICLASS_ALU64"1100 010sssss PP-0iiii iii00-dd")
+DEF_ENC32(A4_vcmpheqi,   ICLASS_ALU64"1100 000sssss PP-iiiii iii01-dd")
+DEF_ENC32(A4_vcmphgti,   ICLASS_ALU64"1100 001sssss PP-iiiii iii01-dd")
+DEF_ENC32(A4_vcmphgtui,  ICLASS_ALU64"1100 010sssss PP-0iiii iii01-dd")
+DEF_ENC32(A4_vcmpweqi,   ICLASS_ALU64"1100 000sssss PP-iiiii iii10-dd")
+DEF_ENC32(A4_vcmpwgti,   ICLASS_ALU64"1100 001sssss PP-iiiii iii10-dd")
+DEF_ENC32(A4_vcmpwgtui,  ICLASS_ALU64"1100 010sssss PP-0iiii iii10-dd")
+
+DEF_ENC32(F2_dfclass,    ICLASS_ALU64"1100 100sssss PP-000ii iii10-dd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 1101 -------- PP------ --------","[#13] Pd=(Rs,#s8)")
+DEF_ENC32(A4_cmpbeqi,    ICLASS_ALU64"1101 -00sssss PP-iiiii iii00-dd")
+DEF_ENC32(A4_cmpbgti,    ICLASS_ALU64"1101 -01sssss PP-iiiii iii00-dd")
+DEF_ENC32(A4_cmpbgtui,   ICLASS_ALU64"1101 -10sssss PP-0iiii iii00-dd")
+DEF_ENC32(A4_cmpheqi,    ICLASS_ALU64"1101 -00sssss PP-iiiii iii01-dd")
+DEF_ENC32(A4_cmphgti,    ICLASS_ALU64"1101 -01sssss PP-iiiii iii01-dd")
+DEF_ENC32(A4_cmphgtui,   ICLASS_ALU64"1101 -10sssss PP-0iiii iii01-dd")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 1110 -------- PP------ --------","[#14] Rx=(#u9,op(Rx,#u5))")
+
+#define OP_OPI_RI(TAG,OPB)\
+DEF_ENC32(S4_andi_##TAG##_ri,ICLASS_ALU64" 1110 iiixxxxx PPiIIIII iii"OPB"i00-")\
+DEF_ENC32(S4_ori_##TAG##_ri, ICLASS_ALU64" 1110 iiixxxxx PPiIIIII iii"OPB"i01-")\
+DEF_ENC32(S4_addi_##TAG##_ri,ICLASS_ALU64" 1110 iiixxxxx PPiIIIII iii"OPB"i10-")\
+DEF_ENC32(S4_subi_##TAG##_ri,ICLASS_ALU64" 1110 iiixxxxx PPiIIIII iii"OPB"i11-")
+
+OP_OPI_RI(asl,"0")
+OP_OPI_RI(lsr,"1")
+
+
+DEF_FIELDROW_DESC32(ICLASS_ALU64" 1111 -------- PP------ --------","[#15] Rd=(Rs,Ru,#u6:2)")
+DEF_ENC32(M4_mpyri_addr_u2, ICLASS_ALU64" 1111   0ii sssss PPiddddd iiiuuuuu")
+DEF_ENC32(M4_mpyri_addr,    ICLASS_ALU64" 1111   1ii sssss PPiddddd iiiuuuuu")
diff --git a/target/hexagon/imported/encode_subinsn.def b/target/hexagon/imported/encode_subinsn.def
new file mode 100644
index 0000000000..742fb50efb
--- /dev/null
+++ b/target/hexagon/imported/encode_subinsn.def
@@ -0,0 +1,149 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+
+/* DEF_ENC_SUBINSN(TAG, CLASS, ENCSTR) */
+
+
+
+
+/*********************/
+/* Ld1-type subinsns */
+/*********************/
+DEF_ENC_SUBINSN(SL1_loadri_io,   SUBINSN_L1, "0iiiissssdddd")
+DEF_ENC_SUBINSN(SL1_loadrub_io,  SUBINSN_L1, "1iiiissssdddd")
+
+/*********************/
+/* St1-type subinsns */
+/*********************/
+DEF_ENC_SUBINSN(SS1_storew_io,  SUBINSN_S1, "0ii iisssstttt")
+DEF_ENC_SUBINSN(SS1_storeb_io,  SUBINSN_S1, "1ii iisssstttt")
+
+
+/*********************/
+/* Ld2-type subinsns */
+/*********************/
+DEF_ENC_SUBINSN(SL2_loadrh_io,   SUBINSN_L2, "00i iissssdddd")
+DEF_ENC_SUBINSN(SL2_loadruh_io,  SUBINSN_L2, "01i iissssdddd")
+DEF_ENC_SUBINSN(SL2_loadrb_io,   SUBINSN_L2, "10i iissssdddd")
+DEF_ENC_SUBINSN(SL2_loadri_sp,   SUBINSN_L2, "111 0iiiiidddd")
+DEF_ENC_SUBINSN(SL2_loadrd_sp,   SUBINSN_L2, "111 10iiiiiddd")
+
+DEF_ENC_SUBINSN(SL2_deallocframe,SUBINSN_L2, "111 1100---0--")
+
+DEF_ENC_SUBINSN(SL2_return,      SUBINSN_L2, "111 1101---0--")
+DEF_ENC_SUBINSN(SL2_return_t,    SUBINSN_L2, "111 1101---100")
+DEF_ENC_SUBINSN(SL2_return_f,    SUBINSN_L2, "111 1101---101")
+DEF_ENC_SUBINSN(SL2_return_tnew, SUBINSN_L2, "111 1101---110")
+DEF_ENC_SUBINSN(SL2_return_fnew, SUBINSN_L2, "111 1101---111")
+
+DEF_ENC_SUBINSN(SL2_jumpr31,     SUBINSN_L2, "111 1111---0--")
+DEF_ENC_SUBINSN(SL2_jumpr31_t,   SUBINSN_L2, "111 1111---100")
+DEF_ENC_SUBINSN(SL2_jumpr31_f,   SUBINSN_L2, "111 1111---101")
+DEF_ENC_SUBINSN(SL2_jumpr31_tnew,SUBINSN_L2, "111 1111---110")
+DEF_ENC_SUBINSN(SL2_jumpr31_fnew,SUBINSN_L2, "111 1111---111")
+
+
+/*********************/
+/* St2-type subinsns */
+/*********************/
+DEF_ENC_SUBINSN(SS2_storeh_io,   SUBINSN_S2, "00i iisssstttt")
+DEF_ENC_SUBINSN(SS2_storew_sp,   SUBINSN_S2, "010 0iiiiitttt")
+DEF_ENC_SUBINSN(SS2_stored_sp,   SUBINSN_S2, "010 1iiiiiittt")
+
+DEF_ENC_SUBINSN(SS2_storewi0,    SUBINSN_S2, "100 00ssssiiii")
+DEF_ENC_SUBINSN(SS2_storewi1,    SUBINSN_S2, "100 01ssssiiii")
+DEF_ENC_SUBINSN(SS2_storebi0,    SUBINSN_S2, "100 10ssssiiii")
+DEF_ENC_SUBINSN(SS2_storebi1,    SUBINSN_S2, "100 11ssssiiii")
+
+DEF_ENC_SUBINSN(SS2_allocframe,  SUBINSN_S2, "111 0iiiii----")
+
+
+
+/*******************/
+/* A-type subinsns */
+/*******************/
+DEF_ENC_SUBINSN(SA1_addi,       SUBINSN_A, "00i iiiiiixxxx")
+DEF_ENC_SUBINSN(SA1_seti,       SUBINSN_A, "010 iiiiiidddd")
+DEF_ENC_SUBINSN(SA1_addsp,      SUBINSN_A, "011 iiiiiidddd")
+
+DEF_ENC_SUBINSN(SA1_tfr,        SUBINSN_A, "100 00ssssdddd")
+DEF_ENC_SUBINSN(SA1_inc,        SUBINSN_A, "100 01ssssdddd")
+DEF_ENC_SUBINSN(SA1_and1,       SUBINSN_A, "100 10ssssdddd")
+DEF_ENC_SUBINSN(SA1_dec,        SUBINSN_A, "100 11ssssdddd")
+
+DEF_ENC_SUBINSN(SA1_sxth,       SUBINSN_A, "101 00ssssdddd")
+DEF_ENC_SUBINSN(SA1_sxtb,       SUBINSN_A, "101 01ssssdddd")
+DEF_ENC_SUBINSN(SA1_zxth,       SUBINSN_A, "101 10ssssdddd")
+DEF_ENC_SUBINSN(SA1_zxtb,       SUBINSN_A, "101 11ssssdddd")
+
+
+DEF_ENC_SUBINSN(SA1_addrx,      SUBINSN_A, "110 00ssssxxxx")
+DEF_ENC_SUBINSN(SA1_cmpeqi,     SUBINSN_A, "110 01ssss--ii")
+DEF_ENC_SUBINSN(SA1_setin1,     SUBINSN_A, "110 1--0--dddd")
+DEF_ENC_SUBINSN(SA1_clrtnew,    SUBINSN_A, "110 1--100dddd")
+DEF_ENC_SUBINSN(SA1_clrfnew,    SUBINSN_A, "110 1--101dddd")
+DEF_ENC_SUBINSN(SA1_clrt,       SUBINSN_A, "110 1--110dddd")
+DEF_ENC_SUBINSN(SA1_clrf,       SUBINSN_A, "110 1--111dddd")
+
+
+DEF_ENC_SUBINSN(SA1_combine0i,  SUBINSN_A, "111 -0-ii00ddd")
+DEF_ENC_SUBINSN(SA1_combine1i,  SUBINSN_A, "111 -0-ii01ddd")
+DEF_ENC_SUBINSN(SA1_combine2i,  SUBINSN_A, "111 -0-ii10ddd")
+DEF_ENC_SUBINSN(SA1_combine3i,  SUBINSN_A, "111 -0-ii11ddd")
+DEF_ENC_SUBINSN(SA1_combinezr,  SUBINSN_A, "111 -1ssss0ddd")
+DEF_ENC_SUBINSN(SA1_combinerz,  SUBINSN_A, "111 -1ssss1ddd")
+
+
+
+
+/* maybe R=cmpeq ? */
+
+
+/* Add a group of NCJ: if (R.new==#0) jump:hint #r9 */
+/* Add a group of NCJ: if (R.new!=#0) jump:hint #r9 */
+/* NCJ goes with LD1, LD2 */
+
+
+
+
+DEF_FIELD32("---! !!!! !!!!!!!! EE------ --------",SUBFIELD_B_SLOT1,"B: Slot1 Instruction")
+DEF_FIELD32("---- ---- -------- EE-!!!!! !!!!!!!!",SUBFIELD_A_SLOT0,"A: Slot0 Instruction")
+
+
+/* DEF_PACKED32(TAG, CLASSA, CLASSB, ENCSTR) */
+
+DEF_PACKED32(P2_PACKED_L1_L1, SUBINSN_L1, SUBINSN_L1, "000B BBBB BBBB BBBB EE0A AAAA AAAA AAAA")
+DEF_PACKED32(P2_PACKED_L1_L2, SUBINSN_L2, SUBINSN_L1, "000B BBBB BBBB BBBB EE1A AAAA AAAA AAAA")
+DEF_PACKED32(P2_PACKED_L2_L2, SUBINSN_L2, SUBINSN_L2, "001B BBBB BBBB BBBB EE0A AAAA AAAA AAAA")
+DEF_PACKED32(P2_PACKED_A_A,   SUBINSN_A,  SUBINSN_A,  "001B BBBB BBBB BBBB EE1A AAAA AAAA AAAA")
+
+DEF_PACKED32(P2_PACKED_L1_A,  SUBINSN_L1, SUBINSN_A,  "010B BBBB BBBB BBBB EE0A AAAA AAAA AAAA")
+DEF_PACKED32(P2_PACKED_L2_A,  SUBINSN_L2, SUBINSN_A,  "010B BBBB BBBB BBBB EE1A AAAA AAAA AAAA")
+DEF_PACKED32(P2_PACKED_S1_A,  SUBINSN_S1, SUBINSN_A,  "011B BBBB BBBB BBBB EE0A AAAA AAAA AAAA")
+DEF_PACKED32(P2_PACKED_S2_A,  SUBINSN_S2, SUBINSN_A,  "011B BBBB BBBB BBBB EE1A AAAA AAAA AAAA")
+
+DEF_PACKED32(P2_PACKED_S1_L1, SUBINSN_S1, SUBINSN_L1, "100B BBBB BBBB BBBB EE0A AAAA AAAA AAAA")
+DEF_PACKED32(P2_PACKED_S1_L2, SUBINSN_S1, SUBINSN_L2, "100B BBBB BBBB BBBB EE1A AAAA AAAA AAAA")
+DEF_PACKED32(P2_PACKED_S1_S1, SUBINSN_S1, SUBINSN_S1, "101B BBBB BBBB BBBB EE0A AAAA AAAA AAAA")
+DEF_PACKED32(P2_PACKED_S1_S2, SUBINSN_S2, SUBINSN_S1, "101B BBBB BBBB BBBB EE1A AAAA AAAA AAAA")
+
+DEF_PACKED32(P2_PACKED_S2_L1, SUBINSN_S2, SUBINSN_L1, "110B BBBB BBBB BBBB EE0A AAAA AAAA AAAA")
+DEF_PACKED32(P2_PACKED_S2_L2, SUBINSN_S2, SUBINSN_L2, "110B BBBB BBBB BBBB EE1A AAAA AAAA AAAA")
+DEF_PACKED32(P2_PACKED_S2_S2, SUBINSN_S2, SUBINSN_S2, "111B BBBB BBBB BBBB EE0A AAAA AAAA AAAA")
+
+DEF_PACKED32(P2_PACKED_RESERVED, SUBINSN_INVALID, SUBINSN_INVALID, "111B BBBB BBBB BBBB EE1A AAAA AAAA AAAA")
diff --git a/target/hexagon/imported/float.idef b/target/hexagon/imported/float.idef
new file mode 100644
index 0000000000..76cecfebf5
--- /dev/null
+++ b/target/hexagon/imported/float.idef
@@ -0,0 +1,312 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Floating-Point Instructions
+ */
+
+/*************************************/
+/* Scalar FP                         */
+/*************************************/
+Q6INSN(F2_sfadd,"Rd32=sfadd(Rs32,Rt32)",ATTRIBS(),
+"Floating-Point Add",
+{ RdV=fUNFLOAT(fFLOAT(RsV)+fFLOAT(RtV));})
+
+Q6INSN(F2_sfsub,"Rd32=sfsub(Rs32,Rt32)",ATTRIBS(),
+"Floating-Point Subtract",
+{ RdV=fUNFLOAT(fFLOAT(RsV)-fFLOAT(RtV));})
+
+Q6INSN(F2_sfmpy,"Rd32=sfmpy(Rs32,Rt32)",ATTRIBS(),
+"Floating-Point Multiply",
+{ RdV=fUNFLOAT(fSFMPY(fFLOAT(RsV),fFLOAT(RtV)));})
+
+Q6INSN(F2_sffma,"Rx32+=sfmpy(Rs32,Rt32)",ATTRIBS(),
+"Floating-Point Fused Multiply Add",
+{ RxV=fUNFLOAT(fFMAF(fFLOAT(RsV),fFLOAT(RtV),fFLOAT(RxV)));})
+
+Q6INSN(F2_sffma_sc,"Rx32+=sfmpy(Rs32,Rt32,Pu4):scale",ATTRIBS(),
+"Floating-Point Fused Multiply Add w/ Additional Scaling (2**Pu)",
+{
+    fHIDE(size4s_t tmp;)
+    fCHECKSFNAN3(RxV,RxV,RsV,RtV);
+    tmp=fUNFLOAT(fFMAFX(fFLOAT(RsV),fFLOAT(RtV),fFLOAT(RxV),PuV));
+    if (!((fFLOAT(RxV) == 0.0) && fISZEROPROD(fFLOAT(RsV),fFLOAT(RtV)))) RxV = tmp;
+})
+
+Q6INSN(F2_sffms,"Rx32-=sfmpy(Rs32,Rt32)",ATTRIBS(),
+"Floating-Point Fused Multiply Add",
+{ RxV=fUNFLOAT(fFMAF(-fFLOAT(RsV),fFLOAT(RtV),fFLOAT(RxV))); })
+
+Q6INSN(F2_sffma_lib,"Rx32+=sfmpy(Rs32,Rt32):lib",ATTRIBS(),
+"Floating-Point Fused Multiply Add for Library Routines",
+{ fFPSETROUND_NEAREST(); fHIDE(int infinp; int infminusinf; size4s_t tmp;)
+  infminusinf = ((isinf(fFLOAT(RxV))) &&
+                 (fISINFPROD(fFLOAT(RsV),fFLOAT(RtV))) &&
+                 (fGETBIT(31,RsV ^ RxV ^ RtV) != 0));
+  infinp = (isinf(fFLOAT(RxV))) || (isinf(fFLOAT(RtV))) || (isinf(fFLOAT(RsV)));
+  fCHECKSFNAN3(RxV,RxV,RsV,RtV);
+  tmp=fUNFLOAT(fFMAF(fFLOAT(RsV),fFLOAT(RtV),fFLOAT(RxV)));
+  if (!((fFLOAT(RxV) == 0.0) && fISZEROPROD(fFLOAT(RsV),fFLOAT(RtV)))) RxV = tmp;
+  fFPCANCELFLAGS();
+  if (isinf(fFLOAT(RxV)) && !infinp) RxV = RxV - 1;
+  if (infminusinf) RxV = 0;
+})
+
+Q6INSN(F2_sffms_lib,"Rx32-=sfmpy(Rs32,Rt32):lib",ATTRIBS(),
+"Floating-Point Fused Multiply Add for Library Routines",
+{ fFPSETROUND_NEAREST(); fHIDE(int infinp; int infminusinf; size4s_t tmp;)
+  infminusinf = ((isinf(fFLOAT(RxV))) &&
+                 (fISINFPROD(fFLOAT(RsV),fFLOAT(RtV))) &&
+                 (fGETBIT(31,RsV ^ RxV ^ RtV) == 0));
+  infinp = (isinf(fFLOAT(RxV))) || (isinf(fFLOAT(RtV))) || (isinf(fFLOAT(RsV)));
+  fCHECKSFNAN3(RxV,RxV,RsV,RtV);
+  tmp=fUNFLOAT(fFMAF(-fFLOAT(RsV),fFLOAT(RtV),fFLOAT(RxV)));
+  if (!((fFLOAT(RxV) == 0.0) && fISZEROPROD(fFLOAT(RsV),fFLOAT(RtV)))) RxV = tmp;
+  fFPCANCELFLAGS();
+  if (isinf(fFLOAT(RxV)) && !infinp) RxV = RxV - 1;
+  if (infminusinf) RxV = 0;
+})
+
+
+Q6INSN(F2_sfcmpeq,"Pd4=sfcmp.eq(Rs32,Rt32)",ATTRIBS(),
+"Floating Point Compare for Equal",
+{PdV=f8BITSOF(fFLOAT(RsV)==fFLOAT(RtV));})
+
+Q6INSN(F2_sfcmpgt,"Pd4=sfcmp.gt(Rs32,Rt32)",ATTRIBS(),
+"Floating-Point Compare for Greater Than",
+{PdV=f8BITSOF(fFLOAT(RsV)>fFLOAT(RtV));})
+
+/* cmpge is not the same as !cmpgt(swapops) in IEEE */
+
+Q6INSN(F2_sfcmpge,"Pd4=sfcmp.ge(Rs32,Rt32)",ATTRIBS(),
+"Floating-Point Compare for Greater Than / Equal To",
+{PdV=f8BITSOF(fFLOAT(RsV)>=fFLOAT(RtV));})
+
+/* Everyone seems to have this... */
+
+Q6INSN(F2_sfcmpuo,"Pd4=sfcmp.uo(Rs32,Rt32)",ATTRIBS(),
+"Floating-Point Compare for Unordered",
+{PdV=f8BITSOF(isunordered(fFLOAT(RsV),fFLOAT(RtV)));})
+
+
+Q6INSN(F2_sfmax,"Rd32=sfmax(Rs32,Rt32)",ATTRIBS(),
+"Maximum of Floating-Point values",
+{ RdV = fUNFLOAT(fSF_MAX(fFLOAT(RsV),fFLOAT(RtV))); })
+
+Q6INSN(F2_sfmin,"Rd32=sfmin(Rs32,Rt32)",ATTRIBS(),
+"Minimum of Floating-Point values",
+{ RdV = fUNFLOAT(fSF_MIN(fFLOAT(RsV),fFLOAT(RtV))); })
+
+
+Q6INSN(F2_sfclass,"Pd4=sfclass(Rs32,#u5)",ATTRIBS(),
+"Classify Floating-Point Value",
+{
+    fHIDE(int class;)
+    PdV = 0;
+    class = fpclassify(fFLOAT(RsV));
+    /* Is the value zero? */
+    if (fGETBIT(0,uiV) && (class == FP_ZERO)) PdV = 0xff;
+    if (fGETBIT(1,uiV) && (class == FP_NORMAL)) PdV = 0xff;
+    if (fGETBIT(2,uiV) && (class == FP_SUBNORMAL)) PdV = 0xff;
+    if (fGETBIT(3,uiV) && (class == FP_INFINITE)) PdV = 0xff;
+    if (fGETBIT(4,uiV) && (class == FP_NAN)) PdV = 0xff;
+    fFPCANCELFLAGS();
+})
+
+/* Range: +/- (1.0 .. 1+(63/64)) * 2**(-6 .. +9) */
+/* More immediate bits should probably be used for more precision? */
+
+Q6INSN(F2_sfimm_p,"Rd32=sfmake(#u10):pos",ATTRIBS(),
+"Make Floating Point Value",
+{
+    RdV = (127 - 6) << 23;
+    RdV += uiV << 17;
+})
+
+Q6INSN(F2_sfimm_n,"Rd32=sfmake(#u10):neg",ATTRIBS(),
+"Make Floating Point Value",
+{
+    RdV = (127 - 6) << 23;
+    RdV += (uiV << 17);
+    RdV |= (1 << 31);
+})
+
+
+Q6INSN(F2_sffixupn,"Rd32=sffixupn(Rs32,Rt32)",ATTRIBS(),
+"Fix Up Numerator",
+{
+    fHIDE(int adjust;)
+    fSF_RECIP_COMMON(RsV,RtV,RdV,adjust);
+    RdV = RsV;
+})
+
+Q6INSN(F2_sffixupd,"Rd32=sffixupd(Rs32,Rt32)",ATTRIBS(),
+"Fix Up Denominator",
+{
+    fHIDE(int adjust;)
+    fSF_RECIP_COMMON(RsV,RtV,RdV,adjust);
+    RdV = RtV;
+})
+
+Q6INSN(F2_sffixupr,"Rd32=sffixupr(Rs32)",ATTRIBS(),
+"Fix Up Radicand",
+{
+    fHIDE(int adjust;)
+    fSF_INVSQRT_COMMON(RsV,RdV,adjust);
+    RdV = RsV;
+})
+
+/*************************************/
+/* Scalar DP                         */
+/*************************************/
+Q6INSN(F2_dfadd,"Rdd32=dfadd(Rss32,Rtt32)",ATTRIBS(),
+"Floating-Point Add",
+{ RddV=fUNDOUBLE(fDOUBLE(RssV)+fDOUBLE(RttV));})
+
+Q6INSN(F2_dfsub,"Rdd32=dfsub(Rss32,Rtt32)",ATTRIBS(),
+"Floating-Point Subtract",
+{ RddV=fUNDOUBLE(fDOUBLE(RssV)-fDOUBLE(RttV));})
+
+Q6INSN(F2_dfmax,"Rdd32=dfmax(Rss32,Rtt32)",ATTRIBS(),
+"Maximum of Floating-Point values",
+{ RddV = fUNDOUBLE(fDF_MAX(fDOUBLE(RssV),fDOUBLE(RttV))); })
+
+Q6INSN(F2_dfmin,"Rdd32=dfmin(Rss32,Rtt32)",ATTRIBS(),
+"Minimum of Floating-Point values",
+{ RddV = fUNDOUBLE(fDF_MIN(fDOUBLE(RssV),fDOUBLE(RttV))); })
+
+Q6INSN(F2_dfmpyfix,"Rdd32=dfmpyfix(Rss32,Rtt32)",ATTRIBS(),
+"Fix Up Multiplicand for Multiplication",
+{
+    if (fDF_ISDENORM(RssV) && fDF_ISBIG(RttV) && fDF_ISNORMAL(RttV)) RddV = fUNDOUBLE(fDOUBLE(RssV) * 0x1.0p52);
+    else if (fDF_ISDENORM(RttV) && fDF_ISBIG(RssV) && fDF_ISNORMAL(RssV)) RddV = fUNDOUBLE(fDOUBLE(RssV) * 0x1.0p-52);
+    else RddV = RssV;
+})
+
+Q6INSN(F2_dfmpyll,"Rdd32=dfmpyll(Rss32,Rtt32)",ATTRIBS(),
+"Multiply low*low and shift off low 32 bits into sticky (in MSB)",
+{
+    fHIDE(size8u_t prod;)
+    prod = fMPY32UU(fGETUWORD(0,RssV),fGETUWORD(0,RttV));
+    RddV = (prod >> 32) << 1;
+    if (fGETUWORD(0,prod) != 0) fSETBIT(0,RddV,1);
+})
+
+Q6INSN(F2_dfmpylh,"Rxx32+=dfmpylh(Rss32,Rtt32)",ATTRIBS(),
+"Multiply low*high and accumulate",
+{
+    RxxV += (fGETUWORD(0,RssV) * (0x00100000 | fZXTN(20,64,fGETUWORD(1,RttV)))) << 1;
+})
+
+Q6INSN(F2_dfmpyhh,"Rxx32+=dfmpyhh(Rss32,Rtt32)",ATTRIBS(),
+"Multiply high*high and accumulate with L*H value",
+{
+    RxxV = fUNDOUBLE(fDF_MPY_HH(fDOUBLE(RssV),fDOUBLE(RttV),RxxV));
+})
+
+
+
+Q6INSN(F2_dfcmpeq,"Pd4=dfcmp.eq(Rss32,Rtt32)",ATTRIBS(),
+"Floating Point Compare for Equal",
+{PdV=f8BITSOF(fDOUBLE(RssV)==fDOUBLE(RttV));})
+
+Q6INSN(F2_dfcmpgt,"Pd4=dfcmp.gt(Rss32,Rtt32)",ATTRIBS(),
+"Floating-Point Compare for Greater Than",
+{PdV=f8BITSOF(fDOUBLE(RssV)>fDOUBLE(RttV));})
+
+
+/* cmpge is not the same as !cmpgt(swapops) in IEEE */
+
+Q6INSN(F2_dfcmpge,"Pd4=dfcmp.ge(Rss32,Rtt32)",ATTRIBS(),
+"Floating-Point Compare for Greater Than / Equal To",
+{PdV=f8BITSOF(fDOUBLE(RssV)>=fDOUBLE(RttV));})
+
+/* Everyone seems to have this... */
+
+Q6INSN(F2_dfcmpuo,"Pd4=dfcmp.uo(Rss32,Rtt32)",ATTRIBS(),
+"Floating-Point Compare for Unordered",
+{PdV=f8BITSOF(isunordered(fDOUBLE(RssV),fDOUBLE(RttV)));})
+
+
+Q6INSN(F2_dfclass,"Pd4=dfclass(Rss32,#u5)",ATTRIBS(),
+"Classify Floating-Point Value",
+{
+    fHIDE(int class;)
+    PdV = 0;
+    class = fpclassify(fDOUBLE(RssV));
+    /* Is the value zero? */
+    if (fGETBIT(0,uiV) && (class == FP_ZERO)) PdV = 0xff;
+    if (fGETBIT(1,uiV) && (class == FP_NORMAL)) PdV = 0xff;
+    if (fGETBIT(2,uiV) && (class == FP_SUBNORMAL)) PdV = 0xff;
+    if (fGETBIT(3,uiV) && (class == FP_INFINITE)) PdV = 0xff;
+    if (fGETBIT(4,uiV) && (class == FP_NAN)) PdV = 0xff;
+    fFPCANCELFLAGS();
+})
+
+
+/* Range: +/- (1.0 .. 1+(63/64)) * 2**(-6 .. +9) */
+/* More immediate bits should probably be used for more precision? */
+
+Q6INSN(F2_dfimm_p,"Rdd32=dfmake(#u10):pos",ATTRIBS(),
+"Make Floating Point Value",
+{
+    RddV = (1023ULL - 6) << 52;
+    RddV += (fHIDE((size8u_t))uiV) << 46;
+})
+
+Q6INSN(F2_dfimm_n,"Rdd32=dfmake(#u10):neg",ATTRIBS(),
+"Make Floating Point Value",
+{
+    RddV = (1023ULL - 6) << 52;
+    RddV += (fHIDE((size8u_t))uiV) << 46;
+    RddV |= ((1ULL) << 63);
+})
+
+
+/* CONVERSION */
+
+#define CONVERT(TAG,DEST,DESTV,SRC,SRCV,OUTCAST,OUTTYPE,INCAST,INTYPE,MODETAG,MODESYN,MODEBEH) \
+    Q6INSN(F2_conv_##TAG##MODETAG,#DEST"=convert_"#TAG"("#SRC")"#MODESYN,ATTRIBS(), \
+    "Floating point format conversion", \
+    { MODEBEH DESTV = OUTCAST(conv_##INTYPE##_to_##OUTTYPE(INCAST(SRCV))); })
+
+CONVERT(sf2df,Rdd32,RddV,Rs32,RsV,fUNDOUBLE,df,fFLOAT,sf,,,)
+CONVERT(df2sf,Rd32,RdV,Rss32,RssV,fUNFLOAT,sf,fDOUBLE,df,,,)
+
+#define ALLINTDST(TAGSTART,SRC,SRCV,INCAST,INTYPE,MODETAG,MODESYN,MODEBEH) \
+CONVERT(TAGSTART##uw,Rd32,RdV,SRC,SRCV,fCAST4u,4u,INCAST,INTYPE,MODETAG,MODESYN,MODEBEH) \
+CONVERT(TAGSTART##w,Rd32,RdV,SRC,SRCV,fCAST4s,4s,INCAST,INTYPE,MODETAG,MODESYN,MODEBEH) \
+CONVERT(TAGSTART##ud,Rdd32,RddV,SRC,SRCV,fCAST8u,8u,INCAST,INTYPE,MODETAG,MODESYN,MODEBEH) \
+CONVERT(TAGSTART##d,Rdd32,RddV,SRC,SRCV,fCAST8s,8s,INCAST,INTYPE,MODETAG,MODESYN,MODEBEH)
+
+#define ALLFPDST(TAGSTART,SRC,SRCV,INCAST,INTYPE,MODETAG,MODESYN,MODEBEH) \
+CONVERT(TAGSTART##sf,Rd32,RdV,SRC,SRCV,fUNFLOAT,sf,INCAST,INTYPE,MODETAG,MODESYN,MODEBEH) \
+CONVERT(TAGSTART##df,Rdd32,RddV,SRC,SRCV,fUNDOUBLE,df,INCAST,INTYPE,MODETAG,MODESYN,MODEBEH)
+
+#define ALLINTSRC(GEN,MODETAG,MODESYN,MODEBEH) \
+GEN(uw##2,Rs32,RsV,fCAST4u,4u,MODETAG,MODESYN,MODEBEH) \
+GEN(w##2,Rs32,RsV,fCAST4s,4s,MODETAG,MODESYN,MODEBEH) \
+GEN(ud##2,Rss32,RssV,fCAST8u,8u,MODETAG,MODESYN,MODEBEH) \
+GEN(d##2,Rss32,RssV,fCAST8s,8s,MODETAG,MODESYN,MODEBEH)
+
+#define ALLFPSRC(GEN,MODETAG,MODESYN,MODEBEH) \
+GEN(sf##2,Rs32,RsV,fFLOAT,sf,MODETAG,MODESYN,MODEBEH) \
+GEN(df##2,Rss32,RssV,fDOUBLE,df,MODETAG,MODESYN,MODEBEH)
+
+ALLINTSRC(ALLFPDST,,,)
+ALLFPSRC(ALLINTDST,,,)
+ALLFPSRC(ALLINTDST,_chop,:chop,fFPSETROUND_CHOP();)
diff --git a/target/hexagon/imported/ldst.idef b/target/hexagon/imported/ldst.idef
new file mode 100644
index 0000000000..78a2ea441c
--- /dev/null
+++ b/target/hexagon/imported/ldst.idef
@@ -0,0 +1,286 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Load and Store instruction definitions
+ */
+
+/* The set of addressing modes standard to all Load instructions */
+#define STD_LD_AMODES(TAG,OPER,DESCR,ATTRIB,SHFT,SEMANTICS,SCALE)\
+Q6INSN(L2_##TAG##_io,  OPER"(Rs32+#s11:"SHFT")",          ATTRIB,DESCR,{fIMMEXT(siV); fEA_RI(RsV,siV); SEMANTICS; })\
+Q6INSN(L4_##TAG##_ur,  OPER"(Rt32<<#u2+#U6)",             ATTRIB,DESCR,{fMUST_IMMEXT(UiV); fEA_IRs(UiV,RtV,uiV); SEMANTICS;})\
+Q6INSN(L4_##TAG##_ap,  OPER"(Re32=#U6)",                  ATTRIB,DESCR,{fMUST_IMMEXT(UiV); fEA_IMM(UiV); SEMANTICS; ReV=UiV; })\
+Q6INSN(L2_##TAG##_pr,  OPER"(Rx32++Mu2)",                 ATTRIB,DESCR,{fEA_REG(RxV); fPM_M(RxV,MuV); SEMANTICS;})\
+Q6INSN(L2_##TAG##_pi,  OPER"(Rx32++#s4:"SHFT")",          ATTRIB,DESCR,{fEA_REG(RxV); fPM_I(RxV,siV); SEMANTICS;})\
+
+/* The set of 32-bit load instructions */
+STD_LD_AMODES(loadrub,"Rd32=memub","Load Unsigned Byte",ATTRIBS(A_LOAD),"0",fLOAD(1,1,u,EA,RdV),0)
+STD_LD_AMODES(loadrb, "Rd32=memb", "Load signed Byte",ATTRIBS(A_LOAD),"0",fLOAD(1,1,s,EA,RdV),0)
+STD_LD_AMODES(loadruh,"Rd32=memuh","Load unsigned Half integer",ATTRIBS(A_LOAD),"1",fLOAD(1,2,u,EA,RdV),1)
+STD_LD_AMODES(loadrh, "Rd32=memh", "Load signed Half integer",ATTRIBS(A_LOAD),"1",fLOAD(1,2,s,EA,RdV),1)
+STD_LD_AMODES(loadri, "Rd32=memw", "Load Word",ATTRIBS(A_LOAD),"2",fLOAD(1,4,u,EA,RdV),2)
+STD_LD_AMODES(loadrd, "Rdd32=memd","Load Double integer",ATTRIBS(A_LOAD),"3",fLOAD(1,8,u,EA,RddV),3)
+
+/* The set of addressing modes standard to all Store instructions */
+#define STD_ST_AMODES(TAG,DEST,OPER,DESCR,ATTRIB,SHFT,SEMANTICS,SCALE)\
+Q6INSN(S2_##TAG##_io,  OPER"(Rs32+#s11:"SHFT")="DEST,     ATTRIB,DESCR,{fIMMEXT(siV); fEA_RI(RsV,siV); SEMANTICS; })\
+Q6INSN(S2_##TAG##_pi,  OPER"(Rx32++#s4:"SHFT")="DEST,     ATTRIB,DESCR,{fEA_REG(RxV); fPM_I(RxV,siV); SEMANTICS; })\
+Q6INSN(S4_##TAG##_ap,  OPER"(Re32=#U6)="DEST,             ATTRIB,DESCR,{fMUST_IMMEXT(UiV); fEA_IMM(UiV); SEMANTICS; ReV=UiV; })\
+Q6INSN(S2_##TAG##_pr,  OPER"(Rx32++Mu2)="DEST,            ATTRIB,DESCR,{fEA_REG(RxV); fPM_M(RxV,MuV); SEMANTICS; })\
+Q6INSN(S4_##TAG##_ur,  OPER"(Ru32<<#u2+#U6)="DEST,            ATTRIB,DESCR,{fMUST_IMMEXT(UiV); fEA_IRs(UiV,RuV,uiV); SEMANTICS;})\
+
+
+/* The set of 32-bit store instructions */
+STD_ST_AMODES(storerb, "Rt32", "memb","Store Byte",ATTRIBS(A_STORE),"0",fSTORE(1,1,EA,fGETBYTE(0,RtV)),0)
+STD_ST_AMODES(storerh, "Rt32", "memh","Store Half integer",ATTRIBS(A_STORE),"1",fSTORE(1,2,EA,fGETHALF(0,RtV)),1)
+STD_ST_AMODES(storerf, "Rt.H32", "memh","Store Upper Half integer",ATTRIBS(A_STORE),"1",fSTORE(1,2,EA,fGETHALF(1,RtV)),1)
+STD_ST_AMODES(storeri, "Rt32", "memw","Store Word",ATTRIBS(A_STORE),"2",fSTORE(1,4,EA,RtV),2)
+STD_ST_AMODES(storerd, "Rtt32","memd","Store Double integer",ATTRIBS(A_STORE),"3",fSTORE(1,8,EA,RttV),3)
+STD_ST_AMODES(storerinew, "Nt8.new", "memw","Store Word",ATTRIBS(A_STORE),"2",fSTORE(1,4,EA,fNEWREG_ST(NtN)),2)
+STD_ST_AMODES(storerbnew, "Nt8.new", "memb","Store Byte",ATTRIBS(A_STORE),"0",fSTORE(1,1,EA,fGETBYTE(0,fNEWREG_ST(NtN))),0)
+STD_ST_AMODES(storerhnew, "Nt8.new", "memh","Store Half integer",ATTRIBS(A_STORE),"1",fSTORE(1,2,EA,fGETHALF(0,fNEWREG_ST(NtN))),1)
+
+
+Q6INSN(S2_allocframe,"allocframe(Rx32,#u11:3):raw", ATTRIBS(A_STORE,A_RESTRICT_SLOT0ONLY), "Allocate stack frame",
+{ fEA_RI(RxV,-8); fSTORE(1,8,EA,fFRAME_SCRAMBLE((fCAST8_8u(fREAD_LR()) << 32) | fCAST4_4u(fREAD_FP()))); fWRITE_FP(EA); fFRAMECHECK(EA-uiV,EA); RxV = EA-uiV; })
+
+#define A_RETURN A_RESTRICT_SLOT0ONLY
+
+Q6INSN(L2_deallocframe,"Rdd32=deallocframe(Rs32):raw", ATTRIBS(A_LOAD), "Deallocate stack frame",
+{ fHIDE(size8u_t tmp;) fEA_REG(RsV);
+  fLOAD(1,8,u,EA,tmp);
+  RddV = fFRAME_UNSCRAMBLE(tmp);
+  fWRITE_SP(EA+8); })
+
+Q6INSN(L4_return,"Rdd32=dealloc_return(Rs32):raw", ATTRIBS(A_JINDIR,A_LOAD,A_RETURN), "Deallocate stack frame and return",
+{ fHIDE(size8u_t tmp;) fEA_REG(RsV);
+  fLOAD(1,8,u,EA,tmp);
+  RddV = fFRAME_UNSCRAMBLE(tmp);
+  fWRITE_SP(EA+8);
+  fJUMPR(REG_LR,fGETWORD(1,RddV),COF_TYPE_JUMPR);})
+
+#define CONDSEM(SRCREG,STALLBITS0,STALLBITS1,PREDFUNC,PREDARG,STALLSPEC,PREDCOND) \
+{ \
+    fHIDE(size8u_t tmp;) \
+    fBRANCH_SPECULATE_STALL(PREDFUNC##PREDCOND(PREDARG),,STALLSPEC,STALLBITS0,STALLBITS1); \
+    fEA_REG(SRCREG); \
+    if (PREDFUNC##PREDCOND(PREDARG)) { \
+        fLOAD(1,8,u,EA,tmp); \
+        RddV = fFRAME_UNSCRAMBLE(tmp); \
+        fWRITE_SP(EA+8); \
+        fJUMPR(REG_LR,fGETWORD(1,RddV),COF_TYPE_JUMPR); \
+    } else { \
+        LOAD_CANCEL(EA); \
+    } \
+}
+
+#define COND_RETURN_TF(TG,TG2,DOTNEW,STALLBITS0,STALLBITS1,STALLSPEC,ATTRIBS,PREDFUNC,PREDARG,T_NT) \
+    Q6INSN(TG##_t##TG2,"if (Pv4"DOTNEW") Rdd32=dealloc_return(Rs32)"T_NT":raw",ATTRIBS,"deallocate stack frame and return", \
+    CONDSEM(RsV,STALLBITS0,STALLBITS1,PREDFUNC,PREDARG,STALLSPEC,)) \
+    Q6INSN(TG##_f##TG2,"if (!Pv4"DOTNEW") Rdd32=dealloc_return(Rs32)"T_NT":raw",ATTRIBS,"deallocate stack frame and return", \
+    CONDSEM(RsV,STALLBITS0,STALLBITS1,PREDFUNC##NOT,PREDARG,STALLSPEC,))
+
+#define COND_RETURN_NEW(TG,STALLBITS0,STALLBITS1,ATTRIBS) \
+    COND_RETURN_TF(TG,new_pt,".new",12,0,SPECULATE_TAKEN,ATTRIBS,fLSBNEW,PvN,":t") \
+    COND_RETURN_TF(TG,new_pnt,".new",12,0,SPECULATE_NOT_TAKEN,ATTRIBS,fLSBNEW,PvN,":nt") \
+
+#define RETURN_ATTRIBS A_LOAD,A_RETURN
+
+COND_RETURN_TF(L4_return,,,7,0,SPECULATE_NOT_TAKEN,ATTRIBS(RETURN_ATTRIBS,A_JINDIROLD),fLSBOLD,PvV,)
+COND_RETURN_NEW(L4_return,12,0,ATTRIBS(RETURN_ATTRIBS,A_JINDIRNEW))
+
+
+
+
+Q6INSN(L2_loadw_locked,"Rd32=memw_locked(Rs32)", ATTRIBS(A_LOAD,A_RESTRICT_SLOT0ONLY), "Load word with lock",
+{ fEA_REG(RsV); fLOAD_LOCKED(1,4,u,EA,RdV) })
+
+
+Q6INSN(S2_storew_locked,"memw_locked(Rs32,Pd4)=Rt32", ATTRIBS(A_STORE,A_RESTRICT_SLOT0ONLY), "Store word with lock",
+{ fEA_REG(RsV); fSTORE_LOCKED(1,4,EA,RtV,PdV) })
+
+
+Q6INSN(L4_loadd_locked,"Rdd32=memd_locked(Rs32)", ATTRIBS(A_LOAD,A_RESTRICT_SLOT0ONLY), "Load double with lock",
+{ fEA_REG(RsV); fLOAD_LOCKED(1,8,u,EA,RddV) })
+
+Q6INSN(S4_stored_locked,"memd_locked(Rs32,Pd4)=Rtt32", ATTRIBS(A_STORE,A_RESTRICT_SLOT0ONLY), "Store word with lock",
+{ fEA_REG(RsV); fSTORE_LOCKED(1,8,EA,RttV,PdV) })
+
+
+
+
+
+/*****************************************************************/
+/*                                                               */
+/*                       Predicated LDST                         */
+/*                                                               */
+/*****************************************************************/
+
+#define STD_PLD_AMODES(TAG,OPER,DESCR,ATTRIB,SHFT,SHFTNUM,SEMANTICS)\
+Q6INSN(L4_##TAG##_rr,  OPER"(Rs32+Rt32<<#u2)",            ATTRIB,DESCR,{fEA_RRs(RsV,RtV,uiV); SEMANTICS;})\
+Q6INSN(L2_p##TAG##t_io, "if (Pt4) "OPER"(Rs32+#u6:"SHFT")",            ATTRIB,DESCR,{fIMMEXT(uiV); fEA_RI(RsV,uiV); if(fLSBOLD(PtV)){SEMANTICS;} else {LOAD_CANCEL(EA);}})\
+Q6INSN(L2_p##TAG##t_pi, "if (Pt4) "OPER"(Rx32++#s4:"SHFT")",           ATTRIB,DESCR,{fEA_REG(RxV); if(fLSBOLD(PtV)){ fPM_I(RxV,siV); SEMANTICS;} else {LOAD_CANCEL(EA);}})\
+Q6INSN(L2_p##TAG##f_io, "if (!Pt4) "OPER"(Rs32+#u6:"SHFT")",           ATTRIB,DESCR,{fIMMEXT(uiV); fEA_RI(RsV,uiV); if(fLSBOLDNOT(PtV)){ SEMANTICS; } else {LOAD_CANCEL(EA);}})\
+Q6INSN(L2_p##TAG##f_pi, "if (!Pt4) "OPER"(Rx32++#s4:"SHFT")",          ATTRIB,DESCR,{fEA_REG(RxV); if(fLSBOLDNOT(PtV)){ fPM_I(RxV,siV); SEMANTICS;} else {LOAD_CANCEL(EA);}})\
+Q6INSN(L2_p##TAG##tnew_io,"if (Pt4.new) "OPER"(Rs32+#u6:"SHFT")",ATTRIB,DESCR,{fIMMEXT(uiV); fEA_RI(RsV,uiV); if (fLSBNEW(PtN))  { SEMANTICS; } else {LOAD_CANCEL(EA);}})\
+Q6INSN(L2_p##TAG##fnew_io,"if (!Pt4.new) "OPER"(Rs32+#u6:"SHFT")",ATTRIB,DESCR,{fIMMEXT(uiV); fEA_RI(RsV,uiV); if (fLSBNEWNOT(PtN)) { SEMANTICS; } else {LOAD_CANCEL(EA);}})\
+Q6INSN(L4_p##TAG##t_rr, "if (Pv4) "OPER"(Rs32+Rt32<<#u2)",            ATTRIB,DESCR,{fEA_RRs(RsV,RtV,uiV); if(fLSBOLD(PvV)){ SEMANTICS;} else {LOAD_CANCEL(EA);}})\
+Q6INSN(L4_p##TAG##f_rr, "if (!Pv4) "OPER"(Rs32+Rt32<<#u2)",           ATTRIB,DESCR,{fEA_RRs(RsV,RtV,uiV); if(fLSBOLDNOT(PvV)){ SEMANTICS; } else {LOAD_CANCEL(EA);}})\
+Q6INSN(L4_p##TAG##tnew_rr,"if (Pv4.new) "OPER"(Rs32+Rt32<<#u2)",ATTRIB,DESCR,{fEA_RRs(RsV,RtV,uiV); if (fLSBNEW(PvN))  { SEMANTICS; } else {LOAD_CANCEL(EA);}})\
+Q6INSN(L4_p##TAG##fnew_rr,"if (!Pv4.new) "OPER"(Rs32+Rt32<<#u2)",ATTRIB,DESCR,{fEA_RRs(RsV,RtV,uiV); if (fLSBNEWNOT(PvN)) { SEMANTICS; } else {LOAD_CANCEL(EA);}})\
+Q6INSN(L2_p##TAG##tnew_pi, "if (Pt4.new) "OPER"(Rx32++#s4:"SHFT")",           ATTRIB,DESCR,{fEA_REG(RxV); if(fLSBNEW(PtN)){ fPM_I(RxV,siV); SEMANTICS;} else {LOAD_CANCEL(EA);}})\
+Q6INSN(L2_p##TAG##fnew_pi, "if (!Pt4.new) "OPER"(Rx32++#s4:"SHFT")",          ATTRIB,DESCR,{fEA_REG(RxV); if(fLSBNEWNOT(PtN)){ fPM_I(RxV,siV); SEMANTICS;} else {LOAD_CANCEL(EA);}})\
+Q6INSN(L4_p##TAG##t_abs, "if (Pt4) "OPER"(#u6)",            ATTRIB,DESCR,{fMUST_IMMEXT(uiV); fEA_IMM(uiV); if(fLSBOLD(PtV)){ SEMANTICS;} else {LOAD_CANCEL(EA);}})\
+Q6INSN(L4_p##TAG##f_abs, "if (!Pt4) "OPER"(#u6)",           ATTRIB,DESCR,{fMUST_IMMEXT(uiV); fEA_IMM(uiV); if(fLSBOLDNOT(PtV)){ SEMANTICS; } else {LOAD_CANCEL(EA);}})\
+Q6INSN(L4_p##TAG##tnew_abs,"if (Pt4.new) "OPER"(#u6)",ATTRIB,DESCR,{fMUST_IMMEXT(uiV); fEA_IMM(uiV);if (fLSBNEW(PtN))  { SEMANTICS; } else {LOAD_CANCEL(EA);}})\
+Q6INSN(L4_p##TAG##fnew_abs,"if (!Pt4.new) "OPER"(#u6)",ATTRIB,DESCR,{fMUST_IMMEXT(uiV); fEA_IMM(uiV);if (fLSBNEWNOT(PtN)) { SEMANTICS; } else {LOAD_CANCEL(EA);}})
+
+
+
+/* The set of 32-bit predicated load instructions */
+STD_PLD_AMODES(loadrub,"Rd32=memub","Load Unsigned Byte",ATTRIBS(A_ARCHV2,A_LOAD),"0",0,fLOAD(1,1,u,EA,RdV))
+STD_PLD_AMODES(loadrb, "Rd32=memb", "Load signed Byte",ATTRIBS(A_ARCHV2,A_LOAD),"0",0,fLOAD(1,1,s,EA,RdV))
+STD_PLD_AMODES(loadruh,"Rd32=memuh","Load unsigned Half integer",ATTRIBS(A_ARCHV2,A_LOAD),"1",1,fLOAD(1,2,u,EA,RdV))
+STD_PLD_AMODES(loadrh, "Rd32=memh", "Load signed Half integer",ATTRIBS(A_ARCHV2,A_LOAD),"1",1,fLOAD(1,2,s,EA,RdV))
+STD_PLD_AMODES(loadri, "Rd32=memw", "Load Word",ATTRIBS(A_ARCHV2,A_LOAD),"2",2,fLOAD(1,4,u,EA,RdV))
+STD_PLD_AMODES(loadrd, "Rdd32=memd","Load Double integer",ATTRIBS(A_ARCHV2,A_LOAD),"3",3,fLOAD(1,8,u,EA,RddV))
+
+/* The set of addressing modes standard to all predicated store instructions */
+#define STD_PST_AMODES(TAG,DEST,OPER,DESCR,ATTRIB,SHFT,SHFTNUM,SEMANTICS)\
+Q6INSN(S4_##TAG##_rr,  OPER"(Rs32+Ru32<<#u2)="DEST,            ATTRIB,DESCR,{fEA_RRs(RsV,RuV,uiV); SEMANTICS;})\
+Q6INSN(S2_p##TAG##t_io, "if (Pv4) "OPER"(Rs32+#u6:"SHFT")="DEST,     ATTRIB,DESCR,{fIMMEXT(uiV); fEA_RI(RsV,uiV); if (fLSBOLD(PvV)){ SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S2_p##TAG##t_pi, "if (Pv4) "OPER"(Rx32++#s4:"SHFT")="DEST,     ATTRIB,DESCR,{fEA_REG(RxV); if (fLSBOLD(PvV)){ fPM_I(RxV,siV); SEMANTICS;} else {STORE_CANCEL(EA);}})\
+Q6INSN(S2_p##TAG##f_io, "if (!Pv4) "OPER"(Rs32+#u6:"SHFT")="DEST,     ATTRIB,DESCR,{fIMMEXT(uiV); fEA_RI(RsV,uiV); if (fLSBOLDNOT(PvV)){ SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S2_p##TAG##f_pi, "if (!Pv4) "OPER"(Rx32++#s4:"SHFT")="DEST,     ATTRIB,DESCR,{fEA_REG(RxV); if (fLSBOLDNOT(PvV)){ fPM_I(RxV,siV); SEMANTICS;} else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_p##TAG##t_rr, "if (Pv4) "OPER"(Rs32+Ru32<<#u2)="DEST,     ATTRIB,DESCR,{fEA_RRs(RsV,RuV,uiV); if (fLSBOLD(PvV)){ SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_p##TAG##f_rr, "if (!Pv4) "OPER"(Rs32+Ru32<<#u2)="DEST,     ATTRIB,DESCR,{fEA_RRs(RsV,RuV,uiV); if (fLSBOLDNOT(PvV)){ SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_p##TAG##tnew_io,"if (Pv4.new) "OPER"(Rs32+#u6:"SHFT")="DEST,ATTRIB,DESCR,{fIMMEXT(uiV); fEA_RI(RsV,uiV); if ( fLSBNEW(PvN)) { SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_p##TAG##fnew_io,"if (!Pv4.new) "OPER"(Rs32+#u6:"SHFT")="DEST,ATTRIB,DESCR,{fIMMEXT(uiV); fEA_RI(RsV,uiV); if (fLSBNEWNOT(PvN)) { SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_p##TAG##tnew_rr,"if (Pv4.new) "OPER"(Rs32+Ru32<<#u2)="DEST,ATTRIB,DESCR,{fEA_RRs(RsV,RuV,uiV); if ( fLSBNEW(PvN)) { SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_p##TAG##fnew_rr,"if (!Pv4.new) "OPER"(Rs32+Ru32<<#u2)="DEST,ATTRIB,DESCR,{fEA_RRs(RsV,RuV,uiV); if (fLSBNEWNOT(PvN)) { SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S2_p##TAG##tnew_pi, "if (Pv4.new) "OPER"(Rx32++#s4:"SHFT")="DEST,     ATTRIB,DESCR,{fEA_REG(RxV); if (fLSBNEW(PvN)){ fPM_I(RxV,siV); SEMANTICS;} else {STORE_CANCEL(EA);}})\
+Q6INSN(S2_p##TAG##fnew_pi, "if (!Pv4.new) "OPER"(Rx32++#s4:"SHFT")="DEST,     ATTRIB,DESCR,{fEA_REG(RxV); if (fLSBNEWNOT(PvN)){ fPM_I(RxV,siV); SEMANTICS;} else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_p##TAG##t_abs, "if (Pv4) "OPER"(#u6)="DEST,     ATTRIB,DESCR,{fMUST_IMMEXT(uiV); fEA_IMM(uiV); if (fLSBOLD(PvV)){ SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_p##TAG##f_abs, "if (!Pv4) "OPER"(#u6)="DEST,     ATTRIB,DESCR,{fMUST_IMMEXT(uiV);fEA_IMM(uiV); if (fLSBOLDNOT(PvV)){ SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_p##TAG##tnew_abs,"if (Pv4.new) "OPER"(#u6)="DEST,ATTRIB,DESCR,{fMUST_IMMEXT(uiV);fEA_IMM(uiV); if ( fLSBNEW(PvN)) { SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_p##TAG##fnew_abs,"if (!Pv4.new) "OPER"(#u6)="DEST,ATTRIB,DESCR,{fMUST_IMMEXT(uiV);fEA_IMM(uiV); if (fLSBNEWNOT(PvN)) { SEMANTICS; } else {STORE_CANCEL(EA);}})
+
+
+
+
+/* The set of 32-bit predicated store instructions */
+STD_PST_AMODES(storerb,"Rt32","memb","Store Byte",ATTRIBS(A_ARCHV2,A_STORE),"0",0,fSTORE(1,1,EA,fGETBYTE(0,RtV)))
+STD_PST_AMODES(storerh,"Rt32","memh","Store Half integer",ATTRIBS(A_ARCHV2,A_STORE),"1",1,fSTORE(1,2,EA,fGETHALF(0,RtV)))
+STD_PST_AMODES(storerf,"Rt.H32","memh","Store Upper Half integer",ATTRIBS(A_ARCHV2,A_STORE),"1",1,fSTORE(1,2,EA,fGETHALF(1,RtV)))
+STD_PST_AMODES(storeri,"Rt32","memw","Store Word",ATTRIBS(A_ARCHV2,A_STORE),"2",2,fSTORE(1,4,EA,RtV))
+STD_PST_AMODES(storerd,"Rtt32","memd","Store Double integer",ATTRIBS(A_ARCHV2,A_STORE),"3",3,fSTORE(1,8,EA,RttV))
+STD_PST_AMODES(storerinew,"Nt8.new","memw","Store Word",ATTRIBS(A_ARCHV2,A_STORE),"2",2,fSTORE(1,4,EA,fNEWREG_ST(NtN)))
+STD_PST_AMODES(storerbnew,"Nt8.new","memb","Store Byte",ATTRIBS(A_ARCHV2,A_STORE),"0",0,fSTORE(1,1,EA,fGETBYTE(0,fNEWREG_ST(NtN))))
+STD_PST_AMODES(storerhnew,"Nt8.new","memh","Store Half integer",ATTRIBS(A_ARCHV2,A_STORE),"1",1,fSTORE(1,2,EA,fGETHALF(0,fNEWREG_ST(NtN))))
+
+
+
+
+/*****************************************************************/
+/*                                                               */
+/*                       Mem-Ops (Load-op-Store)                 */
+/*                                                               */
+/*****************************************************************/
+
+/* The set of 32-bit non-predicated mem-ops */
+#define STD_MEMOP_AMODES(TAG,OPER,DESCR,SEMANTICS)\
+Q6INSN(L4_##TAG##w_io,  "memw(Rs32+#u6:2)"OPER,     ATTRIBS(A_RESTRICT_SLOT0ONLY),DESCR,{fIMMEXT(uiV); fEA_RI(RsV,uiV); fHIDE(size4s_t tmp;) fLOAD(1,4,s,EA,tmp); SEMANTICS;  fSTORE(1,4,EA,tmp); })\
+Q6INSN(L4_##TAG##b_io,  "memb(Rs32+#u6:0)"OPER,     ATTRIBS(A_RESTRICT_SLOT0ONLY),DESCR,{fIMMEXT(uiV); fEA_RI(RsV,uiV); fHIDE(size4s_t tmp;) fLOAD(1,1,s,EA,tmp); SEMANTICS;  fSTORE(1,1,EA,tmp); })\
+Q6INSN(L4_##TAG##h_io,  "memh(Rs32+#u6:1)"OPER,     ATTRIBS(A_RESTRICT_SLOT0ONLY),DESCR,{fIMMEXT(uiV); fEA_RI(RsV,uiV); fHIDE(size4s_t tmp;) fLOAD(1,2,s,EA,tmp); SEMANTICS;  fSTORE(1,2,EA,tmp); })
+
+
+
+STD_MEMOP_AMODES(add_memop, "+=Rt32", "Add Register to Memory Word", tmp += RtV)
+STD_MEMOP_AMODES(sub_memop, "-=Rt32", "Sub Register from Memory Word", tmp -= RtV)
+STD_MEMOP_AMODES(and_memop, "&=Rt32", "Logical AND Register to Memory Word", tmp &= RtV)
+STD_MEMOP_AMODES(or_memop, "|=Rt32", "Logical OR Register to Memory Word", tmp |= RtV)
+
+
+STD_MEMOP_AMODES(iadd_memop, "+=#U5", "Add Immediate to Memory Word", tmp += UiV)
+STD_MEMOP_AMODES(isub_memop, "-=#U5", "Sub Immediate to Memory Word", tmp -= UiV)
+STD_MEMOP_AMODES(iand_memop, "=clrbit(#U5)", "Clear a bit in memory", tmp &= (~(1<<UiV)))
+STD_MEMOP_AMODES(ior_memop,  "=setbit(#U5)", "Set a bit in memory", tmp |= (1<<UiV))
+
+
+/*****************************************************************/
+/*                                                               */
+/*                  V4 store immediates                          */
+/*                                                               */
+/*****************************************************************/
+/* Predicated Store immediates */
+#define V4_PSTI_AMODES(TAG,DEST,OPER,DESCR,ATTRIB,SHFT,SEMANTICS)\
+Q6INSN(S4_##TAG##t_io,"if (Pv4) "OPER"(Rs32+#u6:"SHFT")="DEST,ATTRIB,DESCR,{fEA_RI(RsV,uiV); if (fLSBOLD(PvV)){ SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_##TAG##f_io,"if (!Pv4) "OPER"(Rs32+#u6:"SHFT")="DEST,ATTRIB,DESCR,{fEA_RI(RsV,uiV); if (fLSBOLDNOT(PvV)){ SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_##TAG##tnew_io,"if (Pv4.new) "OPER"(Rs32+#u6:"SHFT")="DEST,ATTRIB,DESCR,{fEA_RI(RsV,uiV); if (fLSBNEW(PvN)){ SEMANTICS; } else {STORE_CANCEL(EA);}})\
+Q6INSN(S4_##TAG##fnew_io,"if (!Pv4.new) "OPER"(Rs32+#u6:"SHFT")="DEST,ATTRIB,DESCR,{fEA_RI(RsV,uiV); if (fLSBNEWNOT(PvN)){ SEMANTICS; } else {STORE_CANCEL(EA);}})
+
+/* The set of 32-bit store immediate instructions */
+V4_PSTI_AMODES(storeirb,"#S6","memb","Store Immediate Byte",ATTRIBS(A_ARCHV2,A_STORE),"0",fIMMEXT(SiV); fSTORE(1,1,EA,SiV))
+V4_PSTI_AMODES(storeirh,"#S6","memh","Store Immediate Half integer",ATTRIBS(A_ARCHV2,A_STORE),"1",fIMMEXT(SiV); fSTORE(1,2,EA,SiV))
+V4_PSTI_AMODES(storeiri,"#S6","memw","Store Immediate Word",ATTRIBS(A_ARCHV2,A_STORE),"2",fIMMEXT(SiV); fSTORE(1,4,EA,SiV))
+
+
+/* Non-predicated store immediates */
+#define V4_STI_AMODES(TAG,DEST,OPER,DESCR,ATTRIB,SHFT,SEMANTICS)\
+Q6INSN(S4_##TAG##_io,  OPER"(Rs32+#u6:"SHFT")="DEST,  ATTRIB,DESCR,{fEA_RI(RsV,uiV); SEMANTICS; })
+
+/* The set of 32-bit store immediate instructions */
+V4_STI_AMODES(storeirb,"#S8","memb","Store Immediate Byte",ATTRIBS(A_ARCHV2,A_STORE),"0",fIMMEXT(SiV); fSTORE(1,1,EA,SiV))
+V4_STI_AMODES(storeirh,"#S8","memh","Store Immediate Half integer",ATTRIBS(A_ARCHV2,A_STORE),"1",fIMMEXT(SiV); fSTORE(1,2,EA,SiV))
+V4_STI_AMODES(storeiri,"#S8","memw","Store Immediate Word",ATTRIBS(A_ARCHV2,A_STORE),"2",fIMMEXT(SiV); fSTORE(1,4,EA,SiV))
+
+
+
+
+
+
+
+/*****************************************************************/
+/*                                                               */
+/*                  V2 GP-relative LD/ST                         */
+/*                                                               */
+/*****************************************************************/
+
+#define STD_GPLD_AMODES(TAG,OPER,DESCR,ATTRIB,SHFT,SEMANTICS)\
+Q6INSN(L2_##TAG##gp, OPER"(gp+#u16:"SHFT")",   ATTRIB,DESCR,{fIMMEXT(uiV); fEA_GPI(uiV); SEMANTICS; })
+
+/* The set of 32-bit load instructions */
+STD_GPLD_AMODES(loadrub,"Rd32=memub","Load Unsigned Byte",ATTRIBS(A_LOAD,A_ARCHV2),"0",fLOAD(1,1,u,EA,RdV))
+STD_GPLD_AMODES(loadrb, "Rd32=memb", "Load signed Byte",ATTRIBS(A_LOAD,A_ARCHV2),"0",fLOAD(1,1,s,EA,RdV))
+STD_GPLD_AMODES(loadruh,"Rd32=memuh","Load unsigned Half integer",ATTRIBS(A_LOAD,A_ARCHV2),"1",fLOAD(1,2,u,EA,RdV))
+STD_GPLD_AMODES(loadrh, "Rd32=memh", "Load signed Half integer",ATTRIBS(A_LOAD,A_ARCHV2),"1",fLOAD(1,2,s,EA,RdV))
+STD_GPLD_AMODES(loadri, "Rd32=memw", "Load Word",ATTRIBS(A_LOAD,A_ARCHV2),"2",fLOAD(1,4,u,EA,RdV))
+STD_GPLD_AMODES(loadrd, "Rdd32=memd","Load Double integer",ATTRIBS(A_LOAD,A_ARCHV2),"3",fLOAD(1,8,u,EA,RddV))
+
+
+#define STD_GPST_AMODES(TAG,DEST,OPER,DESCR,ATTRIB,SHFT,SEMANTICS)\
+Q6INSN(S2_##TAG##gp, OPER"(gp+#u16:"SHFT")="DEST, ATTRIB,DESCR,{fIMMEXT(uiV); fEA_GPI(uiV); SEMANTICS; })
+
+/* The set of 32-bit store instructions */
+STD_GPST_AMODES(storerb, "Rt32", "memb","Store Byte",ATTRIBS(A_STORE,A_ARCHV2),"0",fSTORE(1,1,EA,fGETBYTE(0,RtV)))
+STD_GPST_AMODES(storerh, "Rt32", "memh","Store Half integer",ATTRIBS(A_STORE,A_ARCHV2),"1",fSTORE(1,2,EA,fGETHALF(0,RtV)))
+STD_GPST_AMODES(storerf, "Rt.H32", "memh","Store Upper Half integer",ATTRIBS(A_STORE,A_ARCHV2),"1",fSTORE(1,2,EA,fGETHALF(1,RtV)))
+STD_GPST_AMODES(storeri, "Rt32", "memw","Store Word",ATTRIBS(A_STORE,A_ARCHV2),"2",fSTORE(1,4,EA,RtV))
+STD_GPST_AMODES(storerd, "Rtt32","memd","Store Double integer",ATTRIBS(A_STORE,A_ARCHV2),"3",fSTORE(1,8,EA,RttV))
+STD_GPST_AMODES(storerinew, "Nt8.new", "memw","Store Word",ATTRIBS(A_STORE,A_ARCHV2),"2",fSTORE(1,4,EA,fNEWREG_ST(NtN)))
+STD_GPST_AMODES(storerbnew, "Nt8.new", "memb","Store Byte",ATTRIBS(A_STORE,A_ARCHV2),"0",fSTORE(1,1,EA,fGETBYTE(0,fNEWREG_ST(NtN))))
+STD_GPST_AMODES(storerhnew, "Nt8.new", "memh","Store Half integer",ATTRIBS(A_STORE,A_ARCHV2),"1",fSTORE(1,2,EA,fGETHALF(0,fNEWREG_ST(NtN))))
diff --git a/target/hexagon/imported/macros.def b/target/hexagon/imported/macros.def
new file mode 100755
index 0000000000..65292c7afa
--- /dev/null
+++ b/target/hexagon/imported/macros.def
@@ -0,0 +1,1531 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+DEF_MACRO(
+    LIKELY,    /* NAME */
+    __builtin_expect((X),1), /* BEH */
+    ()    /* attribs */
+)
+
+DEF_MACRO(
+    UNLIKELY,    /* NAME */
+    __builtin_expect((X),0), /* BEH */
+    ()    /* attribs */
+)
+
+DEF_MACRO(
+    CANCEL, /* macro name */
+    {if (thread->last_pkt) thread->last_pkt->slot_cancelled |= (1<<insn->slot); return;} , /* behavior */
+    (A_CONDEXEC)
+)
+
+DEF_MACRO(
+    LOAD_CANCEL, /* macro name */
+    {mem_general_load_cancelled(thread,EA,insn);CANCEL;} , /* behavior */
+    (A_CONDEXEC)
+)
+
+DEF_MACRO(
+    STORE_CANCEL, /* macro name */
+    {mem_general_store_cancelled(thread,EA,insn);CANCEL;} , /* behavior */
+    (A_CONDEXEC)
+)
+
+DEF_MACRO(
+    fMAX, /* macro name */
+    (((A) > (B)) ? (A) : (B)), /* behavior */
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fMIN, /* macro name */
+    (((A) < (B)) ? (A) : (B)), /* behavior */
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fABS, /* macro name */
+    (((A)<0)?(-(A)):(A)), /* behavior */
+    /* optional attributes */
+)
+
+
+/* Bit insert */
+DEF_MACRO(
+    fINSERT_BITS,
+        {
+            REG = ((REG) & ~(((fCONSTLL(1)<<(WIDTH))-1)<<(OFFSET))) | (((INVAL) & ((fCONSTLL(1)<<(WIDTH))-1)) << (OFFSET));
+        },
+    /* attribs */
+)
+
+/* Bit extract */
+DEF_MACRO(
+    fEXTRACTU_BITS,
+    (fZXTN(WIDTH,32,(INREG >> OFFSET))),
+    /* attribs */
+)
+
+DEF_MACRO(
+    fEXTRACTU_BIDIR,
+    (fZXTN(WIDTH,32,fBIDIR_LSHIFTR((INREG),(OFFSET),4_8))),
+    /* attribs */
+)
+
+DEF_MACRO(
+    fEXTRACTU_RANGE,
+    (fZXTN((HIBIT-LOWBIT+1),32,(INREG >> LOWBIT))),
+    /* attribs */
+)
+
+DEF_MACRO(
+    f8BITSOF,
+    ( (VAL) ? 0xff : 0x00),
+    /* attribs */
+)
+
+DEF_MACRO(
+    fLSBOLD,
+    ((VAL) & 1),
+    ()
+)
+
+DEF_MACRO(
+    fLSBNEW,
+    predlog_read(thread,PNUM),
+    ()
+)
+
+DEF_MACRO(
+    fLSBNEW0,
+    predlog_read(thread,0),
+    ()
+)
+
+DEF_MACRO(
+    fLSBNEW1,
+    predlog_read(thread,1),
+    ()
+)
+
+DEF_MACRO(
+    fLSBOLDNOT,
+    (!fLSBOLD(VAL)),
+    ()
+)
+
+DEF_MACRO(
+    fLSBNEWNOT,
+    (!fLSBNEW(PNUM)),
+    ()
+)
+
+DEF_MACRO(
+    fLSBNEW0NOT,
+    (!fLSBNEW0),
+    ()
+)
+
+DEF_MACRO(
+    fLSBNEW1NOT,
+    (!fLSBNEW1),
+    ()
+)
+
+DEF_MACRO(
+    fNEWREG,
+    ({if (newvalue_missing(thread,RNUM) ||
+      IS_CANCELLED(insn->new_value_producer_slot)) CANCEL; reglog_read(thread,RNUM);}),
+    (A_DOTNEWVALUE,A_RESTRICT_SLOT0ONLY)
+)
+// Store new with a missing newvalue or cancelled goes out as a zero byte store in V65
+// take advantage of the fact that reglog_read returns zero for not valid rnum
+DEF_MACRO(
+    fNEWREG_ST,
+    ({if (newvalue_missing(thread,RNUM) ||
+      IS_CANCELLED(insn->new_value_producer_slot)) { STORE_ZERO; RNUM = -1; }; reglog_read(thread,RNUM);}),
+    (A_DOTNEWVALUE,A_RESTRICT_SLOT0ONLY)
+)
+
+DEF_MACRO(
+    fSATUVALN,
+    ({fSET_OVERFLOW(); ((VAL) < 0) ? 0 : ((1LL<<(N))-1);}),
+    ()
+)
+
+DEF_MACRO(
+    fSATVALN,
+    ({fSET_OVERFLOW(); ((VAL) < 0) ? (-(1LL<<((N)-1))) : ((1LL<<((N)-1))-1);}),
+    ()
+)
+
+DEF_MACRO(
+    fZXTN, /* macro name */
+    ((VAL) & ((1LL<<(N))-1)),
+    /* attribs */
+)
+
+DEF_MACRO(
+    fSXTN, /* macro name */
+    ((fZXTN(N,M,VAL) ^ (1LL<<((N)-1))) - (1LL<<((N)-1))),
+    /* attribs */
+)
+
+DEF_MACRO(
+    fSATN,
+    ((fSXTN(N,64,VAL) == (VAL)) ? (VAL) : fSATVALN(N,VAL)),
+    ()
+)
+
+DEF_MACRO(
+    fADDSAT64,
+    {
+        size8u_t __a = fCAST8u(A);
+        size8u_t __b = fCAST8u(B);
+        size8u_t __sum = __a + __b;
+        size8u_t __xor = __a ^ __b;
+        const size8u_t __mask = 0x8000000000000000ULL;
+        if (__xor & __mask) {
+            /* Opposite signs, OK */
+            DST = __sum;
+        } else if ((__a ^ __sum) & __mask) {
+            /* Signs mismatch */
+            if (__sum & __mask) {
+                /* overflowed to negative, make max pos */
+                DST=0x7FFFFFFFFFFFFFFFLL; fSET_OVERFLOW();
+            } else {
+                /* overflowed to positive, make max neg */
+                DST=0x8000000000000000LL; fSET_OVERFLOW();
+            }
+        } else {
+            /* signs did not mismatch, OK */
+            DST = __sum;
+        }
+    },
+    ()
+)
+
+DEF_MACRO(
+    fSATUN,
+    ((fZXTN(N,64,VAL) == (VAL)) ? (VAL) : fSATUVALN(N,VAL)),
+    ()
+)
+
+DEF_MACRO(
+    fSATH,
+    (fSATN(16,VAL)),
+    ()
+)
+
+
+DEF_MACRO(
+    fSATUH,
+    (fSATUN(16,VAL)),
+    ()
+)
+
+DEF_MACRO(
+    fSATUB,
+    (fSATUN(8,VAL)),
+    ()
+)
+DEF_MACRO(
+    fSATB,
+    (fSATN(8,VAL)),
+    ()
+)
+
+
+/*************************************/
+/* immediate extension               */
+/*************************************/
+
+DEF_MACRO(
+    fIMMEXT,
+    (IMM = IMM),
+    (A_EXTENDABLE)
+)
+
+DEF_MACRO(
+    fMUST_IMMEXT,
+    fIMMEXT(IMM),
+    (A_EXTENDABLE)
+)
+
+DEF_MACRO(
+    fPCALIGN,
+    IMM=(IMM & ~PCALIGN_MASK),
+    (A_EXTENDABLE)
+)
+
+/*************************************/
+/* Read and Write Implicit Regs      */
+/*************************************/
+
+DEF_MACRO(
+    fREAD_LR, /* read link register */
+    (READ_RREG(REG_LR)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fWRITE_LR, /* write lr */
+    WRITE_RREG(REG_LR,A),          /* behavior */
+    (A_IMPLICIT_WRITES_LR)
+)
+
+DEF_MACRO(
+    fWRITE_FP, /* write sp */
+    WRITE_RREG(REG_FP,A),          /* behavior */
+    (A_IMPLICIT_WRITES_FP)
+)
+
+DEF_MACRO(
+    fWRITE_SP, /* write sp */
+    WRITE_RREG(REG_SP,A),          /* behavior */
+    (A_IMPLICIT_WRITES_SP)
+)
+
+DEF_MACRO(
+    fREAD_SP, /* read stack pointer */
+    (READ_RREG(REG_SP)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fREAD_LC0, /* read loop count */
+    (READ_RREG(REG_LC0)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fREAD_LC1, /* read loop count */
+    (READ_RREG(REG_LC1)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fREAD_SA0, /* read start addr */
+    (READ_RREG(REG_SA0)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fREAD_SA1, /* read start addr */
+    (READ_RREG(REG_SA1)),          /* behavior */
+    ()
+)
+
+
+DEF_MACRO(
+    fREAD_FP, /* read frame pointer */
+    (READ_RREG(REG_FP)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fREAD_GP, /* read global pointer */
+    (insn->extension_valid ? 0 : READ_RREG(REG_GP)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fREAD_PC, /* read PC */
+    (READ_RREG(REG_PC)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fREAD_NPC, /* read next PC */
+    (thread->next_PC & (0xfffffffe)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fREAD_P0, /* read Predicate 0 */
+    (READ_PREG(0)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fREAD_P3, /* read Predicate 3 */
+    (READ_PREG(3)),          /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fCHECK_PCALIGN,
+    if (((A) & PCALIGN_MASK)) {
+        register_error_exception(thread,PRECISE_CAUSE_PC_NOT_ALIGNED,thread->Regs[REG_BADVA0],thread->Regs[REG_BADVA1],GET_SSR_FIELD(SSR_BVS),GET_SSR_FIELD(SSR_V0),GET_SSR_FIELD(SSR_V1),0);
+    },
+    ()
+)
+
+DEF_MACRO(
+    fWRITE_NPC, /* write next PC */
+    if (!thread->branch_taken) {
+        if (A != thread->next_PC) {
+            thread->next_pkt_guess=thread->last_pkt->taken_ptr;
+        }
+        fCHECK_PCALIGN(A);
+        thread->branched = 1; thread->branch_taken = 1; thread->next_PC = A; \
+        thread->branch_offset = insn->encoding_offset; thread->branch_opcode = insn->opcode;
+    },          /* behavior */
+    (A_COF)
+)
+
+DEF_MACRO(
+    fBRANCH,
+    fWRITE_NPC(LOC); fCOF_CALLBACK(LOC,TYPE),
+    ()
+)
+
+DEF_MACRO(
+    fJUMPR,    /* A jumpr has executed */
+    {fBRANCH(TARGET,COF_TYPE_JUMPR);},
+    (A_INDIRECT)
+)
+
+DEF_MACRO(
+    fHINTJR,    /* A hintjr instruction has executed */
+    { },
+)
+
+DEF_MACRO(
+    fCALL,    /* Do a call */
+    if (!thread->branch_taken) {fBP_RAS_CALL(A); fWRITE_LR(fREAD_NPC()); fBRANCH(A,COF_TYPE_CALL);},
+    (A_COF,A_IMPLICIT_WRITES_LR,A_CALL)
+)
+
+DEF_MACRO(
+    fCALLR,    /* Do a call Register */
+    if (!thread->branch_taken) {fBP_RAS_CALL(A); fWRITE_LR(fREAD_NPC()); fBRANCH(A,COF_TYPE_CALLR);},
+    (A_COF,A_IMPLICIT_WRITES_LR,A_CALL)
+)
+
+DEF_MACRO(
+    fWRITE_LOOP_REGS0, /* write ln,sa,ea,lc */
+    {WRITE_RREG(REG_LC0,COUNT);
+     WRITE_RREG(REG_SA0,START);},
+    (A_IMPLICIT_WRITES_LC0,A_IMPLICIT_WRITES_SA0)
+)
+
+DEF_MACRO(
+    fWRITE_LOOP_REGS1, /* write ln,sa,ea,lc */
+    {WRITE_RREG(REG_LC1,COUNT);
+     WRITE_RREG(REG_SA1,START);},
+    (A_IMPLICIT_WRITES_LC1,A_IMPLICIT_WRITES_SA1)
+)
+
+DEF_MACRO(
+    fWRITE_LC0,
+    WRITE_RREG(REG_LC0,VAL),
+    (A_IMPLICIT_WRITES_LC0)
+)
+
+DEF_MACRO(
+    fWRITE_LC1,
+    WRITE_RREG(REG_LC1,VAL),
+    (A_IMPLICIT_WRITES_LC1)
+)
+
+DEF_MACRO(
+    fCARRY_FROM_ADD,
+    carry_from_add64(A,B,C),
+    /* NOTHING */
+)
+
+DEF_MACRO(
+    fSET_OVERFLOW,
+    SET_USR_FIELD(USR_OVF,1),
+    ()
+)
+
+DEF_MACRO(
+    fSET_LPCFG,
+    SET_USR_FIELD(USR_LPCFG,(VAL)),
+    ()
+)
+
+
+DEF_MACRO(
+    fGET_LPCFG,
+    (GET_USR_FIELD(USR_LPCFG)),
+    ()
+)
+
+
+
+DEF_MACRO(
+    fWRITE_P0, /* write Predicate 0 */
+    WRITE_PREG(0,VAL),          /* behavior */
+    (A_IMPLICIT_WRITES_P0)
+)
+
+DEF_MACRO(
+    fWRITE_P1, /* write Predicate 0 */
+    WRITE_PREG(1,VAL),          /* behavior */
+    (A_IMPLICIT_WRITES_P1)
+)
+
+DEF_MACRO(
+    fWRITE_P2, /* write Predicate 0 */
+    WRITE_PREG(2,VAL),          /* behavior */
+    (A_IMPLICIT_WRITES_P2)
+)
+
+DEF_MACRO(
+    fWRITE_P3, /* write Predicate 0 */
+    WRITE_PREG(3,VAL),     /* behavior */
+    (A_IMPLICIT_WRITES_P3)
+)
+
+DEF_MACRO(
+    fPART1, /* write Predicate 0 */
+    if (insn->part1) { WORK; return; },          /* behavior */
+    /* optional attributes */
+)
+
+
+/*************************************/
+/* Casting, Sign-Zero extension, etc */
+/*************************************/
+
+DEF_MACRO(
+    fCAST4u, /* macro name */
+    ((size4u_t)(A)),          /* behavior */
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCAST4s, /* macro name */
+    ((size4s_t)(A)),          /* behavior */
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCAST8u, /* macro name */
+    ((size8u_t)(A)),          /* behavior */
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCAST8s, /* macro name */
+    ((size8s_t)(A)),          /* behavior */
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCAST4_4s, /* macro name */
+    ((size4s_t)(A)),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCAST4_4u, /* macro name */
+    ((size4u_t)(A)),
+    /* optional attributes */
+)
+
+
+DEF_MACRO(
+    fCAST4_8s, /* macro name */
+    ((size8s_t)((size4s_t)(A))),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCAST4_8u, /* macro name */
+    ((size8u_t)((size4u_t)(A))),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCAST8_8s, /* macro name */
+    ((size8s_t)(A)),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCAST8_8u, /* macro name */
+    ((size8u_t)(A)),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCAST2_8s, /* macro name */
+    ((size8s_t)((size2s_t)(A))),
+    /* optional attributes */
+)
+DEF_MACRO(
+    fCAST2_8u, /* macro name */
+    ((size8u_t)((size2u_t)(A))),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fZE8_16, /* zero-extend 8 to 16 */
+    ((size2s_t)((size1u_t)(A))),
+    /* optional attributes */
+)
+DEF_MACRO(
+    fSE8_16, /* sign-extend 8 to 16 */
+    ((size2s_t)((size1s_t)(A))),
+    /* optional attributes */
+)
+
+
+DEF_MACRO(
+    fSE16_32, /* sign-extend 16 to 32 */
+    ((size4s_t)((size2s_t)(A))),          /* behavior */
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fZE16_32, /* zero-extend 16 to 32 */
+    ((size4u_t)((size2u_t)(A))),          /* behavior */
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fSE32_64,
+    ( (size8s_t)((size4s_t)(A)) ),          /* behavior */
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fZE32_64,
+    ( (size8u_t)((size4u_t)(A)) ),          /* behavior */
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fSE8_32, /* sign-extend 8 to 32 */
+    ((size4s_t)((size1s_t)(A))),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fZE8_32, /* zero-extend 8 to 32 */
+    ((size4s_t)((size1u_t)(A))),
+    /* optional attributes */
+)
+
+/*************************************/
+/* DSP arithmetic support            */
+/************************************/
+DEF_MACRO(
+    fMPY8UU, /* multiply half integer */
+    (int)(fZE8_16(A)*fZE8_16(B)),     /* behavior */
+    ()
+)
+DEF_MACRO(
+    fMPY8US, /* multiply half integer */
+    (int)(fZE8_16(A)*fSE8_16(B)),     /* behavior */
+    ()
+)
+DEF_MACRO(
+    fMPY8SU, /* multiply half integer */
+    (int)(fSE8_16(A)*fZE8_16(B)),     /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fMPY8SS, /* multiply half integer */
+    (int)((short)(A)*(short)(B)),     /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fMPY16SS, /* multiply half integer */
+    fSE32_64(fSE16_32(A)*fSE16_32(B)),     /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fMPY16UU, /* multiply unsigned half integer */
+    fZE32_64(fZE16_32(A)*fZE16_32(B)),     /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fMPY16SU, /* multiply half integer */
+    fSE32_64(fSE16_32(A)*fZE16_32(B)),     /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fMPY16US, /* multiply half integer */
+    fMPY16SU(B,A),
+    ()
+)
+
+DEF_MACRO(
+    fMPY32SS, /* multiply half integer */
+    (fSE32_64(A)*fSE32_64(B)),     /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fMPY32UU, /* multiply half integer */
+    (fZE32_64(A)*fZE32_64(B)),     /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fMPY32SU, /* multiply half integer */
+    (fSE32_64(A)*fZE32_64(B)),     /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fMPY3216SS, /* multiply mixed precision */
+    (fSE32_64(A)*fSXTN(16,64,B)),     /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fMPY3216SU, /* multiply mixed precision */
+    (fSE32_64(A)*fZXTN(16,64,B)),     /* behavior */
+    ()
+)
+
+DEF_MACRO(
+    fROUND, /* optional rounding */
+    (A+0x8000),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCLIP, /* optional rounding */
+    { size4s_t maxv = (1<<U)-1;
+      size4s_t minv = -(1<<U);
+      DST = fMIN(maxv,fMAX(SRC,minv));
+    },
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCRND, /* optional rounding */
+    ((((A)&0x3)==0x3)?((A)+1):((A))),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fRNDN, /* Rounding to a boundary */
+    ((((N)==0)?(A):(((fSE32_64(A))+(1<<((N)-1)))))),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCRNDN, /* Rounding to a boundary */
+    (conv_round(A,N)),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fADD128, /* Rounding to a boundary */
+    (add128(A, B)),
+    /* optional attributes */
+)
+DEF_MACRO(
+    fSUB128, /* Rounding to a boundary */
+    (sub128(A, B)),
+    /* optional attributes */
+)
+DEF_MACRO(
+    fSHIFTR128, /* Rounding to a boundary */
+    (shiftr128(A, B)),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fSHIFTL128, /* Rounding to a boundary */
+    (shiftl128(A, B)),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fAND128, /* Rounding to a boundary */
+    (and128(A, B)),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fCAST8S_16S, /* Rounding to a boundary */
+    (cast8s_to_16s(A)),
+    /* optional attributes */
+)
+DEF_MACRO(
+    fCAST16S_8S, /* Rounding to a boundary */
+    (cast16s_to_8s(A)),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fEA_RI, /* Calculate EA with Register + Immediate Offset */
+    do { EA=REG+IMM; fDOCHKPAGECROSS(REG,EA); } while (0),
+    ()
+)
+
+DEF_MACRO(
+    fEA_RRs, /* Calculate EA with Register + Registers scaled Offset */
+    do { EA=REG+(REG2<<SCALE); fDOCHKPAGECROSS(REG,EA); } while (0),
+    ()
+)
+
+DEF_MACRO(
+    fEA_IRs, /* Calculate EA with Immediate + Registers scaled Offset */
+    do { EA=IMM+(REG<<SCALE); fDOCHKPAGECROSS(IMM,EA); } while (0),
+    ()
+)
+
+DEF_MACRO(
+    fEA_IMM, /* Calculate EA with Immediate */
+    EA=IMM,
+    ()
+)
+
+DEF_MACRO(
+    fEA_REG, /* Calculate EA with REGISTER */
+    EA=REG,
+    ()
+)
+
+DEF_MACRO(
+    fEA_GPI, /* Calculate EA with Global Poitner + Immediate */
+    do { EA=fREAD_GP()+IMM; fGP_DOCHKPAGECROSS(fREAD_GP(),EA); } while (0),
+    ()
+)
+
+DEF_MACRO(
+    fPM_I, /* Post Modify Register by Immediate*/
+    do { REG = REG + IMM; } while (0),
+    ()
+)
+
+DEF_MACRO(
+    fPM_M, /* Post Modify Register by M register */
+    do { REG = REG + MVAL; } while (0),
+    ()
+)
+
+DEF_MACRO(
+    fSCALE, /* scale by N */
+    (((size8s_t)(A))<<N),
+    /* optional attributes */
+)
+
+DEF_MACRO(
+    fSATW, /* saturating to 32-bits*/
+    fSATN(32,((long long)A)),
+    ()
+)
+
+DEF_MACRO(
+    fSAT, /* saturating to 32-bits*/
+    fSATN(32,(A)),
+    ()
+)
+
+DEF_MACRO(
+    fSAT_ORIG_SHL, /* Saturating to 32-bits, with original value, for shift left */
+    ((((size4s_t)((fSAT(A)) ^ ((size4s_t)(ORIG_REG)))) < 0) ?
+        fSATVALN(32,((size4s_t)(ORIG_REG))) :
+        ((((ORIG_REG) > 0) && ((A) == 0)) ?
+            fSATVALN(32,(ORIG_REG)) :
+            fSAT(A))),
+    ()
+)
+
+DEF_MACRO(
+    fPASS,
+    A,
+)
+
+DEF_MACRO(
+    fRND, /* saturating to 32-bits*/
+    (((A)+1)>>1),
+)
+
+
+DEF_MACRO(
+    fBIDIR_SHIFTL,
+    (((SHAMT) < 0) ? ((fCAST##REGSTYPE(SRC) >> ((-(SHAMT))-1)) >>1) : (fCAST##REGSTYPE(SRC) << (SHAMT))),
+    ()
+)
+
+DEF_MACRO(
+    fBIDIR_ASHIFTL,
+    fBIDIR_SHIFTL(SRC,SHAMT,REGSTYPE##s),
+    ()
+)
+
+DEF_MACRO(
+    fBIDIR_LSHIFTL,
+    fBIDIR_SHIFTL(SRC,SHAMT,REGSTYPE##u),
+    ()
+)
+
+DEF_MACRO(
+    fBIDIR_ASHIFTL_SAT,
+    (((SHAMT) < 0) ? ((fCAST##REGSTYPE##s(SRC) >> ((-(SHAMT))-1)) >>1) : fSAT_ORIG_SHL(fCAST##REGSTYPE##s(SRC) << (SHAMT),(SRC))),
+    ()
+)
+
+
+DEF_MACRO(
+    fBIDIR_SHIFTR,
+    (((SHAMT) < 0) ? ((fCAST##REGSTYPE(SRC) << ((-(SHAMT))-1)) << 1) : (fCAST##REGSTYPE(SRC) >> (SHAMT))),
+    ()
+)
+
+DEF_MACRO(
+    fBIDIR_ASHIFTR,
+    fBIDIR_SHIFTR(SRC,SHAMT,REGSTYPE##s),
+    ()
+)
+
+DEF_MACRO(
+    fBIDIR_LSHIFTR,
+    fBIDIR_SHIFTR(SRC,SHAMT,REGSTYPE##u),
+    ()
+)
+
+DEF_MACRO(
+    fBIDIR_ASHIFTR_SAT,
+    (((SHAMT) < 0) ? fSAT_ORIG_SHL((fCAST##REGSTYPE##s(SRC) << ((-(SHAMT))-1)) << 1,(SRC)) : (fCAST##REGSTYPE##s(SRC) >> (SHAMT))),
+    ()
+)
+
+DEF_MACRO(
+    fASHIFTR,
+    (fCAST##REGSTYPE##s(SRC) >> (SHAMT)),
+    /* */
+)
+
+DEF_MACRO(
+    fLSHIFTR,
+    (((SHAMT) >= 64)?0:(fCAST##REGSTYPE##u(SRC) >> (SHAMT))),
+    /* */
+)
+
+DEF_MACRO(
+    fROTL,
+    (((SHAMT)==0) ? (SRC) : ((fCAST##REGSTYPE##u(SRC) << (SHAMT)) | \
+        ((fCAST##REGSTYPE##u(SRC) >> ((sizeof(SRC)*8)-(SHAMT)))))),
+    /* */
+)
+
+DEF_MACRO(
+    fROTR,
+    (((SHAMT)==0) ? (SRC) : ((fCAST##REGSTYPE##u(SRC) >> (SHAMT)) | \
+        ((fCAST##REGSTYPE##u(SRC) << ((sizeof(SRC)*8)-(SHAMT)))))),
+    /* */
+)
+
+DEF_MACRO(
+    fASHIFTL,
+    (((SHAMT) >= 64)?0:(fCAST##REGSTYPE##s(SRC) << (SHAMT))),
+    /* */
+)
+
+/*************************************/
+/* Floating-Point Support            */
+/************************************/
+
+DEF_MACRO(
+    fFLOAT, /* name */
+    ({ union { float f; size4u_t i; } _fipun; _fipun.i = (A); _fipun.f; }),     /* behavior */
+    (A_FPOP)
+)
+
+DEF_MACRO(
+    fUNFLOAT, /* multiply half integer */
+    ({ union { float f; size4u_t i; } _fipun; _fipun.f = (A); isnan(_fipun.f) ? 0xFFFFFFFFU : _fipun.i; }),     /* behavior */
+    (A_FPOP)
+)
+
+DEF_MACRO(
+    fSFNANVAL,
+    0xffffffff,
+    ()
+)
+
+DEF_MACRO(
+    fSFINFVAL,
+    (((A) & 0x80000000) | 0x7f800000),
+    ()
+)
+
+DEF_MACRO(
+    fSFONEVAL,
+    (((A) & 0x80000000) | fUNFLOAT(1.0)),
+    ()
+)
+
+DEF_MACRO(
+    fCHECKSFNAN,
+    do {
+        if (isnan(fFLOAT(A))) {
+            if ((fGETBIT(22,A)) == 0) fRAISEFLAGS(FE_INVALID);
+            DST = fSFNANVAL();
+        }
+    } while (0),
+    ()
+)
+
+DEF_MACRO(
+    fCHECKSFNAN3,
+    do {
+        fCHECKSFNAN(DST,A);
+        fCHECKSFNAN(DST,B);
+        fCHECKSFNAN(DST,C);
+    } while (0),
+    ()
+)
+
+DEF_MACRO(
+    fSF_BIAS,
+    127,
+    ()
+)
+
+DEF_MACRO(
+    fSF_MANTBITS,
+    23,
+    ()
+)
+
+DEF_MACRO(
+    fSF_MUL_POW2,
+    (fUNFLOAT(fFLOAT(A) * fFLOAT((fSF_BIAS() + (B)) << fSF_MANTBITS()))),
+    ()
+)
+
+DEF_MACRO(
+    fSF_GETEXP,
+    (((A) >> fSF_MANTBITS()) & 0xff),
+    ()
+)
+
+DEF_MACRO(
+    fSF_MAXEXP,
+    (254),
+    ()
+)
+
+DEF_MACRO(
+    fSF_RECIP_COMMON,
+    arch_sf_recip_common(&N,&D,&O,&A),
+    (A_FPOP)
+)
+
+DEF_MACRO(
+    fSF_INVSQRT_COMMON,
+    arch_sf_invsqrt_common(&N,&O,&A),
+    (A_FPOP)
+)
+
+DEF_MACRO(
+    fFMAFX,
+    internal_fmafx(A,B,C,fSXTN(8,64,ADJ)),
+    ()
+)
+
+DEF_MACRO(
+    fFMAF,
+    internal_fmafx(A,B,C,0),
+    ()
+)
+
+DEF_MACRO(
+    fSFMPY,
+    internal_mpyf(A,B),
+    ()
+)
+
+DEF_MACRO(
+    fMAKESF,
+    ((((SIGN) & 1) << 31) | (((EXP) & 0xff) << fSF_MANTBITS()) |
+        ((MANT) & ((1<<fSF_MANTBITS())-1))),
+    ()
+)
+
+
+DEF_MACRO(
+    fDOUBLE, /* multiply half integer */
+    ({ union { double f; size8u_t i; } _fipun; _fipun.i = (A); _fipun.f; }),     /* behavior */
+    (A_FPOP)
+)
+
+DEF_MACRO(
+    fUNDOUBLE, /* multiply half integer */
+    ({ union { double f; size8u_t i; } _fipun; _fipun.f = (A); isnan(_fipun.f) ? 0xFFFFFFFFFFFFFFFFULL : _fipun.i; }),     /* behavior */
+    (A_FPOP)
+)
+
+DEF_MACRO(
+    fDFNANVAL,
+    0xffffffffffffffffULL,
+    ()
+)
+
+DEF_MACRO(
+    fDF_ISNORMAL,
+    (fpclassify(fDOUBLE(X)) == FP_NORMAL),
+    ()
+)
+
+DEF_MACRO(
+    fDF_ISDENORM,
+    (fpclassify(fDOUBLE(X)) == FP_SUBNORMAL),
+    ()
+)
+
+DEF_MACRO(
+    fDF_ISBIG,
+    (fDF_GETEXP(X) >= 512),
+    ()
+)
+
+DEF_MACRO(
+    fDF_MANTBITS,
+    52,
+    ()
+)
+
+DEF_MACRO(
+    fDF_GETEXP,
+    (((A) >> fDF_MANTBITS()) & 0x7ff),
+    ()
+)
+
+DEF_MACRO(
+    fFMA,
+    internal_fma(A,B,C),
+    /* nothing */
+)
+
+DEF_MACRO(
+    fDF_MPY_HH,
+    internal_mpyhh(A,B,ACC),
+    /* nothing */
+)
+
+DEF_MACRO(
+    fFPOP_START,
+    arch_fpop_start(thread),
+    /* nothing */
+)
+
+DEF_MACRO(
+    fFPOP_END,
+    arch_fpop_end(thread),
+    /* nothing */
+)
+
+DEF_MACRO(
+    fFPSETROUND_NEAREST,
+    fesetround(FE_TONEAREST),
+    /* nothing */
+)
+
+DEF_MACRO(
+    fFPSETROUND_CHOP,
+    fesetround(FE_TOWARDZERO),
+    /* nothing */
+)
+
+DEF_MACRO(
+    fFPCANCELFLAGS,
+    feclearexcept(FE_ALL_EXCEPT),
+    /* nothing */
+)
+
+DEF_MACRO(
+    fISINFPROD,
+    ((isinf(A) && isinf(B)) ||
+     (isinf(A) && isfinite(B) && ((B) != 0.0)) ||
+     (isinf(B) && isfinite(A) && ((A) != 0.0))),
+    /* nothing */
+)
+
+DEF_MACRO(
+    fISZEROPROD,
+    ((((A) == 0.0) && isfinite(B)) || (((B) == 0.0) && isfinite(A))),
+    /* nothing */
+)
+
+DEF_MACRO(
+    fRAISEFLAGS,
+    arch_raise_fpflag(A),
+    /* NOTHING */
+)
+
+DEF_MACRO(
+    fDF_MAX,
+    (((A)==(B))
+    ? fDOUBLE(fUNDOUBLE(A) & fUNDOUBLE(B))
+    : fmax(A,B)),
+    (A_FPOP)
+)
+
+DEF_MACRO(
+    fDF_MIN,
+    (((A)==(B))
+    ? fDOUBLE(fUNDOUBLE(A) | fUNDOUBLE(B))
+    : fmin(A,B)),
+    (A_FPOP)
+)
+
+DEF_MACRO(
+    fSF_MAX,
+    (((A)==(B))
+    ? fFLOAT(fUNFLOAT(A) & fUNFLOAT(B))
+    : fmaxf(A,B)),
+    (A_FPOP)
+)
+
+DEF_MACRO(
+    fSF_MIN,
+    (((A)==(B))
+    ? fFLOAT(fUNFLOAT(A) | fUNFLOAT(B))
+    : fminf(A,B)),
+    (A_FPOP)
+)
+
+/*************************************/
+/* Load/Store support                */
+/*************************************/
+
+DEF_MACRO(fLOAD,
+    { DST = (size##SIZE##SIGN##_t)MEM_LOAD##SIZE(thread,EA,insn); },
+    (A_LOAD,A_MEMLIKE)
+)
+
+DEF_MACRO(fMEMOP,
+    { memop##SIZE##_##FNTYPE(thread,EA,VALUE); },
+    (A_LOAD,A_STORE,A_MEMLIKE)
+)
+
+DEF_MACRO(fGET_FRAMEKEY,
+    READ_RREG(REG_FRAMEKEY),
+    ()
+)
+
+DEF_MACRO(fFRAME_SCRAMBLE,
+    ((VAL) ^ (fCAST8u(fGET_FRAMEKEY()) << 32)),
+    /* ATTRIBS */
+)
+
+DEF_MACRO(fFRAME_UNSCRAMBLE,
+    fFRAME_SCRAMBLE(VAL),
+    /* ATTRIBS */
+)
+
+DEF_MACRO(fFRAMECHECK,
+    sys_check_framelimit(thread,ADDR,EA),
+    ()
+)
+
+DEF_MACRO(fLOAD_LOCKED,
+    {     DST = (size##SIZE##SIGN##_t)mem_load_locked(thread,EA,SIZE,insn); },
+    (A_LOAD,A_MEMLIKE)
+)
+
+DEF_MACRO(fSTORE,
+    { MEM_STORE##SIZE(thread,EA,SRC,insn); },
+    (A_STORE,A_MEMLIKE)
+)
+
+
+DEF_MACRO(fSTORE_LOCKED,
+    { PRED = (mem_store_conditional(thread,EA,SRC,SIZE,insn) ? 0xff : 0); },
+    (A_STORE,A_MEMLIKE)
+)
+
+/*************************************/
+/* Functions to help with bytes      */
+/*************************************/
+
+DEF_MACRO(fGETBYTE,
+    ((size1s_t)((SRC>>((N)*8))&0xff)),
+    /* nothing */
+)
+
+DEF_MACRO(fGETUBYTE,
+    ((size1u_t)((SRC>>((N)*8))&0xff)),
+    /* nothing */
+)
+
+DEF_MACRO(fSETBYTE,
+    {
+        DST = (DST & ~(0x0ffLL<<((N)*8))) | (((size8u_t)((VAL) & 0x0ffLL)) << ((N)*8));
+    },
+    /* nothing */
+)
+
+DEF_MACRO(fGETHALF,
+    ((size2s_t)((SRC>>((N)*16))&0xffff)),
+    /* nothing */
+)
+
+DEF_MACRO(fGETUHALF,
+    ((size2u_t)((SRC>>((N)*16))&0xffff)),
+    /* nothing */
+)
+
+DEF_MACRO(fSETHALF,
+    {
+        DST = (DST & ~(0x0ffffLL<<((N)*16))) | (((size8u_t)((VAL) & 0x0ffff)) << ((N)*16));
+    },
+    /* nothing */
+)
+
+
+
+DEF_MACRO(fGETWORD,
+    ((size8s_t)((size4s_t)((SRC>>((N)*32))&0x0ffffffffLL))),
+    /* nothing */
+)
+
+DEF_MACRO(fGETUWORD,
+    ((size8u_t)((size4u_t)((SRC>>((N)*32))&0x0ffffffffLL))),
+    /* nothing */
+)
+
+DEF_MACRO(fSETWORD,
+    {
+        DST = (DST & ~(0x0ffffffffLL<<((N)*32))) | (((VAL) & 0x0ffffffffLL) << ((N)*32));
+    },
+    /* nothing */
+)
+
+DEF_MACRO(fSETBIT,
+    {
+        DST = (DST & ~(1ULL<<(N))) | (((size8u_t)(VAL))<<(N));
+    },
+    /* nothing */
+)
+
+DEF_MACRO(fGETBIT,
+    (((SRC)>>N)&1),
+    /* nothing */
+)
+
+
+DEF_MACRO(fSETBITS,
+    do {
+        int j;
+        for (j=LO;j<=HI;j++) {
+          fSETBIT(j,DST,VAL);
+        }
+    } while (0),
+    /* nothing */
+)
+
+/*************************************/
+/* Used for parity, etc........      */
+/*************************************/
+DEF_MACRO(fCOUNTONES_4,
+    count_ones_4(VAL),
+    /* nothing */
+)
+
+DEF_MACRO(fCOUNTONES_8,
+    count_ones_8(VAL),
+    /* nothing */
+)
+
+DEF_MACRO(fBREV_8,
+    reverse_bits_8(VAL),
+    /* nothing */
+)
+
+DEF_MACRO(fBREV_4,
+    reverse_bits_4(VAL),
+    /* nothing */
+)
+
+DEF_MACRO(fCL1_8,
+    count_leading_ones_8(VAL),
+    /* nothing */
+)
+
+DEF_MACRO(fCL1_4,
+    count_leading_ones_4(VAL),
+    /* nothing */
+)
+
+DEF_MACRO(fINTERLEAVE,
+    interleave(ODD,EVEN),
+    /* nothing */
+)
+
+DEF_MACRO(fDEINTERLEAVE,
+    deinterleave(MIXED),
+    /* nothing */
+)
+
+DEF_MACRO(fHIDE,
+    A,
+    ()
+)
+
+DEF_MACRO(fCONSTLL,
+    A##LL,
+)
+
+/* Do the things in the parens, but don't print the parens. */
+DEF_MACRO(fECHO,
+    (A),
+    /* nothing */
+)
+
+
+/********************************************/
+/* OS interface and stop/wait               */
+/********************************************/
+
+DEF_MACRO(fPAUSE,
+    {sys_pause(thread, insn->slot, IMM);},
+    ()
+)
+
+DEF_MACRO(fTRAP,
+    warn("Trap NPC=%x ",fREAD_NPC());
+    warn("Trap exception, PCYCLE=%lld TYPE=%d NPC=%x IMM=0x%x",thread->processor_ptr->pstats[pcycles],TRAPTYPE,fREAD_NPC(),IMM);
+    register_trap_exception(thread,fREAD_NPC(),TRAPTYPE,IMM);,
+    ()
+)
+
+DEF_MACRO(fALIGN_REG_FIELD_VALUE,
+    ((VAL)<<reg_field_info[FIELD].offset),
+    /* */
+)
+
+DEF_MACRO(fGET_REG_FIELD_MASK,
+    (((1<<reg_field_info[FIELD].width)-1)<<reg_field_info[FIELD].offset),
+    /* */
+)
+
+DEF_MACRO(fREAD_REG_FIELD,
+    fEXTRACTU_BITS(thread->Regs[REG_##REG],
+        reg_field_info[FIELD].width,
+        reg_field_info[FIELD].offset),
+    /* ATTRIBS */
+)
+
+DEF_MACRO(fGET_FIELD,
+    fEXTRACTU_BITS(VAL,
+        reg_field_info[FIELD].width,
+        reg_field_info[FIELD].offset),
+    /* ATTRIBS */
+)
+
+DEF_MACRO(fSET_FIELD,
+    fINSERT_BITS(VAL,
+        reg_field_info[FIELD].width,
+        reg_field_info[FIELD].offset,
+        (NEWVAL)),
+    /* ATTRIBS */
+)
+
+/********************************************/
+/* Cache Management                         */
+/********************************************/
+
+DEF_MACRO(fBARRIER,
+    {
+        sys_barrier(thread, insn->slot);
+    },
+    ()
+)
+
+DEF_MACRO(fSYNCH,
+    {
+        sys_sync(thread, insn->slot);
+    },
+    ()
+)
+
+DEF_MACRO(fISYNC,
+    {
+        sys_isync(thread, insn->slot);
+    },
+    ()
+)
+
+
+DEF_MACRO(fDCFETCH,
+    sys_dcfetch(thread, (REG), insn->slot),
+    (A_MEMLIKE)
+)
+
+DEF_MACRO(fICINVA,
+    {
+        arch_internal_flush(thread->processor_ptr, 0, 0xffffffff);
+        sys_icinva(thread, (REG),insn->slot);
+    },
+    (A_ICINVA)
+)
+
+DEF_MACRO(fL2FETCH,
+    sys_l2fetch(thread, ADDR,HEIGHT,WIDTH,STRIDE,FLAGS, insn->slot),
+    (A_MEMLIKE,A_L2FETCH)
+)
+
+DEF_MACRO(fDCCLEANA,
+    sys_dccleana(thread, (REG)),
+    (A_MEMLIKE)
+)
+
+DEF_MACRO(fDCCLEANINVA,
+    sys_dccleaninva(thread, (REG), insn->slot),
+    (A_MEMLIKE,A_DCCLEANINVA)
+)
+
+DEF_MACRO(fDCZEROA,
+    sys_dczeroa(thread, (REG)),
+    (A_MEMLIKE)
+)
+
+DEF_MACRO(fCHECKFORPRIV,
+    {sys_check_privs(thread); if (EXCEPTION_DETECTED) return; },
+    ()
+)
+
+DEF_MACRO(fCHECKFORGUEST,
+    {sys_check_guest(thread); if (EXCEPTION_DETECTED) return; },
+    ()
+)
+
+DEF_MACRO(fBRANCH_SPECULATE_STALL,
+    {
+        sys_speculate_branch_stall(thread, insn->slot, JUMP_COND(JUMP_PRED_SET),
+            SPEC_DIR,
+            DOTNEWVAL,
+            HINTBITNUM,
+            STRBITNUM,
+            0,
+            thread->last_pkt->pkt_has_dual_jump,
+            insn->is_2nd_jump,
+            (thread->fetch_access.vaddr + insn->encoding_offset*4));
+    },
+    ()
+)
diff --git a/target/hexagon/imported/mpy.idef b/target/hexagon/imported/mpy.idef
new file mode 100644
index 0000000000..8744f6596c
--- /dev/null
+++ b/target/hexagon/imported/mpy.idef
@@ -0,0 +1,1208 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Multiply Instructions
+ */
+
+
+#define STD_SP_MODES(TAG,OPER,ATR,DST,ACCSEM,SEM,OSEM,SATSEM,RNDSEM)\
+Q6INSN(M2_##TAG##_hh_s0, OPER"(Rs.H32,Rt.H32)"OSEM,        ATR,"",{DST=SATSEM(RNDSEM(ACCSEM SEM(         fGETHALF(1,RsV),fGETHALF(1,RtV))));})\
+Q6INSN(M2_##TAG##_hh_s1, OPER"(Rs.H32,Rt.H32):<<1"OSEM,    ATR,"",{DST=SATSEM(RNDSEM(ACCSEM fSCALE(1,SEM(fGETHALF(1,RsV),fGETHALF(1,RtV)))));})\
+Q6INSN(M2_##TAG##_hl_s0, OPER"(Rs.H32,Rt.L32)"OSEM,        ATR,"",{DST=SATSEM(RNDSEM(ACCSEM SEM(         fGETHALF(1,RsV),fGETHALF(0,RtV))));})\
+Q6INSN(M2_##TAG##_hl_s1, OPER"(Rs.H32,Rt.L32):<<1"OSEM,    ATR,"",{DST=SATSEM(RNDSEM(ACCSEM fSCALE(1,SEM(fGETHALF(1,RsV),fGETHALF(0,RtV)))));})\
+Q6INSN(M2_##TAG##_lh_s0, OPER"(Rs.L32,Rt.H32)"OSEM,        ATR,"",{DST=SATSEM(RNDSEM(ACCSEM SEM(         fGETHALF(0,RsV),fGETHALF(1,RtV))));})\
+Q6INSN(M2_##TAG##_lh_s1, OPER"(Rs.L32,Rt.H32):<<1"OSEM,    ATR,"",{DST=SATSEM(RNDSEM(ACCSEM fSCALE(1,SEM(fGETHALF(0,RsV),fGETHALF(1,RtV)))));})\
+Q6INSN(M2_##TAG##_ll_s0, OPER"(Rs.L32,Rt.L32)"OSEM,        ATR,"",{DST=SATSEM(RNDSEM(ACCSEM SEM(         fGETHALF(0,RsV),fGETHALF(0,RtV))));})\
+Q6INSN(M2_##TAG##_ll_s1, OPER"(Rs.L32,Rt.L32):<<1"OSEM,    ATR,"",{DST=SATSEM(RNDSEM(ACCSEM fSCALE(1,SEM(fGETHALF(0,RsV),fGETHALF(0,RtV)))));})
+
+/*****************************************************/
+/* multiply 16x16->32 signed instructions            */
+/*****************************************************/
+STD_SP_MODES(mpy_acc,    "Rx32+=mpy", ,RxV,RxV+    ,fMPY16SS,          ,fPASS,fPASS)
+STD_SP_MODES(mpy_nac,    "Rx32-=mpy", ,RxV,RxV-    ,fMPY16SS,          ,fPASS,fPASS)
+STD_SP_MODES(mpy_acc_sat,"Rx32+=mpy", ,RxV,RxV+    ,fMPY16SS,":sat"    ,fSAT, fPASS)
+STD_SP_MODES(mpy_nac_sat,"Rx32-=mpy", ,RxV,RxV-    ,fMPY16SS,":sat"    ,fSAT, fPASS)
+STD_SP_MODES(mpy,        "Rd32=mpy",  ,RdV,        ,fMPY16SS,          ,fPASS,fPASS)
+STD_SP_MODES(mpy_sat,    "Rd32=mpy",  ,RdV,        ,fMPY16SS,":sat"    ,fSAT, fPASS)
+STD_SP_MODES(mpy_rnd,    "Rd32=mpy",  ,RdV,        ,fMPY16SS,":rnd"    ,fPASS,fROUND)
+STD_SP_MODES(mpy_sat_rnd,"Rd32=mpy",  ,RdV,        ,fMPY16SS,":rnd:sat",fSAT, fROUND)
+STD_SP_MODES(mpyd_acc,   "Rxx32+=mpy",,RxxV,RxxV+  ,fMPY16SS,          ,fPASS,fPASS)
+STD_SP_MODES(mpyd_nac,   "Rxx32-=mpy",,RxxV,RxxV-  ,fMPY16SS,          ,fPASS,fPASS)
+STD_SP_MODES(mpyd,       "Rdd32=mpy", ,RddV,       ,fMPY16SS,          ,fPASS,fPASS)
+STD_SP_MODES(mpyd_rnd,   "Rdd32=mpy", ,RddV,       ,fMPY16SS,":rnd"    ,fPASS,fROUND)
+
+
+/*****************************************************/
+/* multiply 16x16->32 unsigned instructions          */
+/*****************************************************/
+#define STD_USP_MODES(TAG,OPER,ATR,DST,ACCSEM,SEM,OSEM,SATSEM,RNDSEM)\
+Q6INSN(M2_##TAG##_hh_s0, OPER"(Rs.H32,Rt.H32)"OSEM,        ATR,"",{DST=SATSEM(RNDSEM(ACCSEM SEM(         fGETUHALF(1,RsV),fGETUHALF(1,RtV))));})\
+Q6INSN(M2_##TAG##_hh_s1, OPER"(Rs.H32,Rt.H32):<<1"OSEM,    ATR,"",{DST=SATSEM(RNDSEM(ACCSEM fSCALE(1,SEM(fGETUHALF(1,RsV),fGETUHALF(1,RtV)))));})\
+Q6INSN(M2_##TAG##_hl_s0, OPER"(Rs.H32,Rt.L32)"OSEM,        ATR,"",{DST=SATSEM(RNDSEM(ACCSEM SEM(         fGETUHALF(1,RsV),fGETUHALF(0,RtV))));})\
+Q6INSN(M2_##TAG##_hl_s1, OPER"(Rs.H32,Rt.L32):<<1"OSEM,    ATR,"",{DST=SATSEM(RNDSEM(ACCSEM fSCALE(1,SEM(fGETUHALF(1,RsV),fGETUHALF(0,RtV)))));})\
+Q6INSN(M2_##TAG##_lh_s0, OPER"(Rs.L32,Rt.H32)"OSEM,        ATR,"",{DST=SATSEM(RNDSEM(ACCSEM SEM(         fGETUHALF(0,RsV),fGETUHALF(1,RtV))));})\
+Q6INSN(M2_##TAG##_lh_s1, OPER"(Rs.L32,Rt.H32):<<1"OSEM,    ATR,"",{DST=SATSEM(RNDSEM(ACCSEM fSCALE(1,SEM(fGETUHALF(0,RsV),fGETUHALF(1,RtV)))));})\
+Q6INSN(M2_##TAG##_ll_s0, OPER"(Rs.L32,Rt.L32)"OSEM,        ATR,"",{DST=SATSEM(RNDSEM(ACCSEM SEM(         fGETUHALF(0,RsV),fGETUHALF(0,RtV))));})\
+Q6INSN(M2_##TAG##_ll_s1, OPER"(Rs.L32,Rt.L32):<<1"OSEM,    ATR,"",{DST=SATSEM(RNDSEM(ACCSEM fSCALE(1,SEM(fGETUHALF(0,RsV),fGETUHALF(0,RtV)))));})
+
+STD_USP_MODES(mpyu_acc,    "Rx32+=mpyu", ,RxV,RxV+  ,fMPY16UU,          ,fPASS,fPASS)
+STD_USP_MODES(mpyu_nac,    "Rx32-=mpyu", ,RxV,RxV-  ,fMPY16UU,          ,fPASS,fPASS)
+STD_USP_MODES(mpyu,        "Rd32=mpyu",  ATTRIBS() ,RdV,  ,fMPY16UU, ,fPASS,fPASS)
+STD_USP_MODES(mpyud_acc,   "Rxx32+=mpyu",,RxxV,RxxV+,fMPY16UU,          ,fPASS,fPASS)
+STD_USP_MODES(mpyud_nac,   "Rxx32-=mpyu",,RxxV,RxxV-,fMPY16UU,          ,fPASS,fPASS)
+STD_USP_MODES(mpyud,       "Rdd32=mpyu", ATTRIBS() ,RddV, ,fMPY16UU, ,fPASS,fPASS)
+
+/**********************************************/
+/* mpy 16x#s8->32                             */
+/**********************************************/
+
+Q6INSN(M2_mpysip,"Rd32=+mpyi(Rs32,#u8)",ATTRIBS(A_ARCHV2),
+"32-bit Multiply by unsigned immediate",
+{ fIMMEXT(uiV); RdV=RsV*uiV; })
+
+Q6INSN(M2_mpysin,"Rd32=-mpyi(Rs32,#u8)",ATTRIBS(A_ARCHV2),
+"32-bit Multiply by unsigned immediate, negate result",
+{ RdV=RsV*-uiV; })
+
+Q6INSN(M2_macsip,"Rx32+=mpyi(Rs32,#u8)",ATTRIBS(A_ARCHV2),
+"32-bit Multiply-Add by unsigned immediate",
+{ fIMMEXT(uiV); RxV=RxV + (RsV*uiV);})
+
+Q6INSN(M2_macsin,"Rx32-=mpyi(Rs32,#u8)",ATTRIBS(A_ARCHV2),
+"32-bit Multiply-Subtract by unsigned immediate",
+{ fIMMEXT(uiV); RxV=RxV - (RsV*uiV);})
+
+
+/**********************************************/
+/* multiply/mac  32x32->64 instructions       */
+/**********************************************/
+Q6INSN(M2_dpmpyss_s0,    "Rdd32=mpy(Rs32,Rt32)", ATTRIBS(),"Multiply 32x32",{RddV=fMPY32SS(RsV,RtV);})
+Q6INSN(M2_dpmpyss_acc_s0,"Rxx32+=mpy(Rs32,Rt32)",ATTRIBS(),"Multiply 32x32",{RxxV= RxxV + fMPY32SS(RsV,RtV);})
+Q6INSN(M2_dpmpyss_nac_s0,"Rxx32-=mpy(Rs32,Rt32)",ATTRIBS(),"Multiply 32x32",{RxxV= RxxV - fMPY32SS(RsV,RtV);})
+
+Q6INSN(M2_dpmpyuu_s0,    "Rdd32=mpyu(Rs32,Rt32)", ATTRIBS(),"Multiply 32x32",{RddV=fMPY32UU(fCAST4u(RsV),fCAST4u(RtV));})
+Q6INSN(M2_dpmpyuu_acc_s0,"Rxx32+=mpyu(Rs32,Rt32)",ATTRIBS(),"Multiply 32x32",{RxxV= RxxV + fMPY32UU(fCAST4u(RsV),fCAST4u(RtV));})
+Q6INSN(M2_dpmpyuu_nac_s0,"Rxx32-=mpyu(Rs32,Rt32)",ATTRIBS(),"Multiply 32x32",{RxxV= RxxV - fMPY32UU(fCAST4u(RsV),fCAST4u(RtV));})
+
+
+/******************************************************/
+/* multiply/mac  32x32->32 (upper) instructions       */
+/******************************************************/
+Q6INSN(M2_mpy_up,        "Rd32=mpy(Rs32,Rt32)", ATTRIBS(),"Multiply 32x32",{RdV=fMPY32SS(RsV,RtV)>>32;})
+Q6INSN(M2_mpy_up_s1,     "Rd32=mpy(Rs32,Rt32):<<1", ATTRIBS(),"Multiply 32x32",{RdV=fMPY32SS(RsV,RtV)>>31;})
+Q6INSN(M2_mpy_up_s1_sat, "Rd32=mpy(Rs32,Rt32):<<1:sat", ATTRIBS(),"Multiply 32x32",{RdV=fSAT(fMPY32SS(RsV,RtV)>>31);})
+Q6INSN(M2_mpyu_up,       "Rd32=mpyu(Rs32,Rt32)", ATTRIBS(),"Multiply 32x32",{RdV=fMPY32UU(fCAST4u(RsV),fCAST4u(RtV))>>32;})
+Q6INSN(M2_mpysu_up,      "Rd32=mpysu(Rs32,Rt32)", ATTRIBS(),"Multiply 32x32",{RdV=fMPY32SU(RsV,fCAST4u(RtV))>>32;})
+Q6INSN(M2_dpmpyss_rnd_s0,"Rd32=mpy(Rs32,Rt32):rnd", ATTRIBS(),"Multiply 32x32",{RdV=(fMPY32SS(RsV,RtV)+fCONSTLL(0x80000000))>>32;})
+
+Q6INSN(M4_mac_up_s1_sat, "Rx32+=mpy(Rs32,Rt32):<<1:sat", ATTRIBS(),"Multiply 32x32",{RxV=fSAT(  (fSE32_64(RxV)) + (fMPY32SS(RsV,RtV)>>31));})
+Q6INSN(M4_nac_up_s1_sat, "Rx32-=mpy(Rs32,Rt32):<<1:sat", ATTRIBS(),"Multiply 32x32",{RxV=fSAT(  (fSE32_64(RxV)) - (fMPY32SS(RsV,RtV)>>31));})
+
+
+/**********************************************/
+/* 32x32->32 multiply (lower)                 */
+/**********************************************/
+
+Q6INSN(M2_mpyi,"Rd32=mpyi(Rs32,Rt32)",ATTRIBS(),
+"Multiply Integer",
+{ RdV=RsV*RtV;})
+
+Q6INSN(M2_maci,"Rx32+=mpyi(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Multiply-Accumulate Integer",
+{ RxV=RxV + RsV*RtV;})
+
+Q6INSN(M2_mnaci,"Rx32-=mpyi(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Multiply-Neg-Accumulate Integer",
+{ RxV=RxV - RsV*RtV;})
+
+/****** WHY ARE THESE IN MPY.IDEF? **********/
+
+Q6INSN(M2_acci,"Rx32+=add(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Add with accumulate",
+{ RxV=RxV + RsV + RtV;})
+
+Q6INSN(M2_accii,"Rx32+=add(Rs32,#s8)",ATTRIBS(A_ARCHV2),
+"Add with accumulate",
+{ fIMMEXT(siV); RxV=RxV + RsV + siV;})
+
+Q6INSN(M2_nacci,"Rx32-=add(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
+"Add with neg accumulate",
+{ RxV=RxV - (RsV + RtV);})
+
+Q6INSN(M2_naccii,"Rx32-=add(Rs32,#s8)",ATTRIBS(A_ARCHV2),
+"Add with neg accumulate",
+{ fIMMEXT(siV); RxV=RxV - (RsV + siV);})
+
+Q6INSN(M2_subacc,"Rx32+=sub(Rt32,Rs32)",ATTRIBS(A_ARCHV2),
+"Sub with accumulate",
+{ RxV=RxV + RtV - RsV;})
+
+
+
+
+Q6INSN(M4_mpyrr_addr,"Ry32=add(Ru32,mpyi(Ry32,Rs32))",ATTRIBS(),
+"Mpy by immed and add immed",
+{ RyV = RuV + RsV*RyV;})
+
+Q6INSN(M4_mpyri_addr_u2,"Rd32=add(Ru32,mpyi(#u6:2,Rs32))",ATTRIBS(),
+"Mpy by immed and add immed",
+{ RdV = RuV + RsV*uiV;})
+
+Q6INSN(M4_mpyri_addr,"Rd32=add(Ru32,mpyi(Rs32,#u6))",ATTRIBS(),
+"Mpy by immed and add immed",
+{ fIMMEXT(uiV); RdV = RuV + RsV*uiV;})
+
+
+
+Q6INSN(M4_mpyri_addi,"Rd32=add(#u6,mpyi(Rs32,#U6))",ATTRIBS(),
+"Mpy by immed and add immed",
+{ fIMMEXT(uiV); RdV = uiV + RsV*UiV;})
+
+
+
+Q6INSN(M4_mpyrr_addi,"Rd32=add(#u6,mpyi(Rs32,Rt32))",ATTRIBS(),
+"Mpy by immed and add immed",
+{ fIMMEXT(uiV); RdV = uiV + RsV*RtV;})
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+/**********************************************/
+/* vector mac  2x[16x16 -> 32]                */
+/**********************************************/
+
+#undef vmac_sema
+#define vmac_sema(N)\
+{ fSETWORD(0,RddV,fSAT(fSCALE(N,fMPY16SS(fGETHALF(0,RsV),fGETHALF(0,RtV)))));\
+  fSETWORD(1,RddV,fSAT(fSCALE(N,fMPY16SS(fGETHALF(1,RsV),fGETHALF(1,RtV)))));\
+}
+Q6INSN(M2_vmpy2s_s0,"Rdd32=vmpyh(Rs32,Rt32):sat",ATTRIBS(),"Vector Multiply",vmac_sema(0))
+Q6INSN(M2_vmpy2s_s1,"Rdd32=vmpyh(Rs32,Rt32):<<1:sat",ATTRIBS(),"Vector Multiply",vmac_sema(1))
+
+
+#undef vmac_sema
+#define vmac_sema(N)\
+{ fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + fSCALE(N,fMPY16SS(fGETHALF(0,RsV),fGETHALF(0,RtV)))));\
+  fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + fSCALE(N,fMPY16SS(fGETHALF(1,RsV),fGETHALF(1,RtV)))));\
+}
+Q6INSN(M2_vmac2s_s0,"Rxx32+=vmpyh(Rs32,Rt32):sat",ATTRIBS(),"Vector Multiply",vmac_sema(0))
+Q6INSN(M2_vmac2s_s1,"Rxx32+=vmpyh(Rs32,Rt32):<<1:sat",ATTRIBS(),"Vector Multiply",vmac_sema(1))
+
+#undef vmac_sema
+#define vmac_sema(N)\
+{ fSETWORD(0,RddV,fSAT(fSCALE(N,fMPY16SU(fGETHALF(0,RsV),fGETUHALF(0,RtV)))));\
+  fSETWORD(1,RddV,fSAT(fSCALE(N,fMPY16SU(fGETHALF(1,RsV),fGETUHALF(1,RtV)))));\
+}
+Q6INSN(M2_vmpy2su_s0,"Rdd32=vmpyhsu(Rs32,Rt32):sat",ATTRIBS(),"Vector Multiply",vmac_sema(0))
+Q6INSN(M2_vmpy2su_s1,"Rdd32=vmpyhsu(Rs32,Rt32):<<1:sat",ATTRIBS(),"Vector Multiply",vmac_sema(1))
+
+
+#undef vmac_sema
+#define vmac_sema(N)\
+{ fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + fSCALE(N,fMPY16SU(fGETHALF(0,RsV),fGETUHALF(0,RtV)))));\
+  fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + fSCALE(N,fMPY16SU(fGETHALF(1,RsV),fGETUHALF(1,RtV)))));\
+}
+Q6INSN(M2_vmac2su_s0,"Rxx32+=vmpyhsu(Rs32,Rt32):sat",ATTRIBS(),"Vector Multiply",vmac_sema(0))
+Q6INSN(M2_vmac2su_s1,"Rxx32+=vmpyhsu(Rs32,Rt32):<<1:sat",ATTRIBS(),"Vector Multiply",vmac_sema(1))
+
+
+
+#undef vmac_sema
+#define vmac_sema(N)\
+{ fSETHALF(1,RdV,fGETHALF(1,(fSAT(fSCALE(N,fMPY16SS(fGETHALF(1,RsV),fGETHALF(1,RtV))) + 0x8000))));\
+  fSETHALF(0,RdV,fGETHALF(1,(fSAT(fSCALE(N,fMPY16SS(fGETHALF(0,RsV),fGETHALF(0,RtV))) + 0x8000))));\
+}
+Q6INSN(M2_vmpy2s_s0pack,"Rd32=vmpyh(Rs32,Rt32):rnd:sat",ATTRIBS(A_ARCHV2),"Vector Multiply",vmac_sema(0))
+Q6INSN(M2_vmpy2s_s1pack,"Rd32=vmpyh(Rs32,Rt32):<<1:rnd:sat",ATTRIBS(A_ARCHV2),"Vector Multiply",vmac_sema(1))
+
+
+#undef vmac_sema
+#define vmac_sema(N)\
+{ fSETWORD(0,RxxV,fGETWORD(0,RxxV) + fMPY16SS(fGETHALF(0,RsV),fGETHALF(0,RtV)));\
+  fSETWORD(1,RxxV,fGETWORD(1,RxxV) + fMPY16SS(fGETHALF(1,RsV),fGETHALF(1,RtV)));\
+}
+Q6INSN(M2_vmac2,"Rxx32+=vmpyh(Rs32,Rt32)",ATTRIBS(A_ARCHV2),"Vector Multiply",vmac_sema(0))
+
+#undef vmac_sema
+#define vmac_sema(N)\
+{ fSETWORD(0,RddV,fSAT(fSCALE(N,fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV)))));\
+  fSETWORD(1,RddV,fSAT(fSCALE(N,fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV)))));\
+}
+Q6INSN(M2_vmpy2es_s0,"Rdd32=vmpyeh(Rss32,Rtt32):sat",ATTRIBS(),"Vector Multiply",vmac_sema(0))
+Q6INSN(M2_vmpy2es_s1,"Rdd32=vmpyeh(Rss32,Rtt32):<<1:sat",ATTRIBS(),"Vector Multiply",vmac_sema(1))
+
+#undef vmac_sema
+#define vmac_sema(N)\
+{ fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + fSCALE(N,fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV)))));\
+  fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + fSCALE(N,fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV)))));\
+}
+Q6INSN(M2_vmac2es_s0,"Rxx32+=vmpyeh(Rss32,Rtt32):sat",ATTRIBS(),"Vector Multiply",vmac_sema(0))
+Q6INSN(M2_vmac2es_s1,"Rxx32+=vmpyeh(Rss32,Rtt32):<<1:sat",ATTRIBS(),"Vector Multiply",vmac_sema(1))
+
+#undef vmac_sema
+#define vmac_sema(N)\
+{ fSETWORD(0,RxxV,fGETWORD(0,RxxV) + fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV)));\
+  fSETWORD(1,RxxV,fGETWORD(1,RxxV) + fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV)));\
+}
+Q6INSN(M2_vmac2es,"Rxx32+=vmpyeh(Rss32,Rtt32)",ATTRIBS(A_ARCHV2),"Vector Multiply",vmac_sema(0))
+
+
+
+
+/********************************************************/
+/* vrmpyh, aka Big Mac, aka Mac Daddy, aka Mac-ac-ac-ac */
+/* vector mac  4x[16x16] + 64 ->64                      */
+/********************************************************/
+
+
+#undef vmac_sema
+#define vmac_sema(N)\
+{ RxxV = RxxV + fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV))\
+              + fMPY16SS(fGETHALF(1,RssV),fGETHALF(1,RttV))\
+              + fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV))\
+              + fMPY16SS(fGETHALF(3,RssV),fGETHALF(3,RttV));\
+}
+Q6INSN(M2_vrmac_s0,"Rxx32+=vrmpyh(Rss32,Rtt32)",ATTRIBS(),"Vector Multiply",vmac_sema(0))
+
+#undef vmac_sema
+#define vmac_sema(N)\
+{ RddV = fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV))\
+       + fMPY16SS(fGETHALF(1,RssV),fGETHALF(1,RttV))\
+       + fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV))\
+       + fMPY16SS(fGETHALF(3,RssV),fGETHALF(3,RttV));\
+}
+Q6INSN(M2_vrmpy_s0,"Rdd32=vrmpyh(Rss32,Rtt32)",ATTRIBS(),"Vector Multiply",vmac_sema(0))
+
+
+
+/******************************************************/
+/* vector dual macs. just like complex                */
+/******************************************************/
+
+
+/* With round&pack */
+#undef dmpy_sema
+#define dmpy_sema(N)\
+{ fSETHALF(0,RdV,fGETHALF(1,(fSAT(fSCALE(N,fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV))) + \
+                                  fSCALE(N,fMPY16SS(fGETHALF(1,RssV),fGETHALF(1,RttV))) + 0x8000))));\
+  fSETHALF(1,RdV,fGETHALF(1,(fSAT(fSCALE(N,fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV))) + \
+                                  fSCALE(N,fMPY16SS(fGETHALF(3,RssV),fGETHALF(3,RttV))) + 0x8000))));\
+}
+Q6INSN(M2_vdmpyrs_s0,"Rd32=vdmpy(Rss32,Rtt32):rnd:sat",ATTRIBS(),    "vector dual mac w/ round&pack",dmpy_sema(0))
+Q6INSN(M2_vdmpyrs_s1,"Rd32=vdmpy(Rss32,Rtt32):<<1:rnd:sat",ATTRIBS(),"vector dual mac w/ round&pack",dmpy_sema(1))
+
+
+
+
+
+/******************************************************/
+/* vector byte multiplies                             */
+/******************************************************/
+
+
+Q6INSN(M5_vrmpybuu,"Rdd32=vrmpybu(Rss32,Rtt32)",ATTRIBS(),
+ "vector dual mpy bytes",
+{
+  fSETWORD(0,RddV,(fMPY16SS(fGETUBYTE(0,RssV),fGETUBYTE(0,RttV)) +
+                   fMPY16SS(fGETUBYTE(1,RssV),fGETUBYTE(1,RttV)) +
+                   fMPY16SS(fGETUBYTE(2,RssV),fGETUBYTE(2,RttV)) +
+                   fMPY16SS(fGETUBYTE(3,RssV),fGETUBYTE(3,RttV))));
+  fSETWORD(1,RddV,(fMPY16SS(fGETUBYTE(4,RssV),fGETUBYTE(4,RttV)) +
+                   fMPY16SS(fGETUBYTE(5,RssV),fGETUBYTE(5,RttV)) +
+                   fMPY16SS(fGETUBYTE(6,RssV),fGETUBYTE(6,RttV)) +
+                   fMPY16SS(fGETUBYTE(7,RssV),fGETUBYTE(7,RttV))));
+ })
+
+Q6INSN(M5_vrmacbuu,"Rxx32+=vrmpybu(Rss32,Rtt32)",ATTRIBS(),
+ "vector dual mac bytes",
+{
+  fSETWORD(0,RxxV,(fGETWORD(0,RxxV) +
+                   fMPY16SS(fGETUBYTE(0,RssV),fGETUBYTE(0,RttV)) +
+                   fMPY16SS(fGETUBYTE(1,RssV),fGETUBYTE(1,RttV)) +
+                   fMPY16SS(fGETUBYTE(2,RssV),fGETUBYTE(2,RttV)) +
+                   fMPY16SS(fGETUBYTE(3,RssV),fGETUBYTE(3,RttV))));
+  fSETWORD(1,RxxV,(fGETWORD(1,RxxV) +
+                   fMPY16SS(fGETUBYTE(4,RssV),fGETUBYTE(4,RttV)) +
+                   fMPY16SS(fGETUBYTE(5,RssV),fGETUBYTE(5,RttV)) +
+                   fMPY16SS(fGETUBYTE(6,RssV),fGETUBYTE(6,RttV)) +
+                   fMPY16SS(fGETUBYTE(7,RssV),fGETUBYTE(7,RttV))));
+ })
+
+
+Q6INSN(M5_vrmpybsu,"Rdd32=vrmpybsu(Rss32,Rtt32)",ATTRIBS(),
+ "vector dual mpy bytes",
+{
+  fSETWORD(0,RddV,(fMPY16SS(fGETBYTE(0,RssV),fGETUBYTE(0,RttV)) +
+                   fMPY16SS(fGETBYTE(1,RssV),fGETUBYTE(1,RttV)) +
+                   fMPY16SS(fGETBYTE(2,RssV),fGETUBYTE(2,RttV)) +
+                   fMPY16SS(fGETBYTE(3,RssV),fGETUBYTE(3,RttV))));
+  fSETWORD(1,RddV,(fMPY16SS(fGETBYTE(4,RssV),fGETUBYTE(4,RttV)) +
+                   fMPY16SS(fGETBYTE(5,RssV),fGETUBYTE(5,RttV)) +
+                   fMPY16SS(fGETBYTE(6,RssV),fGETUBYTE(6,RttV)) +
+                   fMPY16SS(fGETBYTE(7,RssV),fGETUBYTE(7,RttV))));
+ })
+
+Q6INSN(M5_vrmacbsu,"Rxx32+=vrmpybsu(Rss32,Rtt32)",ATTRIBS(),
+ "vector dual mac bytes",
+{
+  fSETWORD(0,RxxV,(fGETWORD(0,RxxV) +
+                   fMPY16SS(fGETBYTE(0,RssV),fGETUBYTE(0,RttV)) +
+                   fMPY16SS(fGETBYTE(1,RssV),fGETUBYTE(1,RttV)) +
+                   fMPY16SS(fGETBYTE(2,RssV),fGETUBYTE(2,RttV)) +
+                   fMPY16SS(fGETBYTE(3,RssV),fGETUBYTE(3,RttV))));
+  fSETWORD(1,RxxV,(fGETWORD(1,RxxV) +
+                   fMPY16SS(fGETBYTE(4,RssV),fGETUBYTE(4,RttV)) +
+                   fMPY16SS(fGETBYTE(5,RssV),fGETUBYTE(5,RttV)) +
+                   fMPY16SS(fGETBYTE(6,RssV),fGETUBYTE(6,RttV)) +
+                   fMPY16SS(fGETBYTE(7,RssV),fGETUBYTE(7,RttV))));
+ })
+
+
+Q6INSN(M5_vmpybuu,"Rdd32=vmpybu(Rs32,Rt32)",ATTRIBS(),
+ "vector mpy bytes",
+{
+  fSETHALF(0,RddV,(fMPY16SS(fGETUBYTE(0,RsV),fGETUBYTE(0,RtV))));
+  fSETHALF(1,RddV,(fMPY16SS(fGETUBYTE(1,RsV),fGETUBYTE(1,RtV))));
+  fSETHALF(2,RddV,(fMPY16SS(fGETUBYTE(2,RsV),fGETUBYTE(2,RtV))));
+  fSETHALF(3,RddV,(fMPY16SS(fGETUBYTE(3,RsV),fGETUBYTE(3,RtV))));
+ })
+
+Q6INSN(M5_vmpybsu,"Rdd32=vmpybsu(Rs32,Rt32)",ATTRIBS(),
+ "vector mpy bytes",
+{
+  fSETHALF(0,RddV,(fMPY16SS(fGETBYTE(0,RsV),fGETUBYTE(0,RtV))));
+  fSETHALF(1,RddV,(fMPY16SS(fGETBYTE(1,RsV),fGETUBYTE(1,RtV))));
+  fSETHALF(2,RddV,(fMPY16SS(fGETBYTE(2,RsV),fGETUBYTE(2,RtV))));
+  fSETHALF(3,RddV,(fMPY16SS(fGETBYTE(3,RsV),fGETUBYTE(3,RtV))));
+ })
+
+
+Q6INSN(M5_vmacbuu,"Rxx32+=vmpybu(Rs32,Rt32)",ATTRIBS(),
+ "vector mac bytes",
+{
+  fSETHALF(0,RxxV,(fGETHALF(0,RxxV)+fMPY16SS(fGETUBYTE(0,RsV),fGETUBYTE(0,RtV))));
+  fSETHALF(1,RxxV,(fGETHALF(1,RxxV)+fMPY16SS(fGETUBYTE(1,RsV),fGETUBYTE(1,RtV))));
+  fSETHALF(2,RxxV,(fGETHALF(2,RxxV)+fMPY16SS(fGETUBYTE(2,RsV),fGETUBYTE(2,RtV))));
+  fSETHALF(3,RxxV,(fGETHALF(3,RxxV)+fMPY16SS(fGETUBYTE(3,RsV),fGETUBYTE(3,RtV))));
+ })
+
+Q6INSN(M5_vmacbsu,"Rxx32+=vmpybsu(Rs32,Rt32)",ATTRIBS(),
+ "vector mac bytes",
+{
+  fSETHALF(0,RxxV,(fGETHALF(0,RxxV)+fMPY16SS(fGETBYTE(0,RsV),fGETUBYTE(0,RtV))));
+  fSETHALF(1,RxxV,(fGETHALF(1,RxxV)+fMPY16SS(fGETBYTE(1,RsV),fGETUBYTE(1,RtV))));
+  fSETHALF(2,RxxV,(fGETHALF(2,RxxV)+fMPY16SS(fGETBYTE(2,RsV),fGETUBYTE(2,RtV))));
+  fSETHALF(3,RxxV,(fGETHALF(3,RxxV)+fMPY16SS(fGETBYTE(3,RsV),fGETUBYTE(3,RtV))));
+ })
+
+
+
+Q6INSN(M5_vdmpybsu,"Rdd32=vdmpybsu(Rss32,Rtt32):sat",ATTRIBS(),
+ "vector quad mpy bytes",
+{
+  fSETHALF(0,RddV,fSATN(16,(fMPY16SS(fGETBYTE(0,RssV),fGETUBYTE(0,RttV)) +
+                            fMPY16SS(fGETBYTE(1,RssV),fGETUBYTE(1,RttV)))));
+  fSETHALF(1,RddV,fSATN(16,(fMPY16SS(fGETBYTE(2,RssV),fGETUBYTE(2,RttV)) +
+                            fMPY16SS(fGETBYTE(3,RssV),fGETUBYTE(3,RttV)))));
+  fSETHALF(2,RddV,fSATN(16,(fMPY16SS(fGETBYTE(4,RssV),fGETUBYTE(4,RttV)) +
+                            fMPY16SS(fGETBYTE(5,RssV),fGETUBYTE(5,RttV)))));
+  fSETHALF(3,RddV,fSATN(16,(fMPY16SS(fGETBYTE(6,RssV),fGETUBYTE(6,RttV)) +
+                            fMPY16SS(fGETBYTE(7,RssV),fGETUBYTE(7,RttV)))));
+ })
+
+
+Q6INSN(M5_vdmacbsu,"Rxx32+=vdmpybsu(Rss32,Rtt32):sat",ATTRIBS(),
+ "vector quad mac bytes",
+{
+  fSETHALF(0,RxxV,fSATN(16,(fGETHALF(0,RxxV) +
+                   fMPY16SS(fGETBYTE(0,RssV),fGETUBYTE(0,RttV)) +
+                   fMPY16SS(fGETBYTE(1,RssV),fGETUBYTE(1,RttV)))));
+  fSETHALF(1,RxxV,fSATN(16,(fGETHALF(1,RxxV) +
+                   fMPY16SS(fGETBYTE(2,RssV),fGETUBYTE(2,RttV)) +
+                   fMPY16SS(fGETBYTE(3,RssV),fGETUBYTE(3,RttV)))));
+  fSETHALF(2,RxxV,fSATN(16,(fGETHALF(2,RxxV) +
+                   fMPY16SS(fGETBYTE(4,RssV),fGETUBYTE(4,RttV)) +
+                   fMPY16SS(fGETBYTE(5,RssV),fGETUBYTE(5,RttV)))));
+  fSETHALF(3,RxxV,fSATN(16,(fGETHALF(3,RxxV) +
+                   fMPY16SS(fGETBYTE(6,RssV),fGETUBYTE(6,RttV)) +
+                   fMPY16SS(fGETBYTE(7,RssV),fGETUBYTE(7,RttV)))));
+ })
+
+
+
+/* Full version */
+#undef dmpy_sema
+#define dmpy_sema(N)\
+{ fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + fSCALE(N,fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV))) + \
+                     fSCALE(N,fMPY16SS(fGETHALF(1,RssV),fGETHALF(1,RttV)))));\
+  fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + fSCALE(N,fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV))) + \
+                     fSCALE(N,fMPY16SS(fGETHALF(3,RssV),fGETHALF(3,RttV)))));\
+}
+Q6INSN(M2_vdmacs_s0,"Rxx32+=vdmpy(Rss32,Rtt32):sat",ATTRIBS(),    "",dmpy_sema(0))
+Q6INSN(M2_vdmacs_s1,"Rxx32+=vdmpy(Rss32,Rtt32):<<1:sat",ATTRIBS(),"",dmpy_sema(1))
+
+#undef dmpy_sema
+#define dmpy_sema(N)\
+{ fSETWORD(0,RddV,fSAT(fSCALE(N,fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV))) + \
+              fSCALE(N,fMPY16SS(fGETHALF(1,RssV),fGETHALF(1,RttV)))));\
+  fSETWORD(1,RddV,fSAT(fSCALE(N,fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV))) + \
+              fSCALE(N,fMPY16SS(fGETHALF(3,RssV),fGETHALF(3,RttV)))));\
+}
+
+Q6INSN(M2_vdmpys_s0,"Rdd32=vdmpy(Rss32,Rtt32):sat",ATTRIBS(),    "",dmpy_sema(0))
+Q6INSN(M2_vdmpys_s1,"Rdd32=vdmpy(Rss32,Rtt32):<<1:sat",ATTRIBS(),"",dmpy_sema(1))
+
+
+
+/******************************************************/
+/* complex multiply/mac with                          */
+/* real&imag are packed together and always saturated */
+/* to protect against overflow.                       */
+/******************************************************/
+
+#undef cmpy_sema
+#define cmpy_sema(N,CONJMINUS,CONJPLUS)\
+{ fSETHALF(1,RdV,fGETHALF(1,(fSAT(fSCALE(N,fMPY16SS(fGETHALF(1,RsV),fGETHALF(0,RtV))) CONJMINUS \
+                                  fSCALE(N,fMPY16SS(fGETHALF(0,RsV),fGETHALF(1,RtV))) + 0x8000))));\
+  fSETHALF(0,RdV,fGETHALF(1,(fSAT(fSCALE(N,fMPY16SS(fGETHALF(0,RsV),fGETHALF(0,RtV))) CONJPLUS \
+                                  fSCALE(N,fMPY16SS(fGETHALF(1,RsV),fGETHALF(1,RtV))) + 0x8000))));\
+}
+Q6INSN(M2_cmpyrs_s0,"Rd32=cmpy(Rs32,Rt32):rnd:sat",ATTRIBS(),    "Complex Multiply",cmpy_sema(0,+,-))
+Q6INSN(M2_cmpyrs_s1,"Rd32=cmpy(Rs32,Rt32):<<1:rnd:sat",ATTRIBS(),"Complex Multiply",cmpy_sema(1,+,-))
+
+
+Q6INSN(M2_cmpyrsc_s0,"Rd32=cmpy(Rs32,Rt32*):rnd:sat",ATTRIBS(A_ARCHV2),    "Complex Multiply",cmpy_sema(0,-,+))
+Q6INSN(M2_cmpyrsc_s1,"Rd32=cmpy(Rs32,Rt32*):<<1:rnd:sat",ATTRIBS(A_ARCHV2),"Complex Multiply",cmpy_sema(1,-,+))
+
+
+#undef cmpy_sema
+#define cmpy_sema(N,CONJMINUS,CONJPLUS)\
+{ fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + fSCALE(N,fMPY16SS(fGETHALF(1,RsV),fGETHALF(0,RtV))) CONJMINUS \
+                                          fSCALE(N,fMPY16SS(fGETHALF(0,RsV),fGETHALF(1,RtV)))));\
+  fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + fSCALE(N,fMPY16SS(fGETHALF(0,RsV),fGETHALF(0,RtV))) CONJPLUS \
+                                          fSCALE(N,fMPY16SS(fGETHALF(1,RsV),fGETHALF(1,RtV)))));\
+}
+Q6INSN(M2_cmacs_s0,"Rxx32+=cmpy(Rs32,Rt32):sat",ATTRIBS(),    "Complex Multiply",cmpy_sema(0,+,-))
+Q6INSN(M2_cmacs_s1,"Rxx32+=cmpy(Rs32,Rt32):<<1:sat",ATTRIBS(),"Complex Multiply",cmpy_sema(1,+,-))
+
+/* EJP: Need mac versions w/ CONJ T? */
+Q6INSN(M2_cmacsc_s0,"Rxx32+=cmpy(Rs32,Rt32*):sat",ATTRIBS(A_ARCHV2),    "Complex Multiply",cmpy_sema(0,-,+))
+Q6INSN(M2_cmacsc_s1,"Rxx32+=cmpy(Rs32,Rt32*):<<1:sat",ATTRIBS(A_ARCHV2),"Complex Multiply",cmpy_sema(1,-,+))
+
+
+#undef cmpy_sema
+#define cmpy_sema(N,CONJMINUS,CONJPLUS)\
+{ fSETWORD(1,RddV,fSAT(fSCALE(N,fMPY16SS(fGETHALF(1,RsV),fGETHALF(0,RtV))) CONJMINUS \
+                       fSCALE(N,fMPY16SS(fGETHALF(0,RsV),fGETHALF(1,RtV)))));\
+  fSETWORD(0,RddV,fSAT(fSCALE(N,fMPY16SS(fGETHALF(0,RsV),fGETHALF(0,RtV))) CONJPLUS \
+                       fSCALE(N,fMPY16SS(fGETHALF(1,RsV),fGETHALF(1,RtV)))));\
+}
+
+Q6INSN(M2_cmpys_s0,"Rdd32=cmpy(Rs32,Rt32):sat",ATTRIBS(),    "Complex Multiply",cmpy_sema(0,+,-))
+Q6INSN(M2_cmpys_s1,"Rdd32=cmpy(Rs32,Rt32):<<1:sat",ATTRIBS(),"Complex Multiply",cmpy_sema(1,+,-))
+
+Q6INSN(M2_cmpysc_s0,"Rdd32=cmpy(Rs32,Rt32*):sat",ATTRIBS(A_ARCHV2),    "Complex Multiply",cmpy_sema(0,-,+))
+Q6INSN(M2_cmpysc_s1,"Rdd32=cmpy(Rs32,Rt32*):<<1:sat",ATTRIBS(A_ARCHV2),"Complex Multiply",cmpy_sema(1,-,+))
+
+
+
+#undef cmpy_sema
+#define cmpy_sema(N,CONJMINUS,CONJPLUS)\
+{ fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) - (fSCALE(N,fMPY16SS(fGETHALF(1,RsV),fGETHALF(0,RtV))) CONJMINUS \
+                                           fSCALE(N,fMPY16SS(fGETHALF(0,RsV),fGETHALF(1,RtV))))));\
+  fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) - (fSCALE(N,fMPY16SS(fGETHALF(0,RsV),fGETHALF(0,RtV))) CONJPLUS \
+                                           fSCALE(N,fMPY16SS(fGETHALF(1,RsV),fGETHALF(1,RtV))))));\
+}
+Q6INSN(M2_cnacs_s0,"Rxx32-=cmpy(Rs32,Rt32):sat",ATTRIBS(A_ARCHV2),    "Complex Multiply",cmpy_sema(0,+,-))
+Q6INSN(M2_cnacs_s1,"Rxx32-=cmpy(Rs32,Rt32):<<1:sat",ATTRIBS(A_ARCHV2),"Complex Multiply",cmpy_sema(1,+,-))
+
+/* EJP: need CONJ versions? */
+Q6INSN(M2_cnacsc_s0,"Rxx32-=cmpy(Rs32,Rt32*):sat",ATTRIBS(A_ARCHV2),    "Complex Multiply",cmpy_sema(0,-,+))
+Q6INSN(M2_cnacsc_s1,"Rxx32-=cmpy(Rs32,Rt32*):<<1:sat",ATTRIBS(A_ARCHV2),"Complex Multiply",cmpy_sema(1,-,+))
+
+
+/******************************************************/
+/* complex interpolation                              */
+/* Given a pair of complex values, scale by a,b, sum  */
+/* Saturate/shift1 and round/pack                     */
+/******************************************************/
+
+#undef vrcmpys_sema
+#define vrcmpys_sema(N,INWORD) \
+{ fSETWORD(1,RddV,fSAT(fSCALE(N,fMPY16SS(fGETHALF(1,RssV),fGETHALF(0,INWORD))) + \
+                       fSCALE(N,fMPY16SS(fGETHALF(3,RssV),fGETHALF(1,INWORD)))));\
+  fSETWORD(0,RddV,fSAT(fSCALE(N,fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,INWORD))) + \
+                       fSCALE(N,fMPY16SS(fGETHALF(2,RssV),fGETHALF(1,INWORD)))));\
+}
+
+
+
+Q6INSN(M2_vrcmpys_s1_h,"Rdd32=vrcmpys(Rss32,Rtt32):<<1:sat:raw:hi",ATTRIBS(A_ARCHV3), "Vector Reduce Complex Multiply by Scalar",vrcmpys_sema(1,fGETWORD(1,RttV)))
+Q6INSN(M2_vrcmpys_s1_l,"Rdd32=vrcmpys(Rss32,Rtt32):<<1:sat:raw:lo",ATTRIBS(A_ARCHV3), "Vector Reduce Complex Multiply by Scalar",vrcmpys_sema(1,fGETWORD(0,RttV)))
+
+#undef vrcmpys_sema
+#define vrcmpys_sema(N,INWORD) \
+{ fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + fSCALE(N,fMPY16SS(fGETHALF(1,RssV),fGETHALF(0,INWORD))) + \
+                       fSCALE(N,fMPY16SS(fGETHALF(3,RssV),fGETHALF(1,INWORD)))));\
+  fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + fSCALE(N,fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,INWORD))) + \
+                       fSCALE(N,fMPY16SS(fGETHALF(2,RssV),fGETHALF(1,INWORD)))));\
+}
+
+
+
+Q6INSN(M2_vrcmpys_acc_s1_h,"Rxx32+=vrcmpys(Rss32,Rtt32):<<1:sat:raw:hi",ATTRIBS(A_ARCHV3), "Vector Reduce Complex Multiply by Scalar",vrcmpys_sema(1,fGETWORD(1,RttV)))
+Q6INSN(M2_vrcmpys_acc_s1_l,"Rxx32+=vrcmpys(Rss32,Rtt32):<<1:sat:raw:lo",ATTRIBS(A_ARCHV3), "Vector Reduce Complex Multiply by Scalar",vrcmpys_sema(1,fGETWORD(0,RttV)))
+
+#undef vrcmpys_sema
+#define vrcmpys_sema(N,INWORD) \
+{ fSETHALF(1,RdV,fGETHALF(1,fSAT(fSCALE(N,fMPY16SS(fGETHALF(1,RssV),fGETHALF(0,INWORD))) + \
+                       fSCALE(N,fMPY16SS(fGETHALF(3,RssV),fGETHALF(1,INWORD))) + 0x8000)));\
+  fSETHALF(0,RdV,fGETHALF(1,fSAT(fSCALE(N,fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,INWORD))) + \
+                       fSCALE(N,fMPY16SS(fGETHALF(2,RssV),fGETHALF(1,INWORD))) + 0x8000)));\
+}
+
+Q6INSN(M2_vrcmpys_s1rp_h,"Rd32=vrcmpys(Rss32,Rtt32):<<1:rnd:sat:raw:hi",ATTRIBS(A_ARCHV3), "Vector Reduce Complex Multiply by Scalar",vrcmpys_sema(1,fGETWORD(1,RttV)))
+Q6INSN(M2_vrcmpys_s1rp_l,"Rd32=vrcmpys(Rss32,Rtt32):<<1:rnd:sat:raw:lo",ATTRIBS(A_ARCHV3), "Vector Reduce Complex Multiply by Scalar",vrcmpys_sema(1,fGETWORD(0,RttV)))
+
+/**************************************************************/
+/* mixed mode 32x16 vector dual multiplies                    */
+/*                                                            */
+/**************************************************************/
+
+/* SIGNED 32 x SIGNED 16 */
+
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + ((fSCALE(N,fMPY3216SS(fGETWORD(1,RssV),fGETHALF(2,RttV))))>>16)) ); \
+  fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + ((fSCALE(N,fMPY3216SS(fGETWORD(0,RssV),fGETHALF(0,RttV))))>>16)) ); \
+}
+Q6INSN(M2_mmacls_s0,"Rxx32+=vmpyweh(Rss32,Rtt32):sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmacls_s1,"Rxx32+=vmpyweh(Rss32,Rtt32):<<1:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + ((fSCALE(N,fMPY3216SS(fGETWORD(1,RssV),fGETHALF(3,RttV))))>>16) )); \
+  fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + ((fSCALE(N,fMPY3216SS(fGETWORD(0,RssV),fGETHALF(1,RttV))))>>16 ))); \
+}
+Q6INSN(M2_mmachs_s0,"Rxx32+=vmpywoh(Rss32,Rtt32):sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmachs_s1,"Rxx32+=vmpywoh(Rss32,Rtt32):<<1:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RddV,fSAT((fSCALE(N,fMPY3216SS(fGETWORD(1,RssV),fGETHALF(2,RttV))))>>16)); \
+  fSETWORD(0,RddV,fSAT((fSCALE(N,fMPY3216SS(fGETWORD(0,RssV),fGETHALF(0,RttV))))>>16)); \
+}
+Q6INSN(M2_mmpyl_s0,"Rdd32=vmpyweh(Rss32,Rtt32):sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmpyl_s1,"Rdd32=vmpyweh(Rss32,Rtt32):<<1:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RddV,fSAT((fSCALE(N,fMPY3216SS(fGETWORD(1,RssV),fGETHALF(3,RttV))))>>16)); \
+  fSETWORD(0,RddV,fSAT((fSCALE(N,fMPY3216SS(fGETWORD(0,RssV),fGETHALF(1,RttV))))>>16)); \
+}
+Q6INSN(M2_mmpyh_s0,"Rdd32=vmpywoh(Rss32,Rtt32):sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmpyh_s1,"Rdd32=vmpywoh(Rss32,Rtt32):<<1:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+
+/* With rounding */
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + ((fSCALE(N,fMPY3216SS(fGETWORD(1,RssV),fGETHALF(2,RttV)))+0x8000)>>16)) ); \
+  fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + ((fSCALE(N,fMPY3216SS(fGETWORD(0,RssV),fGETHALF(0,RttV)))+0x8000)>>16)) ); \
+}
+Q6INSN(M2_mmacls_rs0,"Rxx32+=vmpyweh(Rss32,Rtt32):rnd:sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmacls_rs1,"Rxx32+=vmpyweh(Rss32,Rtt32):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + ((fSCALE(N,fMPY3216SS(fGETWORD(1,RssV),fGETHALF(3,RttV)))+0x8000)>>16) )); \
+  fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + ((fSCALE(N,fMPY3216SS(fGETWORD(0,RssV),fGETHALF(1,RttV)))+0x8000)>>16 ))); \
+}
+Q6INSN(M2_mmachs_rs0,"Rxx32+=vmpywoh(Rss32,Rtt32):rnd:sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmachs_rs1,"Rxx32+=vmpywoh(Rss32,Rtt32):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RddV,fSAT((fSCALE(N,fMPY3216SS(fGETWORD(1,RssV),fGETHALF(2,RttV)))+0x8000)>>16)); \
+  fSETWORD(0,RddV,fSAT((fSCALE(N,fMPY3216SS(fGETWORD(0,RssV),fGETHALF(0,RttV)))+0x8000)>>16)); \
+}
+Q6INSN(M2_mmpyl_rs0,"Rdd32=vmpyweh(Rss32,Rtt32):rnd:sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmpyl_rs1,"Rdd32=vmpyweh(Rss32,Rtt32):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RddV,fSAT((fSCALE(N,fMPY3216SS(fGETWORD(1,RssV),fGETHALF(3,RttV)))+0x8000)>>16)); \
+  fSETWORD(0,RddV,fSAT((fSCALE(N,fMPY3216SS(fGETWORD(0,RssV),fGETHALF(1,RttV)))+0x8000)>>16)); \
+}
+Q6INSN(M2_mmpyh_rs0,"Rdd32=vmpywoh(Rss32,Rtt32):rnd:sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmpyh_rs1,"Rdd32=vmpywoh(Rss32,Rtt32):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+
+#undef mixmpy_sema
+#define mixmpy_sema(DEST,EQUALS,N)\
+{ DEST EQUALS fSCALE(N,fMPY3216SS(fGETWORD(1,RssV),fGETHALF(2,RttV))) + fSCALE(N,fMPY3216SS(fGETWORD(0,RssV),fGETHALF(0,RttV)));}
+
+Q6INSN(M4_vrmpyeh_s0,"Rdd32=vrmpyweh(Rss32,Rtt32)",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(RddV,=,0))
+Q6INSN(M4_vrmpyeh_s1,"Rdd32=vrmpyweh(Rss32,Rtt32):<<1",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(RddV,=,1))
+Q6INSN(M4_vrmpyeh_acc_s0,"Rxx32+=vrmpyweh(Rss32,Rtt32)",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(RxxV,+=,0))
+Q6INSN(M4_vrmpyeh_acc_s1,"Rxx32+=vrmpyweh(Rss32,Rtt32):<<1",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(RxxV,+=,1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(DEST,EQUALS,N)\
+{ DEST EQUALS fSCALE(N,fMPY3216SS(fGETWORD(1,RssV),fGETHALF(3,RttV))) + fSCALE(N,fMPY3216SS(fGETWORD(0,RssV),fGETHALF(1,RttV)));}
+
+Q6INSN(M4_vrmpyoh_s0,"Rdd32=vrmpywoh(Rss32,Rtt32)",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(RddV,=,0))
+Q6INSN(M4_vrmpyoh_s1,"Rdd32=vrmpywoh(Rss32,Rtt32):<<1",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(RddV,=,1))
+Q6INSN(M4_vrmpyoh_acc_s0,"Rxx32+=vrmpywoh(Rss32,Rtt32)",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(RxxV,+=,0))
+Q6INSN(M4_vrmpyoh_acc_s1,"Rxx32+=vrmpywoh(Rss32,Rtt32):<<1",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(RxxV,+=,1))
+
+
+
+
+
+
+#undef mixmpy_sema
+#define mixmpy_sema(N,H,RND)\
+{  RdV = fSAT((fSCALE(N,fMPY3216SS(RsV,fGETHALF(H,RtV)))RND)>>16); \
+}
+Q6INSN(M2_hmmpyl_rs1,"Rd32=mpy(Rs32,Rt.L32):<<1:rnd:sat",ATTRIBS(A_ARCHV2),"Mixed Precision Multiply",mixmpy_sema(1,0,+0x8000))
+Q6INSN(M2_hmmpyh_rs1,"Rd32=mpy(Rs32,Rt.H32):<<1:rnd:sat",ATTRIBS(A_ARCHV2),"Mixed Precision Multiply",mixmpy_sema(1,1,+0x8000))
+Q6INSN(M2_hmmpyl_s1,"Rd32=mpy(Rs32,Rt.L32):<<1:sat",ATTRIBS(A_ARCHV2),"Mixed Precision Multiply",mixmpy_sema(1,0,))
+Q6INSN(M2_hmmpyh_s1,"Rd32=mpy(Rs32,Rt.H32):<<1:sat",ATTRIBS(A_ARCHV2),"Mixed Precision Multiply",mixmpy_sema(1,1,))
+
+
+
+
+
+
+
+
+
+/* SIGNED 32 x UNSIGNED 16 */
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + ((fSCALE(N,fMPY3216SU(fGETWORD(1,RssV),fGETUHALF(2,RttV))))>>16)) ); \
+  fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + ((fSCALE(N,fMPY3216SU(fGETWORD(0,RssV),fGETUHALF(0,RttV))))>>16)) ); \
+}
+Q6INSN(M2_mmaculs_s0,"Rxx32+=vmpyweuh(Rss32,Rtt32):sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmaculs_s1,"Rxx32+=vmpyweuh(Rss32,Rtt32):<<1:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + ((fSCALE(N,fMPY3216SU(fGETWORD(1,RssV),fGETUHALF(3,RttV))))>>16) )); \
+  fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + ((fSCALE(N,fMPY3216SU(fGETWORD(0,RssV),fGETUHALF(1,RttV))))>>16 ))); \
+}
+Q6INSN(M2_mmacuhs_s0,"Rxx32+=vmpywouh(Rss32,Rtt32):sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmacuhs_s1,"Rxx32+=vmpywouh(Rss32,Rtt32):<<1:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RddV,fSAT((fSCALE(N,fMPY3216SU(fGETWORD(1,RssV),fGETUHALF(2,RttV))))>>16)); \
+  fSETWORD(0,RddV,fSAT((fSCALE(N,fMPY3216SU(fGETWORD(0,RssV),fGETUHALF(0,RttV))))>>16)); \
+}
+Q6INSN(M2_mmpyul_s0,"Rdd32=vmpyweuh(Rss32,Rtt32):sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmpyul_s1,"Rdd32=vmpyweuh(Rss32,Rtt32):<<1:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RddV,fSAT((fSCALE(N,fMPY3216SU(fGETWORD(1,RssV),fGETUHALF(3,RttV))))>>16)); \
+  fSETWORD(0,RddV,fSAT((fSCALE(N,fMPY3216SU(fGETWORD(0,RssV),fGETUHALF(1,RttV))))>>16)); \
+}
+Q6INSN(M2_mmpyuh_s0,"Rdd32=vmpywouh(Rss32,Rtt32):sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmpyuh_s1,"Rdd32=vmpywouh(Rss32,Rtt32):<<1:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+
+/* With rounding */
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + ((fSCALE(N,fMPY3216SU(fGETWORD(1,RssV),fGETUHALF(2,RttV)))+0x8000)>>16)) ); \
+  fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + ((fSCALE(N,fMPY3216SU(fGETWORD(0,RssV),fGETUHALF(0,RttV)))+0x8000)>>16)) ); \
+}
+Q6INSN(M2_mmaculs_rs0,"Rxx32+=vmpyweuh(Rss32,Rtt32):rnd:sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmaculs_rs1,"Rxx32+=vmpyweuh(Rss32,Rtt32):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RxxV,fSAT(fGETWORD(1,RxxV) + ((fSCALE(N,fMPY3216SU(fGETWORD(1,RssV),fGETUHALF(3,RttV)))+0x8000)>>16) )); \
+  fSETWORD(0,RxxV,fSAT(fGETWORD(0,RxxV) + ((fSCALE(N,fMPY3216SU(fGETWORD(0,RssV),fGETUHALF(1,RttV)))+0x8000)>>16 ))); \
+}
+Q6INSN(M2_mmacuhs_rs0,"Rxx32+=vmpywouh(Rss32,Rtt32):rnd:sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmacuhs_rs1,"Rxx32+=vmpywouh(Rss32,Rtt32):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RddV,fSAT((fSCALE(N,fMPY3216SU(fGETWORD(1,RssV),fGETUHALF(2,RttV)))+0x8000)>>16)); \
+  fSETWORD(0,RddV,fSAT((fSCALE(N,fMPY3216SU(fGETWORD(0,RssV),fGETUHALF(0,RttV)))+0x8000)>>16)); \
+}
+Q6INSN(M2_mmpyul_rs0,"Rdd32=vmpyweuh(Rss32,Rtt32):rnd:sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmpyul_rs1,"Rdd32=vmpyweuh(Rss32,Rtt32):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+#undef mixmpy_sema
+#define mixmpy_sema(N)\
+{ fSETWORD(1,RddV,fSAT((fSCALE(N,fMPY3216SU(fGETWORD(1,RssV),fGETUHALF(3,RttV)))+0x8000)>>16)); \
+  fSETWORD(0,RddV,fSAT((fSCALE(N,fMPY3216SU(fGETWORD(0,RssV),fGETUHALF(1,RttV)))+0x8000)>>16)); \
+}
+Q6INSN(M2_mmpyuh_rs0,"Rdd32=vmpywouh(Rss32,Rtt32):rnd:sat",ATTRIBS(),    "Mixed Precision Multiply",mixmpy_sema(0))
+Q6INSN(M2_mmpyuh_rs1,"Rdd32=vmpywouh(Rss32,Rtt32):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Multiply",mixmpy_sema(1))
+
+
+/**************************************************************/
+/* complex mac with full 64-bit accum - no sat, no shift      */
+/* either do real or accum, never both                        */
+/**************************************************************/
+
+Q6INSN(M2_vrcmaci_s0,"Rxx32+=vrcmpyi(Rss32,Rtt32)",ATTRIBS(),"Vector Complex Mac Imaginary",
+{
+RxxV = RxxV + fMPY16SS(fGETHALF(1,RssV),fGETHALF(0,RttV)) + \
+              fMPY16SS(fGETHALF(0,RssV),fGETHALF(1,RttV)) + \
+              fMPY16SS(fGETHALF(3,RssV),fGETHALF(2,RttV)) + \
+              fMPY16SS(fGETHALF(2,RssV),fGETHALF(3,RttV));\
+})
+
+Q6INSN(M2_vrcmacr_s0,"Rxx32+=vrcmpyr(Rss32,Rtt32)",ATTRIBS(),"Vector Complex Mac Real",
+{ RxxV = RxxV + fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV)) - \
+                fMPY16SS(fGETHALF(1,RssV),fGETHALF(1,RttV)) + \
+                fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV)) - \
+                fMPY16SS(fGETHALF(3,RssV),fGETHALF(3,RttV));\
+})
+
+Q6INSN(M2_vrcmaci_s0c,"Rxx32+=vrcmpyi(Rss32,Rtt32*)",ATTRIBS(A_ARCHV2),"Vector Complex Mac Imaginary",
+{
+RxxV = RxxV + fMPY16SS(fGETHALF(1,RssV),fGETHALF(0,RttV)) - \
+              fMPY16SS(fGETHALF(0,RssV),fGETHALF(1,RttV)) + \
+              fMPY16SS(fGETHALF(3,RssV),fGETHALF(2,RttV)) - \
+              fMPY16SS(fGETHALF(2,RssV),fGETHALF(3,RttV));\
+})
+
+Q6INSN(M2_vrcmacr_s0c,"Rxx32+=vrcmpyr(Rss32,Rtt32*)",ATTRIBS(A_ARCHV2),"Vector Complex Mac Real",
+{ RxxV = RxxV + fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV)) + \
+                fMPY16SS(fGETHALF(1,RssV),fGETHALF(1,RttV)) + \
+                fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV)) + \
+                fMPY16SS(fGETHALF(3,RssV),fGETHALF(3,RttV));\
+})
+
+Q6INSN(M2_cmaci_s0,"Rxx32+=cmpyi(Rs32,Rt32)",ATTRIBS(),"Vector Complex Mac Imaginary",
+{
+RxxV = RxxV + fMPY16SS(fGETHALF(1,RsV),fGETHALF(0,RtV)) + \
+              fMPY16SS(fGETHALF(0,RsV),fGETHALF(1,RtV));
+})
+
+Q6INSN(M2_cmacr_s0,"Rxx32+=cmpyr(Rs32,Rt32)",ATTRIBS(),"Vector Complex Mac Real",
+{ RxxV = RxxV + fMPY16SS(fGETHALF(0,RsV),fGETHALF(0,RtV)) - \
+                fMPY16SS(fGETHALF(1,RsV),fGETHALF(1,RtV));
+})
+
+
+Q6INSN(M2_vrcmpyi_s0,"Rdd32=vrcmpyi(Rss32,Rtt32)",ATTRIBS(),"Vector Complex Mpy Imaginary",
+{
+RddV = fMPY16SS(fGETHALF(1,RssV),fGETHALF(0,RttV)) + \
+       fMPY16SS(fGETHALF(0,RssV),fGETHALF(1,RttV)) + \
+       fMPY16SS(fGETHALF(3,RssV),fGETHALF(2,RttV)) + \
+       fMPY16SS(fGETHALF(2,RssV),fGETHALF(3,RttV));\
+})
+
+Q6INSN(M2_vrcmpyr_s0,"Rdd32=vrcmpyr(Rss32,Rtt32)",ATTRIBS(),"Vector Complex Mpy Real",
+{ RddV = fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV)) - \
+         fMPY16SS(fGETHALF(1,RssV),fGETHALF(1,RttV)) + \
+         fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV)) - \
+         fMPY16SS(fGETHALF(3,RssV),fGETHALF(3,RttV));\
+})
+
+Q6INSN(M2_vrcmpyi_s0c,"Rdd32=vrcmpyi(Rss32,Rtt32*)",ATTRIBS(A_ARCHV2),"Vector Complex Mpy Imaginary",
+{
+RddV = fMPY16SS(fGETHALF(1,RssV),fGETHALF(0,RttV)) - \
+       fMPY16SS(fGETHALF(0,RssV),fGETHALF(1,RttV)) + \
+       fMPY16SS(fGETHALF(3,RssV),fGETHALF(2,RttV)) - \
+       fMPY16SS(fGETHALF(2,RssV),fGETHALF(3,RttV));\
+})
+
+Q6INSN(M2_vrcmpyr_s0c,"Rdd32=vrcmpyr(Rss32,Rtt32*)",ATTRIBS(A_ARCHV2),"Vector Complex Mpy Real",
+{ RddV = fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV)) + \
+         fMPY16SS(fGETHALF(1,RssV),fGETHALF(1,RttV)) + \
+         fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV)) + \
+         fMPY16SS(fGETHALF(3,RssV),fGETHALF(3,RttV));\
+})
+
+Q6INSN(M2_cmpyi_s0,"Rdd32=cmpyi(Rs32,Rt32)",ATTRIBS(),"Vector Complex Mpy Imaginary",
+{
+RddV = fMPY16SS(fGETHALF(1,RsV),fGETHALF(0,RtV)) + \
+       fMPY16SS(fGETHALF(0,RsV),fGETHALF(1,RtV));
+})
+
+Q6INSN(M2_cmpyr_s0,"Rdd32=cmpyr(Rs32,Rt32)",ATTRIBS(),"Vector Complex Mpy Real",
+{ RddV = fMPY16SS(fGETHALF(0,RsV),fGETHALF(0,RtV)) - \
+         fMPY16SS(fGETHALF(1,RsV),fGETHALF(1,RtV));
+})
+
+
+/**************************************************************/
+/* Complex mpy/mac with 2x32 bit accum, sat, shift            */
+/* 32x16 real or imag                                         */
+/**************************************************************/
+
+#if 1
+
+Q6INSN(M4_cmpyi_wh,"Rd32=cmpyiwh(Rss32,Rt32):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Complex Multiply",
+{
+ RdV = fSAT(  (  fMPY3216SS(fGETWORD(0,RssV),fGETHALF(1,RtV))
+               + fMPY3216SS(fGETWORD(1,RssV),fGETHALF(0,RtV))
+               + 0x4000)>>15);
+})
+
+
+Q6INSN(M4_cmpyr_wh,"Rd32=cmpyrwh(Rss32,Rt32):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Complex Multiply",
+{
+ RdV = fSAT(  (  fMPY3216SS(fGETWORD(0,RssV),fGETHALF(0,RtV))
+               - fMPY3216SS(fGETWORD(1,RssV),fGETHALF(1,RtV))
+               + 0x4000)>>15);
+})
+
+Q6INSN(M4_cmpyi_whc,"Rd32=cmpyiwh(Rss32,Rt32*):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Complex Multiply",
+{
+ RdV = fSAT(  (  fMPY3216SS(fGETWORD(1,RssV),fGETHALF(0,RtV))
+               - fMPY3216SS(fGETWORD(0,RssV),fGETHALF(1,RtV))
+               + 0x4000)>>15);
+})
+
+
+Q6INSN(M4_cmpyr_whc,"Rd32=cmpyrwh(Rss32,Rt32*):<<1:rnd:sat",ATTRIBS(),"Mixed Precision Complex Multiply",
+{
+ RdV = fSAT(  (  fMPY3216SS(fGETWORD(0,RssV),fGETHALF(0,RtV))
+               + fMPY3216SS(fGETWORD(1,RssV),fGETHALF(1,RtV))
+               + 0x4000)>>15);
+})
+
+
+#endif
+
+/**************************************************************/
+/* Vector mpy/mac with 2x32 bit accum, sat, shift             */
+/* either do real or imag,  never both                        */
+/**************************************************************/
+
+#undef VCMPYSEMI
+#define VCMPYSEMI(DST,ACC0,ACC1,SHIFT,SAT) \
+    fSETWORD(0,DST,SAT(ACC0 fSCALE(SHIFT,fMPY16SS(fGETHALF(1,RssV),fGETHALF(0,RttV)) + \
+        fMPY16SS(fGETHALF(0,RssV),fGETHALF(1,RttV))))); \
+    fSETWORD(1,DST,SAT(ACC1 fSCALE(SHIFT,fMPY16SS(fGETHALF(3,RssV),fGETHALF(2,RttV)) + \
+        fMPY16SS(fGETHALF(2,RssV),fGETHALF(3,RttV))))); \
+
+#undef VCMPYSEMR
+#define VCMPYSEMR(DST,ACC0,ACC1,SHIFT,SAT) \
+    fSETWORD(0,DST,SAT(ACC0 fSCALE(SHIFT,fMPY16SS(fGETHALF(0,RssV),fGETHALF(0,RttV)) - \
+        fMPY16SS(fGETHALF(1,RssV),fGETHALF(1,RttV))))); \
+    fSETWORD(1,DST,SAT(ACC1 fSCALE(SHIFT,fMPY16SS(fGETHALF(2,RssV),fGETHALF(2,RttV)) - \
+        fMPY16SS(fGETHALF(3,RssV),fGETHALF(3,RttV))))); \
+
+
+#undef VCMPYIR
+#define VCMPYIR(TAGBASE,DSTSYN,DSTVAL,ACCSEM,ACCVAL0,ACCVAL1,SHIFTSYN,SHIFTVAL,SATSYN,SATVAL) \
+Q6INSN(M2_##TAGBASE##i,DSTSYN ACCSEM "vcmpyi(Rss32,Rtt32)" SHIFTSYN SATSYN,ATTRIBS(A_ARCHV2), \
+    "Vector Complex Multiply Imaginary", { VCMPYSEMI(DSTVAL,ACCVAL0,ACCVAL1,SHIFTVAL,SATVAL); }) \
+Q6INSN(M2_##TAGBASE##r,DSTSYN ACCSEM "vcmpyr(Rss32,Rtt32)" SHIFTSYN SATSYN,ATTRIBS(A_ARCHV2), \
+    "Vector Complex Multiply Imaginary", { VCMPYSEMR(DSTVAL,ACCVAL0,ACCVAL1,SHIFTVAL,SATVAL); })
+
+
+VCMPYIR(vcmpy_s0_sat_,"Rdd32",RddV,"=",,,"",0,":sat",fSAT)
+VCMPYIR(vcmpy_s1_sat_,"Rdd32",RddV,"=",,,":<<1",1,":sat",fSAT)
+VCMPYIR(vcmac_s0_sat_,"Rxx32",RxxV,"+=",fGETWORD(0,RxxV) + ,fGETWORD(1,RxxV) + ,"",0,":sat",fSAT)
+
+
+/**********************************************************************
+ *  Rotation  -- by 0, 90, 180, or 270 means mult by 1, J, -1, -J     *
+ *********************************************************************/
+
+Q6INSN(S2_vcrotate,"Rdd32=vcrotate(Rss32,Rt32)",ATTRIBS(A_ARCHV2),"Rotate complex value by multiple of PI/2",
+{
+    fHIDE(size1u_t tmp;)
+    tmp = fEXTRACTU_RANGE(RtV,1,0);
+    if (tmp == 0) { /* No rotation */
+        fSETHALF(0,RddV,fGETHALF(0,RssV));
+        fSETHALF(1,RddV,fGETHALF(1,RssV));
+    } else if (tmp == 1) { /* Multiply by -J */
+        fSETHALF(0,RddV,fGETHALF(1,RssV));
+        fSETHALF(1,RddV,fSATH(-fGETHALF(0,RssV)));
+    } else if (tmp == 2) { /* Multiply by J */
+        fSETHALF(0,RddV,fSATH(-fGETHALF(1,RssV)));
+        fSETHALF(1,RddV,fGETHALF(0,RssV));
+    } else { /* Multiply by -1 */
+        fHIDE(if (tmp != 3) fatal("C is broken");)
+        fSETHALF(0,RddV,fSATH(-fGETHALF(0,RssV)));
+        fSETHALF(1,RddV,fSATH(-fGETHALF(1,RssV)));
+    }
+    tmp = fEXTRACTU_RANGE(RtV,3,2);
+    if (tmp == 0) { /* No rotation */
+        fSETHALF(2,RddV,fGETHALF(2,RssV));
+        fSETHALF(3,RddV,fGETHALF(3,RssV));
+    } else if (tmp == 1) { /* Multiply by -J */
+        fSETHALF(2,RddV,fGETHALF(3,RssV));
+        fSETHALF(3,RddV,fSATH(-fGETHALF(2,RssV)));
+    } else if (tmp == 2) { /* Multiply by J */
+        fSETHALF(2,RddV,fSATH(-fGETHALF(3,RssV)));
+        fSETHALF(3,RddV,fGETHALF(2,RssV));
+    } else { /* Multiply by -1 */
+        fHIDE(if (tmp != 3) fatal("C is broken");)
+        fSETHALF(2,RddV,fSATH(-fGETHALF(2,RssV)));
+        fSETHALF(3,RddV,fSATH(-fGETHALF(3,RssV)));
+    }
+})
+
+
+Q6INSN(S4_vrcrotate_acc,"Rxx32+=vrcrotate(Rss32,Rt32,#u2)",ATTRIBS(),"Rotate and Reduce Bytes",
+{
+    fHIDE(int i; int tmpr; int tmpi; unsigned int control;)
+    fHIDE(int sumr; int sumi;)
+    sumr = 0;
+    sumi = 0;
+    control = fGETUBYTE(uiV,RtV);
+    for (i = 0; i < 8; i += 2) {
+        tmpr = fGETBYTE(i  ,RssV);
+        tmpi = fGETBYTE(i+1,RssV);
+        switch (control & 3) {
+        case 0: /* No Rotation */
+            sumr += tmpr;
+            sumi += tmpi;
+            break;
+        case 1: /* Multiply by -J */
+            sumr += tmpi;
+            sumi -= tmpr;
+            break;
+        case 2: /* Multiply by J */
+            sumr -= tmpi;
+            sumi += tmpr;
+            break;
+        case 3: /* Multiply by -1 */
+            sumr -= tmpr;
+            sumi -= tmpi;
+            break;
+        fHIDE(default: fatal("C is broken!");)
+        }
+        control = control >> 2;
+    }
+    fSETWORD(0,RxxV,fGETWORD(0,RxxV) + sumr);
+    fSETWORD(1,RxxV,fGETWORD(1,RxxV) + sumi);
+})
+
+Q6INSN(S4_vrcrotate,"Rdd32=vrcrotate(Rss32,Rt32,#u2)",ATTRIBS(),"Rotate and Reduce Bytes",
+{
+    fHIDE(int i; int tmpr; int tmpi; unsigned int control;)
+    fHIDE(int sumr; int sumi;)
+    sumr = 0;
+    sumi = 0;
+    control = fGETUBYTE(uiV,RtV);
+    for (i = 0; i < 8; i += 2) {
+        tmpr = fGETBYTE(i  ,RssV);
+        tmpi = fGETBYTE(i+1,RssV);
+        switch (control & 3) {
+        case 0: /* No Rotation */
+            sumr += tmpr;
+            sumi += tmpi;
+            break;
+        case 1: /* Multiply by -J */
+            sumr += tmpi;
+            sumi -= tmpr;
+            break;
+        case 2: /* Multiply by J */
+            sumr -= tmpi;
+            sumi += tmpr;
+            break;
+        case 3: /* Multiply by -1 */
+            sumr -= tmpr;
+            sumi -= tmpi;
+            break;
+        fHIDE(default: fatal("C is broken!");)
+        }
+        control = control >> 2;
+    }
+    fSETWORD(0,RddV,sumr);
+    fSETWORD(1,RddV,sumi);
+})
+
+
+Q6INSN(S2_vcnegh,"Rdd32=vcnegh(Rss32,Rt32)",ATTRIBS(),"Conditional Negate halfwords",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 4; i++) {
+        if (fGETBIT(i,RtV)) {
+            fSETHALF(i,RddV,fSATH(-fGETHALF(i,RssV)));
+        } else {
+            fSETHALF(i,RddV,fGETHALF(i,RssV));
+        }
+    }
+})
+
+Q6INSN(S2_vrcnegh,"Rxx32+=vrcnegh(Rss32,Rt32)",ATTRIBS(),"Vector Reduce Conditional Negate halfwords",
+{
+    fHIDE(int i;)
+    for (i = 0; i < 4; i++) {
+        if (fGETBIT(i,RtV)) {
+            RxxV += -fGETHALF(i,RssV);
+        } else {
+            RxxV += fGETHALF(i,RssV);
+        }
+    }
+})
+
+
+/**********************************************************************
+ *  Finite-field multiplies.  Written by David Hoyle                  *
+ *********************************************************************/
+
+Q6INSN(M4_pmpyw,"Rdd32=pmpyw(Rs32,Rt32)",ATTRIBS(),"Polynomial 32bit Multiplication with Addition in GF(2)",
+{
+        fHIDE(int i; unsigned int y;)
+        fHIDE(unsigned long long x; unsigned long long prod;)
+        x = fGETUWORD(0, RsV);
+        y = fGETUWORD(0, RtV);
+
+        prod = 0;
+        for(i=0; i < 32; i++) {
+            if((y >> i) & 1) prod ^= (x << i);
+        }
+        RddV = prod;
+})
+
+Q6INSN(M4_vpmpyh,"Rdd32=vpmpyh(Rs32,Rt32)",ATTRIBS(),"Dual Polynomial 16bit Multiplication with Addition in GF(2)",
+{
+        fHIDE(int i; unsigned int x0; unsigned int x1;)
+        fHIDE(unsigned int y0; unsigned int y1;)
+        fHIDE(unsigned int prod0; unsigned int prod1;)
+
+        x0 = fGETUHALF(0, RsV);
+        x1 = fGETUHALF(1, RsV);
+        y0 = fGETUHALF(0, RtV);
+        y1 = fGETUHALF(1, RtV);
+
+        prod0 = prod1 = 0;
+        for(i=0; i < 16; i++) {
+            if((y0 >> i) & 1) prod0 ^= (x0 << i);
+            if((y1 >> i) & 1) prod1 ^= (x1 << i);
+        }
+        fSETHALF(0,RddV,fGETUHALF(0,prod0));
+        fSETHALF(1,RddV,fGETUHALF(0,prod1));
+        fSETHALF(2,RddV,fGETUHALF(1,prod0));
+        fSETHALF(3,RddV,fGETUHALF(1,prod1));
+})
+
+Q6INSN(M4_pmpyw_acc,"Rxx32^=pmpyw(Rs32,Rt32)",ATTRIBS(),"Polynomial 32bit Multiplication with Addition in GF(2)",
+{
+        fHIDE(int i; unsigned int y;)
+        fHIDE(unsigned long long x; unsigned long long prod;)
+        x = fGETUWORD(0, RsV);
+        y = fGETUWORD(0, RtV);
+
+        prod = 0;
+        for(i=0; i < 32; i++) {
+            if((y >> i) & 1) prod ^= (x << i);
+        }
+        RxxV ^= prod;
+})
+
+Q6INSN(M4_vpmpyh_acc,"Rxx32^=vpmpyh(Rs32,Rt32)",ATTRIBS(),"Dual Polynomial 16bit Multiplication with Addition in GF(2)",
+{
+        fHIDE(int i; unsigned int x0; unsigned int x1;)
+        fHIDE(unsigned int y0; unsigned int y1;)
+        fHIDE(unsigned int prod0; unsigned int prod1;)
+
+        x0 = fGETUHALF(0, RsV);
+        x1 = fGETUHALF(1, RsV);
+        y0 = fGETUHALF(0, RtV);
+        y1 = fGETUHALF(1, RtV);
+
+        prod0 = prod1 = 0;
+        for(i=0; i < 16; i++) {
+            if((y0 >> i) & 1) prod0 ^= (x0 << i);
+            if((y1 >> i) & 1) prod1 ^= (x1 << i);
+        }
+        fSETHALF(0,RxxV,fGETUHALF(0,RxxV) ^ fGETUHALF(0,prod0));
+        fSETHALF(1,RxxV,fGETUHALF(1,RxxV) ^ fGETUHALF(0,prod1));
+        fSETHALF(2,RxxV,fGETUHALF(2,RxxV) ^ fGETUHALF(1,prod0));
+        fSETHALF(3,RxxV,fGETUHALF(3,RxxV) ^ fGETUHALF(1,prod1));
+})
+
+
+/* V70: TINY CORE */
+
+#define CMPY64(TAG,NAME,DESC,OPERAND1,OP,W0,W1,W2,W3) \
+Q6INSN(M7_##TAG,"Rdd32=" NAME "(Rss32," OPERAND1 ")",ATTRIBS(A_RESTRICT_SLOT3ONLY),"Complex Multiply 64-bit " DESC,    { RddV  = (fMPY32SS(fGETWORD(W0, RssV), fGETWORD(W1, RttV)) OP fMPY32SS(fGETWORD(W2, RssV), fGETWORD(W3, RttV)));})\
+Q6INSN(M7_##TAG##_acc,"Rxx32+=" NAME "(Rss32,"OPERAND1")",ATTRIBS(A_RESTRICT_SLOT3ONLY),"Complex Multiply-Accumulate 64-bit " DESC, { RxxV += (fMPY32SS(fGETWORD(W0, RssV), fGETWORD(W1, RttV)) OP fMPY32SS(fGETWORD(W2, RssV), fGETWORD(W3, RttV)));})
+
+CMPY64(dcmpyrw, "cmpyrw","Real","Rtt32" ,-,0,0,1,1)
+CMPY64(dcmpyrwc,"cmpyrw","Real","Rtt32*",+,0,0,1,1)
+CMPY64(dcmpyiw, "cmpyiw","Imag","Rtt32" ,+,0,1,1,0)
+CMPY64(dcmpyiwc,"cmpyiw","Imag","Rtt32*",-,1,0,0,1)
+
+#define CMPY128(TAG, NAME, OPERAND1, WORD0, WORD1, WORD2, WORD3, OP) \
+Q6INSN(M7_##TAG,"Rd32=" NAME "(Rss32,"OPERAND1"):<<1:sat",ATTRIBS(A_RESTRICT_SLOT3ONLY),"Complex Multiply 32-bit result real",  \
+{ \
+fHIDE(size16s_t acc128;)\
+fHIDE(size16s_t tmp128;)\
+fHIDE(size8s_t acc64;)\
+tmp128 = fCAST8S_16S(fMPY32SS(fGETWORD(WORD0, RssV), fGETWORD(WORD1, RttV)));\
+acc128 = fCAST8S_16S(fMPY32SS(fGETWORD(WORD2, RssV), fGETWORD(WORD3, RttV)));\
+acc128 = OP(tmp128,acc128);\
+acc128 = fSHIFTR128(acc128, 31);\
+acc64 =  fCAST16S_8S(acc128);\
+RdV = fSATW(acc64);\
+})
+
+
+CMPY128(wcmpyrw, "cmpyrw", "Rtt32", 0, 0, 1, 1, fSUB128)
+CMPY128(wcmpyrwc, "cmpyrw", "Rtt32*", 0, 0, 1, 1, fADD128)
+CMPY128(wcmpyiw, "cmpyiw", "Rtt32", 0, 1, 1, 0, fADD128)
+CMPY128(wcmpyiwc, "cmpyiw", "Rtt32*", 1, 0, 0, 1, fSUB128)
+
+
+#define CMPY128RND(TAG, NAME, OPERAND1, WORD0, WORD1, WORD2, WORD3, OP) \
+Q6INSN(M7_##TAG##_rnd,"Rd32=" NAME "(Rss32,"OPERAND1"):<<1:rnd:sat",ATTRIBS(A_RESTRICT_SLOT3ONLY),"Complex Multiply 32-bit result real",  \
+{ \
+fHIDE(size16s_t acc128;)\
+fHIDE(size16s_t tmp128;)\
+fHIDE(size16s_t const128;)\
+fHIDE(size8s_t acc64;)\
+tmp128 = fCAST8S_16S(fMPY32SS(fGETWORD(WORD0, RssV), fGETWORD(WORD1, RttV)));\
+acc128 = fCAST8S_16S(fMPY32SS(fGETWORD(WORD2, RssV), fGETWORD(WORD3, RttV)));\
+const128 = fCAST8S_16S(fCONSTLL(0x40000000));\
+acc128 = OP(tmp128,acc128);\
+acc128 = fADD128(acc128,const128);\
+acc128 = fSHIFTR128(acc128, 31);\
+acc64 =  fCAST16S_8S(acc128);\
+RdV = fSATW(acc64);\
+})
+
+CMPY128RND(wcmpyrw, "cmpyrw", "Rtt32", 0, 0, 1, 1, fSUB128)
+CMPY128RND(wcmpyrwc, "cmpyrw", "Rtt32*", 0, 0, 1, 1, fADD128)
+CMPY128RND(wcmpyiw, "cmpyiw", "Rtt32", 0, 1, 1, 0, fADD128)
+CMPY128RND(wcmpyiwc, "cmpyiw", "Rtt32*", 1, 0, 0, 1, fSUB128)
diff --git a/target/hexagon/imported/shift.idef b/target/hexagon/imported/shift.idef
new file mode 100644
index 0000000000..e328ab7329
--- /dev/null
+++ b/target/hexagon/imported/shift.idef
@@ -0,0 +1,1066 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * S-type Instructions
+ */
+
+/**********************************************/
+/* SHIFTS                                     */
+/**********************************************/
+
+/* NOTE: Rdd = Rs *right* shifts don't make sense */
+/* NOTE: Rd[d] = Rs[s] *right* shifts with saturation don't make sense */
+
+
+#define RSHIFTTYPES(TAGEND,REGD,REGS,REGSTYPE,ACC,ACCSRC,SAT,SATOPT,ATTRS) \
+Q6INSN(S2_asr_r_##TAGEND,#REGD "32" #ACC "=asr(" #REGS "32,Rt32)" #SATOPT,ATTRIBS(ATTRS), \
+    "Arithmetic Shift Right by Register", \
+    {  \
+        fHIDE(size4s_t) shamt=fSXTN(7,32,RtV);\
+        REGD##V = SAT(ACCSRC ACC fBIDIR_ASHIFTR(REGS##V,shamt,REGSTYPE));  \
+    })\
+\
+Q6INSN(S2_asl_r_##TAGEND,#REGD "32" #ACC "=asl(" #REGS "32,Rt32)" #SATOPT,ATTRIBS(ATTRS), \
+    "Arithmetic Shift Left by Register", \
+    {  \
+        fHIDE(size4s_t) shamt=fSXTN(7,32,RtV);\
+        REGD##V = SAT(ACCSRC ACC fBIDIR_ASHIFTL(REGS##V,shamt,REGSTYPE));  \
+    })\
+\
+Q6INSN(S2_lsr_r_##TAGEND,#REGD "32" #ACC "=lsr(" #REGS "32,Rt32)" #SATOPT,ATTRIBS(ATTRS), \
+    "Logical Shift Right by Register", \
+    {  \
+        fHIDE(size4s_t) shamt=fSXTN(7,32,RtV);\
+        REGD##V = SAT(ACCSRC ACC fBIDIR_LSHIFTR(REGS##V,shamt,REGSTYPE));  \
+    })\
+\
+Q6INSN(S2_lsl_r_##TAGEND,#REGD "32" #ACC "=lsl(" #REGS "32,Rt32)" #SATOPT,ATTRIBS(ATTRS), \
+    "Logical Shift Left by Register", \
+    {  \
+        fHIDE(size4s_t) shamt=fSXTN(7,32,RtV);\
+        REGD##V = SAT(ACCSRC ACC fBIDIR_LSHIFTL(REGS##V,shamt,REGSTYPE));  \
+    })
+
+RSHIFTTYPES(r,Rd,Rs,4_8,,,fECHO,,)
+RSHIFTTYPES(p,Rdd,Rss,8_8,,,fECHO,,)
+RSHIFTTYPES(r_acc,Rx,Rs,4_8,+,RxV,fECHO,,)
+RSHIFTTYPES(p_acc,Rxx,Rss,8_8,+,RxxV,fECHO,,)
+RSHIFTTYPES(r_nac,Rx,Rs,4_8,-,RxV,fECHO,,)
+RSHIFTTYPES(p_nac,Rxx,Rss,8_8,-,RxxV,fECHO,,)
+
+RSHIFTTYPES(r_and,Rx,Rs,4_8,&,RxV,fECHO,,)
+RSHIFTTYPES(r_or,Rx,Rs,4_8,|,RxV,fECHO,,)
+RSHIFTTYPES(p_and,Rxx,Rss,8_8,&,RxxV,fECHO,,)
+RSHIFTTYPES(p_or,Rxx,Rss,8_8,|,RxxV,fECHO,,)
+RSHIFTTYPES(p_xor,Rxx,Rss,8_8,^,RxxV,fECHO,,)
+
+
+#undef RSHIFTTYPES
+
+/* Register shift with saturation */
+#define RSATSHIFTTYPES(TAGEND,REGD,REGS,REGSTYPE) \
+Q6INSN(S2_asr_r_##TAGEND,#REGD "32" "=asr(" #REGS "32,Rt32):sat",ATTRIBS(), \
+    "Arithmetic Shift Right by Register", \
+    {  \
+        fHIDE(size4s_t) shamt=fSXTN(7,32,RtV);\
+        REGD##V = fBIDIR_ASHIFTR_SAT(REGS##V,shamt,REGSTYPE);  \
+    })\
+\
+Q6INSN(S2_asl_r_##TAGEND,#REGD "32" "=asl(" #REGS "32,Rt32):sat",ATTRIBS(), \
+    "Arithmetic Shift Left by Register", \
+    {  \
+        fHIDE(size4s_t) shamt=fSXTN(7,32,RtV);\
+        REGD##V = fBIDIR_ASHIFTL_SAT(REGS##V,shamt,REGSTYPE);  \
+    })
+
+RSATSHIFTTYPES(r_sat,Rd,Rs,4_8)
+
+
+
+
+
+#define ISHIFTTYPES(TAGEND,SIZE,REGD,REGS,REGSTYPE,ACC,ACCSRC,SAT,SATOPT,ATTRS) \
+Q6INSN(S2_asr_i_##TAGEND,#REGD "32" #ACC "=asr(" #REGS "32,#u" #SIZE ")" #SATOPT,ATTRIBS(ATTRS), \
+    "Arithmetic Shift Right by Immediate", \
+    { REGD##V = SAT(ACCSRC ACC fASHIFTR(REGS##V,uiV,REGSTYPE)); }) \
+\
+Q6INSN(S2_lsr_i_##TAGEND,#REGD "32" #ACC "=lsr(" #REGS "32,#u" #SIZE ")" #SATOPT,ATTRIBS(ATTRS), \
+    "Logical Shift Right by Immediate", \
+    { REGD##V = SAT(ACCSRC ACC fLSHIFTR(REGS##V,uiV,REGSTYPE)); }) \
+\
+Q6INSN(S2_asl_i_##TAGEND,#REGD "32" #ACC "=asl(" #REGS "32,#u" #SIZE ")" #SATOPT,ATTRIBS(ATTRS), \
+    "Shift Left by Immediate", \
+    { REGD##V = SAT(ACCSRC ACC fASHIFTL(REGS##V,uiV,REGSTYPE)); }) \
+Q6INSN(S6_rol_i_##TAGEND,#REGD "32" #ACC "=rol(" #REGS "32,#u" #SIZE ")" #SATOPT,ATTRIBS(ATTRS), \
+    "Rotate Left by Immediate", \
+    { REGD##V = SAT(ACCSRC ACC fROTL(REGS##V,uiV,REGSTYPE)); })
+
+
+#define ISHIFTTYPES_ONLY_ASL(TAGEND,SIZE,REGD,REGS,REGSTYPE,ACC,ACCSRC,SAT,SATOPT) \
+Q6INSN(S2_asl_i_##TAGEND,#REGD "32" #ACC "=asl(" #REGS "32,#u" #SIZE ")" #SATOPT,ATTRIBS(), \
+    "", \
+    { REGD##V = SAT(ACCSRC ACC fASHIFTL(REGS##V,uiV,REGSTYPE)); })
+
+#define ISHIFTTYPES_ONLY_ASR(TAGEND,SIZE,REGD,REGS,REGSTYPE,ACC,ACCSRC,SAT,SATOPT) \
+Q6INSN(S2_asr_i_##TAGEND,#REGD "32" #ACC "=asr(" #REGS "32,#u" #SIZE ")" #SATOPT,ATTRIBS(), \
+    "", \
+    { REGD##V = SAT(ACCSRC ACC fASHIFTR(REGS##V,uiV,REGSTYPE)); })
+
+
+#define ISHIFTTYPES_NOASR(TAGEND,SIZE,REGD,REGS,REGSTYPE,ACC,ACCSRC,SAT,SATOPT) \
+Q6INSN(S2_lsr_i_##TAGEND,#REGD "32" #ACC "=lsr(" #REGS "32,#u" #SIZE ")" #SATOPT,ATTRIBS(), \
+    "Logical Shift Right by Register", \
+    { REGD##V = SAT(ACCSRC ACC fLSHIFTR(REGS##V,uiV,REGSTYPE)); }) \
+Q6INSN(S2_asl_i_##TAGEND,#REGD "32" #ACC "=asl(" #REGS "32,#u" #SIZE ")" #SATOPT,ATTRIBS(), \
+    "Shift Left by Register", \
+    { REGD##V = SAT(ACCSRC ACC fASHIFTL(REGS##V,uiV,REGSTYPE)); }) \
+Q6INSN(S6_rol_i_##TAGEND,#REGD "32" #ACC "=rol(" #REGS "32,#u" #SIZE ")" #SATOPT,ATTRIBS(), \
+    "Rotate Left by Immediate", \
+    { REGD##V = SAT(ACCSRC ACC fROTL(REGS##V,uiV,REGSTYPE)); })
+
+
+
+ISHIFTTYPES(r,5,Rd,Rs,4_4,,,fECHO,,)
+ISHIFTTYPES(p,6,Rdd,Rss,8_8,,,fECHO,,)
+ISHIFTTYPES(r_acc,5,Rx,Rs,4_4,+,RxV,fECHO,,)
+ISHIFTTYPES(p_acc,6,Rxx,Rss,8_8,+,RxxV,fECHO,,)
+ISHIFTTYPES(r_nac,5,Rx,Rs,4_4,-,RxV,fECHO,,)
+ISHIFTTYPES(p_nac,6,Rxx,Rss,8_8,-,RxxV,fECHO,,)
+
+ISHIFTTYPES_NOASR(r_xacc,5,Rx,Rs,4_4,^, RxV,fECHO,)
+ISHIFTTYPES_NOASR(p_xacc,6,Rxx,Rss,8_8,^, RxxV,fECHO,)
+
+ISHIFTTYPES(r_and,5,Rx,Rs,4_4,&,RxV,fECHO,,)
+ISHIFTTYPES(r_or,5,Rx,Rs,4_4,|,RxV,fECHO,,)
+ISHIFTTYPES(p_and,6,Rxx,Rss,8_8,&,RxxV,fECHO,,)
+ISHIFTTYPES(p_or,6,Rxx,Rss,8_8,|,RxxV,fECHO,,)
+
+ISHIFTTYPES_ONLY_ASL(r_sat,5,Rd,Rs,4_8,,,fSAT,:sat)
+
+
+Q6INSN(S2_asr_i_r_rnd,"Rd32=asr(Rs32,#u5):rnd",ATTRIBS(),
+       "Shift right with round",
+       { RdV = fASHIFTR(((fASHIFTR(RsV,uiV,4_8))+1),1,8_8); })
+
+
+Q6INSN(S2_asr_i_p_rnd,"Rdd32=asr(Rss32,#u6):rnd",ATTRIBS(), "Shift right with round",
+{ fHIDE(size8u_t tmp;)
+  fHIDE(size8u_t rnd;)
+  tmp = fASHIFTR(RssV,uiV,8_8);
+  rnd = tmp & 1;
+  RddV = fASHIFTR(tmp,1,8_8) + rnd; })
+
+
+Q6INSN(S4_lsli,"Rd32=lsl(#s6,Rt32)",ATTRIBS(), "Shift an immediate left by register amount",
+{
+    fHIDE(size4s_t) shamt = fSXTN(7,32,RtV);
+    RdV = fBIDIR_LSHIFTL(siV,shamt,4_8);
+})
+
+
+
+
+Q6INSN(S2_addasl_rrri,"Rd32=addasl(Rt32,Rs32,#u3)",ATTRIBS(),
+    "Shift left by small amount and add",
+    { RdV = RtV + fASHIFTL(RsV,uiV,4_4); })
+
+
+
+#define SHIFTOPI(TAGEND,INNEROP,INNERSEM)\
+Q6INSN(S4_andi_##TAGEND,"Rx32=and(#u8,"INNEROP")",,"Shift-op",{RxV=fIMMEXT(uiV)&INNERSEM;})\
+Q6INSN(S4_ori_##TAGEND, "Rx32=or(#u8,"INNEROP")",,"Shift-op",{RxV=fIMMEXT(uiV)|INNERSEM;})\
+Q6INSN(S4_addi_##TAGEND,"Rx32=add(#u8,"INNEROP")",,"Shift-op",{RxV=fIMMEXT(uiV)+INNERSEM;})\
+Q6INSN(S4_subi_##TAGEND,"Rx32=sub(#u8,"INNEROP")",,"Shift-op",{RxV=fIMMEXT(uiV)-INNERSEM;})
+
+
+SHIFTOPI(asl_ri,"asl(Rx32,#U5)",(RxV<<UiV))
+SHIFTOPI(lsr_ri,"lsr(Rx32,#U5)",(((unsigned int)RxV)>>UiV))
+
+
+/**********************************************/
+/* PERMUTES                                   */
+/**********************************************/
+Q6INSN(S2_valignib,"Rdd32=valignb(Rtt32,Rss32,#u3)",
+ATTRIBS(), "Vector align bytes",
+{
+  RddV = (fLSHIFTR(RssV,uiV*8,8_8))|(fASHIFTL(RttV,((8-uiV)*8),8_8));
+})
+
+Q6INSN(S2_valignrb,"Rdd32=valignb(Rtt32,Rss32,Pu4)",
+ATTRIBS(), "Align with register",
+{ RddV = fLSHIFTR(RssV,(PuV&0x7)*8,8_8)|(fASHIFTL(RttV,(8-(PuV&0x7))*8,8_8));})
+
+Q6INSN(S2_vspliceib,"Rdd32=vspliceb(Rss32,Rtt32,#u3)",
+ATTRIBS(), "Vector splice bytes",
+{ RddV = fASHIFTL(RttV,uiV*8,8_8) | fZXTN(uiV*8,64,RssV); })
+
+Q6INSN(S2_vsplicerb,"Rdd32=vspliceb(Rss32,Rtt32,Pu4)",
+ATTRIBS(), "Splice with register",
+{ RddV = fASHIFTL(RttV,(PuV&7)*8,8_8) | fZXTN((PuV&7)*8,64,RssV); })
+
+Q6INSN(S2_vsplatrh,"Rdd32=vsplath(Rs32)",
+ATTRIBS(), "Vector splat halfwords from register",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV, fGETHALF(0,RsV));
+    }
+})
+
+
+Q6INSN(S2_vsplatrb,"Rd32=vsplatb(Rs32)",
+ATTRIBS(), "Vector splat bytes from register",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETBYTE(i,RdV, fGETBYTE(0,RsV));
+    }
+})
+
+Q6INSN(S6_vsplatrbp,"Rdd32=vsplatb(Rs32)",
+ATTRIBS(), "Vector splat bytes from register",
+{
+    fHIDE(int i;)
+    for (i=0;i<8;i++) {
+        fSETBYTE(i,RddV, fGETBYTE(0,RsV));
+    }
+})
+
+
+
+/**********************************************/
+/* Insert/Extract[u]                          */
+/**********************************************/
+
+Q6INSN(S2_insert,"Rx32=insert(Rs32,#u5,#U5)",
+ATTRIBS(), "Insert bits",
+{
+    fHIDE(int) width=uiV;
+    fHIDE(int) offset=UiV;
+    /* clear bits in Rxx where new bits go */
+    RxV &= ~(((fCONSTLL(1)<<width)-1)<<offset);
+    /* OR in new bits */
+    RxV |= ((RsV & ((fCONSTLL(1)<<width)-1)) << offset);
+})
+
+
+Q6INSN(S2_tableidxb,"Rx32=tableidxb(Rs32,#u4,#S6):raw",
+ATTRIBS(A_ARCHV2), "Extract and insert bits",
+{
+        fHIDE(int) width=uiV;
+        fHIDE(int) offset=SiV;
+        fHIDE(int) field = fEXTRACTU_BIDIR(RsV,width,offset);
+        fINSERT_BITS(RxV,width,0,field);
+})
+
+Q6INSN(S2_tableidxh,"Rx32=tableidxh(Rs32,#u4,#S6):raw",
+ATTRIBS(A_ARCHV2), "Extract and insert bits",
+{
+        fHIDE(int) width=uiV;
+        fHIDE(int) offset=SiV+1;
+        fHIDE(int) field = fEXTRACTU_BIDIR(RsV,width,offset);
+        fINSERT_BITS(RxV,width,1,field);
+})
+
+Q6INSN(S2_tableidxw,"Rx32=tableidxw(Rs32,#u4,#S6):raw",
+ATTRIBS(A_ARCHV2), "Extract and insert bits",
+{
+        fHIDE(int) width=uiV;
+        fHIDE(int) offset=SiV+2;
+        fHIDE(int) field = fEXTRACTU_BIDIR(RsV,width,offset);
+        fINSERT_BITS(RxV,width,2,field);
+})
+
+Q6INSN(S2_tableidxd,"Rx32=tableidxd(Rs32,#u4,#S6):raw",
+ATTRIBS(A_ARCHV2), "Extract and insert bits",
+{
+    fHIDE(int) width=uiV;
+    fHIDE(int) offset=SiV+3;
+    fHIDE(int) field = fEXTRACTU_BIDIR(RsV,width,offset);
+    fINSERT_BITS(RxV,width,3,field);
+})
+
+
+Q6INSN(A4_bitspliti,"Rdd32=bitsplit(Rs32,#u5)",
+ATTRIBS(), "Split a bitfield into two registers",
+{
+    fSETWORD(1,RddV,(fCAST4_4u(RsV)>>uiV));
+    fSETWORD(0,RddV,fZXTN(uiV,32,RsV));
+})
+
+Q6INSN(A4_bitsplit,"Rdd32=bitsplit(Rs32,Rt32)",
+ATTRIBS(), "Split a bitfield into two registers",
+{
+    fHIDE(size4u_t) shamt = fZXTN(5,32,RtV);
+    fSETWORD(1,RddV,(fCAST4_4u(RsV)>>shamt));
+    fSETWORD(0,RddV,fZXTN(shamt,32,RsV));
+})
+
+
+
+
+Q6INSN(S4_extract,"Rd32=extract(Rs32,#u5,#U5)",
+ATTRIBS(), "Extract signed bitfield",
+{
+    fHIDE(int) width=uiV;
+    fHIDE(int) offset=UiV;
+    RdV = fSXTN(width,32,(fCAST4_4u(RsV) >> offset));
+})
+
+
+Q6INSN(S2_extractu,"Rd32=extractu(Rs32,#u5,#U5)",
+ATTRIBS(), "Extract unsigned bitfield",
+{
+    fHIDE(int) width=uiV;
+    fHIDE(int) offset=UiV;
+    RdV = fZXTN(width,32,(fCAST4_4u(RsV) >> offset));
+})
+
+Q6INSN(S2_insertp,"Rxx32=insert(Rss32,#u6,#U6)",
+ATTRIBS(), "Insert bits",
+{
+    fHIDE(int) width=uiV;
+    fHIDE(int) offset=UiV;
+    /* clear bits in Rxx where new bits go */
+    RxxV &= ~(((fCONSTLL(1)<<width)-1)<<offset);
+    /* OR in new bits */
+    RxxV |= ((RssV & ((fCONSTLL(1)<<width)-1)) << offset);
+})
+
+
+Q6INSN(S4_extractp,"Rdd32=extract(Rss32,#u6,#U6)",
+ATTRIBS(), "Extract signed bitfield",
+{
+    fHIDE(int) width=uiV;
+    fHIDE(int) offset=UiV;
+    RddV = fSXTN(width,64,(fCAST8_8u(RssV) >> offset));
+})
+
+
+Q6INSN(S2_extractup,"Rdd32=extractu(Rss32,#u6,#U6)",
+ATTRIBS(), "Extract unsigned bitfield",
+{
+    fHIDE(int) width=uiV;
+    fHIDE(int) offset=UiV;
+    RddV = fZXTN(width,64,(fCAST8_8u(RssV) >> offset));
+})
+
+
+
+
+Q6INSN(S2_mask,"Rd32=mask(#u5,#U5)",
+ATTRIBS(), "Form mask from immediate",
+{
+    RdV = ((1<<uiV)-1) << UiV;
+})
+
+
+
+
+
+Q6INSN(S2_insert_rp,"Rx32=insert(Rs32,Rtt32)",
+ATTRIBS(), "Insert bits",
+{
+    fHIDE(int) width=fZXTN(6,32,(fGETWORD(1,RttV)));
+    fHIDE(int) offset=fSXTN(7,32,(fGETWORD(0,RttV)));
+    fHIDE(size8u_t) mask = ((fCONSTLL(1)<<width)-1);
+    if (offset < 0) {
+        RxV = 0;
+    } else {
+        /* clear bits in Rxx where new bits go */
+        RxV &= ~(mask<<offset);
+        /* OR in new bits */
+        RxV |= ((RsV & mask) << offset);
+    }
+})
+
+
+Q6INSN(S4_extract_rp,"Rd32=extract(Rs32,Rtt32)",
+ATTRIBS(), "Extract signed bitfield",
+{
+    fHIDE(int) width=fZXTN(6,32,(fGETWORD(1,RttV)));
+    fHIDE(int) offset=fSXTN(7,32,(fGETWORD(0,RttV)));
+    RdV = fSXTN(width,64,fBIDIR_LSHIFTR(fCAST4_8u(RsV),offset,4_8));
+})
+
+
+
+Q6INSN(S2_extractu_rp,"Rd32=extractu(Rs32,Rtt32)",
+ATTRIBS(), "Extract unsigned bitfield",
+{
+    fHIDE(int) width=fZXTN(6,32,(fGETWORD(1,RttV)));
+    fHIDE(int) offset=fSXTN(7,32,(fGETWORD(0,RttV)));
+    RdV = fZXTN(width,64,fBIDIR_LSHIFTR(fCAST4_8u(RsV),offset,4_8));
+})
+
+Q6INSN(S2_insertp_rp,"Rxx32=insert(Rss32,Rtt32)",
+ATTRIBS(), "Insert bits",
+{
+    fHIDE(int) width=fZXTN(6,32,(fGETWORD(1,RttV)));
+    fHIDE(int) offset=fSXTN(7,32,(fGETWORD(0,RttV)));
+    fHIDE(size8u_t) mask = ((fCONSTLL(1)<<width)-1);
+    if (offset < 0) {
+        RxxV = 0;
+    } else {
+        /* clear bits in Rxx where new bits go */
+        RxxV &= ~(mask<<offset);
+        /* OR in new bits */
+        RxxV |= ((RssV & mask) << offset);
+    }
+})
+
+
+Q6INSN(S4_extractp_rp,"Rdd32=extract(Rss32,Rtt32)",
+ATTRIBS(), "Extract signed bitfield",
+{
+    fHIDE(int) width=fZXTN(6,32,(fGETWORD(1,RttV)));
+    fHIDE(int) offset=fSXTN(7,32,(fGETWORD(0,RttV)));
+    RddV = fSXTN(width,64,fBIDIR_LSHIFTR(fCAST8_8u(RssV),offset,8_8));
+})
+
+
+Q6INSN(S2_extractup_rp,"Rdd32=extractu(Rss32,Rtt32)",
+ATTRIBS(), "Extract unsigned bitfield",
+{
+    fHIDE(int) width=fZXTN(6,32,(fGETWORD(1,RttV)));
+    fHIDE(int) offset=fSXTN(7,32,(fGETWORD(0,RttV)));
+    RddV = fZXTN(width,64,fBIDIR_LSHIFTR(fCAST8_8u(RssV),offset,8_8));
+})
+
+/**********************************************/
+/* tstbit/setbit/clrbit                       */
+/**********************************************/
+
+Q6INSN(S2_tstbit_i,"Pd4=tstbit(Rs32,#u5)",
+ATTRIBS(), "Test a bit",
+{
+    PdV = f8BITSOF((RsV & (1<<uiV)) != 0);
+})
+
+Q6INSN(S4_ntstbit_i,"Pd4=!tstbit(Rs32,#u5)",
+ATTRIBS(), "Test a bit",
+{
+    PdV = f8BITSOF((RsV & (1<<uiV)) == 0);
+})
+
+Q6INSN(S2_setbit_i,"Rd32=setbit(Rs32,#u5)",
+ATTRIBS(), "Set a bit",
+{
+    RdV = (RsV | (1<<uiV));
+})
+
+Q6INSN(S2_togglebit_i,"Rd32=togglebit(Rs32,#u5)",
+ATTRIBS(), "Toggle a bit",
+{
+    RdV = (RsV ^ (1<<uiV));
+})
+
+Q6INSN(S2_clrbit_i,"Rd32=clrbit(Rs32,#u5)",
+ATTRIBS(), "Clear a bit",
+{
+    RdV = (RsV & (~(1<<uiV)));
+})
+
+
+
+/* using a register */
+Q6INSN(S2_tstbit_r,"Pd4=tstbit(Rs32,Rt32)",
+ATTRIBS(), "Test a bit",
+{
+    PdV = f8BITSOF((fCAST4_8u(RsV) & fBIDIR_LSHIFTL(1,fSXTN(7,32,RtV),4_8)) != 0);
+})
+
+Q6INSN(S4_ntstbit_r,"Pd4=!tstbit(Rs32,Rt32)",
+ATTRIBS(), "Test a bit",
+{
+    PdV = f8BITSOF((fCAST4_8u(RsV) & fBIDIR_LSHIFTL(1,fSXTN(7,32,RtV),4_8)) == 0);
+})
+
+Q6INSN(S2_setbit_r,"Rd32=setbit(Rs32,Rt32)",
+ATTRIBS(), "Set a bit",
+{
+    RdV = (RsV | fBIDIR_LSHIFTL(1,fSXTN(7,32,RtV),4_8));
+})
+
+Q6INSN(S2_togglebit_r,"Rd32=togglebit(Rs32,Rt32)",
+ATTRIBS(), "Toggle a bit",
+{
+    RdV = (RsV ^ fBIDIR_LSHIFTL(1,fSXTN(7,32,RtV),4_8));
+})
+
+Q6INSN(S2_clrbit_r,"Rd32=clrbit(Rs32,Rt32)",
+ATTRIBS(), "Clear a bit",
+{
+    RdV = (RsV & (~(fBIDIR_LSHIFTL(1,fSXTN(7,32,RtV),4_8))));
+})
+
+
+/**********************************************/
+/* vector shifting                            */
+/**********************************************/
+
+/* Half Vector Immediate Shifts */
+
+Q6INSN(S2_asr_i_vh,"Rdd32=vasrh(Rss32,#u4)",ATTRIBS(),
+    "Vector Arithmetic Shift Right by Immediate",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV, (fGETHALF(i,RssV)>>uiV));
+    }
+})
+
+
+Q6INSN(S2_lsr_i_vh,"Rdd32=vlsrh(Rss32,#u4)",ATTRIBS(),
+    "Vector Logical Shift Right by Immediate",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV, (fGETUHALF(i,RssV)>>uiV));
+    }
+})
+
+Q6INSN(S2_asl_i_vh,"Rdd32=vaslh(Rss32,#u4)",ATTRIBS(),
+    "Vector Arithmetic Shift Left by Immediate",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV, (fGETHALF(i,RssV)<<uiV));
+    }
+})
+
+/* Half Vector Register Shifts */
+
+Q6INSN(S2_asr_r_vh,"Rdd32=vasrh(Rss32,Rt32)",ATTRIBS(),
+    "Vector Arithmetic Shift Right by Register",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV, fBIDIR_ASHIFTR(fGETHALF(i,RssV),fSXTN(7,32,RtV),2_8));
+    }
+})
+
+Q6INSN(S5_asrhub_rnd_sat,"Rd32=vasrhub(Rss32,#u4):raw",,
+    "Vector Arithmetic Shift Right by Immediate with Round, Saturate, and Pack",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETBYTE(i,RdV, fSATUB( ((fGETHALF(i,RssV) >> uiV )+1)>>1  ));
+    }
+})
+
+Q6INSN(S5_asrhub_sat,"Rd32=vasrhub(Rss32,#u4):sat",,
+    "Vector Arithmetic Shift Right by Immediate with Saturate and Pack",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETBYTE(i,RdV, fSATUB( fGETHALF(i,RssV) >> uiV ));
+    }
+})
+
+
+
+Q6INSN(S5_vasrhrnd,"Rdd32=vasrh(Rss32,#u4):raw",,
+    "Vector Arithmetic Shift Right by Immediate with Round",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV, ( ((fGETHALF(i,RssV) >> uiV)+1)>>1  ));
+    }
+})
+
+
+Q6INSN(S2_asl_r_vh,"Rdd32=vaslh(Rss32,Rt32)",ATTRIBS(),
+    "Vector Arithmetic Shift Left by Register",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV, fBIDIR_ASHIFTL(fGETHALF(i,RssV),fSXTN(7,32,RtV),2_8));
+    }
+})
+
+
+
+Q6INSN(S2_lsr_r_vh,"Rdd32=vlsrh(Rss32,Rt32)",ATTRIBS(),
+    "Vector Logical Shift Right by Register",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV, fBIDIR_LSHIFTR(fGETUHALF(i,RssV),fSXTN(7,32,RtV),2_8));
+    }
+})
+
+
+Q6INSN(S2_lsl_r_vh,"Rdd32=vlslh(Rss32,Rt32)",ATTRIBS(),
+    "Vector Logical Shift Left by Register",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV, fBIDIR_LSHIFTL(fGETUHALF(i,RssV),fSXTN(7,32,RtV),2_8));
+    }
+})
+
+
+
+
+/* Word Vector Immediate Shifts */
+
+Q6INSN(S2_asr_i_vw,"Rdd32=vasrw(Rss32,#u5)",ATTRIBS(),
+    "Vector Arithmetic Shift Right by Immediate",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETWORD(i,RddV,(fGETWORD(i,RssV)>>uiV));
+    }
+})
+
+
+
+Q6INSN(S2_asr_i_svw_trun,"Rd32=vasrw(Rss32,#u5)",ATTRIBS(A_ARCHV2),
+    "Vector Arithmetic Shift Right by Immediate with Truncate and Pack",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETHALF(i,RdV,fGETHALF(0,(fGETWORD(i,RssV)>>uiV)));
+    }
+})
+
+Q6INSN(S2_asr_r_svw_trun,"Rd32=vasrw(Rss32,Rt32)",ATTRIBS(A_ARCHV2),
+    "Vector Arithmetic Shift Right truncate and Pack",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETHALF(i,RdV,fGETHALF(0,fBIDIR_ASHIFTR(fGETWORD(i,RssV),fSXTN(7,32,RtV),4_8)));
+    }
+})
+
+
+Q6INSN(S2_lsr_i_vw,"Rdd32=vlsrw(Rss32,#u5)",ATTRIBS(),
+    "Vector Logical Shift Right by Immediate",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETWORD(i,RddV,(fGETUWORD(i,RssV)>>uiV));
+    }
+})
+
+Q6INSN(S2_asl_i_vw,"Rdd32=vaslw(Rss32,#u5)",ATTRIBS(),
+    "Vector Arithmetic Shift Left by Immediate",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETWORD(i,RddV,(fGETWORD(i,RssV)<<uiV));
+    }
+})
+
+/* Word Vector Register Shifts */
+
+Q6INSN(S2_asr_r_vw,"Rdd32=vasrw(Rss32,Rt32)",ATTRIBS(),
+    "Vector Arithmetic Shift Right by Register",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETWORD(i,RddV, fBIDIR_ASHIFTR(fGETWORD(i,RssV),fSXTN(7,32,RtV),4_8));
+    }
+})
+
+
+
+Q6INSN(S2_asl_r_vw,"Rdd32=vaslw(Rss32,Rt32)",ATTRIBS(),
+    "Vector Arithmetic Shift Left by Register",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETWORD(i,RddV, fBIDIR_ASHIFTL(fGETWORD(i,RssV),fSXTN(7,32,RtV),4_8));
+    }
+})
+
+
+Q6INSN(S2_lsr_r_vw,"Rdd32=vlsrw(Rss32,Rt32)",ATTRIBS(),
+    "Vector Logical Shift Right by Register",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETWORD(i,RddV, fBIDIR_LSHIFTR(fGETUWORD(i,RssV),fSXTN(7,32,RtV),4_8));
+    }
+})
+
+
+
+Q6INSN(S2_lsl_r_vw,"Rdd32=vlslw(Rss32,Rt32)",ATTRIBS(),
+    "Vector Logical Shift Left by Register",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETWORD(i,RddV, fBIDIR_LSHIFTL(fGETUWORD(i,RssV),fSXTN(7,32,RtV),4_8));
+    }
+})
+
+
+
+
+
+/**********************************************/
+/* Vector SXT/ZXT/SAT/TRUN/RNDPACK            */
+/**********************************************/
+
+
+Q6INSN(S2_vrndpackwh,"Rd32=vrndwh(Rss32)",ATTRIBS(),
+"Round and Pack vector of words to Halfwords",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETHALF(i,RdV,fGETHALF(1,(fGETWORD(i,RssV)+0x08000)));
+    }
+})
+
+Q6INSN(S2_vrndpackwhs,"Rd32=vrndwh(Rss32):sat",ATTRIBS(),
+"Round and Pack vector of words to Halfwords",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETHALF(i,RdV,fGETHALF(1,fSAT(fGETWORD(i,RssV)+0x08000)));
+    }
+})
+
+Q6INSN(S2_vsxtbh,"Rdd32=vsxtbh(Rs32)",ATTRIBS(A_ARCHV2),
+"Vector sign extend byte to half",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV,fGETBYTE(i,RsV));
+    }
+})
+
+Q6INSN(S2_vzxtbh,"Rdd32=vzxtbh(Rs32)",ATTRIBS(),
+"Vector zero extend byte to half",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV,fGETUBYTE(i,RsV));
+    }
+})
+
+Q6INSN(S2_vsathub,"Rd32=vsathub(Rss32)",ATTRIBS(),
+"Vector saturate half to unsigned byte",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETBYTE(i,RdV,fSATUN(8,fGETHALF(i,RssV)));
+    }
+})
+
+
+
+
+
+Q6INSN(S2_svsathub,"Rd32=vsathub(Rs32)",ATTRIBS(A_ARCHV2),
+"Vector saturate half to unsigned byte",
+{
+    fSETBYTE(0,RdV,fSATUN(8,fGETHALF(0,RsV)));
+    fSETBYTE(1,RdV,fSATUN(8,fGETHALF(1,RsV)));
+    fSETBYTE(2,RdV,0);
+    fSETBYTE(3,RdV,0);
+})
+
+Q6INSN(S2_svsathb,"Rd32=vsathb(Rs32)",ATTRIBS(A_ARCHV2),
+"Vector saturate half to signed byte",
+{
+    fSETBYTE(0,RdV,fSATN(8,fGETHALF(0,RsV)));
+    fSETBYTE(1,RdV,fSATN(8,fGETHALF(1,RsV)));
+    fSETBYTE(2,RdV,0);
+    fSETBYTE(3,RdV,0);
+})
+
+
+Q6INSN(S2_vsathb,"Rd32=vsathb(Rss32)",ATTRIBS(A_ARCHV2),
+"Vector saturate half to signed byte",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETBYTE(i,RdV,fSATN(8,fGETHALF(i,RssV)));
+    }
+})
+
+Q6INSN(S2_vtrunohb,"Rd32=vtrunohb(Rss32)",ATTRIBS(A_ARCHV2),
+"Vector truncate half to byte: take high",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETBYTE(i,RdV,fGETBYTE(i*2+1,RssV));
+    }
+})
+
+Q6INSN(S2_vtrunewh,"Rdd32=vtrunewh(Rss32,Rtt32)",ATTRIBS(A_ARCHV2),
+"Vector truncate word to half: take low",
+{
+    fSETHALF(0,RddV,fGETHALF(0,RttV));
+    fSETHALF(1,RddV,fGETHALF(2,RttV));
+    fSETHALF(2,RddV,fGETHALF(0,RssV));
+    fSETHALF(3,RddV,fGETHALF(2,RssV));
+})
+
+Q6INSN(S2_vtrunowh,"Rdd32=vtrunowh(Rss32,Rtt32)",ATTRIBS(A_ARCHV2),
+"Vector truncate word to half: take high",
+{
+    fSETHALF(0,RddV,fGETHALF(1,RttV));
+    fSETHALF(1,RddV,fGETHALF(3,RttV));
+    fSETHALF(2,RddV,fGETHALF(1,RssV));
+    fSETHALF(3,RddV,fGETHALF(3,RssV));
+})
+
+
+Q6INSN(S2_vtrunehb,"Rd32=vtrunehb(Rss32)",ATTRIBS(),
+"Vector truncate half to byte: take low",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETBYTE(i,RdV,fGETBYTE(i*2,RssV));
+    }
+})
+
+Q6INSN(S6_vtrunehb_ppp,"Rdd32=vtrunehb(Rss32,Rtt32)",ATTRIBS(),
+"Vector truncate half to byte: take low",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETBYTE(i,RddV,fGETBYTE(i*2,RttV));
+        fSETBYTE(i+4,RddV,fGETBYTE(i*2,RssV));
+    }
+})
+
+Q6INSN(S6_vtrunohb_ppp,"Rdd32=vtrunohb(Rss32,Rtt32)",ATTRIBS(),
+"Vector truncate half to byte: take high",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETBYTE(i,RddV,fGETBYTE(i*2+1,RttV));
+        fSETBYTE(i+4,RddV,fGETBYTE(i*2+1,RssV));
+    }
+})
+
+Q6INSN(S2_vsxthw,"Rdd32=vsxthw(Rs32)",ATTRIBS(),
+"Vector sign extend half to word",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETWORD(i,RddV,fGETHALF(i,RsV));
+    }
+})
+
+Q6INSN(S2_vzxthw,"Rdd32=vzxthw(Rs32)",ATTRIBS(),
+"Vector zero extend half to word",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETWORD(i,RddV,fGETUHALF(i,RsV));
+    }
+})
+
+
+Q6INSN(S2_vsatwh,"Rd32=vsatwh(Rss32)",ATTRIBS(),
+"Vector saturate word to signed half",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETHALF(i,RdV,fSATN(16,fGETWORD(i,RssV)));
+    }
+})
+
+Q6INSN(S2_vsatwuh,"Rd32=vsatwuh(Rss32)",ATTRIBS(),
+"Vector saturate word to unsigned half",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETHALF(i,RdV,fSATUN(16,fGETWORD(i,RssV)));
+    }
+})
+
+/* Other misc insns of this type */
+
+Q6INSN(S2_packhl,"Rdd32=packhl(Rs32,Rt32)",ATTRIBS(),
+"Pack high halfwords and low halfwords together",
+{
+    fSETHALF(0,RddV,fGETHALF(0,RtV));
+    fSETHALF(1,RddV,fGETHALF(0,RsV));
+    fSETHALF(2,RddV,fGETHALF(1,RtV));
+    fSETHALF(3,RddV,fGETHALF(1,RsV));
+})
+
+Q6INSN(A2_swiz,"Rd32=swiz(Rs32)",ATTRIBS(A_ARCHV2),
+"Endian swap the bytes of Rs",
+{
+    fSETBYTE(0,RdV,fGETBYTE(3,RsV));
+    fSETBYTE(1,RdV,fGETBYTE(2,RsV));
+    fSETBYTE(2,RdV,fGETBYTE(1,RsV));
+    fSETBYTE(3,RdV,fGETBYTE(0,RsV));
+})
+
+
+
+/* Vector Sat without Packing */
+Q6INSN(S2_vsathub_nopack,"Rdd32=vsathub(Rss32)",ATTRIBS(),
+"Vector saturate half to unsigned byte",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV,fSATUN(8,fGETHALF(i,RssV)));
+    }
+})
+
+Q6INSN(S2_vsathb_nopack,"Rdd32=vsathb(Rss32)",ATTRIBS(A_ARCHV2),
+"Vector saturate half to signed byte without pack",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETHALF(i,RddV,fSATN(8,fGETHALF(i,RssV)));
+    }
+})
+
+Q6INSN(S2_vsatwh_nopack,"Rdd32=vsatwh(Rss32)",ATTRIBS(),
+"Vector saturate word to signed half",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETWORD(i,RddV,fSATN(16,fGETWORD(i,RssV)));
+    }
+})
+
+Q6INSN(S2_vsatwuh_nopack,"Rdd32=vsatwuh(Rss32)",ATTRIBS(),
+"Vector saturate word to unsigned half",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETWORD(i,RddV,fSATUN(16,fGETWORD(i,RssV)));
+    }
+})
+
+
+/**********************************************/
+/* Shuffle                                    */
+/**********************************************/
+
+
+Q6INSN(S2_shuffob,"Rdd32=shuffob(Rtt32,Rss32)",ATTRIBS(),
+"Shuffle high bytes together",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETBYTE(i*2  ,RddV,fGETBYTE(i*2+1,RssV));
+        fSETBYTE(i*2+1,RddV,fGETBYTE(i*2+1,RttV));
+    }
+})
+
+Q6INSN(S2_shuffeb,"Rdd32=shuffeb(Rss32,Rtt32)",ATTRIBS(),
+"Shuffle low bytes together",
+{
+    fHIDE(int i;)
+    for (i=0;i<4;i++) {
+        fSETBYTE(i*2  ,RddV,fGETBYTE(i*2,RttV));
+        fSETBYTE(i*2+1,RddV,fGETBYTE(i*2,RssV));
+    }
+})
+
+Q6INSN(S2_shuffoh,"Rdd32=shuffoh(Rtt32,Rss32)",ATTRIBS(),
+"Shuffle high halves together",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETHALF(i*2  ,RddV,fGETHALF(i*2+1,RssV));
+        fSETHALF(i*2+1,RddV,fGETHALF(i*2+1,RttV));
+    }
+})
+
+Q6INSN(S2_shuffeh,"Rdd32=shuffeh(Rss32,Rtt32)",ATTRIBS(),
+"Shuffle low halves together",
+{
+    fHIDE(int i;)
+    for (i=0;i<2;i++) {
+        fSETHALF(i*2  ,RddV,fGETHALF(i*2,RttV));
+        fSETHALF(i*2+1,RddV,fGETHALF(i*2,RssV));
+    }
+})
+
+
+/**********************************************/
+/* Strange bit instructions                   */
+/**********************************************/
+
+Q6INSN(S5_popcountp,"Rd32=popcount(Rss32)",ATTRIBS(),
+"Population Count", { RdV = fCOUNTONES_8(RssV); })
+
+Q6INSN(S4_parity,"Rd32=parity(Rs32,Rt32)",,
+"Parity of Masked Value", { RdV = 1&fCOUNTONES_4(RsV & RtV); })
+
+Q6INSN(S2_parityp,"Rd32=parity(Rss32,Rtt32)",ATTRIBS(A_ARCHV2),
+"Parity of Masked Value", { RdV = 1&fCOUNTONES_8(RssV & RttV); })
+
+Q6INSN(S2_lfsp,"Rdd32=lfs(Rss32,Rtt32)",ATTRIBS(A_ARCHV2),
+"Parity of Masked Value", { RddV = (fCAST8u(RssV) >> 1) | (fCAST8u((1&fCOUNTONES_8(RssV & RttV)))<<63) ; })
+
+Q6INSN(S2_clbnorm,"Rd32=normamt(Rs32)",ATTRIBS(A_ARCHV2),
+"Count leading sign bits - 1", { if (RsV == 0) { RdV = 0; } else { RdV = (fMAX(fCL1_4(RsV),fCL1_4(~RsV)))-1;} })
+
+Q6INSN(S4_clbaddi,"Rd32=add(clb(Rs32),#s6)",ATTRIBS(A_ARCHV2),
+"Count leading sign bits then add signed number",
+{ RdV = (fMAX(fCL1_4(RsV),fCL1_4(~RsV)))+siV;} )
+
+Q6INSN(S4_clbpnorm,"Rd32=normamt(Rss32)",ATTRIBS(A_ARCHV2),
+"Count leading sign bits - 1", { if (RssV == 0) { RdV = 0; }
+else { RdV = (fMAX(fCL1_8(RssV),fCL1_8(~RssV)))-1;}})
+
+Q6INSN(S4_clbpaddi,"Rd32=add(clb(Rss32),#s6)",ATTRIBS(A_ARCHV2),
+"Count leading sign bits then add signed number",
+{ RdV = (fMAX(fCL1_8(RssV),fCL1_8(~RssV)))+siV;})
+
+
+Q6INSN(S2_clb,"Rd32=clb(Rs32)",ATTRIBS(),
+"Count leading bits", {RdV = fMAX(fCL1_4(RsV),fCL1_4(~RsV));})
+
+
+Q6INSN(S2_cl0,"Rd32=cl0(Rs32)",ATTRIBS(),
+"Count leading bits", {RdV = fCL1_4(~RsV);})
+
+Q6INSN(S2_cl1,"Rd32=cl1(Rs32)",ATTRIBS(),
+"Count leading bits", {RdV = fCL1_4(RsV);})
+
+Q6INSN(S2_clbp,"Rd32=clb(Rss32)",ATTRIBS(),
+"Count leading bits", {RdV = fMAX(fCL1_8(RssV),fCL1_8(~RssV));})
+
+Q6INSN(S2_cl0p,"Rd32=cl0(Rss32)",ATTRIBS(),
+"Count leading bits", {RdV = fCL1_8(~RssV);})
+
+Q6INSN(S2_cl1p,"Rd32=cl1(Rss32)",ATTRIBS(),
+"Count leading bits", {RdV = fCL1_8(RssV);})
+
+
+
+
+Q6INSN(S2_brev, "Rd32=brev(Rs32)",   ATTRIBS(A_ARCHV2), "Bit Reverse",{RdV = fBREV_4(RsV);})
+Q6INSN(S2_brevp,"Rdd32=brev(Rss32)", ATTRIBS(), "Bit Reverse",{RddV = fBREV_8(RssV);})
+Q6INSN(S2_ct0,  "Rd32=ct0(Rs32)",    ATTRIBS(A_ARCHV2), "Count Trailing",{RdV = fCL1_4(~fBREV_4(RsV));})
+Q6INSN(S2_ct1,  "Rd32=ct1(Rs32)",    ATTRIBS(A_ARCHV2), "Count Trailing",{RdV = fCL1_4(fBREV_4(RsV));})
+Q6INSN(S2_ct0p, "Rd32=ct0(Rss32)",   ATTRIBS(), "Count Trailing",{RdV = fCL1_8(~fBREV_8(RssV));})
+Q6INSN(S2_ct1p, "Rd32=ct1(Rss32)",   ATTRIBS(), "Count Trailing",{RdV = fCL1_8(fBREV_8(RssV));})
+
+
+Q6INSN(S2_interleave,"Rdd32=interleave(Rss32)",ATTRIBS(A_ARCHV2),"Interleave bits",
+{RddV = fINTERLEAVE(fGETWORD(1,RssV),fGETWORD(0,RssV));})
+
+Q6INSN(S2_deinterleave,"Rdd32=deinterleave(Rss32)",ATTRIBS(A_ARCHV2),"Interleave bits",
+{RddV = fDEINTERLEAVE(RssV);})
diff --git a/target/hexagon/imported/subinsns.idef b/target/hexagon/imported/subinsns.idef
new file mode 100644
index 0000000000..ec1c74f479
--- /dev/null
+++ b/target/hexagon/imported/subinsns.idef
@@ -0,0 +1,149 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * sub-instructions
+ */
+
+
+
+/*****************************************************************/
+/*                                                               */
+/*                       A-type subinsns                         */
+/*                                                               */
+/*****************************************************************/
+
+Q6INSN(SA1_addi,     "Rx16=add(Rx16,#s7)",    ATTRIBS(A_SUBINSN),"Add",        { fIMMEXT(siV); RxV=RxV+siV;})
+Q6INSN(SA1_tfr,      "Rd16=Rs16",             ATTRIBS(A_SUBINSN),"Tfr",        { RdV=RsV;})
+Q6INSN(SA1_seti,     "Rd16=#u6",              ATTRIBS(A_SUBINSN),"Set immed",  { fIMMEXT(uiV); RdV=uiV;})
+Q6INSN(SA1_setin1,   "Rd16=#-1",              ATTRIBS(A_SUBINSN),"Set to -1",  { RdV=-1;})
+Q6INSN(SA1_clrtnew,  "if (p0.new) Rd16=#0",   ATTRIBS(A_SUBINSN),"clear if true", { if (fLSBNEW0) {RdV=0;} else {CANCEL;} })
+Q6INSN(SA1_clrfnew,  "if (!p0.new) Rd16=#0",  ATTRIBS(A_SUBINSN),"clear if false",{ if (fLSBNEW0NOT) {RdV=0;} else {CANCEL;} })
+Q6INSN(SA1_clrt,     "if (p0) Rd16=#0",       ATTRIBS(A_SUBINSN),"clear if true", { if (fLSBOLD(fREAD_P0())) {RdV=0;} else {CANCEL;} })
+Q6INSN(SA1_clrf,     "if (!p0) Rd16=#0",      ATTRIBS(A_SUBINSN),"clear if false",{ if (fLSBOLDNOT(fREAD_P0())) {RdV=0;} else {CANCEL;} })
+
+Q6INSN(SA1_addsp,    "Rd16=add(r29,#u6:2)",   ATTRIBS(A_SUBINSN),"Add",        { RdV=fREAD_SP()+uiV; })
+Q6INSN(SA1_inc,      "Rd16=add(Rs16,#1)",     ATTRIBS(A_SUBINSN),"Inc",        { RdV=RsV+1;})
+Q6INSN(SA1_dec,      "Rd16=add(Rs16,#-1)",    ATTRIBS(A_SUBINSN),"Dec",        { RdV=RsV-1;})
+Q6INSN(SA1_addrx,    "Rx16=add(Rx16,Rs16)",   ATTRIBS(A_SUBINSN),"Add",        { RxV=RxV+RsV; })
+Q6INSN(SA1_zxtb,     "Rd16=and(Rs16,#255)",   ATTRIBS(A_SUBINSN),"Zxtb",       { RdV= fZXTN(8,32,RsV);})
+Q6INSN(SA1_and1,     "Rd16=and(Rs16,#1)",     ATTRIBS(A_SUBINSN),"And #1",     { RdV= RsV&1;})
+Q6INSN(SA1_sxtb,     "Rd16=sxtb(Rs16)",       ATTRIBS(A_SUBINSN),"Sxtb",       { RdV= fSXTN(8,32,RsV);})
+Q6INSN(SA1_zxth,     "Rd16=zxth(Rs16)",       ATTRIBS(A_SUBINSN),"Zxth",       { RdV= fZXTN(16,32,RsV);})
+Q6INSN(SA1_sxth,     "Rd16=sxth(Rs16)",       ATTRIBS(A_SUBINSN),"Sxth",       { RdV= fSXTN(16,32,RsV);})
+Q6INSN(SA1_combinezr,"Rdd8=combine(#0,Rs16)", ATTRIBS(A_SUBINSN),"Combines",   { fSETWORD(0,RddV,RsV); fSETWORD(1,RddV,0); })
+Q6INSN(SA1_combinerz,"Rdd8=combine(Rs16,#0)", ATTRIBS(A_SUBINSN),"Combines",   { fSETWORD(0,RddV,0); fSETWORD(1,RddV,RsV); })
+Q6INSN(SA1_combine0i,"Rdd8=combine(#0,#u2)", ATTRIBS(A_SUBINSN),"Combines",   { fSETWORD(0,RddV,uiV); fSETWORD(1,RddV,0); })
+Q6INSN(SA1_combine1i,"Rdd8=combine(#1,#u2)", ATTRIBS(A_SUBINSN),"Combines",   { fSETWORD(0,RddV,uiV); fSETWORD(1,RddV,1); })
+Q6INSN(SA1_combine2i,"Rdd8=combine(#2,#u2)", ATTRIBS(A_SUBINSN),"Combines",   { fSETWORD(0,RddV,uiV); fSETWORD(1,RddV,2); })
+Q6INSN(SA1_combine3i,"Rdd8=combine(#3,#u2)", ATTRIBS(A_SUBINSN),"Combines",   { fSETWORD(0,RddV,uiV); fSETWORD(1,RddV,3); })
+Q6INSN(SA1_cmpeqi,   "p0=cmp.eq(Rs16,#u2)",   ATTRIBS(A_SUBINSN),"CompareImmed",{fWRITE_P0(f8BITSOF(RsV==uiV));})
+
+
+
+
+/*****************************************************************/
+/*                                                               */
+/*                       Ld1/2 subinsns                          */
+/*                                                               */
+/*****************************************************************/
+
+Q6INSN(SL1_loadri_io,  "Rd16=memw(Rs16+#u4:2)", ATTRIBS(A_LOAD,A_SUBINSN),"load word", {fEA_RI(RsV,uiV); fLOAD(1,4,u,EA,RdV);})
+Q6INSN(SL1_loadrub_io, "Rd16=memub(Rs16+#u4:0)",ATTRIBS(A_LOAD,A_SUBINSN),"load byte", {fEA_RI(RsV,uiV); fLOAD(1,1,u,EA,RdV);})
+
+Q6INSN(SL2_loadrh_io,  "Rd16=memh(Rs16+#u3:1)", ATTRIBS(A_LOAD,A_SUBINSN),"load half", {fEA_RI(RsV,uiV); fLOAD(1,2,s,EA,RdV);})
+Q6INSN(SL2_loadruh_io, "Rd16=memuh(Rs16+#u3:1)",ATTRIBS(A_LOAD,A_SUBINSN),"load half", {fEA_RI(RsV,uiV); fLOAD(1,2,u,EA,RdV);})
+Q6INSN(SL2_loadrb_io,  "Rd16=memb(Rs16+#u3:0)", ATTRIBS(A_LOAD,A_SUBINSN),"load byte", {fEA_RI(RsV,uiV); fLOAD(1,1,s,EA,RdV);})
+Q6INSN(SL2_loadri_sp,  "Rd16=memw(r29+#u5:2)",  ATTRIBS(A_LOAD,A_SUBINSN),"load word", {fEA_RI(fREAD_SP(),uiV); fLOAD(1,4,u,EA,RdV);})
+Q6INSN(SL2_loadrd_sp,  "Rdd8=memd(r29+#u5:3)", ATTRIBS(A_LOAD,A_SUBINSN),"load dword",{fEA_RI(fREAD_SP(),uiV); fLOAD(1,8,u,EA,RddV);})
+
+Q6INSN(SL2_deallocframe,"deallocframe", ATTRIBS(A_SUBINSN,A_LOAD), "Deallocate stack frame",
+{ fHIDE(size8u_t tmp;) fEA_REG(fREAD_FP());
+  fLOAD(1,8,u,EA,tmp);
+  tmp = fFRAME_UNSCRAMBLE(tmp);
+  fWRITE_LR(fGETWORD(1,tmp));
+  fWRITE_FP(fGETWORD(0,tmp));
+  fWRITE_SP(EA+8); })
+
+Q6INSN(SL2_return,"dealloc_return", ATTRIBS(A_JINDIR,A_SUBINSN,A_LOAD,A_RETURN,A_RESTRICT_SLOT0ONLY), "Deallocate stack frame and return",
+{ fHIDE(size8u_t tmp;) fEA_REG(fREAD_FP());
+  fLOAD(1,8,u,EA,tmp);
+  tmp = fFRAME_UNSCRAMBLE(tmp);
+  fWRITE_LR(fGETWORD(1,tmp));
+  fWRITE_FP(fGETWORD(0,tmp));
+  fWRITE_SP(EA+8);
+  fJUMPR(REG_LR,fGETWORD(1,tmp),COF_TYPE_JUMPR);})
+
+Q6INSN(SL2_return_t,"if (p0) dealloc_return", ATTRIBS(A_JINDIROLD,A_SUBINSN,A_LOAD,A_RETURN,A_RESTRICT_SLOT0ONLY), "Deallocate stack frame and return",
+{ fHIDE(size8u_t tmp;); fBRANCH_SPECULATE_STALL(fLSBOLD(fREAD_P0()),, SPECULATE_NOT_TAKEN,4,0); fEA_REG(fREAD_FP()); if (fLSBOLD(fREAD_P0())) { fLOAD(1,8,u,EA,tmp); tmp = fFRAME_UNSCRAMBLE(tmp); fWRITE_LR(fGETWORD(1,tmp)); fWRITE_FP(fGETWORD(0,tmp)); fWRITE_SP(EA+8);
+  fJUMPR(REG_LR,fGETWORD(1,tmp),COF_TYPE_JUMPR);} else {LOAD_CANCEL(EA);} })
+
+Q6INSN(SL2_return_f,"if (!p0) dealloc_return", ATTRIBS(A_JINDIROLD,A_SUBINSN,A_LOAD,A_RETURN,A_RESTRICT_SLOT0ONLY), "Deallocate stack frame and return",
+{ fHIDE(size8u_t tmp;);fBRANCH_SPECULATE_STALL(fLSBOLDNOT(fREAD_P0()),, SPECULATE_NOT_TAKEN,4,0); fEA_REG(fREAD_FP()); if (fLSBOLDNOT(fREAD_P0())) { fLOAD(1,8,u,EA,tmp); tmp = fFRAME_UNSCRAMBLE(tmp); fWRITE_LR(fGETWORD(1,tmp)); fWRITE_FP(fGETWORD(0,tmp)); fWRITE_SP(EA+8);
+  fJUMPR(REG_LR,fGETWORD(1,tmp),COF_TYPE_JUMPR);} else {LOAD_CANCEL(EA);} })
+
+
+
+Q6INSN(SL2_return_tnew,"if (p0.new) dealloc_return:nt", ATTRIBS(A_JINDIRNEW,A_SUBINSN,A_LOAD,A_RETURN,A_RESTRICT_SLOT0ONLY), "Deallocate stack frame and return",
+{ fHIDE(size8u_t tmp;) fBRANCH_SPECULATE_STALL(fLSBNEW0,, SPECULATE_NOT_TAKEN , 4,3); fEA_REG(fREAD_FP()); if (fLSBNEW0) { fLOAD(1,8,u,EA,tmp); tmp = fFRAME_UNSCRAMBLE(tmp); fWRITE_LR(fGETWORD(1,tmp)); fWRITE_FP(fGETWORD(0,tmp)); fWRITE_SP(EA+8);
+  fJUMPR(REG_LR,fGETWORD(1,tmp),COF_TYPE_JUMPR);} else {LOAD_CANCEL(EA);} })
+
+Q6INSN(SL2_return_fnew,"if (!p0.new) dealloc_return:nt", ATTRIBS(A_JINDIRNEW,A_SUBINSN,A_LOAD,A_RETURN,A_RESTRICT_SLOT0ONLY), "Deallocate stack frame and return",
+{ fHIDE(size8u_t tmp;) fBRANCH_SPECULATE_STALL(fLSBNEW0NOT,, SPECULATE_NOT_TAKEN , 4,3); fEA_REG(fREAD_FP()); if (fLSBNEW0NOT) { fLOAD(1,8,u,EA,tmp); tmp = fFRAME_UNSCRAMBLE(tmp); fWRITE_LR(fGETWORD(1,tmp)); fWRITE_FP(fGETWORD(0,tmp)); fWRITE_SP(EA+8);
+  fJUMPR(REG_LR,fGETWORD(1,tmp),COF_TYPE_JUMPR);} else {LOAD_CANCEL(EA);} })
+
+
+Q6INSN(SL2_jumpr31,"jumpr r31",ATTRIBS(A_SUBINSN,A_JINDIR,A_RESTRICT_SLOT0ONLY),"indirect unconditional jump",
+{ fJUMPR(REG_LR,fREAD_LR(),COF_TYPE_JUMPR);})
+
+Q6INSN(SL2_jumpr31_t,"if (p0) jumpr r31",ATTRIBS(A_SUBINSN,A_JINDIROLD,A_RESTRICT_SLOT0ONLY),"indirect conditional jump if true",
+{fBRANCH_SPECULATE_STALL(fLSBOLD(fREAD_P0()),, SPECULATE_TAKEN,4,0); if (fLSBOLD(fREAD_P0())) {fJUMPR(REG_LR,fREAD_LR(),COF_TYPE_JUMPR);}})
+
+Q6INSN(SL2_jumpr31_f,"if (!p0) jumpr r31",ATTRIBS(A_SUBINSN,A_JINDIROLD,A_RESTRICT_SLOT0ONLY),"indirect conditional jump if false",
+{fBRANCH_SPECULATE_STALL(fLSBOLDNOT(fREAD_P0()),, SPECULATE_TAKEN,4,0); if (fLSBOLDNOT(fREAD_P0())) {fJUMPR(REG_LR,fREAD_LR(),COF_TYPE_JUMPR);}})
+
+
+
+Q6INSN(SL2_jumpr31_tnew,"if (p0.new) jumpr:nt r31",ATTRIBS(A_SUBINSN,A_JINDIRNEW,A_RESTRICT_SLOT0ONLY),"indirect conditional jump if true",
+{fBRANCH_SPECULATE_STALL(fLSBNEW0,, SPECULATE_NOT_TAKEN , 4,3); if (fLSBNEW0) {fJUMPR(REG_LR,fREAD_LR(),COF_TYPE_JUMPR);}})
+
+Q6INSN(SL2_jumpr31_fnew,"if (!p0.new) jumpr:nt r31",ATTRIBS(A_SUBINSN,A_JINDIRNEW,A_RESTRICT_SLOT0ONLY),"indirect conditional jump if false",
+{fBRANCH_SPECULATE_STALL(fLSBNEW0NOT,, SPECULATE_NOT_TAKEN , 4,3); if (fLSBNEW0NOT) {fJUMPR(REG_LR,fREAD_LR(),COF_TYPE_JUMPR);}})
+
+
+
+
+
+/*****************************************************************/
+/*                                                               */
+/*                       St1/2 subinsns                          */
+/*                                                               */
+/*****************************************************************/
+
+Q6INSN(SS1_storew_io,  "memw(Rs16+#u4:2)=Rt16", ATTRIBS(A_STORE,A_SUBINSN), "store word", {fEA_RI(RsV,uiV); fSTORE(1,4,EA,RtV);})
+Q6INSN(SS1_storeb_io,  "memb(Rs16+#u4:0)=Rt16", ATTRIBS(A_STORE,A_SUBINSN), "store byte", {fEA_RI(RsV,uiV); fSTORE(1,1,EA,fGETBYTE(0,RtV));})
+Q6INSN(SS2_storeh_io,  "memh(Rs16+#u3:1)=Rt16", ATTRIBS(A_STORE,A_SUBINSN), "store half", {fEA_RI(RsV,uiV); fSTORE(1,2,EA,fGETHALF(0,RtV));})
+Q6INSN(SS2_stored_sp,  "memd(r29+#s6:3)=Rtt8", ATTRIBS(A_STORE,A_SUBINSN), "store dword",{fEA_RI(fREAD_SP(),siV); fSTORE(1,8,EA,RttV);})
+Q6INSN(SS2_storew_sp,  "memw(r29+#u5:2)=Rt16",  ATTRIBS(A_STORE,A_SUBINSN), "store word", {fEA_RI(fREAD_SP(),uiV); fSTORE(1,4,EA,RtV);})
+Q6INSN(SS2_storewi0,   "memw(Rs16+#u4:2)=#0", ATTRIBS(A_STORE,A_SUBINSN), "store word", {fEA_RI(RsV,uiV); fSTORE(1,4,EA,0);})
+Q6INSN(SS2_storebi0,   "memb(Rs16+#u4:0)=#0", ATTRIBS(A_STORE,A_SUBINSN), "store byte", {fEA_RI(RsV,uiV); fSTORE(1,1,EA,0);})
+Q6INSN(SS2_storewi1,   "memw(Rs16+#u4:2)=#1", ATTRIBS(A_STORE,A_SUBINSN), "store word", {fEA_RI(RsV,uiV); fSTORE(1,4,EA,1);})
+Q6INSN(SS2_storebi1,   "memb(Rs16+#u4:0)=#1", ATTRIBS(A_STORE,A_SUBINSN), "store byte", {fEA_RI(RsV,uiV); fSTORE(1,1,EA,1);})
+
+
+Q6INSN(SS2_allocframe,"allocframe(#u5:3)", ATTRIBS(A_SUBINSN,A_STORE,A_RESTRICT_SLOT0ONLY), "Allocate stack frame",
+{ fEA_RI(fREAD_SP(),-8);  fSTORE(1,8,EA,fFRAME_SCRAMBLE((fCAST8_8u(fREAD_LR()) << 32) | fCAST4_4u(fREAD_FP()))); fWRITE_FP(EA); fFRAMECHECK(EA-uiV,EA); fWRITE_SP(EA-uiV); })
diff --git a/target/hexagon/imported/system.idef b/target/hexagon/imported/system.idef
new file mode 100644
index 0000000000..7c6568e75e
--- /dev/null
+++ b/target/hexagon/imported/system.idef
@@ -0,0 +1,68 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * System Interface Instructions
+ */
+
+
+
+/********************************************/
+/* User->OS interface                       */
+/********************************************/
+
+Q6INSN(J2_trap0,"trap0(#u8)",ATTRIBS(A_COF),
+"Trap to Operating System",
+    fTRAP(0,uiV);
+)
+
+Q6INSN(J2_pause,"pause(#u8)",ATTRIBS(A_COF),
+"Enter low-power state for #u8 cycles",{fPAUSE(uiV);})
+
+Q6INSN(Y2_icinva,"icinva(Rs32)",ATTRIBS(A_ICOP,A_ICFLUSHOP),"Instruction Cache Invalidate Address",{fEA_REG(RsV); fICINVA(EA);})
+
+Q6INSN(Y2_isync,"isync",ATTRIBS(),"Memory Synchronization",{fISYNC();})
+Q6INSN(Y2_barrier,"barrier",ATTRIBS(A_RESTRICT_SLOT0ONLY),"Memory Barrier",{fBARRIER();})
+Q6INSN(Y2_syncht,"syncht",ATTRIBS(A_RESTRICT_SLOT0ONLY),"Memory Synchronization",{fSYNCH();})
+
+
+Q6INSN(Y2_dcfetchbo,"dcfetch(Rs32+#u11:3)",ATTRIBS(A_RESTRICT_PREFERSLOT0,A_DCFETCH),"Data Cache Prefetch",{fEA_RI(RsV,uiV); fDCFETCH(EA);})
+
+
+Q6INSN(Y2_dczeroa,"dczeroa(Rs32)",ATTRIBS(A_STORE,A_RESTRICT_SLOT0ONLY,A_DCZEROA),"Zero an aligned 32-byte cacheline",{fEA_REG(RsV); fDCZEROA(EA);})
+Q6INSN(Y2_dccleana,"dccleana(Rs32)",ATTRIBS(A_RESTRICT_SLOT0ONLY,A_DCFLUSHOP),"Data Cache Clean Address",{fEA_REG(RsV); fDCCLEANA(EA);})
+Q6INSN(Y2_dccleaninva,"dccleaninva(Rs32)",ATTRIBS(A_RESTRICT_SLOT0ONLY,A_DCFLUSHOP),"Data Cache Clean and Invalidate Address",{fEA_REG(RsV); fDCCLEANINVA(EA);})
+Q6INSN(Y2_dcinva,"dcinva(Rs32)",ATTRIBS(A_RESTRICT_SLOT0ONLY,A_DCFLUSHOP),"Data Cache Invalidate Address",{fEA_REG(RsV); fDCCLEANINVA(EA);})
+
+
+Q6INSN(Y4_l2fetch,"l2fetch(Rs32,Rt32)",ATTRIBS(A_RESTRICT_SLOT0ONLY),"L2 Cache Prefetch",
+{ fL2FETCH(RsV,
+           (RtV&0xff), /*height*/
+           ((RtV>>8)&0xff), /*width*/
+           ((RtV>>16)&0xffff), /*stride*/
+           0); /*extra attrib flags*/
+})
+
+
+
+Q6INSN(Y5_l2fetch,"l2fetch(Rs32,Rtt32)",ATTRIBS(A_RESTRICT_SLOT0ONLY),"L2 Cache Prefetch",
+{ fL2FETCH(RsV,
+           fGETUHALF(0,RttV), /*height*/
+           fGETUHALF(1,RttV), /*width*/
+           fGETUHALF(2,RttV), /*stride*/
+           fGETUHALF(3,RttV)); /*flags*/
+})
-- 
2.25.1


