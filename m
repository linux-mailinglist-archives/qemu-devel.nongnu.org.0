Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB384430C0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:47:28 +0100 (CET)
Received: from localhost ([::1]:52002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhv4R-0006n5-S2
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mhugd-0006hl-4F
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:22:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mhugX-000393-Hp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635862965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOblfPXyGFEBBkq4AwAqMHMCqL14xT0ENw0fRgWI2zg=;
 b=EDnM7VJqDpqbDg1igwJcQY9/ZbeaMNKIWBWgQbC8R+q/CYYR3yRI8L0ccf3Sn2W2nycQFq
 kIrULbdg0pP0/+ny/6Kp3DM3/fBW77OvPXLOSrw1T8jgkfY1og1t6/eziC2CH00crSBSmv
 BEh6xgRd9xEzKCuFHz2qmUo6SMzglvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-67YxZR2RPdyZddMPs8FrtQ-1; Tue, 02 Nov 2021 10:22:41 -0400
X-MC-Unique: 67YxZR2RPdyZddMPs8FrtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC098876ED2;
 Tue,  2 Nov 2021 14:22:40 +0000 (UTC)
Received: from localhost (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B302271F;
 Tue,  2 Nov 2021 14:22:40 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 3/4] vmdk: allow specification of tools version
Date: Tue,  2 Nov 2021 15:22:18 +0100
Message-Id: <20211102142219.697650-4-hreitz@redhat.com>
In-Reply-To: <20211102142219.697650-1-hreitz@redhat.com>
References: <20211102142219.697650-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Weißschuh <thomas.weissschuh.ext@zeiss.com>

VMDK files support an attribute that represents the version of the guest
tools that are installed on the disk.
This attribute is used by vSphere before a machine has been started to
determine if the VM has the guest tools installed.
This is important when configuring "Operating system customizations" in
vSphere, as it checks for the presence of the guest tools before
allowing those customizations.
Thus when the VM has not yet booted normally it would be impossible to
customize it, therefore preventing a customized first-boot.

The attribute should not hurt on disks that do not have the guest tools
installed and indeed the VMware tools also unconditionally add this
attribute.
(Defaulting to the value "2147483647", as is done in this patch)

Signed-off-by: Thomas Weißschuh <thomas.weissschuh.ext@zeiss.com>
Message-Id: <20210913130419.13241-1-thomas.weissschuh.ext@zeiss.com>
[hreitz: Added missing '#' in block-core.json]
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 qapi/block-core.json |  3 +++
 block/vmdk.c         | 24 ++++++++++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index ce2c1352cb..69698a4ffe 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4691,6 +4691,8 @@
 # @adapter-type: The adapter type used to fill in the descriptor. Default: ide.
 # @hwversion: Hardware version. The meaningful options are "4" or "6".
 #             Default: "4".
+# @toolsversion: VMware guest tools version.
+#                Default: "2147483647" (Since 6.2)
 # @zeroed-grain: Whether to enable zeroed-grain feature for sparse subformats.
 #                Default: false.
 #
@@ -4704,6 +4706,7 @@
             '*backing-file':    'str',
             '*adapter-type':    'BlockdevVmdkAdapterType',
             '*hwversion':       'str',
+            '*toolsversion':    'str',
             '*zeroed-grain':    'bool' } }
 
 
diff --git a/block/vmdk.c b/block/vmdk.c
index fb4cc9da90..0dfab6e941 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -60,6 +60,7 @@
 #define VMDK_ZEROED  (-3)
 
 #define BLOCK_OPT_ZEROED_GRAIN "zeroed_grain"
+#define BLOCK_OPT_TOOLSVERSION "toolsversion"
 
 typedef struct {
     uint32_t version;
@@ -2344,6 +2345,7 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
                                           BlockdevVmdkAdapterType adapter_type,
                                           const char *backing_file,
                                           const char *hw_version,
+                                          const char *toolsversion,
                                           bool compat6,
                                           bool zeroed_grain,
                                           vmdk_create_extent_fn extent_fn,
@@ -2384,7 +2386,8 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
         "ddb.geometry.cylinders = \"%" PRId64 "\"\n"
         "ddb.geometry.heads = \"%" PRIu32 "\"\n"
         "ddb.geometry.sectors = \"63\"\n"
-        "ddb.adapterType = \"%s\"\n";
+        "ddb.adapterType = \"%s\"\n"
+        "ddb.toolsVersion = \"%s\"\n";
 
     ext_desc_lines = g_string_new(NULL);
 
@@ -2401,6 +2404,9 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
     if (!hw_version) {
         hw_version = "4";
     }
+    if (!toolsversion) {
+        toolsversion = "2147483647";
+    }
 
     if (adapter_type != BLOCKDEV_VMDK_ADAPTER_TYPE_IDE) {
         /* that's the number of heads with which vmware operates when
@@ -2525,7 +2531,8 @@ static int coroutine_fn vmdk_co_do_create(int64_t size,
                            size /
                                (int64_t)(63 * number_heads * BDRV_SECTOR_SIZE),
                            number_heads,
-                           BlockdevVmdkAdapterType_str(adapter_type));
+                           BlockdevVmdkAdapterType_str(adapter_type),
+                           toolsversion);
     desc_len = strlen(desc);
     /* the descriptor offset = 0x200 */
     if (!split && !flat) {
@@ -2617,6 +2624,7 @@ static int coroutine_fn vmdk_co_create_opts(BlockDriver *drv,
     BlockdevVmdkAdapterType adapter_type_enum;
     char *backing_file = NULL;
     char *hw_version = NULL;
+    char *toolsversion = NULL;
     char *fmt = NULL;
     BlockdevVmdkSubformat subformat;
     int ret = 0;
@@ -2649,6 +2657,7 @@ static int coroutine_fn vmdk_co_create_opts(BlockDriver *drv,
     adapter_type = qemu_opt_get_del(opts, BLOCK_OPT_ADAPTER_TYPE);
     backing_file = qemu_opt_get_del(opts, BLOCK_OPT_BACKING_FILE);
     hw_version = qemu_opt_get_del(opts, BLOCK_OPT_HWVERSION);
+    toolsversion = qemu_opt_get_del(opts, BLOCK_OPT_TOOLSVERSION);
     compat6 = qemu_opt_get_bool_del(opts, BLOCK_OPT_COMPAT6, false);
     if (strcmp(hw_version, "undefined") == 0) {
         g_free(hw_version);
@@ -2692,14 +2701,15 @@ static int coroutine_fn vmdk_co_create_opts(BlockDriver *drv,
         .opts = opts,
     };
     ret = vmdk_co_do_create(total_size, subformat, adapter_type_enum,
-                            backing_file, hw_version, compat6, zeroed_grain,
-                            vmdk_co_create_opts_cb, &data, errp);
+                            backing_file, hw_version, toolsversion, compat6,
+                            zeroed_grain, vmdk_co_create_opts_cb, &data, errp);
 
 exit:
     g_free(backing_fmt);
     g_free(adapter_type);
     g_free(backing_file);
     g_free(hw_version);
+    g_free(toolsversion);
     g_free(fmt);
     g_free(desc);
     g_free(path);
@@ -2782,6 +2792,7 @@ static int coroutine_fn vmdk_co_create(BlockdevCreateOptions *create_options,
                             opts->adapter_type,
                             opts->backing_file,
                             opts->hwversion,
+                            opts->toolsversion,
                             false,
                             opts->zeroed_grain,
                             vmdk_co_create_cb,
@@ -3031,6 +3042,11 @@ static QemuOptsList vmdk_create_opts = {
             .help = "VMDK hardware version",
             .def_value_str = "undefined"
         },
+        {
+            .name = BLOCK_OPT_TOOLSVERSION,
+            .type = QEMU_OPT_STRING,
+            .help = "VMware guest tools version",
+        },
         {
             .name = BLOCK_OPT_SUBFMT,
             .type = QEMU_OPT_STRING,
-- 
2.31.1


