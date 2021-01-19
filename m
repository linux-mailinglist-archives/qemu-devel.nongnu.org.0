Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FFF2FBEE0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:26:16 +0100 (CET)
Received: from localhost ([::1]:42540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vhn-0002rG-7A
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vDC-00028D-2H
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:39 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:50251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vD9-000416-Er
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:37 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MhDN4-1lf5i02ovC-00eQ4G; Tue, 19 Jan 2021 18:54:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Linux user for 6.0 patches
Date: Tue, 19 Jan 2021 18:54:22 +0100
Message-Id: <20210119175427.2050737-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8KmLErKEji2uFUj5u9NO7K1KaT+Z1g8DKDhKWPkm+kcrg/WPf2J
 W0Giu/5N28qJL54m60OQcMg9XQGYTrSMq2VzW6ZIgG5/3pKf7kBpRRiyuJkSkhMPpDKmU8v
 hJhdndLhfotf8X7oJ4nrmNgDWPKwGYN4G7wRrFlVKqH3JsCrGL4/9YNJ+xS2R5hcoNkSaod
 8IDlD0J/bZus7++q5jvWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GR943aSHcR8=:jGV6h+IUDx+CEWWDttrqkP
 B3oGZK23eCy7we18MMoQoK3ZFVfdnmFwVs4KzlQ0dRAbIvg65yUaeE+mNePkRam8DgC5oxACt
 aSFoIoNWP5BfHDuSjgGAOAyogiiby+t1IHyMF/gHsGvXnxcc1tbeF6pqSdU5IPxHwzrIv6mmV
 cFGv8HDMYnM53OQ/6apmvwR+UsMVEhKBRDkVYQ16taswDMkE3rs81AQKe23VKzpRBCwlRUMu1
 MUXQOEH6N/gphX15KczGFqNNMwgGG26a0G64enK4QCUOpB9xSMdLuiqtGHHSnhiAin9jrTBNA
 vYCkSY/HQUadQ3FiKVv/D2hjFWz8oaLA819MHSGLcS0ivLHS0fmeMiPSbOCkVaaIoQFDoffpx
 swzd4HBrGqovEVe01IImyWtLIKD4aZjVNHsFTTJylBfO9N7tY8BEG7Ebzm4Bw1gvWthvAq1sp
 4SuU2qM3Nw==
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

The following changes since commit e43d564fa3a0d1e133935c8180ad4f4ccf699f33=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0=
-p=3D=0D
ull-request' into staging (2021-01-18 15:19:06 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request=0D
=0D
for you to fetch changes up to 07e6a3d4e5160955203b82d7ed0d8f523b6b8963:=0D
=0D
  linux-user: Remove obsolete F_SHLCK and F_EXLCK translation (2021-01-19 1=
8:=3D=0D
53:58 +0100)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20210119=0D
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
 linux-user/syscall.c            |  22 ++++-=0D
 linux-user/syscall_defs.h       |  14 +--=0D
 5 files changed, 172 insertions(+), 24 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

