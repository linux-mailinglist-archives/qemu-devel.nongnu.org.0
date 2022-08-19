Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809AD5995C9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 09:14:48 +0200 (CEST)
Received: from localhost ([::1]:56842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOwDP-00043O-6M
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 03:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1oOwAS-0002QG-RL
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 03:11:44 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1oOwAQ-0001QQ-RM
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 03:11:44 -0400
Received: by mail-pl1-x62e.google.com with SMTP id u22so3413974plq.12
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=CI1AKmkemxUcLvSjLX87Pw8BxdL3SvMWjUkCdZTOrHc=;
 b=DQ7xXZ2ZRQcFhSiNUUVu3mrujQfO0frFmie7Z+U6GOq4BhCip7kMWh6Oz2Jvx5qZ/3
 fH8ZIuWLwNWnmTddfAegtgceqQIAGP+umsnzFqWqsDey0ii/nhdSvq3E+0p0+D5G1eDD
 loFRB8CIQ23odGki1R0mRfvwKTjbHo+lVvbcQ8IkOq4P2iyat9xme3FSQw7Ig8FNv0ES
 kWTGNB3CdvsqrnSJdOSS5MsSPVRBSGNZXbYCizBauDu8zdgouYNJ+tyB9vNOX7nKQSVg
 ySCNrl+UecLNi2qEtguiQUlVA9TFx3H2EDVmAZXfUX1rQn65UVxY0isBQOOTnsHuayoj
 wrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=CI1AKmkemxUcLvSjLX87Pw8BxdL3SvMWjUkCdZTOrHc=;
 b=p2b+sTQ8ppmaOl8YF4Z8J/6sxsF6jte+528n4gx/k1vIas0fKT7bIAejxMqBCxbqvo
 DFAH3uNXg6uUwPaxz9/X4cC4G3HdmfH5vL+497A1QSO2g/BHAXubV2ZxBwgTrf5XbJ0T
 Y+ZAI4bcv4NUcURzS7u2d0gBYpAQkmcDC1SvfTqV5k3B9o1FjQ4rHGFnQpRIht+UyJ2T
 iQiGDMkC0qvATuL+H4YmkfrRQdL4axgiviKATIjsl9cvjsiRZFfd89mV0BbbbYNHRN9W
 5xawwPXtbHwuXszA/+98MG8XPewbnDxLAJEDYh0+GL/k1/HtM9bMfnt0qK1tVgO73eVn
 OzTA==
X-Gm-Message-State: ACgBeo1q8TgrZXU0fWKiZ/OVu3OJrJl3smHseso8SNC63KnX0ResCc0b
 8faBc4ba8weQyS/5AYoTNNPjC85llCkLsQ==
X-Google-Smtp-Source: AA6agR7kxnK+R9BbzMHyc0bYjllxT+Q3vJaVHx82DVUrNvLgKqvhwV967/8CCbTIV/tbkyII2GNQUA==
X-Received: by 2002:a17:902:c943:b0:16f:15a0:d497 with SMTP id
 i3-20020a170902c94300b0016f15a0d497mr6268771pla.80.1660893100303; 
 Fri, 19 Aug 2022 00:11:40 -0700 (PDT)
Received: from gamma24.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 ij25-20020a170902ab5900b00172bc4e0fb7sm1303192plb.250.2022.08.19.00.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 00:11:39 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Tommy Wu <tommy.wu@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] include/hw/riscv/sifive_e.h: Fix the type of parent_obj of
 SiFiveEState.
Date: Fri, 19 Aug 2022 00:11:36 -0700
Message-Id: <20220819071137.1140627-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=tommy.wu@sifive.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Fix the type of parent_obj of SiFiveEState from 'SysBusDevice'
to 'MachineState'. Because the parent of SiFiveEState is 'MachineState'.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 include/hw/riscv/sifive_e.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 83604da805..24359f9fe5 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -41,7 +41,7 @@ typedef struct SiFiveESoCState {
 
 typedef struct SiFiveEState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    MachineState parent_obj;
 
     /*< public >*/
     SiFiveESoCState soc;
-- 
2.27.0


