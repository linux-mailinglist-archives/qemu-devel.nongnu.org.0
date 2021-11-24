Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D037B45B470
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 07:44:29 +0100 (CET)
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpm16-0002Ja-Df
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 01:44:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpltp-0008I4-Gl
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:36:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpltn-0007db-DO
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637735814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xWPVOqX47JZkNlJazBDCDv77dr17FjSiIT76Vd4ex6Y=;
 b=gVuO3o+qieqYblDbTSiCuwZsuWHPJWtmhC4pMWpDLYR+KnvxvPo4NcieFeWjaBxidxe1kG
 GreFD6IxDvOwI3gKS7+FuMip685vLor0/kAAvxomnYGK0GEb+VS4Lg+LYWfGvl3WcRqiY8
 lwzQ6oXWl6EnbnmDpwnt98heNprNMSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-FvqvCttJPayRHUAmsJfF2Q-1; Wed, 24 Nov 2021 01:36:51 -0500
X-MC-Unique: FvqvCttJPayRHUAmsJfF2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79D951DDEB;
 Wed, 24 Nov 2021 06:36:50 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4669100EBBF;
 Wed, 24 Nov 2021 06:36:49 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/4] include/sysemu/blockdev.h: rename if_name in block_if_name
Date: Wed, 24 Nov 2021 01:36:38 -0500
Message-Id: <20211124063640.3118897-3-eesposit@redhat.com>
In-Reply-To: <20211124063640.3118897-1-eesposit@redhat.com>
References: <20211124063640.3118897-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation to next patch, where we export it to be used
also in softmmu/vlc.c

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockdev.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index b35072644e..1b6ffbbc73 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -71,7 +71,7 @@ void bdrv_set_monitor_owned(BlockDriverState *bs)
     QTAILQ_INSERT_TAIL(&monitor_bdrv_states, bs, monitor_list);
 }
 
-static const char *const if_name[IF_COUNT] = {
+static const char *const block_if_name[IF_COUNT] = {
     [IF_NONE] = "none",
     [IF_IDE] = "ide",
     [IF_SCSI] = "scsi",
@@ -120,7 +120,7 @@ void override_max_devs(BlockInterfaceType type, int max_devs)
         if (dinfo->type == type) {
             fprintf(stderr, "Cannot override units-per-bus property of"
                     " the %s interface, because a drive of that type has"
-                    " already been added.\n", if_name[type]);
+                    " already been added.\n", block_if_name[type]);
             g_assert_not_reached();
         }
     }
@@ -212,7 +212,7 @@ QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
         return NULL;
     }
     if (type != IF_DEFAULT) {
-        qemu_opt_set(opts, "if", if_name[type], &error_abort);
+        qemu_opt_set(opts, "if", block_if_name[type], &error_abort);
     }
     if (index >= 0) {
         qemu_opt_set_number(opts, "index", index, &error_abort);
@@ -269,7 +269,7 @@ void drive_check_orphaned(void)
             qemu_opts_loc_restore(dinfo->opts);
             error_report("machine type does not support"
                          " if=%s,bus=%d,unit=%d",
-                         if_name[dinfo->type], dinfo->bus, dinfo->unit);
+                         block_if_name[dinfo->type], dinfo->bus, dinfo->unit);
             loc_pop(&loc);
             orphans = true;
         }
@@ -887,7 +887,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
     value = qemu_opt_get(legacy_opts, "if");
     if (value) {
         for (type = 0;
-             type < IF_COUNT && strcmp(value, if_name[type]);
+             type < IF_COUNT && strcmp(value, block_if_name[type]);
              type++) {
         }
         if (type == IF_COUNT) {
@@ -945,10 +945,10 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
             mediastr = (media == MEDIA_CDROM) ? "-cd" : "-hd";
         }
         if (max_devs) {
-            new_id = g_strdup_printf("%s%i%s%i", if_name[type], bus_id,
+            new_id = g_strdup_printf("%s%i%s%i", block_if_name[type], bus_id,
                                      mediastr, unit_id);
         } else {
-            new_id = g_strdup_printf("%s%s%i", if_name[type],
+            new_id = g_strdup_printf("%s%s%i", block_if_name[type],
                                      mediastr, unit_id);
         }
         qdict_put_str(bs_opts, "id", new_id);
-- 
2.27.0


