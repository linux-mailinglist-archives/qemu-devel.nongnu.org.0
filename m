Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38DE45AAB5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 19:01:51 +0100 (CET)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpa74-0001dE-PO
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 13:01:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZxJ-0006g7-WE
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZxF-0006tU-Lg
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637689898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHo1ecYwtwo0REW0mCQmZS/6gX+5pwE/7n1NlC57ldY=;
 b=JP7EPcvoBObpgrucNaagHJI2W5KDF5eEoXvdMjxGCapFDydwLTQHibXK0TAIKlXI8sLpAg
 LnJguxqqp6/yGav0LSUe8rEEdZrC1K4moaF5rGiNKpaY7dQDqgTFE9ZmIXzgjNOvIncV/1
 MvzuUHDsfqqTqc3mn/GfJurJxQm1DJA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-WpqN7M5nMSKgAD8kDEekhw-1; Tue, 23 Nov 2021 12:51:36 -0500
X-MC-Unique: WpqN7M5nMSKgAD8kDEekhw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so1919014wms.7
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHo1ecYwtwo0REW0mCQmZS/6gX+5pwE/7n1NlC57ldY=;
 b=XBqAXINXkjiZQAvn7Dd1DKrzHcKD7u8JpwUG+jcTRcfdo9zax2fqz5TLQrvM7o0PLs
 eeD6SWS9l0HhI6hhCJLJvy0Gh+KBYPD5eCv7GosvYm0wufgNgivmTozEjT6hSAGF85Fi
 JSz58UNuVRHWdLfqvVZlQGzTr4BsSdLL7wehd+Jz1JwK77f2JPDOHM4Y3BFnwUv7hhyv
 /7/i/lI5V0gIlrjXVfdVjDMQefyoTt+FNcSe2Uls642CnfdM3wf/ul9dxUD4ZyBOD1n/
 u7pdvZu5CwESX2AgHq8UYeLVDrlrjN1c/xK9eIqfhKo4DVnPNM1mUgpmR9XkIwq+lsMg
 PHNQ==
X-Gm-Message-State: AOAM5337KWApVwg3ar57ErNnWOSfJ1/qZBR16DcY5uUHimSdJNMVO9ak
 OeI+iMjGHDp9Uy58WlvDSOIUxUrqG35y+GQk9IyIKKVrhfly9yxd9PjZbLKh+O7mmgC5WIg/1QP
 b5ZO/p4GZKQQE250iy8SsmLUPi0f+MtFPHogX+o9FxZHE/hIUy04srU0CrKOb0zVDpgM=
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr9581429wrz.133.1637689895005; 
 Tue, 23 Nov 2021 09:51:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyDkJ3G6sIXKOzC3NZwtcW2oXT5CpXi2P0c9UHt9ZNscLgI/EVLzv39r3O0VhWQd6WcpWR7w==
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr9581391wrz.133.1637689894731; 
 Tue, 23 Nov 2021 09:51:34 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id u23sm13628472wru.21.2021.11.23.09.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:51:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/23] multifd: Make zstd use iov's
Date: Tue, 23 Nov 2021 18:51:03 +0100
Message-Id: <20211123175113.35569-14-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123175113.35569-1-quintela@redhat.com>
References: <20211123175113.35569-1-quintela@redhat.com>
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zstd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 2d5b61106c..259277dc42 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -154,6 +154,9 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
             return -1;
         }
     }
+    p->iov[p->iovs_num].iov_base = z->zbuff;
+    p->iov[p->iovs_num].iov_len = z->out.pos;
+    p->iovs_num++;
     p->next_packet_size = z->out.pos;
     p->flags |= MULTIFD_FLAG_ZSTD;
 
@@ -173,10 +176,7 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
  */
 static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    struct zstd_data *z = p->data;
-
-    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
-                                 errp);
+    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
 }
 
 /**
-- 
2.33.1


