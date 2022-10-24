Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F97609D5C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 11:02:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omtIG-0005Wm-3s; Mon, 24 Oct 2022 04:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1omtIE-0005Wd-23
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:58:46 -0400
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1omtIC-0003NN-Cw
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:58:45 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MStT6-1oecM32OXW-00UK6V; Mon, 24
 Oct 2022 10:58:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/2] M68k for 7.2 patches
Date: Mon, 24 Oct 2022 10:58:38 +0200
Message-Id: <20221024085840.3023854-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:c+NX/XlQMC2PY8zBm670vNUZANsJYpdyK1en1oMZLa4ZnJzFreV
 wETA7EjrluPMdogisJIJyRTYvkE5YGPW2TM+tjLyeHTOY/6fYcAo0nPyx6qCalcoZafuIE1
 saaGw8X6U8lAOF644nL0MsuYBZNpJUtWyezEK0c426DDmDWCbdriEjK8tE/LAK23BR9Udhb
 SflijN2LaEprNTZ/i8wQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p4jViXeRvVc=:6/jRT+/CCjXdYslJJ7CT33
 5BFWe3qCzubRa4fW2xj6m93QtUF/JCzYu+Gib+22tc9jge5/+wkfzd/sLEgRiruEjToHzeEOp
 ShwWVkETs7iqvK6KuD1ajl/LDtqwpfvUOGNmggQynTK8ZvxeiC0NH+Ve0mCt4ni9bkNVOcHpS
 ycgxiQ7toPd2mfqzfpwpSHdo17Lk3VGgL/pQkzsVNoLgb9W4P+jQ76TacaClu+O7vgJ9LaUxM
 T1mfVVV4vmv01jKTDCrzMo2bUiCd15QkwUSDi+FJ6/U161fgiQRT5IG8ELDN4cQOBYuBAlo11
 MADw2wxBzFeRXeFfaR8TrTrpnrpK7bZcO6BeFN+ZaPcCkpkGoeAE0y6UwqFfrBrtQjdVofNp6
 7SFbgIq4HDqyGubAKT+OsQW/9apX9NptTn3L1Xczizarq8sb2UK1dGXvFflRIQsreRoB/jdW0
 DkVxEas8qKRFsNQ5A+LQyN74NFrovE3WgKqW9EMElaFU+WZTZ7UN7oMycCNSuw1UYWe3JOuL6
 wK6XX4V2M/6++iLLWPwrDtapfZtAOTffX7Zodw2wSe7MJZLrWdrrseasw+h1IFBYPNLPyaPiB
 zTVACNwzzfuy0hcxixRPh9wr7jQ5FWZkIzZyUv5EIqScoDNumec2YnzbudUJ/wvcic5A/cg6D
 3cZg70oL60+IQeN3ZBDjjoIOFpJIr3+neYKvqU002iphIWJhBy1dLvrhEEIAG+11gTFFrjkJP
 q9FMVFg9a/X/Ej5hAwC9TxHUt5EUAzMXKNTNKG1FK9VIn458Qi6WFGVSu47s7TZ2LwBP1Fx/H
 U4MDjdi
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

  https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.2-pull-request

for you to fetch changes up to 281ac13ecedf8bfe1b83e566f39cb5683e553cb6:

  m68k: write bootinfo as rom section and re-randomize on reboot (2022-10-24 10:47:14 +0200)

----------------------------------------------------------------
Pull request m68k branch 20221024

Update rng seed boot parameter

----------------------------------------------------------------

Jason A. Donenfeld (2):
  m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
  m68k: write bootinfo as rom section and re-randomize on reboot

 hw/m68k/bootinfo.h                            | 48 ++++++------
 .../standard-headers/asm-m68k/bootinfo-virt.h |  4 +-
 include/standard-headers/asm-m68k/bootinfo.h  |  8 +-
 hw/m68k/q800.c                                | 76 ++++++++++++++-----
 hw/m68k/virt.c                                | 57 +++++++++-----
 5 files changed, 130 insertions(+), 63 deletions(-)

-- 
2.37.3


