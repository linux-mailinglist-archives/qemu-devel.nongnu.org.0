Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058D9444AA3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 23:08:36 +0100 (CET)
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miOQs-0005HE-Mu
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 18:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3bQaDYQgKCpgOM92GLK98GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--wuhaotsh.bounces.google.com>)
 id 1miOIs-0000sI-6r
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:00:18 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:45038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3bQaDYQgKCpgOM92GLK98GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--wuhaotsh.bounces.google.com>)
 id 1miOIp-0001Hb-NG
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:00:17 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 z2-20020a254c02000000b005b68ef4fe24so5967397yba.11
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=XzmzLTw129AfoXJexFTDBkJFYclTTe0/WMWRnSEgR+o=;
 b=GWcejfUUsqu+ZPi165+WbVhHRzZKCUHSN++uCP/IFTsB/Bt2xhIzfeEuh+s+6Sc3nU
 33ac1VWClS5jn2UqO6znYMXUGjUvpM6j5xZvw4XgDDoBM//gCt50hiFJvQIpnxxvBvEe
 6NkwhjxOUpE1e6sTR9kooVAJ1K7L2e81W00l5WKfgDdw4lc1u28Qq2Ds/SyA1XfipvMq
 AHVoh1iHNKcg8RzK8xGitvfwlIx+NFkLCRoRoZRhEwREhDFZMNwPEY/rEz8SCbJJlI+P
 5nK/nV3VdRjVo8MY63AGt3/+44poU8WDIImORJnP+gwTeattA2ztM36GCgNCiEm/Mkhp
 YQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XzmzLTw129AfoXJexFTDBkJFYclTTe0/WMWRnSEgR+o=;
 b=1DwVy6hs3K/YaAwI65isUx9MIwsZA/S00qpnoN5fMfFuyryvY75+p2i5fmDcHP3XDb
 IQ9AK9taTEHE/ITy+mFsSb1n8b+NxYoccY45RUXLyetmzjLNZ9qlLrUGakL8MdPqcaDW
 3jsel27QWFPJJabIdbcoCk8VX0VkiGoMOKRdIKGjn63v7ogk9AqaiLhDdwouAYpq+3dc
 DtqUERU8PSgS0aZKpveigaHdq+8/H5VsgBFKo4i9dLlEAlwi91SC0qcjjhm/mghSSgIh
 +h4OXFVPtoejmmK/veCk88S38wzdYfidROowxhvYv6rpmMUWLiE57DvRua35ZpyhISJ6
 AgUg==
X-Gm-Message-State: AOAM53100fzXQwR9swqKU1LegrcskG2/ASGxRp1EicXdNnbfH7WWBEPl
 keTTSrMQJHEtjvIFyzbn0mBWjzG0bruynQ==
X-Google-Smtp-Source: ABdhPJwDDa+jw8v0JD+BO0pWIgaoFcWUs8daYOcJNAQVxPdb9jB0+5XDuLlfAbKkWwWLWp3xD4gjMBSdBlrsIw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:f620:: with SMTP id
 t32mr25122659ybd.437.1635976813431; Wed, 03 Nov 2021 15:00:13 -0700 (PDT)
Date: Wed,  3 Nov 2021 14:59:48 -0700
In-Reply-To: <20211103215954.1401805-1-wuhaotsh@google.com>
Message-Id: <20211103215954.1401805-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211103215954.1401805-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 1/7] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3bQaDYQgKCpgOM92GLK98GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ACK bit in NPCM7XX SMBus module should be cleared each time it
sends out a NACK signal. This patch fixes the bug that it fails to
do so.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/npcm7xx_smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index e7e0ba66fe..f18e311556 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -270,7 +270,7 @@ static void npcm7xx_smbus_recv_byte(NPCM7xxSMBusState *s)
     if (s->st & NPCM7XX_SMBCTL1_ACK) {
         trace_npcm7xx_smbus_nack(DEVICE(s)->canonical_path);
         i2c_nack(s->bus);
-        s->st &= NPCM7XX_SMBCTL1_ACK;
+        s->st &= ~NPCM7XX_SMBCTL1_ACK;
     }
     trace_npcm7xx_smbus_recv_byte((DEVICE(s)->canonical_path), s->sda);
     npcm7xx_smbus_update_irq(s);
-- 
2.33.1.1089.g2158813163f-goog


