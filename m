Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715825A9D1D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:31:21 +0200 (CEST)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTn67-0007QH-UI
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1r-0001c5-O3
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:56 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1p-0001TN-PA
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:55 -0400
Received: by mail-ej1-x633.google.com with SMTP id se27so28081672ejb.8
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8WFpCGhPddaEE2JHOfiKT0by33talYfLnci1riHKxms=;
 b=XCcal4foQNQY901vr9r/wEAJLIBsIuTQqHz9O2odYcaV1GRw/2lGwCLAjryLkoAvCI
 QuqDJQUQooHhqygvGXgXyRvxhqKJbh6fBuC6tyGaildD1nPfa5UlTIhK+PBwBUZkfvxT
 v10/lxfeKhimGf6vZ9lwZPQR4Y2SjmTI6k0DoZdpn9GW/KSNmLwEOsczAZueK29BX0lY
 gLntskoDwXkXuaXjgKH4qPYeq3CtcO7cKUqQWsh2J8UxZ01tNzG3pkugDoED7ycaVo81
 uY5KKu+NMQ1bJesB3rWaNfIQPdcg8u9tZZI0viJBjmDlmJv1QrKtpuMmkAmLvC8RMTf5
 zvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8WFpCGhPddaEE2JHOfiKT0by33talYfLnci1riHKxms=;
 b=Eek7iTSgLcTLtgf+KigSskbBunLvGyFhxgHa28JpMgPmrF43CEoPOBO4PzevAf2VMT
 2uK83HaJQxfx4gAPTOThvDM+rcEgdxAtKlv/g5MXOAszSWefuvIQ5JCYinXvlBoMJBNK
 VCN0neBAFHmDM2AwbPVeLNfj47SNE9GG3SzgdV2IlMVgMDF6/2S6xyD4alXcRguU+9rY
 4kItOV87i4UPeJBNOcVpvt/rZp/DJmiaVS+56xp5I0Zeeys7mnlHgRXUQm9mKqyIpeNb
 UEDaL4OQWTl4MB1WMH+WnZ5LY5B1y/DORDPdCUoIRznBSpyBTCiT5985heLK3/RGSrJJ
 cIeg==
X-Gm-Message-State: ACgBeo2nWAy7XsPn0cetZ0+xi8UA2DVrcz+yHhf3Qs3xqwVYfoBxph0v
 f/EpSpz+Rpb5yGtsHgKb/STIRz93+v0=
X-Google-Smtp-Source: AA6agR7uZTEuCS+6p/4wafCjS95fz7fIVWcT3tJCwf9G5wxtBKStL+d3TA9KE/FZGLWMNmp08pzSCQ==
X-Received: by 2002:a17:906:6a21:b0:741:430f:baca with SMTP id
 qw33-20020a1709066a2100b00741430fbacamr18933507ejc.507.1662049611017; 
 Thu, 01 Sep 2022 09:26:51 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:50 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 04/42] hw/i386/pc_piix: Allow for setting properties before
 realizing PIIX3 south bridge
Date: Thu,  1 Sep 2022 18:25:35 +0200
Message-Id: <20220901162613.6939-5-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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

The next patches will need to take advantage of it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/pc_piix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index bdad3b6795..b08d946992 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -218,7 +218,8 @@ static void pc_init1(MachineState *machine,
                               pci_memory, ram_memory);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_new_multifunction(-1, true, type);
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
-- 
2.37.3


