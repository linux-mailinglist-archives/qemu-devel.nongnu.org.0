Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A0F5372EE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 01:04:31 +0200 (CEST)
Received: from localhost ([::1]:51122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvRxW-0003Ra-FP
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 19:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nvRlT-0006s3-5W
 for qemu-devel@nongnu.org; Sun, 29 May 2022 18:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nvRlR-0002BY-PJ
 for qemu-devel@nongnu.org; Sun, 29 May 2022 18:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653864721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xo/YgDT7Dtg9tBXeh0aC/xzD0SY9Q7YYmGfa4881CLc=;
 b=dYQ38kv/pk/TLKdaFER8Qi2V2TQbC19SKTBCVe+vCRlwE/azkK0RVFgInnpEo50qgKBJ0G
 CM6jeioi61buhnsBegdkdGBwJZtU6Fldqchpss4io+P9o0jzJZ2AoaLJW7zM/C71OiydcD
 0JVGP9+vTIGcbCoWedoP7nJu40ZuAkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-HrEXb2viPO2ogpZO9ZvnnA-1; Sun, 29 May 2022 18:52:00 -0400
X-MC-Unique: HrEXb2viPO2ogpZO9ZvnnA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B089D80418B;
 Sun, 29 May 2022 22:51:59 +0000 (UTC)
Received: from localhost (unknown [10.39.192.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 622D540E80E0;
 Sun, 29 May 2022 22:51:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL v2 12/15] qga/wixl: require Mingw_bin
Date: Mon, 30 May 2022 00:51:34 +0200
Message-Id: <20220529225137.232359-13-marcandre.lureau@redhat.com>
In-Reply-To: <20220529225137.232359-1-marcandre.lureau@redhat.com>
References: <20220529225137.232359-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

No clear reason to make guesses here.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Message-Id: <20220525144140.591926-13-marcandre.lureau@redhat.com>
---
 qga/installer/qemu-ga.wxs | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 8a19aa1656..651db6e51c 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -4,15 +4,6 @@
     <?error Define Arch to 32 or 64?>
   <?endif?>
 
-  <?ifndef var.Mingw_bin?>
-    <?if $(var.Arch) = "64"?>
-      <?define Mingw_bin=/usr/x86_64-w64-mingw32/sys-root/mingw/bin ?>
-    <?endif?>
-    <?if $(var.Arch) = "32"?>
-      <?define Mingw_bin=/usr/i686-w64-mingw32/sys-root/mingw/bin ?>
-    <?endif?>
-  <?endif?>
-
   <?if $(var.Arch) = "64"?>
     <?define ArchLib=libgcc_s_seh-1.dll?>
     <?define GaProgramFilesFolder="ProgramFiles64Folder" ?>
-- 
2.36.1


