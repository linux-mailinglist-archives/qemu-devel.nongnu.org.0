Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8460845AAB7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 19:01:53 +0100 (CET)
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpa76-0001nA-KP
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 13:01:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZxK-0006gA-08
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZxG-0006ty-PT
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637689902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WkhgT9OtfB0bw0bvbITBNcnsQogAWms8/w8iiMp6XA4=;
 b=cQiRr+lJ6mKLr4lzDoRcK8W2Ati9OaDXKX5ACMItKi5J8+POdH7wCQ6/yA+YbOPVPQznNf
 cBCNc0VwtErnU0cmxQ/B6llNXU6s62Rc+jp74fux8PucVIqhTg89bvs/vrS3UTV6ab4h+A
 q2NcmaAm2hibQFLaWn5EvOLgVtEsxHg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-7pVtsx8eMIChGuq37RwiyQ-1; Tue, 23 Nov 2021 12:51:41 -0500
X-MC-Unique: 7pVtsx8eMIChGuq37RwiyQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so8800184wmj.7
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WkhgT9OtfB0bw0bvbITBNcnsQogAWms8/w8iiMp6XA4=;
 b=y2Bp4+tbjumtsrlFlbSiQ3OiO4uyXBRktgZCREjJ5l2M9iCqKje/5/xMAVtm0Ue4YF
 GxGRxi12wfAP+OAK37KNKUn82tD8KpOZXZUEDvOwFX2UdKFLGIsYSrlZokEhtxqTMT+h
 UobmC+1NLegV3+BlACaPLi3hdAUItJu+I/lP5lNAMgglxbzR9gtQfTaDZCTrGPrSULCq
 13kV195cQ0tuBcBGiByILCKDk3PuM88qKgRRy0qjXet0crCNOg6UhEXPMPYWxytASzqB
 7/AwXd/2K0U9o5fwARq3loYi6BePx3EmUOdhrsyqVE2ENAfNZ+14twOrgzwaC+Ou5I4S
 Ii4g==
X-Gm-Message-State: AOAM531NsjbYAu21+6PGlrJwGXir1uXvh/Ne16YMOoN4t86P0+SP9dSk
 XdIwlCciieOvLZVXQf+znLQ/lH2uS1CHvXz3KOKuYQDszkpN/WecRyR+jgaj4PrHnJTqg42+bjJ
 IMEgnDFRUFxOyNeEJlP6ijatFF1svZcQpsqHkL2B+aa3je/QkY3exul1B8f8VFvGfho8=
X-Received: by 2002:a05:6000:10c7:: with SMTP id
 b7mr9811192wrx.160.1637689899801; 
 Tue, 23 Nov 2021 09:51:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+b5uFGeQEh0YgD7Lee4tdXAsN6yvG/tGcuN96t/0J1CL6GwCnrC2BHGF8zNGLqa6Bca1ygw==
X-Received: by 2002:a05:6000:10c7:: with SMTP id
 b7mr9811131wrx.160.1637689899392; 
 Tue, 23 Nov 2021 09:51:39 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id l11sm12508138wrp.61.2021.11.23.09.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:51:38 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/23] multifd: Unfold "used" variable by its value
Date: Tue, 23 Nov 2021 18:51:06 +0100
Message-Id: <20211123175113.35569-17-quintela@redhat.com>
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
 migration/multifd.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 65676d56fd..6983ba3e7c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1059,7 +1059,6 @@ static void *multifd_recv_thread(void *opaque)
     rcu_register_thread();
 
     while (true) {
-        uint32_t used;
         uint32_t flags;
 
         if (p->quit) {
@@ -1082,17 +1081,16 @@ static void *multifd_recv_thread(void *opaque)
             break;
         }
 
-        used = p->pages->num;
         flags = p->flags;
         /* recv methods don't know how to handle the SYNC flag */
         p->flags &= ~MULTIFD_FLAG_SYNC;
-        trace_multifd_recv(p->id, p->packet_num, used, flags,
+        trace_multifd_recv(p->id, p->packet_num, p->pages->num, flags,
                            p->next_packet_size);
         p->num_packets++;
-        p->num_pages += used;
+        p->num_pages += p->pages->num;
         qemu_mutex_unlock(&p->mutex);
 
-        if (used) {
+        if (p->pages->num) {
             ret = multifd_recv_state->ops->recv_pages(p, &local_err);
             if (ret != 0) {
                 break;
-- 
2.33.1


