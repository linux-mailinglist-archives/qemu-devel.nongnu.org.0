Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6947631BA2A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:20:08 +0100 (CET)
Received: from localhost ([::1]:53012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdnL-00074j-EE
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjr-0005PX-Cg
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:31 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjp-0005Sj-Hj
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:31 -0500
Received: by mail-ed1-x535.google.com with SMTP id r17so1379643edy.10
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5p/3o/ust/W+0spAPeSIx6MdEKO9NttooGz4jfsP9Oc=;
 b=GN+67wRdHpPwCOtUS2bx+sNPqgcyjeAMwgYoHQjeQztUYKx1sZn3kDWMekqqtBgRD7
 Sr/ENtISsEoZkZ9bBrK6hJNVE9vJhOtopBcNSqll5DBX+xhQsdv+YoCjlZumDSQfFaCi
 Vi8YJrxEukyYV6c7jetuNtaNO8he/XkNDDnYTASH5zRtQ8bUba6b2lFSLW2q261xbbVn
 2YA529Vx5x26G1vSZWC9DPiKyqMbT6I6hkw8wCX4qK1YFtjZK2Ug/JMVIEuZ43jr2Pix
 p/8DaiaXEmLIl2HoBY5Mc2IZ4Q8lADtDTHk5zZe1Qg3u14HikaAxFD5E8xkGC3BequUX
 peTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5p/3o/ust/W+0spAPeSIx6MdEKO9NttooGz4jfsP9Oc=;
 b=cUzcHqFtYmjM2XZLDhBcJJsPBqkivcEfP3+G6eHval3nySeIoRcm8DpkgdPBrX8Dyb
 ixVo62Xqkwv7VAmm72ojBDXiE8hBSjHvAfZmSaJrxre8Zoxeen6zDprldb6QoUhptrKx
 sL5vmGF6W/EyTdgZh6Cna1hXuprOzsjjX2ynV40b+aSx8Y7JHcWA/BTdGOwjThGvepA9
 fqnupZgy68sxOGcuAgUrves0Dh3teOizoSMx1YphDBA+Cc5SIRnojzDBRKe9jlp9lRWB
 fYyibI/+58VRtdduHv/CQXJEPW91QMYZA+DDN+NBtQSMwYTY7m/m81G2Q1y0LVGq8/YU
 85XQ==
X-Gm-Message-State: AOAM533gfesx3SVArRmewEtTGcxpX9CTIbyIRuFcm62s8yhgjScecQyx
 1A49d6jZzvYKPeTr1EpIfu4gUZHpgt8=
X-Google-Smtp-Source: ABdhPJwesIPDkp9iDceWqJZ3hopp3X74T0GcQ+1Fova5moAPVFfgz74Mes/CA06iOI1BggbZ7YsVgQ==
X-Received: by 2002:aa7:c0da:: with SMTP id j26mr15440879edp.253.1613394987946; 
 Mon, 15 Feb 2021 05:16:27 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/19] i386, qgraph patches for 2020-02-15
Date: Mon, 15 Feb 2021 14:16:07 +0100
Message-Id: <20210215131626.65640-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 41d306ec7d9885752fec434904df08b9c1aa3add:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-02-09 10:04:51 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to bf98b5857a101f9032377044c250ab728464bcb0:

  hvf: Fetch cr4 before evaluating CPUID(1) (2021-02-09 18:47:45 +0100)

----------------------------------------------------------------
* HVF fixes
* Extra qos-test debugging output (Christian)
* SEV secret address autodetection (James)
* SEV-ES support (Thomas)
* Relocatable paths bugfix (Stefan)

----------------------------------------------------------------
Alexander Graf (2):
      hvf: x86: Remove unused definitions
      hvf: Fetch cr4 before evaluating CPUID(1)

Hill Ma (1):
      hvf: Guard xgetbv call

James Bottomley (2):
      pc: add parser for OVMF reset block
      sev: update sev-inject-launch-secret to make gpa optional

Paolo Bonzini (1):
      sev/i386: Allow AP booting under SEV-ES

Stefan Weil (1):
      util/cutils: Skip "." when looking for next directory component

Tom Lendacky (5):
      sev/i386: Add initial support for SEV-ES
      sev/i386: Require in-kernel irqchip support for SEV-ES guests
      sev/i386: Don't allow a system reset under an SEV-ES guest
      kvm/i386: Use a per-VM check for SMM capability
      sev/i386: Enable an SEV-ES guest based on SEV policy

Vladislav Yaroshchuk (2):
      target/i386/hvf: add vmware-cpuid-freq cpu feature
      target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT

qemu_oss--- via (5):
      libqos/qgraph: add qos_node_create_driver_named()
      libqos/qgraph_internal: add qos_printf() and qos_printf_literal()
      tests/qtest/qos-test: dump qos graph if verbose
      tests/qtest/qos-test: dump environment variables if verbose
      tests/qtest/qos-test: dump QEMU command if verbose

 accel/kvm/kvm-all.c                  |   6 +-
 hw/i386/pc_sysfw.c                   | 130 ++++++++++++++++++++++++-
 include/hw/i386/pc.h                 |   4 +
 include/sysemu/cpus.h                |   2 +
 include/sysemu/hw_accel.h            |   5 +
 include/sysemu/kvm.h                 |  10 ++
 include/sysemu/sev.h                 |   5 +
 qapi/misc-target.json                |   2 +-
 softmmu/cpus.c                       |   5 +
 softmmu/runstate.c                   |   3 +
 target/arm/kvm.c                     |   5 +
 target/i386/cpu.c                    |   1 +
 target/i386/cpu.h                    |   1 +
 target/i386/hvf/hvf-i386.h           |  16 ----
 target/i386/hvf/hvf.c                | 100 +++++++++++++++++++-
 target/i386/hvf/x86_cpuid.c          |  34 ++++---
 target/i386/hvf/x86_emu.c            |   5 +
 target/i386/kvm/kvm.c                |  10 +-
 target/i386/monitor.c                |  23 ++++-
 target/i386/sev-stub.c               |  15 +++
 target/i386/sev.c                    | 178 ++++++++++++++++++++++++++++++++++-
 target/i386/sev_i386.h               |   2 +-
 target/mips/kvm.c                    |   5 +
 target/ppc/kvm.c                     |   5 +
 target/s390x/kvm.c                   |   5 +
 tests/qtest/libqos/qgraph.c          |  99 ++++++++++++++++++-
 tests/qtest/libqos/qgraph.h          |  36 +++++++
 tests/qtest/libqos/qgraph_internal.h |  12 +++
 tests/qtest/qos-test.c               |  15 ++-
 util/cutils.c                        |   3 +-
 30 files changed, 697 insertions(+), 45 deletions(-)
-- 
2.29.2


