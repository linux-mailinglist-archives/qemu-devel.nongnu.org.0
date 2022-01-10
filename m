Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603E489ECB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:08:40 +0100 (CET)
Received: from localhost ([::1]:46860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6z5z-0000zc-B2
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:08:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3OnPcYQcKCqccLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1n6z23-0006WB-WB
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:04:36 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=56140
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3OnPcYQcKCqccLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1n6z22-0007r2-MS
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:04:35 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 v48-20020a25abb3000000b006113ce63ed8so4199694ybi.22
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 10:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=eoLSUbqCHYhNBcGZNETp4ZcN5SY3q8dlJ5ePorrnr6o=;
 b=KdeScDcJsHejLz/NcL9L4GlrxRzAU0Pk6D+Y85wgIiigPDIsfoPbgNXtwfhzjdb+ee
 stdd7u71oYYK/2zQQPwcEt38u55+/GvKC2zQURyqC28JbkZPCwE8adcR4HEGz2gSG+Gp
 6/GZGL6XH458aMwZW8STdFcooPW45uUJqS3YQa6KTyTiSZrMKeBopg2BMdmvnrrwEzjw
 WugLVNx69auJv+ODou2Ee6rHVa9j2H8m4VYVoJihi8O5+ppycuyREuGAAPFoOCCxYcrF
 voMl06bMgs1HF5dqa46crGj9zmfEaFVRbhvuu+dAX3hIAPxg0ZH/yr3NOMkjgGcIzfEd
 zHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=eoLSUbqCHYhNBcGZNETp4ZcN5SY3q8dlJ5ePorrnr6o=;
 b=s6RZGX9W8+Ls5Ituq+EBRXcpp3+DWtqdGXHibUUHc34NS/qnj+FSE5PtVmAsEGYba6
 vEgBRTbkG03S/pxGTgVq/qGyderksZpitmghiWv3GRbYdm7I6gRSuECOcvX/B1Cg+Bgd
 J6IhoWBp4hWvRKtHCFucUEHt3wntYlq2Nx45DhLJGMWv5wckG8nNBUpSiTcRyNswwVlS
 0kdUsTzRtLDPMFeC6NOL48vMvyXLH1G+JDOXDGCrDkU1ZyFBklahLimJaDjiEXyPG/Uk
 pUHRUhGA43aglx7Ztxu1Wnvfo//xbOwmBrnqIxEfjy5qcket7n1k0rD09NigiRSCv/Pq
 WOkQ==
X-Gm-Message-State: AOAM5332uiab0AovhHWiX8IksbvoU9fv7Yf3ba0BSF1fHBzVGlbj1v7+
 QwdhnWfRrXjro+r9iPz/6QqfLOm/aw/s
X-Google-Smtp-Source: ABdhPJx+iQ9gbYjmX5qgSAWfRgvdIUCjyEm0KUDJRKGHHUpF7AKiGPcM8M+gXBwg3syYTw2A3dTQauVykzK3
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:55ed:4d46:15ea:437b])
 (user=venture job=sendgmr) by 2002:a25:aab1:: with SMTP id
 t46mr1053212ybi.174.1641837370768; Mon, 10 Jan 2022 09:56:10 -0800 (PST)
Date: Mon, 10 Jan 2022 09:56:05 -0800
Message-Id: <20220110175607.591401-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH 0/2] Introduce PCI mbox module for Nuvoton SoC
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3OnPcYQcKCqccLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

The PCI mbox module connects to a host such that the host can interact with the BMC SoC as a PCI device using a chardev.  This chardev portion will be in a follow-on CL with the corresponding documentation.

Hao Wu (2):
  hw/misc: Add Nuvoton's PCI Mailbox Module
  hw/arm: Add PCI mailbox module to Nuvoton SoC

 docs/system/arm/nuvoton.rst        |   1 +
 hw/arm/npcm7xx.c                   |  15 ++-
 hw/misc/meson.build                |   1 +
 hw/misc/npcm7xx_pci_mbox.c         | 178 +++++++++++++++++++++++++++++
 hw/misc/trace-events               |   5 +
 include/hw/arm/npcm7xx.h           |   2 +
 include/hw/misc/npcm7xx_pci_mbox.h |  63 ++++++++++
 7 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h

-- 
2.34.1.575.g55b058a8bb-goog


