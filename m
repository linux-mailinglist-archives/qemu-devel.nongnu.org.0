Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B97A33ACEE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:02:31 +0100 (CET)
Received: from localhost ([::1]:46060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiBJ-0004ov-V8
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6m-00087s-9M
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:49 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6i-0004JL-9f
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:47 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q2-20020a17090a2e02b02900bee668844dso13895941pjd.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vD46lUZcLSAUQNgR7xLQ3d0V2UL3xUfjTmzNJ2lZFKU=;
 b=M27BxgQvH/qo62f3i+jehPGXea3s+N8FtdekLUkj0L+gcfelVfqnYBUU6hBnTKGRGK
 49J2sMyvKj10N0pZTatvrXoUXnbEJZZ7gTQgSwwtbBrDxIE84JjCv+yv66vZ1am8DWpH
 jn4v2jD0IqREP7qbk0QHuTC0R1pCgbx9ZuRcJqJ2RHIz6YJg2q1OD9tSm8NSJPLMmnhB
 Qp3FWjDmJ4EucBXoVAIKEhuxr/eb0VXWSfpBla5f5QJ/QxhwF7H2hvk91nP72RVf19tX
 DN2sQxtw5LPf1uyEGWNZ8OSNSXzQ2AdnwTGS4KCY7ctLGQueSGJTJFHpG0hrT5pmx7F4
 c14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vD46lUZcLSAUQNgR7xLQ3d0V2UL3xUfjTmzNJ2lZFKU=;
 b=HFxMXKY2RWHtQNo16Cel5prE749J2lRerr7hJGHcM6a1B/f6T/RW4j8Wva3C+QCWWY
 Y3JnkA8AsfKa+MLxqXUMVxYg3sSO0ZjTqJY/NMhk+RSJY3vjGiESeo9uG8lbG7hWAShN
 AbC67aPvUYufGf/bVyyjvWJVZBdPjj8rPxNp0g54jw+EBYxeeWSwcuAae8AwTDKbQo8Y
 WaiUGKrSOBOay2kjzKH+vbbijJy8VTa+sBCbpzp0M0NydjCU6PBj5FLVv3EJ1Bc/Ez/R
 N0hgTK+zB08EaAD3/kygco2J5GCvVOS+XaU30eL5RwMXwgbZQkf+S6QsLu2vGCqXQXBZ
 hClA==
X-Gm-Message-State: AOAM532uQJKAF9uTcI8ktm1H9HLv61351576RLSPDii/dKP0T1KBFXpN
 6hzgpYdPF8s+oVID6pKZ4Xs=
X-Google-Smtp-Source: ABdhPJwBOW+oNPzCedUatvOFKbSO9oyK9zkdDwNEryDxxuxPzO+QorWBl4miInufgOM8eULvHNKl2A==
X-Received: by 2002:a17:90a:f3cc:: with SMTP id
 ha12mr11377553pjb.180.1615795061225; 
 Mon, 15 Mar 2021 00:57:41 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:40 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 05/13] hw/net: virtio-net: Initialize nc->do_not_pad to true
Date: Mon, 15 Mar 2021 15:57:10 +0800
Message-Id: <20210315075718.5402-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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

For virtio-net, there is no need to pad the Ethernet frame size to
60 bytes before sending to it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/virtio-net.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 96a3cc8357..66b9ff4511 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3314,6 +3314,10 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
                               object_get_typename(OBJECT(dev)), dev->id, n);
     }
 
+    for (i = 0; i < n->max_queues; i++) {
+        n->nic->ncs[i].do_not_pad = true;
+    }
+
     peer_test_vnet_hdr(n);
     if (peer_has_vnet_hdr(n)) {
         for (i = 0; i < n->max_queues; i++) {
-- 
2.25.1


