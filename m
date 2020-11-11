Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358072AFAA4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 22:42:14 +0100 (CET)
Received: from localhost ([::1]:37572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcxsb-00028U-00
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 16:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcxrD-0000t3-FT
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:40:47 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:37405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcxr8-00068d-6S
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:40:47 -0500
Received: from localhost.localdomain ([82.252.148.166]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MyKU6-1kMVrc43Se-00yhKj; Wed, 11 Nov 2020 22:40:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Linux user for 5.2 patches
Date: Wed, 11 Nov 2020 22:40:31 +0100
Message-Id: <20201111214033.432676-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:45ikdzCuol9QG8dNeXRFv39jwHywDpPc8jfgRk0boaNu36OJtBt
 ldQfzd4b3qtldfLsx1vQe2WZxdzXziB0O8RDLaX/AWUEakg/rWi1f7NWG08zaKngjVqoRDR
 bI33QA0Y3FfUyJPh4SHUPLArSo8WQFWknCDcYZFiDu5PWe/gQ05meLEMhCL9EuEvkOmdWCr
 zxiB3bvjBhqh3q75rjuIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yE3JWnEf0I4=:YLON9MwIwjS3DSTy1roNXA
 sQlw3Hb9GeLP/yP448mCztd8oihvrkpkLyDZrHN7bHt311BUpkh2hT3pn/bKKEj4hq3ure4+3
 vJJZTq3W0Kjk92xUTNznBWnHpdM6ZM6SA7yAuwSC94359nbLoDyjNbKf1i2Z6t0X3v5rqbvvf
 gRePDNJTwcNsBiKJ+aPsMfXwjOefLYO5wAyu9Vzo9ixyq/o1twOFku8fK49XXxM2iqyBaf7Nm
 dxyoz7DpbJQxJ0kc2zhoy5zT7KQ0D9kSqxDKmiMCM1tFG0pbKMCFxVOLHTEhm1c0DoMkAyAqZ
 6Drpg7At/v5ToDHFfvvcESlRDCp7D5Xcja0kIUuzhoeQ4EgWhE12y86ZBmZdDOyJP+/A7agNE
 NrGxEsaEvVrBW8gcVxMPn+ZGLSYWeG/ap6mshRcDb30Uk/HWJ6KvPZxgyAc8ZEaUyoLkx1k+l
 10CB+IX6ug==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 16:40:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

The following changes since commit c6f28ed5075df79fef39c500362a3f4089256c9c=
:=0D
=0D
  Update version for v5.2.0-rc1 release (2020-11-10 22:29:57 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-5.2-pull-request=0D
=0D
for you to fetch changes up to c7811022ebfcaae64e06383ff734f3b3651bf892:=0D
=0D
  linux-user: Prevent crash in epoll_ctl (2020-11-11 11:01:08 +0100)=0D
=0D
----------------------------------------------------------------=0D
Fixes for epoll_ctl and stack_t=0D
=0D
----------------------------------------------------------------=0D
=0D
LemonBoy (2):=0D
  linux-user: Correct definition of stack_t=0D
  linux-user: Prevent crash in epoll_ctl=0D
=0D
 linux-user/alpha/target_signal.h      |  3 +--=0D
 linux-user/arm/target_signal.h        |  6 +++---=0D
 linux-user/cris/target_signal.h       |  6 +++---=0D
 linux-user/hppa/target_signal.h       |  2 +-=0D
 linux-user/i386/target_signal.h       |  6 +++---=0D
 linux-user/m68k/target_signal.h       |  6 +++---=0D
 linux-user/microblaze/target_signal.h |  6 +++---=0D
 linux-user/mips/target_signal.h       |  6 +++---=0D
 linux-user/mips64/target_signal.h     |  7 +++----=0D
 linux-user/nios2/target_signal.h      |  5 +++--=0D
 linux-user/ppc/target_signal.h        |  6 +++---=0D
 linux-user/s390x/target_signal.h      |  2 +-=0D
 linux-user/sh4/target_signal.h        |  6 +++---=0D
 linux-user/sparc/target_signal.h      |  6 +++---=0D
 linux-user/syscall.c                  | 26 +++++++++++++++++---------=0D
 linux-user/x86_64/target_signal.h     |  6 +++---=0D
 16 files changed, 56 insertions(+), 49 deletions(-)=0D
=0D
-- =0D
2.28.0=0D
=0D

