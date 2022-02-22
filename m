Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CDB4C028F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:58:13 +0100 (CET)
Received: from localhost ([::1]:42120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbIa-0001LV-E3
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:58:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawK-0003Oo-Lb
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:13 -0500
Received: from [2a00:1450:4864:20::632] (port=42908
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawI-00074L-H4
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:12 -0500
Received: by mail-ej1-x632.google.com with SMTP id hw13so45829926ejc.9
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0VwRAVUenlZUvRbc1a5N4xtILg9Nv9mnMQHhVnmjwI=;
 b=OQy7tOKkZx/Tue37ieC6XXMXrqFyoKkOvZNRec/V8jizzbw/WQtPhg1dQnmhTaY5XM
 5PPidRcph+L8SxALIEYchgkx1EnlcZsHu6lxbDYiUDifJ1gwOo3LiOpBML2CrT6h04Yj
 8GQMV05cptmOMrEw6gOXdbq+6V7/6xXuEvTIoQwmwrZVheqxW8mYPI7lLQ0j0brgX2e3
 MAzr58JM5t0OAEyRdyAkajPRtWB88TkN3xkhTGrmGlkNLAwRHylqTOh0Jlc/T2WTrYuG
 lkP0xRfKM82DKAjxvkdQ8OaXWoEOKMsvV3Yut4mRgzWGWrV1NhGllrPJ5SawjdSBbuJy
 RRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0VwRAVUenlZUvRbc1a5N4xtILg9Nv9mnMQHhVnmjwI=;
 b=qq3lwQ1c/L8sYtgODNMvP2+Z4fN8EDodJi9QmGiOHa0sQSBI3lsXl32og2ICw+EzvK
 mKBG/1RnSHT+xK9en/NZPbbj7Qh9H7WmVMVKynYLoHLfdZQ+lwGtp/RONzH+kfjq7nxe
 B1Ba6oRdWYgvMliRA6KFIQM2Wav1jIXe4AYBEwPVIfWyTl2yIv9qQ4EJzUoZNCkgdvbJ
 i6v5b+ySvSPGwVXmoJu4G3xtOFU07Lj+TbYXiOciLvgvlaLMSqhOVh8Q9Kqgr8RI5G+1
 oBq+t7+OfTdKDMZ+UzgZESXd49JJWoN09YA4XAoFprLt3w1LF55ydB0HEKjDqIoBDTuz
 lHHQ==
X-Gm-Message-State: AOAM530Jjjq2+XbSazzcyiRzHfXD0nz6itVnHyOzHSaSg2dhv30tlaRZ
 8FFwyfvMdDU92vQPG99v5M8XDz3IvtY=
X-Google-Smtp-Source: ABdhPJzKFiLzdzJ9Dplzp3+JxjddBNiyUW0sSw5hY2Ctbv3oshCfxo42X19AcPXnkZFFYmnHkxGLdw==
X-Received: by 2002:a17:907:766a:b0:6cf:bb20:70c with SMTP id
 kk10-20020a170907766a00b006cfbb20070cmr20072612ejc.94.1645558509093; 
 Tue, 22 Feb 2022 11:35:09 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:08 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/22] hw/net/ne2000-isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:42 +0100
Message-Id: <20220222193446.156717-19-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/net/ne2000-isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index dd6f6e34d3..6ced6775ff 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -68,7 +68,7 @@ static void isa_ne2000_realizefn(DeviceState *dev, Error **errp)
     ne2000_setup_io(s, DEVICE(isadev), 0x20);
     isa_register_ioport(isadev, &s->io, isa->iobase);
 
-    isa_init_irq(isadev, &s->irq, isa->isairq);
+    s->irq = isa_get_irq(isadev, isa->isairq);
 
     qemu_macaddr_default_if_unset(&s->c.macaddr);
     ne2000_reset(s);
-- 
2.35.1


