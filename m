Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB531D0D2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:19:11 +0100 (CET)
Received: from localhost ([::1]:49816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5sM-0008SY-QW
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kX-0002qj-V2
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:11:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kP-0004Rv-Lx
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613502655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYu1HcfbRjMDOL+3Zu/RTEPh1T7xwLWjSMQEHtMFLQY=;
 b=CkM6LHzYhlqdst7dqtBfMukZDyNS0gxYt13uaGak/+KVZEEOICCZLR+awji7+j6m7aUf9Q
 3o5eznpop3pN7h0jiDG36Mre+/XcVS3HDbrxWcJoaCWWWtuC/qKvxBpcm0vL342mT6PCzp
 nN/H2tjBeOWmRYPFGnMASnQG7RWENQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602--KIKbPseNZWYL8JiLEQcXA-1; Tue, 16 Feb 2021 14:10:53 -0500
X-MC-Unique: -KIKbPseNZWYL8JiLEQcXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A9F41842A99;
 Tue, 16 Feb 2021 19:10:52 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6C785C1B4;
 Tue, 16 Feb 2021 19:10:50 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] target/i386: update to show preferred boolean syntax
 for -cpu
Date: Tue, 16 Feb 2021 19:10:27 +0000
Message-Id: <20210216191027.595031-11-berrange@redhat.com>
In-Reply-To: <20210216191027.595031-1-berrange@redhat.com>
References: <20210216191027.595031-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The preferred syntax is to use "foo=on|off", rather than a bare
"+foo" or "-foo"

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/cpu.c                   |  2 +-
 tests/qtest/test-x86-cpuid-compat.c | 52 ++++++++++++++---------------
 2 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9c3d2d60b7..a5091cc85c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6451,7 +6451,7 @@ static void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
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


