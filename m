Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF233ACE6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 08:59:50 +0100 (CET)
Received: from localhost ([::1]:38208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLi8j-0001Wo-Al
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 03:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6r-0008Gj-60
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:53 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6p-0004MN-G9
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:52 -0400
Received: by mail-pl1-x62b.google.com with SMTP id s7so14881686plg.5
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y9+MuFpamjdnFK8s8pt6prXDFanBeSufK+kJJFQbChg=;
 b=Bme91Km8BXw9+OoB6VbonemC4ddaoroZE4OEFcrAmFo2cdsZxWTZ5GWmgvm9heQa4j
 MBjgsu/wbZMqVHP9KGiI/lAjsAYmvxMtip61UZcK6KgX1kyJrfsODCduB6p4QjECrTSU
 8Gqjrt3gHlHR1IGLt2Hltv1yVeTXSZx1BPm6ts64K8FmacG5Uguhi38qpq9sMj4eaCEe
 KjL9f6VnNKD6MvAkubFYu7VFH1pEi5x7N4lmmFyJPQdB8JZVAmHuvsYXk8rRSdlnP5yE
 d7kveddFALl02ZIdKwzhJp1/XtV/fqxaIY4mYmLn3O6dlFL+PrYNdUETHg0oDUmx49v1
 b/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y9+MuFpamjdnFK8s8pt6prXDFanBeSufK+kJJFQbChg=;
 b=lxRYNNJA3YHV86aHaAKgOKOiohhi9XJ1cY4a1oqxXtbZ+ajpW/0NH9I9NDRVFu55E5
 6YVpKJtjLiSecWYPXVgTybcUehj845YEdd6aE5ikP1ED6umTXKR095Co1Rp9pC+Ermwo
 XCfjMrd4p88Sx9wH+Wf/MuZ+CugUgBQMPiNKFrt+w/kV6Kl4FlBpb3TC3dhqMKMlJA6q
 c3H8cjNR4mmRQHoBy54qzVHKiTvbdl0XIV7+YAzMNaaQ2JbUG5ToiExOHzWPZr6PronC
 v7cigb8Zymu8rh5vT3dJ+FBHeoCuT/a9rCZT5EHfw9rfAFIN8RFB7nUCwHMWUZBKrruC
 v/Vg==
X-Gm-Message-State: AOAM533wypN0bfsoDI31ozUjX/O/O1AFrNd4HhDvM8UsbTAkD6cEk7Gz
 +e/flrnJRs328v/j5caJOSG6rfQq0LE=
X-Google-Smtp-Source: ABdhPJyzu2qI68W17cBfN/KjVhX9H+EZu/Oa5m2aSSemKuIuvyOokDyWRvZTqswO68HQPSSsPKzrHw==
X-Received: by 2002:a17:90a:bf04:: with SMTP id
 c4mr11403590pjs.170.1615795070284; 
 Mon, 15 Mar 2021 00:57:50 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:49 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 09/13] hw/net: ne2000: Remove the logic of padding short
 frames in the receive path
Date: Mon, 15 Mar 2021 15:57:14 +0800
Message-Id: <20210315075718.5402-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62b.google.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/ne2000.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 6c17ee1ae2..b0a120ece6 100644
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
2.25.1


