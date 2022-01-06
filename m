Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13E7486558
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:38:10 +0100 (CET)
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Sy1-0002uQ-RR
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:38:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdk-0004Xa-Ax
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdg-0000qa-PE
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/nf9E9axwJOMcdCAGncabD48HF9k+D1ZiFHnSo9Ej0=;
 b=D6+Zr1mQSSYGIngRE5C7Y3sV8/ri3HF0zoqoF87a6faqhCpVfBjUILNHVv7UR0PiSIjTHy
 1uENpnnmlXTxpzS2U6M/febppAyHD0ZYEwT1912A3JQGsbzPbLYHfROGDvL29rMSla6g3L
 6nmoLdoNPgA8OiJDyPIcK+3GXCQVHoU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-fzWUrAfHOh-VXgil2kJtlg-1; Thu, 06 Jan 2022 08:17:00 -0500
X-MC-Unique: fzWUrAfHOh-VXgil2kJtlg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l20-20020a05600c1d1400b003458e02cea0so3056212wms.7
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=v/nf9E9axwJOMcdCAGncabD48HF9k+D1ZiFHnSo9Ej0=;
 b=WDHjrDT+Q99e6t7WxfFJedzJpLbrptJK6viRWBBwfrVbHStmawqIfqWFt+/wO+iXpW
 PhSRe06kL/1bn8WSYx5O3jhknY/42FE9UU2pTAXqXfhDnM6rL06yEHc8Q+2CJHwgshTn
 Nlm6mOlVDAl7VW2a0Elrps3nlQbGDfRVw69nELuAjAaBxc8RNvBfDhpsv2JQBWpuY/qB
 7+u/MCZHenKB1OII0Qfgx9nECobKCfQmoTRltgeJCnd2XmuyeZgP4pJKekEyDcMYX278
 e3E5d7aG7pdFXoFw4sHaSbYXAakirkYbFmRw+C305lgHgUKvjjTpoxFB1aRMhU2YuYMb
 uosQ==
X-Gm-Message-State: AOAM532JdMMZZNiz+v1xw0mg68tqe7BuNecU2NNqbgDm6Hk1UQtajzVK
 mXqNwgUw/GibbisunajWRHwmGjXG4/2X5vcKHTyqnwFelMMZx2QdpN4yQB9QyRwS4ueX+0KM23B
 P+gpwTnvcYDQNLjzZR0iRADqpfez2CFaciHggBK7sCxFfb/cMHU0pca3AkadA
X-Received: by 2002:a5d:488c:: with SMTP id g12mr41141629wrq.96.1641475018801; 
 Thu, 06 Jan 2022 05:16:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXV06/Zb9BwUp8UQvA1VkRUKWTLgCkY4sMB4lehLSrKBUvvuwicCc8guXwO2pCBw8PZ2Wkbg==
X-Received: by 2002:a5d:488c:: with SMTP id g12mr41141614wrq.96.1641475018601; 
 Thu, 06 Jan 2022 05:16:58 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id d11sm2168984wri.101.2022.01.06.05.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:16:58 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/52] chardev/char-socket: tcp_chr_recv: don't clobber errno
Message-ID: <20220106131534.423671-16-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

tcp_chr_recv communicates the specific error condition to the caller via
errno.  However, after setting it, it may call into some system calls or
library functions which can clobber the errno.

Avoid this by moving the errno assignment to the end of the function.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-3-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-socket.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index d619088232..3ddd98ed49 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -290,13 +290,6 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
                                      NULL);
     }
 
-    if (ret == QIO_CHANNEL_ERR_BLOCK) {
-        errno = EAGAIN;
-        ret = -1;
-    } else if (ret == -1) {
-        errno = EIO;
-    }
-
     if (msgfds_num) {
         /* close and clean read_msgfds */
         for (i = 0; i < s->read_msgfds_num; i++) {
@@ -325,6 +318,13 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
 #endif
     }
 
+    if (ret == QIO_CHANNEL_ERR_BLOCK) {
+        errno = EAGAIN;
+        ret = -1;
+    } else if (ret == -1) {
+        errno = EIO;
+    }
+
     return ret;
 }
 
-- 
MST


