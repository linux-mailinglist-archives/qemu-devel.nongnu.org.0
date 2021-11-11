Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC1344D585
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:07:38 +0100 (CET)
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7ve-0004IO-10
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:07:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ml7tJ-0002SE-Fl
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:05:13 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:40595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ml7tH-0001N1-Mu
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:05:13 -0500
Received: from quad ([82.142.28.210]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MsZBb-1mRwLf0fsJ-00u2fT; Thu, 11
 Nov 2021 12:05:08 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Linux user for 6.2 patches
Date: Thu, 11 Nov 2021 12:05:00 +0100
Message-Id: <20211111110504.1574242-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Rk5rzjToR2kWuF5ezLxnTW3MJCOjK6y7d3gvp3n6ww/PSgixzxF
 puuYCEG01SRS4WYwRJbXq7uI68bDiXnzOPViufoCPVcPtTZ7mk8A4Mz03zm9HNddLEpX9Zd
 AVnfbukX1gFg/Wb0VO1uzr6EATWe6PcNfeHx4FyhV6GtwGBb9Feon4IalZWZ9HmdYlGvlCO
 ZrD8hyD/beogNuNpVdadA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yi9HfIMZV2Q=:25637QLCzmvNl2OkugCVaq
 iFmSNylaD2GjMBJkT7NNP1ygqTXD1IH26BQpDJQ/b491bCkI514aUPR8A3mJxwZiaNC9Qx8IL
 AhLbyJW/wo0sPuSjZo3gbacyNPQN/RIKpv9RbSgUzUYZH97WrWRZ0tiPF4L9FJjC+m1iSnH5/
 J/gu+LvOmqvGT3lNpQ1KfgphwQ8liXLo2K4iGMvHWNRFG4SnJE1HburnUfH+Ij/aa7HMCaJIz
 L4bLPpmQGro6rlFjxWVVwUaVyHV//cSqDymmdf0qCDMttTTl7AyrNX9Gqz+8ulu2KHwwaULn+
 anWJR/o1zH5AFQwwvMynCKK0yq7VV0YTNVoI7o2fT/QUVMOhJDCeMAO6GuiYWLt8QTx4vVU7/
 lX4xWZOTqWmXgXKOYQu/EK6Q6Q2iqndAJjA78XR2vwkxH4NbW1dNk+jocqziP12uyUZrGDyS4
 98pLRvrQBiIWdgCRS6IXKE1n0Dmzk5Re8RRmJ44zbwb6f9zWJeCALbbPhqOTHXHGhRJWJbNq2
 PyEI0EEG4Osz6irt0ZfHwn+MUU0NG3n6Rvs5rjKXjv6z7Zx9KApoBIidP5faWuheZRdaYVwU8
 Ya8OPD515hpazTREAJ9VOPEE+kw72yQwNxcK8auvPk6mZOs1NFuai+YAbUe11owQWqCxHpCSG
 b6+la9kiQukvRyOsLecomujNPWLEriG5BLAW6EZtSWI+dEHY5C8C6axl4RMIW90wU3Rk=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit 856f9fa9a2c528dc29693d3b3a64a9b93bf866a2=
:=0D
=0D
  Merge tag 'pull-jobs-2021-11-09' of https://src.openvz.org/scm/~vsementso=
v/qemu into staging (2021-11-09 21:40:05 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.2-pull-request=0D
=0D
for you to fetch changes up to 3c499fa24521527e933e171a9b04a896a1c29cf9:=0D
=0D
  linux-user: Rewrite do_getdents, do_getdents64 (2021-11-10 11:21:16 +0100=
)=0D
=0D
----------------------------------------------------------------=0D
Fix getdents alignment issues (#704)=0D
=0D
----------------------------------------------------------------=0D
=0D
Richard Henderson (4):=0D
  linux-user: Split out do_getdents, do_getdents64=0D
  linux-user: Always use flexible arrays for dirent d_name=0D
  linux-user: Fix member types of target_dirent64=0D
  linux-user: Rewrite do_getdents, do_getdents64=0D
=0D
 linux-user/syscall.c      | 290 ++++++++++++++++++--------------------=0D
 linux-user/syscall_defs.h |  12 +-=0D
 2 files changed, 141 insertions(+), 161 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

