Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A833346E2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:35:01 +0100 (CET)
Received: from localhost ([::1]:57634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3fg-0007No-OK
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cf-0005eZ-Bd
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cd-0003AM-PK
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615401111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVxutgLWbsHETCN5jy828gv0QTW9f6WZtMgIaL8WtCw=;
 b=R4pCSn8HUf8cBvQoCrCtwHeB7QVVeJz7mlrMzoFQ6lMw4vfUXfOMPjFJxtvt5lsT257vdE
 ua41yDJSS78Ma7DMiS/4LpdNXo2RJo2D3dog1xZPQEL3xjmbwa1KEboVl4jvejduwkjMca
 +djoCgUUHYKUcp+k2pf83fvfzUBnxz8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-d7kI1jEzN9-TALkyBx1fZQ-1; Wed, 10 Mar 2021 13:31:48 -0500
X-MC-Unique: d7kI1jEzN9-TALkyBx1fZQ-1
Received: by mail-ed1-f70.google.com with SMTP id o15so8832019edv.7
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 10:31:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVxutgLWbsHETCN5jy828gv0QTW9f6WZtMgIaL8WtCw=;
 b=puwwVVjrMasOKjamUXv4GCl/yGxcF1j7lHM6R3PQzX05FiD0YoVlnH/KwOvVywfCSN
 3T8R03ZVqCrYZHJLdruMvR19UGIdVZqO501DTPM5W1WeI/TMCSxEYoqy5ojdwFBMGWYQ
 lrNl5aTc66z1CAc0BFDTyTh46sXZBH8U8leg2zqjWUnFeVwY1XlI6hDMVNJKycK8neht
 iPBxsGcx91I0/wDC1G1Ac/WE//NqrG1zQacP9QJ2mysVc4gsBApfW6TEMgNAmv5hHDuO
 /Wtm/uI23woNZAiQ03Q5ZkoPa0nWRPAnCuI6kD+xHGi4L/VTk5G8Vzy/f+8uwN3jQFoU
 E+Ww==
X-Gm-Message-State: AOAM530UG8fv5oqK3vStC2g560aHiuvN8SNktri3rxA2OCMIi53YZ8uc
 ZJQxynFlOhbokjH1q4cI1KB4Zt86AXG5yii6FutTWC+N4HoAas/r2OD08lgABkZw/6/Xn8Lhs3H
 oMj49SMZ6V8tnBJfaS4GrWB3bqTA64t2BvG+PkqIMkcGRDW9f8tlPivv45ftGQyyz
X-Received: by 2002:a50:f38f:: with SMTP id g15mr4777484edm.262.1615401106511; 
 Wed, 10 Mar 2021 10:31:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFTm8bvR5JbHuRlKvusWoKijCjYjWBuuzyu4Um+n/Ft5PMrFRPw690bsI3d6ebIsc3Q/oK7A==
X-Received: by 2002:a50:f38f:: with SMTP id g15mr4777461edm.262.1615401106376; 
 Wed, 10 Mar 2021 10:31:46 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l1sm46800edt.59.2021.03.10.10.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 10:31:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/7] net/eth: Check size earlier in
 _eth_get_rss_ex_dst_addr()
Date: Wed, 10 Mar 2021 19:31:20 +0100
Message-Id: <20210310183123.1212612-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310183123.1212612-1-philmd@redhat.com>
References: <20210310183123.1212612-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index ed047b5760b..492359afbbb 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -406,16 +406,14 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
                         struct in6_address *dst_addr)
 {
     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
+    size_t input_size = iov_size(pkt, pkt_frags);
+    size_t bytes_read;
+
+    if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
+        return false;
+    }
 
     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
-
-        size_t input_size = iov_size(pkt, pkt_frags);
-        size_t bytes_read;
-
-        if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
-            return false;
-        }
-
         bytes_read = iov_to_buf(pkt, pkt_frags,
                                 ext_hdr_offset + sizeof(*rthdr),
                                 dst_addr, sizeof(*dst_addr));
-- 
2.26.2


