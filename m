Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FF32EFF9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:25:38 +0100 (CET)
Received: from localhost ([::1]:53138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDGj-0002Zk-I2
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCW-0006aR-PA
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:18 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCU-0007CQ-Q3
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:15 -0500
Received: by mail-wm1-x332.google.com with SMTP id n22so1950760wmc.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mi2rSQJs4eqFRXXrVqjol3x6hXDYoHuHe4B36vlHE7o=;
 b=f44OTkDLfrXXYyLtjdnn7zmOKXqLmukFVFFpSGFtLhi7+2pNXYPpfpxLFEXJXESzpM
 Kvp719yfQtYeCFGLsoQUefYu9mRoI5CMVs6S/0AmB83NkzL4wgKmletpGOlNOGKZaNey
 YFVxPXnu7stD1wmLVQXOiBGCBtSRcYOGDAwUU2OktLA8b2XMAiv/VlHoOXnZlKm6qLcF
 xBxLMQK4Zqc+VrYLYB81aPWtpJID3C+ciU8PF6cc3BzDFIqDDADzD2021pHcm9E3w+zM
 LMpA9kTj7GPkqBCN3y1NxB2Z4HaiIIrHrfPklc/BHe4chhm4aOq41fTRIqwbkVgCUR87
 JEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Mi2rSQJs4eqFRXXrVqjol3x6hXDYoHuHe4B36vlHE7o=;
 b=j0tjqgzdnOUWu5ihXlajTSi3mUNpKsjeFSBAniGAXvb/wsefXVWOIxqvqLUWAs8tRE
 NbihR3imRvJgQtocvddem0+vy/tTMkL36Pcp7cWjBaDo8g8kjwMLa2fVgetaOcGITe0j
 JcPHtVa3tiDLTRUBeXP27BUfmMjZtJxJ1ogReP8q+JAH5VKyQ+RiWkm/BguR2yX1U7z6
 N3k8loTflcjSEIhzyku9ki0eCqY5kNZVWnSNoigFMP6JzvbtSrkS5QbNEvQNcjx9pG5w
 aKrxrmFrif6MVd4fB6oblYplC7W8+suxTo8AvO3AzTgn+vaKF5/E0UJrCh9GP6/r6mn6
 a72g==
X-Gm-Message-State: AOAM531JfLIJO2aCQoX4r6qkZeXxoZTwwJyB484Q5dLyC2AiTI+SllQT
 lxJqQoGDsLGAprnnMfZodxEmlg0S2pA=
X-Google-Smtp-Source: ABdhPJzIYrYiAuJisegvURNxauduhvXOq08RWBMsHBGG/vNXq3YJlBy+8G5gNTAkiL39r6AzuPDEKg==
X-Received: by 2002:a7b:c151:: with SMTP id z17mr9756783wmi.189.1614961269598; 
 Fri, 05 Mar 2021 08:21:09 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q25sm4869414wmq.15.2021.03.05.08.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:21:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] hw/mips/gt64120: Minor fixes
Date: Fri,  5 Mar 2021 17:21:01 +0100
Message-Id: <20210305162107.2233203-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial fixes extracted from another series which became too big,=0D
so I prefer to send them in a previous step.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/mips/gt64xxx: Initialize ISD I/O memory region in DeviceRealize()=0D
  hw/mips/gt64xxx: Simplify ISD MemoryRegion read/write handlers=0D
  hw/mips/gt64xxx: Fix typos in qemu_log_mask() formats=0D
  hw/mips/gt64xxx: Rename trace events related to interrupt registers=0D
  hw/mips/gt64xxx: Trace accesses to ISD registers=0D
  hw/mips/gt64xxx: Let the GT64120 manage the lower 512MiB hole=0D
=0D
 hw/mips/gt64xxx_pci.c | 67 +++++++++++++++++++++++++++----------------=0D
 hw/mips/malta.c       |  7 -----=0D
 hw/mips/trace-events  |  6 ++--=0D
 3 files changed, 47 insertions(+), 33 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

