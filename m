Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5302E570C8B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 23:14:02 +0200 (CEST)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB0jB-0007Vn-EB
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 17:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oB0h2-0003Sx-12
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oB0gz-0004aw-C8
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657573904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcNVwgQ9IZol65+g6ClDaFHZ7+0gJX3iogcnux754+Q=;
 b=flpZ+3xYqEATq7T20xjfjSDF8N8cZ89IsqVjI6dJjBgUmgiYOpVzTOeeKtoQCZQEhcdDKn
 ub0hdLLEh1I5StGd4Y27wvI1J8CR+yQGEkQx1TwS8ANo8uCIJ0ZQc1u8FDea5KgHAsqrHd
 rc15JtD46HnGkboN5TWssKUHGXMrm9w=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-cLAAYnOgM6aO6x8RXjazvQ-1; Mon, 11 Jul 2022 17:11:37 -0400
X-MC-Unique: cLAAYnOgM6aO6x8RXjazvQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 m2-20020aca1e02000000b0033a087dd9c1so1186166oic.8
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 14:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xcNVwgQ9IZol65+g6ClDaFHZ7+0gJX3iogcnux754+Q=;
 b=rFjhU/C4AlKhDjafnkpdnBdjT5Ko1jDk1S1WdL/V6sxFzX5tiRjAokFsevQ2DfA6rb
 f9Q6p+mR/1UP6XNt4rXuxbmbuqL82EuKUEyvdTgaGm6S4OgJ0HRLyD9nWto3yVUc0kWK
 i7QS6A2ki08OPoCZ+mxX2YCkInUd2OFxPJVfwqqdNRkOrsBBlRSYp7WdAO5SLINLJZL1
 K2tS0u0cdufEn0wA3iSMZxEnv+rI4fTJ/hHW7wWkNVC+DAjzvMunqnwCucdJf/t36QpO
 AztkM/J5X1oBvDrzB1qCiH6ah72r0KPekYkGtO8WbbCPxu5MtCX3xUKXSSz/dIUE2JCL
 F+Wg==
X-Gm-Message-State: AJIora//zsNvCuCmJNVQR4o9791C1W/L2o082S/VxNp/A9g8y/Z2mZ8R
 J7p2PkfhYCJ8D3dQwzHoDJ50QXayyyCWZj+A+QHXPKTLMDgSFpnavFvK042RtHzkUfrbnKo0Fsj
 mHqrEY3r2qBYlG3Y=
X-Received: by 2002:a05:6808:1308:b0:337:a84c:ccb4 with SMTP id
 y8-20020a056808130800b00337a84cccb4mr195504oiv.218.1657573896940; 
 Mon, 11 Jul 2022 14:11:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tOat4JoENWl4Mt+K4QK2rb/px/NxtfQwDUU0/HNoGPax5WkNTLhvj141XYLg8R5a1o2J/jLA==
X-Received: by 2002:a05:6808:1308:b0:337:a84c:ccb4 with SMTP id
 y8-20020a056808130800b00337a84cccb4mr195499oiv.218.1657573896794; 
 Mon, 11 Jul 2022 14:11:36 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:d647:bb68:29a5:e512:2c8b])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a0568080a8700b00339eb701c6csm3140343oij.41.2022.07.11.14.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 14:11:36 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] QIOChannelSocket: Fix zero-copy flush returning code 1
 when nothing sent
Date: Mon, 11 Jul 2022 18:11:11 -0300
Message-Id: <20220711211112.18951-2-leobras@redhat.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711211112.18951-1-leobras@redhat.com>
References: <20220711211112.18951-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

If flush is called when no buffer was sent with MSG_ZEROCOPY, it currently
returns 1. This return code should be used only when Linux fails to use
MSG_ZEROCOPY on a lot of sendmsg().

Fix this by returning early from flush if no sendmsg(...,MSG_ZEROCOPY)
was attempted.

Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 io/channel-socket.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 4466bb1cd4..74a936cc1f 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -716,12 +716,18 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
     struct cmsghdr *cm;
     char control[CMSG_SPACE(sizeof(*serr))];
     int received;
-    int ret = 1;
+    int ret;
+
+    if (sioc->zero_copy_queued == sioc->zero_copy_sent) {
+        return 0;
+    }
 
     msg.msg_control = control;
     msg.msg_controllen = sizeof(control);
     memset(control, 0, sizeof(control));
 
+    ret = 1;
+
     while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
         received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
         if (received < 0) {
-- 
2.37.0


