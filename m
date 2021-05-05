Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1066374369
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:22:39 +0200 (CEST)
Received: from localhost ([::1]:52778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLEM-0000a6-BB
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1leKcf-000847-4Q
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:43:41 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1leKcd-0003A4-3I
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:43:40 -0400
Received: from [192.168.100.1] ([82.142.20.222]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MUXh8-1m4hBu2mmG-00QVWi; Wed, 05 May 2021 18:43:26 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210505160344.1394843-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] target/m68k: Remove unused variable in ABCD/SBCD memory
 opcodes
Message-ID: <4c67e219-8698-5855-909b-21fb1c45a385@vivier.eu>
Date: Wed, 5 May 2021 18:43:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505160344.1394843-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/oqEoFhmbWMbNcZYDwPVkpAmG8nCs/1ScsMRS9f0/gTxx8wzBrz
 yRcAJlJ+92jmyO3RzxAjXeFQd1sJtXLFgywmwLdBF9TDost9imz0O4ZbBLVyALjUIFaOk+p
 Oxiol2nQX8WuKRomMzBqfhFcQarL7734rvfPZVM61rAkD3GZkVSy/UAL3Qzol7njXai8Trl
 uaIijJRkDBm/KiYZuePig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:47w0lN4I0YI=:HoMBm1uY7EWiLkQrOLvcMh
 fRsaKP6gPxAic7TKuIc5xJ6lx2UG9dmpsothkpqj0veKE2saFwcCmfzd42rmAnQhSSmID6t/x
 cdUosjNtFDpqoAW68Fmn90qEWd9J9+pKuZjEgZ5m4AyfmGd6Q2O2ajb7aFGdTIgrXrWJx347e
 JV0vbXRiDrBSxhXfY3bVtpcvRlBFHCKwuzEvVJxbg1ZHWKP3W4vD/e8C8kvX6eq08GQm+eYNk
 86TsogOh8cH+FWpTc9tlJyGHNAJueXIjLD9upC4bxWtAiSOM3zvNPNGYtnUbVwCcqf9dENsHG
 mjyNV2MtO1RcoENwSm6XYY1j3vveDIz9xsqqMgLDwqIndlFTLRHuxfL0XHE1Lf1YetQEHOPuR
 X33Lgyn+bwEtEaY7xwdnys6hZXKHkZpi1gVCFiHbqDySsrmzPoewnHBLaNVQMfXxYr3c8TQzL
 clr1ccLtKy2uxEabRcA4vXRoQZUXtgQPnzsrcxonN5f92bso4MgknuyqDaM5uzE3ay9tT4sEo
 dlIH2sAATuCGKyp61/yMbk=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/05/2021 à 18:03, Philippe Mathieu-Daudé a écrit :
> The ABCD / SBCD memory opcodes (introduced in commit fb5543d8200)
> don't use their "addr" variable.
> 
> Remove the unused variable and pass a NULL argument instead to
> gen_ea_mode(). This fixes warnings generated when building with
> CFLAGS=-O3 (using GCC 10.2.1 20201125):
> 
>   target/m68k/translate.c: In function ‘disas_sbcd_mem’:
>   target/m68k/translate.c:897:13: warning: ‘addr’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>     897 |             delay_set_areg(s, reg0, tmp, false);
>         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   target/m68k/translate.c:1866:21: note: ‘addr’ was declared here
>    1866 |     TCGv src, dest, addr;
>         |                     ^~~~
> 
>   target/m68k/translate.c: In function ‘disas_abcd_mem’:
>   target/m68k/translate.c:897:13: warning: ‘addr’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>     897 |             delay_set_areg(s, reg0, tmp, false);
>         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   target/m68k/translate.c:1829:21: note: ‘addr’ was declared here
>    1829 |     TCGv src, dest, addr;
>         |                     ^~~~
> 

It's really strange because ABCD and SBCD support indirect predecrement (mode 4, "-(Ay),-(Ax)"), and
if you look into gen_ea_mode() &addr (addrp) is used with mode 4, it is initialized on EA_LOADU to
be reused on EA_STORE.

The bug is somewhere else...

Thanks,
Laurent

