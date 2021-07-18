Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ED43CC92C
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:51:35 +0200 (CEST)
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56Gb-0003i3-TU
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bf-0003jG-Q0
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:29 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bd-0003Tp-Uf
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id i94so18052345wri.4
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Symy1fN50fAho6N4MiMVGVDbWSf3xyGe4XY3+Hhf9GU=;
 b=s9O1OxGUURIE+vcHoXyE9cKey0/UAGbkCFfQiW8h1+ZH9sqDwzIiwqeuoRyA/Gfit1
 EZq4HsEw8uZSg4h+5soZhkKH3Iwzdqf0A40bxY1OvUpC+fiUpo0KckLthQxV8TJkTpcv
 G93z/5EarfPgP5HpOoj4OfpYyK9vjI1Sefbukh04oNwtA585pr4jcXW0uS5SuzrLkIaj
 e8BUFWQ7iQLiWt3fNivQwABjLFeL0eJep2QnmJrxTdKdneH7V9/wMEYaOE3fhUH0MMr5
 IQrUXZE3biCHmGr3Xi3OT+YAL5dPdOJ+Jlp25gmdo151Fw3A69z4n+A5TQTQTwBoxFmn
 MTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Symy1fN50fAho6N4MiMVGVDbWSf3xyGe4XY3+Hhf9GU=;
 b=ZvOpCogCVMH9eSfRPZ/idCtm/r3O2YLX7DRDrouofkkucO2u6HL5yNhfHzNrFPLuhZ
 L2wYkT6TocSYFkgrZOGmdTB6PtqfS/a6V+0Y5Y/ZCTweEI89xtk0SjE9yCVt26ut0HD4
 MaoKFPWu3aZFQSsvxm4aZcz7fTQkIRzhceEL05CSLI+4qywujsKU7vUOM/f4ihCYXMfg
 fblEuTC/h7aN+9zkFeEpXh7rI8Y4nE76kiNz870IqY5+wusvE5z1RoLNRHzJA7I5cSiT
 cumOZ5CUTGoLdOd2IuaccmGU9VseEA+lorA0Wrw66U+5L4wjvr9JqtbCcZpXz7hSj4as
 m6EQ==
X-Gm-Message-State: AOAM531OuLY1byb9o3mX7cJYM9atLxnb2jEvkBc0FITWNW7lUlY/qcQg
 rC8yslRwlB0RbIcaisYjVz3VDrXqPzaqLg==
X-Google-Smtp-Source: ABdhPJxblzG1h6Ch9ObvJ/pk+00qQ37/ml4x6VuIA4f0Cbv2HjxhpLDJZVrEcT1rijInAVFAgXZ9wA==
X-Received: by 2002:adf:ed07:: with SMTP id a7mr25264840wro.70.1626612383713; 
 Sun, 18 Jul 2021 05:46:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] target-arm queue
Date: Sun, 18 Jul 2021 13:46:09 +0100
Message-Id: <20210718124621.13395-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Last few changes before rc0: a few bug fixes, but mostly
docs stuff.

-- PMM

The following changes since commit a97fca4ceb9d9b10aa8b582e817a5ee6c42ffbaf:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream3' into staging (2021-07-16 16:34:42 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210718

for you to fetch changes up to 8fe612a183dec4c63afdc57537079bc742d024ca:

  target/arm: Remove duplicate 'plus1' function from Neon and SVE decode (2021-07-18 10:59:47 +0100)

----------------------------------------------------------------
target-arm queue:
 * Remove duplicate 'plus1' function from Neon and SVE decode
 * Fix offsets for TTBCR for big-endian hosts
 * docs: fix copyright date
 * docs: add license/version info to HTML footers
 * docs: add an About section
 * docs: document some more arm boards

----------------------------------------------------------------
Peter Maydell (11):
      docs: Fix documentation Copyright date
      docs: Stop calling the top level subsections of our manual 'manuals'
      docs: Remove "Contents:" lines from top-level subsections
      docs: Move deprecation, build and license info out of system/
      docs: Add some actual About text to about/index.rst
      docs: Add license note to the HTML page footer
      docs: Add QEMU version information to HTML footer
      docs: Add skeletal documentation of cubieboard
      docs: Add skeletal documentation of the emcraft-sf2
      docs: Add skeletal documentation of highbank and midway
      target/arm: Remove duplicate 'plus1' function from Neon and SVE decode

Richard Henderson (1):
      target/arm: Fix offsets for TTBCR

 docs/_templates/footer.html                 | 14 ++++++++++++++
 docs/{system => about}/build-platforms.rst  |  0
 docs/{system => about}/deprecated.rst       |  0
 docs/about/index.rst                        | 27 +++++++++++++++++++++++++++
 docs/{system => about}/license.rst          |  0
 docs/{system => about}/removed-features.rst |  0
 docs/conf.py                                |  2 +-
 docs/devel/index.rst                        |  7 +------
 docs/index.rst                              |  1 +
 docs/interop/index.rst                      |  9 ++-------
 docs/meson.build                            |  3 ++-
 docs/specs/index.rst                        |  7 ++-----
 docs/system/arm/cubieboard.rst              | 16 ++++++++++++++++
 docs/system/arm/emcraft-sf2.rst             | 15 +++++++++++++++
 docs/system/arm/highbank.rst                | 19 +++++++++++++++++++
 docs/system/index.rst                       | 11 +----------
 docs/system/target-arm.rst                  |  3 +++
 docs/tools/index.rst                        |  7 ++-----
 docs/user/index.rst                         |  7 +------
 target/arm/neon-ls.decode                   |  4 ++--
 target/arm/neon-shared.decode               |  2 +-
 target/arm/sve.decode                       |  2 +-
 target/arm/helper.c                         | 11 +++++++----
 target/arm/translate-neon.c                 |  5 -----
 target/arm/translate-sve.c                  |  5 -----
 MAINTAINERS                                 |  4 ++++
 26 files changed, 122 insertions(+), 59 deletions(-)
 create mode 100644 docs/_templates/footer.html
 rename docs/{system => about}/build-platforms.rst (100%)
 rename docs/{system => about}/deprecated.rst (100%)
 create mode 100644 docs/about/index.rst
 rename docs/{system => about}/license.rst (100%)
 rename docs/{system => about}/removed-features.rst (100%)
 create mode 100644 docs/system/arm/cubieboard.rst
 create mode 100644 docs/system/arm/emcraft-sf2.rst
 create mode 100644 docs/system/arm/highbank.rst

