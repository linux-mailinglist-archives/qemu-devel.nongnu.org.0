Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9F8586E79
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:19:51 +0200 (CEST)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIY90-0002Pf-6D
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlY-0003B6-Vg
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlW-0001Oh-Pn
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659369332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qm3Rnpg7XVlJe/bJFTQHtSraHoU5qnMN9t0Vzl1kYRo=;
 b=acWIR2k/1/hoD7XdOYdfn6o3ahfwnufuYmpUy40dA1axYXuHyMV879C/+vDhbFQZHGpFHk
 k5UnFJBWXF47a/aBBPXgUPEEMSuVcYo1nl2XAoV01C04yMn3Y8LnfDIar8lxmWUcUx8Zuy
 iGKqvYnPdum7iPngGK7Dimsy/Kl6gVw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-tFYhkIYzPjWVwLiKwv0RZA-1; Mon, 01 Aug 2022 11:55:29 -0400
X-MC-Unique: tFYhkIYzPjWVwLiKwv0RZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A1FE382C96B;
 Mon,  1 Aug 2022 15:55:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB886909FF;
 Mon,  1 Aug 2022 15:55:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 berrange@redhat.com
Subject: [PULL 6/7] trivial: Fix duplicated words
Date: Mon,  1 Aug 2022 17:55:05 +0200
Message-Id: <20220801155506.254316-7-thuth@redhat.com>
In-Reply-To: <20220801155506.254316-1-thuth@redhat.com>
References: <20220801155506.254316-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Some files wrongly contain the same word twice in a row.
One of them should be removed or replaced.

Message-Id: <20220722145859.1952732-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/omap2.c                                | 2 +-
 hw/misc/mac_via.c                             | 2 +-
 target/arm/helper.c                           | 2 +-
 ui/vdagent.c                                  | 2 +-
 tests/docker/dockerfiles/debian-native.docker | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 02b1aa8c97..8571eedd73 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -274,7 +274,7 @@ static void omap_eac_format_update(struct omap_eac_s *s)
     fmt.freq = s->codec.rate;
     /* TODO: signedness possibly depends on the CODEC hardware - or
      * does I2S specify it?  */
-    /* All register writes are 16 bits so we we store 16-bit samples
+    /* All register writes are 16 bits so we store 16-bit samples
      * in the buffers regardless of AGCFR[B8_16] value.  */
     fmt.fmt = AUDIO_FORMAT_U16;
 
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index fba85a53d7..f42c12755a 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -587,7 +587,7 @@ static void adb_via_poll(void *opaque)
         /*
          * For older Linux kernels that switch to IDLE mode after sending the
          * ADB command, detect if there is an existing response and return that
-         * as a a "fake" autopoll reply or bus timeout accordingly
+         * as a "fake" autopoll reply or bus timeout accordingly
          */
         *data = v1s->adb_data_out[0];
         olen = v1s->adb_data_in_size;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1a8b06410e..e1bdc80c35 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3898,7 +3898,7 @@ static const ARMCPRegInfo cache_dirty_status_cp_reginfo[] = {
 };
 
 static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
-    /* We never have a a block transfer operation in progress */
+    /* We never have a block transfer operation in progress */
     { .name = "BXSR", .cp = 15, .crn = 7, .crm = 12, .opc1 = 0, .opc2 = 4,
       .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_NO_RAW,
       .resetvalue = 0 },
diff --git a/ui/vdagent.c b/ui/vdagent.c
index aa6167f0b4..a899eed195 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -544,7 +544,7 @@ static void vdagent_clipboard_recv_grab(VDAgentChardev *vd, uint8_t s, uint32_t
     if (size > sizeof(uint32_t) * 10) {
         /*
          * spice has 6 types as of 2021. Limiting to 10 entries
-         * so we we have some wiggle room.
+         * so we have some wiggle room.
          */
         return;
     }
diff --git a/tests/docker/dockerfiles/debian-native.docker b/tests/docker/dockerfiles/debian-native.docker
index efd55cb6e0..8dd033097c 100644
--- a/tests/docker/dockerfiles/debian-native.docker
+++ b/tests/docker/dockerfiles/debian-native.docker
@@ -1,7 +1,7 @@
 #
 # Docker Debian Native
 #
-# This this intended to build QEMU on native host systems. Debian is
+# This is intended to build QEMU on native host systems. Debian is
 # chosen due to the broadest range on supported host systems for QEMU.
 #
 # This docker target is based on the docker.io Debian Bullseye base
-- 
2.31.1


