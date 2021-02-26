Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CBB325EB6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:15:10 +0100 (CET)
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYHF-0002WE-OW
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY8B-0001sw-JF
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:47 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY88-0004By-Le
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:46 -0500
Received: by mail-wr1-x433.google.com with SMTP id e10so7439676wro.12
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=maJSKIWYKl0RCCJeoVPGbr174vVxdopzn3tLa+epCzM=;
 b=qYlLCGG8tjRIVgCbCBDoTH2XCivy19IgOdclmKnDsCUxxxmkAA7bFpaWwcZJf0SEkV
 n36paHVBF7M+xyAvkn+jx3wEWVJ28nM34e2hxjcD89yVm2xFTNJCXekLrLwlstfjPI19
 M880XtURAo7gTIuIwrNl0uixq09rnE1JMkJ+b2M+3wbbx/oC6lA8njK76COOEHE97LYF
 QfcIFhC7plc3iiJPsom36t8zDvAKUSUfReyiM8/bpQW7BxLG01Hmc1yQ4eSe3nrAReIl
 yigjOL94EeqOIEGngCuNN/VDsZAcd6PX5LWQTh6bRl4LpvGGZKq0zvEVLI/0mfHOJTpX
 f8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=maJSKIWYKl0RCCJeoVPGbr174vVxdopzn3tLa+epCzM=;
 b=G/8cWlPoEPLBkZEwSxNVDJNxZYu3lnYCygPM7xk1/M0QakJC5UzznP7T6nQv/ya5h9
 fuI/fYstVsp0n/nRVm9luhseBP/yUpDZgYkQ5IIfXJfRZ03kbdvNdEJI43X3BxwzIJfp
 GHGLCxY2aWDqrnh38TpetNY9AeW4p+ZIoxmhw9SQClxQcHq4Oklv/TsIpe/+Li77g9KH
 5e+jEcvP7Op0vWUnCXl9OntkALr7/6YGfXGmg/mtYPrhxsBPXZwTaAAOOSz5nv9VJC2i
 MKXWCFCYZLoUq9PtHHdbBqU/BIonwYEgjsbbJgphZ9U2Ar7w0lx0LzszsczTYa2oNEQy
 g7Qw==
X-Gm-Message-State: AOAM530ous2PSpOWn8PkCLMjtKj1GRfMMuR59wI6X4IuXx7cHYUM+sY4
 VyuCW4bLc4ZNmgqQ/wLLIkoEIsZJjKQ=
X-Google-Smtp-Source: ABdhPJxVzk0kjUqAhJmSw+G3plfDGpYYosog/cCA+EEp6DPWu83bM2tshoQprhmLZTSrzq9Rp2CYzA==
X-Received: by 2002:adf:dd81:: with SMTP id x1mr1808685wrl.233.1614326743325; 
 Fri, 26 Feb 2021 00:05:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/29] target/i386: update to show preferred boolean syntax for
 -cpu
Date: Fri, 26 Feb 2021 09:05:21 +0100
Message-Id: <20210226080526.651705-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The preferred syntax is to use "foo=on|off", rather than a bare
"+foo" or "-foo"

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210216191027.595031-11-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c                   |  2 +-
 tests/qtest/test-x86-cpuid-compat.c | 52 ++++++++++++++---------------
 2 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a53446e6a..bc6956561a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6557,7 +6557,7 @@ static void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
             } else if (cpu->env.cpuid_min_level < 0x14) {
                 mark_unavailable_features(cpu, FEAT_7_0_EBX,
                     CPUID_7_0_EBX_INTEL_PT,
-                    "Intel PT need CPUID leaf 0x14, please set by \"-cpu ...,+intel-pt,min-level=0x14\"");
+                    "Intel PT need CPUID leaf 0x14, please set by \"-cpu ...,intel-pt=on,min-level=0x14\"");
             }
         }
 
diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-cpuid-compat.c
index 7ca1883a29..6470f0a85d 100644
--- a/tests/qtest/test-x86-cpuid-compat.c
+++ b/tests/qtest/test-x86-cpuid-compat.c
@@ -235,82 +235,82 @@ int main(int argc, char **argv)
     /* If level is not large enough, it should increase automatically: */
     /* CPUID[6].EAX: */
     add_cpuid_test("x86/cpuid/auto-level/phenom/arat",
-                   "-cpu 486,+arat", "level", 6);
+                   "-cpu 486,arat=on", "level", 6);
     /* CPUID[EAX=7,ECX=0].EBX: */
     add_cpuid_test("x86/cpuid/auto-level/phenom/fsgsbase",
-                   "-cpu phenom,+fsgsbase", "level", 7);
+                   "-cpu phenom,fsgsbase=on", "level", 7);
     /* CPUID[EAX=7,ECX=0].ECX: */
     add_cpuid_test("x86/cpuid/auto-level/phenom/avx512vbmi",
-                   "-cpu phenom,+avx512vbmi", "level", 7);
+                   "-cpu phenom,avx512vbmi=on", "level", 7);
     /* CPUID[EAX=0xd,ECX=1].EAX: */
     add_cpuid_test("x86/cpuid/auto-level/phenom/xsaveopt",
-                   "-cpu phenom,+xsaveopt", "level", 0xd);
+                   "-cpu phenom,xsaveopt=on", "level", 0xd);
     /* CPUID[8000_0001].EDX: */
     add_cpuid_test("x86/cpuid/auto-xlevel/486/3dnow",
-                   "-cpu 486,+3dnow", "xlevel", 0x80000001);
+                   "-cpu 486,3dnow=on", "xlevel", 0x80000001);
     /* CPUID[8000_0001].ECX: */
     add_cpuid_test("x86/cpuid/auto-xlevel/486/sse4a",
-                   "-cpu 486,+sse4a", "xlevel", 0x80000001);
+                   "-cpu 486,sse4a=on", "xlevel", 0x80000001);
     /* CPUID[8000_0007].EDX: */
     add_cpuid_test("x86/cpuid/auto-xlevel/486/invtsc",
-                   "-cpu 486,+invtsc", "xlevel", 0x80000007);
+                   "-cpu 486,invtsc=on", "xlevel", 0x80000007);
     /* CPUID[8000_000A].EDX: */
     add_cpuid_test("x86/cpuid/auto-xlevel/486/npt",
-                   "-cpu 486,+svm,+npt", "xlevel", 0x8000000A);
+                   "-cpu 486,svm=on,npt=on", "xlevel", 0x8000000A);
     /* CPUID[C000_0001].EDX: */
     add_cpuid_test("x86/cpuid/auto-xlevel2/phenom/xstore",
-                   "-cpu phenom,+xstore", "xlevel2", 0xC0000001);
+                   "-cpu phenom,xstore=on", "xlevel2", 0xC0000001);
     /* SVM needs CPUID[0x8000000A] */
     add_cpuid_test("x86/cpuid/auto-xlevel/athlon/svm",
-                   "-cpu athlon,+svm", "xlevel", 0x8000000A);
+                   "-cpu athlon,svm=on", "xlevel", 0x8000000A);
 
 
     /* If level is already large enough, it shouldn't change: */
     add_cpuid_test("x86/cpuid/auto-level/SandyBridge/multiple",
-                   "-cpu SandyBridge,+arat,+fsgsbase,+avx512vbmi",
+                   "-cpu SandyBridge,arat=on,fsgsbase=on,avx512vbmi=on",
                    "level", 0xd);
     /* If level is explicitly set, it shouldn't change: */
     add_cpuid_test("x86/cpuid/auto-level/486/fixed/0xF",
-                   "-cpu 486,level=0xF,+arat,+fsgsbase,+avx512vbmi,+xsaveopt",
+                   "-cpu 486,level=0xF,arat=on,fsgsbase=on,avx512vbmi=on,xsaveopt=on",
                    "level", 0xF);
     add_cpuid_test("x86/cpuid/auto-level/486/fixed/2",
-                   "-cpu 486,level=2,+arat,+fsgsbase,+avx512vbmi,+xsaveopt",
+                   "-cpu 486,level=2,arat=on,fsgsbase=on,avx512vbmi=on,xsaveopt=on",
                    "level", 2);
     add_cpuid_test("x86/cpuid/auto-level/486/fixed/0",
-                   "-cpu 486,level=0,+arat,+fsgsbase,+avx512vbmi,+xsaveopt",
+                   "-cpu 486,level=0,arat=on,fsgsbase=on,avx512vbmi=on,xsaveopt=on",
                    "level", 0);
 
     /* if xlevel is already large enough, it shouldn't change: */
     add_cpuid_test("x86/cpuid/auto-xlevel/phenom/3dnow",
-                   "-cpu phenom,+3dnow,+sse4a,+invtsc,+npt,+svm",
+                   "-cpu phenom,3dnow=on,sse4a=on,invtsc=on,npt=on,svm=on",
                    "xlevel", 0x8000001A);
     /* If xlevel is explicitly set, it shouldn't change: */
     add_cpuid_test("x86/cpuid/auto-xlevel/486/fixed/80000002",
-                   "-cpu 486,xlevel=0x80000002,+3dnow,+sse4a,+invtsc,+npt,+svm",
+                   "-cpu 486,xlevel=0x80000002,3dnow=on,sse4a=on,invtsc=on,npt=on,svm=on",
                    "xlevel", 0x80000002);
     add_cpuid_test("x86/cpuid/auto-xlevel/486/fixed/8000001A",
-                   "-cpu 486,xlevel=0x8000001A,+3dnow,+sse4a,+invtsc,+npt,+svm",
+                   "-cpu 486,xlevel=0x8000001A,3dnow=on,sse4a=on,invtsc=on,npt=on,svm=on",
                    "xlevel", 0x8000001A);
     add_cpuid_test("x86/cpuid/auto-xlevel/phenom/fixed/0",
-                   "-cpu 486,xlevel=0,+3dnow,+sse4a,+invtsc,+npt,+svm",
+                   "-cpu 486,xlevel=0,3dnow=on,sse4a=on,invtsc=on,npt=on,svm=on",
                    "xlevel", 0);
 
     /* if xlevel2 is already large enough, it shouldn't change: */
     add_cpuid_test("x86/cpuid/auto-xlevel2/486/fixed",
-                   "-cpu 486,xlevel2=0xC0000002,+xstore",
+                   "-cpu 486,xlevel2=0xC0000002,xstore=on",
                    "xlevel2", 0xC0000002);
 
     /* Check compatibility of old machine-types that didn't
      * auto-increase level/xlevel/xlevel2: */
 
     add_cpuid_test("x86/cpuid/auto-level/pc-2.7",
-                   "-machine pc-i440fx-2.7 -cpu 486,+arat,+avx512vbmi,+xsaveopt",
+                   "-machine pc-i440fx-2.7 -cpu 486,arat=on,avx512vbmi=on,xsaveopt=on",
                    "level", 1);
     add_cpuid_test("x86/cpuid/auto-xlevel/pc-2.7",
-                   "-machine pc-i440fx-2.7 -cpu 486,+3dnow,+sse4a,+invtsc,+npt,+svm",
+                   "-machine pc-i440fx-2.7 -cpu 486,3dnow=on,sse4a=on,invtsc=on,npt=on,svm=on",
                    "xlevel", 0);
     add_cpuid_test("x86/cpuid/auto-xlevel2/pc-2.7",
-                   "-machine pc-i440fx-2.7 -cpu 486,+xstore",
+                   "-machine pc-i440fx-2.7 -cpu 486,xstore=on",
                    "xlevel2", 0);
     /*
      * QEMU 1.4.0 had auto-level enabled for CPUID[7], already,
@@ -321,19 +321,19 @@ int main(int argc, char **argv)
                    "-machine pc-i440fx-1.4 -cpu Nehalem",
                    "level", 2);
     add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-1.5/on",
-                   "-machine pc-i440fx-1.4 -cpu Nehalem,+smap",
+                   "-machine pc-i440fx-1.4 -cpu Nehalem,smap=on",
                    "level", 7);
     add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.3/off",
                    "-machine pc-i440fx-2.3 -cpu Penryn",
                    "level", 4);
     add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.3/on",
-                   "-machine pc-i440fx-2.3 -cpu Penryn,+erms",
+                   "-machine pc-i440fx-2.3 -cpu Penryn,erms=on",
                    "level", 7);
     add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/off",
                    "-machine pc-i440fx-2.9 -cpu Conroe",
                    "level", 10);
     add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/on",
-                   "-machine pc-i440fx-2.9 -cpu Conroe,+erms",
+                   "-machine pc-i440fx-2.9 -cpu Conroe,erms=on",
                    "level", 10);
 
     /*
@@ -348,7 +348,7 @@ int main(int argc, char **argv)
                    "-machine pc-i440fx-2.4 -cpu SandyBridge,",
                    "xlevel", 0x80000008);
     add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.4/npt-on",
-                   "-machine pc-i440fx-2.4 -cpu SandyBridge,+svm,+npt",
+                   "-machine pc-i440fx-2.4 -cpu SandyBridge,svm=on,npt=on",
                    "xlevel", 0x80000008);
 
     /* Test feature parsing */
-- 
2.29.2



