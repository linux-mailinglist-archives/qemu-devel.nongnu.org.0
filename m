Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7F6457511
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:12:07 +0100 (CET)
Received: from localhost ([::1]:55644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7Qk-0004fQ-Ig
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:12:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7ES-0005ND-Fn
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EM-00037w-TZ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637341157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUyzTbOJjOPgXqSYs2to7uChDHjS+MqAZ2UTXfAVcng=;
 b=cm2BwliEEzRvbFMqrPz3Czhin2GjQVHozkQ04NSvJOMafV4kAAH+E5/a0o/pPa7MtXefx5
 dVjzks50Udy3E2XcOoHPj5A0dLavjs7wmbzAJ9g/UCkcdpY9R7gW65UyTWsSSRCr6eHNN9
 T6J0sfGMz3VJ+4m+lISsqvd3UpO/3CM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-q_KyJF_FOuauQ1ZVPJVsFQ-1; Fri, 19 Nov 2021 11:59:16 -0500
X-MC-Unique: q_KyJF_FOuauQ1ZVPJVsFQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so5025445wms.7
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wUyzTbOJjOPgXqSYs2to7uChDHjS+MqAZ2UTXfAVcng=;
 b=5AY6cx+wCFVVAByCyIRpB745DTQhSqF0tqr6oO1lLQYnFzauV1m5SWz7qVyjFhIoQK
 NkPYZ+pleuqQXyj7niW4dLgVT/qO1S0i6e5kxyjJUZNh2XFMalg99Nj4C3akD1Ug7ja5
 GWthb+GVWLi3/Y6hMiECdd7FB+PibDSjDvXjFEF6SFNs9RQZGeUVpw4Km9FnBZ5Y+8Ro
 NjEcWnI5RbgENd8an6tpRgumb6mvdyvW52om94rQrfGvQRbTG5wMwPr5gcU3WikARAI+
 ByfI/6b+wplbeJOR3B/CO/tVbBLiYmQ0JieskRUL8fqBNLCVXXA/ihnlY1VXqKoHTaVt
 lkcw==
X-Gm-Message-State: AOAM530fLdnEu6WhVwCYAE5mToOIleYIgaqfPBLQqweUJ3c19FoX/YS8
 BJ4Ww7fAROldcTr4Bso4xMPlB2KAOCXfqvvpqBTYpeQFK3TJg8HZBI3EzNPuPRrsiXBft6nDSWz
 3z2xq9rNPd1Dg6zd0dMFdxyry9nZhzwjVqaYAHZLakwUmtLlQDJ7q8pTCHNaZNacI4Zo=
X-Received: by 2002:adf:efc6:: with SMTP id i6mr9344057wrp.428.1637341155231; 
 Fri, 19 Nov 2021 08:59:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrpT7GblCgXsaFm7U/gHEKfMSCw4J2QEpRW0x8Fj+6k5MtwYtZIfwm9xHVsXdvP9aOYo/nZw==
X-Received: by 2002:adf:efc6:: with SMTP id i6mr9344020wrp.428.1637341154985; 
 Fri, 19 Nov 2021 08:59:14 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id ay21sm13003396wmb.7.2021.11.19.08.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:59:14 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] multifd: Make zstd use iov's
Date: Fri, 19 Nov 2021 17:59:00 +0100
Message-Id: <20211119165903.18813-9-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119165903.18813-1-quintela@redhat.com>
References: <20211119165903.18813-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zstd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 1dccdbd733..6183d0b26d 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -155,6 +155,9 @@ static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
             return -1;
         }
     }
+    p->iov[p->iovs_used].iov_base = z->zbuff;
+    p->iov[p->iovs_used].iov_len = z->out.pos;
+    p->iovs_used++;
     p->next_packet_size = z->out.pos;
     p->flags |= MULTIFD_FLAG_ZSTD;
 
@@ -174,10 +177,7 @@ static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
  */
 static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    struct zstd_data *z = p->data;
-
-    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
-                                 errp);
+    return qio_channel_writev_all(p->c, p->iov, p->iovs_used, errp);
 }
 
 /**
-- 
2.33.1


