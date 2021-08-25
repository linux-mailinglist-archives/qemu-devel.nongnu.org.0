Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20C3F71AA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 11:24:48 +0200 (CEST)
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIp9G-0005kN-VQ
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 05:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIp5N-0000F5-9P
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:20:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIp5L-0004Gq-RC
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629883239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b2r+sNKZveAJyVotRFL1AhlEuBAZPLoJQigcwQ154ww=;
 b=BZGTOx4o+a9Zco9TDIEO2WBYklVKnxM2biiwryCQeR7nuykH+XCnVKJV7sOE7YxQnRcfQD
 pbQEjW4gYzF2aatTtq3PFlTwkWsoLFdz8sLY1oJ2gBSHZnQ6H8x/FNM/HWjQS/HySh7t4y
 AWwobibqMnd8AX/4mvvKMTInm9y0aQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-f9zMpQdmPvijGHurpYt-TA-1; Wed, 25 Aug 2021 05:20:37 -0400
X-MC-Unique: f9zMpQdmPvijGHurpYt-TA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E632189CD03
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:20:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEF8E687D5;
 Wed, 25 Aug 2021 09:20:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 3/3] softmmu/vl: Deprecate the -sdl and -curses option
Date: Wed, 25 Aug 2021 11:20:23 +0200
Message-Id: <20210825092023.81396-4-thuth@redhat.com>
In-Reply-To: <20210825092023.81396-1-thuth@redhat.com>
References: <20210825092023.81396-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not that much complicated to type "-display sdl" or "-display curses",
so we should not clutter our main option name space with such simple
wrapper options and rather present the users with a concise interface
instead. Thus let's deprecate the "-sdl" and "-curses" wrapper options now.

Acked-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 softmmu/vl.c              |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 868eca0dd4..d5bec67a78 100644
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
index 613948ab46..bb59dbf0de 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2897,6 +2897,8 @@ void qemu_init(int argc, char **argv, char **envp)
                 dpy.type = DISPLAY_TYPE_NONE;
                 break;
             case QEMU_OPTION_curses:
+                warn_report("-curses is deprecated, "
+                            "use -display curses instead.");
 #ifdef CONFIG_CURSES
                 dpy.type = DISPLAY_TYPE_CURSES;
 #else
@@ -3270,6 +3272,7 @@ void qemu_init(int argc, char **argv, char **envp)
                             "-display ...,window-close=off instead.");
                 break;
             case QEMU_OPTION_sdl:
+                warn_report("-sdl is deprecated, use -display sdl instead.");
 #ifdef CONFIG_SDL
                 dpy.type = DISPLAY_TYPE_SDL;
                 break;
-- 
2.27.0


