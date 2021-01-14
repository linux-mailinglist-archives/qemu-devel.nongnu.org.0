Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943642F6382
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:55:34 +0100 (CET)
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0429-0005Bv-MI
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l03xf-0000Ih-Qq
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:50:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l03xd-00046V-1q
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610635852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UeFDUXexOVQ8w+BQTvVSUnpjH22/s6ALR7P0G6tmBzI=;
 b=Ri1RVUFcby6V/RSydvVS3yOf03uKpKwdaTMAoB1V75A4ohrTEBt/mBbUWfjMk/MAHaMY8Q
 NV3EubetARhrNH7S2EkkrQ7FrnOzaorhnrANimPE6i8G7vEWuv8AFZrCKkPyhfiqfXIAsK
 Q5gfXnGIC8Bn0LYJDs+qxR0yNb8GyW4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-zMz9UAbrPm-_N6bOk278kQ-1; Thu, 14 Jan 2021 09:50:50 -0500
X-MC-Unique: zMz9UAbrPm-_N6bOk278kQ-1
Received: by mail-wr1-f70.google.com with SMTP id v7so2683581wra.3
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UeFDUXexOVQ8w+BQTvVSUnpjH22/s6ALR7P0G6tmBzI=;
 b=Qn6c74EjmjEeXyEm3IrNxgqxlzaa8c69rOa9d4AJusXEETIR57cM2zUySgR+nQbT1g
 Oj6DdTgUd4vWKGgvScQJc45VCyZY7IIj4wwOxUQb70P4sK81ukpVBEak1ngJJ9FWrahU
 51ViK6/22fkbFBngOYbx299UnhwEIoIO7JhlOLMmJRVF2taktumrs9nt//Ufjhqewq2f
 GY3VMVctVt7OoiZ1/8frQ0WqOBm7anHUkSu6IIE36eJf9VW4+4v0GtezaxiWvX8MW6N0
 wn0jM50u0TFa/LIzHvzgeW7kLzX/W5bzROcnptsJ+dW+6S2Y+KFtRaX1HjzpcJeVHnrd
 bv1A==
X-Gm-Message-State: AOAM532M4861LxUH0qZLVoffNyH52EY/6AhIAMesoBwudswLw1in9q82
 25Ioadf2li7y63zuWEvsrY49ukrfbwKOYJd2kJhdYpAQZZGqPi0YHn2gI2YsN5L1qFgoeLLxpas
 dUnFwW2ByLUZWV8jyzlVnbKPK5rvJpjBEed7LKrmcqW1t8+haT/graFxfCs3DEP1U
X-Received: by 2002:a5d:4987:: with SMTP id r7mr8451068wrq.352.1610635848577; 
 Thu, 14 Jan 2021 06:50:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmWa9x4/fLVtEl4B1CA0xkp5ae/xAG8qoD/haDpemkNXH2z14WSPXzdiimwpXw71Vt3zasMw==
X-Received: by 2002:a5d:4987:: with SMTP id r7mr8451030wrq.352.1610635848242; 
 Thu, 14 Jan 2021 06:50:48 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g184sm9107175wma.16.2021.01.14.06.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:50:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] net/eth: Simplify _eth_get_rss_ex_dst_addr()
Date: Thu, 14 Jan 2021 15:50:40 +0100
Message-Id: <20210114145041.2865440-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114145041.2865440-1-philmd@redhat.com>
References: <20210114145041.2865440-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The length field is already contained in the ip6_ext_hdr structure.
Check it direcly in eth_parse_ipv6_hdr() before calling
_eth_get_rss_ex_dst_addr(), which gets a bit simplified.

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


