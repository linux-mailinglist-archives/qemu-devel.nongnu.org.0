Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A25A8726
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:58:33 +0200 (CEST)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTr1-0007Ut-P1
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSq3-0006Zx-Nt; Wed, 31 Aug 2022 14:53:23 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:33743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSq2-0008G4-2X; Wed, 31 Aug 2022 14:53:23 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-11eb8b133fbso21863496fac.0; 
 Wed, 31 Aug 2022 11:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0QDM/cXafZEr3+gKOTmsrpRzIcFXxr6qp/Pn9FU+/RU=;
 b=S+h2ebaM/y/hssDMEJfs2P2RndEe28BXvLMVhYETsfrvdJIAN8S2Qlf60PchTSWtlX
 +KRoIkbZnmHI+RkcERFsxxYFXPf+aSPiKiQvIAk3Q+EvdmCNL1WeBVkN6+4Igbtya4c1
 nHXo1qpv90DcCPGPJ8Eo3n+nGM8Z5mteYDZzFfcDQNqXvfnP04stIy08vnW9KgdAHtRA
 69CFOWFTRx+W580SOeD1xAqjCbjZEfz8z4vsFs/1fre9lBrOe076na4H0rF+ZFz2qOgp
 RfX/YOoW4AE4nCaMjypYvL/spm4WvTkbGpg18FYJgznucP1xPO6eM48B7oqtzL2cqGG4
 sXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0QDM/cXafZEr3+gKOTmsrpRzIcFXxr6qp/Pn9FU+/RU=;
 b=Ejo4nGZ4aEiLdzHccmKaqLdJfXcrzbzWnVUZASHzvEy9WiaLcTY0HNz8HRldSkjH4y
 Om9Sx6uzRjMB9LP8N8CTLBaEh0htDkdE4fC0BqaSnBmv17HjJB3boPuY7/ut5XR2CYuV
 t1ATKnBvufezeLIvHOI418poN1W0KVh5Da6W8k8ovX8n5CFo162ZgFlJkU9s530p02PY
 UlD1s0Ni7ug6DeAQPiRlL1VO0Nm3KTT3/nvDC89ado3Iic8pXMdlSBSRfzfhpdE4Dz3u
 EIziq59W0n5agVrnOcpna7aozADyY9RY7EOwH0NAryxH41auPwOCh2C+YHabezDnC8o0
 BM7Q==
X-Gm-Message-State: ACgBeo3AwlV30qnV0YkX0sjcgrh6EgXb3RuwdjFjA5bIRpJStB1tFzEV
 X5ngYowXfKOacIeuUxIKlqTBQUL4ICo=
X-Google-Smtp-Source: AA6agR79JcczUE1GvB4a+6lMKjMHFQcXQ0A2Ec90NUqiXK6q/HJ3ZDts1oipy4uKBd4LQrmFrLGuqw==
X-Received: by 2002:aca:1910:0:b0:343:5d30:5d1 with SMTP id
 l16-20020aca1910000000b003435d3005d1mr1888186oii.287.1661972000738; 
 Wed, 31 Aug 2022 11:53:20 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:53:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 57/60] hw/ppc/sam3460ex: Remove PPC405 dependency from sam460ex
Date: Wed, 31 Aug 2022 15:50:31 -0300
Message-Id: <20220831185034.23240-58-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Now that shared PPC4xx devices are separated from PPC405 ones we can
drop this depencency.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <cf6c1d280f830beeea41128595c8c026d5126d2b.1660762465.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/Kconfig    | 1 -
 hw/ppc/sam460ex.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 400511c6b7..205f9f98d7 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -58,7 +58,6 @@ config PPC4XX
 
 config SAM460EX
     bool
-    select PPC405
     select PFLASH_CFI01
     select IDE_SII3112
     select M41T80
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 348ed27211..850bb3b817 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -25,7 +25,6 @@
 #include "elf.h"
 #include "exec/memory.h"
 #include "ppc440.h"
-#include "ppc405.h"
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/reset.h"
-- 
2.37.2


