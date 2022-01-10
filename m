Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA2348A23D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:56:10 +0100 (CET)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n72eA-0003qw-0U
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:56:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3jqncYQcKCmkcLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1n72c1-0002W3-1k
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:53:58 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=48891
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3jqncYQcKCmkcLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1n72bz-00039P-5g
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:53:56 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 p140-20020a257492000000b0060dbb88d8abso29840561ybc.15
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=WHrs4ZxHvfioFYxP1AN1QEOX/uscU1ZsN7lvDCuvhXA=;
 b=lNG0/+/LCFc+hS0PHjy6Dh0d8OAd6CAq7QkqleDVhkixX0PNyG1gimXxbjKT6KDeNt
 m6dXAAHDxhOHeuDGqpXrOJmuiy7HLlLO9xjD4Ct+ITklgiH0SAmOdWAMWlqEuX/EsU8W
 Rehe4UjDt2AYlYpIFJ3GUMrD3jySQLmf0lpJRX3IrSn38+fP0udWuK/IHwQF7Vssg3Ko
 sT2wguUfruP94rRQzAKdAjrJzEGtoV+aIPB/8ikqmdgZdmIfdocIW6i8gpPFCMBUuBBY
 1B0iql61Ev4oP+Vo6uZWDtgokWTWLzStw3REgEmNcRr66j8jHcZyaf3tIiqYuyqRrvUl
 qssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=WHrs4ZxHvfioFYxP1AN1QEOX/uscU1ZsN7lvDCuvhXA=;
 b=CwHO8yy9W6wcuEeadDL7Ydn30rgjAuXNSV4FBceJQLVC0L33XXZTvcLyAUS23ygMRM
 tR5PfBmDXnrGa24mEdhZQBS4AH4zKhUSm6HwnT/ongQzT3VgIDyh4vwTzm/ziEIj+k8L
 VEPbJP45uNS9y3PPWmRzV82qesyyRtluqf9ujoCgm8HJf9egH9iWPmm918RBksWZjdzp
 XEKu3tHK20uq56g2Sb34FtXCNsT6o6kv71ZlhxO2SCfGEW6j7P9ml9NlAFTV4onCsmwL
 Eo4IG5T3lyke5sqb/WeqyVAnovPYJZ29na2uEzBpuI0dpUCa3N0xUDTHp0RNY5y/i1vZ
 Vybw==
X-Gm-Message-State: AOAM530B7P4b6FXytTUkIUjGYWKDUDJNMSLpqO+k/u34LJ8SCb8/nYdl
 3YLNdVGf0uMqTYR04H2tmzsc77jthsVa
X-Google-Smtp-Source: ABdhPJwbCJlaAe+kRgcJatUcUTSCIvilkL3Mu23xI/k9ucp3K0hHCGE4db8tNlxifDTjN26BctUsUXH0CcRJ
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:55ed:4d46:15ea:437b])
 (user=venture job=sendgmr) by 2002:a25:6dc6:: with SMTP id
 i189mr2192936ybc.471.1641851278329; Mon, 10 Jan 2022 13:47:58 -0800 (PST)
Date: Mon, 10 Jan 2022 13:47:53 -0800
Message-Id: <20220110214755.810343-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
From: Patrick Venture <venture@google.com>
To: crauer@google.com, peter.maydell@linaro.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, shannon.zhaosl@gmail.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3jqncYQcKCmkcLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com;
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

This patch series introduces a new i2c module, namely the designware one and further enables this (optionally) for the virt-arm machine.

Chris Rauer (2):
  hw/i2c: Add designware i2c controller.
  hw/arm: Enable smbus on arm virt machine.

 MAINTAINERS                     |   6 +
 docs/system/arm/virt.rst        |   4 +
 hw/arm/Kconfig                  |   1 +
 hw/arm/virt-acpi-build.c        |  24 +
 hw/arm/virt.c                   |  55 +++
 hw/i2c/Kconfig                  |   4 +
 hw/i2c/designware_i2c.c         | 821 ++++++++++++++++++++++++++++++++
 hw/i2c/meson.build              |   1 +
 include/hw/arm/virt.h           |   3 +
 include/hw/i2c/designware_i2c.h | 110 +++++
 10 files changed, 1029 insertions(+)
 create mode 100644 hw/i2c/designware_i2c.c
 create mode 100644 include/hw/i2c/designware_i2c.h

-- 
2.34.1.575.g55b058a8bb-goog


