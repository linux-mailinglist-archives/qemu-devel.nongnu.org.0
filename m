Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5833342D6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:16:46 +0100 (CET)
Received: from localhost ([::1]:54828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Vt-0001ML-6K
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1HZ-0005Gt-6M
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:01:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1HT-0003Q2-Tw
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZa/iUsT9VQagkte3HBQwGL7dr2S/uC8iYuWuLSPUy0=;
 b=IyWuK8XekNbG3U8s9zMDSQONnNYNegsWsa4ZxkNZcbrKeQEtpkzbisa1TBbz5nM+/oY1sP
 j4QrrUai63vbNb4jgM8KJVLKHAg2d4gsaCXL/nOq35U07L+FloyMCREqfKLELucb8Rq2/x
 A85jbYwGVIRdMkase/F1FNSJyjGCiUA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-q52Aa1yIMkuPRqXm34-Pmw-1; Wed, 10 Mar 2021 11:01:45 -0500
X-MC-Unique: q52Aa1yIMkuPRqXm34-Pmw-1
Received: by mail-ed1-f71.google.com with SMTP id o24so8574350edt.15
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZa/iUsT9VQagkte3HBQwGL7dr2S/uC8iYuWuLSPUy0=;
 b=OSR0qGzrGBdN8+FrbXgHUG/6+RbST1tanXLcpmhn/R2VgxDd/WRKKZTISzqgWHAFa/
 rSWfqbjy7vsaE8c6Y6LKlKuEFN3XKjs7yQa4FrhzUyhG2wWekmW3TQGtVJlwxGBYoKAm
 W1+6Vfgk8/gjjXDLle+U1Oaz1e42a43X4IDDH1DxaNazEfAYzUWgyyvC/ItjGYefWdL9
 sK7NdUogl56tyeCQNapBZ5j8j2bZMGmukp2urmw/ArDq50NqzTL6fq/quafh3hWDXn+m
 U3vX/pl7Wq8WLba8WpPTygAYmKGkh0aQIrdw0IWl1uOE1dhIdFJEeWu4j2VCl1XnSQ+L
 cJ7w==
X-Gm-Message-State: AOAM5301uAaNNxGHxi2dbNzt5jACwlAJl4wpVqqB5NoZp8fYvaRfz0BV
 gC/1vSf0ludqPmpH4VoPx6eviIxWZNpyrIBWrNmyVPlEL0eh7LDcuwnscO7ARn3XZhsGsqik++O
 FlwK8D9WXpiAJLydWSI0/T58VbBhrYKzPZVQfqZMXo6IJ8mu1zkAZl7nJq0z6kBSx
X-Received: by 2002:a05:6402:b2d:: with SMTP id
 bo13mr4080113edb.120.1615392103902; 
 Wed, 10 Mar 2021 08:01:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzR3y5hYmJwuPJml+zR2w9ggexfPD05svapJOST+b9+HHSuI3COa2QZG5klY80vcuD9Vlvjlg==
X-Received: by 2002:a05:6402:b2d:: with SMTP id
 bo13mr4080033edb.120.1615392103179; 
 Wed, 10 Mar 2021 08:01:43 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k22sm10655534edv.33.2021.03.10.08.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:01:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/7] net/eth: Simplify _eth_get_rss_ex_dst_addr()
Date: Wed, 10 Mar 2021 17:01:29 +0100
Message-Id: <20210310160135.1148272-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310160135.1148272-1-philmd@redhat.com>
References: <20210310160135.1148272-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
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
index 1e0821c5f81..7d4dd48c1ff 100644
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


