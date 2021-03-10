Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3978F3346E0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:34:50 +0100 (CET)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3fV-0006w2-8n
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cU-0005JT-UK
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cT-00036g-DN
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615401099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPZTkTxCUwe1BzyMkjpxJZKSLxu9sd2VzFrAuF5J8Hk=;
 b=LhfcnJRf3ERH3iGsGt/efDpW4T6uu2AlhGHz1ft5MtVsh6GFCnHMz+kr4C1WPdCeUAp6Zy
 LjT1doe8YOkJfMFwdvhYHJkwo4R0tqeywWmU2WwzdUJTuV0fhXgbi4P/85lAMy2JT0LJwY
 W940yE6w7nyHC4YxsbM4yaP1qtzYA8E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-yQ1nxziLOcaD-_XXTbizhQ-1; Wed, 10 Mar 2021 13:31:37 -0500
X-MC-Unique: yQ1nxziLOcaD-_XXTbizhQ-1
Received: by mail-ed1-f72.google.com with SMTP id i6so8863070edq.12
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 10:31:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPZTkTxCUwe1BzyMkjpxJZKSLxu9sd2VzFrAuF5J8Hk=;
 b=nmVg8aL69ydG6PgKbdliWTl43V+xcR3jka/R7PbUL9N1P6tPx5A4MFXEI4X/UZyvaV
 0Dip6+5BXb3qUOFVFdwTTstJd044l7PrEW0hja7HEbdEOs49i13ky3f1a+SobMvrxPeY
 NmwkSt5cZUQnZwrHnpCkoQPKlA6X3lj3e87S3xAbUu9AC4EwCv282KUSEpuWxoS+cEdE
 Br+OBPWXOF0zumEf0n8CAe6QPYgAuS+C4eYWBoeS1BifVjJ6t+jfa9mcIbYol4/30Jyh
 2plnp+XMstcl0YeAlV0YIgxvd6GG1vFoE8Kcklay0fh/zmz2ZRsD/aKo3dQw99GFoZTz
 1cew==
X-Gm-Message-State: AOAM531Pi2csIP7c/rUm0A21PlTHwJvW9Y2uI2j/6ILe0IL6jnE/J85d
 UOz7w2GoWpqw29cnancVz3Z8/2pgkug1UAKI8mm8HSUuTSbXKkPBfl9T4IEBx5QrbMqKSfndKpv
 Ee+yXAH2P5tLFkDfbbR+DawWQG1AQtTf3JMbXg7u+3CVy/jbyy0kUvD5/eZD3Jjmj
X-Received: by 2002:a05:6402:68e:: with SMTP id
 f14mr4793544edy.169.1615401096494; 
 Wed, 10 Mar 2021 10:31:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR3FeBW8th+e4GIxVjgta8Op0WRdhJ2+Xm6cB/ysQbGPT4M7Ad7FcvBiyafE4uKADUKHXDBg==
X-Received: by 2002:a05:6402:68e:: with SMTP id
 f14mr4793522edy.169.1615401096357; 
 Wed, 10 Mar 2021 10:31:36 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x4sm46869edd.58.2021.03.10.10.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 10:31:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/7] net/eth: Simplify _eth_get_rss_ex_dst_addr()
Date: Wed, 10 Mar 2021 19:31:18 +0100
Message-Id: <20210310183123.1212612-3-philmd@redhat.com>
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

The length field is already contained in the ip6_ext_hdr structure.
Check it direcly in eth_parse_ipv6_hdr() before calling
_eth_get_rss_ex_dst_addr(), which gets a bit simplified.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index ef1b5136f1c..b9ceb30a194 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -407,9 +407,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
 {
     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
 
-    if ((rthdr->rtype == 2) &&
-        (rthdr->len == sizeof(struct in6_address) / 8) &&
-        (rthdr->segleft == 1)) {
+    if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
 
         size_t input_size = iov_size(pkt, pkt_frags);
         size_t bytes_read;
@@ -528,10 +526,12 @@ bool eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
         }
 
         if (curr_ext_hdr_type == IP6_ROUTING) {
-            info->rss_ex_dst_valid =
-                _eth_get_rss_ex_dst_addr(pkt, pkt_frags,
-                                         ip6hdr_off + info->full_hdr_len,
-                                         &ext_hdr, &info->rss_ex_dst);
+            if (ext_hdr.ip6r_len == sizeof(struct in6_address) / 8) {
+                info->rss_ex_dst_valid =
+                    _eth_get_rss_ex_dst_addr(pkt, pkt_frags,
+                                             ip6hdr_off + info->full_hdr_len,
+                                             &ext_hdr, &info->rss_ex_dst);
+            }
         } else if (curr_ext_hdr_type == IP6_DESTINATON) {
             info->rss_ex_src_valid =
                 _eth_get_rss_ex_src_addr(pkt, pkt_frags,
-- 
2.26.2


