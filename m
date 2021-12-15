Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF9B476142
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:58:52 +0100 (CET)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZUJ-0005VV-Uk
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:58:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYxI-00054z-25
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:24:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYxG-0007PZ-GH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639592682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4mzR8fzIq0zn1fqfmM14R0Bl8uzchpxL44PQBaxe0yI=;
 b=a9TrGpxaDYBP6q1Qdit7+YKpN5gKUl5qIW3H9w3gPD/7Dfdbj8QlAJJ51aUg6d/U6JMQos
 3PM8qq40vovyj9M8zVI1k0Kh9rnal41Yn0V61w2rRL35P963hsfv0RUor8sxblzIPA6SVO
 SVYaOSHMilKTRFoobXct5cdVYFIxKxQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-GIwTXlE2PKKVAn-9-yJ19w-1; Wed, 15 Dec 2021 13:24:41 -0500
X-MC-Unique: GIwTXlE2PKKVAn-9-yJ19w-1
Received: by mail-wm1-f72.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so9353601wms.8
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 10:24:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4mzR8fzIq0zn1fqfmM14R0Bl8uzchpxL44PQBaxe0yI=;
 b=b84KkbnD2GmL/JdFMItaNDW30BvJ8am62kv479VfUarbRrtC/hkNMANgEU0pHklTAm
 ecTZ7XaFYHaFyGexmqTstcHne99XjevZJ1gGZ7dvixiHSwswbzisSJszn3D4AMDVdqJ0
 sF80E/3YXzPtg8XHdglVnXDySHx2rGJs2XkVDQcnhOKiJVciN+DA6MbxHroumZ2OwrOO
 WAZsz4+qaMLJvCDhwqVNlKvqA5QD7IAgmTj2XdLPG5+E4rax1q+aNZJ/A/cW6soUhNsA
 R6tVEY9k4HrxnyhiPhermlvh30cCdys4RFUdMOuw1TyGRr7kZTYbOELdiYboNkiXEzq3
 MyPw==
X-Gm-Message-State: AOAM530a3AdRSOroovWwjJYn4rdgzHiCgQMkgUm46G1Kb0xJ9d0nB1SF
 I8SoSAWdKB6rqvJJBYIGEZqUxGBxAN/rX4bJkQrKFJMDSO4Cn3TbldsGCyJcZz8Ikm5rJz5QJyT
 EW+ZmBlDmPcA+n60kgPnTPnsCakkBkwmuqSiwhpc+mkgdCxnZ5YAoJt33VZLoT4lQ
X-Received: by 2002:a05:600c:3489:: with SMTP id
 a9mr1268610wmq.120.1639592679631; 
 Wed, 15 Dec 2021 10:24:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjDwwBzg4qM9VuIUo4SsY/rYgAnw8MhOpilDb7jMV/eZQPVAVJ9516Umrn+mKP4jElxhqajg==
X-Received: by 2002:a05:600c:3489:: with SMTP id
 a9mr1268568wmq.120.1639592679356; 
 Wed, 15 Dec 2021 10:24:39 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id 8sm3103664wrb.49.2021.12.15.10.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 10:24:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 2/3] softmmu/physmem: Simplify flatview_write and
 address_space_access_valid
Date: Wed, 15 Dec 2021 19:24:20 +0100
Message-Id: <20211215182421.418374-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215182421.418374-1-philmd@redhat.com>
References: <20211215182421.418374-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove unuseful local 'result' variables.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/physmem.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 007e7526f0a..6c97a20107a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2815,14 +2815,11 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
     hwaddr l;
     hwaddr addr1;
     MemoryRegion *mr;
-    MemTxResult result = MEMTX_OK;
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
-    result = flatview_write_continue(fv, addr, attrs, buf, len,
-                                     addr1, l, mr);
-
-    return result;
+    return flatview_write_continue(fv, addr, attrs, buf, len,
+                                   addr1, l, mr);
 }
 
 /* Called within RCU critical section.  */
@@ -3119,12 +3116,10 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr,
                                 MemTxAttrs attrs)
 {
     FlatView *fv;
-    bool result;
 
     RCU_READ_LOCK_GUARD();
     fv = address_space_to_flatview(as);
-    result = flatview_access_valid(fv, addr, len, is_write, attrs);
-    return result;
+    return flatview_access_valid(fv, addr, len, is_write, attrs);
 }
 
 static hwaddr
-- 
2.33.1


