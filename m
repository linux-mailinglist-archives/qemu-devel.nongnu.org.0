Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFBD48808E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:30:58 +0100 (CET)
Received: from localhost ([::1]:55374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60ZN-0007iq-E0
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:30:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609l-00046m-1d
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609j-0002MU-LV
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NmSRsYDHdSt3mPPWE/VBrC0tl4EEty9M7O4eh0ePIo=;
 b=d7lNwRmqyhxQ1ehco4gcdUNWxwPyxZ59HrlyaR4mtCWVNB+0YSQO/JAlkv4MR/Icn5lRb4
 EJUiUchCrymsQ0cFgh0snwM7z5IzVDoUfo3KhCqc3LjWh97VCdylduy4ymOiMlWvlBIYOX
 TV0WpLxQiwNLyJlghS1v/tuzHwdbcmA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-egOplCHNPTq1XM169M4_XA-1; Fri, 07 Jan 2022 20:04:26 -0500
X-MC-Unique: egOplCHNPTq1XM169M4_XA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m21-20020a7bcf35000000b00346ddc490efso2497673wmg.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5NmSRsYDHdSt3mPPWE/VBrC0tl4EEty9M7O4eh0ePIo=;
 b=2+WoAGAG/JKEOZI/Z1mH97X3pIJX17pKGof3fmKWQSJLHPVgSrRw1eoI2Z9AZrXYyi
 1r011xRSeqP0oc93cTcuVV1Jm7aubNhE1IyPMVuzsC2leWi5oTD+6MNKJR/qh/3lcFMl
 ZCcUO+ToTx8KvQkMXeEMGxLjoyfArMYiTMTqhTXgVvQG75SD8kCN/2ORute3SpeNA7NT
 PM9ASxAnRNqZZ4OC1oS4oF+/6qD3IunG+oRSqBjP/q7xX3jbWhmblPpQpDNQzhdU2t33
 IlyG40b8kjGWA4bV64qGHnmB5wYRhkXedMMb0oFGUDh78/wIN+92HL63zu8CVqBqLvkW
 Mzaw==
X-Gm-Message-State: AOAM533++/y+I0K0qpvTLGioJ0x4jeHbZOd1BZXrSBiANh6VooEJOAi9
 bdgaI+MMcVFzA8ziQ5CetLuKbWNsIukJ43BjYraIsbIU0hptBh2zsGO7Ed7uMSKrvTrxXjEUqm1
 SHn/NP57GDxHeDr9X5zdrPGppIRvAFv9W3ERk/WCHe3Bzg4lRSLdMGcnq8A3j
X-Received: by 2002:adf:d226:: with SMTP id k6mr54825289wrh.243.1641603864765; 
 Fri, 07 Jan 2022 17:04:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhy2YNW4X5klWUK/rIBC0b0CpDtbvmokMT2AgnqOWVBhj4uK5+O5t3OYpqoZM0CPuhO1nilw==
X-Received: by 2002:adf:d226:: with SMTP id k6mr54825271wrh.243.1641603864456; 
 Fri, 07 Jan 2022 17:04:24 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id p11sm245057wru.99.2022.01.07.17.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:23 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 16/55] chardev/char-socket: tcp_chr_sync_read: don't
 clobber errno
Message-ID: <20220108003423.15830-17-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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

After the return from tcp_chr_recv, tcp_chr_sync_read calls into a
function which eventually makes a system call and may clobber errno.

Make a copy of errno right after tcp_chr_recv and restore the errno on
return from tcp_chr_sync_read.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-4-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-socket.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 3ddd98ed49..fab2d791d4 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -525,6 +525,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_t *buf, int len)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
     int size;
+    int saved_errno;
 
     if (s->state != TCP_CHARDEV_STATE_CONNECTED) {
         return 0;
@@ -532,6 +533,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_t *buf, int len)
 
     qio_channel_set_blocking(s->ioc, true, NULL);
     size = tcp_chr_recv(chr, (void *) buf, len);
+    saved_errno = errno;
     if (s->state != TCP_CHARDEV_STATE_DISCONNECTED) {
         qio_channel_set_blocking(s->ioc, false, NULL);
     }
@@ -540,6 +542,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_t *buf, int len)
         tcp_chr_disconnect(chr);
     }
 
+    errno = saved_errno;
     return size;
 }
 
-- 
MST


