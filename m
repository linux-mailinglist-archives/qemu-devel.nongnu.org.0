Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E78702747
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:33:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTc4-0003h1-4q; Mon, 15 May 2023 04:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc0-0003ga-Bq
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:21 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTby-0001zE-1a
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:19 -0400
Received: from quad ([37.169.188.112]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MHoVE-1pvhvY3hm2-00Et2a; Mon, 15
 May 2023 10:31:15 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/9] Linux user for 8.1 patches
Date: Mon, 15 May 2023 10:31:04 +0200
Message-Id: <20230515083113.107056-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:x7tupxO98VzMRrpGE2FYxOIiNMQjJy/EsgwidHUHYIsYPrfc9fH
 Qs4lxQgvNURdilIh3Mcehs/Zo711z3X8eZ7O4Zv5GqYMS7drSU8QV9u5+MqsaTn2PtwSDCR
 BUCVgA80TBQT4d4ArWlAbVcHPoyxNlpdOHo0cod2t+NvpuyLGg6sg8D+rQVwF7TRRiylK9I
 aeM00y2Ok13uSKbqd/iPQ==
UI-OutboundReport: notjunk:1;M01:P0:hEHuaVlWrCE=;+dON1BsIZ/LgdHaKVJR5iDwREie
 TnanxDK+F4MK3N1sotSgqmN0Gs2mW316yKFMZlamW/ysuTFDfxLPruXTEGWPXDIvat6n3ZrcG
 lv9Yjt6BTAAERpXnq+5udC+33p3qijiuKiziSWRx8aHQJCH6qHu6syKF6ruvJb6QuKjUDGc+u
 36IF6mG3uZ3f3VgxwNgFkQqNFKn+QU7kXcf4taBdpivOt7ERnF2SuLX4hC08/2ssJeTgcuHgE
 37nliNuox21y8VtMoyHQUaT+MAJR7OHd/wihC/LU6JU2yx6sONVYKJwENVejdTqPqFwOI3cLf
 l2LfabnLXJaZJGgm2DVWOVNl/lQmSwpS4jz1/zZ7KawhBWxtJKqunxkMYw4Xr3cSoSRdTJST7
 BVA/256Y/msIsVKNhSJ1mg32e+/0AW92z6jDO3QXzTozKEmQmQ2Pf9yY4ek8/PwN/fsSSsKzX
 vhs+QcF4QKH9D70FXMMXhuccqF0CsBhetiWEVZ3FWUuSPrzYJAp3wcPX+nU6DfSClE1RBRTJn
 eGq6AOWjufUZMidspQQRA2boaNGUKTAYzuWmYE8WvOmQ5BzTpGnuK3mhQAUYJdlB1P3DZqy18
 6qEjUMb7AM/8Vs6WdfmQXhcnJDEdXdhz8wtKNUJvTnUyBRaEXxHQ5l8GVSPmYa91maljrn3io
 4tzF4QY2+ECgvuFO3MtqPluBqBws/gyOe2TrW3uZHA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

for you to fetch changes up to 015ebc4aaa47612514a5c846b9db0d76b653b75f:

  linux-user: fix getgroups/setgroups allocations (2023-05-14 18:08:04 +0200)

----------------------------------------------------------------
linux-user pull request 20230512-v2

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
 linux-user/syscall.c              | 207 ++++++++++++++++++++++++------
 tests/tcg/riscv64/Makefile.target |   1 +
 tests/tcg/riscv64/cpuinfo.c       |  30 +++++
 6 files changed, 207 insertions(+), 42 deletions(-)
 create mode 100644 tests/tcg/riscv64/cpuinfo.c

-- 
2.40.1


