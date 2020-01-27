Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201D214A34E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 12:55:10 +0100 (CET)
Received: from localhost ([::1]:43714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw2yy-0007O3-Qy
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 06:55:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58081)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuri.benditovich@daynix.com>) id 1iw2y8-0006b9-1m
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 06:54:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuri.benditovich@daynix.com>) id 1iw2y7-0007Cj-1z
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 06:54:15 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45943)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuri.benditovich@daynix.com>)
 id 1iw2y6-0007Bl-Sh
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 06:54:15 -0500
Received: by mail-wr1-x444.google.com with SMTP id j42so10862000wrj.12
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 03:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hrg78cM2Pxuz4BY13q2lvV7wSLDnADGJPvhjuphhmhg=;
 b=p1+c2OgUsNsasNaazLnqw4fY55dcQqbg5FZw0QB9aYmJ6/7cfoE7oaLzwSEOP/MZRr
 GeBmtJj7A6g5BGaKVxAY5yvqA5XKNDq4iCfoOsvnZVyVQV53oHQvQVI0tsdb+BQ17wpy
 fi5CXbdpNWa1zQIsqwUpgNpnKeMBKWMBG0Ea4Y8Hmgx25Zg6tneWJutfEWmwxAd/o42u
 qMnmV0lm4f0kI7ocB1OcyYwvprCp7jstz0LBGnaCqyyUDDdQLt81Fcv6msI+Cf3mHO87
 ozYpg9JkIc/QJRJALTih88f0Pmf31d8BgTQO0dibh+o5lzTpPQzVtEIKeKFQQwjqnMLC
 7eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hrg78cM2Pxuz4BY13q2lvV7wSLDnADGJPvhjuphhmhg=;
 b=CN52c/SFhvR/SBS82WAnZaIafF0MAP3CVZiEkwj7KZ8mZoZpZx/eDENmHNTfdpV/kT
 FvK1xxEryUfGzJVMhl4dB8jhwe6Nx9rNA/6qgB/JybDDT5YPF+qVdU2x54/pNtKi+OsO
 aNOIjSfP0p1KCX1sUX88IFCijAdEgFqei1op/rp5yHhyYc+NlgaBWI/SBCpCUPA8jZsR
 yzdWFOyDYN6PHPsFQlt27ccEmebanoyekvpKvRG/WitRJmL7QJ5Y4DL6/XpLyRg//EyC
 O/T03uVp6evtDVKkxssVXaEff0NHuQ4lHI5pM3cZYnmGlasUn8KswfgrvSTqGEsK+W1T
 PXsg==
X-Gm-Message-State: APjAAAXIi/mF1yZVdfxc5XWX7gKpM5iEa1+EQE1y37mxCmgPVoef8EmG
 k2M2CJWxYS7fIKHTiL7MjPdYNw==
X-Google-Smtp-Source: APXvYqy2equpqIn23mhrK08z16OdvM5RWLuUOOaVjXi0jTOzzYp8uN6d7ti4j/qH32Gf6nSnj4hrcw==
X-Received: by 2002:a5d:4a8c:: with SMTP id o12mr20585174wrq.43.1580126053940; 
 Mon, 27 Jan 2020 03:54:13 -0800 (PST)
Received: from f2.redhat.com (bzq-79-177-42-131.red.bezeqint.net.
 [79.177.42.131])
 by smtp.gmail.com with ESMTPSA id s16sm20866490wrn.78.2020.01.27.03.54.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jan 2020 03:54:13 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: dmitry.fleytman@gmail.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] NetRxPkt: fix hash calculation of IPV6 TCP
Date: Mon, 27 Jan 2020 13:54:05 +0200
Message-Id: <20200127115405.13459-2-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127115405.13459-1-yuri.benditovich@daynix.com>
References: <20200127115405.13459-1-yuri.benditovich@daynix.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When requested to calculate the hash for TCPV6 packet,
ignore overrides of source and destination addresses
in in extension headers.
Use these overrides when new hash type NetPktRssIpV6TcpEx
requested.
Use this type in e1000e hash calculation for IPv6 TCP, which
should take in account overrides of the addresses.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/net/e1000e_core.c | 2 +-
 hw/net/net_rx_pkt.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 9b76f82db5..5b05c8ea8a 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -582,7 +582,7 @@ e1000e_rss_calc_hash(E1000ECore *core,
         type = NetPktRssIpV4Tcp;
         break;
     case E1000_MRQ_RSS_TYPE_IPV6TCP:
-        type = NetPktRssIpV6Tcp;
+        type = NetPktRssIpV6TcpEx;
         break;
     case E1000_MRQ_RSS_TYPE_IPV6:
         type = NetPktRssIpV6;
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index b2a06bd27d..1e1c504e42 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -348,7 +348,7 @@ net_rx_pkt_calc_rss_hash(struct NetRxPkt *pkt,
         assert(pkt->isip6);
         assert(pkt->istcp);
         trace_net_rx_pkt_rss_ip6_tcp();
-        _net_rx_rss_prepare_ip6(&rss_input[0], pkt, true, &rss_length);
+        _net_rx_rss_prepare_ip6(&rss_input[0], pkt, false, &rss_length);
         _net_rx_rss_prepare_tcp(&rss_input[0], pkt, &rss_length);
         break;
     case NetPktRssIpV6:
-- 
2.17.1


