Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ED5391F86
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:48:05 +0200 (CEST)
Received: from localhost ([::1]:39574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyZS-0007mV-GO
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llyY4-0006SQ-Sa
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:46:32 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:33079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llyY2-0007Uw-Rz
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:46:32 -0400
Received: from [192.168.100.1] ([82.142.6.50]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mbies-1l8nBC36R4-00dHmS; Wed, 26 May 2021 20:46:28 +0200
Subject: Re: [PATCH 0/4] target/m68k: implement m68k "any instruction" trace
 mode
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ce9ce9ae-09a3-cb59-dfe6-797b2ff90dec@vivier.eu>
Date: Wed, 26 May 2021 20:46:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rDvKtY+SF6M+HACWDGAhIsGEepMWU4fohpeqNAzOu4ER3kHdd8U
 dOADUnaOE2CtVeWdGvZ/nAXtPA6ygvGYrg/16jXYaJ/Pc2ERfriXBNuGt3hQssIL/7jUYIX
 CDeSnpJ8X0Jkyw+Ux6f8JsGmLvGiLYeLrxdwwO9XNe3Ec5I/TUTDZWeVJaUzOVB+v9oaF9i
 BZTUkwXnOx1j3zt3uvY7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QBG/1sTAtJU=:YA+o9Vo4iqOgRDN2mKBNXC
 90rE4KwzB9mAy8e9hb8Wu469nLQgyI/PJZYNkBMrl7MF3pU7yCeCU3+csoa9dAaHZat/Tz+c/
 k1LGJ8F9c/DM9GUKn0OOVIXv7UpVcarowO//bTuz1e1WuHwkvVuQZNK1enFBZj7/4fWneW8FU
 4yYdWQ8RifX+VGYqHlBSiK2PyTab5s2Hisi5Et+avB3ZA6jMF+D8IxyVDgt6Y8TogElhT5iuS
 CFGb1mPwXlSPwAEiTgpG/EWdF5OaS/RVCBL02vRknCLz+VP2uBiv2hL0HPaz/p3D+P8/li3Kx
 6pWs8rnlLeMAcJuAAV5UedGBt4Qvj4M4MCf47GhN2mRhyJgUQSPrb/Q+y5jEqGxTFELmKkXm3
 inkL0hvXtyRkynovc/fVr0ol0a2ofQ54xIggSjDYgIL89egK4Fok5DlXj/vxGAgggZe4laYva
 hG85Evc28PHk2Ou+anPVCE/s5akrFZncOy0P5yaXHNiJ6GXD4uSi4LcL6blUShBpgo8M/9d2M
 Iq/3XHhnYDDPkJdh6fA0fg=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/05/2021 à 16:29, Mark Cave-Ayland a écrit :
> This patchset implements the m68k "any instruction" tracing mode which is used
> by the NetBSD kernel debugger to implement single-stepping. It is based upon
> reading through the M68000 PRM and looking at how the ARM target handles both
> gdbstub and architectural single-step exceptions.
> 
> With this patchset it becomes possible to single-step the NetBSD kernel using
> the in-built kernel debugger:
> 
> Stopped in pid 0.1 (system) at  netbsd:cpu_Debugger+0x6:        unlk    a6
> db> s
> Stopped in pid 0.1 (system) at  netbsd:cpu_Debugger+0x8:        rts
> db> 
> Stopped in pid 0.1 (system) at  netbsd:main+0x2c:       jsr     kernel_lock_init
>         [addr:0x1a38f6 ]
> db> 
> Stopped in pid 0.1 (system) at  netbsd:kernel_lock_init:        linkw   a6,#0
> db> 
> Stopped in pid 0.1 (system) at  netbsd:kernel_lock_init+0x4:    clrb    kernel_l
> ock     [addr:0x33f400 ]
> db> 
> Stopped in pid 0.1 (system) at  netbsd:kernel_lock_init+0xa:    clrb    kernel_l
> ock_dodebug     [addr:0x35b48c ]
> db> 
> Stopped in pid 0.1 (system) at  netbsd:kernel_lock_init+0x10:   unlk    a6
> db> 
> Stopped in pid 0.1 (system) at  netbsd:kernel_lock_init+0x12:   rts
> db> c
> Copyright (c) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
> [   1.0000000]     2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017,
> [   1.0000000]     2018, 2019, 2020 The NetBSD Foundation, Inc.  All rights reserved.
> [   1.0000000] Copyright (c) 1982, 1986, 1989, 1991, 1993
> [   1.0000000]     The Regents of the University of California.  All rights reserved.
> 
> [   1.0000000] NetBSD 9.1 (GENERIC) #0: Sun Oct 18 19:24:30 UTC 2020
> ... etc ...
> 
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> [q800-macos-upstream patchset series: 2]
> 
> Mark Cave-Ayland (4):
>   target/m68k: introduce is_singlestepping() function
>   target/m68k: call gen_raise_exception() directly if single-stepping in
>     gen_jmp_tb()
>   target/m68k: introduce gen_singlestep_exception() function
>   target/m68k: implement m68k "any instruction" trace mode
> 
>  target/m68k/cpu.h       |  8 +++++++
>  target/m68k/translate.c | 51 ++++++++++++++++++++++++++++++++++-------
>  2 files changed, 51 insertions(+), 8 deletions(-)
> 

Applied to my m68k-for-6.1 tree.

Thanks,
Laurent

