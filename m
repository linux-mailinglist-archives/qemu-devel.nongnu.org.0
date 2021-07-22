Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F57D3D2B81
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:53:59 +0200 (CEST)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ctS-0006vs-JK
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs8-0004Lx-4i
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:36 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs5-000207-FP
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id l7so6823338wrv.7
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/PJCdZ40T6nDf8PG37ox8Ljuo/uFhChZkU+VhN5NKrk=;
 b=AZUXdOGW+6xn3ONGv/H3LxoJDkjpdJuiWUGdtWxmSl7/04hCA7fSAAQecBwo5grP2G
 eCGHgoko8FYMsffHnT/MFSO43Kg/SpEL618LDJ8bl3BJHisdNDV0px3kvjZTWqYuYLcp
 aYfyP6264n7XB+yrv05huNMNxGy0nuM+iXQTzOrwMhH2YIIAmXfx6tSdY1NLFNXGiXce
 OMvE0ufEP2LWPU0MhbW6iWm659WB/edcg/smPz1u4L71dyEv5wb77tDiapyF+0qZXvPb
 35Ziup1LswQ3muxpAAXm78k9/zZ2icix6878R1HCaYrW8woZffRK1bUZH6ru+M0tEOgY
 2ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/PJCdZ40T6nDf8PG37ox8Ljuo/uFhChZkU+VhN5NKrk=;
 b=sE8PGa9ydqkH6cOgTXIvYuO5XcLCax6GrlX70JOpZOeEI8eTHsMBTG9ZH67PPigqxf
 mMDHkcm8yyVqfHkJ8omrGlnxKWfX5g3Mh8bqjq8kRP9MbcbA5iFIad7ROgANbx/IIqXW
 P9TgP87WVdAevjAtMfPbsdagy7pTkna3YFUUmtYAqV/F+ZBfZxhCbzyZB2BuJL6BkvC+
 Ecx+38kkAjEtMnF2u1Qlv1AGlj6Qxc0KvJ8tfJbzzoZUNFK5/y8w35AGaOIGnAgWVntm
 6pfp3yPt7f/wPK2ivWQX5jKv1ymqAlhzaHGpZL9ZEz1N8oty8D1ADMdEzvjbED97+b2J
 RnUw==
X-Gm-Message-State: AOAM531AhpuJ6HycjWise469VVVqtMWINNtBth5VBehWXL+Im21JnoPQ
 AE8lvElDEFqFATdFXa0CQ7fmQQ==
X-Google-Smtp-Source: ABdhPJx0UciQjG6oUu4kIXiJ7+w8X61rp8zUHIkNVAFjawJYqIeSrnvK+yZfGn4D8vOH3SPeIPgdVQ==
X-Received: by 2002:adf:f411:: with SMTP id g17mr1157510wro.160.1626976351863; 
 Thu, 22 Jul 2021 10:52:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s13sm30278651wrm.13.2021.07.22.10.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:52:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 0/3] docs: Document arm mainstone, kzm, imx25-pdk
Date: Thu, 22 Jul 2021 18:52:26 +0100
Message-Id: <20210722175229.29065-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds brief documentation for another set of Arm
boards. As usual, people familiar with these boards are welcome
to provide more detail for the docs -- I just did the minimum
"name the board and list emulated devices identified from a
quick scan through the source code".

(After this we still have 9 undocumented Arm machines.)

thanks
-- PMM

Peter Maydell (3):
  docs: Add documentation of Arm 'mainstone' board
  docs: Add documentation of Arm 'kzm' board
  docs: Add documentation of Arm 'imx25-pdk' board

 docs/system/arm/imx25-pdk.rst | 19 +++++++++++++++++++
 docs/system/arm/kzm.rst       | 18 ++++++++++++++++++
 docs/system/arm/mainstone.rst | 25 +++++++++++++++++++++++++
 docs/system/target-arm.rst    |  3 +++
 MAINTAINERS                   |  3 +++
 5 files changed, 68 insertions(+)
 create mode 100644 docs/system/arm/imx25-pdk.rst
 create mode 100644 docs/system/arm/kzm.rst
 create mode 100644 docs/system/arm/mainstone.rst

-- 
2.20.1


