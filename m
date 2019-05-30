Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72061302FC
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 21:49:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWR3E-0003Ym-LD
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 15:49:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thatlemon@gmail.com>) id 1hWR28-0003Hr-HP
	for qemu-devel@nongnu.org; Thu, 30 May 2019 15:48:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thatlemon@gmail.com>) id 1hWR27-0003Ix-DQ
	for qemu-devel@nongnu.org; Thu, 30 May 2019 15:48:16 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <thatlemon@gmail.com>) id 1hWR27-0003Ht-6Z
	for qemu-devel@nongnu.org; Thu, 30 May 2019 15:48:15 -0400
Received: by mail-wm1-x344.google.com with SMTP id t5so4507799wmh.3
	for <qemu-devel@nongnu.org>; Thu, 30 May 2019 12:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=sJIr+k3Ps46njZRaBX/cpTJkbIcblxeP+D6Q6Qyx3W4=;
	b=Nu9Vg3SMwE5HPZi7Z6QKFxQLzDFNJxYqTeo7UvLCSqRbEg33lMOs1ttNFi9th5pabE
	YOTYZjI1BtD6dCCWrVK+NYWrKZ10PDiRJG7huSVQRmKTe51rm+ijCp9dnorU3niqmK0M
	H3t2t3w+7UiNBiofdJmUglOHEvhun2lZ94aTl1GNxFcKLamURfgPTtBUbS8ARoN83njf
	6C2P7UA2NvTFpiIQ2Ncu0iVR2JHcrIRcs0f4XqilGC/UuGJrBex/wjSD+udmmI+UQ0QI
	ugyiJ4reiPoHzesBlqcLPfWvEoHIKCCxk0n47lAOhZ2BMtz6w19W+5qXzDLNE9BMDOEU
	eGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sJIr+k3Ps46njZRaBX/cpTJkbIcblxeP+D6Q6Qyx3W4=;
	b=Ltk2QPJqlE5P0irdmg2vBZlkO6cNR7tW1gOpzITfKrfk9HTVGw1Uv8abla2jgVz2GA
	v3JLdSTGu3au7Ecd79Rj0TFMCPau4misfDcVnvFvx3mbyL7naE+9P1B0nt4RPj/crQIH
	FcE4Z1+LWIxNoZxu6B3TtYOuoiO3WSYTvAAfJ47UWl71CL8PkMMhYdW6typ99Vu8IWB/
	FF0BxN49eJVuru1ZWUnIL5a/HX4z0D7zUl84CjSisKOwC0Qlbx/3d2zNbyOrFCXv2D0C
	hVQjeleaJNPgDhqVfH+sqoTzk+YrKfyi4us9nTA6QzfjZhWJ5ScwT4q+QA7tvrImB8Ab
	eIQg==
X-Gm-Message-State: APjAAAXj3RgXndKQ0w8eZ/6u07LV6XDKCQhc8hhfESGllZRLwvbo9MqS
	sc8i+8MP8mmIDbqnWgxZIpc=
X-Google-Smtp-Source: APXvYqxcHoC/3G/euSY+/nc8DUEQT2ckwNBhPjl+plXZ48a24v6sEeVoF9ZVj9eEvci+i/ktGGfGAQ==
X-Received: by 2002:a1c:7503:: with SMTP id o3mr3456746wmc.28.1559245693807;
	Thu, 30 May 2019 12:48:13 -0700 (PDT)
Received: from [192.168.1.103] ([151.60.67.168])
	by smtp.gmail.com with ESMTPSA id
	z13sm2393189wrw.42.2019.05.30.12.48.12
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 12:48:13 -0700 (PDT)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <9028dc83-82a2-fc51-b559-0020b2c0a892@gmail.com>
	<64eb15b1-ed5c-d12e-5f56-8a2b40df8041@vivier.eu>
	<f1184a82-29e4-ba41-2f44-dd4b3e0f15a9@vivier.eu>
From: Giuseppe Musacchio <thatlemon@gmail.com>
Message-ID: <6e6711ee-1d53-ed67-24d7-8c313d09848b@gmail.com>
Date: Thu, 30 May 2019 21:48:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f1184a82-29e4-ba41-2f44-dd4b3e0f15a9@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH] Avoid crash in epoll_ctl with EPOLL_CTL_DEL
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yes, that's much better if compatibility with such an old kernel version 
is wanted.

I suppose there's no need for me to re-send the patch.

On 30/05/19 18:12, Laurent Vivier wrote:
> Le 30/05/2019 à 18:00, Laurent Vivier a écrit :
>> Le 30/05/2019 à 17:25, Giuseppe Musacchio a écrit :
>>> The `event` parameter is ignored by the kernel if `op` is EPOLL_CTL_DEL,
>>> do the same and avoid returning EFAULT if garbage is passed instead of a
>>> valid pointer.
>>>
>>> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
>>> ---
>>>   linux-user/syscall.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index 5e29e675e9..32d463d58d 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -11329,7 +11329,7 @@ static abi_long do_syscall1(void *cpu_env, int
>>> num, abi_long arg1,
>>>       {
>>>           struct epoll_event ep;
>>>           struct epoll_event *epp = 0;
>>> -        if (arg4) {
>>> +        if (arg2 != EPOLL_CTL_DEL && arg4) {
>>>               struct target_epoll_event *target_ep;
>>>               if (!lock_user_struct(VERIFY_READ, target_ep, arg4, 1)) {
>>>                   return -TARGET_EFAULT;
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>
> 
> in fact, the BUGS section of epoll_ctl(2) says:
> 
> "In kernel versions before 2.6.9, the EPOLL_CTL_DEL operation required a
>   non-null pointer in event, even though this argument is ignored.  Since
>   Linux 2.6.9, event can be specified as NULL when  using  EPOLL_CTL_DEL.
>   Applications  that  need  to be portable to kernels before 2.6.9 should
>   specify a non-null pointer in event."
> 
> So something like this would be more portable:
> 
> @@ -11329,6 +11329,7 @@ static abi_long do_syscall1(void *cpu_env, int
> num, abi_long arg1,
>           struct epoll_event ep;
>           struct epoll_event *epp = 0;
>           if (arg4) {
> +            if (arg2 != EPOLL_CTL_DEL) {
>                   struct target_epoll_event *target_ep;
>                   if (!lock_user_struct(VERIFY_READ, target_ep, arg4, 1)) {
>                       return -TARGET_EFAULT;
> @@ -11340,6 +11341,11 @@ static abi_long do_syscall1(void *cpu_env, int
> num, abi_long arg1,
>                    */
>                   ep.data.u64 = tswap64(target_ep->data.u64);
>                   unlock_user_struct(target_ep, arg4, 0);
> +            }
> +            /*
> +             * before kernel 2.6.9, EPOLL_CTL_DEL operation required a
> +             * non-null pointer, even though this argument is ignored.
> +             * */
>               epp = &ep;
>           }
> 
> Thanks,
> Laurent
> 

