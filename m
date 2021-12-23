Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF547E2A5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:54:03 +0100 (CET)
Received: from localhost ([::1]:41332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0MfZ-00072a-Ie
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:54:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdI-0004GR-NX
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:40 -0500
Received: from [2a00:1450:4864:20::335] (port=56137
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdG-0008OI-6Q
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:40 -0500
Received: by mail-wm1-x335.google.com with SMTP id c66so3444227wma.5
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HSBZW2gA+THFK8Lsl0h8j5ACqEJLYhVeC2sc/x1UDzA=;
 b=mAf6LIhaoTCEbagefNt2GVHLKWVUrdPk6OhFZzX7YIkK7fiPe7cVsJQpPzQTKEevvz
 BolbQvD+1mcIqxn6dbMfrCAhtY+kFLnHeGx/LUPY0kdsjKWgAvL1b/oHlwzBcDjLUhHt
 3HTEmwS3Qa+fPlEzJJ63NqqNyYB5RoEDkxgpo03Y5gytzrFHOc9zvj0yoFWTz8BPx/cP
 QQeagQwLql6l23SncEEMTLcD+wj1edkp0W5E4Qi/u1tg7H+OcniANnidDxTL2RFGNDOl
 0HWMjKdhS5PR2rK34XmMLF8oZj0yAKrHsWE8mx2w+T3wXM+OOKj27UJ6+UIuOoxO0p8n
 aZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HSBZW2gA+THFK8Lsl0h8j5ACqEJLYhVeC2sc/x1UDzA=;
 b=rXZypRAZNHD/QbK5vXXKDaz5HiQpUu+hHSeUFuMV2ksOwHbDXMQ6kd1Q9B5q4xj09J
 e2O7NB93s1MLEGR0nL//c5RCwusERQRUq2KQfQtQUjzcIo3T0jRPilab7Om+NhC4tI/j
 VzqHFt3YoRIJzMG2RwMQCETegSuGKzVrf0a0giY1/d9QGqZa5oZNcX57kwkEIumiBEVl
 lI9YpAoyoZBUQ1oH/evkPeY+M63y/SEJhO7u/vZjV+M8AXIkTl+o2S70ebsc1ukhDAbE
 vS+j38AXBfDCGNtyJTQXx3Ex6D2sURr6ARN3iXeCkIN4rpIEOh8qDJrWAByPAGhJL79l
 jexA==
X-Gm-Message-State: AOAM531tBaXG1C6+jqM3Lpg0PDuK5BU7KDkJoPOpITJou/fYsSBkprAn
 d6lqD2aL+f6u/LVaI+LPoyo/r12iQNQ=
X-Google-Smtp-Source: ABdhPJzEmnWwZ8bZGWAplR+YJFocuTV20WkrIVOf7GzgzaOczJ2YK7fPZUuXvvBbq+qANAU0Kn05Rw==
X-Received: by 2002:a05:600c:286:: with SMTP id
 6mr1606272wmk.194.1640260295670; 
 Thu, 23 Dec 2021 03:51:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] Build system and KVM changes for 2021-12-23
Date: Thu, 23 Dec 2021 12:51:19 +0100
Message-Id: <20211223115134.579235-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2bf40d0841b942e7ba12953d515e62a436f0af84:

  Merge tag 'pull-user-20211220' of https://gitlab.com/rth7680/qemu into staging (2021-12-20 13:20:07 -0800)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to c139f026aa685e6b27a5a8ecb3272d4ed1700312:

  KVM: x86: ignore interrupt_bitmap field of KVM_GET/SET_SREGS (2021-12-23 10:05:28 +0100)

----------------------------------------------------------------
* configure and meson cleanups
* KVM_GET/SET_SREGS2 support for x86
* fix occasional container build failures for debian-tricore-cross

----------------------------------------------------------------
Maxim Levitsky (1):
      KVM: use KVM_{GET|SET}_SREGS2 when supported.

Paolo Bonzini (13):
      docker: include bison in debian-tricore-cross
      meson: reuse common_user_inc when building files specific to user-mode emulators
      user: move common-user includes to a subdirectory of {bsd,linux}-user/
      meson: cleanup common-user/ build
      configure: simplify creation of plugin symbol list
      configure: do not set bsd_user/linux_user early
      configure, makefile: remove traces of really old files
      configure: parse --enable/--disable-strip automatically, flip default
      configure: move non-command-line variables away from command-line parsing section
      meson: build contrib/ executables after generated headers
      configure, meson: move config-poison.h to meson
      meson: add comments in the target-specific flags section
      KVM: x86: ignore interrupt_bitmap field of KVM_GET/SET_SREGS

Thomas Huth (1):
      block/file-posix: Simplify the XFS_IOC_DIOINFO handling

 Makefile                                           |  11 +-
 block/file-posix.c                                 |  37 ++---
 bsd-user/{ => include}/special-errno.h             |   0
 bsd-user/meson.build                               |   2 +-
 common-user/meson.build                            |   2 +-
 configure                                          | 182 +++------------------
 contrib/elf2dmp/meson.build                        |   2 +-
 contrib/ivshmem-client/meson.build                 |   2 +-
 contrib/ivshmem-server/meson.build                 |   2 +-
 contrib/rdmacm-mux/meson.build                     |   2 +-
 .../{ => include}/host/aarch64/host-signal.h       |   0
 linux-user/{ => include}/host/alpha/host-signal.h  |   0
 linux-user/{ => include}/host/arm/host-signal.h    |   0
 linux-user/{ => include}/host/i386/host-signal.h   |   0
 linux-user/{ => include}/host/mips/host-signal.h   |   0
 linux-user/{ => include}/host/ppc/host-signal.h    |   0
 linux-user/{ => include}/host/ppc64/host-signal.h  |   0
 linux-user/{ => include}/host/riscv/host-signal.h  |   0
 linux-user/{ => include}/host/s390/host-signal.h   |   0
 linux-user/{ => include}/host/s390x/host-signal.h  |   0
 linux-user/{ => include}/host/sparc/host-signal.h  |   0
 .../{ => include}/host/sparc64/host-signal.h       |   0
 linux-user/{ => include}/host/x32/host-signal.h    |   0
 linux-user/{ => include}/host/x86_64/host-signal.h |   0
 linux-user/{ => include}/special-errno.h           |   0
 linux-user/meson.build                             |   4 +-
 meson.build                                        |  33 ++--
 pc-bios/s390-ccw/Makefile                          |   2 -
 plugins/meson.build                                |  11 +-
 scripts/make-config-poison.sh                      |  16 ++
 scripts/meson-buildoptions.py                      |  21 ++-
 scripts/meson-buildoptions.sh                      |   3 +
 target/i386/cpu.h                                  |   3 +
 target/i386/kvm/kvm.c                              | 130 +++++++++++++--
 target/i386/machine.c                              |  29 ++++
 .../docker/dockerfiles/debian-tricore-cross.docker |   1 +
 36 files changed, 259 insertions(+), 236 deletions(-)
 rename bsd-user/{ => include}/special-errno.h (100%)
 rename linux-user/{ => include}/host/aarch64/host-signal.h (100%)
 rename linux-user/{ => include}/host/alpha/host-signal.h (100%)
 rename linux-user/{ => include}/host/arm/host-signal.h (100%)
 rename linux-user/{ => include}/host/i386/host-signal.h (100%)
 rename linux-user/{ => include}/host/mips/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/riscv/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390x/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/x32/host-signal.h (100%)
 rename linux-user/{ => include}/host/x86_64/host-signal.h (100%)
 rename linux-user/{ => include}/special-errno.h (100%)
 create mode 100755 scripts/make-config-poison.sh
-- 
2.33.1


