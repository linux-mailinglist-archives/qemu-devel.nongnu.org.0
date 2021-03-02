Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2E2329B5E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:11:05 +0100 (CET)
Received: from localhost ([::1]:56880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2vg-0006Is-F9
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lH2uf-0005Gp-5M; Tue, 02 Mar 2021 06:10:01 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:38116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lH2ud-000776-GP; Tue, 02 Mar 2021 06:10:00 -0500
Received: by mail-lj1-x22c.google.com with SMTP id 2so18870359ljr.5;
 Tue, 02 Mar 2021 03:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=htFR9uzoLLfGusEJYM4mB0hYq4gMTy1rfpWgY7BIFjw=;
 b=a8mvA+v6Yg3pI+chsmAO9PtAu99DW8MZXjdDKpV6pqP0XFHfU9h3VwRyBbgjeaVV7r
 4jCEsjyCqPVJlDLpGlD03uBgcml9KEAGtfNjWLpWzTjArN3rwShJ3hFUOfQB6bC8UIMX
 AqJ3+dJvFFwhQB4inp0O62xXElzDbWhJLf1LmlJ5YOP/wZNa5ntRBBe+MzT75ZBAEGJ6
 791Q+G4n8ZuwHywtk9z63C8dhjidpMK5NMRSSbm4KPZkoBEAd20DdKwKHhtNLY+wzLB9
 QnY4OO9R+XlmvbS/erwMWt7l/TeyIj6aSQEH3pK4vcrEGppLhZalwbdvxS224SaxAOlZ
 XfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=htFR9uzoLLfGusEJYM4mB0hYq4gMTy1rfpWgY7BIFjw=;
 b=XIgnSUTmeVTHNR7uvCqQsdEk1rZ5B0chjOtivIuVw+GmzRPBnhOLKBKOL++CHHFr/l
 o0HwytipcEEjcCKXuP0AJEbeN5Ut47YKsZKE7TTLdXLVNv/iYgZ1E3ymN1N4CG7K2HaN
 P+cy74aUgjjlF2RJGaXNeBFkGzm7bKkco6qFs017E6a6ZTgKqMGPnpuCxLxObUb5D1dq
 jBAkHL67Hyje6pGTO+il8ZFXBuqPd0mzxNVWw+47262hDYTkiO+vyoCKvy/WexpxBVmh
 6VIBeEtZL0VoRNmZiRd3B4cIUMC7e4LA1LVCev/hN/HqRw7XBGz9cmZY+ryBOJp8VATw
 mk2A==
X-Gm-Message-State: AOAM530n8f4sIkpXIW1edotgaGzyB3XfhSrS7Q09uRS7V3hJuBGp/FoL
 Jt8j5x2o03+hTNVvmGKKFr8UC6vKyWO56Ez5
X-Google-Smtp-Source: ABdhPJyhMdMZzK0lshyA7gpRTRkSsngD9QqE7vs/5I8E+Et0Psnt5OcqrbIpA6XGQ2QJIg//Rv/AJw==
X-Received: by 2002:a2e:330d:: with SMTP id d13mr11650405ljc.361.1614683396763; 
 Tue, 02 Mar 2021 03:09:56 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id v9sm180601lfd.195.2021.03.02.03.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 03:09:56 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] hw/arm: versal: Add support for the XRAMs
Date: Tue,  2 Mar 2021 12:09:53 +0100
Message-Id: <20210302110955.1810487-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22c.google.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 joe.komlodi@xilinx.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This series adds support for the 4x1MB Versal Accelerator RAMs (XRAMs).
Most of the controller is dummy, but it's got enough to make firmware
and some of our test SW happy.

Cheers,
Edgar

Edgar E. Iglesias (2):
  hw/misc: versal: Add a model of the XRAM controller
  hw/arm: versal: Add support for the XRAMs

 docs/system/arm/xlnx-versal-virt.rst |   1 +
 include/hw/arm/xlnx-versal.h         |  13 ++
 include/hw/misc/xlnx-versal-xramc.h  | 102 +++++++++++
 hw/arm/xlnx-versal.c                 |  36 ++++
 hw/misc/xlnx-versal-xramc.c          | 253 +++++++++++++++++++++++++++
 hw/misc/meson.build                  |   1 +
 6 files changed, 406 insertions(+)
 create mode 100644 include/hw/misc/xlnx-versal-xramc.h
 create mode 100644 hw/misc/xlnx-versal-xramc.c

-- 
2.25.1


