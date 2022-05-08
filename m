Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C951ECEE
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 12:42:24 +0200 (CEST)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nneMp-00031U-Jv
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 06:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nneFr-0007C1-2I; Sun, 08 May 2022 06:35:11 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nneFp-0000Gy-E4; Sun, 08 May 2022 06:35:10 -0400
Received: by mail-ej1-x631.google.com with SMTP id ks9so15422165ejb.2;
 Sun, 08 May 2022 03:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fHfalXba0yxdVT4jiCEAE2tAlEFkYyn4n43Ditg9AEs=;
 b=ACOBvNzNHsrHf/yA7Fcvz7jqjPZvqhcKxRqU8el5kXLuNYji5t8YmTcdRDUXO4+OCm
 Kuy6NSN0Nhh3IXIhv8ukb1unAMWLBupP1Hw5Wvc0B/r3v2Z3s9MGQRwc2JKF7Xl90LwB
 XbxxSJ9RMYyXWsjEnY5LiN3GPF3m+M3z6HBqryB3EWJpK7j68L6RWeaOWk1lfRybcCn5
 g0hhz0zM5DLxQNeudz4tcBhQti+GFBt81f72ZwMWFfS2xqle9ZbMpDr0lf3eRF7z3+76
 y65QQlriOV98r57XqYizltApycTRpRmoyDta2TjzojMUkWXXT/dN4YM81wdGtPLVOTd2
 Rk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fHfalXba0yxdVT4jiCEAE2tAlEFkYyn4n43Ditg9AEs=;
 b=tdfVx27dKu3sYRwHgJ4SJkKcRco1PxWcPE+strfBzjB9p21eVdzVtpCumEQD9dWBdD
 u3IedtWhO5FgFbjktVy/a+K1Ok0k5QJUMs0vKKWRhiNP8TP6d1l2TQY1clcjYhpSZtUW
 dpEqbtCTIO7YuyFTaXbCTReG9113oK++nlRNbkq7vtD2/+xazTHfp9gHWJdstMNmuC1y
 bqb+NtC006D227VGoU4otdKatsOCHshCGFUOlhs/eK7ejs+i/mwPsEGpAORTsNVR4YKf
 W/8VEPJiSxz1/2Y9A20Cvw7SIauKhCFWt4mLCwcqMGWGPAw0BwhKDoLzYoNuGKiHb7+N
 TOew==
X-Gm-Message-State: AOAM53182IRem24DLBJ0H5rQEksz1+VZL72N9pzbgrip9zGVR/Qzd3lp
 cSFfCKRSpKm7dYTdGhtJZwyOTfOqSJvtMQ==
X-Google-Smtp-Source: ABdhPJzd+9WjjFI6xaPch0LTE/D2MQbO4yvuYeYZjBCvmqy8zpnk+bA1p6jtPd/4TBs6FDzPki5H6w==
X-Received: by 2002:a17:907:6d93:b0:6f4:f84e:8cf1 with SMTP id
 sb19-20020a1709076d9300b006f4f84e8cf1mr10271680ejc.555.1652006103562; 
 Sun, 08 May 2022 03:35:03 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-246-161.77.183.pool.telefonica.de. [77.183.246.161])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f388f6f927sm3901948ejc.1.2022.05.08.03.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 03:35:03 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/3] PIIX3-IDE XEN cleanup
Date: Sun,  8 May 2022 12:34:29 +0200
Message-Id: <20220508103432.14874-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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

This patch series first removes the redundant "piix3-ide-xen" device class and
then moves a XEN-specific helper function from PIIX3 code to XEN code. The idea
is to decouple PIIX3-IDE and XEN and to compile XEN-specific bits only if XEN
support is enabled.

Testing done:
'qemu-system-x86_64 -M pc -m 1G -cdrom archlinux-2022.05.01-x86_64.iso" boots
successfully and a 'poweroff' inside the VM also shuts it down correctly.

XEN mode wasn't tested for the time being since its setup procedure seems quite
sophisticated. Please let me know in case this is an obstacle.

Bernhard Beschow (3):
  hw/ide/piix: Remove redundant "piix3-ide-xen" device class
  hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()
  include/hw/ide: Unexport pci_piix3_xen_ide_unplug()

 hw/i386/pc_piix.c          |  3 +--
 hw/i386/xen/xen_platform.c | 49 +++++++++++++++++++++++++++++++++++++-
 hw/ide/piix.c              | 42 --------------------------------
 include/hw/ide.h           |  3 ---
 4 files changed, 49 insertions(+), 48 deletions(-)

-- 
2.36.1


