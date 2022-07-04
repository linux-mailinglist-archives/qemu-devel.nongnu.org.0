Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37E3565E69
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 22:26:09 +0200 (CEST)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Se0-0006mO-0P
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 16:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o8Sbf-0005Jr-VQ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:23:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o8Sbd-0004Vd-RX
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656966221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ox4Xsr5IIBa2MFVKUDBG2RSJB9QVYlygPUGinGBDL2A=;
 b=Q9HjEKhbav25Kaq29wzcRJjUn62KzDFSbLAHOm5fFQbZ/nz+pF974NZ+LYpkikQaehg2Ve
 Z083mJjb+M85CrhaaWqdPaBcpZbYBNG7NB9TCzrcrYlZcNICbeoR7Mo1Y55EZbEFIygoZs
 sqBikl0KXH4nL6LQvXh6HLFsIbGoEuo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-4tZos8LpMr2rkwJqyIS3Hw-1; Mon, 04 Jul 2022 16:23:40 -0400
X-MC-Unique: 4tZos8LpMr2rkwJqyIS3Hw-1
Received: by mail-qk1-f198.google.com with SMTP id
 a7-20020a37b107000000b006af3bc02282so9612683qkf.21
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 13:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ox4Xsr5IIBa2MFVKUDBG2RSJB9QVYlygPUGinGBDL2A=;
 b=Lyv7skT4HBg7xNvhGJt5UKIlAKYkJEO6yYeyKwaI1TnSp+XZVm99roBd7/mlv3f+Of
 xgdOuhEksJH4+FMO/pPngYffwRIzLjhIPqQ0Lu91i5TQFhRYH+tXi67xdIsF9qrT07Ue
 Nnd2NseO2fWuhB0CYKwgozJxMvLI0C0WwAaPCPb7nbcvInmuvciSGCTB3X7NLqrnO4uH
 P8QII1VrOG3CMGwoe0G85rkNTAevlxX4D6pnjkay7P8o3m+mV8il1iDiRikKOb+IF5Wz
 CjDzraOUT7FF7tpJFE5Jr/joGrNza7hix0FWGfXkaCx7KNK9/sJzrQw+mnIju1PKPecZ
 zEDg==
X-Gm-Message-State: AJIora/j/t2knuQpFg6sE4vcEZkP2rufJftr00RFiJzDTo/RM+B4ZcqV
 P4bas0PF0juiupvPkwvBKf3B1kFhCdP0rjazxtNfK+yNs6xIO0WWPcqgWchxHLza08wcopxa4oS
 o9fhk3M4AWKQKZ3c=
X-Received: by 2002:a05:620a:254f:b0:6a6:313:3ccc with SMTP id
 s15-20020a05620a254f00b006a603133cccmr21605856qko.716.1656966219591; 
 Mon, 04 Jul 2022 13:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smvhwmfEbI6cm52kGTzN7jd8QZvN/woQ1BQh+NL40GhQ3VIqUWwpFN6wypwasjCoauwP41GA==
X-Received: by 2002:a05:620a:254f:b0:6a6:313:3ccc with SMTP id
 s15-20020a05620a254f00b006a603133cccmr21605845qko.716.1656966219380; 
 Mon, 04 Jul 2022 13:23:39 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7ed:cb75:d392:178:9101:5763])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05620a0b8b00b006b25570d1c2sm9180127qkh.12.2022.07.04.13.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 13:23:38 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] QIOChannelSocket: Fix zero-copy flush returning code 1
 when nothing sent
Date: Mon,  4 Jul 2022 17:23:13 -0300
Message-Id: <20220704202315.507145-2-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704202315.507145-1-leobras@redhat.com>
References: <20220704202315.507145-1-leobras@redhat.com>
MIME-Version: 1.0
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
---
 io/channel-socket.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 4466bb1cd4..698c086b70 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -716,12 +716,18 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
     struct cmsghdr *cm;
     char control[CMSG_SPACE(sizeof(*serr))];
     int received;
-    int ret = 1;
+    int ret;
+
+    if (!sioc->zero_copy_queued) {
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
2.36.1


