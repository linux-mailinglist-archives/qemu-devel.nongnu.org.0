Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B395EBCF4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:14:56 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5jz-0001Zh-RF
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od573-000771-Pl
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:34:45 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:46525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od570-00022c-SX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:34:40 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N8oKc-1pH8WI2The-015nSM; Tue, 27 Sep 2022 09:34:36 +0200
Message-ID: <9bfd3987-e209-0f2f-7abd-e12acd51ca21@vivier.eu>
Date: Tue, 27 Sep 2022 09:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/7] linux-user fixes for hppa target - part 2
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220924114501.21767-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220924114501.21767-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uAx3vVNkZWvt3IR1ua/vpce5wDb537nlF7UZkmBQgjkZ4ksTdKu
 1Fz57LciBDdSk9mteeK37LPnfy9rKj4ot5IEFSo/Ex1BhemMyqguHQ1rqRG23KF578xH7/G
 DTVtEr7VaEn7bwgkNciE3usCz7s9hFQx0reaM7YIMk+99Bn08DLKtTbPx9PonwAOwj3n10F
 dYwFxW4tAphc3cj1y1PKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dp37bt5HpG4=:H5UMpB76kNEGcuCVGQ8C+k
 juNriE3QPlALX1QjMfs/MK6FxAGE888XUOlh8THV/U5WEX0iu/jpvljMUXePINgvjLGyYf8mm
 9iJDrypVIED8B4XnoUcLKBXP+YvXVwbJyzUC+0VUkoSMBXRH5lM1d9go2VBRSeMf9ZzSGHvSg
 7ekWP4wtOaokZlT/FJr2GtRGEN5r9Wh1juMby0EuatKbTOB1HgxHOfI6gAGTFMa4BDRytoi8J
 YCAKuxGARYpISa/cPRMOeHJE0FhCUsgVychMeHZNY7yrQDIVISm7njvNN6ZbBL0wVHe74Xdmq
 m8RLOe2ZLUG9xV9XeZtDq10KiZRwxmwivjeujdDU8ce91zzx7b5rbWjEuJlJK8oi46r1FMli+
 eDtgKH5DnArT2A7eMZHrrM4ZHoWGVueS8SEFmlyoXc6bVk1AuXAaGjtAAH5CekmvDRFiY8aj3
 rVXaFx/wbign1yyIMIjt/IBgaWAjGmVwHwMPNqvWbrJLVEpwpfr/ENHBiZnUWgr56QbmRRSg2
 SQxbWWzHqGBwt6tWDR2cfeNj9Ue58T38zEyi8YY7IICRDkFpycP+Fx7AdZL+VDK1UXD/858kD
 0Kmy+TO+X16H55DUpuQYcaImuK/7L5AzcYAVOD2OVS9KLtTnT+S2xJ52MVwEk02WJxKUlzwIr
 923sHja6axmcYZ5gm2tASKbUa7c1gmfIJtBRcfmx0t6xrIrA/ibIxkbMclgJPh2XRf15U9dQe
 0BjJho1bonFUpDuozKQjJuu8NGL9yCXzyBilwuqqniHeoeh8xYCPTAURut11hSwLhxIshnz99
 nd19kBw
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/09/2022 à 13:44, Helge Deller a écrit :
> Some additional patches for linux-user, which mostly target
> the hppa platform.
> This series is on top of my previous posted patch series.
> 
> Please review.
> 
> Helge
> 
> Helge Deller (7):
>    linux-user: Fix TARGET_PROT_SEM for XTENSA
>    linux-user: Add proper strace format strings for
>      getdents()/getdents64()
>    linux-user/hppa: Add signal trampoline for hppa target
>    linux-user/hppa: Drop stack guard page on hppa target
>    linux-user/hppa: Increase guest stack size to 80MB for hppa target
>    linux-user/hppa: Allow PROT_GROWSUP and PROT_GROWSDOWN in mprotect()
>    linux-user/hppa: Fix setup_sigcontext()
> 
>   linux-user/elfload.c             | 13 +++++---
>   linux-user/hppa/signal.c         | 57 +++++++++++++++++++-------------
>   linux-user/hppa/target_signal.h  | 14 +-------
>   linux-user/hppa/target_syscall.h |  2 ++
>   linux-user/main.c                |  9 +++--
>   linux-user/mmap.c                |  2 ++
>   linux-user/strace.list           |  4 +--
>   linux-user/syscall.c             |  4 +++
>   linux-user/syscall_defs.h        |  2 +-
>   9 files changed, 62 insertions(+), 45 deletions(-)
> 
> --
> 2.37.3
> 
> 

Series applied to linux-user-for-7.2 branch.

Thanks,
Laurent



