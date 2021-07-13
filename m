Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11723C723A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:31:45 +0200 (CEST)
Received: from localhost ([::1]:46128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JRo-0000fg-Tm
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIy-0001fg-3M
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:22:36 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIu-0001dS-ET
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:22:35 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d2so30777395wrn.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/CeRSthh1JbtrL21LZn+cKfeYYAcfJeHmn0eg64XTwk=;
 b=DvrpF40X1KkDDuruF8tL3Fg0naS2ZagkeJBwO9W8hOhKfO/XgvyDfh6igXR3lFswgc
 8n28gumazqoOuE6IyJs9QBkV8Sn1JriDXPGGY5qjaBppxhGKz4PTpa7pdBb5mvQUnKix
 f0kY+jXWRkxq8rh69gBwLns/MC14ZXIgqVvqUHIDawD4FM4fI4cpvxlGWqMs0qPy1Daq
 4tAZkQVZ1/9TFcAQnMUdQR+KcvfcXq0qmaQ1u3NiqoSWCLOH7ugGKz3DD6G4O4WAwpVt
 D/FBC9O8CmiiOOF4ztRxfzyGdV6V+s9knxbpcccbN5a1KExYeKPr59jtPIn2HZSqySfq
 cUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/CeRSthh1JbtrL21LZn+cKfeYYAcfJeHmn0eg64XTwk=;
 b=o4dOILV2XLMaJeohEraXJvUlB1thU7VMirxQsCnCc0zj1KRNyptKAiPJWtpzZPoloS
 WyrE0soPHZmsGC4gzpAz3XJSni9dbzNc+33tkYI6k6uFAiXOT2fCxohJY8BRqXTGq8Uh
 Hab+Xohvq5IkeeDYHDaiCA/lssyWZpP8i1Gt86vaF5E6FyuWSIFa/sfaLp2bRkOu7bSJ
 8EacmR+dOXDGfs8i1JIqGOZKGNaBldo/Kd1Vi0dOfjG8nmk6ySAlCH8+uxM/27HYoY4I
 4xgZsrZXmkq6CzfFzzF80xvSQ4jNDFOL2855rqJL0aWSd4GklJu0um5cG+jpdwK3VSL7
 J8wA==
X-Gm-Message-State: AOAM531WLPXwTZcOe4LVAJ8hpFlbbEm6aGQcBzHnTR++POF4CBwPP0Rs
 15FbgGpUp1wxVlYnBlhxLp1XrA==
X-Google-Smtp-Source: ABdhPJwR+eHF+pfO4xif+BoKSBrGI1TRssxGesmAEYtKN6xpOu+W49lTFTCM4DP7rXaZmd+3Bc6Lbw==
X-Received: by 2002:adf:d204:: with SMTP id j4mr6032774wrh.414.1626186148786; 
 Tue, 13 Jul 2021 07:22:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l15sm7916469wrv.87.2021.07.13.07.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:22:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] docs: document cubieboard, emcraft-sf2, highbank,
 midway
Date: Tue, 13 Jul 2021 15:22:23 +0100
Message-Id: <20210713142226.19155-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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

v2: updated cubieboard and emcraft-sf2 files to list emulated devices
(thanks to Philippe for the lists of devices).

thanks
-- PMM

Peter Maydell (3):
  docs: Add skeletal documentation of cubieboard
  docs: Add skeletal documentation of the emcraft-sf2
  docs: Add skeletal documentation of highbank and midway

 docs/system/arm/cubieboard.rst  | 16 ++++++++++++++++
 docs/system/arm/emcraft-sf2.rst | 15 +++++++++++++++
 docs/system/arm/highbank.rst    | 19 +++++++++++++++++++
 docs/system/target-arm.rst      |  3 +++
 MAINTAINERS                     |  3 +++
 5 files changed, 56 insertions(+)
 create mode 100644 docs/system/arm/cubieboard.rst
 create mode 100644 docs/system/arm/emcraft-sf2.rst
 create mode 100644 docs/system/arm/highbank.rst

-- 
2.20.1


