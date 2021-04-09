Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916AD35A7C5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 22:21:37 +0200 (CEST)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUxdI-0004xV-J2
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 16:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3u7VwYAcKCvIpYhnolYaiiafY.WigkYgo-XYpYfhihaho.ila@flex--venture.bounces.google.com>)
 id 1lUxWu-0008OC-2x
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:15:00 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:37911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3u7VwYAcKCvIpYhnolYaiiafY.WigkYgo-XYpYfhihaho.ila@flex--venture.bounces.google.com>)
 id 1lUxWq-0000EQ-F8
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:14:59 -0400
Received: by mail-qk1-x74a.google.com with SMTP id k188so4074190qkb.5
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Fzzl4rCkNO9vRv+OpxpwcwxkFHE7+hBWsSGwCKZGktM=;
 b=vr8lOFqxAx2TUDdnYEQljEPB2Ir44MLgO4/q/dh/SEQUeyLhNBQ2yEsNbBsEC0bsK0
 pfRd6ihYhdq3ny4uvsEEQipaYiR3OEnqq2fnBA8GmbJ8zEQw5g2B57oqffifq3L5nCPh
 ervFVjSEOZ+9q1vUosruUxFFpWQi0M7SQ2Z1o75vHECveZEOnv2s5N7A5S5n1lDAki3V
 m6eW+JGBh7JJn6/m5FYeoI7KP/FsHBhKgLPG80RrLZGWCaOPPt8C60cTClNDBAuEShnD
 pLac3APGmLfLKVfstOXL4QgKjRugFwHvBsI1fVD7c8Mo0hifM4wi/GosIbLCJfYqBTCJ
 Ppcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Fzzl4rCkNO9vRv+OpxpwcwxkFHE7+hBWsSGwCKZGktM=;
 b=KhbePgrRYSeb8fUNOgnv0EZCrebf0Eia1Ipc9MMXqlJig44K2sVs12rs2FWY5USykE
 FlkX0pWm25AKBu8ZSdTJC2fXLDQwLuMmqe4vIWcuYsnKC0HOsXUjxgSGWlZtv+Jh6/P/
 BdnyGYgZ7WBOcGlPZ/iZGD3V3zrHCyatYyw0H95z16wW1uCtEycyfcEYDsMU7RYLXWhn
 NtKbDvVjPERMcVRQeSnUnH6j7zXYE3A35FDFIfkVko4sILOQnhx758Z1XLZdJ1/xpYcr
 HhkI8LUHT50thkMAfEfx1/YJXMAOM0tTwdRb9qzYQ+1MQGU2O1nzyvCCARuO+FekR2vp
 /k/A==
X-Gm-Message-State: AOAM531RCmbzM2Wt8JaozrJ7M0VrMube67i2MtoujdUuZ6NRicmkRC05
 MMBunwdVYKbZfjEFwLALSTQH5UXblLuI
X-Google-Smtp-Source: ABdhPJxC2FDt5icAJQYq4DzRdVtjSo/wSsZjmOtHufBgrHfhm2niywfhOjJzV96K3Jnob3CYjnxlr00pYvue
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:ec3:6619:183b:36d8])
 (user=venture job=sendgmr) by 2002:a0c:e88a:: with SMTP id
 b10mr15969844qvo.21.1617999291042; Fri, 09 Apr 2021 13:14:51 -0700 (PDT)
Date: Fri,  9 Apr 2021 13:14:39 -0700
Message-Id: <20210409201443.111197-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v3 0/4] hw/i2c: Adds pca954x i2c mux switch device
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 f4bug@amsat.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3u7VwYAcKCvIpYhnolYaiiafY.WigkYgo-XYpYfhihaho.ila@flex--venture.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The i2c mux device pca954x implements two devices:
 - the pca9546 and pca9548.

v3:
 - fixup comment with missing end parenthesis.
 - removed superfluous object cast.

v2:
 - the core i2c bus now calls a match method on each i2c child, which
 by default will only check for a match against itself.
 - the pca954x device overrides the i2c device match method to search
 the children for each of its buses that are active.
 - the pca954x device now owns an i2c bus for each channel, allowing
 the normal device model to attach devices to the channels.

Patrick Venture (4):
  hw/i2c: name I2CNode list in I2CBus
  hw/i2c: add match method for device search
  hw/i2c: move search to i2c_scan_bus method
  hw/i2c: add pca954x i2c-mux switch

 MAINTAINERS                      |   6 +
 hw/i2c/Kconfig                   |   4 +
 hw/i2c/core.c                    |  55 ++++--
 hw/i2c/i2c_mux_pca954x.c         | 289 +++++++++++++++++++++++++++++++
 hw/i2c/meson.build               |   1 +
 hw/i2c/trace-events              |   5 +
 include/hw/i2c/i2c.h             |  16 +-
 include/hw/i2c/i2c_mux_pca954x.h |  19 ++
 8 files changed, 381 insertions(+), 14 deletions(-)
 create mode 100644 hw/i2c/i2c_mux_pca954x.c
 create mode 100644 include/hw/i2c/i2c_mux_pca954x.h

-- 
2.31.1.295.g9ea45b61b8-goog


