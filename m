Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8863B61B5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:37:26 +0200 (CEST)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsO5-0001ZI-U9
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsMd-0007bz-MX
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:35:55 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsMb-0000a9-Pz
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:35:55 -0400
Received: by mail-pl1-x629.google.com with SMTP id v12so9039574plo.10
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y0WrYhrVDzzZszaEKWCoSlG0dPqEZIEruspn65dC8sY=;
 b=luYA2vp4zVgAkXa3nBzd0nlcaqnYnGkGZSmpomPlk63p6eBIAXO/1uT4nIqSHM8+ux
 HwNui+BcD/d/xZXDJLtr6VwJalBOAVd/+3vKNPdovjfbPjI4wyzhzXPbnRtSl8nmYJDf
 yvxuW8KjFAUFbBR9Ex1skrqBDxRp3bkPZhCfA52VvI45gwVrVt82XXFCWkM4hVT6rNWP
 0OwTs8qrx2Cv4ns9Ii/6mAuDdG+1B3K+wkjW9C9qvHrSp7MpcbCRfs7rEaET127yxme/
 YAZOj9+4wG6LmElUJfa5oTTk9Ldz2W9aq8C83fovKBueWoyRgC27QQQOUDSVTWLO1Wdr
 AQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y0WrYhrVDzzZszaEKWCoSlG0dPqEZIEruspn65dC8sY=;
 b=DaZVyJ/gWo9eQdTVaPvFqLPp+o3hMkes0F8sRDKaX8HK2Zn2DmV1hN4truruFoGl8n
 xPd2Kxo7yVPjkiKDsWU8R8SoZNGpLqyJ7SKoHHI4PSlhzc4ghfe5wMeXOZIRCpYKbRUx
 eIAKGyfATDvdb47t6wMxnDTHwLAizFACNA0h6oV0QLQEINr+mhoUNCVEcWUyn4Dnh/ae
 IIlQpPI90Tsbl5j7OvGeXS1KMI12FLG1Tj0uIEHFX2tGBAe5onYiHP9oaIioFAJRGjPA
 7SK3fMFOAJQzYot94YirBjjlUJ/2Efvtrtz4OyTpMeZylqAuRn827z7hKKswJll682Wk
 cctw==
X-Gm-Message-State: AOAM530VXIjj/uY8Fl5zC0dL4jkIzx9qCmL8cMWEDJvIMmsr+LIANMqy
 7SGzjmWT0LjnccTF9N0WTl9jOnyH3+gp1Q==
X-Google-Smtp-Source: ABdhPJyeniWhBuyihBjE7zJIwMMRXc5v7EQHSgRi2CdBIZbyDT4XyHu07zpNLltfPPqwUuWF7OunPQ==
X-Received: by 2002:a17:902:c641:b029:122:6927:6e50 with SMTP id
 s1-20020a170902c641b029012269276e50mr22871002pls.6.1624890952320; 
 Mon, 28 Jun 2021 07:35:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k13sm72779pgh.82.2021.06.28.07.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 07:35:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] target/alpha patch queue
Date: Mon, 28 Jun 2021 07:35:46 -0700
Message-Id: <20210628143551.2870006-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 687f9f7834e30330fd952f1fe096518509ff8ff7:

  Merge remote-tracking branch 'remotes/philmd/tags/mips-20210625' into staging (2021-06-28 09:44:42 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-axp-20210628

for you to fetch changes up to 9d14a0428012b0bb7969aec512f2357247a86236:

  target/alpha: Honor the FEN bit (2021-06-28 07:27:55 -0700)

----------------------------------------------------------------
Fixes for NetBSD/alpha:
  - Provide a proper PCI-ISA bridge
  - Set PCI device IDs correctly
  - Pass -nographic flag to PALcode
  - Update PALcode to set up the Console Terminal Block
  - Honor the Floating-point ENable bit during translate.

----------------------------------------------------------------
Jason Thorpe (3):
      hw/alpha: Set minimum PCI device ID to 1 to match Clipper IRQ mappings
      hw/alpha: Provide console information to the PALcode at start-up
      hw/alpha: Provide a PCI-ISA bridge device node

Richard Henderson (2):
      pc-bios: Update the palcode-clipper image
      target/alpha: Honor the FEN bit

 hw/alpha/alpha_sys.h     |   4 +--
 hw/alpha/dp264.c         |  57 ++++++++++++++++++++++++++++-------
 hw/alpha/typhoon.c       |  20 ++++---------
 target/alpha/translate.c |  75 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/alpha/Kconfig         |   4 +--
 pc-bios/palcode-clipper  | Bin 156328 -> 153728 bytes
 roms/qemu-palcode        |   2 +-
 7 files changed, 130 insertions(+), 32 deletions(-)

