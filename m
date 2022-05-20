Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B9C52F249
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:14:00 +0200 (CEST)
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns78S-0006Go-1E
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wd-00040h-Ff; Fri, 20 May 2022 14:01:49 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wb-0004Hk-TY; Fri, 20 May 2022 14:01:47 -0400
Received: by mail-ed1-x52a.google.com with SMTP id eg11so11702921edb.11;
 Fri, 20 May 2022 11:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PJXOJrfQs925pSEapuM0H6kX1hHTrkqiCBU6Uf/0iC4=;
 b=kDUPgaiJEsdA54oB648Z0faBCpoJKipV6SrhjjeZyv8y2U6XWBrCgNJ/FdIERRmvS4
 BOV9QakYOA++O1TFkNVw8NNdK2ySCmzq5VnFt3EImWPwsqdGcqHmEZegcQyD2F0+KLZ9
 7BmYFEGfBeBlVTC1BSqm0OpBfuuW6vHIi18Jt5ml1l0JH9nAZjSxijhEYYNF0ZnVN9jr
 ZKzwt3NP0eRzR+sx8eluYVcXNSzyg8eQ3V8dNqLLzAFGUn0TtNbMQgjvdH3WuX3dukkd
 wsZmlA8jjfaet6buoJdBsuQd6GWkEuhtcT7I5NTKSt6jYTGMNxMQIoBskfrEVA/u4zZU
 IIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PJXOJrfQs925pSEapuM0H6kX1hHTrkqiCBU6Uf/0iC4=;
 b=jtQEKzVKo4Zm7ADjAt82Rj3V0EanL3Hpz7d/fS4hscccu8QdJ4B2ElExhJdgYJZjZH
 9BUBh7HXP+guXv5Ga36RRftvAcltKMz7ukCUOtfCNVYbXsVEMl9O5V8WOEEy8bHSXALj
 AdgO9cakW+/LBwSW3kGnRJixXxaO9qM3iDg55axWmpRbcwxiXK0ChpCCi2fCbBvaQtBo
 cT9EqPXjM2+IDF52gqffkuiik5aK7qGz9NgU/zqznYzgX8U8D2vbW1ZmnwddJjnkrSPB
 l5UEYzmAq51nQz0OQAZCKBpPhaFoid6/17Fkcn3gd2TAPdSEcxqzsuvZuGivxe9NO9KS
 KpDA==
X-Gm-Message-State: AOAM533zRzSFZkH2qi841RE8cihhm/w86g619f8IkqtVbYSYTcTsdpih
 ZZfR0R8Ov2lsX3JcIXreVnHmPVgqq8o=
X-Google-Smtp-Source: ABdhPJwbu5qJuilmxHA2D2Ya2f80AH9xdI3fbUSFhZWOeKEZHpVU2VDGyoXaSTZsyl95eCr+ZzzVww==
X-Received: by 2002:a05:6402:2752:b0:41c:b898:19a6 with SMTP id
 z18-20020a056402275200b0041cb89819a6mr12467154edd.30.1653069702880; 
 Fri, 20 May 2022 11:01:42 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm4622029edt.15.2022.05.20.11.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:01:42 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org (open list:e500)
Subject: [PATCH v2 07/10] hw/net/fsl_etsec/etsec: Remove obsolete and unused
 etsec_create()
Date: Fri, 20 May 2022 20:01:06 +0200
Message-Id: <20220520180109.8224-8-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520180109.8224-1-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

etsec_create() wraps qdev API which is outdated. It is also unused,
so remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/fsl_etsec/etsec.c | 23 -----------------------
 hw/net/fsl_etsec/etsec.h |  7 -------
 2 files changed, 30 deletions(-)

diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index 4e6cc708de..b75d8e3dce 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -443,26 +443,3 @@ static void etsec_register_types(void)
 }
 
 type_init(etsec_register_types)
-
-DeviceState *etsec_create(hwaddr         base,
-                          MemoryRegion * mr,
-                          NICInfo      * nd,
-                          qemu_irq       tx_irq,
-                          qemu_irq       rx_irq,
-                          qemu_irq       err_irq)
-{
-    DeviceState *dev;
-
-    dev = qdev_new("eTSEC");
-    qdev_set_nic_properties(dev, nd);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, tx_irq);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1, rx_irq);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 2, err_irq);
-
-    memory_region_add_subregion(mr, base,
-                                SYS_BUS_DEVICE(dev)->mmio[0].memory);
-
-    return dev;
-}
diff --git a/hw/net/fsl_etsec/etsec.h b/hw/net/fsl_etsec/etsec.h
index fddf551544..3c625c955c 100644
--- a/hw/net/fsl_etsec/etsec.h
+++ b/hw/net/fsl_etsec/etsec.h
@@ -155,13 +155,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(eTSEC, ETSEC_COMMON)
 #define eTSEC_TRANSMIT 1
 #define eTSEC_RECEIVE  2
 
-DeviceState *etsec_create(hwaddr        base,
-                          MemoryRegion *mr,
-                          NICInfo      *nd,
-                          qemu_irq      tx_irq,
-                          qemu_irq      rx_irq,
-                          qemu_irq      err_irq);
-
 void etsec_update_irq(eTSEC *etsec);
 
 void etsec_walk_tx_ring(eTSEC *etsec, int ring_nbr);
-- 
2.36.1


