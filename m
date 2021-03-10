Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C1A3346E6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:36:02 +0100 (CET)
Received: from localhost ([::1]:60906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3gf-0000Gw-6n
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cT-0005I8-KG
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cO-00035w-Gu
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615401095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ipgg6mN4Nj5/k/GECTeOGbUIwyHhVgdcMcgTAKQ9hjM=;
 b=Kj2ex+ztUNl+a9kcBP7Ks0ThNuQ1v1lGg2UUj2/eNuk82esT6fRqEYG0t7Y1sIV4ElDPQA
 1HdZdu/Qkn6s2ZuFY4+vrPEPEbeMke2yNYQldfmIQcB9hqNPJ6anaJ39UICwDJ2xgG8ONW
 ckc9Mm5X/csEIXA31TJYRIxDHkJrrno=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-Wr6bThxRPC6vPV6D9YxLUA-1; Wed, 10 Mar 2021 13:31:34 -0500
X-MC-Unique: Wr6bThxRPC6vPV6D9YxLUA-1
Received: by mail-ed1-f71.google.com with SMTP id w18so6014211edu.5
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 10:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ipgg6mN4Nj5/k/GECTeOGbUIwyHhVgdcMcgTAKQ9hjM=;
 b=ijmHr+pRtdoFZGV1jVW1LSSMaUvtCPLlHGaIag+Be7ataacRoJf/eZ7tGut12unPGW
 AXJqAJplI40EES7Xyu6gvecllLpHUTx74fdMLmUqzpeP1ATamn+mH39mSEGw7iYYZiNu
 SslHN5iIPkQwBNrK8yueFdjdTTOPZ2PXwIbS2e5Z4FTsJ/OPv2Y56Aod2WskUGOKrCQc
 GstrNjSaA1Q6lhz35O+KwesuEspc85fSYuyhOzNGI0SkM6wxwu2MwCKn+cWSxmjATyOr
 MLyS5e2cUXIoCvPyIPX6aDYP9LyIrhig2u4nkPTtxtSNYmSD6UBZLdmuwu+6Rde0IrMB
 78lw==
X-Gm-Message-State: AOAM5318SrrHFLgnNA2rnK6GqD7elaG09qRcrOC0sby3GMAZnDDhRL6R
 u4N9Sx0EXA6zPo9qBzlm2/g0F0hSK+bJqIOMlUkMvJ3UvFOH2e1Ep8ediV7+TlPgSgFSThq7RI5
 ACflHPe4En7H3Gy11xzQ8Q/v6FB2yKzCXJHNPQSASPcpXEzK69wl3VCzingBMXMJv
X-Received: by 2002:a17:906:82c5:: with SMTP id
 a5mr5236354ejy.232.1615401091584; 
 Wed, 10 Mar 2021 10:31:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZori+yBg4baXM9CgHd+nY+QgzxVd74b302zxJ8PmITHPDL2a80GeRY9tCjeTM/QUNhkfHcw==
X-Received: by 2002:a17:906:82c5:: with SMTP id
 a5mr5236328ejy.232.1615401091321; 
 Wed, 10 Mar 2021 10:31:31 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id br13sm129461ejb.87.2021.03.10.10.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 10:31:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/7] net/eth: Use correct in6_address offset in
 _eth_get_rss_ex_dst_addr()
Date: Wed, 10 Mar 2021 19:31:17 +0100
Message-Id: <20210310183123.1212612-2-philmd@redhat.com>
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
 qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The in6_address comes after the ip6_ext_hdr_routing header,
not after the ip6_ext_hdr one. Fix the offset.

Cc: qemu-stable@nongnu.org
Reported-by: Stefano Garzarella <sgarzare@redhat.com>
Fixes: eb700029c78 ("net_pkt: Extend packet abstraction as required by e1000e functionality")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/eth.c b/net/eth.c
index 1e0821c5f81..ef1b5136f1c 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -419,7 +419,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
         }
 
         bytes_read = iov_to_buf(pkt, pkt_frags,
-                                rthdr_offset + sizeof(*ext_hdr),
+                                rthdr_offset + sizeof(*rthdr),
                                 dst_addr, sizeof(*dst_addr));
 
         return bytes_read == sizeof(*dst_addr);
-- 
2.26.2


