Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F8F5EE69A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:26:12 +0200 (CEST)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odddC-0007ce-O6
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddb9-0005lK-Gl
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:24:03 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:34987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddb7-0005bw-P9
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:24:03 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MkpKR-1p5mHh1sn1-00mMEr; Wed, 28 Sep 2022 22:23:58 +0200
Message-ID: <5b2dd383-8e44-5760-61af-1c1853f79462@vivier.eu>
Date: Wed, 28 Sep 2022 22:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 00/38] Linux user for 7.2 patches
Content-Language: fr
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20220928081517.734954-1-laurent@vivier.eu>
 <CAJSP0QV7A+w4WCsj7Gi=7532kO5d=Oc4SSLTcHx_1a2MOeUc3w@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAJSP0QV7A+w4WCsj7Gi=7532kO5d=Oc4SSLTcHx_1a2MOeUc3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GjdwdoqfIycY+kpMeglMQ7spMlH6M2Id4ZDQh7Ez/2rr8BjMhaR
 /0YQgUxIcs3B5BbHO5JUck/T3JVBX9C1b3NKBoFt2SDCCrX406S1MvpA44M7JZdUAx6qh8t
 A1+x2CRLEsBUflDUrmKRcNhLvCU+viv2mr8qB12sFXZ7ISA50i4Ns+rl9z6ZxX+MMvGHxf1
 hU902LiAhtvpThIni5Ckg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I8myOCTaULg=:w1s8l+o0q+GdR5VPIDuoio
 T6ojpINnBTZ42vS00XB/BfCU4p3Z9Cvg8H0QfGYcHq/NDjtzFO2zA1pd2poeTLmTOJfp0zHbd
 5zcBNE6IYEF59TmKwF5GDXBXR47+9MI/OC7HRQuwXFVMvfdKf5Gmqi2ZFLUo3rSbInzD9SJ7C
 01vbMc72MkMUZG4vbIJEYt3d+bOPO0TCEfm7z/Em9exYHYe7uu7teLV0VaF8TBP7D+FHKWgOl
 lASdRAa8YTZPpUmmAyqHjHAUNCFla9/37k4p5EzCiZEOcPWRWfKQ34TDdaTQLNxmKjJMI0n7E
 3ooRjuVfb07wghV2EU3TQxc+AbAtGPmt/9kGGc2jAYikjPZrDDQb7tUF+RLTrtkPyQXzvXB3f
 Q20m/L2iUKfG+V2ZQgenPNZw3GNmolqLsARS6q5dOKA0Gu4rYxk/MMX0e2hOZ0oFwiL47mpAB
 vqcvXdjrBM+S8ezpHaAEPlFEiIymXt31U9hYOfLzvo48oDyVXV13l+VXTjCHZ5co/FQi3jt4g
 B77xtlJ+Nv4XwZxXaRtsF5IKKGdRX5nkamYvQM4AEraOw9WCWh3bjGPa3FOa6p29zFeScZlOk
 hURcGBIeKBaWfDESA5NlzXxPYO+VDpWWOy/znjTA2MCFIJLZeHJ+/oQmKPc12tQJXzKjMkS97
 bD7uQ8E6zETJExpBiTso2YqZTVEZtEBz+q9K7Awz926K/ne8U7ros707dfNWGJu2x64uYhLqN
 C4BrZ7XzkGAR+hFr02InrzbcqotTywGJXCzqW7AZQje/lJoUUwR0Dd6uAJUnY0Ucsvsg3MJQ+
 JgEpOvu
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Le 28/09/2022 à 22:04, Stefan Hajnoczi a écrit :
> Hi Laurent,
> There is a build failure for hexagon linux-user. Please take a look (I
> didn't verify whether it's caused by your pull request, but I think
> the chance is high):
> 
> cc -m64 -mcx16 -Ilibqemu-hexagon-linux-user.fa.p -I. -I..
> -Itarget/hexagon -I../target/hexagon -I../common-user/host/x86_64
> -I../linux-user/include/host/x86_64 -I../linux-user/include
> -Ilinux-user -I../linux-user -I../linux-user/hexagon -Iqapi -Itrace
> -Iui/shader -I/usr/include/capstone -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto
> -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
> /builds/qemu-project/qemu/linux-headers -isystem linux-headers -iquote
> . -iquote /builds/qemu-project/qemu -iquote
> /builds/qemu-project/qemu/include -iquote
> /builds/qemu-project/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> -Wimplicit-fallthrough=2 -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
> -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
> '-DCONFIG_TARGET="hexagon-linux-user-config-target.h"'
> '-DCONFIG_DEVICES="hexagon-linux-user-config-devices.h"' -MD -MQ
> libqemu-hexagon-linux-user.fa.p/linux-user_strace.c.o -MF
> libqemu-hexagon-linux-user.fa.p/linux-user_strace.c.o.d -o
> libqemu-hexagon-linux-user.fa.p/linux-user_strace.c.o -c
> ../linux-user/strace.c
> ../linux-user/strace.c: In function 'print_syscall':
> ../linux-user/strace.c:3931:23: error: implicit declaration of
> function 'gettid'; did you mean 'getgid'?
> [-Werror=implicit-function-declaration]
> fprintf(f, "%d ", gettid());
> ^~~~~~
> getgid
> ../linux-user/strace.c:3931:23: error: nested extern declaration of
> 'gettid' [-Werror=nested-externs]

It's patch 37/38 "linux-user: Log tid for strace", I think.

I'm going to remove it.

Thanks,
Laurent


