Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1549F712
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 11:18:10 +0100 (CET)
Received: from localhost ([::1]:37156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDOKX-0006Sg-9r
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 05:18:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nDOHn-0003Ur-7Y
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:15:19 -0500
Received: from [2a00:1450:4864:20::629] (port=36356
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nDOHl-00064y-8f
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:15:18 -0500
Received: by mail-ej1-x629.google.com with SMTP id s13so14430729ejy.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 02:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=llZ8azvbscFarubs1pSqfnJA7KCRVI3ZxRtvcZT3ubI=;
 b=pqTLVxBhXJk8WYhF2+ZRhw7G2SUaoeSD+CRkanin64KbouKceFIgIBdXZ0ZdXIo1hl
 J/2AcDXxbBHNDvS8pxycFX7XZq1+hfcb7Ef+WQS4T/wvldhJKJZUPfIoD0mV+YgB6Q70
 RZhZIKnUp4kDnPtsPFJ9AxCdL+Imo8PGIHCxbCKJ7JSdAs4ueE48GIPkB4Nlv9um8NmF
 g0EFXr9EP4vOgVMb7tNaJDPg6Q5RMInJpK2+1IjVbYl4gZ5W0Wd+urNd3BYqG75B2XKY
 gVLl4MZbCssoXrW19VRXykoyw2TUPWHOqDNQKh5PuRD24NAqMTzEZyQfnjXXDZ8Vmhnb
 qx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=llZ8azvbscFarubs1pSqfnJA7KCRVI3ZxRtvcZT3ubI=;
 b=kjNIsiBFwA9lqXhhRswXid7VCB0sRBySiLS2YZtFX2jRDhVf1YGps9GJoxj45WRnNl
 1nb7Ztn2/M3NMgWvUf7VZ2iYj6bQw+EQ6ThiaY4lPfvAgiHigf/MR6vcvjrppFrT4ZYj
 eBG/MRx9t+SPdpw/e2m7id+iXqb6UQRqTXhQrOvL+eGRpZ+wB9/VSHo+qyBTfYCchIRC
 Vi726CC1Mj2J2uV37z8Z9WbQfCHDqjpmGs8X8JVDf0jsZDq09hY2jQGpi+rj1P1u05TL
 RmG6xfPaGuXVczp0a3pRNgtPY11I4E7prbckrtMIDNH+g38VN0FjsQB/LEifJnRFtvQX
 YTFw==
X-Gm-Message-State: AOAM533yMIr+VylHyXS4rRZlpftwx80X8hF24Yf45g1aC7dJXfyxVjyw
 L9rQNfjE4oeE1zU6USMKsJzlGaIARec=
X-Google-Smtp-Source: ABdhPJyPliqy2jjnhFX9qnzlKO/WbOuu+nIIBDADJnhT7Xc+cxJ8yH49BvT9kfWH+KpQnmjnZw+yxg==
X-Received: by 2002:a17:906:4786:: with SMTP id
 cw6mr6307026ejc.69.1643364915332; 
 Fri, 28 Jan 2022 02:15:15 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dk3sm12690738edb.33.2022.01.28.02.15.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 02:15:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/14] Misc patches for 2022-01-27
Date: Fri, 28 Jan 2022 11:15:12 +0100
Message-Id: <20220128101513.646792-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit aeb0ae95b7f18c66158792641cb6ba0cde5789ab:

  Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2022-01-22 12:03:22 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 479ca4ccd54afcd54b0163532709079233d64b97:

  configure: fix parameter expansion of --cross-cc-cflags options (2022-01-28 11:13:33 +0100)

----------------------------------------------------------------
* configure and meson fixes
* "meson test" switch for iotests
* deprecation of old SGX QAPI
* unexport InterruptStatsProviderClass-related functions

----------------------------------------------------------------
Bernhard Beschow (1):
      intc: Unexport InterruptStatsProviderClass-related functions

Marc-André Lureau (3):
      build-sys: fix a meson deprecation warning
      build-sys: fix undefined ARCH error
      docker: add msitools to Fedora/mingw cross

Matheus Ferst (1):
      configure: fix parameter expansion of --cross-cc-cflags options

Paolo Bonzini (4):
      scripts/mtest2make: add support for SPEED=thorough
      build: make check-block a meson test
      qemu-iotests: require at least an argument to check-block.sh
      check-block: replace -makecheck with TAP output

Philippe Mathieu-Daudé (2):
      exec/cpu: Make host pages variables / macros 'target agnostic'
      meson: Use find_program() to resolve the entitlement.sh script

Thomas Huth (1):
      meson.build: Use a function from libfdt 1.5.1 for the library check

Vladimir Sementsov-Ogievskiy (1):
      check-block.sh: passthrough -jN flag of make to -j N flag of check

Yang Zhong (1):
      qapi: Cleanup SGX related comments and restore @section-size

 configure                                          |  4 +-
 docs/about/deprecated.rst                          | 13 ++++++
 docs/devel/testing.rst                             |  2 +-
 hw/i386/sgx.c                                      | 11 ++++-
 hw/intc/i8259_common.c                             |  6 +--
 hw/intc/ioapic_common.c                            |  2 +-
 include/exec/cpu-all.h                             |  9 ----
 include/exec/cpu-common.h                          |  9 ++++
 include/hw/i386/ioapic_internal.h                  |  1 -
 include/hw/isa/i8259_internal.h                    |  3 --
 meson.build                                        | 16 +++----
 qapi/machine.json                                  |  4 +-
 qapi/misc-target.json                              | 22 ++++++---
 qga/meson.build                                    |  2 +-
 scripts/mtest2make.py                              | 20 +++++++--
 tests/Makefile.include                             | 16 ++-----
 tests/check-block.sh                               | 52 +++++++++++-----------
 tests/docker/dockerfiles/fedora-win32-cross.docker |  1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker |  1 +
 tests/meson.build                                  |  1 +
 tests/qemu-iotests/check                           |  6 +--
 tests/qemu-iotests/meson.build                     | 30 +++++++++++++
 tests/qemu-iotests/testenv.py                      | 30 ++++++-------
 tests/qemu-iotests/testrunner.py                   | 49 ++++++++++----------
 tests/qtest/meson.build                            |  2 +-
 25 files changed, 189 insertions(+), 123 deletions(-)
 create mode 100644 tests/qemu-iotests/meson.build
-- 
2.34.1


