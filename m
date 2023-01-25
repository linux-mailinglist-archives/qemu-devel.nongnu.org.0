Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB5067AEB9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 10:48:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKcMx-0005Or-J7; Wed, 25 Jan 2023 04:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKcMn-0005Oc-O0
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:46:54 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKcMl-0000f1-Nf
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:46:53 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MWAaw-1pA2PZ3Z4E-00XYWM; Wed, 25 Jan 2023 10:46:43 +0100
Message-ID: <b062ef26-c73c-e76e-70bc-bb081fbb61de@vivier.eu>
Date: Wed, 25 Jan 2023 10:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 0/5] linux-user: implement execveat
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221104173632.1052-1-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221104173632.1052-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YBPtBkI04JEvIyUsPCX/7dEqIgYtw5nWe0r/ayf4a+OF2jhx87V
 wpiMxHmA8YI0UqRt1FRHKjt6Vp6efexy3zhf5y4V0WDx+/5pVd/OWR1D9vMwA3QkTNvHkUB
 jOPNKedB56Zr0kxp98co5P/8puqcph+l9ZGW6kjeEPEbXIr1qLxhOy+UEsFHZtmJPHxDelR
 JK3Uuo7uq3+EfKOhxfVrg==
UI-OutboundReport: notjunk:1;M01:P0:De8TE2jfeLQ=;88Ea7BhdlpLoI8t9WNCjRUDVME4
 UCekNuJZAEld1r/ybQ5risy4qnfbriNCxL7vvjF6YGRmSYgcvo4J4sMZ36eQoQVEU722LwwWY
 4muaJCoXRGpVLln8Gl35Ka9qsl2xGzPDGm6Gp8FicljFuoFvBQ9eVGY8bAPKNqLn3PilRLfsJ
 mto8fj7hzxOK7kWzL3itTMFERopdVKeQdmLnOamCXGheqDUQbu0NsH62SlaYHjtfxxX7pXmNm
 8WT1GWBLT3vm5a1jaAiBPMR/JqlDgGW3F3ID+V3BPXu9vo/BZ2Gax8nDD9WvP8Wlur4w6gk/f
 jwi0MGpEGLaLta19AxvVTE4lKep9f2zBuAXMvoVh/fJUboegaJgjSAkZ2JMhBvaena5rLpj8F
 2JMMgqF9a0/r2SJMVr1+yDiZhke7638+btfe4NL+vH/+x/qihtoJiA0vZt5INq7Noi4qajk9c
 svg3dUaUAsPl2PpyhnjIFJ1HTYgjqJ+T38muy9GyqhbtqtY7CM6CTX+AuB01Ing+qxhGcVPWu
 9NsrfamxHgY2JC5mr4ckQ1l8m/AWjgy9OX6xo6JewyYkK0IPcmjsnGJX9cBm1B3+IcrEVpC12
 QS+H0t6ZcwjC092Jbww9DH1f+mZHuXH3TRSUL1CfqFdfLm586EZJbQgWHRj+9g+9oNwouJeQj
 YGFjBTFB3NW5NAYFSiY7HFhJRsVxL2vWqNIazGoKrw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 04/11/2022 à 18:36, Philippe Mathieu-Daudé a écrit :
> As I was reviewing this patch from Drew:
> https://lore.kernel.org/qemu-devel/20221104081015.706009-1-sir@cmpwn.com/
> and it was too big for my review standards, I split it into smaller
> steps. Since the result can help the other reviewers, post it.
> 
> Since v4:
> - Constify struct flags
> - Split Drew's patch in 4
> 
> Drew DeVault (4):
>    linux-user/strace: Extract print_execve_argv() from print_execve()
>    linux-user/strace: Add output for execveat() syscall
>    linux-user/syscall: Extract do_execve() from do_syscall1()
>    linux-user/syscall: Implement execveat()
> 
> Philippe Mathieu-Daudé (1):
>    linux-user/strace: Constify struct flags
> 
>   linux-user/strace.c    | 134 +++++++++++++++----------
>   linux-user/strace.list |   2 +-
>   linux-user/syscall.c   | 216 ++++++++++++++++++++++-------------------
>   3 files changed, 201 insertions(+), 151 deletions(-)
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent

