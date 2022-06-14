Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B713654A8B5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:26:34 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0z4T-0005vh-RU
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o0ywN-0002xe-Ht
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:18:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o0ywK-000155-KW
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655183886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KWPYFw7zy4Bhs/tLZu0wi7mszAqDQve8uJ6Sqb2zL4o=;
 b=itXJpuHpAfv3n57hCTwCqbxTpZ3xL5JVwHDfI733UTD0wZfzad8VOriKI0HvG0srdSxMHk
 Hk7E8f4uSj5rDiEUX2IGIUz3Uc3Tn84+SNCTVc3Qx1XYp5a9qu89S8LggtbSJ7JtX9Lmfr
 UZp3FThr3X5PSj+7bQfRgID5OeFOtIg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-deS6D7ssM4-ZaQbvZenFBw-1; Tue, 14 Jun 2022 01:18:04 -0400
X-MC-Unique: deS6D7ssM4-ZaQbvZenFBw-1
Received: by mail-qt1-f199.google.com with SMTP id
 w17-20020ac87e91000000b00304bc431155so5827073qtj.21
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 22:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KWPYFw7zy4Bhs/tLZu0wi7mszAqDQve8uJ6Sqb2zL4o=;
 b=sdg+sASpMtNlsNMU9tQYjMahFaH9NvNA7qW/ra55g10kMGmKtMinOCu3rIVnruNTZX
 iMAl969jF4F2DeybZCdGUqRQwZCU4JxjZUBNbQYqlDVpgt1klQjGLzuabbwHHdKE6Lgu
 p+p+9ypaaMuy85rgPSXsCHT/rC7UKaAfiIj5wOjjsd9X+Euew04DvAJ7ip6h2a5FJ1OK
 TMRb8b/gYzVSftfEAo+qa4obsavdSmCHr7M8GbPCT2LV08T+OmhU3CGQm/Lp1jys7Z2k
 O3UDeArGHyi9LaOwzTnprB1gXmHMo15a16w1ffGHtgCcbpfow1L38bp0Z3a7nZfpdvO+
 RlTw==
X-Gm-Message-State: AOAM533KDrQaO8oQ2eiSZns6Cye0SPFmTXZcecbSpOuuwNkarz5YYWjp
 jutJG3SU7RmAN1nI/qwpFl2ILmqegcsDHNyDtT8BTtGTcgzr8531RB8pwAZLeOyLCKR+HXtrpiU
 XsGOavaWVc3+a7Lw=
X-Received: by 2002:ac8:570b:0:b0:305:e83:af43 with SMTP id
 11-20020ac8570b000000b003050e83af43mr2748041qtw.416.1655183883568; 
 Mon, 13 Jun 2022 22:18:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8U+4CXCF1GMCLcQ5FO7p0TTmlSVbbU+0H8qC7qvWDubHN7sZKse/tlBuTNW5XkVjPckqBFg==
X-Received: by 2002:ac8:570b:0:b0:305:e83:af43 with SMTP id
 11-20020ac8570b000000b003050e83af43mr2748029qtw.416.1655183883373; 
 Mon, 13 Jun 2022 22:18:03 -0700 (PDT)
Received: from LeoBras.redhat.com ([177.9.73.5])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05620a268700b006a37eb728cfsm8974872qkp.1.2022.06.13.22.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 22:18:02 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?=E5=BE=90=E9=97=AF?= <xuchuangxclwt@bytedance.com>,
 David Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] QIOChannelSocket: Introduce assert and reduce ifdefs
 to improve readability
Date: Tue, 14 Jun 2022 02:17:25 -0300
Message-Id: <20220614051725.143985-1-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

During implementation of MSG_ZEROCOPY feature, a lot of #ifdefs were
introduced, particularly at qio_channel_socket_writev().

Rewrite some of those changes so it's easier to read.

Also, introduce an assert to help detect incorrect zero-copy usage is when
it's disabled on build.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 io/channel-socket.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index dc9c165de1..cdce7b0b45 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -578,11 +578,13 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
         memcpy(CMSG_DATA(cmsg), fds, fdsize);
     }
 
-#ifdef QEMU_MSG_ZEROCOPY
     if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+#ifdef QEMU_MSG_ZEROCOPY
         sflags = MSG_ZEROCOPY;
-    }
+#else
+        g_assert_unreachable();
 #endif
+    }
 
  retry:
     ret = sendmsg(sioc->fd, &msg, sflags);
@@ -592,15 +594,13 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
             return QIO_CHANNEL_ERR_BLOCK;
         case EINTR:
             goto retry;
-#ifdef QEMU_MSG_ZEROCOPY
         case ENOBUFS:
-            if (sflags & MSG_ZEROCOPY) {
+            if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
                 error_setg_errno(errp, errno,
                                  "Process can't lock enough memory for using MSG_ZEROCOPY");
                 return -1;
             }
             break;
-#endif
         }
 
         error_setg_errno(errp, errno,
-- 
2.36.1


