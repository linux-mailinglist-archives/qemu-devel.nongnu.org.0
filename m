Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3646A6E7A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:32:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNUj-0005gg-6c; Wed, 01 Mar 2023 09:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <williamvdvelde@gmail.com>)
 id 1pXLwg-0000RM-Ef
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:52:36 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <williamvdvelde@gmail.com>)
 id 1pXLwd-0004RC-Uv
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:52:33 -0500
Received: by mail-ed1-x535.google.com with SMTP id d30so53338575eda.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 04:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677675149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UH/coAbyxU4ZirK2emktuM859u2bGuCi7NCkEdaHFwI=;
 b=CoQweCyC+yRBiudvQixmiayJeWoyHh/C3d1nxmxBNNXbPnpL6YeGZ7dOl1EflAiURR
 y4PkgcJ63rrNL4uAljYJng7ZNxdg0kP+OM8PqmCE83pDvG9Zh4Pj2vrPGNrReRj4FRf2
 JR4kb7zLgYM82VkAF10iZMlXqOb1uowUz55T3Y12KgxZSC49b0xFerwpYind0tTpaxL7
 MhQqjfp7CmUzM62LLJwo28agEDR+GsNtpy5QOnit7oheQ4Xmg+yht6B7vc+NCj2WHkas
 ZbWup9SwiTj/CUI8hCZn5GCrAyfUv4MQKJQ7dG9JXJG13Tfa4wkhuW94tiys+otqr+JF
 jlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677675149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UH/coAbyxU4ZirK2emktuM859u2bGuCi7NCkEdaHFwI=;
 b=K3np+xmg2xwOQj/7BfZy5zP832WZiFSeHq+m0eOmdCz4z7M4X8WCM5a8skIzO7rioa
 DDaIoDJFEiGQ5CoobQ/0NAAyTObcfv+YtrB57Gq6jPt1SySlRdYwJtJe3ClChInln0vW
 Z18OEbUJVTz4C4Oz26P8mAkFBaJNRy1NHKIRBooOYsYVBcedDhUSMcWyiUzYHvp+CiUe
 YghwKJ/yuQiUEjnpK0UvRuQe+rt8M3dRSnAfHJw4aPAO2Cfw8Jn08QdrMU92J99MHXxy
 AGniqJYuF7Ejbx/r9iaqb7eant4FWXZh2V9uNL0nyEaQu50gwBGN9OZ1yJHt90KTWtam
 JDBQ==
X-Gm-Message-State: AO0yUKWkb6skjKPMlrO2GaNc/IimHbC95g/kbQZM/OqlgYlIWxEBNavd
 KLSlUizyrvRJoqk4ZXlOR00dIZOYDcU=
X-Google-Smtp-Source: AK7set8jrKFWqqjm1Ap8skwyXBRgq/DLa+koP0HVO5YnAtFpVo2wgVNC9hptONO7cHpFxS1qS9TrXQ==
X-Received: by 2002:a17:906:fa91:b0:88a:2e57:9813 with SMTP id
 lt17-20020a170906fa9100b0088a2e579813mr6758651ejb.33.1677675148953; 
 Wed, 01 Mar 2023 04:52:28 -0800 (PST)
Received: from localhost.localdomain (77-162-74-183.fixed.kpn.net.
 [77.162.74.183]) by smtp.gmail.com with ESMTPSA id
 e19-20020a1709061e9300b008d83ad86fe8sm5790080ejj.59.2023.03.01.04.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 04:52:28 -0800 (PST)
From: Willem van de Velde <williamvdvelde@gmail.com>
To: qemu-devel@nongnu.org
Cc: Willem van de Velde <williamvdvelde@gmail.com>
Subject: [PATCH] Add qemu qcode support for keys F13 to F24
Date: Wed,  1 Mar 2023 13:52:11 +0100
Message-Id: <20230301125211.278808-1-williamvdvelde@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=williamvdvelde@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Mar 2023 09:31:41 -0500
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

To be able to use the function keys F13 to F24 these should be defined in de keycodemapdb and added to the qapi.
The keycodemapdb is updated in its own repository, this patch enables the use of those keys within qemu.

Signed-off-by: Willem van de Velde <williamvdvelde@gmail.com>
---
 qapi/ui.json    | 15 ++++++++++++++-
 ui/keycodemapdb |  2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 0abba3e930..98322342f7 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -886,6 +886,19 @@
 # @lang1: since 6.1
 # @lang2: since 6.1
 #
+# @f13: since 8.0
+# @f14: since 8.0
+# @f15: since 8.0
+# @f16: since 8.0
+# @f17: since 8.0
+# @f18: since 8.0
+# @f19: since 8.0
+# @f20: since 8.0
+# @f21: since 8.0
+# @f22: since 8.0
+# @f23: since 8.0
+# @f24: since 8.0
+#
 # 'sysrq' was mistakenly added to hack around the fact that
 # the ps2 driver was not generating correct scancodes sequences
 # when 'alt+print' was pressed. This flaw is now fixed and the
@@ -918,7 +931,7 @@
             'volumeup', 'volumedown', 'mediaselect',
             'mail', 'calculator', 'computer',
             'ac_home', 'ac_back', 'ac_forward', 'ac_refresh', 'ac_bookmarks',
-            'lang1', 'lang2' ] }
+            'lang1', 'lang2','f13','f14','f15','f16','f17','f18','f19','f20','f21','f22','f23','f24' ] }
 
 ##
 # @KeyValueKind:
diff --git a/ui/keycodemapdb b/ui/keycodemapdb
index d21009b1c9..f5772a62ec 160000
--- a/ui/keycodemapdb
+++ b/ui/keycodemapdb
@@ -1 +1 @@
-Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
+Subproject commit f5772a62ec52591ff6870b7e8ef32482371f22c6
-- 
2.34.1


