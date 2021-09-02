Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486453FEE8A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:18:24 +0200 (CEST)
Received: from localhost ([::1]:45104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmbn-00034C-9z
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLmA0-0005Hd-9U
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9y-00075v-J8
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630586977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LptmPP+SlNGQRhguMZhsqLaj+Ithzai8E32562ydMcs=;
 b=dRcOE76doAPNFqxDlXpjjlmnEc6/QKG3d+Fh50K2gIvMDwIvF5vzJBM6YIvsRfeqo+gDfY
 W/SLfW+NNuy1hlAbKK0x0MdWHSmmtzCxOzCDl5hwM+TnzEeDv0gbXSIKocrKkSnh0+k1AG
 mjc2x2yJCdYXy4AnOTJ6cwHgeDMjB9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-alLTVw80NuO-QhVSXK-CDQ-1; Thu, 02 Sep 2021 08:49:36 -0400
X-MC-Unique: alLTVw80NuO-QhVSXK-CDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FBDA801AE3;
 Thu,  2 Sep 2021 12:49:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 802EF10016F2;
 Thu,  2 Sep 2021 12:49:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/13] softmmu/vl: Deprecate the -sdl and -curses option
Date: Thu,  2 Sep 2021 14:49:11 +0200
Message-Id: <20210902124911.822423-14-thuth@redhat.com>
In-Reply-To: <20210902124911.822423-1-thuth@redhat.com>
References: <20210902124911.822423-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not that much complicated to type "-display sdl" or "-display curses",
so we should not clutter our main option name space with such simple
wrapper options and rather present the users with a concise interface
instead. Thus let's deprecate the "-sdl" and "-curses" wrapper options now.

Message-Id: <20210825092023.81396-4-thuth@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 softmmu/vl.c              |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 65d8b4370f..6145573be1 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -148,6 +148,16 @@ Use ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
 
 Use ``-display sdl,grab-mod=rctrl`` instead.
 
+``-sdl`` (since 6.2)
+''''''''''''''''''''
+
+Use ``-display sdl`` instead.
+
+``-curses`` (since 6.2)
+'''''''''''''''''''''''
+
+Use ``-display curses`` instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e9346b49d2..55ab70eb97 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2889,6 +2889,8 @@ void qemu_init(int argc, char **argv, char **envp)
                 dpy.type = DISPLAY_TYPE_NONE;
                 break;
             case QEMU_OPTION_curses:
+                warn_report("-curses is deprecated, "
+                            "use -display curses instead.");
 #ifdef CONFIG_CURSES
                 dpy.type = DISPLAY_TYPE_CURSES;
 #else
@@ -3262,6 +3264,7 @@ void qemu_init(int argc, char **argv, char **envp)
                             "-display ...,window-close=off instead.");
                 break;
             case QEMU_OPTION_sdl:
+                warn_report("-sdl is deprecated, use -display sdl instead.");
 #ifdef CONFIG_SDL
                 dpy.type = DISPLAY_TYPE_SDL;
                 break;
-- 
2.27.0


