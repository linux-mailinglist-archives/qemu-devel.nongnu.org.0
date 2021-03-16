Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E541633CF99
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:21:06 +0100 (CET)
Received: from localhost ([::1]:38380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4wr-0005qm-T6
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4pk-0002dl-Q6
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:46 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM4ph-0007yu-Py
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:13:44 -0400
Received: by mail-ed1-x52f.google.com with SMTP id bf3so20364592edb.6
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=gFyCn7AAnq6rtrT5DhQ5aWP+2dV02IyJ8TpsxTaNTQs=;
 b=S1A7Bk2Y3BsukEMI7Rw7m0+LFk9sX3BGnpPTC8MP47XxWiFM9wi4soTi9OVkhOzuNk
 geh7Fcw3KGO66zvGK3SsUlJOCj5vT/UaNMCK9iY1jXcPHwias/nYtDj6uSf/z8W+Mrvj
 MsxhG6TXYifGz3o3nGOTaWytBIJ/7uJfwplcRun3w8v1HHQeldifpLQqAoxnS/nYOUvo
 mipoqZlkzdubG6HzY4r8+Bo2cSTgRbd2dJMHEpPqvW9kmOJMb7DxDS8P9Z5dXRTEspK0
 0DfEg2drpmOyQkVBg+k404iegIGPGHK261ugeS7VV6FYGnsVe/zF6JYJlR3wiyV/safK
 KLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=gFyCn7AAnq6rtrT5DhQ5aWP+2dV02IyJ8TpsxTaNTQs=;
 b=cyo0skVsHf0jRzLxrFyJHvdWbzM8ZcWJ+xC8uEHhXQE6UwQ9jT2pzCYZd1s7tRiEaw
 DzWsJ3F/0irmb9irdOUcjQzobHV1w1eMhy2bz2ZvRXtB1DRrPKyO9Twt5FzyRr6Xnkaf
 2SKWtWlChip1c04WdEbmVq5t4PoVXPHhno/BnlB6+FfVTj/Vdoa9XgHIjYr2S5aqNF/E
 ySk6upvo60ecv7VzlwLf/dsk/e27lrzQ/Qqm5czxzlyMSlA0u3T3cd/HwferPdsdrMf4
 +4rxHeYCAH1QPI9Yg19if8iT7M3HIAPLN86WcLsAKR22CLlRxXaav8GLTTkJgyfNdwdh
 oMdg==
X-Gm-Message-State: AOAM531COoQPgyuwi6JUtQa7eBvqfvmgtKqgyhD6/KXZTWT9AABjOMGf
 keOm+SvSrdVaWI6Dd3oEc0Pjq1ekMYM=
X-Google-Smtp-Source: ABdhPJwwQigPCUtcoRuN73hmOMIVrYwVZc+JUELmKAgtL5hBY74pbBJvgnfNIfusHxkvSVgwsda+GA==
X-Received: by 2002:a05:6402:8c2:: with SMTP id
 d2mr35228060edz.4.1615882420569; 
 Tue, 16 Mar 2021 01:13:40 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a17sm5620333ejf.20.2021.03.16.01.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:13:40 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3 10/13] hw/net: pcnet: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 16:12:51 +0800
Message-Id: <20210316081254.72684-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316081254.72684-1-bmeng.cn@gmail.com>
References: <20210316081254.72684-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/pcnet.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index f3f18d8598..16330335cd 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -987,7 +987,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     PCNetState *s = qemu_get_nic_opaque(nc);
     int is_padr = 0, is_bcast = 0, is_ladr = 0;
-    uint8_t buf1[60];
     int remaining;
     int crc_err = 0;
     size_t size = size_;
@@ -1000,14 +999,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
     printf("pcnet_receive size=%zu\n", size);
 #endif
 
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     if (CSR_PROM(s)
         || (is_padr=padr_match(s, buf, size))
         || (is_bcast=padr_bcast(s, buf, size))
-- 
2.17.1


