Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B56F486628
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:37:09 +0100 (CET)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Tt6-0005vU-AI
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:37:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n5TOW-00024S-8O; Thu, 06 Jan 2022 09:05:32 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:42737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n5TOT-0000A4-6M; Thu, 06 Jan 2022 09:05:31 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MfHIZ-1mTeSX3mOZ-00gp1K; Thu, 06 Jan 2022 15:05:15 +0100
Message-ID: <e81ec4c9-9315-bf7f-2e74-65544664f430@vivier.eu>
Date: Thu, 6 Jan 2022 15:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: fr
To: Ahmed Abouzied <email@aabouzied.com>
References: <20220104143841.25116-1-email@aabouzied.com>
 <94aebec7-0bf7-18b1-a10e-dda5f476f70b@vivier.eu>
 <CANL98e9RO38rmP8oSmEcoop3Pr_qC741Om91Bw9FQxAZcqf2QQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Byte Sized task (was Re: [PATCH] linux-user/syscall.c: malloc to
 g_try_malloc)
In-Reply-To: <CANL98e9RO38rmP8oSmEcoop3Pr_qC741Om91Bw9FQxAZcqf2QQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XwYw/YGJuQmJY0FNGNfnKM4tSYtrl63OtoX+k4Y01qGyt17gMW8
 ZiFX1CImreQPKFtjFioVtyeSP/o5Wx7ydbayvYOcq/oZ+BAaZlKJXvZOC2v9kIQ7vFziLnc
 j+DyCV46qdpnf29c3HFI7dZXXAMeIOMJNFyoqD1nHeV/Zdt5GOw6PWa0RYrxfgLcD2DMMNt
 HSeIyf/BFawT98z09ST9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kc8wgchhsck=:0RoW1jMN84f7o3TS7buUYy
 Poqgd5OXV3F87s861UQyteKYj87a55wdKwktpOQmIeltKBEsf3RIJcPS0dL0kfo7zKB95u4II
 szbBdKJ+MxZk2FYVy9nCXrJfHXaH0Og3Ys/zaBF7O03RHijXzOhxeyxDAvn8MPOTqhvfa7JMu
 N0N0IX5+LuXuWifbHLCiBOmODet4DjPt5FvBXP9MzUKw7oCC2xVd8MRLnk1JDLBJGC41mBIRq
 xTUOo1hKMHMZQXRzi6noKM0jT5OY9iuC+prWUG1QVOSQZMIkw+D4HQsvb7/X+39mY92Nwd36x
 T8ldoKevGb65hnnOQLt+hm2+1gayza43VzpLs2cUdNX2OKjn1u+lNuA4UhYZMRK1YCKA9xA0H
 6HHrk45l/9nMaYccqBGewXpRrGTDYOV2EB+IYLgVOMSm1plF9/sXyZGuo0RHVB4FpRF1P6wFw
 dSI8S4igINKq+aZi4UQ7etSJSReTLHEP0Y9v/RS1MnV5qiYoFPXSawhfzI0Oun0f22uDXdTtx
 3uv2aGeB2R4DN6bFdUzmIYmWpfAX0VBR/Cq+7rttY7bq2yAtk2bVdIEJjy10YnRb6+RUbUSrb
 ubE61zm3vK3EIDWPAPNmSU649A/tyTpmkYD4uw70m5xhea4tYmQQU+dHwmsBPLIOqy3+iYhC/
 cbxUm30zX4bNCZ1z6fDhKtCr4WHne/tk3A3P/5FNlIarq9oVUGsSYI9nZJF3yrq+or18=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Ahmed,

the email address you use for the trivial ML is broken. I've fixed it for my answer and added 
qemu-devel.

Le 05/01/2022 à 20:09, Ahmed Abouzied a écrit :
> Hello,
> 
> Thanks for the review. I also found some occurrences of "cpu_physical_memor_*" calls that should be 
> replaced with "address_space_*" around the codebase as mentioned 
> [here](https://wiki.qemu.org/Contribute/BiteSizedTasks 
> <https://wiki.qemu.org/Contribute/BiteSizedTasks>) in the API conversion section. The "/hw" 
> directory for instance. Should I go about replacing those as well? Should I create a Gitlab issue 
> first to track the changes?


According to the wiki, the gitlab issue are already created with the "Byte Sized" label.

https://gitlab.com/qemu-project/qemu/-/issues?scope=all&state=opened&label_name[]=Bite%20Sized

But this one is not, I think John can help you for that (added in cc:)

Thanks,
Laurent

> Best regards,
> Ahmed
> 
> On Wed, 5 Jan 2022 at 12:26, Laurent Vivier <laurent@vivier.eu <mailto:laurent@vivier.eu>> wrote:
> 
>     Le 04/01/2022 à 15:38, Ahmed Abouzied a écrit :
>      > Use g_try_malloc instead of malloc to alocate the target ifconfig.
>      > Also replace the corresponding free with g_free.
>      >
>      > Signed-off-by: Ahmed Abouzied <email@aabouzied.com <mailto:email@aabouzied.com>>
>      > ---
>      >
>      > Hello,
>      >
>      > I noticed that there was a `malloc` call in this file. It seems that it
>      > was added by the commit 22e4a267 (3 years ago) which was after the commit
>      > 0e173b24 (6 years ago) that replaced malloc calls with glib alternative calls.
>      >
>      > There is no issue for this on Gitlab. Should I have created an issue
>      > first?
>      >
>      > Best regards,
>      >
>      >   linux-user/syscall.c | 4 ++--
>      >   1 file changed, 2 insertions(+), 2 deletions(-)
>      >
>      > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>      > index 56a3e17183..715f9430e1 100644
>      > --- a/linux-user/syscall.c
>      > +++ b/linux-user/syscall.c
>      > @@ -4867,7 +4867,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
>      >                * We can't fit all the extents into the fixed size buffer.
>      >                * Allocate one that is large enough and use it instead.
>      >                */
>      > -            host_ifconf = malloc(outbufsz);
>      > +            host_ifconf = g_try_malloc(outbufsz);
>      >               if (!host_ifconf) {
>      >                   return -TARGET_ENOMEM;
>      >               }
>      > @@ -4915,7 +4915,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
>      >       }
>      >
>      >       if (free_buf) {
>      > -        free(host_ifconf);
>      > +        g_free(host_ifconf);
>      >       }
>      >
>      >       return ret;
> 
>     Applied to my linux-user-for-7.0 branch.
> 
>     Thanks,
>     Laurent
> 


