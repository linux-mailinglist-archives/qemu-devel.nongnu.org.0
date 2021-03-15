Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E5433ACF0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:02:39 +0100 (CET)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiBS-000572-KW
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6t-0008Mw-QG
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:55 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6r-0004OM-RT
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:55 -0400
Received: by mail-pj1-x1033.google.com with SMTP id ha17so7578146pjb.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/mOKBGRUJ4y+tPw9lpl+OkfuSsuw7sR8Re9xfC+JUDo=;
 b=f6wO+Dxym7bumpUHmqAApqemSCKw31nOG1D9thh2U6kGpgAi3GDrUkX8N2cvtXvR4O
 qvt34gBI/qELH+irkqcLYSyeVrw0A4ghZYLpdX/vNUMun6VLz11qqMDAzVCB9vGZOgoU
 a+jxa/TD5A6+ZdIxrCsLWlI2t0oB4//gNClbC2v5mjygLMGL244MEqgk4IBkq2AGXO1x
 JNw7V8+UrneAdtRDXXXF99+knQtj71nrAw680uKLRO7f79xI8rXib6OANYHYWRTy2zDM
 rB3sOrqSMFjtNG22gDf1uNrUzzN4tttyKaA+ZzKedU0ru6peAba68hISHF6ye8v244py
 6zCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/mOKBGRUJ4y+tPw9lpl+OkfuSsuw7sR8Re9xfC+JUDo=;
 b=V5UeVpqo6HtRIlt9YDANdthnVTnv08mXcm6pAw73+DVpwUouI9ibtG4FVNO4eBD6aE
 eCnvFcYY8f7GRtJr2B1xRjemZRxq1JOU82dm0kNGoxigDuTGPLg7G1GeLge5AfkH8srX
 5OJNWoAPuqIK2+ErtH4bN4BGhRTLHS2C7GYmO0AmsT0mDrJVWOzv/2PeHcux3dioHXhv
 3I0A2Ndb+2v2TsSWQzIRTSfPbAwstjT2LwkNboUxs3YDZYlItzopHZ7D23J8cs1GVtNp
 Ec4dBDxsbbfmE4E0wbd8+ORqULiT8BPNKZUmMRad5zi6KBH9yHyOxw44Wet0qH98QrZ+
 U83w==
X-Gm-Message-State: AOAM533k86o9ofHkRaKpeX/xd7rs/WbejAuNL6A8V0cdg9Xs4PhE4C1p
 K87BFsND5EoZh3qv4zGdzJM=
X-Google-Smtp-Source: ABdhPJy6FSbHaCI/W+NWKuefF7Lh+/5V2HLL3m2o4J8RjebKJUsRQ4f0lJ4CXsOvQ+vLb+N4XkOGRQ==
X-Received: by 2002:a17:902:6541:b029:e6:27a4:80fb with SMTP id
 d1-20020a1709026541b02900e627a480fbmr10139807pln.15.1615795072628; 
 Mon, 15 Mar 2021 00:57:52 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:52 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 10/13] hw/net: pcnet: Remove the logic of padding short
 frames in the receive path
Date: Mon, 15 Mar 2021 15:57:15 +0800
Message-Id: <20210315075718.5402-11-bmeng.cn@gmail.com>
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

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

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
2.25.1


