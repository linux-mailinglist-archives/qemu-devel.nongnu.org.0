Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC9733AD1A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:12:28 +0100 (CET)
Received: from localhost ([::1]:41426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiKs-00080u-9U
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi70-0000Bv-1G
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:58:02 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6y-0004Se-Dp
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:58:01 -0400
Received: by mail-pf1-x42e.google.com with SMTP id c17so2457036pfv.12
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fU7lzk4cL2UJ9KA60ejfSNAzKPvIxCcO762dyv14Ezc=;
 b=MCypLDI6EGcZqMYRtVWQsQ0C7+b25VCIjdhikeYQRE+AedbSK2TS8jkQNE8CpR/dDN
 TCi7s6hn60+wXAJMwF1GKWBuRVOU0RylCXoD8dNP7gTq11YTXvfvvFEz8W49v06zBQ4X
 IciJhapWXBHsNY63/ro3/NWEV1H6k+mD646kV+1h9dSBHJvj/HNes4rwdRZJfFEdc/y7
 Ovomx3FHk22irqws81HpCpEZQ3gqUEfpXgI/uozaCPmSzQIBb59j2jUpDxKYRs+0ZE+0
 K1Xqr1ypfZL6qubjrrtcA8zSQGQWulTFC77JP6eA6oeL6OgtUgio5uPRxZ2MkH8k+NyN
 Waiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fU7lzk4cL2UJ9KA60ejfSNAzKPvIxCcO762dyv14Ezc=;
 b=P+0Nmq3vMoXtI0gFuBzcWnQUqBEdpNE+HxYsELn8ngmuboJEK8PAa1T8aNZLxg4/x/
 75GmzDczl6Lf1Jdl/jANsFjtCseG/YNSj0QfzLfTuMvJ/w4azwAeqOm1ZEfHwyjFwm4g
 sc+jWoh+SMv97HLQ59JP7PmluDLcszPqeO9B3fLSsr36TrypgjFMkE327tCbPUzerhmN
 uUE7TKY0dorcH9++49sx2WN1jHadOOrLXsR/tG63CcaoKgAyCA7WBdOcjkbcjr7Ictdz
 sGYUSBgl22MoB/eA7XVVIJIfAP/3N7CJDTtERocplNjqeUjErsP9pQWWGPEvqPMcJT3g
 4b+Q==
X-Gm-Message-State: AOAM532epBwngq8akqQR/Q8JvwpCWFMVSZKP3sugrzPz1RDyztKxoY/C
 rPRsErYf/5/jxIorNbF8axw=
X-Google-Smtp-Source: ABdhPJyUw8m37SY+VO2qHLq/yziuB0/w0QPCDPyK208BjHlyMnlv3O7wF2qn0MsKGYzZK+pC0IHNlg==
X-Received: by 2002:a65:498b:: with SMTP id r11mr21098009pgs.364.1615795079197; 
 Mon, 15 Mar 2021 00:57:59 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:58 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 13/13] hw/net: sunhme: Remove the logic of padding short
 frames in the receive path
Date: Mon, 15 Mar 2021 15:57:18 +0800
Message-Id: <20210315075718.5402-14-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42e.google.com
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

 hw/net/sunhme.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index fc34905f87..6971796e57 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -714,8 +714,6 @@ static inline void sunhme_set_rx_ring_nr(SunHMEState *s, int i)
     s->erxregs[HME_ERXI_RING >> 2] = ring;
 }
 
-#define MIN_BUF_SIZE 60
-
 static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
                               size_t size)
 {
@@ -724,7 +722,6 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
     dma_addr_t rb, addr;
     uint32_t intstatus, status, buffer, buffersize, sum;
     uint16_t csum;
-    uint8_t buf1[60];
     int nr, cr, len, rxoffset, csum_offset;
 
     trace_sunhme_rx_incoming(size);
@@ -775,14 +772,6 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
 
     trace_sunhme_rx_filter_accept();
 
-    /* If too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     rb = s->erxregs[HME_ERXI_RING >> 2] & HME_ERXI_RING_ADDR;
     nr = sunhme_get_rx_ring_count(s);
     cr = sunhme_get_rx_ring_nr(s);
-- 
2.25.1


