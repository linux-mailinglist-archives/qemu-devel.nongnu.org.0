Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D4531A6A5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:18:11 +0100 (CET)
Received: from localhost ([::1]:36852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAfpJ-0003md-H8
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmG-0001vU-0g
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:15:00 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:58557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmA-0003RB-Mr
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:14:59 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MLA6k-1lReOX1BL8-00IAxa; Fri, 12 Feb 2021 22:14:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] M68k for 6.0 patches
Date: Fri, 12 Feb 2021 22:14:41 +0100
Message-Id: <20210212211448.413489-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ImLxNW6vnpJTAIUrK+Ya9VU5eqdN/SO072SB2LfYBKR1MQR2Kib
 v9v3DRsH1yY1Gcv1LUH+FlGW4+JrDOtTHkwRDllcbneYbgUiCv9nPVEblzn0uNQPqouI2r4
 zhgmkvFiS9JQ9kgvJhkqfK0ySL7L5gffKcP7JyANmWZzj78+LJKmzSfhXin9oRdhUJqHn+s
 IMmV5A9cHYH3dyZHt1wSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5ZiQHecRNpM=:xSKC8eUW7lmRefMyDjDpP3
 syhRjKChiW+J82KRVU9oitX8CHzd6fYl0Ds9D8MkLwA8hxnLn33OvwfOwzm88CXfl9WQK0WFD
 jzBOxd+OFyTUnZnWBvUIbHD3nAk22+0rNcs7Fra5xZ6kLNQ2eoULW0rhQSL0rzsQWcnZOJlTw
 ZDfgJ2+wUZLMsHlBPziNn5xQovdWzqAIMpad28X44HVG90Zi9EsfVwsD2naK4DF5pOkMrJbjI
 yY/RkX+ZHxUdIiSxUsdFFHVFbLUgc7ehaEaTV0rpmqOBny2r1a6bAiaTLVOPYbd+NKx02hN02
 3r+EdZhUXSKepK1AjYOt8o2PA/YeNGEI/oKy+l/YJQAoip9KuxSierfxLD63uVAXqNNwW0A/u
 M+xSfUeMs65b5uzsshHs5btI7YSoiJzvZaY8GGZLpKYCZUhuYINpDrM7rGxqaVyrghyOIZcqF
 pDjAA4vcMA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5b19cb63d9dfda41b412373b8c9fe14641bcab60=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210205' =
in=3D=0D
to staging (2021-02-05 22:59:12 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.0-pull-request=0D
=0D
for you to fetch changes up to 382d71af7d61620ffb023962f83cc4786303c60d:=0D
=0D
  m68k: import bootinfo headers from linux (2021-02-11 21:56:42 +0100)=0D
=0D
----------------------------------------------------------------=0D
Pull request m68k-20210212=0D
=0D
Move bootinfo headers to include/standard-headers/asm-m68k=0D
Add M68K_FEATURE_MSP, M68K_FEATURE_MOVEC, M68K_FEATURE_M68010=0D
Add 68060 CR BUSCR and PCR (unimplemented)=0D
CPU types and features cleanup=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (1):=0D
  m68k: import bootinfo headers from linux=0D
=0D
Lucien Murray-Pitts (6):=0D
  m68k: improve cpu instantiation comments=0D
  m68k: cascade m68k_features by m680xx_cpu_initfn() to improve=0D
    readability=0D
  m68k: improve comments on m68k_move_to/from helpers=0D
  m68k: add missing BUSCR/PCR CR defines, and BUSCR/PCR/CAAR CR to=0D
    m68k_move_to/from=0D
  m68k: MOVEC insn. should generate exception if wrong CR is accessed=0D
  m68k: add MSP detection support for stack pointer swap helpers=0D
=0D
 hw/m68k/bootinfo.h                            |  55 ----=0D
 .../standard-headers/asm-m68k/bootinfo-mac.h  | 120 +++++++++=0D
 include/standard-headers/asm-m68k/bootinfo.h  | 166 +++++++++++++=0D
 target/m68k/cpu.h                             |  64 +++--=0D
 hw/m68k/q800.c                                |  20 +-=0D
 target/m68k/cpu.c                             | 116 ++++++---=0D
 target/m68k/helper.c                          | 234 ++++++++++++++----=0D
 target/m68k/translate.c                       |   2 +-=0D
 MAINTAINERS                                   |   2 +=0D
 9 files changed, 604 insertions(+), 175 deletions(-)=0D
 create mode 100644 include/standard-headers/asm-m68k/bootinfo-mac.h=0D
 create mode 100644 include/standard-headers/asm-m68k/bootinfo.h=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

