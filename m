Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B1320B36
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:02:17 +0100 (CET)
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqFU-0005qE-Ud
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprY-0000Im-4C
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:32 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprW-0003SS-FI
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:31 -0500
Received: by mail-wr1-x429.google.com with SMTP id u14so16357603wri.3
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZ96T+Noa5J6qlu675dFiF2mpPu/6XZRwEOlj0cy+uk=;
 b=S4XF+ZNAlY/xwyJmFzRKPFAq5wLFPi5Q8aQbi6j8rNR1+K7Xzx91WxdUW2i7yznzvd
 JYhPBj4DdBNYFrwmaHV+MqefHFx4R44L3WfcQ0Bb0tqqEt+9xl07hAxba0pHyu8LWrzg
 5+hx77f+ugDkIW+n4yq3d+xX5/g/n8CmNdwKmJAJOMg1keEWDkeZsLyBh5Xc+3dDTul6
 pX4z9qqCwVinsrDaTNLfdAFqw1kk7Cu2+b1kgUMK2xEW0BChLEytE2Mwk76iWvHCIhC5
 ghmNd4gj1sSobB8q/7Gu5Jz7QOLw4rN1M23FP5E2PE/ZNyhj6rc89BJGcLkUkztAOiwH
 8vMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XZ96T+Noa5J6qlu675dFiF2mpPu/6XZRwEOlj0cy+uk=;
 b=rPAZG/0dveCZqfWmjcqE0VIQM99LWPkAO51H7lGIBFBJjP1TTOeID+Hf0yGdvLZlP0
 URNZfkyMGxHUiZUvpAcbrx7ESSmxP5+FMENk1G/6p+20a/l57WtTvQVP1OOXsg4Cah9i
 /nD1T/BEbz2EpqR/fOCUMfVVcQmPRhakfcgKMpRuDoMLLIHkz9QZrLOwAOZLNNF/8dyg
 KIR1cbYM4SQmNHcdbTyf/uCJN0dMlf4InJMLUewsxg5p39cYNO3r3P/5du2esUzDIhDH
 cXN2cPylAInihZ0s37qNz6SzWj6y2IXPA0r4wi11PzVbN5G5H/HPT/ZEfLtaeCIQGa58
 4TPw==
X-Gm-Message-State: AOAM533VdxW7Qv6SVl/OurMm28FgA+SMFoTOfCwL+NSqWHbayE22OTzJ
 reNdHWfYo1QmrFFadYNtpf/B5RTe/8k=
X-Google-Smtp-Source: ABdhPJzQlqf7/dSEboR4pSnZfSHjrNtR7jQDIUp1V58Dk8vKMUHnopUHQCdzcTGVt6F+Izm/6Esmww==
X-Received: by 2002:a5d:6392:: with SMTP id p18mr4863196wru.426.1613918249005; 
 Sun, 21 Feb 2021 06:37:29 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x13sm7698856wrt.21.2021.02.21.06.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/43] vt82c686: Set user_creatable=false for VT82C686B_PM
Date: Sun, 21 Feb 2021 15:34:24 +0100
Message-Id: <20210221143432.2468220-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

This device is part of the multifunction VIA superio/south bridge chip
so not useful in itself.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <d0a806fed5e8055aee4fcf5b2f4790e6dd0f9dc6.1610223397.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index cb2f7142607..5e2bf6d16c3 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -200,8 +200,9 @@ static void via_pm_class_init(ObjectClass *klass, void *data)
     k->revision = 0x40;
     dc->reset = vt82c686b_pm_reset;
     dc->desc = "PM";
+    /* Reason: part of VIA south bridge, does not exist stand alone */
+    dc->user_creatable = false;
     dc->vmsd = &vmstate_acpi;
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo via_pm_info = {
-- 
2.26.2


