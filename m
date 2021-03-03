Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F3132B62B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:28:10 +0100 (CET)
Received: from localhost ([::1]:54468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNnd-0003th-Pa
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhz-00055T-SS
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:19 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNhy-0001Fy-A0
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:19 -0500
Received: by mail-ej1-x634.google.com with SMTP id hs11so40801059ejc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AxfVTl/O/O7xm6Fzak9sqeNRKzbxNKHXeCTAnBNykLo=;
 b=m9FgBYjM0Tddk9H2igLIpVfwI9GQxkNqLsTzB1DrG4ruN1MejeAM940N8Wfw/cw/qV
 js4jUvm/1C8LzP7Tkaxl8+vCDxVAfbTnVOlPKUYxo54KYPDpAP3YvOTsTvty8h8BZF5R
 2n0Lc5wVkAKpaF6D+MR+KgZ6HMfalAs38lNAzpWGtWfnTjec8K/3Cr5mjnE3ncrFKeS7
 FO5mcTez1rrTiQ/MjRPqiE2YLDimF278RivrpRWZj9gRQHL+UnvXl+Es04qgJ2AnZgXh
 5Md11knD2fUTP6Rc1cXupnWl/FNXYomT8ZGIdQREo4v0FAUd802lrFMwuh+Jk0vJ6N7m
 tODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AxfVTl/O/O7xm6Fzak9sqeNRKzbxNKHXeCTAnBNykLo=;
 b=kqXojR8PM1v1ntHGzoJh7o/M/nyhY4xvDfZnASysW8XN86wVZuuiFYIWRrOD3nZ9CQ
 5WG3edvLXBSBRXPqkpj+YnWCMWdfYWlvXU+MbLVf4VjUcfLq39Uw9jxAChgDOnxfXyox
 Tgs4RjLT9xblU34raP0MZOUEoE2OtA+L0b+DBVFqg0iBvuGfFF0RD8oMlUMraulcmJ8S
 rrWUXi2TOgUs9HRHWUHdug7MezBOCFWEuJXKccVuQvvDQ9JNg2NP/NBf6VtqHLThwgwt
 Ml18uvkjP0Wp8XHGsc/i4oLkES2Uq32HKiIPsZVN227vttUone6xb20K5Owf7Q+OMD09
 MuMg==
X-Gm-Message-State: AOAM531MGhz7boZFiyOAduCWAYzvsgIBj+m4InSA/2kBhlMopRfknl4K
 nGRa+JPJE/8cEgj1mTVKcywo+Wm+rCw=
X-Google-Smtp-Source: ABdhPJxBAKIK2y1f5GMaFxAHnsvXlUiliua0e0fQlI0F3+sJ8kO2GN1pqW9mySlyMfE4sWa76KbQ5Q==
X-Received: by 2002:a17:906:4349:: with SMTP id
 z9mr25096924ejm.471.1614763337014; 
 Wed, 03 Mar 2021 01:22:17 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id i6sm16614865ejz.95.2021.03.03.01.22.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 01:22:16 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH v2 5/9] hw/net: ne2000: Remove the logic of padding short
 frames in the receive path
Date: Wed,  3 Mar 2021 17:21:42 +0800
Message-Id: <1614763306-18026-6-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
References: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/net/ne2000.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 6c17ee1..b0a120e 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -167,15 +167,12 @@ static int ne2000_buffer_full(NE2000State *s)
     return 0;
 }
 
-#define MIN_BUF_SIZE 60
-
 ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     NE2000State *s = qemu_get_nic_opaque(nc);
     size_t size = size_;
     uint8_t *p;
     unsigned int total_len, next, avail, len, index, mcast_idx;
-    uint8_t buf1[60];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -213,15 +210,6 @@ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
         }
     }
 
-
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     index = s->curpag << 8;
     if (index >= NE2000_PMEM_END) {
         index = s->start;
-- 
2.7.4


