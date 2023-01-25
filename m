Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4025567B315
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKfbX-0002xa-E3; Wed, 25 Jan 2023 08:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfbU-0002wu-7j
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:14:16 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfbS-0001rF-HC
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:14:15 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MDN3O-1pV5SJ0n5i-00AULC; Wed, 25 Jan 2023 14:14:09 +0100
Message-ID: <527f9f81-6765-3cf3-f96a-6cd3b67521b5@vivier.eu>
Date: Wed, 25 Jan 2023 14:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Add missing MAP_HUGETLB and MAP_STACK flags
 in strace
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Y5iiED4PpnGAHpyz@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y5iiED4PpnGAHpyz@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LFudNDzbbYDwfeEiSng8qElwRnaXEeR5bE2I3c5/6eGA7WFmyMb
 KaMXDBHgqfCMLwqDfe/3ZM9fk6OAUbxvCpp1Ul9m1+ZwCZHgrceoPnlnJE4DTIH43fwVyV9
 e6Xt73BHfjnpcajPbzwvnC7W2x8FNVlpRYr9Z5CP9J9Kk7P0MLrqx9ytpxZk1xD8+fVmPgr
 nDLCuYohgHtWD9KSyeuXA==
UI-OutboundReport: notjunk:1;M01:P0:qxpHbWrViO0=;DJo3gTBtah9bSoauvWJQMZb0K/9
 +VK4J+m8SIu+dIUlQbdHvO1SU2DjNTfa6HTU7zwDXVfhyNj29ICmc9Uj+sCBuuQ0WP5Ta/Akw
 cGmGitneT2wf1EDzVUEV51ZRzHCg5HuE7j73upmhzxB9+AtOC5FCVwKpx5UzomjkYogtuI8ID
 kYaeY662uqwIuCNfdaAC5V8OBC2zEuOb82BqS+bn6A4SEWtMsAmMIJlBMOw/lztO1xZEaE3Ue
 yad0OmOrPrSTc7K3XqfbL9cKcXw4iyx5s71TmbbS3qUcnqPIHfmiES4+rlrsDd1Q2G3tXqEEz
 fdy4ejeFoqQuZnN7/CDF1xqbg+CXQMq6TVIX7JQfOzhaj77JedCsNk94pBGacfevLYbuFMHmf
 ZfR+BUQSKfJABMFVqDEmvI/jdIjo99xHvidvxtjdrrGFt30Alk1+9zXzmjpWqF4bRtz51R8On
 +bgsoIXe4K6RYg8NF6UQXYya2rxp0NTkPwzZZCe2JwrYez/YRt70B2EA7r8cBakxxdBeXfrYj
 YPa96mtu2GPs2R+EADEYargCT3G7iXIRi1SoeNnsw0wbcP81uuSw84Ii+e979vntTihxyTFPr
 WLprpx2zXNEixF9Pv/VeY1gW1acr5EMuxFb5E/LsSyptvOIW3RJpbPVm4sBJun66DeIPXLYBv
 CWyARkBnGznmMN3xI02hjSCHPu/Fa/LXrq2ub63OiA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

Le 13/12/2022 à 17:02, Helge Deller a écrit :
> Add two missing mmap flags.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 8fa5c1ec3d..3ea91084fb 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -1089,6 +1089,8 @@ UNUSED static struct flags mmap_flags[] = {
>   #ifdef TARGET_MAP_UNINITIALIZED
>       FLAG_TARGET(MAP_UNINITIALIZED),
>   #endif
> +    FLAG_TARGET(MAP_HUGETLB),
> +    FLAG_TARGET(MAP_STACK),
>       FLAG_END,
>   };
> 
> 
Reviewed-by: Laurent Vivier <laurent@vivier.eu>


