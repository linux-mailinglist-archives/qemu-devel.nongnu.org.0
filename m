Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CE9485137
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:38:49 +0100 (CET)
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53gu-0006wR-5S
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:38:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53VM-0003Df-Vy
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:26:53 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:36699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53VL-00086p-9W
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:26:52 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MqJyX-1macN22G6F-00nPsL; Wed, 05 Jan 2022 11:26:39 +0100
Message-ID: <94aebec7-0bf7-18b1-a10e-dda5f476f70b@vivier.eu>
Date: Wed, 5 Jan 2022 11:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user/syscall.c: malloc to g_try_malloc
Content-Language: fr
To: Ahmed Abouzied <email@aabouzied.com>, qemu-qemu-trivial@nongnu.org
References: <20220104143841.25116-1-email@aabouzied.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220104143841.25116-1-email@aabouzied.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qldoOUcdDgXAAtgJW4JhKKwPkV3uRfWOsvJWlMuTt46KZpgfopd
 nA+NgGvaPfYVHAHN1Nv7Yf6br+lKZBQwcJ+hRUSKbm0Kb2wA490x7rS9bpNcUbLyF+y9WiY
 RvGM0WaBmiAGg8C9zSlPVltnDxuenCDW9CIkUSWLdsiVtR6pLaMm2pheVe/sCcTKLQ7Oq6d
 qTIsODCf9m+ZxVHf46/YQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yQLZhWLlyGc=:Odzhe2vztPbrnOt7kWfHio
 oFaZvUttglmM+LNCDSp8KhCX1S2tmaODFSSDgc/e9CNxZuVtCDhHAh4ZR9Rd+ENrkAm60bGRx
 D2yQt5b800pHUu0zjRTWcx8ex9Z+xhgjkmuBOYSuELRvEarTaYgk14hzt4c+8BLUBDRSyeUE8
 CI3NNQ0TyRajytb7KhIauoEOq9pNPbeaVZQkOwQjnGgpxo0YHSdKFJJKxGGHM7tDkSQf7kNVV
 ZFZ+H0IAlHDclJh7ATeni+M89xuPhxpRKwsx92LytR86Ios/j2rlqGcEPUWs3AiZsi1WkDSOd
 O23bdEOjErK402/ykSrbilS+B5LuOMsqF0f4HCddD6HNDDjVaGbWA3ImGtWF19LcYwTOQcTXt
 Swe+U5mY2n/rFhw9GADrT6e9X+MKCRT2E3A7qNgmzl8J/dlzOo01pK0JhUsDyhWv88X989XTt
 0diMiutyCw8l+qsROGsjUbnoC1VDrQ8dvdH0iH+O5iITtIHggRICeE6+V3mzUBwSheVGk8Pls
 lv0KQLeGObjuy/5Gsshp2iu0REZEnNMoIG/HWNR2NPaXa0BugnpIrsR/YsTZXnCpqp/W5DKkN
 grkCxF60huQo5Z323PG4nFON22Os7uBeSa7vt0q6ZiIRqSRRggoX5SCF03ExGq0Bg2mFD8XVC
 SDp/+C6zY8ye7CXUNWlQ7RxYAPCR9sF1OUhtlfuXGuiAcSo7H4D/cv0TmWeR4SaIZraw=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/01/2022 à 15:38, Ahmed Abouzied a écrit :
> Use g_try_malloc instead of malloc to alocate the target ifconfig.
> Also replace the corresponding free with g_free.
> 
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
> 
> Hello,
> 
> I noticed that there was a `malloc` call in this file. It seems that it
> was added by the commit 22e4a267 (3 years ago) which was after the commit
> 0e173b24 (6 years ago) that replaced malloc calls with glib alternative calls.
> 
> There is no issue for this on Gitlab. Should I have created an issue
> first?
> 
> Best regards,
> 
>   linux-user/syscall.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 56a3e17183..715f9430e1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -4867,7 +4867,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
>                * We can't fit all the extents into the fixed size buffer.
>                * Allocate one that is large enough and use it instead.
>                */
> -            host_ifconf = malloc(outbufsz);
> +            host_ifconf = g_try_malloc(outbufsz);
>               if (!host_ifconf) {
>                   return -TARGET_ENOMEM;
>               }
> @@ -4915,7 +4915,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
>       }
>   
>       if (free_buf) {
> -        free(host_ifconf);
> +        g_free(host_ifconf);
>       }
>   
>       return ret;

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

