Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3602F3BA1C0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:53:39 +0200 (CEST)
Received: from localhost ([::1]:50396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJbu-0000RX-9L
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJMO-0004o7-Gw
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJMN-0004LC-2d
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:36 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso6654722wmc.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tzi8eTHim8Z+u+XnqhLJG2X/L8m9qzdiOwJHksilmKc=;
 b=WxEQ9XyBEZInFqZQQ1lfiKdjeGdMQGb5CUOJPQm2L45JtkP5PwxzbeAkNzt76fvY3c
 Mgth7lollzCrjl648Va+SkJYErKtF2AWDs8FVKvCO+nOuLkGHy+eo3XHvKY/513HFVT+
 znOHrnexxpZgunTvsMy2pynt15MNTAYIBQ6pQKoG3pdql0wZ81yFxFxV8IdQ4QDR6KcN
 h+2ovJFbbJ3g7Y+GmUgUGsQhJm5rWfk0Vg1QcXmAi54frgLwx7rUL3YpMRoT7rJqNrzy
 bVoXW44MXa4V7pukptukNjt+hFN3flp7ak1GaSwsXBY3frKLX+wujeQCiMLfd6Uv/tl2
 dzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Tzi8eTHim8Z+u+XnqhLJG2X/L8m9qzdiOwJHksilmKc=;
 b=lVLtfRN/T9IIxa77vXP9HT+s9b02Q+SP3Qv30A5bhGZqT9esmcWS4jwnN11/P/5jQU
 Cp6fSoXxTD2kL/vr2dRyiG45du9MMn0zm4KOoEiTF5KD7x39ijgaB2ELq/aaGAVHpre3
 p3IY5eQ5DTgWzazuycWqe12hbDXNd3sbjGntBOCdLq71/cvY4hf7QKkPUeLZJiWqbrjb
 p5ZmcZORbvChMBeLKmsYRiqtB+oecyOdyHhFWjLtPDNndl7Nw+aHanp1dDIDY/AOy35G
 X4gfcfzQQ0nWpBUvnUWXKwelA2IjsdbG4YR3YTpornf/iGREnv71mFwz2gnR6oXpp2Jy
 sDLA==
X-Gm-Message-State: AOAM531rdiWpFM9y3kmpfAwggqbVt2sjl52J2p9N0UpNOmYHRvE6vgNZ
 07MnSuQE+F4tZjN63eQzI6yGZpw097uZs7dL
X-Google-Smtp-Source: ABdhPJwzV9+YncrImddv7b0oK2Itiouto2WSxbbuZIViPeRHt8OBAGrXh3erixtrrknRjyXDER3sPQ==
X-Received: by 2002:a1c:7915:: with SMTP id l21mr13936387wme.62.1625233053645; 
 Fri, 02 Jul 2021 06:37:33 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id u18sm3103763wmj.15.2021.07.02.06.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:37:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/18] hw/m68k/q800: fix PROM checksum and MAC address storage
Date: Fri,  2 Jul 2021 15:35:55 +0200
Message-Id: <20210702133557.60317-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The checksum used by MacOS to validate the PROM content is an exclusive-OR
rather than a sum over the corresponding bytes. In addition the MAC address
must be stored in bit-reversed format as indicated in comments in Linux's
macsonic.c.

With the PROM contents fixed MacOS starts to probe the device registers
when AppleTalk is enabled in the Control Panel.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Message-Id: <20210625065401.30170-8-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/m68k/q800.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 491f283a17a..6817c8b5d1a 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -334,11 +334,8 @@ static void q800_init(MachineState *machine)
     prom = memory_region_get_ram_ptr(dp8393x_prom);
     checksum = 0;
     for (i = 0; i < 6; i++) {
-        prom[i] = nd_table[0].macaddr.a[i];
-        checksum += prom[i];
-        if (checksum > 0xff) {
-            checksum = (checksum + 1) & 0xff;
-        }
+        prom[i] = bitrev8(nd_table[0].macaddr.a[i]);
+        checksum ^= prom[i];
     }
     prom[7] = 0xff - checksum;
 
-- 
2.31.1


