Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900B12D60D3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:03:14 +0100 (CET)
Received: from localhost ([::1]:41726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOPR-00017U-J6
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOKt-00080g-Sv
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:58:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOKs-0004xW-77
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607615909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BCeL/qeSN/z/0Q9k7we8womR84qkwG3g7qODeMJB1Uo=;
 b=QSmDnZZffm+SMpfB7VjIQdAWiXZU4+LDHCXlXZ26+My5mJiTmfczVSL2awgjHynoaoPj8I
 yriz0+zZE71ng6ofX0MtqX5lWiFSuysx2We8IlbvZdoTcLsxvY2XNcVxsT/3uV9vfIav7n
 KU3stoQA8/AgJSZ46RPRW5yPy1CGIXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-26GsEjq1NxK8TeVQWwYQIg-1; Thu, 10 Dec 2020 10:58:26 -0500
X-MC-Unique: 26GsEjq1NxK8TeVQWwYQIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08D8C10054FF
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 15:58:26 +0000 (UTC)
Received: from thuth.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 640A36F968;
 Thu, 10 Dec 2020 15:58:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/4] accel/tcg: Remove deprecated '-tb-size' option
Date: Thu, 10 Dec 2020 16:58:05 +0100
Message-Id: <20201210155808.233895-2-thuth@redhat.com>
In-Reply-To: <20201210155808.233895-1-thuth@redhat.com>
References: <20201210155808.233895-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The '-tb-size' option (replaced by '-accel tcg,tb-size') is
deprecated since 5.0 (commit fe174132478). Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201202112714.1223783-1-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 accel/tcg/translate-all.c  |  2 +-
 docs/system/deprecated.rst | 12 +++++-------
 qemu-options.hx            |  8 --------
 softmmu/vl.c               |  8 --------
 4 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4572b4901f..b7d50a73d4 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2379,7 +2379,7 @@ void dump_exec_info(void)
     qemu_printf("Translation buffer state:\n");
     /*
      * Report total code size including the padding and TB structs;
-     * otherwise users might think "-tb-size" is not honoured.
+     * otherwise users might think "-accel tcg,tb-size" is not honoured.
      * For avg host size we use the precise numbers from tb_tree_stats though.
      */
     qemu_printf("gen code size       %zu/%zu\n",
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 565389697e..70bdb62a6d 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -100,13 +100,6 @@ QEMU 5.1 has three options:
       to the user to load all the images they need.
  3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
 
-``-tb-size`` option (since 5.0)
-'''''''''''''''''''''''''''''''
-
-QEMU 5.0 introduced an alternative syntax to specify the size of the translation
-block cache, ``-accel tcg,tb-size=``.  The new syntax deprecates the
-previously available ``-tb-size`` option.
-
 ``-show-cursor`` option (since 5.0)
 '''''''''''''''''''''''''''''''''''
 
@@ -523,6 +516,11 @@ for the ``id`` parameter, which should now be used instead.
 
 The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
 
+``-tb-size`` option (removed in 6.0)
+'''''''''''''''''''''''''''''''
+
+QEMU 5.0 introduced an alternative syntax to specify the size of the translation
+block cache, ``-accel tcg,tb-size=``.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index 104632ea34..7ce06290b6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4080,14 +4080,6 @@ SRST
     Show cursor.
 ERST
 
-DEF("tb-size", HAS_ARG, QEMU_OPTION_tb_size, \
-    "-tb-size n      set TB size\n", QEMU_ARCH_ALL)
-SRST
-``-tb-size n``
-    Set TCG translation block cache size. Deprecated, use
-    '\ ``-accel tcg,tb-size=n``\ ' instead.
-ERST
-
 DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
     "-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]\n" \
     "-incoming rdma:host:port[,ipv4][,ipv6]\n" \
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e6e0ad5a92..3f052849d8 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3639,14 +3639,6 @@ void qemu_init(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 break;
-            case QEMU_OPTION_tb_size:
-#ifndef CONFIG_TCG
-                error_report("TCG is disabled");
-                exit(1);
-#endif
-                warn_report("The -tb-size option is deprecated, use -accel tcg,tb-size instead");
-                object_register_sugar_prop(ACCEL_CLASS_NAME("tcg"), "tb-size", optarg);
-                break;
             case QEMU_OPTION_icount:
                 icount_opts = qemu_opts_parse_noisily(qemu_find_opts("icount"),
                                                       optarg, true);
-- 
2.27.0


