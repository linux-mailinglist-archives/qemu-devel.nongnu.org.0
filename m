Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365F158983A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 09:17:27 +0200 (CEST)
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJV6k-0002UY-D7
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 03:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oJV1H-0007Ii-B0
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oJV1E-0000c1-GC
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659597102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N8ZRsrsEvJJ9rjQwULRerq75ck5VD0Ut5VIyI21Pv7g=;
 b=YITCZSsZ/+M9qRIbCX2rBuRlBXwFXK7fCcveHUhqJpoIdQsafQcr8KNPY0dd+3WlrssaqV
 FClN3lXAGunMc4tYi7zDDJKuQXfNAzHiBIsDF1OBvnRBeRnKhXTFnGHEKhMxzYjEeteq9w
 PksA4YpPs2TVUJyqtAM/8nr9HDXzW0s=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-1a8ozAfBM4aUjS9GxIDNHg-1; Thu, 04 Aug 2022 03:11:41 -0400
X-MC-Unique: 1a8ozAfBM4aUjS9GxIDNHg-1
Received: by mail-ua1-f71.google.com with SMTP id
 a18-20020a9f3752000000b0038758d0a430so3021142uae.21
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 00:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N8ZRsrsEvJJ9rjQwULRerq75ck5VD0Ut5VIyI21Pv7g=;
 b=GTMj1HFnQ05accTejDPFCfff8osVmZMHukE6iYF9j2TzCj8U4P+P80A/duYyPHYMUL
 /OEiPm9x+uLRomFxx8GyogiDK0qCQdTY7iGHPZ0/rWSKR4/PikpxH2HgRm0rYQDVbJSn
 rdQziog7WLI7t9g75Lu/hE/7ugx7C7qdX4xM+5cGk0fvW/H8iSHQAHFJuxKTjvlqQ2Sz
 +APiNg0zmXeRbBpzvI6wt0R6k9qjMCVDL5MGwdlDFpIFrgRu1IoB8SAXGhKioadGzd2I
 9ZBPaOzW8u+AnDz35772SzS+1d4aFd3GIKQ+sWsDHPcH2EK7CRXiPY/xNVCp8/UHY0RT
 w1Pw==
X-Gm-Message-State: ACgBeo0yx0cwTXiLnkrJzk6xIAM8KyU9AJzMsWe1Gfj2embc2ijqgxGa
 Dq9asyx3lOWpYGq4d/Mchly8szHg8Zfwx6jmJSVsJ3/ZIJsjUSKTsB2EnKMqQwyVLmNvNXyzTlB
 inrEjv6CiDMtpp+g=
X-Received: by 2002:a05:6102:3351:b0:354:5d34:6336 with SMTP id
 j17-20020a056102335100b003545d346336mr117144vse.75.1659597100667; 
 Thu, 04 Aug 2022 00:11:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7popYD7Jg1IQx6gWNcmaUNkmFGPnvi5eI//vM7mDXIOPf88nWAf+HTgwmm+JwZ2GokMKY0DQ==
X-Received: by 2002:a05:6102:3351:b0:354:5d34:6336 with SMTP id
 j17-20020a056102335100b003545d346336mr117135vse.75.1659597100386; 
 Thu, 04 Aug 2022 00:11:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a800:5713:6880:fd74:a3e5:2086])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a1f2507000000b003774b8164e6sm83608vkl.31.2022.08.04.00.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 00:11:39 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] QIOChannelSocket: Add support for MSG_ZEROCOPY + IPV6
Date: Thu,  4 Aug 2022 04:10:43 -0300
Message-Id: <20220804071041.540073-1-leobras@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

For using MSG_ZEROCOPY, there are two steps:
1 - io_writev() the packet, which enqueues the packet for sending, and
2 - io_flush(), which gets confirmation that all packets got correctly sent

Currently, if MSG_ZEROCOPY is used to send packets over IPV6, no error will
be reported in (1), but it will fail in the first time (2) happens.

This happens because (2) currently checks for cmsg_level & cmsg_type
associated with IPV4 only, before reporting any error.

Add checks for cmsg_level & cmsg_type associated with IPV6, and thus enable
support for MSG_ZEROCOPY + IPV6

Fixes: 2bc58ffc29 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 io/channel-socket.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index e6e7a12ae1..4f6bb6fe37 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -815,8 +815,8 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
         }
 
         cm = CMSG_FIRSTHDR(&msg);
-        if (cm->cmsg_level != SOL_IP &&
-            cm->cmsg_type != IP_RECVERR) {
+        if (cm->cmsg_level != SOL_IP   && cm->cmsg_type != IP_RECVERR &&
+            cm->cmsg_level != SOL_IPV6 && cm->cmsg_type != IPV6_RECVERR) {
             error_setg_errno(errp, EPROTOTYPE,
                              "Wrong cmsg in errqueue");
             return -1;
-- 
2.37.1


