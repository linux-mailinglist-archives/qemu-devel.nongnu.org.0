Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F8543F210
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:51:20 +0200 (CEST)
Received: from localhost ([::1]:56742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDIt-0005zN-5U
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfe-0000xa-RK
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfZ-0006eZ-9Q
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:46 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so2272886wmj.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sxDj12EBCVl44QOgj0C3YedyL8e+CcDmGkKCnQ5YDAw=;
 b=Zk0RISK5/KIAx177KOdQhmylrc2pkE4KoGtsZmQFGGl6vVXpARIRFppuRE3L1T+/79
 RyHb7aE3uU2d5aeJa80gZTE0oX+Taz56xihXPM3R3HLCl5cNi0mYFXsORug42oTbesbG
 6kHz9z756h1EXbamwrgGh1gFKTNJDDfvhgBuL2BNOV5ge5ry7A55AwfntdZuIFdaJ2SR
 YEm7Tv/cpo9ScXt+lh9y7LVRPFyYCHwgFVNEUQqoypGMPdmpl9hBce4X0XTJCSIba8eu
 7JfiblPPS3BVa0tiZCJHPAvAf0Gto5sUjjrM2KmFMpwSO6v46r9hfJqE+mA3rjeEOt27
 qFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sxDj12EBCVl44QOgj0C3YedyL8e+CcDmGkKCnQ5YDAw=;
 b=lRTLwgmnWnGLTOnsm2sRXgS0RiNsbsXQ9gqBkr2RWWaKGX7kRqDitY2nJi2KnTg/GK
 OFHeudPqqnKVukVHl/cF/YyoVGgGQGg+kp7DvMKvdYVprExvlVglK1vwy1LOG9Opo+SR
 7cOy3ui0eWIMlFkzKePGiwO2jMS0AVHLnFasnb1pyaXZp4ITl1oeiAoP+GVTHNOI0Alw
 HPYq4uITrdT/sP7y5yNGNiKZ5QyYoTBx0VZWeWJM1HKLBnk/k2SJwnXZ1ZUBu+/yc67n
 +g+GsFsq1ZLRIWlKk4KNkQCJ6DCqh271vUBtpTjmsrXpYPwDefsOog0ii4ROv3Eecly0
 Vg4w==
X-Gm-Message-State: AOAM531fExzXqUjHbpHcqdNDW0Xvmtqvegbh9GAgP1sIzGU7w8ViFv2N
 BlkhLYqxSBKrMcviNUvAWfn8W4WMpuw=
X-Google-Smtp-Source: ABdhPJye2YW+YgxJL6R2bbzlbLvdaTakhz7IfIpnZjxyavGX5G+THCIanV6k06QHyNq78kv0dBDd5g==
X-Received: by 2002:a05:600c:3b13:: with SMTP id
 m19mr11302019wms.172.1635455438251; 
 Thu, 28 Oct 2021 14:10:38 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f133sm1469989wmf.31.2021.10.28.14.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:10:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/32] target/mips: Convert MSA 3R instruction format to
 decodetree (part 4/4)
Date: Thu, 28 Oct 2021 23:08:34 +0200
Message-Id: <20211028210843.2120802-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert 3-register operations to decodetree.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  53 ++
 target/mips/tcg/msa_translate.c | 916 ++------------------------------
 2 files changed, 106 insertions(+), 863 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index f2bacbaea86..391261109a5 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -89,9 +89,54 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  SLL               011110 000.. ..... ..... .....  001101  @3r
+  SRA               011110 001.. ..... ..... .....  001101  @3r
+  SRL               011110 010.. ..... ..... .....  001101  @3r
+  BCLR              011110 011.. ..... ..... .....  001101  @3r
+  BSET              011110 100.. ..... ..... .....  001101  @3r
+  BNEG              011110 101.. ..... ..... .....  001101  @3r
   BINSL             011110 110.. ..... ..... .....  001101  @3r
   BINSR             011110 111.. ..... ..... .....  001101  @3r
 
+  ADDV              011110 000.. ..... ..... .....  001110  @3r
+  SUBV              011110 001.. ..... ..... .....  001110  @3r
+  MAX_S             011110 010.. ..... ..... .....  001110  @3r
+  MAX_U             011110 011.. ..... ..... .....  001110  @3r
+  MIN_S             011110 100.. ..... ..... .....  001110  @3r
+  MIN_U             011110 101.. ..... ..... .....  001110  @3r
+  MAX_A             011110 110.. ..... ..... .....  001110  @3r
+  MIN_A             011110 111.. ..... ..... .....  001110  @3r
+
+  CEQ               011110 000.. ..... ..... .....  001111  @3r
+  CLT_S             011110 010.. ..... ..... .....  001111  @3r
+  CLT_U             011110 011.. ..... ..... .....  001111  @3r
+  CLE_S             011110 100.. ..... ..... .....  001111  @3r
+  CLE_U             011110 101.. ..... ..... .....  001111  @3r
+
+  ADD_A             011110 000.. ..... ..... .....  010000  @3r
+  ADDS_A            011110 001.. ..... ..... .....  010000  @3r
+  ADDS_S            011110 010.. ..... ..... .....  010000  @3r
+  ADDS_U            011110 011.. ..... ..... .....  010000  @3r
+  AVE_S             011110 100.. ..... ..... .....  010000  @3r
+  AVE_U             011110 101.. ..... ..... .....  010000  @3r
+  AVER_S            011110 110.. ..... ..... .....  010000  @3r
+  AVER_U            011110 111.. ..... ..... .....  010000  @3r
+
+  SUBS_S            011110 000.. ..... ..... .....  010001  @3r
+  SUBS_U            011110 001.. ..... ..... .....  010001  @3r
+  SUBSUS_U          011110 010.. ..... ..... .....  010001  @3r
+  SUBSUU_S          011110 011.. ..... ..... .....  010001  @3r
+  ASUB_S            011110 100.. ..... ..... .....  010001  @3r
+  ASUB_U            011110 101.. ..... ..... .....  010001  @3r
+
+  MULV              011110 000.. ..... ..... .....  010010  @3r
+  MADDV             011110 001.. ..... ..... .....  010010  @3r
+  MSUBV             011110 010.. ..... ..... .....  010010  @3r
+  DIV_S             011110 100.. ..... ..... .....  010010  @3r
+  DIV_U             011110 101.. ..... ..... .....  010010  @3r
+  MOD_S             011110 110.. ..... ..... .....  010010  @3r
+  MOD_U             011110 111.. ..... ..... .....  010010  @3r
+
   DOTP_S            011110 000.. ..... ..... .....  010011  @3r
   DOTP_U            011110 001.. ..... ..... .....  010011  @3r
   DPADD_S           011110 010.. ..... ..... .....  010011  @3r
@@ -101,8 +146,16 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   SLD               011110 000 .. ..... ..... ..... 010100  @3r
   SPLAT             011110 001 .. ..... ..... ..... 010100  @3r
+  PCKEV             011110 010 .. ..... ..... ..... 010100  @3r
+  PCKOD             011110 011 .. ..... ..... ..... 010100  @3r
+  ILVL              011110 100 .. ..... ..... ..... 010100  @3r
+  ILVR              011110 101 .. ..... ..... ..... 010100  @3r
+  ILVEV             011110 110 .. ..... ..... ..... 010100  @3r
+  ILVOD             011110 111 .. ..... ..... ..... 010100  @3r
 
   VSHF              011110 000 .. ..... ..... ..... 010101  @3r
+  SRAR              011110 001 .. ..... ..... ..... 010101  @3r
+  SRLR              011110 010 .. ..... ..... ..... 010101  @3r
   HADD_S            011110 100.. ..... ..... .....  010101  @3r
   HADD_U            011110 101.. ..... ..... .....  010101  @3r
   HSUB_S            011110 110.. ..... ..... .....  010101  @3r
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 23d7ab6fd5b..b0aae11b06c 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -37,69 +37,10 @@ static inline int plus_2(DisasContext *s, int x)
 
 #define MASK_MSA_MINOR(op)          (MASK_OP_MAJOR(op) | (op & 0x3F))
 enum {
-    OPC_MSA_3R_0D   = 0x0D | OPC_MSA,
-    OPC_MSA_3R_0E   = 0x0E | OPC_MSA,
-    OPC_MSA_3R_0F   = 0x0F | OPC_MSA,
-    OPC_MSA_3R_10   = 0x10 | OPC_MSA,
-    OPC_MSA_3R_11   = 0x11 | OPC_MSA,
-    OPC_MSA_3R_12   = 0x12 | OPC_MSA,
-    OPC_MSA_3R_13   = 0x13 | OPC_MSA,
-    OPC_MSA_3R_14   = 0x14 | OPC_MSA,
-    OPC_MSA_3R_15   = 0x15 | OPC_MSA,
     OPC_MSA_ELM     = 0x19 | OPC_MSA,
 };
 
 enum {
-    /* 3R instruction df(bits 22..21) = _b, _h, _w, d */
-    OPC_SLL_df      = (0x0 << 23) | OPC_MSA_3R_0D,
-    OPC_ADDV_df     = (0x0 << 23) | OPC_MSA_3R_0E,
-    OPC_CEQ_df      = (0x0 << 23) | OPC_MSA_3R_0F,
-    OPC_ADD_A_df    = (0x0 << 23) | OPC_MSA_3R_10,
-    OPC_SUBS_S_df   = (0x0 << 23) | OPC_MSA_3R_11,
-    OPC_MULV_df     = (0x0 << 23) | OPC_MSA_3R_12,
-    OPC_SRA_df      = (0x1 << 23) | OPC_MSA_3R_0D,
-    OPC_SUBV_df     = (0x1 << 23) | OPC_MSA_3R_0E,
-    OPC_ADDS_A_df   = (0x1 << 23) | OPC_MSA_3R_10,
-    OPC_SUBS_U_df   = (0x1 << 23) | OPC_MSA_3R_11,
-    OPC_MADDV_df    = (0x1 << 23) | OPC_MSA_3R_12,
-    OPC_SRAR_df     = (0x1 << 23) | OPC_MSA_3R_15,
-    OPC_SRL_df      = (0x2 << 23) | OPC_MSA_3R_0D,
-    OPC_MAX_S_df    = (0x2 << 23) | OPC_MSA_3R_0E,
-    OPC_CLT_S_df    = (0x2 << 23) | OPC_MSA_3R_0F,
-    OPC_ADDS_S_df   = (0x2 << 23) | OPC_MSA_3R_10,
-    OPC_SUBSUS_U_df = (0x2 << 23) | OPC_MSA_3R_11,
-    OPC_MSUBV_df    = (0x2 << 23) | OPC_MSA_3R_12,
-    OPC_PCKEV_df    = (0x2 << 23) | OPC_MSA_3R_14,
-    OPC_SRLR_df     = (0x2 << 23) | OPC_MSA_3R_15,
-    OPC_BCLR_df     = (0x3 << 23) | OPC_MSA_3R_0D,
-    OPC_MAX_U_df    = (0x3 << 23) | OPC_MSA_3R_0E,
-    OPC_CLT_U_df    = (0x3 << 23) | OPC_MSA_3R_0F,
-    OPC_ADDS_U_df   = (0x3 << 23) | OPC_MSA_3R_10,
-    OPC_SUBSUU_S_df = (0x3 << 23) | OPC_MSA_3R_11,
-    OPC_PCKOD_df    = (0x3 << 23) | OPC_MSA_3R_14,
-    OPC_BSET_df     = (0x4 << 23) | OPC_MSA_3R_0D,
-    OPC_MIN_S_df    = (0x4 << 23) | OPC_MSA_3R_0E,
-    OPC_CLE_S_df    = (0x4 << 23) | OPC_MSA_3R_0F,
-    OPC_AVE_S_df    = (0x4 << 23) | OPC_MSA_3R_10,
-    OPC_ASUB_S_df   = (0x4 << 23) | OPC_MSA_3R_11,
-    OPC_DIV_S_df    = (0x4 << 23) | OPC_MSA_3R_12,
-    OPC_ILVL_df     = (0x4 << 23) | OPC_MSA_3R_14,
-    OPC_BNEG_df     = (0x5 << 23) | OPC_MSA_3R_0D,
-    OPC_MIN_U_df    = (0x5 << 23) | OPC_MSA_3R_0E,
-    OPC_CLE_U_df    = (0x5 << 23) | OPC_MSA_3R_0F,
-    OPC_AVE_U_df    = (0x5 << 23) | OPC_MSA_3R_10,
-    OPC_ASUB_U_df   = (0x5 << 23) | OPC_MSA_3R_11,
-    OPC_DIV_U_df    = (0x5 << 23) | OPC_MSA_3R_12,
-    OPC_ILVR_df     = (0x5 << 23) | OPC_MSA_3R_14,
-    OPC_MAX_A_df    = (0x6 << 23) | OPC_MSA_3R_0E,
-    OPC_AVER_S_df   = (0x6 << 23) | OPC_MSA_3R_10,
-    OPC_MOD_S_df    = (0x6 << 23) | OPC_MSA_3R_12,
-    OPC_ILVEV_df    = (0x6 << 23) | OPC_MSA_3R_14,
-    OPC_MIN_A_df    = (0x7 << 23) | OPC_MSA_3R_0E,
-    OPC_AVER_U_df   = (0x7 << 23) | OPC_MSA_3R_10,
-    OPC_MOD_U_df    = (0x7 << 23) | OPC_MSA_3R_12,
-    OPC_ILVOD_df    = (0x7 << 23) | OPC_MSA_3R_14,
-
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_SLDI_df     = (0x0 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
@@ -504,9 +445,54 @@ TRANS(BMNZ_V,           trans_msa_3r,   gen_helper_msa_bmnz_v);
 TRANS(BMZ_V,            trans_msa_3r,   gen_helper_msa_bmz_v);
 TRANS(BSEL_V,           trans_msa_3r,   gen_helper_msa_bsel_v);
 
+TRANS_DF_iii(SLL,       trans_msa_3r,   gen_helper_msa_sll);
+TRANS_DF_iii(SRA,       trans_msa_3r,   gen_helper_msa_sra);
+TRANS_DF_iii(SRL,       trans_msa_3r,   gen_helper_msa_srl);
+TRANS_DF_iii(BCLR,      trans_msa_3r,   gen_helper_msa_bclr);
+TRANS_DF_iii(BSET,      trans_msa_3r,   gen_helper_msa_bset);
+TRANS_DF_iii(BNEG,      trans_msa_3r,   gen_helper_msa_bneg);
 TRANS_DF_iii(BINSL,     trans_msa_3r,   gen_helper_msa_binsl);
 TRANS_DF_iii(BINSR,     trans_msa_3r,   gen_helper_msa_binsr);
 
+TRANS_DF_iii(ADDV,      trans_msa_3r,   gen_helper_msa_addv);
+TRANS_DF_iii(SUBV,      trans_msa_3r,   gen_helper_msa_subv);
+TRANS_DF_iii(MAX_S,     trans_msa_3r,   gen_helper_msa_max_s);
+TRANS_DF_iii(MAX_U,     trans_msa_3r,   gen_helper_msa_max_u);
+TRANS_DF_iii(MIN_S,     trans_msa_3r,   gen_helper_msa_min_s);
+TRANS_DF_iii(MIN_U,     trans_msa_3r,   gen_helper_msa_min_u);
+TRANS_DF_iii(MAX_A,     trans_msa_3r,   gen_helper_msa_max_a);
+TRANS_DF_iii(MIN_A,     trans_msa_3r,   gen_helper_msa_min_a);
+
+TRANS_DF_iii(CEQ,       trans_msa_3r,   gen_helper_msa_ceq);
+TRANS_DF_iii(CLT_S,     trans_msa_3r,   gen_helper_msa_clt_s);
+TRANS_DF_iii(CLT_U,     trans_msa_3r,   gen_helper_msa_clt_u);
+TRANS_DF_iii(CLE_S,     trans_msa_3r,   gen_helper_msa_cle_s);
+TRANS_DF_iii(CLE_U,     trans_msa_3r,   gen_helper_msa_cle_u);
+
+TRANS_DF_iii(ADD_A,     trans_msa_3r,   gen_helper_msa_add_a);
+TRANS_DF_iii(ADDS_A,    trans_msa_3r,   gen_helper_msa_adds_a);
+TRANS_DF_iii(ADDS_S,    trans_msa_3r,   gen_helper_msa_adds_s);
+TRANS_DF_iii(ADDS_U,    trans_msa_3r,   gen_helper_msa_adds_u);
+TRANS_DF_iii(AVE_S,     trans_msa_3r,   gen_helper_msa_ave_s);
+TRANS_DF_iii(AVE_U,     trans_msa_3r,   gen_helper_msa_ave_u);
+TRANS_DF_iii(AVER_S,    trans_msa_3r,   gen_helper_msa_aver_s);
+TRANS_DF_iii(AVER_U,    trans_msa_3r,   gen_helper_msa_aver_u);
+
+TRANS_DF_iii(SUBS_S,    trans_msa_3r,   gen_helper_msa_subs_s);
+TRANS_DF_iii(SUBS_U,    trans_msa_3r,   gen_helper_msa_subs_u);
+TRANS_DF_iii(SUBSUS_U,  trans_msa_3r,   gen_helper_msa_subsus_u);
+TRANS_DF_iii(SUBSUU_S,  trans_msa_3r,   gen_helper_msa_subsuu_s);
+TRANS_DF_iii(ASUB_S,    trans_msa_3r,   gen_helper_msa_asub_s);
+TRANS_DF_iii(ASUB_U,    trans_msa_3r,   gen_helper_msa_asub_u);
+
+TRANS_DF_iii(MULV,      trans_msa_3r,   gen_helper_msa_mulv);
+TRANS_DF_iii(MADDV,     trans_msa_3r,   gen_helper_msa_maddv);
+TRANS_DF_iii(MSUBV,     trans_msa_3r,   gen_helper_msa_msubv);
+TRANS_DF_iii(DIV_S,     trans_msa_3r,   gen_helper_msa_div_s);
+TRANS_DF_iii(DIV_U,     trans_msa_3r,   gen_helper_msa_div_u);
+TRANS_DF_iii(MOD_S,     trans_msa_3r,   gen_helper_msa_mod_s);
+TRANS_DF_iii(MOD_U,     trans_msa_3r,   gen_helper_msa_mod_u);
+
 TRANS_DF_iii_b(DOTP_S,  trans_msa_3r,   gen_helper_msa_dotp_s);
 TRANS_DF_iii_b(DOTP_U,  trans_msa_3r,   gen_helper_msa_dotp_u);
 TRANS_DF_iii_b(DPADD_S, trans_msa_3r,   gen_helper_msa_dpadd_s);
@@ -516,806 +502,21 @@ TRANS_DF_iii_b(DPSUB_U, trans_msa_3r,   gen_helper_msa_dpsub_u);
 
 TRANS(SLD,              trans_msa_3rf,  gen_helper_msa_sld_df);
 TRANS(SPLAT,            trans_msa_3rf,  gen_helper_msa_splat_df);
+TRANS_DF_iii(PCKEV,     trans_msa_3r,   gen_helper_msa_pckev);
+TRANS_DF_iii(PCKOD,     trans_msa_3r,   gen_helper_msa_pckod);
+TRANS_DF_iii(ILVL,      trans_msa_3r,   gen_helper_msa_ilvl);
+TRANS_DF_iii(ILVR,      trans_msa_3r,   gen_helper_msa_ilvr);
+TRANS_DF_iii(ILVEV,     trans_msa_3r,   gen_helper_msa_ilvev);
+TRANS_DF_iii(ILVOD,     trans_msa_3r,   gen_helper_msa_ilvod);
 
 TRANS(VSHF,             trans_msa_3rf,  gen_helper_msa_vshf_df);
+TRANS_DF_iii(SRAR,      trans_msa_3r,   gen_helper_msa_srar);
+TRANS_DF_iii(SRLR,      trans_msa_3r,   gen_helper_msa_srlr);
 TRANS_DF_iii_b(HADD_S,  trans_msa_3r,   gen_helper_msa_hadd_s);
 TRANS_DF_iii_b(HADD_U,  trans_msa_3r,   gen_helper_msa_hadd_u);
 TRANS_DF_iii_b(HSUB_S,  trans_msa_3r,   gen_helper_msa_hsub_s);
 TRANS_DF_iii_b(HSUB_U,  trans_msa_3r,   gen_helper_msa_hsub_u);
 
-static void gen_msa_3r(DisasContext *ctx)
-{
-#define MASK_MSA_3R(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
-    uint8_t df = (ctx->opcode >> 21) & 0x3;
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-
-    TCGv_i32 tdf = tcg_const_i32(df);
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twt = tcg_const_i32(wt);
-
-    switch (MASK_MSA_3R(ctx->opcode)) {
-    case OPC_BCLR_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_bclr_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_bclr_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_bclr_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_bclr_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_BNEG_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_bneg_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_bneg_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_bneg_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_bneg_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_BSET_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_bset_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_bset_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_bset_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_bset_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_ADD_A_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_add_a_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_add_a_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_add_a_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_add_a_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_ADDS_A_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_adds_a_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_adds_a_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_adds_a_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_adds_a_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_ADDS_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_adds_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_adds_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_adds_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_adds_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_ADDS_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_adds_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_adds_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_adds_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_adds_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_ADDV_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_addv_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_addv_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_addv_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_addv_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_AVE_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_ave_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_ave_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_ave_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_ave_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_AVE_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_ave_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_ave_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_ave_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_ave_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_AVER_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_aver_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_aver_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_aver_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_aver_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_AVER_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_aver_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_aver_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_aver_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_aver_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_CEQ_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_ceq_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_ceq_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_ceq_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_ceq_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_CLE_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_cle_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_cle_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_cle_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_cle_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_CLE_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_cle_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_cle_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_cle_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_cle_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_CLT_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_clt_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_clt_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_clt_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_clt_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_CLT_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_clt_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_clt_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_clt_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_clt_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_DIV_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_div_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_div_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_div_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_div_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_DIV_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_div_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_div_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_div_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_div_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_MAX_A_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_max_a_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_max_a_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_max_a_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_max_a_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_MAX_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_max_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_max_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_max_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_max_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_MAX_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_max_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_max_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_max_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_max_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_MIN_A_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_min_a_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_min_a_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_min_a_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_min_a_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_MIN_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_min_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_min_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_min_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_min_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_MIN_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_min_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_min_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_min_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_min_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_MOD_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_mod_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_mod_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_mod_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_mod_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_MOD_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_mod_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_mod_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_mod_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_mod_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_MADDV_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_maddv_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_maddv_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_maddv_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_maddv_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_MSUBV_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_msubv_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_msubv_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_msubv_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_msubv_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_ASUB_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_asub_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_asub_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_asub_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_asub_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_ASUB_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_asub_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_asub_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_asub_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_asub_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_ILVEV_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_ilvev_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_ilvev_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_ilvev_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_ilvev_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_ILVOD_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_ilvod_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_ilvod_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_ilvod_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_ilvod_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_ILVL_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_ilvl_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_ilvl_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_ilvl_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_ilvl_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_ILVR_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_ilvr_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_ilvr_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_ilvr_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_ilvr_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_PCKEV_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_pckev_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_pckev_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_pckev_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_pckev_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_PCKOD_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_pckod_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_pckod_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_pckod_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_pckod_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_SLL_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_sll_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_sll_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_sll_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_sll_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_SRA_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_sra_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_sra_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_sra_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_sra_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_SRAR_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_srar_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_srar_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_srar_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_srar_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_SRL_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_srl_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_srl_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_srl_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_srl_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_SRLR_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_srlr_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_srlr_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_srlr_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_srlr_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_SUBS_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_subs_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_subs_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_subs_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_subs_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_MULV_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_mulv_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_mulv_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_mulv_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_mulv_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_SUBV_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_subv_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_subv_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_subv_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_subv_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_SUBS_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_subs_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_subs_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_subs_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_subs_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_SUBSUS_U_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_subsus_u_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_subsus_u_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_subsus_u_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_subsus_u_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    case OPC_SUBSUU_S_df:
-        switch (df) {
-        case DF_BYTE:
-            gen_helper_msa_subsuu_s_b(cpu_env, twd, tws, twt);
-            break;
-        case DF_HALF:
-            gen_helper_msa_subsuu_s_h(cpu_env, twd, tws, twt);
-            break;
-        case DF_WORD:
-            gen_helper_msa_subsuu_s_w(cpu_env, twd, tws, twt);
-            break;
-        case DF_DOUBLE:
-            gen_helper_msa_subsuu_s_d(cpu_env, twd, tws, twt);
-            break;
-        }
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(twt);
-    tcg_temp_free_i32(tdf);
-}
-
 static void gen_msa_elm_3e(DisasContext *ctx)
 {
 #define MASK_MSA_ELM_DF3E(op)   (MASK_MSA_MINOR(op) | (op & (0x3FF << 16)))
@@ -1606,17 +807,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     }
 
     switch (MASK_MSA_MINOR(opcode)) {
-    case OPC_MSA_3R_0D:
-    case OPC_MSA_3R_0E:
-    case OPC_MSA_3R_0F:
-    case OPC_MSA_3R_10:
-    case OPC_MSA_3R_11:
-    case OPC_MSA_3R_12:
-    case OPC_MSA_3R_13:
-    case OPC_MSA_3R_14:
-    case OPC_MSA_3R_15:
-        gen_msa_3r(ctx);
-        break;
     case OPC_MSA_ELM:
         gen_msa_elm(ctx);
         break;
-- 
2.31.1


