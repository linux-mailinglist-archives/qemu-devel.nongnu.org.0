Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2D0488066
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:23:16 +0100 (CET)
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60Rv-0006yd-Dw
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:23:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609h-00041G-NN
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609g-0002MI-5Q
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/nf9E9axwJOMcdCAGncabD48HF9k+D1ZiFHnSo9Ej0=;
 b=FwuCyGZqRtNGko+S49qGqzHDqCuSO/RXS7+cJk8WuqO9EY4uMNfBLnsJ6WxIQzEmkEtQ+5
 IXbXonEYQHtIOI5v1t8TFOlWyRGBqrSRW9/o0klfgZtmNeIkm9e8/9QBoVLycKe1BZ3m+h
 72fSftq87o6JkXV8H+75hRkSRpJbsdQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-hQ_oDhhBPsiFt5mR-zWZfA-1; Fri, 07 Jan 2022 20:04:22 -0500
X-MC-Unique: hQ_oDhhBPsiFt5mR-zWZfA-1
Received: by mail-wr1-f70.google.com with SMTP id
 a11-20020adffb8b000000b001a0b0f4afe9so2342239wrr.13
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=v/nf9E9axwJOMcdCAGncabD48HF9k+D1ZiFHnSo9Ej0=;
 b=sJmGDAW4ja/SpFjhuPjnLyx5zCLLFWkQYLF9BWY0n3cKoMTgS8eUtJ/58JSrLgYpYm
 2oyV9WSQvICFzSOvjNuCh16pYYg+lejdJnTQyrwh2XaFC+SvQ5OqLACBYU/G7qB4hk7w
 jqTYtnDWnBcGLPj64/U1TfC/v1eJME9UpzGEtU9FpnQFsz1tNy82GTLnak+y+wnQdm/l
 4Mk8t+qPg9biK9crlrrHLF45H1CWP6imooiEbjxLYDnteopVCB4Wzj7V/jQhKP4MBN2i
 6P2y7VbLwYOKf1Mtrh2547+r8gDS8b0M8ehfCz/83a2wOZD31OffkWXfuMdhMJY9Nv2k
 LgXQ==
X-Gm-Message-State: AOAM532Mr+TKDAQ/bw/iKpg4xZwsivxfpDQgY7GBm5ktsj9+oZcXI0es
 5EtxlnSkvIVSIfLT4Unu+5g2cyMMlUCo3AEz77RMXX0+yhxC/vZ6H25bRGFrdJsC35wq7AvhKZZ
 mg8hPwNVMfUnF+p7070qwaJvgG5ylnXS7KhvW0o2E+qWtWVy3XEQ0k0XF6LzD
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr55944257wrs.507.1641603861123; 
 Fri, 07 Jan 2022 17:04:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMx/BLATVPtzFoUX0NBc2DVOEMLO/E9nK5T6z5Qb39COwG8Ar3AuNDWg28wo1yfWI1J9Ilbw==
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr55944246wrs.507.1641603860966; 
 Fri, 07 Jan 2022 17:04:20 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id p23sm89800wms.3.2022.01.07.17.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:20 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 15/55] chardev/char-socket: tcp_chr_recv: don't clobber errno
Message-ID: <20220108003423.15830-16-mst@redhat.com>
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


