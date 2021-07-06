Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F973BD94D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:00:52 +0200 (CEST)
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mZ9-0006Rz-QK
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0mT2-0006dK-Vf
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:54:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0mT1-0007wQ-3k
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625583270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9DQgAXCNQpOdx2l+i6pZo48UkLMYcpdsmUdG7F8UYlw=;
 b=KHnxE+e/BqgtlW14cRqKYcnNVVju9PazmQfE9KTQbvl+/+JfxwSOx180SYf2L/ZF3HMxEW
 N+vZDXAbyzS+XuFdqSCwSl2/7sDsfmPVoe8MyvdIyJ0bh4f4uLiPdonxqwvnZ6MAy3XHiW
 vI5NhQFlKtarZp6nVyTbNuzhEr3tEYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-hsUF-9K1NA6J_JT5cxR0PQ-1; Tue, 06 Jul 2021 10:54:29 -0400
X-MC-Unique: hsUF-9K1NA6J_JT5cxR0PQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 708E618D6A25
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 14:54:28 +0000 (UTC)
Received: from thuth.com (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 334D55D6A1;
 Tue,  6 Jul 2021 14:54:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/3] softmmu/vl: Deprecate the -sdl and -curses option
Date: Tue,  6 Jul 2021 16:54:13 +0200
Message-Id: <20210706145413.1449571-4-thuth@redhat.com>
In-Reply-To: <20210706145413.1449571-1-thuth@redhat.com>
References: <20210706145413.1449571-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not that much complicated to type "-display sdl" or "-display curses",
so we should not clutter our main option name space with such simple
wrapper options and rather present the users with a concise interface
instead. Thus let's deprecate the "-sdl" and "-curses" wrapper options now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/deprecated.rst | 10 ++++++++++
 softmmu/vl.c               |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 89069856f1..52ce343963 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -148,6 +148,16 @@ Use ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
 
 Use ``-display sdl,grab-mod=rctrl`` instead.
 
+``-sdl`` (since 6.1)
+''''''''''''''''''''
+
+Use ``-display sdl`` instead.
+
+``-curses`` (since 6.1)
+'''''''''''''''''''''''
+
+Use ``-display curses`` instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 47cd47c840..e5ed90ce11 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2881,6 +2881,8 @@ void qemu_init(int argc, char **argv, char **envp)
                 dpy.type = DISPLAY_TYPE_NONE;
                 break;
             case QEMU_OPTION_curses:
+                warn_report("-curses is deprecated, "
+                            "use -display curses instead.");
 #ifdef CONFIG_CURSES
                 dpy.type = DISPLAY_TYPE_CURSES;
 #else
@@ -3254,6 +3256,7 @@ void qemu_init(int argc, char **argv, char **envp)
                             "-display ...,window-close=off instead.");
                 break;
             case QEMU_OPTION_sdl:
+                warn_report("-sdl is deprecated, use -display sdl instead.");
 #ifdef CONFIG_SDL
                 dpy.type = DISPLAY_TYPE_SDL;
                 break;
-- 
2.27.0


