Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A122D8947
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:31:41 +0100 (CET)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9gC-0007i4-Sp
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9Tq-0000TX-Iu
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:18:54 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:40585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9To-00022p-KV
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:18:54 -0500
Received: from localhost.localdomain ([82.252.152.214]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MhFpq-1kBFaB1Ubi-00eJWg; Sat, 12 Dec 2020 18:55:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] M68k for 6.0 patches
Date: Sat, 12 Dec 2020 18:54:53 +0100
Message-Id: <20201212175458.259960-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FCmJrOLroCx0shvqYYtZYp3pJWnAAUCbmHPMucVgJCST5E6Tu3s
 Y8n52P3VO+R/Z2g9VvPuKhPTau8fX4fotBXN/PdCHWWpmx5WNAGf1+qK7ydHadQ8kIX0S0P
 2aV1LuwuXNS/gdekWEDLx38cGu4CsGj+zrW0vKm6e7hWTd3l5QZ8/VLBKIL/H1ujSfD/JR3
 PRh3/85jhm82vzqbr1uAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LaajGPsEfK4=:hlunKluwhYJRYSsh05auRU
 ZvqjB7wgWFENB3sqiWHZS+ysuxpoSvVs7bFWNoNFWS/pcwcbRP4eM1SKJRCT5UquZLcAfYzeu
 TZmQRUBa+3Vmb8xf7P7Nj6gbkcFDJJUSmmLPXdU9Jyqx1QzfF1uKJ9n93J3lAwKmztAA59y9G
 r14cItys+ly7yvgwt1vA6XdYfQZ/ijo1u326mNgrk2At7x/6P+ddUOgnI7aJmAuQmIzaIwXYV
 zns8/nGzGz+Q20N+5uOKHY7PcPfi3TKtWZnMkaPOxO3qLNJbWfneU4CPJ2MM/4pnnVmBqH0mw
 hhqNzxj0d+Qe7tr+6s3/VpTwB5FmkMOTnGsBkugPTz62kZZr6raCE8nKW0V3XKKCCFl/UUOjR
 k+luhw4U6hamLJbuyHFA7NWScAe4ce9FQNSQ7OWR9SL1Eo0CgYG3ALUhHQvap
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

The following changes since commit ad717e6da3852b5729217d7938eecdb81c546114=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into stagi=
ng=3D=0D
 (2020-12-12 00:20:46 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.0-pull-request=0D
=0D
for you to fetch changes up to ce00ff729ee8461dc94a1593d25ceda65d973d3c:=0D
=0D
  m68k: fix some comment spelling errors (2020-12-12 18:12:43 +0100)=0D
=0D
----------------------------------------------------------------=0D
m68k pull request 20201212=0D
=0D
Fix for Coverity CID 1421883=0D
Fix some comment spelling errors=0D
Add m68k vmstate=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (2):=0D
  target/m68k: remove useless qregs array=0D
  target/m68k: Add vmstate definition for M68kCPU=0D
=0D
Peter Maydell (2):=0D
  hw/m68k/q800: Don't connect two qemu_irqs directly to the same input=0D
  hw/m68k/q800.c: Make the GLUE chip an actual QOM device=0D
=0D
zhaolichang (1):=0D
  m68k: fix some comment spelling errors=0D
=0D
 target/m68k/cpu.h        |   5 +-=0D
 hw/m68k/q800.c           |  92 ++++++++++++++++---=0D
 target/m68k/cpu.c        | 193 ++++++++++++++++++++++++++++++++++++++-=0D
 target/m68k/fpu_helper.c |  10 +-=0D
 target/m68k/translate.c  |  16 ++--=0D
 hw/m68k/Kconfig          |   1 +=0D
 6 files changed, 286 insertions(+), 31 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

