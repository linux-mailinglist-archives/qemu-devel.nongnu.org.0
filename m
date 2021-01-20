Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC3D2FDA36
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:56:28 +0100 (CET)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Jad-0004Vn-7l
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2JXk-0001z3-TR
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:53:29 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:54589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2JXh-0002zi-JP
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:53:28 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M1ZUb-1l0vhS2TJD-00331y; Wed, 20 Jan 2021 20:53:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Linux user for 6.0 patches
Date: Wed, 20 Jan 2021 20:53:12 +0100
Message-Id: <20210120195317.84222-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:33IXtZ9jipxu1As0Nw4+TbjbcHCS+0x73HdNkrigNZ93P3MuzQM
 vkSK/CPUF3LDZnGBPzmv4Tb0WGRAUbrXI4eP4fR2mRWyjAUvDgTPFMpHQYiVV81goZfM1Ap
 OSedtm+grBBsk8EhdIk60rM442X8Uy34HYDJnCyNG27zZ9Gud5aMG44/70ojvkaBSycz6Yt
 W/1H8BFI6JNCkW4ucF/1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HgMhgggewKg=:YhWEq3oHb6pfJq+ob74eYM
 2YgbwZu1Ds/z+gTI7pWJ57k4g44b1cfO2vfZxMj+0SxnqUfe4w8n0ZS4H3nrk+SdiQKhKKBfX
 +Yw8RQx/v6a7YEAqboD2QhbhEmtEIofuk6btqoC/6CnDpA8TgOY1oVVRvPcULHc1JtDLxWumW
 xefxY2rYz2mnO57dwl63oj2syKDlZU/S2TzKhITiBYp/o9lML1Gh7bR+DX83+fQ6gKyeqWyPV
 GSuYEnTOEnagpqFUigmng4dsUyplmDT9KOOz9L8y/GcI1fapbBEwqSGMUIFgnXgyFiBjOc0As
 bXYta7g/1s5hR84STF0+vig98zJ97C3IODy18gMwT6HKDgWqEGVyGwYS2xOFEqTflKpC2Kg7y
 I4sKHsi7RImIpp7J12qpumnP+NrRn80bC+PFeYWLHj8EvDhVRfgxwi8dzEmqTSeypKUoJcbfk
 kg0pnW2nrQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506=
:=0D
=0D
  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210=
11=3D=0D
9-1' into staging (2021-01-19 15:47:23 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request=0D
=0D
for you to fetch changes up to 8a7e49050b8d5477a567b0ec5d764a564481abdb:=0D
=0D
  linux-user: Remove obsolete F_SHLCK and F_EXLCK translation (2021-01-20 1=
8:=3D=0D
26:46 +0100)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20210119-v2=0D
=0D
Remove obsolete F_SHLCK and F_EXLCK translation=0D
Update sockopt=0D
Add F_ADD_SEALS and F_GET_SEALS=0D
=0D
----------------------------------------------------------------=0D
=0D
Michael Forney (1):=0D
  linux-user: Remove obsolete F_SHLCK and F_EXLCK translation=0D
=0D
Shu-Chun Weng (4):=0D
  linux-user: Support F_ADD_SEALS and F_GET_SEALS fcntls=0D
  linux-user: add missing UDP get/setsockopt option=0D
  linux-user: add missing IPv6 get/setsockopt option=0D
  linux-user: Add IPv6 options to do_print_sockopt()=0D
=0D
 linux-user/alpha/target_fcntl.h |   2 -=0D
 linux-user/generic/fcntl.h      |   5 --=0D
 linux-user/strace.c             | 153 ++++++++++++++++++++++++++++++--=0D
 linux-user/syscall.c            |  23 ++++-=0D
 linux-user/syscall_defs.h       |  14 +--=0D
 5 files changed, 173 insertions(+), 24 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

