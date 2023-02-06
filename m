Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6301568CA9F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 00:36:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPB1H-0000rX-Ab; Mon, 06 Feb 2023 18:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3jI7hYwgKClUJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1pPB0Z-0000Kg-Jf
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:34:55 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3jI7hYwgKClUJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1pPB0T-0006Dv-Hz
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:34:47 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 pv1-20020a17090b3c8100b0022c1ab71110so9418875pjb.7
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 15:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FYWw/qRjdcb7I6Rft+1C6I9O+sG+q2eO6RDEKUbphx0=;
 b=UCXXWM74nYoVXuvviTlBWaDwqwbTfaWrZFCsgE7AjZbuiXHP5JPbW+cnyl8lA2S7Ob
 b+KP+6+w8AHmNe4/is4nhMHkWdHDY71RNCGcISJRWQWDeLop/yT6URFZeA3reQu7y6o8
 2tbnyTaLWXEhPJbzX9PpGxAQYp0HzBEU0xDAiLHE6DvnvDRLZFxfvCKoeAZvzrmMLAn4
 QuX3PsNJbuNaMqNPRVQ0azu0VTRgSv9SZQ8yxLzgodKgeQRJaSwZVISqh70TWl3VLU/T
 8g4WpHB4RKYUB3NXrdK1oWgscjAjQYyHyzMwMHVOP5PZFNXe3xrx1QUtHNuzW15vWsI9
 ZC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FYWw/qRjdcb7I6Rft+1C6I9O+sG+q2eO6RDEKUbphx0=;
 b=W0OpzPePRXRJb01opOQx0ICFPN+wjO3WnLQn3PQT7uTy3bpV5Yl4c/mX4NAcvaVeGu
 ooDb7E3zMI4Qd52yzYjSGTJ42XBOx4CMxRTt1eZFMFMguDIo3OtRYI6Ydn0j/wClIxgA
 ZQUA0ZZK71XMFuc+pP8/HpSi59QbmMOIW5GcBb34xn31h5Ng1D/+BvJWwuEpUo45nxiJ
 2aaPhzrhKyB5noY3Vk/lxe+QnHm1Ww8LiZIG3UUB3RkC5F80Fzy+uzU7oUHxfn1Q2QUn
 I6CaudBNBb/NLpoo8gDXaS0lpOzaZDZLk62PZzmc/extGS26qKLEGb+bViUNvuk9VN3N
 YaEA==
X-Gm-Message-State: AO0yUKUMfDz2KN+xa7p528O1qJypVdAsrowXDcTgmdLQSeBLoyPlAfLB
 bdwtLsa+dj2NI5tBnuVbnxOruemqovjycA==
X-Google-Smtp-Source: AK7set8r8dkM+Biz3PZMPk1+UbWJpRSNvp9/Nb9xoaisk5060s3j+acHH8gKuKO8fuJi6SuQUHhT4Es8HQdPhg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:1001:b0:230:ca06:f0fc with SMTP
 id gm1-20020a17090b100100b00230ca06f0fcmr819685pjb.95.1675726476385; Mon, 06
 Feb 2023 15:34:36 -0800 (PST)
Date: Mon,  6 Feb 2023 15:34:25 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230206233428.2772669-1-wuhaotsh@google.com>
Subject: [PATCH 0/3] Nuvoton Peripheral SPI (PSPI) Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3jI7hYwgKClUJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch set adds peripheral SPI (PSPI) modules
to NPCM7XX SoCs. These modules can be used to
connect any SPI peripheral devices to the SoC.

This module will also be used in the next generation
NPCM8XX SoCs which haven't been merged yet.

Thanks!

Hao Wu (3):
  MAINTAINERS: Add myself to maintainers and remove Havard
  hw/ssi: Add Nuvoton PSPI Module
  hw/arm: Attach PSPI module to NPCM7XX SoC

 MAINTAINERS                 |   8 +-
 docs/system/arm/nuvoton.rst |   2 +-
 hw/arm/npcm7xx.c            |  25 ++++-
 hw/ssi/meson.build          |   2 +-
 hw/ssi/npcm_pspi.c          | 216 ++++++++++++++++++++++++++++++++++++
 hw/ssi/trace-events         |   5 +
 include/hw/arm/npcm7xx.h    |   2 +
 include/hw/ssi/npcm_pspi.h  |  53 +++++++++
 8 files changed, 305 insertions(+), 8 deletions(-)
 create mode 100644 hw/ssi/npcm_pspi.c
 create mode 100644 include/hw/ssi/npcm_pspi.h

-- 
2.39.1.519.gcb327c4b5f-goog


