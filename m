Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47DF590F97
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 12:40:09 +0200 (CEST)
Received: from localhost ([::1]:60982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMS5I-0005JG-K9
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 06:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oMRzR-0000B0-Ay
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:34:06 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:43219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oMRzO-0007Xp-Ux
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:34:04 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYtoe-1nrhjB11pQ-00UoWJ; Fri, 12
 Aug 2022 12:33:57 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/1] Linux user for 7.1 patches
Date: Fri, 12 Aug 2022 12:33:52 +0200
Message-Id: <20220812103353.2631628-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Sbt3AIVSm93hq4TV5LOmzkH3DHg06Ux9QpFYx2G2vjudRESS8on
 o7Ffh5sCbjIUO/10G/JLP36od0a/35P1LCth8tAIDUXSZxOv2/NqWgdI0KGIT8BMl9VtLBo
 CHdGqiLJqSnRTO93hmJ0SWWngjU6+EwPmMWObzryWqpH+DAuzmk+CJfufqMuLi5srKYmIyd
 vnxqKLordybXsv9HaXRhQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5jY9+74ZBL4=:KekTZE0jxGZdoAGHewD85Y
 CYzDSLbIwZ3u9KCcK2yO4Xj4OE4x74vXK9OLarT58cayeNcmiQY+DVAF7kNyZvJcv4QOXcyaH
 BF+f4vXOMbLtF6WujEUmorodWilQYBCoX2Z7KzBbzxmmCD688kBT0po+shkLA8ZqPJELJZwoU
 LvlKKj1m9EFdKeLa6eqyCZlbTgUQOGQ9JbJawI41tjFJb3IyIrSj95ci5JxwfxmH93j69fs/n
 pi5EMMH82z16W+0XUlWjfJopc5la4aB25AsYsiirZL1kxJeWtpSNPFZ/GDppK6TEhNw0MMPjv
 IUfI866JxIrgl6tToiT+0g/op/Q2mIIru/wXVRNA+ZivrVwHB39wQjgXq6tNSztTvlG2FFnKa
 GGcQhdzMfVvGn0ExNeJEoK6g5RYKoqwZ1YcZWi+wC/RkVcBQlMq1jl04o32Cfoc0dpUbGX9ls
 BXDn0Cmeh3arK38SCfB/AysK3G/P3KYTuMAcME3yg3j9Xi1BaATF1syoBaH2DhoosPfoa/hrb
 NP/gqIYeUggX4n3JlNQwF7onYd0s8512tM+CQ3xTVQHQqML8ZrMTfeK/Gawsrq85bK0I+F2j0
 UiVPHjW4KfH5C3NbXqg3NoVa4PqXoJW6lJ3FidqgQjBMjlhiku2M3F8maU5Epc6UAVlTh67Aa
 1xEFEcx/YycfHflwE4LibK6SgeVYpRt38ciHnjn/ZosLClskl+6/t6Le5RzDtArlzjMPWEd9N
 sDF9FrxDrkiWIAGiUtwjIzz2dsNapJF/nXWX9Q==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

The following changes since commit a6b1c53e79d08a99a28cc3e67a3e1a7c34102d6b:

  Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-10 10:26:57 -0700)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request

for you to fetch changes up to dbbf89751b14aa5d281bad3af273e9ffaae82262:

  linux-user/aarch64: Reset target data on MADV_DONTNEED (2022-08-11 11:34:17 +0200)

----------------------------------------------------------------
Pull request linux-user 20220812

----------------------------------------------------------------

Vitaly Buka (1):
  linux-user/aarch64: Reset target data on MADV_DONTNEED

 accel/tcg/translate-all.c | 26 ++++++++++++++++++++++++++
 include/exec/cpu-all.h    |  1 +
 linux-user/mmap.c         |  3 +++
 3 files changed, 30 insertions(+)

-- 
2.37.1


