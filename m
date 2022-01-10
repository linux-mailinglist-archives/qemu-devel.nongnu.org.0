Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2984C489EB1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 18:55:26 +0100 (CET)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ytB-0001Xx-9h
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 12:55:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp3-0007Fv-R2
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:09 -0500
Received: from [2a00:1450:4864:20::52b] (port=34442
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp1-00064p-NJ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:09 -0500
Received: by mail-ed1-x52b.google.com with SMTP id u25so56803370edf.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 09:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QCOtE9+v3wBr9409lbw5s1G3XAXvyPfK1PegRWjwFqM=;
 b=hSLMnrRFzLELdh5TCQRRpg0tRVGtOBSsWn/vmKTiy9dFMqxIzNpTHpI3Jk7FWst2iq
 whLGmoisNGda51cP4edKw1lrlUR7rfwlYz60+fxg/iExScGioX8WJFS8rtOtSy73xlLO
 Xc1kokKocuv0xouVvHUSppvb+zzPxHftbTP46EXWrpkw9N0NiwHPcfn4O2AwnROugd5Y
 Zv4mfB8ZPQSygUWzbjR/o9Y8XPG+fiqgYvw0NGht/dY7wEK0DimLyNOThdeA/eDSYFgG
 eee7yz6+05Feh4MGsbsjVjCVT9Kh3hlrepFhKV6Z9p86yOySDfV5egywjAmclsKEKfvl
 uFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QCOtE9+v3wBr9409lbw5s1G3XAXvyPfK1PegRWjwFqM=;
 b=Nl7EptvUJWunO510Zvhq8hsKNfo6BCOv66Pg5xrov3NI2O4sL9qCRUJEf78bI5ajyw
 +1RNgM5+Vhxl5H3LEtqK/ceccg9TOWUsfJuvj3SDjhYMwoJxNKnxDKwOfsYyx+BYpOgz
 19aeaaCWRdDXA99bspsyl1+NYaFLmRNpe+KAvCrSrrSCtUGt2LiMqqjSMCeQYdggDGQ6
 gqEqM7MVsBRI2vpeXw++8UEvAFJqB8JYZvxpcpjJYO6XuA+WkYNAe3NSJ61+Kvd5V5SQ
 6oRICxMO1V9AzGN1YqHrMpTgapfqDcRZyxXMlqk6eEmDGF9+BUPKAHhT+8sMDwMQCBU0
 uDLw==
X-Gm-Message-State: AOAM533qaYqX90RDEqEcoy09twKGvQtxLltobIzO3vZdl+ALWWfFmNgT
 MlmifQruptBap5IXuXCLKyeakw==
X-Google-Smtp-Source: ABdhPJxbVSbpwXKunIfzNFCsIkmFVZ9jZ8drQt99FclTPg7lArE8DZGVKXFvPwvfIvVAXwXTx8eJnQ==
X-Received: by 2002:a17:907:2d27:: with SMTP id
 gs39mr645060ejc.235.1641837065966; 
 Mon, 10 Jan 2022 09:51:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 3sm2676990ejq.159.2022.01.10.09.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:51:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4AEF41FFB7;
 Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  0/6] Basic skeleton of RP2040 Raspbery Pi Pico
Date: Mon, 10 Jan 2022 17:50:58 +0000
Message-Id: <20220110175104.2908956-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a rather incomplete and basic model of the Pico Pi that I
hacked up over the Christmas break. It took me a bit of faffing about
to get it up and running but as it stands it will now run the first
few hundred instructions of the RP2040 mask ROM before looping waiting
for CLK_SYS_SELECTED to update (which it never will as it is currently
unimplemented).

I don't know when I'll next get a chance to hack on it but I thought
it was worth posting as a reference. If anyone has an inclination to
take it further then at least the initial baby steps are done for you.

There is no rush to review this although I am curious if anyone has
comments about how the model is put together.

It uses -kernel to load the user program (although it never gets there
at the moment):

 qemu-system-arm -d unimp,guest_errors -M raspi-pico \
   --kernel ~/mysrc/pico-air.rust/pico-air.git/target/thumbv6m-none-eabi/debug/rp2040-project-template \
   -display none -serial mon:stdio 

Alex Bennée (6):
  hw/arm: arm initial boilerplate for RP2040 SoC
  hw/arm: add boilerplate for machines based on the RP2040
  hw/arm: wire-up memory from the Pico board and the SoC
  pc-bios: add pipico mask rom (!upstream)
  hw/arm: add mask boot ROM logic
  docs/devel: add some clarifying text for aliases

 docs/devel/memory.rst                   |  14 +-
 configs/devices/arm-softmmu/default.mak |   2 +
 include/hw/arm/rp2040.h                 |  39 +++++
 hw/arm/raspi_pico.c                     |  97 ++++++++++++
 hw/arm/rp2040.c                         | 201 ++++++++++++++++++++++++
 hw/arm/Kconfig                          |   6 +
 hw/arm/meson.build                      |   2 +
 pc-bios/pipico.rom                      | Bin 0 -> 16384 bytes
 8 files changed, 356 insertions(+), 5 deletions(-)
 create mode 100644 include/hw/arm/rp2040.h
 create mode 100644 hw/arm/raspi_pico.c
 create mode 100644 hw/arm/rp2040.c
 create mode 100644 pc-bios/pipico.rom

-- 
2.30.2


