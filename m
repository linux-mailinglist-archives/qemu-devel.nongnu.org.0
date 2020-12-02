Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957EF2CBA96
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:29:52 +0100 (CET)
Received: from localhost ([::1]:33236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPOR-0003by-AL
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3z-0003pk-GT
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3j-0004gW-7h
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HbfjG7ZVjkr+tyDo5BPkAPD6BaclOHJtqjsl4zi9tE=;
 b=d/FfzJzwLtC3nthbqG+OYW/lMwp8iUIdIT7+4nuGo/bGXDDssQOBFz4kFgaKI7uIkwEsNm
 nxVtWzt9JA/NAn4gYALxobuqsl3rhMpomkd0X2RjSG7NDpSX7lQveQDXhs9nKUDQ6V/6Jg
 lVJway9TxHMmI19H9lTHrap5d1ZVxXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-mXslopiVOwe_MogcjR1elA-1; Wed, 02 Dec 2020 04:04:20 -0500
X-MC-Unique: mXslopiVOwe_MogcjR1elA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1D2D1005D71;
 Wed,  2 Dec 2020 09:03:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F3045C1B4;
 Wed,  2 Dec 2020 09:03:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/28] vl: rename local variable in configure_accelerators
Date: Wed,  2 Dec 2020 04:03:02 -0500
Message-Id: <20201202090305.4129317-26-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Silly patch extracted from the next one, which is already big enough.

Because there are already local variables named "accel", we will name
the global vl.c variable for "-M accel" accelerators instead.  Rename
it already in configure_accelerators to be ready.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f083881f21..a942ce2004 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2251,17 +2251,17 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
 
 static void configure_accelerators(const char *progname)
 {
-    const char *accel;
+    const char *accelerators;
     bool init_failed = false;
 
     qemu_opts_foreach(qemu_find_opts("icount"),
                       do_configure_icount, NULL, &error_fatal);
 
-    accel = qemu_opt_get(qemu_get_machine_opts(), "accel");
+    accelerators = qemu_opt_get(qemu_get_machine_opts(), "accel");
     if (QTAILQ_EMPTY(&qemu_accel_opts.head)) {
         char **accel_list, **tmp;
 
-        if (accel == NULL) {
+        if (accelerators == NULL) {
             /* Select the default accelerator */
             bool have_tcg = accel_find("tcg");
             bool have_kvm = accel_find("kvm");
@@ -2269,21 +2269,21 @@ static void configure_accelerators(const char *progname)
             if (have_tcg && have_kvm) {
                 if (g_str_has_suffix(progname, "kvm")) {
                     /* If the program name ends with "kvm", we prefer KVM */
-                    accel = "kvm:tcg";
+                    accelerators = "kvm:tcg";
                 } else {
-                    accel = "tcg:kvm";
+                    accelerators = "tcg:kvm";
                 }
             } else if (have_kvm) {
-                accel = "kvm";
+                accelerators = "kvm";
             } else if (have_tcg) {
-                accel = "tcg";
+                accelerators = "tcg";
             } else {
                 error_report("No accelerator selected and"
                              " no default accelerator available");
                 exit(1);
             }
         }
-        accel_list = g_strsplit(accel, ":", 0);
+        accel_list = g_strsplit(accelerators, ":", 0);
 
         for (tmp = accel_list; *tmp; tmp++) {
             /*
@@ -2299,7 +2299,7 @@ static void configure_accelerators(const char *progname)
         }
         g_strfreev(accel_list);
     } else {
-        if (accel != NULL) {
+        if (accelerators != NULL) {
             error_report("The -accel and \"-machine accel=\" options are incompatible");
             exit(1);
         }
-- 
2.26.2



