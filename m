Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC04D3BBCD1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:23:57 +0200 (CEST)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Ndg-0006TI-2C
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaO-0003gU-07
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:28 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaF-0001xv-HS
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:23 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i8so21921385wrc.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 05:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uSNidHAti57utUPVSZIYunUsW4u6StH+6j2Du3NNo1g=;
 b=jd01OLZjKFSTLINdj404I4Que8p2jaJVEJNTmSd+YepPcBboXteIvNv0us6Db8IPqB
 frZU+n11wcllQPAgu4IT2ccjptti5jH2tOxMDCX9owOEj3kt90KBVb/SpKhYQAFAeKra
 31XY35ITE+jF4RTJeLJqJ3Ldup2mKE0gfkuKMLgFBUTd6kY0xRjqtHLP0Wl4Sp0r0aqT
 vxKB8xwEoiNmvjwGK8q6b+/1S5QhaayIJ2Vz/MJLlTTiiKEmrQgtjB73Y28IuU0IwnHu
 n7d1dqUiDBBWUOPehAdxXOR/tqt9Sj8edEO+YshySvsNLax1NlFeoiKkq2EfnL1G4jno
 M9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uSNidHAti57utUPVSZIYunUsW4u6StH+6j2Du3NNo1g=;
 b=Zs5hiEIOy4G1/haHyly5UWIfvFZVJImwhWiLF4FNAvQ815lIZHnNmFFiKPYD4EFQG4
 Zdf71u2R9y+alfarFK7NhNO5GZyECf9KVt1rIBX5/OxHjJQ0FW0g4PH/JEey/HIwYsls
 THDjVDzWL66ndZR4GmU2h1s3E2k0VaXMbImIF2rK0g9MN7zsvShtG+rv5NbZWB+r3dUZ
 LkJozUn5BRnjxBzaaassyQ32WEkhDUcikhEl1wyFdTVzwHCfT1jPu5SUymtcmc3nTxVA
 SF13ImkB/N+e1lR6z/rmZVabqE3gX0b9ry1oiC9C/BJ3QX4fWS9KKyVZwzznh03u2Xpl
 3sZw==
X-Gm-Message-State: AOAM5335yZrQznCqbPsveojkAp1bI9at+LFtjwWarXBfR/+6sb7cbf4B
 /SPvUSjOwcrwqImzD3Pr6RhMzw==
X-Google-Smtp-Source: ABdhPJyjxxvLTeXCUXFhdpInVxO80wyRSkvyZyAUH9p6J9qQrHR6Z/bQPHRw5knww/NVCDgH1DlRBw==
X-Received: by 2002:a5d:538b:: with SMTP id d11mr15285123wrv.39.1625487617948; 
 Mon, 05 Jul 2021 05:20:17 -0700 (PDT)
Received: from orth.archaic.org.uk ([81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f18sm13450406wru.53.2021.07.05.05.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 05:20:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] docs: document cubieboard, emcraft-sf2, highbank, midway
Date: Mon,  5 Jul 2021 13:20:08 +0100
Message-Id: <20210705122011.753-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds documentation of the four board
models cubieboard, emcraft-sf2, highbank and midway.
The documentation here is rather skeletal, being based
on a quick read of sources, cover letter from original
patch submission, etc.

People interested in these machines are encouraged to
improve on these docs, but I would like us to at least
have a stub for all the Arm boards we emulate.

For the record, as well as these we have another ten
undocumented boards:
  imx25-pdk, kzm, mainstone, mcimx6ul-evk, mcimx7d-sabre,
  nuri, smdkc210, xilinx-zynq-a9, xlnx-zcu102, z2

thanks
-- PMM

Peter Maydell (3):
  docs: Add skeletal documentation of cubieboard
  docs: Add skeletal documentation of the emcraft-sf2
  docs: Add skeletal documentation of highbank and midway

 docs/system/arm/cubieboard.rst  |  6 ++++++
 docs/system/arm/emcraft-sf2.rst | 10 ++++++++++
 docs/system/arm/highbank.rst    | 19 +++++++++++++++++++
 docs/system/target-arm.rst      |  3 +++
 MAINTAINERS                     |  3 +++
 5 files changed, 41 insertions(+)
 create mode 100644 docs/system/arm/cubieboard.rst
 create mode 100644 docs/system/arm/emcraft-sf2.rst
 create mode 100644 docs/system/arm/highbank.rst

-- 
2.20.1


