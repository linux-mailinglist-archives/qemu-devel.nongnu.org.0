Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4BB53E52C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:56:07 +0200 (CEST)
Received: from localhost ([::1]:56976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyE9H-00089h-2J
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrA-0002Do-RI
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr8-0000bW-Vb
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Lrvdmzz0T81NDthejZxcrRFndwFvF+/chJqMFxJ2sI=;
 b=Wcu9QOZ0s17qeCGHJFV1HkAa6wIklmV82j4SeMHu5rwHaUqNQzyjPYKF1xCQ2i5VwVosve
 NXU6rvHUMxfkicW9hgnjR4pCUPgm2DEP4tkhtdDz5fV0cEbqoQ/X5m5G1B1TbjBKpBm3xh
 Sy7uk++nW8c3ZsL+JJ4A8hwHxiHao4U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-pWklu4ZDM7q8yuDv1ZglhA-1; Mon, 06 Jun 2022 10:37:21 -0400
X-MC-Unique: pWklu4ZDM7q8yuDv1ZglhA-1
Received: by mail-wr1-f69.google.com with SMTP id
 m18-20020adff392000000b0021848a78a53so350080wro.19
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Lrvdmzz0T81NDthejZxcrRFndwFvF+/chJqMFxJ2sI=;
 b=waMTnde5YYw3f5zN7j5U97Iiaxzj5eqPM8eIOQpqIF1Y1Zs4yAB9qAmhZP2juSUR9L
 NMQdVMQ6oeNRs637LA6BSGlsMLmaeKcPn1KxJL0pMbcmLTmmU01QsMeznKWctdNBuY0f
 2cMXnfCggvDl4uz3ZZOBi+n3f+4OSourkjQmXhwUEMwFIU11Gdx7dkn0N8jHCen19FTy
 q6HXHf55shWNpgkJVjnBQPFis7fBuEkeNCnUxPg2SIzBGFh0rM+A5b3zYhxucVE52tfC
 YDT8uGpSYcXK9wpbOvWW5Y/7Skod+r+oi5RiGUmEVVjkNThBSP5akt1lqHgXCkfe1so+
 /6+w==
X-Gm-Message-State: AOAM530D77eyaGGuaWHpZsiI5L8AUxtiZiam6gITZ8e8fEOhSiD26fLY
 ADRo+jPIb1phkXaqtTL/xcIM/NTslqNV1jjIwZmSFOZdvQfYqP8DGhOjD5hghF/4e32oty1y6IZ
 fwhzQSvdiDS1n1y4IrmLm8PsIskITUBgHRqNWlvoET0T97MPGTqQT4YYdzMKii8mQSTs=
X-Received: by 2002:a05:600c:4e4d:b0:397:5009:bcf1 with SMTP id
 e13-20020a05600c4e4d00b003975009bcf1mr52168806wmq.66.1654526239251; 
 Mon, 06 Jun 2022 07:37:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5lOX0YqmvEtZHIssRajiSmdSgZoarJMLaMxsThWPFjxdASCibEcuhe8xqyf8488o0uy3oiQ==
X-Received: by 2002:a05:600c:4e4d:b0:397:5009:bcf1 with SMTP id
 e13-20020a05600c4e4d00b003975009bcf1mr52168755wmq.66.1654526238720; 
 Mon, 06 Jun 2022 07:37:18 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 c9-20020adfe749000000b002108ab90e5asm15652885wrn.58.2022.06.06.07.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 17/29] x86: cpu: fixup number of addressable IDs for logical
 processors sharing cache
Date: Mon,  6 Jun 2022 16:36:32 +0200
Message-Id: <20220606143644.1151112-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Igor Mammedov <imammedo@redhat.com>

When QEMU is started with '-cpu host,host-cache-info=on', it will
passthrough host's number of logical processors sharing cache and
number of processor cores in the physical package. QEMU already
fixes up the later to correctly reflect number of configured cores
for VM, however number of logical processors sharing cache is still
comes from host CPU, which confuses guest started with:

       -machine q35,accel=kvm \
       -cpu host,host-cache-info=on,l3-cache=off \
       -smp 20,sockets=2,dies=1,cores=10,threads=1  \
       -numa node,nodeid=0,memdev=ram-node0 \
       -numa node,nodeid=1,memdev=ram-node1 \
       -numa cpu,socket-id=0,node-id=0 \
       -numa cpu,socket-id=1,node-id=1

on 2 socket Xeon 4210R host with 10 cores per socket
with CPUID[04H]:
      ...
        --- cache 3 ---
      cache type                           = unified cache (3)
      cache level                          = 0x3 (3)
      self-initializing cache level        = true
      fully associative cache              = false
      maximum IDs for CPUs sharing cache   = 0x1f (31)
      maximum IDs for cores in pkg         = 0xf (15)
      ...
that doesn't match number of logical processors VM was
configured with and as result RHEL 9.0 guest complains:

   sched: CPU #10's llc-sibling CPU #0 is not on the same node! [node: 1 != 0]. Ignoring dependency.
   WARNING: CPU: 10 PID: 0 at arch/x86/kernel/smpboot.c:421 topology_sane.isra.0+0x67/0x80
   ...
   Call Trace:
     set_cpu_sibling_map+0x176/0x590
     start_secondary+0x5b/0x150
     secondary_startup_64_no_verify+0xc2/0xcb

Fix it by capping max number of logical processors to vcpus/socket
as it was configured, which fixes the issue.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2088311
Message-Id: <20220524151020.2541698-3-imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 94cc4a8700..6a57ef13af 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5284,10 +5284,22 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         /* cache info: needed for Core compatibility */
         if (cpu->cache_info_passthrough) {
             x86_cpu_get_cache_cpuid(index, count, eax, ebx, ecx, edx);
-            /* QEMU gives out its own APIC IDs, never pass down bits 31..26.  */
-            *eax &= ~0xFC000000;
-            if ((*eax & 31) && cs->nr_cores > 1) {
-                *eax |= (pow2ceil(cs->nr_cores) - 1) << 26;
+            /*
+             * QEMU has its own number of cores/logical cpus,
+             * set 24..14, 31..26 bit to configured values
+             */
+            if (*eax & 31) {
+                int host_vcpus_per_cache = 1 + ((*eax & 0x3FFC000) >> 14);
+                int vcpus_per_socket = env->nr_dies * cs->nr_cores *
+                                       cs->nr_threads;
+                if (cs->nr_cores > 1) {
+                    *eax &= ~0xFC000000;
+                    *eax |= (pow2ceil(cs->nr_cores) - 1) << 26;
+                }
+                if (host_vcpus_per_cache > vcpus_per_socket) {
+                    *eax &= ~0x3FFC000;
+                    *eax |= (pow2ceil(vcpus_per_socket) - 1) << 14;
+                }
             }
         } else if (cpu->vendor_cpuid_only && IS_AMD_CPU(env)) {
             *eax = *ebx = *ecx = *edx = 0;
-- 
2.36.1



