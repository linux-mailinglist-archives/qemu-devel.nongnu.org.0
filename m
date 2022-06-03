Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE8A53D1F4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:57:12 +0200 (CEST)
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxCTv-0007Bt-OI
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO5-00077M-Ea
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:10 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO1-00048B-F7
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:06 -0400
Received: by mail-ej1-x636.google.com with SMTP id fu3so16122361ejc.7
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zsrYs9v+j1ezvORFnoGAQqRmm4nxMzuK/3Qj8II5VG4=;
 b=f03RNSjLDYDV1Xcd8f96z1+MNrrs82v5G1g1ZXYM9gBJsZAKgXrTdi/G6vIgqAhdJU
 yVCTKnNhLm6Tg/EzH+lQ04RUKs5IP46b7qy4/XMgIprA3qHtJGlG0Ks+s6EqIqEOFPD6
 wY8TyIJz4o2K6RsFdgk1yVUhTrM4CQPtBAnYtDHkLMr8sVJ5Yd34r6m6qlS2jQethcNU
 tJ3vPQZTkkmQxy5PadfOrzF7cA/nFSZFNMKIe/wC/dn4YKflweLk13F4sBDvw4R3gYD2
 urAWCJ7QwTy6JUlCK6u+kEUvjorQGYcOb9pZBmPWZo1DHAVEzQ08KyZEdTqPdUalSz2b
 60oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsrYs9v+j1ezvORFnoGAQqRmm4nxMzuK/3Qj8II5VG4=;
 b=MRPO6HnwJtjMeX64gDazDX2eyZJUY5RJ3Sg5H93q8BgGSHArF0iWPT0tzFjGAnPhEB
 0GyNGNlDVW0JD5/4VN4usQuIEELGBxqkqY3YTJgAcVQuV9GB2kTNklqs0U7+y0Rbl4Wb
 dPJkz34oo60duSnc1eSaMFp6mMxP5dMJVlIofYBNRFSSIIDphxPpE3Y1rcLqu6Scvl7n
 gjEM9K1LZtqZkaKeJWyrKBtwTZRdZOcYSNHN5LeZPLRRETx/VVv22m/81RxGx6JSk0sP
 N0DiZs6A4mZvj46xjaBQHA7tUY0jXyJYoKj/mJxm4kRJxE6VLz3MyopjeeJuWbwgSoDX
 jzNA==
X-Gm-Message-State: AOAM532PRkXTyLj09WUVsLskqbmaV4ohsUlM5F9LyjstTu4IHkRrdeIZ
 CYDr98DiWFHTR9g3VesYRLSMazLKdJ2JSg==
X-Google-Smtp-Source: ABdhPJxacIlHswXk79YvmaZi/5wEqK6+EQ9ZNgtS4j4dJfc2wtJSQWPB/mmmSrMlbWFzy2kTZY15+g==
X-Received: by 2002:a17:907:2d2a:b0:710:76a1:4d89 with SMTP id
 gs42-20020a1709072d2a00b0071076a14d89mr300271ejc.307.1654282263816; 
 Fri, 03 Jun 2022 11:51:03 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm3066160ejc.73.2022.06.03.11.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 11:51:03 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 02/11] hw/isa/piix4: Use object_initialize_child() for
 embedded struct
Date: Fri,  3 Jun 2022 20:50:36 +0200
Message-Id: <20220603185045.143789-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
References: <20220603185045.143789-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 9a6d981037..1d04fb6a55 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -224,7 +224,7 @@ static void piix4_init(Object *obj)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(obj);
 
-    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_MC146818_RTC);
+    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
 }
 
 static void piix4_class_init(ObjectClass *klass, void *data)
-- 
2.36.1


