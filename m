Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87CB60C682
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:33:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFMU-0003wM-Uz; Tue, 25 Oct 2022 04:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETz-0001JP-6F
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:24 -0400
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETw-0003GQ-OV
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:18 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M1q8m-1opROy1hcm-002KZG; Tue, 25
 Oct 2022 09:36:08 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/8] Linux user for 7.2 patches
Date: Tue, 25 Oct 2022 09:35:58 +0200
Message-Id: <20221025073606.3114355-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:v0gMG44PimYnooaC8i7WP3TXzkuJwjgdS6HZcp2c4+ciOZI4DxP
 SamjXxOUMoU1iEJZ1OGZmwXgf0vZ0utt349O1oePXugtR4DPSjnz5xTA+vCysApV2nG10qv
 reZha3pwg/nFTQfNhwdxYyNLEsnJm/6rtnRZv2kPx0ygr/nJizH9Ossz2D+gA5O6x38wwo8
 bMAsXx8v64ma6MEIn49Yw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zer98rLoVMo=:zulOGxm9CUUE5oQSMmBG1Q
 X/NQUry3y9ex6yujeSoM0brUpgjug3ATI2B7JuKD4QkPyPo1ufhXVTQizUEiobylk7D1eNU4B
 nm9PTtwSPcXhdcL5/cMrSMrmb/6Z+TLJC6EZA0aZ6JcVZWmCY41bsSiZGCD+6W2g3vfZRS6K5
 /EjkZ79SOOAPRyj6EiZnOqKAHrAQkeKduRd2A5Irk211Q9sqNA4QLC3DWJs2i78qOch1gVb8T
 OQPnpTT+J3AncDQpz6UviE780pWHiFjVsIKhcKRDTvGt/JkHDaYgjd96COyq6NG+jB5TQenYv
 hoNNw+6oj6J05izy8x0UCM5UwWFK4znC6pgBoHR8Jw411U4ZWYlKR39l4PCX7vP4xpZY5oO4U
 0BLavyhi69TNdF7jYNCo7CCV9gtdbWP62hql/aXgcrERaA/iIbOA1rT2gqC0ShJO78rU+wI+a
 YksPEDyTS7sAc0PF5E86PmUvUGJMYK2BkU5j3iVUuOfj79GnA4D6Tx7h4UPCiJjF1cClRN3rl
 XPp9ArxQKKcUIo7J/uVl7ocxv+YrLHnfZgLnRnQs2n+nkZa88fNdofCyaI78EEDjEArNlYKGB
 7gZuzrvHwBatWqW9cxfyStdBvQUO+OlGpvUjYMGg4IMhaRcvpSL20UNWdr2z+6Kb3+Eu/b+Ce
 j2D7JAvUx3qwjCL4mVF5HIF2RfjZLr9+0koLBoPyHdcFLMc4oDoY+3+lG2tsbYQTw8r+es7Xt
 PX8zzyVm/149aFCRGzA057ikjXmGwHXXnueAArNxCwHt8N/CB0qhPRsRK4QVMlyRUmNQsa+kq
 MCbPOId
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:

  Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.2-pull-request

for you to fetch changes up to bd5ccd61080abf976a6a6cc2d09d31299bea0cee:

  linux-user: Add guest memory layout to exception dump (2022-10-25 09:20:40 +0200)

----------------------------------------------------------------
linux-user pull request 20221025

Add faccess2()
Fix ioclt(), execve(), pidfd_send_signal() and MIPS n32 syscall ABI
Improve EXCP_DUMP()

----------------------------------------------------------------

Daniel P. Berrangé (2):
  linux-user: add more compat ioctl definitions
  linux-user: remove conditionals for many fs.h ioctls

Helge Deller (1):
  linux-user: Add guest memory layout to exception dump

Laurent Vivier (3):
  linux-user: fix pidfd_send_signal()
  linux-user: handle /proc/self/exe with execve() syscall
  linux-user: don't use AT_EXECFD in do_openat()

WANG Xuerui (2):
  linux-user: Fix more MIPS n32 syscall ABI issues
  linux-user: Implement faccessat2

 linux-user/cpu_loop-common.h |  15 ++----
 linux-user/i386/cpu_loop.c   |   6 +--
 linux-user/ioctls.h          |  24 ---------
 linux-user/strace.c          |   6 +--
 linux-user/strace.list       |   3 ++
 linux-user/syscall.c         | 100 +++++++++++++++++++++++++++++------
 6 files changed, 96 insertions(+), 58 deletions(-)

-- 
2.37.3


