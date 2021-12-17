Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495E3478F57
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:17:29 +0100 (CET)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEz9-0001Ng-TH
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:17:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEUz-0007nM-Id
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:46:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEUx-000305-La
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awJ2n4cyrUOej0DYMrmyz63id18O91nsw+yeiU0fVw8=;
 b=a+ouDhENM23eRrspCGiDhWZGTyqNK4kVIHpMhTwi55FcJS41SHKMvSGA2ZJy8aiql07Lzl
 7f2sO9euftgJNYijM7mFzTrBUW5aZAdQAiSi55WoSav0wYSgds6w6baOuDHLnJB93KMmda
 NpPveJi6UIMipYP6feMdjAZ7T3K5s+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-c27VkRcsOq2Md6bLygmLyA-1; Fri, 17 Dec 2021 09:46:01 -0500
X-MC-Unique: c27VkRcsOq2Md6bLygmLyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED44A1927800;
 Fri, 17 Dec 2021 14:46:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 868437B015;
 Fri, 17 Dec 2021 14:45:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 36/36] MAINTAINERS: update D-Bus section
Date: Fri, 17 Dec 2021 18:37:56 +0400
Message-Id: <20211217143756.1831099-37-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fbd6d0b174af..7ef72fc7cc21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2873,11 +2873,15 @@ D-Bus
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
 S: Maintained
 F: backends/dbus-vmstate.c
-F: tests/dbus-vmstate*
+F: ui/dbus*
+F: audio/dbus*
 F: util/dbus.c
+F: include/ui/dbus*
 F: include/qemu/dbus.h
-F: docs/interop/dbus.rst
-F: docs/interop/dbus-vmstate.rst
+F: docs/interop/dbus*
+F: docs/sphinx/dbus*
+F: docs/sphinx/fakedbusdoc.py
+F: tests/qtest/dbus*
 
 Seccomp
 M: Eduardo Otubo <otubo@redhat.com>
-- 
2.34.1.8.g35151cf07204


