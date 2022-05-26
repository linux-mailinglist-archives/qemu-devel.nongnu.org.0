Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D636B5355D9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:53:38 +0200 (CEST)
Received: from localhost ([::1]:39328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLQH-0006Dp-Vr
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCL-0001pk-S9; Thu, 26 May 2022 17:39:13 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33]:36754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCJ-00088B-5s; Thu, 26 May 2022 17:39:13 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 f5-20020a4aa685000000b0040e7e819183so506913oom.3; 
 Thu, 26 May 2022 14:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IghjpFIgAbh+RrP/YcW2+ELNPVGW/cxRMtHfzRObM1c=;
 b=mQRn5lmaAQoZ6zfSl4rSybgG1OvPdEC0k1LrdpUFvuHs8fc10LRzJ9tpHWRac//utb
 WGdPg9OpckAEsb67i6LDZy3OblLCoWSMJ/9WlLp/ELavRJLpb9HXfMVZJgCF6w/wYNYr
 VVsv3D2FliZzsAb+4ptt0pHPKZ+jHKBFxTIOVElZE3mqA4ljayMoS9RkSiYbSLZ5e6pt
 uTE5MtaeI25dCzYNlN90dOh/KzDRrxWlQTh0Vq/yb3V4YWDMaBQgL2AE8jC0bcScuoOd
 UI206TyrvqBx1mqB13DXKEN0gsAfZ0oXbWD2uuPXnkE0O51p3AsJzfAP82tX0mPFMUHD
 QymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IghjpFIgAbh+RrP/YcW2+ELNPVGW/cxRMtHfzRObM1c=;
 b=bMBFWzQ2MxSxAry3nt+5V4ponQX+vIPMauiWc89Q0F2FGrQCS2sm3GpONUwEIzH8Oe
 SohJU/7ZSG2vdD9z42ZvYa/3hyW5MRTbzafXvUvqakKLUq/c0JZ81REJMpX+JBAdW59w
 TabgWL4p+ti7lc3hU6rJO4yvNt+pSCPklt8yI/2n2dj+S+hsWiT8CYGndeTmpuZe/HaV
 aD53Q6khw3pjZB7vBRwUege5DtQX9/nm/QZeClLTz5Ae1B2ePz+IkgwzmmhBxt27ts2K
 3BuCrQ9pD5PDBrlhOb/GPyHyLl6ROYXMeCkmBd9OOVnpRjjT/9y3qFUIqLhYdsM229YX
 ICpQ==
X-Gm-Message-State: AOAM531UTHxqoyU4X6My8u2cbe3ulUiYd+NGsJcearNXiAhS5v4H94qr
 wHEsG1N938KuRWdtm3PlS1kZ3DBl8B0=
X-Google-Smtp-Source: ABdhPJwJVwaBTzF3E4H1gm6d3UgLK8BGXrcyRUXiLIOJ/+4et7CWf7KmnLD48ZZIeUyleAUqhiY8vA==
X-Received: by 2002:a4a:6f49:0:b0:35e:1902:1d3b with SMTP id
 i9-20020a4a6f49000000b0035e19021d3bmr15895217oof.1.1653601149484; 
 Thu, 26 May 2022 14:39:09 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 12/34] target/ppc: use TCG_CALL_NO_RWG in vector helpers
 without env
Date: Thu, 26 May 2022 18:37:53 -0300
Message-Id: <20220526213815.92701-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Helpers of vector instructions without cpu_env as an argument do not
access globals.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-3-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h | 162 ++++++++++++++++++++++----------------------
 1 file changed, 81 insertions(+), 81 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 44eb6b7b7c..da740ad9af 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -133,15 +133,15 @@ DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
 #define dh_ctype_vsr ppc_vsr_t *
 #define dh_typecode_vsr dh_typecode_ptr
 
-DEF_HELPER_3(vavgub, void, avr, avr, avr)
-DEF_HELPER_3(vavguh, void, avr, avr, avr)
-DEF_HELPER_3(vavguw, void, avr, avr, avr)
-DEF_HELPER_3(vabsdub, void, avr, avr, avr)
-DEF_HELPER_3(vabsduh, void, avr, avr, avr)
-DEF_HELPER_3(vabsduw, void, avr, avr, avr)
-DEF_HELPER_3(vavgsb, void, avr, avr, avr)
-DEF_HELPER_3(vavgsh, void, avr, avr, avr)
-DEF_HELPER_3(vavgsw, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavgub, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavguh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavguw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vabsdub, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vabsduh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vabsduw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavgsb, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavgsh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vavgsw, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_4(vcmpeqfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp, void, env, avr, avr, avr)
@@ -153,12 +153,12 @@ DEF_HELPER_4(vcmpeqfp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpbfp_dot, void, env, avr, avr, avr)
-DEF_HELPER_3(vmrglb, void, avr, avr, avr)
-DEF_HELPER_3(vmrglh, void, avr, avr, avr)
-DEF_HELPER_3(vmrglw, void, avr, avr, avr)
-DEF_HELPER_3(vmrghb, void, avr, avr, avr)
-DEF_HELPER_3(vmrghh, void, avr, avr, avr)
-DEF_HELPER_3(vmrghw, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrglb, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrglh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrglw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrghb, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrghh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vmrghw, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULESB, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULESH, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULESW, TCG_CALL_NO_RWG, void, avr, avr, avr)
@@ -171,15 +171,15 @@ DEF_HELPER_FLAGS_3(VMULOSW, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUB, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUH, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_3(vslo, void, avr, avr, avr)
-DEF_HELPER_3(vsro, void, avr, avr, avr)
-DEF_HELPER_3(vsrv, void, avr, avr, avr)
-DEF_HELPER_3(vslv, void, avr, avr, avr)
-DEF_HELPER_3(vaddcuw, void, avr, avr, avr)
-DEF_HELPER_2(vprtybw, void, avr, avr)
-DEF_HELPER_2(vprtybd, void, avr, avr)
-DEF_HELPER_2(vprtybq, void, avr, avr)
-DEF_HELPER_3(vsubcuw, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vslo, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vsro, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vsrv, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vslv, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vaddcuw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_2(vprtybw, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vprtybd, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vprtybq, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_3(vsubcuw, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_5(vaddsbs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddshs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddsws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
@@ -192,19 +192,19 @@ DEF_HELPER_FLAGS_5(vadduws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vsububs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vsubuhs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vsubuws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
-DEF_HELPER_3(vadduqm, void, avr, avr, avr)
-DEF_HELPER_4(vaddecuq, void, avr, avr, avr, avr)
-DEF_HELPER_4(vaddeuqm, void, avr, avr, avr, avr)
-DEF_HELPER_3(vaddcuq, void, avr, avr, avr)
-DEF_HELPER_3(vsubuqm, void, avr, avr, avr)
-DEF_HELPER_4(vsubecuq, void, avr, avr, avr, avr)
-DEF_HELPER_4(vsubeuqm, void, avr, avr, avr, avr)
-DEF_HELPER_3(vsubcuq, void, avr, avr, avr)
-DEF_HELPER_4(vsldoi, void, avr, avr, avr, i32)
-DEF_HELPER_3(vextractub, void, avr, avr, i32)
-DEF_HELPER_3(vextractuh, void, avr, avr, i32)
-DEF_HELPER_3(vextractuw, void, avr, avr, i32)
-DEF_HELPER_3(vextractd, void, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vadduqm, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vaddecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vaddeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vaddcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vsubuqm, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vsubecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vsubeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vsubcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vsldoi, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vextractub, TCG_CALL_NO_RWG, void, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vextractuh, TCG_CALL_NO_RWG, void, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vextractuw, TCG_CALL_NO_RWG, void, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vextractd, TCG_CALL_NO_RWG, void, avr, avr, i32)
 DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSHLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSWLX, void, env, avr, i64, tl)
@@ -213,16 +213,16 @@ DEF_HELPER_FLAGS_2(VSTRIBL, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIBR, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIHL, TCG_CALL_NO_RWG, i32, avr, avr)
 DEF_HELPER_FLAGS_2(VSTRIHR, TCG_CALL_NO_RWG, i32, avr, avr)
-DEF_HELPER_2(vnegw, void, avr, avr)
-DEF_HELPER_2(vnegd, void, avr, avr)
-DEF_HELPER_2(vupkhpx, void, avr, avr)
-DEF_HELPER_2(vupklpx, void, avr, avr)
-DEF_HELPER_2(vupkhsb, void, avr, avr)
-DEF_HELPER_2(vupkhsh, void, avr, avr)
-DEF_HELPER_2(vupkhsw, void, avr, avr)
-DEF_HELPER_2(vupklsb, void, avr, avr)
-DEF_HELPER_2(vupklsh, void, avr, avr)
-DEF_HELPER_2(vupklsw, void, avr, avr)
+DEF_HELPER_FLAGS_2(vnegw, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vnegd, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupkhpx, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupklpx, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupkhsb, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupkhsh, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupkhsw, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupklsb, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupklsh, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vupklsw, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_5(vmsumubm, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsummbm, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VPERM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
@@ -239,14 +239,14 @@ DEF_HELPER_4(vpkudus, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkuhum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkuwum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkudum, void, env, avr, avr, avr)
-DEF_HELPER_3(vpkpx, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vpkpx, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_5(vmhaddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmhraddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumuhm, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumuhs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumshm, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumshs, void, env, avr, avr, avr, avr)
-DEF_HELPER_4(vmladduhm, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(vmladduhm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_2(mtvscr, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_1(mfvscr, TCG_CALL_NO_RWG, i32, env)
 DEF_HELPER_3(lvebx, void, env, avr, tl)
@@ -289,43 +289,43 @@ DEF_HELPER_4(vcfsx, void, env, avr, avr, i32)
 DEF_HELPER_4(vctuxs, void, env, avr, avr, i32)
 DEF_HELPER_4(vctsxs, void, env, avr, avr, i32)
 
-DEF_HELPER_2(vclzb, void, avr, avr)
-DEF_HELPER_2(vclzh, void, avr, avr)
-DEF_HELPER_2(vctzb, void, avr, avr)
-DEF_HELPER_2(vctzh, void, avr, avr)
-DEF_HELPER_2(vctzw, void, avr, avr)
-DEF_HELPER_2(vctzd, void, avr, avr)
-DEF_HELPER_2(vpopcntb, void, avr, avr)
-DEF_HELPER_2(vpopcnth, void, avr, avr)
-DEF_HELPER_2(vpopcntw, void, avr, avr)
-DEF_HELPER_2(vpopcntd, void, avr, avr)
-DEF_HELPER_1(vclzlsbb, tl, avr)
-DEF_HELPER_1(vctzlsbb, tl, avr)
-DEF_HELPER_3(vbpermd, void, avr, avr, avr)
-DEF_HELPER_3(vbpermq, void, avr, avr, avr)
-DEF_HELPER_3(vpmsumb, void, avr, avr, avr)
-DEF_HELPER_3(vpmsumh, void, avr, avr, avr)
-DEF_HELPER_3(vpmsumw, void, avr, avr, avr)
-DEF_HELPER_3(vpmsumd, void, avr, avr, avr)
-DEF_HELPER_2(vextublx, tl, tl, avr)
-DEF_HELPER_2(vextuhlx, tl, tl, avr)
-DEF_HELPER_2(vextuwlx, tl, tl, avr)
-DEF_HELPER_2(vextubrx, tl, tl, avr)
-DEF_HELPER_2(vextuhrx, tl, tl, avr)
-DEF_HELPER_2(vextuwrx, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vclzb, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vclzh, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vctzb, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vctzh, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vctzw, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vctzd, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vpopcntb, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vpopcnth, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vpopcntw, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_2(vpopcntd, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_1(vclzlsbb, TCG_CALL_NO_RWG, tl, avr)
+DEF_HELPER_FLAGS_1(vctzlsbb, TCG_CALL_NO_RWG, tl, avr)
+DEF_HELPER_FLAGS_3(vbpermd, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vbpermq, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vpmsumb, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vpmsumh, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vpmsumw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vpmsumd, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_2(vextublx, TCG_CALL_NO_RWG, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vextuhlx, TCG_CALL_NO_RWG, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vextuwlx, TCG_CALL_NO_RWG, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vextubrx, TCG_CALL_NO_RWG, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vextuhrx, TCG_CALL_NO_RWG, tl, tl, avr)
+DEF_HELPER_FLAGS_2(vextuwrx, TCG_CALL_NO_RWG, tl, tl, avr)
 DEF_HELPER_5(VEXTDUBVLX, void, env, avr, avr, avr, tl)
 DEF_HELPER_5(VEXTDUHVLX, void, env, avr, avr, avr, tl)
 DEF_HELPER_5(VEXTDUWVLX, void, env, avr, avr, avr, tl)
 DEF_HELPER_5(VEXTDDVLX, void, env, avr, avr, avr, tl)
 
-DEF_HELPER_2(vsbox, void, avr, avr)
-DEF_HELPER_3(vcipher, void, avr, avr, avr)
-DEF_HELPER_3(vcipherlast, void, avr, avr, avr)
-DEF_HELPER_3(vncipher, void, avr, avr, avr)
-DEF_HELPER_3(vncipherlast, void, avr, avr, avr)
-DEF_HELPER_3(vshasigmaw, void, avr, avr, i32)
-DEF_HELPER_3(vshasigmad, void, avr, avr, i32)
-DEF_HELPER_4(vpermxor, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_2(vsbox, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_3(vcipher, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vcipherlast, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vncipher, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vncipherlast, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(vshasigmaw, TCG_CALL_NO_RWG, void, avr, avr, i32)
+DEF_HELPER_FLAGS_3(vshasigmad, TCG_CALL_NO_RWG, void, avr, avr, i32)
+DEF_HELPER_FLAGS_4(vpermxor, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 
 DEF_HELPER_4(bcdadd, i32, avr, avr, avr, i32)
 DEF_HELPER_4(bcdsub, i32, avr, avr, avr, i32)
-- 
2.36.1


