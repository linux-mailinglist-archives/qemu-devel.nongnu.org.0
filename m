Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E994EDEAB
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 18:24:08 +0200 (CEST)
Received: from localhost ([::1]:34614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZxah-00079F-Lk
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 12:24:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nZxZK-0006Hy-R8; Thu, 31 Mar 2022 12:22:42 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:49207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nZxZJ-00035Z-71; Thu, 31 Mar 2022 12:22:42 -0400
Received: from [192.168.100.1] ([82.142.13.234]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MLzSD-1nI12d3fe5-00HsrI; Thu, 31 Mar 2022 18:22:31 +0200
Message-ID: <ee4c5717-37fb-6053-497d-06925eed8fcc@vivier.eu>
Date: Thu, 31 Mar 2022 18:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] linux-user/sh4/termbits: Silence warning about
 TIOCSER_TEMT double definition
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220330134302.979686-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220330134302.979686-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ukk3BhLgYxG7h6voRxNWoR2LnN4nNX7TWVrcqVtJqh/MP8vCdzX
 DqEEGRxP0AiO/YEFXCR7KC1+qBDfkcoPPtHOq8Vk2OsbA150Rn7CF4vAc3kh2My2eDm1J4U
 x/VrKgI+63mgGIjSvlBYiiR00FaNkr3X5AXBP6s+9jlUEHwa8LJwz0+iqQUPKKyJGOxEFL8
 c0Ydg0mKUq6T3jX2viz+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QB1Q74ADgJs=:CLTr+JYpvVHkeZ8+Qz/pNZ
 23g6zrRrc10K2TBS/jfp465g+Td285CXdmzudiltrWOAhEc/VvR3ofr27Ok3lfY9bv2mFYwR0
 moGE7SVenvXz613dzK2BW3+oGmh5t8+cpwwRIHbbCZvtZsdNP7O+wdL7KJxUDiaBzL02zIRAA
 u2JUEraqhknvzvY+X1CFZayWmBOXq8QkNp8YC4rfZLdzHJffxgtnHu4lSejSWBZDb0P1duetq
 JhJ+IEiotmHB51VuiY0hSDWgtxeEO+WbtY42bELFVQy1Kpm3wJt6Sb3e7JmUqTganCAgMXdQp
 TTXjy2L8QcCT9NQHyJ70iQ1li42tk696pAlY7yD1xBO4dZs54kXemlRKq1Z2PabtGD9kAPt8u
 DiHKV96+/ORTstQ6FpQHYABAoh0x2D+ow4RU2bdnOEhwLGKxq7uGdwFpOHaUWdWYMRQmbvGXL
 xqmKFh2lqXEgA4CHD5pqSUQdkAARXqd8yxiijdgAVcVbvt1CprEjWM7DSv6waswmVyKGtttCr
 1COUoiARooSj4sdb4uiJKKwDcboaXc7+mUfoUtSG0bW8gAyROL6NokE7j52qDzMjF1AwH4pXw
 rvNNKmNtruqT87RxtytUg5p1gWkooJ+BOKPTkzV+RTG2Ks16Bb4WJPnv4iNiaAnCaRIf9RoMg
 BYBwQnMspcT9WquCPZpcqaHzsRteH2NoP+HeDJZTxsWoS34FXDAKvQcuZSQ72zc39HbY=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/03/2022 à 15:43, Thomas Huth a écrit :
> Seen while compiling on Alpine:
> 
>   In file included from ../linux-user/strace.c:17:
>   In file included from ../linux-user/qemu.h:11:
>   In file included from ../linux-user/syscall_defs.h:1247:
>   ../linux-user/sh4/termbits.h:276:10: warning: 'TIOCSER_TEMT' macro redefined
>    [-Wmacro-redefined]
>   # define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
>            ^
>   /usr/include/sys/ioctl.h:50:9: note: previous definition is here
>   #define TIOCSER_TEMT 1
>           ^
>   1 warning generated.
> 
> Add the TARGET_ prefix here, too, like we do it on the other architectures.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   linux-user/sh4/termbits.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Thomas,

do you think it can wait 7.1?

Thanks,
Laurent

