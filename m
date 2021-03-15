Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FCA33AD09
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:07:41 +0100 (CET)
Received: from localhost ([::1]:58632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiGK-0002II-NM
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6v-0008SI-RN
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:57 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:56221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6u-0004Py-2R
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:57 -0400
Received: by mail-pj1-x102c.google.com with SMTP id bt4so8334961pjb.5
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdmbmVq7ujOmv45uN63XJuQpkEbRlXv7rPJRu2EmGJc=;
 b=S/oj/H4305PKA/EMLLP53N5zZswVr7gXAZRBDkAVh/AgYDLp3X4R+hBjRLxBjnZdcZ
 dulP58G6zwsStttf+q+8TUdc3yFQ94U2/DgUICc6pi5BPfX81YM2JMA6CcA8bpf9v8Zd
 KccwuPZRIpNk5X58LTcuNQ0hJ/43YFghrrdXDOnYFdAUapaD4QsTYvbafBTHlomqUqNU
 n+tfi/sySIc3zS+PFVt2pRzmtg8mtbVFGfl68HT9QBRGyhgH0DxQeEdfhZrM01D8v43I
 fuRUzxwVdCGlhCfy6ZztBLmxfZIMTzOSSKYEbDetuKwd4S9UBniMwFBjw47BzGi1KyGP
 4FIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdmbmVq7ujOmv45uN63XJuQpkEbRlXv7rPJRu2EmGJc=;
 b=C7/QcFKV8yG/dHZ8LvBEYindNhmY4J9Axe1LN/S7rHJUXLbUknEfnS8fKdy9VqNG0B
 GoC6JT8B4ZMu/BkNAIE6qgGPVdejyMvfdSEOQRu+usy+AL90GoMckmYCzustad5VDTHy
 jyO6FObVAvCAX4BRicpPUyMhHRY8OQS3NMYY/4QdQki49z7nKxuLByDbkSatF6gB0a6T
 WkHrgeeEBop+nZC7T4Y+jtxhbDBXKjiEl9klYbLBN7wLwmLT7AKb2TuuQD9X8swrGsR+
 xg4RUrN8xGZRJQ8ls/HtV3AkR8Gyt9t+nFpcLj0yuPXzK6pHSvUWpyCs6E23Cts3Zpwx
 GS7g==
X-Gm-Message-State: AOAM533pYYUMlgysRpUgVLV01puhFusWcluMVr56B+bixIolNJQadiMU
 giFf6JBPed+buoyLn3T+oTs=
X-Google-Smtp-Source: ABdhPJx/JiZWWVGE8kowdyvY7dZpYsBOOh9Dbah1Bd1B7+zLj5+JtdCCY3OcTDVn/L10dkjMYiv+Og==
X-Received: by 2002:a17:902:c083:b029:e4:84c5:6ac8 with SMTP id
 j3-20020a170902c083b02900e484c56ac8mr10440074pld.71.1615795074867; 
 Mon, 15 Mar 2021 00:57:54 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 11/13] hw/net: rtl8139: Remove the logic of padding short
 frames in the receive path
Date: Mon, 15 Mar 2021 15:57:16 +0800
Message-Id: <20210315075718.5402-12-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
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

 hw/net/rtl8139.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 4675ac878e..cbfe29a286 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -827,7 +827,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
 
     uint32_t packet_header = 0;
 
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -939,17 +938,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
         }
     }
 
-    /* if too small buffer, then expand it
-     * Include some tailroom in case a vlan tag is later removed. */
-    if (size < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE + VLAN_HLEN - size);
-        buf = buf1;
-        if (size < MIN_BUF_SIZE) {
-            size = MIN_BUF_SIZE;
-        }
-    }
-
     if (rtl8139_cp_receiver_enabled(s))
     {
         if (!rtl8139_cp_rx_valid(s)) {
-- 
2.25.1


