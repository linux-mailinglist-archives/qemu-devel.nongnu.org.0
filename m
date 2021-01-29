Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56E6308888
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:48:20 +0100 (CET)
Received: from localhost ([::1]:37436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SGB-0006q6-Nq
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnJ-0004KB-7J
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:29 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnF-0005xM-8Q
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:26 -0500
Received: by mail-ej1-x62d.google.com with SMTP id kg20so12454096ejc.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wuogPbvhpo56gM/ceAnzLWm4d5y8A+rkROWRVMmokrQ=;
 b=WFN7aXA/1ouUoMP2ntwop4to98menYHdAeKDtEIs9w5mt6X0lJnO+FnAqJpdtRE4Hp
 WYcJOMC8ZkYpDpFSqDm5Jh731DA8YfmYn9NaToR4hq6xUDBndsi+Za/hoqDlkCIWkQiu
 Oys4kn4zqx3wRcu0BCvNXUUdO6kliFMjykReVvvQsCkpiO9hDog31MrbfTERlqtHqJLC
 i0a8+CF044qMS/PMepHSjUq0/W6Noo1jZorUfCBNGcTp5pmR8QiX0lTdeB1OKejqs1z8
 mWd+diEIYQ5t56HqxmSQJgv/2milHQs8mxhPPTbxwhkX87cMCaoFx83QciSISeuqpOjA
 mZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wuogPbvhpo56gM/ceAnzLWm4d5y8A+rkROWRVMmokrQ=;
 b=GgVsoUrDER4EYmCBr3Avxbh2+f2Ebc74z+UfCvTdhaDaz0kCf3HQtS5d+xzQj/GK0b
 g7/0VumhCtijfTa3GnaYfe1FxX1BlCbknhWkNXjIpaPVPKlpTqSy1SC2VVGBAT7dxW14
 lXbZOzfh07hSYjiOGUVR88gnkgi0EVUk1gQm5EMbWCeL0fl6/xN/a5XostBTY6CUVxDO
 RI40Xv/GgT8ct/89xY6Kl1bF7BFqNOMdgGUEA3dOnPuXsGCzsdBlNcKdrdPpfsR0pcTP
 KLPhuuqELzA4yk9egB+vhpveyAG1NZaj4FcX+iMIi1XPMcIVSnNXRjmeOInZTNaxa/yk
 alCg==
X-Gm-Message-State: AOAM530VAVXZYl1VFcTKBlrSXipVxRc1WNsRQekVxnpvhUT79sXhJALh
 Dr2PvkE+lb6cR2v5lPKwvFhw91DJu/1HLQ==
X-Google-Smtp-Source: ABdhPJwZzN98/zRAm580PKtQ8rdob4k03LTSjpGZGnzXGzBCdMKOBp4hG0/OyQTBffR0uYyTdndBRA==
X-Received: by 2002:a17:906:1c13:: with SMTP id
 k19mr4080613ejg.338.1611919104098; 
 Fri, 29 Jan 2021 03:18:24 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/36] machine: add missing doc for memory-backend option
Date: Fri, 29 Jan 2021 12:17:47 +0100
Message-Id: <20210129111814.566629-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
index 9f9ac95edd..813aeb83c9 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -498,6 +498,16 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
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
index 9172d51659..53e547fab0 100644
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



