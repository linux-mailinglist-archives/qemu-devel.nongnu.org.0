Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B7D67D78F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:19:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9dS-00088p-Hh; Thu, 26 Jan 2023 16:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9dA-0007yp-Ae; Thu, 26 Jan 2023 16:18:01 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d8-0007k4-LK; Thu, 26 Jan 2023 16:18:00 -0500
Received: by mail-ej1-x635.google.com with SMTP id hw16so8565904ejc.10;
 Thu, 26 Jan 2023 13:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tubdnU+XgZjPA7MkbgO7dHANtWvi4WyU/xxOFVAkR7E=;
 b=iBO4EoadoBXls5uNA2tElNL2S1FttQ/UdB8d+D2r2QYpI8xo9aNgE2Tvz9T2qjcxxI
 MqcYaVAV0GtIftBNUoSUsUG72aCWLwHwPqblulo0scs94tRURwHI8gjkV5+/RkAX/tCg
 G+N6oc8LYZg0i5s3LJiEuz8uLAMoKAFGhO+KiXkRTb60NTWcVKpR8Dyh1VrSwfH9XbLo
 77PIihgCtLKRUtQDYW5FH/+hLupMUemX6YLZH1pU+qU/MStApj2DcwKwjlvhi4KKxF9H
 CCjsBE4nSIPQonpdIseBNbsKjBidC4u74aOc5gDNCYujUV8IN120ci/CyVg7id4KOGu+
 bJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tubdnU+XgZjPA7MkbgO7dHANtWvi4WyU/xxOFVAkR7E=;
 b=yAdI7lsMwyf3q+otugYUg5aNtWBxJHpT7h/k7jF9MQq0IrfgpdVmDaE4EDlqjEuLxY
 5OERqLonUp/dcjODt87OZU/TI/FKdn6BDfFwO/N/qTQ/ILyw45CEoNk7dHnt9pQ20uyu
 bmr8Kk03UHhapdh2ssmI/EONKKXI0BKkesamj7JRh2dgo9jCZu5n0Hj2fRDjowW3BWpf
 +T9Q6doPIQiahh2Xg7NEmA7LpL1C7TaUGUvPMGSgLrFtRWYya2n0B/TwGfjG5nC/i99W
 kwSeBsa/Yjr83+XMrYrDSg9r2dDqlZbtnpqm2pUa2z/TgPtNX+J3HLznZLlC548tuMte
 psKA==
X-Gm-Message-State: AFqh2krowHXn1WxR86E6lBpPfspgOG2jYEZ7Os/7Adsg3XJigJ/sSnbf
 wvhv3KWtgoy+tOZlU2lquN6An+bhJ5rjog==
X-Google-Smtp-Source: AMrXdXvpp7SLzC8OpEOeUkNRWxFqwM0eV+TfjaAZtWz7wcupSlV7KwhMLtLZkMt75UzYZbzbD66OWQ==
X-Received: by 2002:a17:906:5414:b0:861:b4c5:63ba with SMTP id
 q20-20020a170906541400b00861b4c563bamr35055792ejo.41.1674767876310; 
 Thu, 26 Jan 2023 13:17:56 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm1117568ejc.23.2023.01.26.13.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 13:17:55 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 06/10] hw/ide/pci: Add PCIIDEState::isa_irqs[]
Date: Thu, 26 Jan 2023 22:17:36 +0100
Message-Id: <20230126211740.66874-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These legacy ISA IRQs allow the PIIX IDE functions to be wired up in
their south bridges and the VIA IDE functions to disuse
PCI_INTERRUPT_LINE as outlined in https://lists.nongnu.org/archive/html/
qemu-devel/2020-03/msg01707.html .

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/ide/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 2a6284acac..24c0b7a2dd 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -49,6 +49,7 @@ struct PCIIDEState {
 
     IDEBus bus[2];
     BMDMAState bmdma[2];
+    qemu_irq isa_irqs[2];
     uint32_t secondary; /* used only for cmd646 */
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
-- 
2.39.1


