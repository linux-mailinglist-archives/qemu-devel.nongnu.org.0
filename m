Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775062F03D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 09:57:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovx9x-0001ZP-Kw; Fri, 18 Nov 2022 03:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ovx9w-0001Ym-32
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:55:40 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1ovx9u-0002K9-8u
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:55:39 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 15C6E1F37F;
 Fri, 18 Nov 2022 08:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668761736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LfdaOp+z78VCMVEbRfl2v6LJyloWFRkdGtZzuM7nSN0=;
 b=oUcTZeI3xkCTDqgL6bDXnT2+N3JWnP0zdIMO6nTzlGIAkmvGW/F12dkjHjLbAj4DhmhUfz
 9XkpO6qN2qrPPReajpPZszpJu1JaqcaBYxs95b/6hC9wrGYPnHYBVZUaYM0WDZAszPS0yv
 ZeyhPuvGlUsNH2Jf2Rd8ax9li34g754=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C816613A66;
 Fri, 18 Nov 2022 08:55:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i7rbLodId2PfCAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Fri, 18 Nov 2022 08:55:35 +0000
Subject: [PATCH v2] pc: q35: Bump max_cpus to 1024
From: Dario Faggioli <dfaggioli@suse.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Fri, 18 Nov 2022 09:55:35 +0100
Message-ID: <166876173513.24238.8968021290016401421.stgit@tumbleweed.Wayrath>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=dfaggioli@suse.com; helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Keep the old limit of 288 for machine versions 7.2 and earlier.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
Changes from v1:
- fix actually keeping the old max value for the 7.2 machine type,
  which was the original goal, but was done wrongly

---
This is related to:

https://lore.kernel.org/qemu-devel/c705d0d8d6ed1a520b1ff92cb2f83fef19522d30.camel@suse.com/

With this applied to QEMU, I've been able to start a VM with as high as
980 vCPUs (even if I was on an host with 384 pCPUs, so everything was
super slow!). After that, I started to see messages like this:

"SMBIOS 2.1 table length 66822 exceeds 65535"

Basing on the discussion happening in that thread, I'm going straight
to 1024, as it seems to me that it's going to be working well soon
(especially considering that this is meant for next release, not for
7.2)

Thanks and Regards
---
 hw/i386/pc_q35.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a496bd6e74..54804337e9 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -367,7 +367,7 @@ static void pc_q35_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
-    m->max_cpus = 288;
+    m->max_cpus = 1024;
 }
 
 static void pc_q35_7_2_machine_options(MachineClass *m)
@@ -375,6 +375,7 @@ static void pc_q35_7_2_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
     m->alias = "q35";
+    m->max_cpus = 288;
     pcmc->default_cpu_version = 1;
 }
 



