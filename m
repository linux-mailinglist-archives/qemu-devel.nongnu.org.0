Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583441DB87
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:53:54 +0200 (CEST)
Received: from localhost ([::1]:54124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwVV-0003Cz-2v
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBT-000871-Oh
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBN-0005Gn-Rr
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 r11-20020a1c440b000000b0030cf0f01fbaso1759047wma.1
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAgn6t8BFR6iF2TZbkeoJibo9UfjeR26tU1KTpgZjKE=;
 b=o4U/lHwnq2koDr8AqXbQmwI+sBPniHwSLtrmj4SmxgLF60Bsc6BaIs2jqbSb5Df1lG
 gdcixVpblEIbbx8Dqz1ILPhl0ajfhr6zEiTxHElhRogFoHQIyK8hrDCGGr5auEj/onxZ
 vWoL9MjKtq2iQYAyenemmut2QkjycUvRK4wLazBXhHsL08mY27qGIic7l/B4Bp8dzA79
 GSo291/ZKVdSODs2S42spYEzNx0Qw1Ci039/XsBnr7wFiw6PeeZ7+Y/yGl3fA93CJIZn
 JgVxt7d949cBNlDCLbI9nydjZvC3dfA1Wh3RG5Ctliu7HgEjyRQY/UAyL4gC6j+OW4wM
 ngsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AAgn6t8BFR6iF2TZbkeoJibo9UfjeR26tU1KTpgZjKE=;
 b=ocfzMDg8Feldp28Wn/U6k1qGxo6W4gj8FA76tuhWru/UKSA3S9pwzVRzhx6Zsp015p
 ShzHjYW3q1xjYS0RDo3nLP1q6DowmMM+DN/FfPZy/6P83weih6xGQVq0oBy8hnEMIVPU
 0H9MvIJie14WQP0IczrD1FW1V4dr8ybIcAWzvVdkxRpPVjX4RQ7VKPx7spNs9zeq4N9g
 qHS2Aa7lInzWT3pQGAUcE7qXMfS7SjjHyPw6xolzHYfplFZw79Q1RJLnfsMzVcEbMi45
 t8BjKx7aZDnuG8ojQPETmEFCU9MDPZCvVm5EK2OsOXmTML6+BPqVDL7HPqt4seDw3zlu
 Fk4g==
X-Gm-Message-State: AOAM531UOUfmUtuHafC6SNMCUoxquZvya5n1BjrlqrmamGjUZqVOXhqC
 vhfeQavFq7Fg3cC/gWzq8ZSIOYadrwk=
X-Google-Smtp-Source: ABdhPJxWsuWzq0pQrg7li2pgzoji0tQdKEmBPX0J60PA2A92pzuZ7KYwI1QoLExvuLJptyT9Por0zA==
X-Received: by 2002:a1c:4e19:: with SMTP id g25mr5277003wmh.67.1633008784173; 
 Thu, 30 Sep 2021 06:33:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c4sm3037168wrt.23.2021.09.30.06.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 06:33:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] docs: reorganize tcg-plugins.rst
Date: Thu, 30 Sep 2021 15:32:48 +0200
Message-Id: <20210930133250.181156-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930133250.181156-1-pbonzini@redhat.com>
References: <20210930133250.181156-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up the heading levels to use === --- ~~~, and create a new "writing
plugins" section.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/tcg-plugins.rst | 117 ++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 59 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index dac5101a3c..842ae01a4c 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -3,7 +3,6 @@
    Copyright (c) 2019, Linaro Limited
    Written by Emilio Cota and Alex Bennée
 
-================
 QEMU TCG Plugins
 ================
 
@@ -16,60 +15,8 @@ only monitor it passively. However they can do this down to an
 individual instruction granularity including potentially subscribing
 to all load and store operations.
 
-API Stability
-=============
-
-This is a new feature for QEMU and it does allow people to develop
-out-of-tree plugins that can be dynamically linked into a running QEMU
-process. However the project reserves the right to change or break the
-API should it need to do so. The best way to avoid this is to submit
-your plugin upstream so they can be updated if/when the API changes.
-
-API versioning
---------------
-
-All plugins need to declare a symbol which exports the plugin API
-version they were built against. This can be done simply by::
-
-  QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
-
-The core code will refuse to load a plugin that doesn't export a
-``qemu_plugin_version`` symbol or if plugin version is outside of QEMU's
-supported range of API versions.
-
-Additionally the ``qemu_info_t`` structure which is passed to the
-``qemu_plugin_install`` method of a plugin will detail the minimum and
-current API versions supported by QEMU. The API version will be
-incremented if new APIs are added. The minimum API version will be
-incremented if existing APIs are changed or removed.
-
-Exposure of QEMU internals
---------------------------
-
-The plugin architecture actively avoids leaking implementation details
-about how QEMU's translation works to the plugins. While there are
-conceptions such as translation time and translation blocks the
-details are opaque to plugins. The plugin is able to query select
-details of instructions and system configuration only through the
-exported *qemu_plugin* functions.
-
-Query Handle Lifetime
----------------------
-
-Each callback provides an opaque anonymous information handle which
-can usually be further queried to find out information about a
-translation, instruction or operation. The handles themselves are only
-valid during the lifetime of the callback so it is important that any
-information that is needed is extracted during the callback and saved
-by the plugin.
-
-API
-===
-
-.. kernel-doc:: include/qemu/qemu-plugin.h
-
 Usage
-=====
+-----
 
 Any QEMU binary with TCG support has plugins enabled by default.
 Earlier releases needed to be explicitly enabled with::
@@ -87,8 +34,45 @@ Arguments are plugin specific and can be used to modify their
 behaviour. In this case the howvec plugin is being asked to use inline
 ops to count and break down the hint instructions by type.
 
-Plugin Life cycle
-=================
+Writing plugins
+---------------
+
+API versioning
+~~~~~~~~~~~~~~
+
+This is a new feature for QEMU and it does allow people to develop
+out-of-tree plugins that can be dynamically linked into a running QEMU
+process. However the project reserves the right to change or break the
+API should it need to do so. The best way to avoid this is to submit
+your plugin upstream so they can be updated if/when the API changes.
+
+All plugins need to declare a symbol which exports the plugin API
+version they were built against. This can be done simply by::
+
+  QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+The core code will refuse to load a plugin that doesn't export a
+``qemu_plugin_version`` symbol or if plugin version is outside of QEMU's
+supported range of API versions.
+
+Additionally the ``qemu_info_t`` structure which is passed to the
+``qemu_plugin_install`` method of a plugin will detail the minimum and
+current API versions supported by QEMU. The API version will be
+incremented if new APIs are added. The minimum API version will be
+incremented if existing APIs are changed or removed.
+
+Lifetime of the query handle
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Each callback provides an opaque anonymous information handle which
+can usually be further queried to find out information about a
+translation, instruction or operation. The handles themselves are only
+valid during the lifetime of the callback so it is important that any
+information that is needed is extracted during the callback and saved
+by the plugin.
+
+Plugin life cycle
+~~~~~~~~~~~~~~~~~
 
 First the plugin is loaded and the public qemu_plugin_install function
 is called. The plugin will then register callbacks for various plugin
@@ -111,11 +95,26 @@ callback which can then ensure atomicity itself.
 Finally when QEMU exits all the registered *atexit* callbacks are
 invoked.
 
+Exposure of QEMU internals
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The plugin architecture actively avoids leaking implementation details
+about how QEMU's translation works to the plugins. While there are
+conceptions such as translation time and translation blocks the
+details are opaque to plugins. The plugin is able to query select
+details of instructions and system configuration only through the
+exported *qemu_plugin* functions.
+
+API
+~~~
+
+.. kernel-doc:: include/qemu/qemu-plugin.h
+
 Internals
-=========
+---------
 
 Locking
--------
+~~~~~~~
 
 We have to ensure we cannot deadlock, particularly under MTTCG. For
 this we acquire a lock when called from plugin code. We also keep the
@@ -142,7 +141,7 @@ requested. The plugin isn't completely uninstalled until the safe work
 has executed while all vCPUs are quiescent.
 
 Example Plugins
-===============
+---------------
 
 There are a number of plugins included with QEMU and you are
 encouraged to contribute your own plugins plugins upstream. There is a
-- 
2.31.1



