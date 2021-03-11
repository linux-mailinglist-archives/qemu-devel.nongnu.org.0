Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82433372EA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:43:07 +0100 (CET)
Received: from localhost ([::1]:55462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKeg-0003qn-TE
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKWH-0003gN-10
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKWA-0006WG-6H
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615466056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5G1omCn4ptjXrwk/awhGBOcQJU+c3/g3eaqF0LyzqjY=;
 b=aP23+JmW2XlqOiAtMjB16j4NN5fk9vKhEJZcjDZROeV27RheVwHzfrZH7xzeyO8a0zrpC6
 OWEW5YdDVfBA05ooVtZQl/GXCwwvGi6aLVhc4oltBpDmHjxjQPmyppVaJ6mdYSJ9ytfZvp
 nTJqv2keeVQL1kxE5ldYT3YgWU4N3vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-MxoYDDdaPZiiyy3YW04Raw-1; Thu, 11 Mar 2021 07:34:12 -0500
X-MC-Unique: MxoYDDdaPZiiyy3YW04Raw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2BFB8030A0;
 Thu, 11 Mar 2021 12:34:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DD45196E3;
 Thu, 11 Mar 2021 12:34:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0764E1800913; Thu, 11 Mar 2021 13:34:02 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] ui/cocoa: Mark variables static
Date: Thu, 11 Mar 2021 13:34:00 +0100
Message-Id: <20210311123401.340122-8-kraxel@redhat.com>
In-Reply-To: <20210311123401.340122-1-kraxel@redhat.com>
References: <20210311123401.340122-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210225084202.39601-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index f71c59711fa6..3af167f0712f 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -82,7 +82,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
 static void cocoa_refresh(DisplayChangeListener *dcl);
 
-NSWindow *normalWindow, *about_window;
+static NSWindow *normalWindow, *about_window;
 static const DisplayChangeListenerOps dcl_ops = {
     .dpy_name          = "cocoa",
     .dpy_gfx_update = cocoa_update,
@@ -95,11 +95,11 @@ static DisplayChangeListener dcl = {
 static int last_buttons;
 static int cursor_hide = 1;
 
-int gArgc;
-char **gArgv;
-bool stretch_video;
-NSTextField *pauseLabel;
-NSArray * supportedImageFileTypes;
+static int gArgc;
+static char **gArgv;
+static bool stretch_video;
+static NSTextField *pauseLabel;
+static NSArray * supportedImageFileTypes;
 
 static QemuSemaphore display_init_sem;
 static QemuSemaphore app_started_sem;
@@ -137,7 +137,7 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
 }
 
 // Mac to QKeyCode conversion
-const int mac_to_qkeycode_map[] = {
+static const int mac_to_qkeycode_map[] = {
     [kVK_ANSI_A] = Q_KEY_CODE_A,
     [kVK_ANSI_B] = Q_KEY_CODE_B,
     [kVK_ANSI_C] = Q_KEY_CODE_C,
-- 
2.29.2


