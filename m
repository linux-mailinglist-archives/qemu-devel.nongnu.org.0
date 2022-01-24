Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7FE4991C4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:17:19 +0100 (CET)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5mA-0005td-6X
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:17:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CwjvYQcKCuwjSbhifSUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--venture.bounces.google.com>)
 id 1nC5h0-0001VS-J9
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:11:58 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=37487
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CwjvYQcKCuwjSbhifSUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--venture.bounces.google.com>)
 id 1nC5gy-0002cF-RD
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:11:58 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 v70-20020a25c549000000b006130de5790aso37042279ybe.4
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=1nHZ62rYJ5DDP40SfGf8ieLj3Ru3dy+9vCvs9k2i+fg=;
 b=nVoL61PSzgL+drHTD5knYfsiyhu6deP9o3SelReRaZ10m3qEr+URfQvSOkTvv6EXYj
 F52sjPE2JAzR+kAkRZ0Clx+uzfftIKcBvF0JvhN+xKWQOTGnXW0ejJ0Lb/TmUcU6aWwx
 EHBhP9KksTjHN9/LXphI+pyWMCkuuSu2TFCGB+XTvj4oScqbZS0NoQlOpcpLAZrqb2e9
 5w7hvFzWPo1KNEloea12R1H/NNPe1qssXRSmdQfOjUiMmzldX8tPxji7W0zsZubvhgYz
 wNuNCVIn381538P6mCH1rCBgIi2Yq8qepQwmgUefEEkty0QUa8mRlkv603kBpn1vuhFP
 0ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=1nHZ62rYJ5DDP40SfGf8ieLj3Ru3dy+9vCvs9k2i+fg=;
 b=DE/ExRQajz5PAX5P/LBbS4XlaelEGEgnZaK8eN+qo3oUZR0UU0EHimgnpNvjPWumWX
 bzetyDMZw+ZklcdkbPrqeTMhspSotUJSQNhe49PNM7w/RM3poEVobUoGQLHO97SWkmNl
 d+h5UQN0PsjMmZ9ea/VQfnVqOsppyxkoc/rn9MCn5h0eApaO9Fd1mjI0gppjnnhmDgrk
 xByyShDbNDPvjBNCWFj2hQX1vIJnhdbUtNd8pvWZDsSLXlWCK0n2jXZBuvC7pyzKRiFJ
 2ttBgGlnYNbftgZdleO+YDMx/QwSpfv2Xw7QBtM0pyJhuSRUr11F1Ecp8Hu9Mgbg1qJ5
 hphw==
X-Gm-Message-State: AOAM5311Wqw+aoHCvlzJ1ThknCbUbY9qaWIOd/uPmSB1aRbWlTWwVh6H
 0/liQRkhvujfs8zk+SJc/QwyhOx1AFfo
X-Google-Smtp-Source: ABdhPJyMYaVPxP2PYvkq4jaI6LRi7hoJUNfO2SSOMgjrLnD+7bZVqnnfo2/4Gs8oJ4sqi15V78y6vAAUjFlL
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f1c8:fddb:d88f:ccec])
 (user=venture job=sendgmr) by 2002:a81:6804:0:b0:2ca:287c:6b67 with SMTP id
 00721157ae682-2ca287c6daamr955497b3.12.1643055115282; Mon, 24 Jan 2022
 12:11:55 -0800 (PST)
Date: Mon, 24 Jan 2022 12:11:51 -0800
Message-Id: <20220124201151.833769-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH v2] hw/smbios: Add table 4 parameter, "processor-id"
From: Patrick Venture <venture@google.com>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>, 
 Peter Foley <pefoley@google.com>, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3CwjvYQcKCuwjSbhifSUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

This parameter is to be used in the processor_id lower 32-bit entry in
the type 4 table.  The upper 32-bits represent the features for the CPU.
This patch leaves those as 0 when the lower 32-bits are set.

This parameter is set as optional and if left will use the values from
the CPU model.

This enables hiding the host information from the guest and allowing AMD
VMs to run pretending to be Intel for some userspace software concerns.

Reviewed-by: Peter Foley <pefoley@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
v2: Added to SRST options list, upgraded to full 64-bit value.
---
 hw/smbios/smbios.c | 19 ++++++++++++++++---
 qemu-options.hx    |  3 ++-
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 7397e56737..385b69b0c9 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -104,9 +104,11 @@ static struct {
     const char *sock_pfx, *manufacturer, *version, *serial, *asset, *part;
     uint64_t max_speed;
     uint64_t current_speed;
+    uint64_t processor_id;
 } type4 = {
     .max_speed = DEFAULT_CPU_SPEED,
-    .current_speed = DEFAULT_CPU_SPEED
+    .current_speed = DEFAULT_CPU_SPEED,
+    .processor_id = 0,
 };
 
 static struct {
@@ -327,6 +329,10 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
         .name = "part",
         .type = QEMU_OPT_STRING,
         .help = "part number",
+    }, {
+        .name = "processor-id",
+        .type = QEMU_OPT_NUMBER,
+        .help = "processor id",
     },
     { /* end of list */ }
 };
@@ -669,8 +675,13 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     t->processor_type = 0x03; /* CPU */
     t->processor_family = 0x01; /* Other */
     SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str, type4.manufacturer);
-    t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
-    t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
+    if (type4.processor_id == 0) {
+        t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
+        t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
+    } else {
+        t->processor_id[0] = cpu_to_le32((uint32_t)type4.processor_id);
+        t->processor_id[1] = cpu_to_le32(type4.processor_id >> 32);
+    }
     SMBIOS_TABLE_SET_STR(4, processor_version_str, type4.version);
     t->voltage = 0;
     t->external_clock = cpu_to_le16(0); /* Unknown */
@@ -1292,6 +1303,8 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             save_opt(&type4.serial, opts, "serial");
             save_opt(&type4.asset, opts, "asset");
             save_opt(&type4.part, opts, "part");
+            /* If the value is 0, it will take the value from the CPU model. */
+            type4.processor_id = qemu_opt_get_number(opts, "processor-id", 0);
             type4.max_speed = qemu_opt_get_number(opts, "max-speed",
                                                   DEFAULT_CPU_SPEED);
             type4.current_speed = qemu_opt_get_number(opts, "current-speed",
diff --git a/qemu-options.hx b/qemu-options.hx
index ec90505d84..6256417935 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2527,6 +2527,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "                specify SMBIOS type 3 fields\n"
     "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
     "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
+    "              [,processor-id=%d]\n"
     "                specify SMBIOS type 4 fields\n"
     "-smbios type=11[,value=str][,path=filename]\n"
     "                specify SMBIOS type 11 fields\n"
@@ -2552,7 +2553,7 @@ SRST
 ``-smbios type=3[,manufacturer=str][,version=str][,serial=str][,asset=str][,sku=str]``
     Specify SMBIOS type 3 fields
 
-``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str]``
+``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-id=%d]``
     Specify SMBIOS type 4 fields
 
 ``-smbios type=11[,value=str][,path=filename]``
-- 
2.35.0.rc0.227.g00780c9af4-goog


