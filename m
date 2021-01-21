Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9452FEA60
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:42:51 +0100 (CET)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZIX-00084J-J5
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2ZEq-0006dD-Ad
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:39:00 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2ZEo-0007Nh-Eo
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:39:00 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N7zJj-1m6r6q3d1n-014zsl; Thu, 21 Jan 2021 13:38:56 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Linux user for 6.0 patches
Date: Thu, 21 Jan 2021 13:38:47 +0100
Message-Id: <20210121123852.91187-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EJc0GBN8tP4WrHSo5BIPKatx8K2GGWpQgOdkD66hUqOw1S3Zt6j
 MK5kHPgtcD3eoP3PlBPXwvOmY/3vfCObIQyoPILR5oscdFIjFaVSdl2q6tmKsTtql/YSXjI
 m1Xeznuwtouxxqn+gVzDFTa4X0lTkX+Pl8+zHF5v5Ly5HJf9f8X3Ve6V4bmibmQSNHDLxko
 X8JBz8wMRG79e3n9E9EZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AvLopiAsLOs=:O67tQNPylxnYkv5Wa5I4Wn
 +KNJfhX3VUA0Fzbf5B0SjmUt7dCC9cghYQut4+2XhUXxVRSR92xTCPdEKddTcM3arq5uydX7G
 qaaeLyI7kWjXZNxkGZqEpDfWPaLWw2LKqnDK63N3t/+76izMAUmrFyertqM2xNX8m35smXPlq
 08+F8hh1zlq/+/LW+fY1Ia820R85GjIxrndlucv6mCtQBCM9ToTk2R6TiAEt2HWHmBkjhjK+Y
 K/ECD2VqIoB8cadfQrJ1PpKTLAN/wRiGszM++6zTUMduDVdjkY5xTo2w9mENb9uA9esbkRbmy
 WAGMxVNrNIZ2fBEPf0+ZP6NmWr31oBIXdNMrt+H67gJ7VnlRWKleGtHEz6hlk8H7PgFIBoOuC
 5212YPlH5hSxHtN8BAXE3Fq3YdoNkPK/hfBsoed4bhPEeHYnE02PEzZVDLF9yQrc47MwTyR0z
 l44J+UTFKw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
for you to fetch changes up to b1d2e476e94cb215d9e19fef1049d413b414ffc2:=0D
=0D
  linux-user: Remove obsolete F_SHLCK and F_EXLCK translation (2021-01-21 1=
3:=3D=0D
27:34 +0100)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20210119-v3=0D
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
 linux-user/strace.c             | 154 ++++++++++++++++++++++++++++++--=0D
 linux-user/syscall.c            |  23 ++++-=0D
 linux-user/syscall_defs.h       |  14 +--=0D
 5 files changed, 174 insertions(+), 24 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

