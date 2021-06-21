Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296693AE7E4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:06:57 +0200 (CEST)
Received: from localhost ([::1]:43040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHlY-0005f5-6Y
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjY-0002of-Up
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:53 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:34185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjU-0003tm-I9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:52 -0400
Received: from quad ([82.142.1.74]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mk0e8-1lXCOU0ODY-00kSkn; Mon, 21
 Jun 2021 13:04:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Linux user for 6.1 patches
Date: Mon, 21 Jun 2021 13:04:36 +0200
Message-Id: <20210621110445.231771-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zTDHwm9LOdtcw2g+1C5Al6eMOQwS2lEwx35BbkXuyV9ct1zx9ju
 FTSL+OvwEjD/89qEzB+GBvUKmHeErCh5gNxOE8rSGMjXvYXWDTQlDHDV0S52Lsa8N3Yd3uq
 RI7ytxv5st/ELh/36J6Eg6XBnOch6tXlavNYLYqf4JrpujcV04kZ4UJ9K//LeYq8utFpUpX
 2Fp+xJvai8bn2+nOMiKtw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5vdMqMBfUEA=:32iDvHGx6b6BZH8q2AuALt
 xXBiJ7IY0uH2eTbjPN8PY+hbs9wJnnhxc6EMAFXxpP9Ce/Cpxylwyd1+0LLGWndM30YPRQ1fL
 XkrVx01LQqcsL9yHBePkZ2waniNj7KPaPbj10FEdP2Gq0HiDCnP0OL4X58op2e6I++hXqZX0b
 nczZltWwHspNiKeIGlGhXOGOprgOPI3emMgk3lta7O6+SE2LwsgKCUe33AL5nLuPUNN07V0rF
 bs15A2vLnh/0w4fXdRtVcIxODAFaxFLxL4PozJQ/RWKPhAVznlLWGpLbIRXUJDfIIxjCUV678
 1ccxmQgtufaWGRu04ti3xug59Fb5c3OmhlGbhKRK6vVXFI0ZtwoZ99fD2pr4zl9Jn/0FdDCby
 B43bW6QqpHUZdZT1JwbR98zTrHR22CYpbwgucu+P8dhKKUv9egLcOI3q3iEgSpSQmZllXJMP6
 7t9R6CEzoiVB5aVXnyQgqmd0KjW3mq4WdP8L9jVdOPHEgMCxffhie409N1aK7zIiKy3j848ri
 nQYDgycrxn51QLjMLYWKcM=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2=
:=0D
=0D
  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pul=
l-request' into staging (2021-06-14 15:59:13 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.1-pull-request=0D
=0D
for you to fetch changes up to 96ff758c6e9cd5a01443ee15afbd0df4f00c37a8:=0D
=0D
  linux-user: Use public sigev_notify_thread_id member if available (2021-0=
6-20 16:41:47 +0200)=0D
=0D
----------------------------------------------------------------=0D
Linux-user pull request 20210621=0D
=0D
----------------------------------------------------------------=0D
=0D
Alex Benn=C3=A9e (1):=0D
  linux-user/trace-events: fix minor typo in format string=0D
=0D
Ilya Leoshkevich (2):=0D
  linux-user: Let sigaction query SIGKILL/SIGSTOP=0D
  tests/tcg/linux-test: Check that sigaction can query SIGKILL/SIGSTOP=0D
=0D
Khem Raj (1):=0D
  linux-user: Check for ieee128 fpbits in PPC64 HWCAP2 feature list=0D
=0D
Michael Forney (3):=0D
  linux-user: Disable static assert involving __SIGRTMAX if it is=0D
    missing=0D
  linux-user: Fix incorrect use of feature-test-macros=0D
  linux-user: Use public sigev_notify_thread_id member if available=0D
=0D
Richard Henderson (1):=0D
  linux-user: Set CF_PARALLEL when mapping shared memory=0D
=0D
YAMAMOTO Takashi (1):=0D
  linux-user: Implement pivot_root=0D
=0D
 configure                        | 16 +++++++++++=0D
 linux-user/elfload.c             |  2 +-=0D
 linux-user/mmap.c                | 14 ++++++++++=0D
 linux-user/signal.c              |  8 +++++-=0D
 linux-user/syscall.c             | 46 ++++++++++++++++++++++++++++----=0D
 linux-user/trace-events          |  2 +-=0D
 tests/tcg/multiarch/linux-test.c |  9 +++++++=0D
 7 files changed, 89 insertions(+), 8 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

