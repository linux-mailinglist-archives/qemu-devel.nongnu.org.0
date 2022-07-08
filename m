Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC0156BAA1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:28:34 +0200 (CEST)
Received: from localhost ([::1]:55628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9o24-0005nw-Mu
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzA-0002xk-GR; Fri, 08 Jul 2022 09:25:33 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:38622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nz7-000715-B6; Fri, 08 Jul 2022 09:25:32 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 cb12-20020a056830618c00b00616b871cef3so16196090otb.5; 
 Fri, 08 Jul 2022 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6w8PXzh4/K+L+S7xwVaG5RiROAiJ1UZvyFsnBzRMSes=;
 b=hQYE3vEmHX8Q7Ms+pBaLDvF1VlbIXqJpfxB5wAFMDB252nfwxU+FJNLNyHhvNH+nDR
 bM3+gzsNXGoW6x8U9k86f7nTIU9BrMg66aBDd6wuv9B86k2KPJITKttga5bB7LBXHyUL
 TC0H44GKEcShOKx5vWOAcUGszkTPNy18Mt+wQJY73qO3Ku8eYCYTiTKz2X1dUgAehagh
 B9KeJrDIdIDSvSTSAUaa6+VJzqrJIL4GuB/YbkX7hS/Z+xyo90KNOCb3nEUclYSFqFgc
 QLGbQcQJbW6eo+Lubw4FRNo9h+2/bjT/v8ty7z60EOxwzy144taCG2PEEIMcgb53ciVj
 Jo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6w8PXzh4/K+L+S7xwVaG5RiROAiJ1UZvyFsnBzRMSes=;
 b=PYsZGmiBWZmvRdhxk7d14NbKkUanVyOIOVuyMnxgAbgaNldFBzDhCeieId4VJsh+dy
 zI41bHHJN9AjYoo+HuTSjaLpT7mhKgzci3C4qGIBPHq4qvGCFZ+I/AE3Zw4ABVOy5Ztc
 NGjju+vIxYGfXLwqwXPqDD68ZitlfIy4VcysfDxVCQ64HfutIXi1tpBEikKivibi0QLa
 faYWgDhB8iEbjfE0dGW4vFCQSYZG7mrOz4CWC9yp5y8KPiAJkRiUie2nbOGMcRglllOy
 Xdn6T4Ebs5RuU70fd0YT0bjYL9olFJgRNUstgYUCYwT4TaspDQSvUamksOVTChESBr04
 n66A==
X-Gm-Message-State: AJIora+7FFThA5ZWOhKXedYJ+YdmkZKFTDZztF4yUIyU/gkjbTjx3mNb
 tQJD/TM+b7uCXO3/EKIvWMyyixMUfNE=
X-Google-Smtp-Source: AGRyM1vqa8dUYk/1404Z30Q+JKDyD02qjsymOA37/ORnmTS0Dpp1WG+aFUdV/XBLFelRX73i3mJ7TQ==
X-Received: by 2002:a05:6830:14d3:b0:616:e484:a103 with SMTP id
 t19-20020a05683014d300b00616e484a103mr1542856otq.168.1657286727807; 
 Fri, 08 Jul 2022 06:25:27 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 f108-20020a9d03f5000000b0060c00c3fde5sm18435797otf.72.2022.07.08.06.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 06:25:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 00/10] enable pnv-phb user created devices
Date: Fri,  8 Jul 2022 10:25:12 -0300
Message-Id: <20220708132522.581382-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
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

This series is built on top of

"[PATCH v3 00/12] powernv: introduce pnv-phb base/proxy devices" [1]

that is under review in [1]. I'm sending this last part of the pnv-phb
rework to allow everyone to see what's the endgame I'm planning with
this work.

The main differences between the approach taken here, versus the approach 
made by "[PATCH v2 00/16] powernv: introduce pnv-phb base/proxy
devices" [2], is:

- the Root Buses objects are now inheriting phb-id and chip-id. This
turned out to be a clean way of keeping the code QOM compliant, without
having to do things like dev->parent_bus->parent. All the attributes
that the root port needs are found in its bus parent;

- the logic exclusive to user created devices is all centered in a
single helper inside pnv-phb realize(). PHB3/PHB4 realize() are
oblivious to whether the device is user created or not. I believe this
approach is clearer than what I was doing before.

I'll respin/rebase this patches depending on the amount of changes
we have during the pnv-phb proxy device review.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg04347.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg06254.html

Daniel Henrique Barboza (10):
  ppc/pnv: add phb-id/chip-id PnvPHB3RootBus properties
  ppc/pnv: add phb-id/chip-id PnvPHB4RootBus properties
  ppc/pnv: set root port chassis and slot using Bus properties
  ppc/pnv: add helpers for pnv-phb user devices
  ppc/pnv: turn chip8->phbs[] into a PnvPHB* array
  ppc/pnv: enable user created pnv-phb for powernv8
  ppc/pnv: add PHB4 helpers for user created pnv-phb
  ppc/pnv: enable user created pnv-phb powernv9
  ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
  ppc/pnv: user creatable pnv-phb for powernv10

 hw/pci-host/pnv_phb.c          | 166 ++++++++++++++++++++++++++++++---
 hw/pci-host/pnv_phb3.c         |  50 ++++++++++
 hw/pci-host/pnv_phb4.c         |  51 ++++++++++
 hw/pci-host/pnv_phb4_pec.c     |   6 +-
 hw/ppc/pnv.c                   |  30 +++++-
 include/hw/pci-host/pnv_phb3.h |   9 +-
 include/hw/pci-host/pnv_phb4.h |  10 ++
 include/hw/ppc/pnv.h           |   6 +-
 8 files changed, 308 insertions(+), 20 deletions(-)

-- 
2.36.1


