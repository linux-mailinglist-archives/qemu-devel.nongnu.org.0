Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B631D035
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:29:04 +0100 (CET)
Received: from localhost ([::1]:53512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC55r-0004nc-P4
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lC53B-00035o-8Q
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:26:18 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lC539-0007Mf-IV
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:26:17 -0500
Received: by mail-wr1-x434.google.com with SMTP id n6so14366543wrv.8
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 10:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LbXcypLE+fLhve5+dIUKLEUej3chJBmuwwxUedFVMss=;
 b=tM0FE6VpHw/Fx078pc1jEZM6AgMUssZhu94ysmAu07pFCfWplNj1SfTi6ZB7aSlV2E
 7bYPH/IM69PjVknHRuFd8olFzfC2uYJT9Ylx8r/eqjYt2RPmScbNaOmzlhG6hodqCxES
 r8KT9kUtK4qkHY8jmQg03bkxWCrHTSuGf341LPPrPslBMmF2FANK365ZDl9aVSCVSrOr
 twy6R2o/CKVTIU/cf2togXxTbzH+848QbV1F1AlOhySAd8fFlg5pyzVKmIgZb1SaRwlG
 whkEqWkQCN+dK98oY5v1VB5CTeQh2S7gAl1LKy7fHuihZgys++ISN8/ZG/SFi8O0X33G
 lsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LbXcypLE+fLhve5+dIUKLEUej3chJBmuwwxUedFVMss=;
 b=rp5cXMCzw9uOP35Iq2iBvoWFkITFdvzVoPhW02aUJWcAGtyGCKVgUIAfqRkDPPJYVH
 Jk5nlEFdT3LZrFN8QWjQlkmYBKA+5QFvI10YTzmULOUjOLicMREqtXji6pJR9VVDWmrO
 WxUwBXsvDrAksdB1/T9K3aTBtSeQcGMIT7a42ldfmEm6T2FSBMGcWznHJD0HXne7PbOI
 BjJb+vQihdbWQlnc5qPH/W7/vMLxaIcd/0n4OsT84QLL4mxTwHfKoQSbOsCvr8DGTxaF
 KnOo3HNGTHOvCFyT616R5UMWLSZ8/h/Wd+6JFRbtlZjD+Olt+8Fyd3V7sJzYuUcblfnD
 8J5A==
X-Gm-Message-State: AOAM531W+YlSZW1h5OhxE54IDGs0kkxVEmay5l65s4IaIBprNef8BHXz
 0cZLAWzuV4M4FwIxmI6p7b7sE/2qHrU=
X-Google-Smtp-Source: ABdhPJxECapVVmNIs3DMcqOvr4AcmyyFCFaWSx56XSK37vjV1QQKfCDlZGMmmKL2VrQcKgOajWdC8Q==
X-Received: by 2002:adf:b60e:: with SMTP id f14mr25126542wre.99.1613499972992; 
 Tue, 16 Feb 2021 10:26:12 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i10sm39394601wrp.0.2021.02.16.10.26.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 10:26:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/21] i386, qgraph patches for 2020-02-15
Date: Tue, 16 Feb 2021 19:26:09 +0100
Message-Id: <20210216182611.139813-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.19,
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

The following changes since commit 8ba4bca570ace1e60614a0808631a517cf5df67a:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-02-15 17:13:57 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 366a85e4bb748794b1ae0ca0ccc2d95f316679a0:

  replay: fix icount request when replaying clock access (2021-02-16 17:15:39 +0100)

----------------------------------------------------------------
* HVF fixes
* Extra qos-test debugging output (Christian)
* SEV secret address autodetection (James)
* SEV-ES support (Thomas)
* Relocatable paths bugfix (Stefan)
* RR fix (Pavel)
* EventNotifier fix (Greg)

----------------------------------------------------------------
Alexander Graf (2):
      hvf: x86: Remove unused definitions
      hvf: Fetch cr4 before evaluating CPUID(1)

Christian Schoenebeck (5):
      libqos/qgraph: add qos_node_create_driver_named()
      libqos/qgraph_internal: add qos_printf() and qos_printf_literal()
      tests/qtest/qos-test: dump qos graph if verbose
      tests/qtest/qos-test: dump environment variables if verbose
      tests/qtest/qos-test: dump QEMU command if verbose

Greg Kurz (1):
      event_notifier: Set ->initialized earlier in event_notifier_init()

Hill Ma (1):
      hvf: Guard xgetbv call

James Bottomley (2):
      pc: add parser for OVMF reset block
      sev: update sev-inject-launch-secret to make gpa optional

Paolo Bonzini (1):
      sev/i386: Allow AP booting under SEV-ES

Pavel Dovgalyuk (1):
      replay: fix icount request when replaying clock access

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

 accel/kvm/kvm-all.c                  |   6 +-
 hw/i386/pc_sysfw.c                   | 130 ++++++++++++++++++++++++-
 include/hw/i386/pc.h                 |   4 +
 include/sysemu/cpus.h                |   2 +
 include/sysemu/hw_accel.h            |   5 +
 include/sysemu/kvm.h                 |  10 ++
 include/sysemu/replay.h              |  14 +--
 include/sysemu/sev.h                 |   5 +
 qapi/misc-target.json                |   2 +-
 replay/replay-internal.c             |  29 +++++-
 replay/replay-time.c                 |   4 +-
 replay/replay.c                      |  23 +----
 softmmu/cpus.c                       |   5 +
 softmmu/runstate.c                   |   3 +
 stubs/replay-tools.c                 |   2 +-
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
 util/event_notifier-posix.c          |   2 +-
 36 files changed, 735 insertions(+), 81 deletions(-)
-- 
2.29.2


