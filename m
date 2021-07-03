Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4723BA8E7
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:23:16 +0200 (CEST)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzgY7-0004o2-6N
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgVA-0007Fg-G2
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:20:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgV9-0000L1-09
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:20:12 -0400
Received: by mail-wm1-x332.google.com with SMTP id o22so8411181wms.0
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 07:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Em2fgVP5QhNPdopIzF7iM8J887QSPYAiCh7SUQHMHl8=;
 b=HkVaSweBPW4Dpr+P/I9JhMIL/XOyEyVJ6HuJ8+oYntHpNbbUIrMJ8toKynQazGVpjP
 0YWbukBQoFYHcNfPMSYUb3FS3EiTTbUG2ml0z4XAXSjsopQ9/uMkzf91/t3dpLXmhgz+
 /vJkMN/59UMcfwxh09G1yDijm+6l1+r2mZEIhKeUq2YHHV8MMYq2zdmsMl7M/xKN7NnV
 VSBK9/UZ+Nev7fSZS5B/iHZIP+KyGpxGrvzdmp58wzomi6md//R3zaQBUQW1TCDLPaHt
 RYlgt3r1eLj4Hog0Y/qDjb8I+y7s+/YZHaFHCJGbVm30aBEV9Bw3lhGnDdE0gTl+IiNe
 H9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Em2fgVP5QhNPdopIzF7iM8J887QSPYAiCh7SUQHMHl8=;
 b=E4U2XyOekj//+YZmuLwMLRswQZo5qkBD8pfkqfaE2xirj2J/94r5dCCDcQe/pcDlkm
 b0+D+BNYJSsAW4+9hi/7I06+oz8EF3S1ayiw+WxMkuaSsxoKrJ6/Qp9CNAnkWY0EVwo/
 5EKZ26iHwLv/IhHhSTddaKtR9eBhqKrpmmCM8ZWdy2SdIzCS0w1GIUxR6tBP+rRvLUmD
 K4nG57gUSMIAUWtOyZGnDLefe8vIugjC4lw7SpvSjjNoQJbinq+CElzAhksRhM0R/ydc
 xzNKUQp/iaucsWRfpdja5/vVfYLXoyItAJF0zvy5yDsAO66c31LrRDaPIT2/odv/n5Jk
 jt+w==
X-Gm-Message-State: AOAM533orpqGjmW/nDySufTGCcA/zGzh4Ku8gmJmduqENw8CsJJ4xqJ2
 R/zC60eQzRIQ/HXi9HXHTaywWpecZSf3PQ==
X-Google-Smtp-Source: ABdhPJyHnPSv4yprU/GCWAhZjdpuJyNIUH2i2TtH5dyR53QSePZULbHh6CcSsaKtg6lc+3ENLgu7Lg==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr5080651wml.92.1625322009571; 
 Sat, 03 Jul 2021 07:20:09 -0700 (PDT)
Received: from x1w.. (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id l16sm16664993wmj.47.2021.07.03.07.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 07:20:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/6] dp8393x: Restrict bus access to 16/32-bit operations
Date: Sat,  3 Jul 2021 16:19:44 +0200
Message-Id: <20210703141947.352295-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210703141947.352295-1-f4bug@amsat.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the DP83932C datasheet from July 1995:

  1. Functional Description
  1.3 DATA WIDTH AND BYTE ORDERING

    The SONIC can be programmed to operate with
    either 32-bit or 16-bit wide memory.

Restrict the memory bus to reject 8/64-bit accesses.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index d16ade2b198..c9b478c127c 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -695,6 +695,8 @@ static const MemoryRegionOps dp8393x_ops = {
     .write = dp8393x_write,
     .impl.min_access_size = 2,
     .impl.max_access_size = 2,
+    .valid.min_access_size = 2,
+    .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.31.1


