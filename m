Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403E0487650
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:15:51 +0100 (CET)
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nDq-0002ao-B0
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2S-00085k-0n
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2M-0001qX-UK
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NmSRsYDHdSt3mPPWE/VBrC0tl4EEty9M7O4eh0ePIo=;
 b=bpCSmCZchtE21Je62Rr5T6qVGzbrf1iQN4hsbLqIp3px3uZuaNUJ6VJ7Q0s1O6aXiVTQo/
 sT4mdYa86uZJlceT2mHw9Mw1c+Q68opgRCUOXIwS6uoxwuVgc3mwPH4qY27ZGUrgPU7YEm
 WRnWLaDZdrT4FPnjT9FDtrD/Fmeciww=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-RCIEq3PDO1uhqBU_XecL6w-1; Fri, 07 Jan 2022 06:03:55 -0500
X-MC-Unique: RCIEq3PDO1uhqBU_XecL6w-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay41-20020a05600c1e2900b00345a568e6b2so1348118wmb.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5NmSRsYDHdSt3mPPWE/VBrC0tl4EEty9M7O4eh0ePIo=;
 b=xNRAIDim97AgDyR8+pPCN6vrpbyz5Y45htZitaNUsGaFHdD/ylc+LWghu996oXzDPN
 ZNOTFITKeCFbVS069zFIU1fXUTHBca/RhIoKjLH6DxKhoRYqsemnF6teTvKeAhzoS2hP
 IyLKUuXx+EnbPdMthkqZcXMcZ0eQYIV5n8V/g906svWuWgA6zOiTq/xAS224ekTpJ0LH
 mxkaHBNR8bqK39nwa0/dL/+GV17xcSDHc+mIq/UV62xxP+cQVYDOeyyKJi8pF/zQJECf
 uBtoTo3MSVcSJCrXLIZTEEoRWyQdCQLp3XIU/2ZessG+GbXUEAoYrsMIiIIMlQ2v0f06
 LawA==
X-Gm-Message-State: AOAM531dXw8jpawAVbHm/yqBd8ggJsi4RaVu4Uxdg7Im+dM9Ls3BSAbm
 h0z6J+4cC3msuj6kn4e/jCLSYRmoZQqHuXBCrgcNjfLnPFR7OqfTZH0xvLG2nY3/fPZwWWH2B9F
 DkXDwiXVmasfPyFp7o5EtT3pqYO14LyLVWN372aQEL+Sz3L+3zuZJ1xRP2Vxn
X-Received: by 2002:a5d:648b:: with SMTP id o11mr53390060wri.227.1641553434228; 
 Fri, 07 Jan 2022 03:03:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyV7jnNP5g2bl4dFTRUdN7sWzahHLo/O0QtLsscxj8i7mwToyTedUE52xSLaDjpH2xQOd4sBw==
X-Received: by 2002:a5d:648b:: with SMTP id o11mr53390041wri.227.1641553434045; 
 Fri, 07 Jan 2022 03:03:54 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id s8sm5240127wra.9.2022.01.07.03.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:53 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/55] chardev/char-socket: tcp_chr_sync_read: don't
 clobber errno
Message-ID: <20220107102526.39238-17-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


