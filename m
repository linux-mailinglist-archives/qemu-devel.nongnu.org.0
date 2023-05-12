Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F97006A6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:23:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxQrF-0005xi-3a; Fri, 12 May 2023 07:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrD-0005xa-DC
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:43 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrB-0002N0-Mz
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:43 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MzCMN-1qAa5M1B6x-00wGGQ; Fri, 12
 May 2023 13:22:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/9] Linux user for 8.1 patches
Date: Fri, 12 May 2023 13:22:29 +0200
Message-Id: <20230512112238.85272-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:95CSJXoMDnIsr/M7+fzjbV7+0d5NBf2aT5D0Ou8D08YGhnHQA5U
 eH0bAAC7sKCTGoZDl6MGL/PDnj7vtH4Sb6+cjrGDsXsNzPL2F/k3ZVDcXJBAFri44IlyNld
 GuvJLNDO4XzwZ+QtoSjSeveZDyGQdnCgBUHk0wFzQZr8V+ecTZn5xBzNt4BlRukfiwvi2TF
 99D/936d9Ck7ttBX5BdJw==
UI-OutboundReport: notjunk:1;M01:P0:NJc8m7y8TMY=;WyJkqWeJrITNyVk+sARJD07Oley
 jCg3A3oiR5nA1qncesUpwA4NbSbqlDc1RfZcV740E4gunWlBqQgtO53t7cpjKD04sXmJT4mLq
 +0GssCtfo1XdrSl+A8OHmtYKOO4wdI3z8LnLqVHIgpfDlDGjw7amV7srsZBTBaO70YASaAEj1
 z/eN0vyLxZWqmvkIyB/HRB3QK8DpaHHgME0xFXAn63THZoDeilZM64QPDd9cLMJGSKsjhJ8ct
 keS3DI9vLVR0AWeXq8ZWNnGMNVmvQAT+zuLePxPrpRV1/59tGsyRwV6ia+TYhk2wOp+xySi3k
 NoTlMsXO1yTOn3gkcwW/tXrgpVe22K15AqIaz8HnluclicQj9KuZoJsk4kZDZAWAEmafWgKLy
 +27/KTr3Kd4haSS8gGjVPP6u5C/F/KWpKg3xWEkJz+R+8kr9d+k5KiuLDq4+RDBTtteCM8Gad
 Zy4N3r1d5TTKzh0P/PM4U1/BKRAt+LkRk3Y4phceMSZD2yXdDfTsfKh6K3FRtegPcAo+0kkD/
 H5J4ClY9+Uw01+0cqPpixTNa0eIAwdLSXmOU6SNGDnLpXpBHUYOeUMatm0wpVxkUJC5QZSUJp
 DzeRCv9zmo12P8gi3wJeQSHCzLSQv90P6/2gbl4VrP0ULYhdwC9KYksH/pk23eHtT/gzD9n62
 k8s+phkdMwX8oEG9z7J8UOax0m0hLqeKLM0AkjzkBg==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 7c18f2d663521f1b31b821a13358ce38075eaf7d:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-04-29 23:07:17 +0100)

are available in the Git repository at:

  https://github.com/vivier/qemu.git tags/linux-user-for-8.1-pull-request

for you to fetch changes up to 3e7f6c76d529dd4096d043cbd16593e40b469e70:

  linux-user: fix getgroups/setgroups allocations (2023-05-05 14:37:05 +0200)

----------------------------------------------------------------
linux-user pull request 20230512

add open_tree(), move_mount()
add /proc/cpuinfo for riscv
fixes and cleanup

----------------------------------------------------------------

Afonso Bordado (1):
  linux-user: Emulate /proc/cpuinfo output for riscv

Daniil Kovalev (1):
  linux-user: Fix mips fp64 executables loading

Michael Tokarev (1):
  linux-user: fix getgroups/setgroups allocations

Thomas Huth (1):
  linux-user/main: Use list_cpus() instead of cpu_list()

Thomas Weißschuh (5):
  linux-user: report ENOTTY for unknown ioctls
  linux-user: Add move_mount() syscall
  linux-user: Add open_tree() syscall
  linux-user: Add new flag VERIFY_NONE
  linux-user: Don't require PROT_READ for mincore

 linux-user/main.c                 |   5 +-
 linux-user/mips/cpu_loop.c        |   5 +-
 linux-user/qemu.h                 |   1 +
 linux-user/syscall.c              | 195 ++++++++++++++++++++++++------
 tests/tcg/riscv64/Makefile.target |   1 +
 tests/tcg/riscv64/cpuinfo.c       |  30 +++++
 6 files changed, 195 insertions(+), 42 deletions(-)
 create mode 100644 tests/tcg/riscv64/cpuinfo.c

-- 
2.40.1


