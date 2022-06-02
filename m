Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C1253B8C7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:08:40 +0200 (CEST)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjd1-0006TX-Ba
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTQ-0000RY-H3
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:44 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:52971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTO-0001Cw-B3
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:43 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MvsR7-1ngzAe1Nxf-00szRP; Thu, 02
 Jun 2022 13:58:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/19] M68k for 7.1 patches
Date: Thu,  2 Jun 2022 13:58:18 +0200
Message-Id: <20220602115837.2013918-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+/2qUqP2dpGbSKObgp/93uqWCbE3sKNNK4uki5kx2yjLDBQOh2T
 IQaGFRl5A9B61Ovqlu3OwuSdmSLIVnRFZRsv3F16tiaBK8JWiFycSduajCudNvzt82JbdiA
 PXGyLqP9KeAMcSB0ImQnoDuxVtUKyESv6JpawHtc2BjI6bkoS4j2R0w3TMrq0iL2V5lqmpw
 7yFJmbdwfukKUFIIbjvMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nPaxDTWFzAI=:nVDNB+WIktpDJXMTCM6qt6
 4aT0fYNjukBFNt/kM/dTSP/HdUI2KyMK0zMBfZYbUdzbZeYG6CzybVLhMEKd+IMwWkaHDUjYh
 GrlJNaNJck+7nQ7/U0lpegAB3hDVo/wKnSmJp5U57lsumsf//aSqmG9aXvHu0SKpPhttAkGmp
 fxJ1AH9LqMNlpmXNY9iNRqlTpi5zYkehN+VISfrApdFS/RlJ89Ymzo7BD6cXbfaC0zLSjKOM5
 AIstJc+tCa0AABIxyc+YGkTeVlpCIDPt8OICC9cP/4VZDWBhHI1OLjU+t1fOjn8IQhsfxZNzQ
 rYYVdS3bygaUrMiEsiR/+sUPA3RtY8V+vkFF1ewcNbJPN1jS7SADWN0u/TKlUaupAopQkSuI0
 ln8oBAXgrTNUxeNFQfPiYNFQhz9NnjQV+KUM6FA6Ens8tECiTL3fC178SjvKmTNcY++XP+k/k
 7ajUeG0/nFYWIC+y1QKnFUf23Z9W2TJifc68zoRxQ7szqEmd8QbeJOpVJLC5Ug+XA64P6NhiU
 8VIUGFy9ohro2U6xMJLfefR6Ze0zNYQjFFjuLil7EgzApSiR6ONi1gMaTtutNLbmsUNCqVLg5
 3T48MfEKjY0ALs5KUfWssrTlXk81baixfnfk5/qRMtl0esintpcIkr/mY+MnqussKpHRBMTUu
 myPFmUcnfNPBQvhEGUtWB1mun0X3QDaNrWj3lqidPlyL/3OJV1vHW/fODrY1BbLzJAgp0zrCE
 2EKiFq9OTByqf+rd+kA1WV0n7V8EarxxxG3JxA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2417cbd5916d043e0c56408221fbe9935d0bc8da:

  Merge tag 'ak-pull-request' of https://gitlab.com/berrange/qemu into staging (2022-05-26 07:00:04 -0700)

are available in the Git repository at:

  https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.1-pull-request

for you to fetch changes up to 36a0ab595f4e24b987e67faa52d4b174f67144b6:

  target/m68k: Mark helper_raise_exception as noreturn (2022-06-02 09:35:03 +0200)

----------------------------------------------------------------
m68k pull request 20220602

- Fixes and cleanup
- Implement TRAP opcodes
- Enable halt on 68060

----------------------------------------------------------------

Richard Henderson (19):
  target/m68k: Clear mach in m68k_cpu_disas_set_info
  target/m68k: Enable halt insn for 68060
  target/m68k: Raise the TRAPn exception with the correct pc
  target/m68k: Switch over exception type in m68k_interrupt_all
  target/m68k: Fix coding style in m68k_interrupt_all
  linux-user/m68k: Handle EXCP_TRAP1 through EXCP_TRAP15
  target/m68k: Remove retaddr in m68k_interrupt_all
  target/m68k: Fix address argument for EXCP_CHK
  target/m68k: Fix pc, c flag, and address argument for EXCP_DIV0
  target/m68k: Fix address argument for EXCP_TRACE
  target/m68k: Fix stack frame for EXCP_ILLEGAL
  target/m68k: Implement TRAPcc
  target/m68k: Implement TPF in terms of TRAPcc
  target/m68k: Implement TRAPV
  target/m68k: Implement FTRAPcc
  tests/tcg/m68k: Add trap.c
  linux-user/strace: Use is_error in print_syscall_err
  linux-user/strace: Adjust get_thread_area for m68k
  target/m68k: Mark helper_raise_exception as noreturn

 target/m68k/cpu.h              |   8 ++
 target/m68k/helper.h           |  14 +--
 linux-user/m68k/cpu_loop.c     |  13 ++-
 linux-user/strace.c            |   2 +-
 target/m68k/cpu.c              |   7 +-
 target/m68k/op_helper.c        | 173 +++++++++++++++--------------
 target/m68k/translate.c        | 192 ++++++++++++++++++++++++---------
 tests/tcg/m68k/trap.c          | 129 ++++++++++++++++++++++
 linux-user/strace.list         |   5 +
 tests/tcg/m68k/Makefile.target |   3 +
 10 files changed, 398 insertions(+), 148 deletions(-)
 create mode 100644 tests/tcg/m68k/trap.c

-- 
2.36.1


