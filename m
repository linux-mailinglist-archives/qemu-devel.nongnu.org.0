Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24408458A8E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:29:29 +0100 (CET)
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4hc-0008RZ-8x
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4bc-0001Wk-47
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:21 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:34749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4bZ-000345-D6
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:15 -0500
Received: from quad ([82.142.2.234]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MF3Y8-1mrIaV1CGm-00FWcH; Mon, 22
 Nov 2021 09:23:11 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Linux user for 6.2 patches
Date: Mon, 22 Nov 2021 09:23:05 +0100
Message-Id: <20211122082310.377809-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BV2UxaPkxg0tMJ+E/dOiLkhcRupKHJpFIL/3pYZdBRg9kK4Vg0M
 oolqSQmBHPSvTFVGKi26kiZQFOVKrdvyFNiAo0R7nBIOVJwScCCCAZ0N5hDcFHrpkm4BsYD
 xI95U8g4vsBRa9AxyImHIYo7F02958dNa4syw4yoPTJ+kNClxeLPJdPjiUTAxze+sjqEl20
 g+L9Z5nWkNqvlj5oPKMTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sq/xm8ZTLoQ=:Cdn7c9JnjdWr+Sm6XxrQvI
 EzCARTDVSraCXqBtKmSM7W53gs7ma9BgofCoOXRriabyx/gUKN6xbbq1V9D9WOXx7TBEVraG/
 qRapcWJ7NqC9vAb80Bz91DPY2V2an8eG+iwBUpal/hOrdjJcd8KF7Nk66ufr/WscaBZiySiwI
 6611B2hk7eJnAMlsQCF61g4/cUXrvo4IMsu/Q+VU+IoRYMoa/rlypLMWoUurMTW/b420r5fOT
 XyPS1jvjg7CFmLnBW3mQAMfO97Ntsx89cqVZ6eLmV04J8KUjT9pTaQqTiKM5DSLZUj5UICAvO
 rajX0aFALAVmAA+ZL5W5DtNOKF3lTju6CG6DwSocBhO20K5K0jYYvh2uQQ2lJmjRChcd7WawI
 4o6V9cqkVHJQU6QGslVkvRnaC0QOwH+ghBZwmmzKGxU0qTm3Ug8tMDSSVs8lZeDoH3aN7sU98
 h/nU/tAn/9wAbFPuzVM6Fc4VdblinAuzieM0BYp+Z+DZWastR8amFhh5nZnxhhPfER+iilzMf
 lLKRM8GRkdVRhdbhyP863R4Uzjc6XOthkrQkL4q3lQ12ex/QTMF7o6bYhY2bhXi7NWWce/z4t
 mTf3oHJscUKlCWfFp1sdEULYGpwSM8S7YVFyAypDDTIAnVpW0kCqnuo7EIscHzILeCVnRzni9
 I06KBgebg8+HKucLDIK13PZQSF7+prgl+ABiq+ZeOZYD505ApawCsPawyTJNwHb4rEMw=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8627edfb3f1fca24a96a0954148885c3241c10f8=
:=0D
=0D
  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging =
(2021-11-19 17:16:57 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.2-pull-request=0D
=0D
for you to fetch changes up to 802ae45e94151a6d3ee20eadcb865cf6c875df34:=0D
=0D
  linux-user: fix Coverity CID 1464101 (2021-11-22 09:17:08 +0100)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20211122=0D
=0D
Fixes for CID 1464101 and gilab #704=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (1):=0D
  linux-user: fix Coverity CID 1464101=0D
=0D
Richard Henderson (4):=0D
  linux-user: Split out do_getdents, do_getdents64=0D
  linux-user: Always use flexible arrays for dirent d_name=0D
  linux-user: Fix member types of target_dirent64=0D
  linux-user: Rewrite do_getdents, do_getdents64=0D
=0D
 linux-user/elfload.c      |  10 +-=0D
 linux-user/syscall.c      | 314 +++++++++++++++++++-------------------=0D
 linux-user/syscall_defs.h |  12 +-=0D
 3 files changed, 172 insertions(+), 164 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

