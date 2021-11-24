Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F4B45B7FC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:04:01 +0100 (CET)
Received: from localhost ([::1]:42226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpp8C-000142-Hf
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:04:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0p-0003pg-IB
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:56:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0m-0004wj-RQ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulUQI87aAwgZRgREGrNbA238jZyNy23cNrEDcHJPeEo=;
 b=Jj3qQTdxaXDwh4hJpX/kv1zclzrcWvlPU/A6H+2O5J9kSsMhw+x/xlLN14gDr9F3fub1RB
 x0SOW31X9BphbAFHLBmVRxe5xI77uUZcjrkAtmQGmGjI//78IEOBchwZPpSAK7oOMcwfVv
 B0gORqqwHXaOtBl070c4qWbndYHjYKc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-Rr1OUCLIOjaiZBWeAlKwsg-1; Wed, 24 Nov 2021 04:56:18 -0500
X-MC-Unique: Rr1OUCLIOjaiZBWeAlKwsg-1
Received: by mail-wm1-f69.google.com with SMTP id
 187-20020a1c02c4000000b003335872db8dso1067127wmc.2
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ulUQI87aAwgZRgREGrNbA238jZyNy23cNrEDcHJPeEo=;
 b=tG79CrECtm4qltSz0ANANdC0lXwqCW51d7PzLBWtwlYnUqK4p4hn5Op9FzRFBPOSHa
 LA1avZ0iLara4ge1gUdIIKmHLp5zcEKrJqk6+sm9yQnvw5Eha9NfN/MOXADn3OomcJ9e
 WEZfmIzl+IoiR1Xk7eq7vGZjAh5KRB0IYcj5Ox4uz5B1Xs3yoTw9E3zKnNQMvaClM60a
 RREkgtIBLRjEQm5RVgcbAFZKV8vy4KEJORJLWjfHRBv6KAqdtulg20CKGuveK/q2nYpR
 tIqqgzDFREODo87eJJE3bZeJ7EDQVUBe4HDtXr3gtFYWBxq3Ai+EE6kmHIwEze0fXUBp
 9+aQ==
X-Gm-Message-State: AOAM5306DWm+2FQxv+gGJlHZGgJbRmsVpp7jc8NyamNSF7V2L3VEDLrm
 +VQxsDtB9KeVPt4ROSbgPhzm0NkxH7ppmOxW4Vek4UT5x5b4bthuES5q+SM2Mj5S7CH9CkUKw+N
 QJEtYC35VxTK1v8tDYT24P13FsylC3cNXTkPamriIcGQ5BiUVN3bzSUcxaeAzJkxva3c=
X-Received: by 2002:adf:dd87:: with SMTP id x7mr17000489wrl.158.1637747777338; 
 Wed, 24 Nov 2021 01:56:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmSn2JBKk6d3ZcNl1Q19GMzA7miXmOMjWxGL1Cz9TNwug/6K+KZCkFvzpelBOqdNTotH1GtQ==
X-Received: by 2002:adf:dd87:: with SMTP id x7mr17000464wrl.158.1637747777155; 
 Wed, 24 Nov 2021 01:56:17 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id e12sm18052812wrq.20.2021.11.24.01.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:56:16 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/23] multifd: Make zlib use iov's
Date: Wed, 24 Nov 2021 10:54:49 +0100
Message-Id: <20211124095500.42078-13-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124095500.42078-1-quintela@redhat.com>
References: <20211124095500.42078-1-quintela@redhat.com>
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


