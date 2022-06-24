Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDD3559706
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:53:03 +0200 (CEST)
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fzp-00052Y-PB
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o4fwi-0002rr-V4
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:49:48 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:56821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o4fwh-0001aS-6G
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:49:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mbj3e-1nWzHq3h42-00dCWP; Fri, 24
 Jun 2022 11:49:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/3] Linux user for 7.1 patches
Date: Fri, 24 Jun 2022 11:49:40 +0200
Message-Id: <20220624094943.729568-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qZP/DVp5VH98NAdIdxxxYxL2OPt98VuwT1OC5CDTBFJchE8Mf0X
 ngpeEvoHV8BKO0JDqVpg/YzwxcOy9NmTbeQUExT73qZtGkRfiG5Sf8EwImVq88ZH2wG4jja
 PJFia239yX8kytWIItONcg4tAWiMRwmHN4syWrW2Y6TkjGPoXz8QRaMaFDUuAvV+gWJejea
 lVhpCr9rYEReyxhxgppAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:npUw8p4VX8Q=:gm04WgMag5CWHwTn6NgCof
 za3Olqb4dPTL7sqM+OGOYgDru9Q+0JGoDCedbUjsf0nEz2eD4AdIlimd8MjCIFYaWnF4Cg3sa
 juRLKA1xS4PwQjyoatJIsi+W0fxCeZHU4PVJZ3zcM40SgTGGna6qsIob/HbAYxH3bmCPNk7g4
 kkgZId5WBtn+l5uSLmDmXL0oySUaIEGl/fY0XdnIWQa2h8yqxLvVcWx0NympDjlHxWXCpLqTl
 dduIpQL/lS8riODvA4jlFxmbc4F8gBX8vKwvZmf6BJ/39+tNKTg11c4xUNxluJKrRdKMMpM3j
 Me2H5VCmU/kjmPok9l+SX8zolcvpnwXDjjTNLMSfaepjFafpYjoQOaiZ5JtUmFUTR0k9tnIfW
 3U1gbK9FAJEmRUj/sPBHWzJULED5xnfVZwpTeHi2e0hutmvZI/XGqQiB5jyMsQ5T8F82bh+7/
 MPffy549hAaAomTVb2qZzsdnzharT6G/rR8s7pDSfYftW1CT/JuNLJS4FFGMP8reEt6vvlvlA
 p0+cVCREmB4r/kx31KT20DKK0eC7JfrdfwY9hQh37Z18pqq8HPk7GI1eW9dZCPqU3aqXbT2mB
 Nl6tTbTLQPe/uu2FudIwkpU5ranPDUjPrTrGPKZ87FXb4ZytcJkjwfvynuBy9Yq9APBn4sgJF
 CD5WxY1E6RqoA2Hi2GtLL+UVBlbfg/8ABqKwWPw0+UkQgzgDErFKxrEKRdGKJixM1M3f5u+XY
 ZsDlE4oILS26jKnye6qvZec0p7KYi/jc5kDRtA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c8b2d413761af732a0798d8df45ce968732083fe:

  Merge tag 'bsd-user-syscall-2022q2-pull-request' of ssh://github.com/qemu-bsd-user/qemu-bsd-user into staging (2022-06-19 13:56:13 -0700)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request

for you to fetch changes up to 9a7f682c26acae5bc8bfd1f7c774070da54f1625:

  linux-user: Adjust child_tidptr on set_tid_address() syscall (2022-06-24 10:00:01 +0200)

----------------------------------------------------------------
linux-user pull request 20220624

----------------------------------------------------------------

Helge Deller (1):
  linux-user: Adjust child_tidptr on set_tid_address() syscall

Ilya Leoshkevich (1):
  linux-user: Add partial support for MADV_DONTNEED

Richard Henderson (1):
  linux-user/x86_64: Fix ELF_PLATFORM

 linux-user/elfload.c        | 30 +++++++++--------
 linux-user/mmap.c           | 64 +++++++++++++++++++++++++++++++++++++
 linux-user/syscall.c        | 20 ++++++------
 linux-user/user-internals.h |  1 +
 linux-user/user-mmap.h      |  1 +
 5 files changed, 92 insertions(+), 24 deletions(-)

-- 
2.36.1


