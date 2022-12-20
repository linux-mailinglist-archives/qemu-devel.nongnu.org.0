Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464EA652932
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 23:53:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7lTK-0004zj-E1; Tue, 20 Dec 2022 17:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <37DOiYwoKCgEtmpohgjfmehpphmf.dpnrfnv-efwfmopohov.psh@flex--slongfield.bounces.google.com>)
 id 1p7ktE-0005Vb-OZ
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 17:15:13 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <37DOiYwoKCgEtmpohgjfmehpphmf.dpnrfnv-efwfmopohov.psh@flex--slongfield.bounces.google.com>)
 id 1p7ktC-0007yJ-Sv
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 17:15:12 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-45c1b233dd7so20052907b3.20
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 14:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PGujqd1inTe25q9tw7SSNQK8UpTxpqpb11C+uNSu9rY=;
 b=XpzPaPOjB6bs0JqtXO1nPxm5cQjy+RBAGRC3sN8dy8yz9Ouwl2+LfWl8naTD0a2Q5X
 jsklX8vFpIzQRwMOQA9nmH9U4bLNfsWYIBnXX2j4WZh92LfxwnThIaeF88PmwaRghTwq
 J/Y6qw7dy5nKGEeJ8PZC3cJHrXFE+FEkvHXA3F2tWvWhlzTNCAqIwsyA1ETXvvshYEz1
 n9Hgunz1iPZQ/HP0sBdZsRGAB+l94ifSGbvbk2HNLQVNRIPzUQLQxqc8wkln5cGlHHpF
 OqjlkXiErkev4nF2G5zHyNzR54coY3lzR77Moc27xTm3WYX/tJ2N0DwNvnmLuPust8iv
 U1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PGujqd1inTe25q9tw7SSNQK8UpTxpqpb11C+uNSu9rY=;
 b=rKxMEZ26Bd7Ckn8/SnSAhqPgaKnPiSOSjfTeLsvuEvFDdtbAX3upHTWOwu2mK3S0Kk
 DEtY2raZH5GHtM7T1jRVD8XWB/mBU1T20Sn/MVbNjRsvzx+t5eZ6vvdK08lavy1QLMn3
 FTyDi5FEnO8ZDrL0wtVSSwptAvzQ3gCzytJvaV4GjymS7AcFxNN5bFLEs9bduuuU9ZV+
 SeowM9KIzJ967OH825Aadw5+z4DVs1zaVcMXM/kqw6dax7dXGdd41mqBC/Z8pgtVnSjC
 xjtqO64zh9c9Grc/V6RbdXUUmVGOYAJcKSj5iRHDgqGShaNIkUmfcjwGWvWOXyWXkvSi
 J4hQ==
X-Gm-Message-State: AFqh2koq1dHIkWDtmASMQerMRNiJMZ8bEv8q5OzdcoFpqAketOHzVENB
 SG+CpczbVpjd9QQ3oatOR+SaIO/QB+VxtiTm
X-Google-Smtp-Source: AMrXdXsJTzQ8IRYfOEmxTj5Wpj5X9wGTCUXJjybhSMCchm6p5FOC1m/zGdmKba7Pfp2oFTa7RrbkczsMHdfRvNMU
X-Received: from vonneumann.svl.corp.google.com
 ([2620:15c:2a3:201:dee4:74b1:354e:6bfc])
 (user=slongfield job=sendgmr) by 2002:a0d:d243:0:b0:3df:1fd0:9dcf with SMTP
 id u64-20020a0dd243000000b003df1fd09dcfmr1286164ywd.447.1671574508665; Tue,
 20 Dec 2022 14:15:08 -0800 (PST)
Date: Tue, 20 Dec 2022 14:14:37 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221220221437.3303721-1-slongfield@google.com>
Subject: [PATCH] hw/net: Fix read of uninitialized memory in ftgmac100
From: Stephen Longfield <slongfield@google.com>
To: clg@kaod.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, andrew@aj.id.au, 
 joel@jms.id.au, venture@google.com, wuhaotsh@google.com, 
 Stephen Longfield <slongfield@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=37DOiYwoKCgEtmpohgjfmehpphmf.dpnrfnv-efwfmopohov.psh@flex--slongfield.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 20 Dec 2022 17:52:18 -0500
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

With the `size += 4` before the call to `crc32`, the CRC calculation
would overrun the buffer. Size is used in the while loop starting on
line 1009 to determine how much data to write back, with the last
four bytes coming from `crc_ptr`, so do need to increase it, but should
do this after the computation.

I'm unsure why this use of uninitialized memory in the CRC doesn't
result in CRC errors, but it seems clear to me that it should not be
included in the calculation.

Signed-off-by: Stephen Longfield <slongfield@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/net/ftgmac100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 83ef0a783e..d3bf14be53 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -980,9 +980,9 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
         return size;
     }

-    /* 4 bytes for the CRC.  */
-    size += 4;
     crc = cpu_to_be32(crc32(~0, buf, size));
+    /* Increase size by 4, loop below reads the last 4 bytes from crc_ptr. */
+    size += 4;
     crc_ptr = (uint8_t *) &crc;

     /* Huge frames are truncated.  */
--
2.39.0.314.g84b9a713c41-goog


