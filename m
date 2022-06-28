Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA7E55BE80
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:49:52 +0200 (CEST)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o646h-0007b3-9g
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o634o-0001V3-4o
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:43:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o634b-0006vw-9T
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/uz+NIpqA1Ges9cF9Ryn/nd/sEhvnK9SiL8Zxw0pHR8=;
 b=D1CwfFNYiGNHuBT5BD+3YFWAQqZlN4nAfwXTCyhe7hSIbJ6mBCz93EMAtlDN+MzBANhwsY
 j+ZuRwCYevsTpTwwCy8XrNi4CmP5A8gJmvvhP7mvoNnSLbxZsLGlcnz35rU4mpl9c1Jyzo
 jWvPs6zkvpcCg3Y/bCclZHpgVWKhBes=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-Fqy_c0klPO2cO1LNusdC_Q-1; Tue, 28 Jun 2022 00:42:54 -0400
X-MC-Unique: Fqy_c0klPO2cO1LNusdC_Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 i184-20020a1c3bc1000000b003a026f48333so4559144wma.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/uz+NIpqA1Ges9cF9Ryn/nd/sEhvnK9SiL8Zxw0pHR8=;
 b=voyRLrBC3rv1xMODMlxzOHlx2VyF6e2f48JqoUDN6ECkPznT4i2tZ1X6R5Qg1qUff/
 x2bnEb0BjaesaR46F0sEGln93uPRDNyFIsQsSLCUIoYfnSpaPLL567cmz/OvDHdw0Wy/
 L8ob7JGtVTskZ9RYS02eBbCT9KOSbZqxcuc0XKoskSC8lcZdcZxE9uGUmgdhbzn1yCNt
 gxCwyrmxIH+IEf4XPgIXElUTZ+UtjV3uSRRHl4cyET+/TgiLPm7XXv66m2N4sMvNwTFO
 5nG2JCqonuNJstJ345oO1E1ZSCwK94/2FX6H9HLd1PMTTC9C7fhjuIUUnMjOFcmQ/Hu5
 E2gQ==
X-Gm-Message-State: AJIora8GWHgyD4uT5PtiFVil5Cfo1rPiyqrKHbfEmLwVGdqO2IJ7AFuZ
 af+4iu5v1VdpQy+41CiB48Aaugntft2hsq9IO+VOyoPDPUM/g9ytb7k4wl5TGnwMLG0cxBw6J88
 ynLgoke1Tw041zNxePXmr3iXTbuBAVM0pxMuar4uIePW4TlQhWsUh9OTy1Lfu
X-Received: by 2002:adf:e196:0:b0:219:f3c7:fd88 with SMTP id
 az22-20020adfe196000000b00219f3c7fd88mr15260279wrb.402.1656391373392; 
 Mon, 27 Jun 2022 21:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s9t74qCC63D4MQz7F7bLKdTudVwfl4ZQAxnNluqoGm1cMgfu84eyFFTK9aGlDjd5L566464A==
X-Received: by 2002:adf:e196:0:b0:219:f3c7:fd88 with SMTP id
 az22-20020adfe196000000b00219f3c7fd88mr15260262wrb.402.1656391373118; 
 Mon, 27 Jun 2022 21:42:53 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 o19-20020a1c7513000000b0039c18d3fe27sm14870702wmc.19.2022.06.27.21.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:42:52 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:42:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 08/12] libvhost-user: Fix VHOST_USER_ADD_MEM_REG reply
Message-ID: <20220628044201.217173-9-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

With REPLY_NEEDED, libvhost-user sends both the acutal result and an
additional ACK reply for VHOST_USER_ADD_MEM_REG. This is incorrect, the
spec mandates that it behave the same with and without REPLY_NEEDED
because it always sends a reply.

Fixes: ec94c8e621de96c50c2d381c8c9ec94f5beec7c1
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220627134500.94842-4-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index cfa1bcc334..ffed4729a3 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -779,15 +779,9 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
 
         /* Send the message back to qemu with the addresses filled in. */
         vmsg->fd_num = 0;
-        if (!vu_send_reply(dev, dev->sock, vmsg)) {
-            vu_panic(dev, "failed to respond to add-mem-region for postcopy");
-            return false;
-        }
-
         DPRINT("Successfully added new region in postcopy\n");
         dev->nregions++;
-        return false;
-
+        return true;
     } else {
         for (i = 0; i < dev->max_queues; i++) {
             if (dev->vq[i].vring.desc) {
-- 
MST


