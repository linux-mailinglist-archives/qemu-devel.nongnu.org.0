Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D55547BB47
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:46:54 +0100 (CET)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZrJ-0006Ry-4K
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:46:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZGa-0003Md-Q3
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:08:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZGZ-0002bE-FO
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9GuePvfcQNUX4Ocvb+3skfoRvEJi1UaU0Qp/d2hX+Q=;
 b=QZBhFrTAVU837X3fFNEb0XhXXgtdXUql5zxRYy3jn6CjzdLN6sxEJps6DCzek+WVHPXg0y
 C/ZL+cBHsnD1da2rigoH4E9YnYMCZTE/jGwpUp7HynngIhbmqZZvZd7uQ4DVeP++h6en8B
 Xkg1tNfp8KBYMB0OAv4IOyiMKRiaV6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-dzPFKmk6PsyG1fSnMffbKQ-1; Tue, 21 Dec 2021 02:08:53 -0500
X-MC-Unique: dzPFKmk6PsyG1fSnMffbKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4893B1006AA6;
 Tue, 21 Dec 2021 07:08:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F03F77451;
 Tue, 21 Dec 2021 07:08:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 36/36] MAINTAINERS: update D-Bus section
Date: Tue, 21 Dec 2021 10:58:55 +0400
Message-Id: <20211221065855.142578-37-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
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
index 1de6ce6e44eb..dc4b6f7c1e06 100644
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


