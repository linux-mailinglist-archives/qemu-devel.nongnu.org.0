Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7402D72AE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 10:16:00 +0100 (CET)
Received: from localhost ([::1]:51214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kneWt-0000VO-23
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 04:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneU1-0007Bu-Kd
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:13:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneU0-0004ht-0b
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607677979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxIEjvho7eyh3m6h2azIU0Z/7onVePosHIs+gxuHU70=;
 b=A5bNFDVwlktJdB36SqoQuHH17sfGU7CSMgh4Yqv2h5sd5nB97F2o0G9OBt/4KNk2Pe3Mjx
 sQI5LJvMDjieLPA0kvq/6uvOFp14ttlkxK5GszX8SgU98mHAoDMLY9RsT1pv/O9ryilC1H
 oUI6iYmfhx71r3mmh7J9SjL4aTGtWzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-78mf5SahMh6scF4oU5wChQ-1; Fri, 11 Dec 2020 04:12:57 -0500
X-MC-Unique: 78mf5SahMh6scF4oU5wChQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AD05800D55;
 Fri, 11 Dec 2020 09:12:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE38C10023B8;
 Fri, 11 Dec 2020 09:12:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 21C289D9E; Fri, 11 Dec 2020 10:12:51 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] sdl2: Add extra mouse buttons
Date: Fri, 11 Dec 2020 10:12:50 +0100
Message-Id: <20201211091250.1415-9-kraxel@redhat.com>
In-Reply-To: <20201211091250.1415-1-kraxel@redhat.com>
References: <20201211091250.1415-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Darrell Walisser <darrell.walisser@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Darrell Walisser <darrell.walisser@gmail.com>

Allows guest to receive mouse buttons 4 and 5, aka "SIDE" button
and "EXTRA" button

Signed-off-by: Darrell Walisser <darrell.walisser@gmail.com>
Message-id: GNUALCfDBqhCUvLwBNJaKqxcPewMtlqCnixk8xTrgI@ubuntu
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/sdl2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 189d26e2a951..a578017268ae 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -275,6 +275,8 @@ static void sdl_send_mouse_event(struct sdl2_console *scon, int dx, int dy,
         [INPUT_BUTTON_LEFT]       = SDL_BUTTON(SDL_BUTTON_LEFT),
         [INPUT_BUTTON_MIDDLE]     = SDL_BUTTON(SDL_BUTTON_MIDDLE),
         [INPUT_BUTTON_RIGHT]      = SDL_BUTTON(SDL_BUTTON_RIGHT),
+        [INPUT_BUTTON_SIDE]       = SDL_BUTTON(SDL_BUTTON_X1),
+        [INPUT_BUTTON_EXTRA]      = SDL_BUTTON(SDL_BUTTON_X2)
     };
     static uint32_t prev_state;
 
-- 
2.27.0


