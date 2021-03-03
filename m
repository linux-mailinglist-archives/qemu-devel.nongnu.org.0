Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48D32B623
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:25:32 +0100 (CET)
Received: from localhost ([::1]:47438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNl4-0000pa-4q
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNi7-0005LU-LB
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:27 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNi6-0001IW-4R
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:27 -0500
Received: by mail-ej1-x62c.google.com with SMTP id p8so14456652ejb.10
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CNwg80BJ3VhdZvmEZy6PuVx6Js+7N8Qb8ukEX4lRJGI=;
 b=hn0XoO+CozBIQuCXj2obdftmOgaYGCoFTOF5pOF//ICgHhvYo2ttueHnhqlu+PdJin
 UIWFLrNAluUCdLpfbKaFM+qpldAyHs3wwH+w6QPoh/uXS4QiZHrDVpa0m9ZqGUcG5Vnx
 UlG8NrQzeHYVl2LHat3X1xd4QCo+uxfw3FPz1xyoAZM/GpiKrkLcpEQn3v/jguJvZC//
 oMl6BartjBRbsfcFIajp1WWtwXLcpfpfieOXaoDRBedjx4HS7BlK25lLMoj+wTjd9CnS
 qrZU5MDIZwfc0egmA/etEj0lGAMg+TLpPssXZJHq2SIrzbXEWF2j4m3pJpFzqNMenfJ/
 rALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CNwg80BJ3VhdZvmEZy6PuVx6Js+7N8Qb8ukEX4lRJGI=;
 b=tHAOoEHX/MrFVqcTG/hvAqzfBMFZ3MSAlbnkLScyNLLwY/NE/2Jalamz2mU655w7DH
 +0bgqcZrluDm2Xo/Aw1fyvkQOrowLGfM7NKOXPjz2F4klo9oCVwdSnBKgv2XhED7cHxh
 gXPmma7nnKT1u0mjSKI8Klz9AI5pk43yzjye20Zvz5WsGc8v/bdlMwTFJEHenAjlvaQZ
 Q4IuajpaupakTosr6+RSwcBqfUOj32eTdZuqpwbQaJD3mK8RCxiLYyJfVSUBviW4qYXD
 Dud4CIGSXawQiwH/Pkc3b0FCiQLP4EqQgT2UvFPXA/nXSSDL5ySj+oLJ60hirkf/vfMJ
 8CDA==
X-Gm-Message-State: AOAM53174OPkKh01/Kc9o1j/4MkW6UQKkUHYHhexLDqzI4F9CSprvH0L
 e0qcMUTaxw36nyQjzZLNC1I=
X-Google-Smtp-Source: ABdhPJxxCZ1SEaDxfIW2zTg2q6Kzrs1tf6tsUuLi9kcyI0e9ENb26bWdtzvDjQ2jAIISnWf1AEMKXQ==
X-Received: by 2002:a17:906:d1d5:: with SMTP id
 bs21mr24997039ejb.242.1614763344892; 
 Wed, 03 Mar 2021 01:22:24 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id i6sm16614865ejz.95.2021.03.03.01.22.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 01:22:24 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH v2 7/9] hw/net: rtl8139: Remove the logic of padding short
 frames in the receive path
Date: Wed,  3 Mar 2021 17:21:44 +0800
Message-Id: <1614763306-18026-8-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
References: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/net/rtl8139.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 4675ac8..cbfe29a 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -827,7 +827,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
 
     uint32_t packet_header = 0;
 
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -939,17 +938,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
         }
     }
 
-    /* if too small buffer, then expand it
-     * Include some tailroom in case a vlan tag is later removed. */
-    if (size < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE + VLAN_HLEN - size);
-        buf = buf1;
-        if (size < MIN_BUF_SIZE) {
-            size = MIN_BUF_SIZE;
-        }
-    }
-
     if (rtl8139_cp_receiver_enabled(s))
     {
         if (!rtl8139_cp_rx_valid(s)) {
-- 
2.7.4


