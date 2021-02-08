Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F3A314323
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:44:06 +0100 (CET)
Received: from localhost ([::1]:48146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FGH-0007a5-D4
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCM-0002zw-CN
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:46 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCJ-00064j-H7
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:46 -0500
Received: by mail-wr1-x433.google.com with SMTP id g6so5380811wrs.11
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xrqHyb+jMQamBTP0MyZvB39Spy2vE3z7WOTs42/P5n0=;
 b=K9Qt2hpmJ967PY7dA+BOGyKdLAkmQZ0+q6GglI6EiGeGvzWJ0bjBQ0ZhBELxsa9mqI
 BWeAGDQHjFMNsp5IgI/f4KQNEfBzfHR4A/moWZuycQrz8z+t1HPId7BY69fTiUaE4eX4
 6Bu9m8+L0noDI8TRLOSXo2dbfYYXHuR8inK0X7u/NT2SGELjNSX0dl4SpmcVcnQTAPc6
 lDkhAz08EmqMDwirfOL8czj1eV9oAMniwk8ODqcs8lxEKs/vV5RFJ/FQ2/0X0AWX4uc/
 AzfImCzmDTzc1l8xiA0Su26ijHE79tLkBoTTWCxgwjXwKBsd1uRI6mGLEz3/wzSTcNGE
 P8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xrqHyb+jMQamBTP0MyZvB39Spy2vE3z7WOTs42/P5n0=;
 b=YDCtR1roJofRunuJZsXEeSiND7NUetBAby72A/n9NKwkHntQbhZzuCDrL7+VXrUJfi
 ton0+1hjFIVJhKhvVec5vA8wU+hH8mceiT7cPjMbqDRPfgjtUSVK20Po6VndXoYEkhO1
 mUwr+WJkFXyokMlOXXh3Z0jIC6iXi2zweRjk9rSQ8LOGBQzVZD+Sd6qQpxccMNK3hHU1
 UfT4fi2MqPaTKdA/WeiODhEYpc8mMNdF6zhVjPf2oxhvIAW/WvzssN+0ju86i8bHxUma
 IFUOo33MvW5t3hKfBdJMyhmNvjFb3AbYZw+xVwK1TUgr2mTZmhFhcDm9fpMJ4Ygetmq8
 4hQA==
X-Gm-Message-State: AOAM533tu0aGA4S9jHoW19Rv546g7k/eYXtYHte7wvthFK4NsHxF0eXj
 vNEySUTAvUUX9vvbu51wo7NwqVaJIWmtxg==
X-Google-Smtp-Source: ABdhPJyEZDIbGOjPbtG6vPJpPm1FW+mQXCRq89qhWJp7bPGXH2Qp1885MLK0u65JTSyd9uyuUbXG/A==
X-Received: by 2002:adf:808c:: with SMTP id 12mr3007033wrl.139.1612808621952; 
 Mon, 08 Feb 2021 10:23:41 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/46] machine: add missing doc for memory-backend option
Date: Mon,  8 Feb 2021 19:22:54 +0100
Message-Id: <20210208182331.58897-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Add documentation for '-machine memory-backend' CLI option and
how to use it.

And document that x-use-canonical-path-for-ramblock-id,
is considered to be stable to make sure it won't go away by accident.

x- was intended for unstable/iternal properties, and not supposed to
be stable option. However it's too late to rename (drop x-)
it as it would mean that users will have to mantain both
x-use-canonical-path-for-ramblock-id (for QEMU 5.0-5.2) versions
and prefix-less for later versions.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210121161504.1007247-1-imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/hostmem.c | 10 ++++++++++
 qemu-options.hx    | 26 +++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index be0c3b079f..c6c1ff5b99 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -494,6 +494,16 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
         host_memory_backend_get_share, host_memory_backend_set_share);
     object_class_property_set_description(oc, "share",
         "Mark the memory as private to QEMU or shared");
+    /*
+     * Do not delete/rename option. This option must be considered stable
+     * (as if it didn't have the 'x-' prefix including deprecation period) as
+     * long as 4.0 and older machine types exists.
+     * Option will be used by upper layers to override (disable) canonical path
+     * for ramblock-id set by compat properties on old machine types ( <= 4.0),
+     * to keep migration working when backend is used for main RAM with
+     * -machine memory-backend= option (main RAM historically used prefix-less
+     * ramblock-id).
+     */
     object_class_property_add_bool(oc, "x-use-canonical-path-for-ramblock-id",
         host_memory_backend_get_use_canonical_path,
         host_memory_backend_set_use_canonical_path);
diff --git a/qemu-options.hx b/qemu-options.hx
index c09c4646e2..6c34c7050f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -35,7 +35,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
     "                nvdimm=on|off controls NVDIMM support (default=off)\n"
     "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
-    "                hmat=on|off controls ACPI HMAT support (default=off)\n",
+    "                hmat=on|off controls ACPI HMAT support (default=off)\n"
+    "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n",
     QEMU_ARCH_ALL)
 SRST
 ``-machine [type=]name[,prop=value[,...]]``
@@ -96,6 +97,29 @@ SRST
     ``hmat=on|off``
         Enables or disables ACPI Heterogeneous Memory Attribute Table
         (HMAT) support. The default is off.
+
+     ``memory-backend='id'``
+        An alternative to legacy ``-mem-path`` and ``mem-prealloc`` options.
+        Allows to use a memory backend as main RAM.
+
+        For example:
+        ::
+        -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
+        -machine memory-backend=pc.ram
+        -m 512M
+
+        Migration compatibility note:
+        a) as backend id one shall use value of 'default-ram-id', advertised by
+        machine type (available via ``query-machines`` QMP command), if migration
+        to/from old QEMU (<5.0) is expected.
+        b) for machine types 4.0 and older, user shall
+        use ``x-use-canonical-path-for-ramblock-id=off`` backend option
+        if migration to/from old QEMU (<5.0) is expected.
+        For example:
+        ::
+        -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=off
+        -machine memory-backend=pc.ram
+        -m 512M
 ERST
 
 HXCOMM Deprecated by -machine
-- 
2.29.2



