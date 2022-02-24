Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F0E4C2E16
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:20:14 +0100 (CET)
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEya-000102-Sk
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:20:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1nND92-0000wG-LG; Thu, 24 Feb 2022 07:22:52 -0500
Received: from [2607:f8b0:4864:20::102c] (port=46048
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1nND90-0004l4-Ox; Thu, 24 Feb 2022 07:22:52 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 bx9-20020a17090af48900b001bc64ee7d3cso1851321pjb.4; 
 Thu, 24 Feb 2022 04:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyDWDe7knO7uvZaUog/qaJc4SkmPv1+byRb7VcuSGIs=;
 b=GXU7f+bUXtrrTGLTOJYAmmMTLqczd24eA4Tj9+NK995PxqYIyoqgP+r3dB24L/4jfh
 UhDOSosZvW+PxXNCC7QfRTUYQPNJkjG07wfB+7fTSDdIo2K5XPrr0GteoUeWuqs1nN8H
 G7S9hbDGmvxeca4TqE10rMUj2MZvtOUqH8VPXhZUinB6UGcGGebncpVxPDlCvolbEepo
 XAcbHjRC7Njv6m7Ute5Ro2V2RAp+oUWb6zXelfNu+ojZTArmZaebH4/TuAAfXzs5g63M
 sFR7oxJBo7l8t6PlXlsWBNo7fayA6oyeU9wQICu7+y4/4iFIFV+JeBqUa9a/Em+Pacj7
 cI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyDWDe7knO7uvZaUog/qaJc4SkmPv1+byRb7VcuSGIs=;
 b=xpACSKReitdsxbSewkG9pwaKUSn30nd7nNUo7dtrh/V4WrRGDbLbIBJzhPcfjacA3w
 NAyAW1kXBrzbiBzFqKEt99rVnneYMAJaMLia5b/kHgtAtLF4+gJ7KYxPaZJHLqOVKILT
 9DKX8L79U3NKi5rixRiawG4NTZzsm8a9Q0bGbfQc2an6mPx47qJ9KD8WCyxfsi7XKlwW
 tXL0Z5rlp/Qp3258MUWyZKHxcnWgm+6lx/K4cwqJ9nkImEnwCEP+Su/uMVsOYy6LaKmB
 +QdXYAXY2PIm/cSwpVJ0c2Dfe4QNBQwN/e9G7+AxAtmXomueQqW54kjiB8D3gQaNEqAv
 +blw==
X-Gm-Message-State: AOAM530tetJ7vE4HVYdKvxo5F4wxb3zudTB7vSwmNOuulDqlJx8wqHjy
 yXUNtt1HP1ki2CkcaV5HOr+Isyf4hxidPliwFf4=
X-Google-Smtp-Source: ABdhPJzhv9Fj9eabgJadeBTESTUlsWobM1f0287BHcAtTv9mpjsM2tXP/3or7CaA2a9+WtASnMRDJA==
X-Received: by 2002:a17:903:2306:b0:14f:c265:a8fd with SMTP id
 d6-20020a170903230600b0014fc265a8fdmr2308596plh.157.1645705367367; 
 Thu, 24 Feb 2022 04:22:47 -0800 (PST)
Received: from front.loc ([185.230.126.2])
 by smtp.googlemail.com with ESMTPSA id h21sm3318722pfo.12.2022.02.24.04.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 04:22:46 -0800 (PST)
From: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/armv7m_nvic: Fix typo in comment
Date: Thu, 24 Feb 2022 23:21:10 +1100
Message-Id: <20220224122110.22371-1-evgeny.v.ermakov@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=evgeny.v.ermakov@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 24 Feb 2022 09:18:46 -0500
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
---
 hw/intc/armv7m_nvic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 13df002ce4..a08a0fdc50 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -97,7 +97,7 @@ static int nvic_pending_prio(NVICState *s)
  * this is only different in the obscure corner case where guest
  * code has manually deactivated an exception and is about
  * to fail an exception-return integrity check. The definition
- * above is the one from the v8M ARM ARM and is also in line
+ * above is the one from the v8M ARM and is also in line
  * with the behaviour documented for the Cortex-M3.
  */
 static bool nvic_rettobase(NVICState *s)
-- 
2.35.1


