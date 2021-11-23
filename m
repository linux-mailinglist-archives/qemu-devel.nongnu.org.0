Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E5245AA95
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:53:47 +0100 (CET)
Received: from localhost ([::1]:45798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZzG-0000wa-HB
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:53:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZxJ-0006g6-Vn
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZxF-0006tD-JM
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637689895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulUQI87aAwgZRgREGrNbA238jZyNy23cNrEDcHJPeEo=;
 b=e3dR12Kzy7e7YihKP1pnhZoCDuxTwnPt/RK4IGw9lnsX7KGrWEPQbFJtVKgjyayy4a1Ro4
 FwmKSrwkNRXh20pX17UoY78gb89trfzuq4Ldx6cLnlRc0ESxW8WD8Ad9eZz9R4GkHpb1kd
 rBXKfX66WQDSM/aRGeR+hlImmIuxf2k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-hIzix5VUN36x4TQZ8j83MQ-1; Tue, 23 Nov 2021 12:51:35 -0500
X-MC-Unique: hIzix5VUN36x4TQZ8j83MQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so3877347wrc.22
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ulUQI87aAwgZRgREGrNbA238jZyNy23cNrEDcHJPeEo=;
 b=Bkq8UmzbrdEqOjj1cPadT1K+pF7PDv5hNgv0C98x9pXzT0WZWES9jcZl/2IFJZMm2U
 AKRpyB7B9i+58z020l+IDOoesCQOYcNO+LrofeoVeBZYCPJbXlTfpmue9/85FjrNOrmw
 gtFVJAlAQYuOnDDAN6lGYSQ08+Ln5W2+gCiI4x6g7gKvEroiUD3NCZAtxrYFB/zQqKW+
 OiK8JXpaJcM6N9A0ESNIdP7yswopPjqoorNagbj50FePx2k+gK7qkgnqkLXwybuLtqxl
 uHnY+Rs3HXOgxmjbPYHHWbAD8pJN2o1tS/hXUiRgVLeMlPIAdG/qTAfcV08FfM80Ws/e
 7CQA==
X-Gm-Message-State: AOAM531NSsgJfUEs6y1HsoVfFZLb7Pc8hUt14NCCSAr8Lcq0RHeTUq+X
 GIjwJkQ2RMdjNgzPsTHUYcvZfaRHciQDfLfukIR5pynnLrxWU/Mmhw7/X+mjZLCMyMu5QCL9y4+
 RlBZ5f1MzaFD0uiEQJ3g7xON+Yh/yai91PkLl37P845BJhle0LdFmm7Yy5tgVQ/V9YA4=
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr9110113wrx.70.1637689893427; 
 Tue, 23 Nov 2021 09:51:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXc6gR+XMZzUEDEm4mGkHMfSZ5qwwdWwpsxislabQKqyu5vuEi0KfaW0iZ5uvrATNWNa2HmQ==
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr9110084wrx.70.1637689893227; 
 Tue, 23 Nov 2021 09:51:33 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id e8sm12627782wrr.26.2021.11.23.09.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:51:32 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/23] multifd: Make zlib use iov's
Date: Tue, 23 Nov 2021 18:51:02 +0100
Message-Id: <20211123175113.35569-13-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zlib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index da6201704c..478a4af115 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -143,6 +143,9 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
         }
         out_size += available - zs->avail_out;
     }
+    p->iov[p->iovs_num].iov_base = z->zbuff;
+    p->iov[p->iovs_num].iov_len = out_size;
+    p->iovs_num++;
     p->next_packet_size = out_size;
     p->flags |= MULTIFD_FLAG_ZLIB;
 
@@ -162,10 +165,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
  */
 static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    struct zlib_data *z = p->data;
-
-    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
-                                 errp);
+    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
 }
 
 /**
-- 
2.33.1


