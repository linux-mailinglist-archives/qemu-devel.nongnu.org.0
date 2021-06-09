Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E163A0FE4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:05:03 +0200 (CEST)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv53-0007kr-Qu
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqv3F-00045A-7C
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:03:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqv37-0005g0-R5
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623232979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dvyq+AGfaRJfN8wStTM/sk6Lsjm/iy5X2JuXOEtzfAY=;
 b=OmqwFolvMCh4J78c6bYJlyUizNvldYhDpkmA+YASlspwHvMIhBLMsiLuIQosJa8IzHoljP
 KPGIjgAoXOsiAHC7JamnDBpTPRgEsZNTLYRx7AGFDTPXwn2ZAQ9b7RpiYuWDSmXPgmbuqD
 vA1Zmav/NPwA0RT7gUcdTmJ5M1D3Pa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-SkkvPQA-NquYc9uvULJmFg-1; Wed, 09 Jun 2021 06:02:57 -0400
X-MC-Unique: SkkvPQA-NquYc9uvULJmFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F347D8018A7
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 10:02:56 +0000 (UTC)
Received: from thuth.com (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D62B25C23E;
 Wed,  9 Jun 2021 10:02:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC QEMU PATCH] ui: Make the DisplayType enum entries conditional
Date: Wed,  9 Jun 2021 12:02:40 +0200
Message-Id: <20210609100240.1285032-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: libvir-list@redhat.com, smitterl@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libvirt's "domcapabilities" command has a way to state whether
certain graphic frontends are available in QEMU or not. Originally,
libvirt looked at the "--help" output of the QEMU binary to determine
whether SDL was available or not (by looking for the "-sdl" parameter
in the help text), but since libvirt stopped doing this analysis of
the help text, the detection of SDL is currently broken, see:

 https://bugzilla.redhat.com/show_bug.cgi?id=1790902

QEMU should provide a way via the QMP interface instead. The simplest
way, without introducing additional commands, is to make the DisplayType
enum entries conditional, so that the enum only contains the entries if
the corresponding CONFIG_xxx switches have been set. Unfortunately, this
only works for sdl, cocoa and spice, since gtk, egl-headless and curses
are hard-wired in the "data" section of the DisplayOptions, and thus
unfortunately always have to be defined.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qapi/ui.json | 12 +++++++++---
 ui/console.c |  4 ++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..c4f44cfe50 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1126,9 +1126,15 @@
 #
 ##
 { 'enum'    : 'DisplayType',
-  'data'    : [ 'default', 'none', 'gtk', 'sdl',
-                'egl-headless', 'curses', 'cocoa',
-                'spice-app'] }
+  'data'    : [
+    { 'name': 'default' },
+    { 'name': 'none' },
+    { 'name': 'gtk' },
+    { 'name': 'sdl', 'if': 'defined(CONFIG_SDL)' },
+    { 'name': 'egl-headless' },
+    { 'name': 'curses' },
+    { 'name': 'cocoa', 'if': 'defined(CONFIG_COCOA)' },
+    { 'name': 'spice-app', 'if': 'defined(CONFIG_SPICE)'} ] }
 
 ##
 # @DisplayOptions:
diff --git a/ui/console.c b/ui/console.c
index 2de5f4105b..954f7162c3 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2371,8 +2371,12 @@ bool qemu_display_find_default(DisplayOptions *opts)
 {
     static DisplayType prio[] = {
         DISPLAY_TYPE_GTK,
+#if defined(CONFIG_SDL)
         DISPLAY_TYPE_SDL,
+#endif
+#if defined(CONFIG_COCOA)
         DISPLAY_TYPE_COCOA
+#endif
     };
     int i;
 
-- 
2.27.0


