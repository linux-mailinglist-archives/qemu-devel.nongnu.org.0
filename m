Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55179588F09
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 17:01:11 +0200 (CEST)
Received: from localhost ([::1]:37414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJFry-0002nV-EY
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 11:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oJFnJ-0001hx-Dp
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 10:56:21 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:46977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oJFnH-0005qS-FV
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 10:56:21 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MGi6m-1oEMFp11sY-00DpmL; Wed, 03
 Aug 2022 16:56:15 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/3] Linux user for 7.1 patches
Date: Wed,  3 Aug 2022 16:56:10 +0200
Message-Id: <20220803145613.428167-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Eu/ojb29HQVUEjJjXiNhjzTq4twgkiupCH7PWHVvrbsY+sdWpU9
 ewoMIVpNkJkOL76XpZ9v30YBF4vFhvPEU09RfDbH5u/yJSZhLd8DUMQBC91f5LqwlHhQ+Yk
 /vu6EDqMhvIzBC8d7ofBHVl+afTyrnvD8WULMlmvdPNe7STi6d/CHlhNEEgPBIRpIMHl48D
 3Zn1Hod0agu/iOpo2ac0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S1tLRjNMI/o=:Xl9e7nh2ZNq7djceb+G9hf
 /PLYS+m3IWTr0d4ab1r9bZ/RnPpsDXOLecfNIt+upKj5IrIb5nSqx3p6uiCNzso9Ymyd737gv
 GLZV/DBVBrLmoxCPJXQUZuE+U12lnsM7ZVQ5xcXHAIyxbg1NR9IG+e5tOYVkxI4hqITs1ORSC
 J38uSmNxDOI8m20LrO26gvdu3aRMSBOFcvDLQBGHLma053hoq/PRRyR0j0rb74OIbjpLsEI8B
 eF2Rnr+mL2T/Nt+26Qlf+HYmF77gR0kJrx4RdkfsnBPRQtOAZ6xyrRtKqoJwTYUfaa9svbKPR
 ouHhFxgCrWeFf+041wcNsp/YNwSSGs+OaQ47DxARQVWvcyg/jBHUwtZMsmiIulQMm/vay4719
 24z8HwwWWFlDYv1o+O9q5aSNBtELozymvTZYKalvkqdKg2dmZmMhjnMMXYKMuqB5r2t0qMAvz
 250SlMmRFxIFzaJOExVobf26cxp5f5FTp674RKUEMW0LQ2DtnQzYDcOUvy5EZ9FJ7dhxFNaVL
 TJR7uoEqFZvRNlpzm1PPk5gCT2RrxffPzU/JA/LKpcJt4xOXx4DV4KBTg2SwlVbtP2vUvFThs
 Kee2OaxuviKDTAuuNKy1AXuPu0HlimR29L/d22hZF7il/gbNwY8yA8O7KqM1pA2Li7MiUCrvX
 qceQmtvJL2Q+irI3EzoskyxjsxVnaC7/EhaUQwfv6sRjp0JY8b84xQ+6dIQDLj/Ewg8wFwaRc
 EE+GMarJAjruW6fugQhjG9j18kh/xHsXg6usVg==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

The following changes since commit 3e4abe2c92964aadd35344a635b0f32cb487fd5c:

  Merge tag 'pull-block-2022-07-27' of https://gitlab.com/vsementsov/qemu into staging (2022-07-27 20:10:15 -0700)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request

for you to fetch changes up to 5b63de6b54add51822db3c89325c6fc05534a54c:

  linux-user: Use memfd for open syscall emulation (2022-08-02 15:44:27 +0200)

----------------------------------------------------------------
Pull request linux-user 20220803

----------------------------------------------------------------

Ilya Leoshkevich (1):
  linux-user: Do not treat madvise()'s advice as a bitmask

Peter Maydell (1):
  linux-user/flatload.c: Fix setting of image_info::end_code

Rainer Müller (1):
  linux-user: Use memfd for open syscall emulation

 linux-user/flatload.c |  2 +-
 linux-user/mmap.c     |  2 +-
 linux-user/syscall.c  | 22 ++++++++++++++--------
 3 files changed, 16 insertions(+), 10 deletions(-)

-- 
2.37.1


