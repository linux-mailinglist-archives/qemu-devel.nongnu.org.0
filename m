Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6C149E083
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:17:59 +0100 (CET)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2ms-0003ke-4v
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:17:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fs-0006lg-3h
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:47 -0500
Received: from [2a00:1450:4864:20::430] (port=46968
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fp-00066n-LV
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:43 -0500
Received: by mail-wr1-x430.google.com with SMTP id l25so4006954wrb.13
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Im7UsosjuIig5J8Pndefn99rS55u1s4oAt4iS5tesys=;
 b=bxTImSWNIW+BIOw8M6+wKp1xs9kPB7N4/pmzcpf2FluqZuNwakg0orbkQXE1t+ZbyA
 veJXWginxN8MX1aUDCqdKeDaI9FrDm4pRtgcEHxxJkhppR5FZSHuCoOpP0U9c61bIsSS
 WfTYCizY2PT/+G/K3ZzzCDephJ+jsj2iNrqMD60DJDqj3DCYWO+V/QrrOtJUe4+om4r1
 8PBLtXpnOLyIrQRYlTC/C6n8sct8Vfv5C8ysLay6XIn2NcgHpjRP/WnRuEMCwjcQ8w6u
 Y2HmZgUnreyZhquKQ5CirDfK/v77kpCOWA5eZcwNgVwAbAT7kICTbO9/1Kv7QUmhKK99
 jN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Im7UsosjuIig5J8Pndefn99rS55u1s4oAt4iS5tesys=;
 b=moW+fvmkgdaeZx9A0UfPTFbbuF4RMTzY7txNYtda5D0Osux5R4QTtlKevaP0dJAxpI
 zklV0Ge+ghpqHBHJBKI1WyQ3I1LysS1a56qixDLi8x7oL3LVf8+VzWcjnyjUXxLG/4OP
 2KQxEZZ39FoYW45WidLUI97gtDhuj/pww6dtQgiN1mKMwCSK9IF4IFdv3Ek3NMuXLQbn
 1NjTE8pWZgBBNMU1bMSHAmssvfy+wewJ69y3n0/O0HAVq54JdN8A/UgSAOJrH84rPk8y
 0J2oFbVXF0WYN1y6wPA7Z4aYDDF4R0r01JfK8QMktsd+nz8nxSvYbYTAnPA8FNzAkBCo
 zR9A==
X-Gm-Message-State: AOAM532s4vqNcvW8UaI5FM48anYN4I8V6vbeouyfAcxb/8YyCDgs/Qlj
 xbz4cFfG1PveuSx7F2A08ZI7uzrPlBw=
X-Google-Smtp-Source: ABdhPJxFxZRLXCa6xvqOMox5BpTyG5YnjxDiVwoSDxkvCbXygE3PR+l51JtfOgFF5hKvKe42rxMmxw==
X-Received: by 2002:adf:dc83:: with SMTP id r3mr2586001wrj.315.1643281839361; 
 Thu, 27 Jan 2022 03:10:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] Misc patches for 2022-01-27
Date: Thu, 27 Jan 2022 12:10:23 +0100
Message-Id: <20220127111037.457901-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

for you to fetch changes up to b3378ce9cd2b10dadf34a59f1bcf2fd80af8b3fa:

  configure: fix parameter expansion of --cross-cc-cflags options (2022-01-27 12:09:10 +0100)

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

Philippe Mathieu-Daudé (1):
      exec/cpu: Make host pages variables / macros 'target agnostic'

Philippe Mathieu-Daudé via (1):
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


