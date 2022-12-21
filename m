Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C470A653666
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:33:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83t2-0002d6-Nf; Wed, 21 Dec 2022 13:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JFGjYwoKCncngjibadZgYbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--slongfield.bounces.google.com>)
 id 1p83sy-0002cW-NB
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:32:14 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JFGjYwoKCncngjibadZgYbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--slongfield.bounces.google.com>)
 id 1p83st-0001CZ-0n
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:32:09 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 s6-20020a259006000000b00706c8bfd130so18516747ybl.11
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7B07ofpcA7tRmi2XyukXiykSOBgmFs9jsO808EFWmoc=;
 b=HffvBwOzn9pt2EFwA3DAnXUC0M+MJA9E7lUI6pFdhnkk01HmcWxFkZwhiJcBiOWF4b
 zQWt++wQW7yiVfKESw+MfCbGaqMtV+yFmdIkhKFo76Iazoq2FQipKjv/BsZKrnoehTJl
 oXJTigD0vjMbGi8qvLHgY5jLTrIhflGVkBiAvebsgZ+GLLOpi0njif3IF5/Phy86DIAW
 RctxcTNGepROHrx1+w/fCVrEYgt6fdW0OdO7GTDXaVnmrDya1/08OjOlZ2+ch8aHp2hn
 rh2BseiLtWBNk7cdls1+1r7BwWskMs5D4VASZD51iNrjbrDP6dsNyZ2ixb0jOFtTSuiF
 nXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7B07ofpcA7tRmi2XyukXiykSOBgmFs9jsO808EFWmoc=;
 b=mT9YptqCBuAUSODlQXFV2YBCmPqff1UIp5e67hCrgBtvrC6CzcsPo957bSQKqpIInS
 OXdn800GGE4i90LgNES1ooP5nLAsKPGPMDs3twmJeOMNW+0BOUN2HlEXjSgBRTImGAos
 XtvL2ynWMEwobnRmhPeDbQNLliYeIUo9TowvwBzhWYtk0wOcfyDl949Mo7ZRd6RWQdum
 R8HGnS4v6aEUSO7Lo9IK3OPjNCvhrC+dxNb2jKWno12GxeScgrtQH1wayw16mDnv41dj
 kCdD006gCvmMV4yQ9JuiC5pFXrhaWGzMYOhDcgtjR71w1iHfOdX3DzyxNULsu8O2u8rR
 x1WA==
X-Gm-Message-State: AFqh2kq+4BIsMJ2f57tbL2MfTn4aeZ7BP1FD9VokQR9oubzTT+2xaeIt
 XTlIVrlN6E6Xe9FeWBocnYp116fpE9fDq5oK
X-Google-Smtp-Source: AMrXdXvB3ALFuRD1ud1l4IUh9Z/KFIjhACSaI9L0f/9MAs7YZzhb7VgQYSPzX4wyt4hIDLltHVfKzErDVJaWZUY2
X-Received: from vonneumann.svl.corp.google.com
 ([2620:15c:2a3:201:82df:1739:d438:9992])
 (user=slongfield job=sendgmr) by 2002:a25:d88e:0:b0:701:a966:d3f9 with SMTP
 id p136-20020a25d88e000000b00701a966d3f9mr272924ybg.262.1671647524759; Wed,
 21 Dec 2022 10:32:04 -0800 (PST)
Date: Wed, 21 Dec 2022 10:32:02 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221221183202.3788132-1-slongfield@google.com>
Subject: [PATCH] hw/net: Fix read of uninitialized memory in imx_fec.
From: Stephen Longfield <slongfield@google.com>
To: clg@kaod.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 wuhaotsh@google.com, Stephen Longfield <slongfield@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3JFGjYwoKCncngjibadZgYbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--slongfield.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Size is used at lines 1088/1188 for the loop, which reads the last 4
bytes from the crc_ptr so it does need to get increased, however it
shouldn't be increased before the buffer is passed to CRC computation,
or the crc32 function will access uninitialized memory.

This was pointed out to me by clg@kaod.org during the code review of
a similar patch to hw/net/ftgmac100.c

Change-Id: Ib0464303b191af1e28abeb2f5105eb25aadb5e9b
Signed-off-by: Stephen Longfield <slongfield@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/net/imx_fec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 8c11b237de..c862d96593 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1068,9 +1068,9 @@ static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf,
         return 0;
     }

-    /* 4 bytes for the CRC.  */
-    size += 4;
     crc = cpu_to_be32(crc32(~0, buf, size));
+    /* Increase size by 4, loop below reads the last 4 bytes from crc_ptr. */
+    size += 4;
     crc_ptr = (uint8_t *) &crc;

     /* Huge frames are truncated.  */
@@ -1164,9 +1164,9 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
         return 0;
     }

-    /* 4 bytes for the CRC.  */
-    size += 4;
     crc = cpu_to_be32(crc32(~0, buf, size));
+    /* Increase size by 4, loop below reads the last 4 bytes from crc_ptr. */
+    size += 4;
     crc_ptr = (uint8_t *) &crc;

     if (shift16) {
--
2.39.0.314.g84b9a713c41-goog


