Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D147B43B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:14:41 +0100 (CET)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzP3Q-0006UF-R0
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzOq1-0001jC-CP
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:00:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzOpx-00038U-8i
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640030444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayL3Y6gZm6XhBH2r4HXO5sw4wKPzmz4WxHL5sCFdC0w=;
 b=Vosw03CrYIlY/iNkP/UY0M71Di6h1tvAuz0zwgWl+2lfZw6+mW3K4pvQIbMTeNpaRycXoI
 XKZgRtcXTkiPt+bflB7ZPc31AiuuIAeAijKHjJRK+GNxQ8nrny8GHpbyrcCHxw3H0q8cKy
 QDduEbMxr6B3ysEdV9TTHEGHPmK9nKQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-GKxjaKHjOiCi7xch6YLq4g-1; Mon, 20 Dec 2021 15:00:43 -0500
X-MC-Unique: GKxjaKHjOiCi7xch6YLq4g-1
Received: by mail-wm1-f70.google.com with SMTP id
 u10-20020a05600c19ca00b00345b2959e5aso66584wmq.9
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ayL3Y6gZm6XhBH2r4HXO5sw4wKPzmz4WxHL5sCFdC0w=;
 b=mOFbNykafUU30gj9+542IcsfPPL2g6JP3NwknMtQyLLI7eURN8xSZ3P2VL3QpTocHq
 /RALGZ3L0de0m4BhS5lrSdpj9y5qhs/119xKAj0nrxyTuuK45Y3j7FxhAezgKG1qW4mR
 mn2G7g2KbRTSzWo9xz/WfkzASSxxSAbPOkaMrUdmbttQf8d81vnda0IOzoMwAqsrh1Ir
 +iAbbQnOJFHucGtU6K+VzmXK8QGXlaZAV8NJmoZql0eSiM/12OW9IlDlIjvng6fO5zjq
 dI+P83fnSjy40tCVnIxk/zdcAiJIU2NH8OwSdzqRNOqJmDSPghkPRgC3ywujMjKEs1Ky
 hoig==
X-Gm-Message-State: AOAM532IhrRxAWBlNjqTjrICNdrgPp5gq0pvOvyRyELlt2TYg5uNWouU
 61khtlslGElwQH+blOZU7zJj8OzSTzYmbjZUjAhKOo6LD6MhcYub6TAce6svudlGEaTMMaynZho
 GVtqKeKOITrS3/GJS+iCIjblQmrAi+s5VXRnOz1TCQE5Ns97U48maD3RFFo28NiSP
X-Received: by 2002:a05:600c:3787:: with SMTP id
 o7mr500342wmr.41.1640030441427; 
 Mon, 20 Dec 2021 12:00:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkPrcst9q21KRPZPYPKYU6oqIbOGKWi4+CYr42MOCnXy/l0Ei7BprLQicqm7wzEDQ3wYysYQ==
X-Received: by 2002:a05:600c:3787:: with SMTP id
 o7mr500311wmr.41.1640030441170; 
 Mon, 20 Dec 2021 12:00:41 -0800 (PST)
Received: from x1w.redhat.com (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id a22sm291743wme.19.2021.12.20.12.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:00:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] qemu-storage-daemon: Add vhost-user-blk help
Date: Mon, 20 Dec 2021 21:00:33 +0100
Message-Id: <20211220200034.2233987-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220200034.2233987-1-philmd@redhat.com>
References: <20211220200034.2233987-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qing Wang <qinwang@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add missing vhost-user-blk help:

  $ qemu-storage-daemon -h
  ...
    --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,
             addr.type=unix,addr.path=<socket-path>[,writable=on|off]
             [,logical-block-size=<block-size>][,num-queues=<num-queues>]
                           export the specified block node as a
                           vhosts-user-blk device over UNIX domain socket
    --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,
             fd,addr.str=<fd>[,writable=on|off]
             [,logical-block-size=<block-size>][,num-queues=<num-queues>]
                           export the specified block node as a
                           vhosts-user-blk device over file descriptor
  ...

Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
Reported-by: Qing Wang <qinwang@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 52cf17e8ace..0c19e128e3f 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -104,6 +104,19 @@ static void help(void)
 "                         export the specified block node over FUSE\n"
 "\n"
 #endif /* CONFIG_FUSE */
+#ifdef CONFIG_VHOST_USER_BLK_SERVER
+"  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
+"           addr.type=unix,addr.path=<socket-path>[,writable=on|off]\n"
+"           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
+"                         export the specified block node as a\n"
+"                         vhosts-user-blk device over UNIX domain socket\n"
+"  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
+"           fd,addr.str=<fd>[,writable=on|off]\n"
+"           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
+"                         export the specified block node as a\n"
+"                         vhosts-user-blk device over file descriptor\n"
+"\n"
+#endif /* CONFIG_VHOST_USER_BLK_SERVER */
 "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
 "                         configure a QMP monitor\n"
 "\n"
-- 
2.33.1


