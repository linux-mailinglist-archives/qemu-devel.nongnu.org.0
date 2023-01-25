Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1018A67B31E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:19:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKfgO-0006UX-4O; Wed, 25 Jan 2023 08:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfgM-0006TD-69
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:19:18 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfgK-0002mn-Kz
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:19:17 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MsI0I-1oWpBY1LMg-00ti9Q; Wed, 25 Jan 2023 14:19:14 +0100
Message-ID: <c96dbc38-a1d1-fef3-6988-5fad4a7c0e08@vivier.eu>
Date: Wed, 25 Jan 2023 14:19:11 +0100
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
X-Provags-ID: V03:K1:tlq5shtr6vLZCXBHpIGZVXg46P0i4KbhTXI2vWiZSBmIDHNnZiz
 IqGB8t+2YModBZ/LwrP6JJAq0cSGjkRmuS/5FGhVJfZ0Z8et5naXRhE7dHatfu/WoC8mhVT
 Et3DDDHW9LURwcwbzggb9cjpOJNwAeQ0LU+1KjARgVgmUwCHoCjxhV6PuD9LJ8BvMAktIpP
 UrXNE9C0CM4o2n7QPo8JA==
UI-OutboundReport: notjunk:1;M01:P0:0FdLAsrNCPs=;BIVJ0w9p7O4BNgrDKkONYRsvmLQ
 h1QxzK0XXrCwJdFIZp1C/GezvSdZ7a68MRsX5ILbPd5d3NKTlq85CkMTnC3AXW2mPrIU4clhM
 GkUcokgI9lG1HtKBVwkAXMPv3J9BZO1Gie9/VtSE87jWUNE+6bXTKwZhj8XxCg0/LuuAO+tBH
 B/vpZktrZt4TnfZc4JiOgTaO3pQnqFJULNA5eSSRqUay2DZkxvo9tcQOT/ZNBG/iwZIVFL4FZ
 w2Gwfwel8fRs85/bXZZJobyMErKm0XYDPrR85YCb7Ez/tuVfpnLETMGRwVZyUeO1FlYNYYFPS
 J860XfYWApFZgNF8BMTmQsYdTM/RbmFPvsranZt4bDh1NtHQTujZVhnv4qvtcAJsqyf9mhuDU
 QxpZuLRDbjtaYwx2eSYCb+exmYAZEfo5UmBTLW78TCq2z6RPT7Bst1lHfnM3oDX6GpteK+ksL
 D1wpSltTHZMNI8V6ipzJPVAZ0YkAqOiO+/MYxLq9tBAFJXR2Y6HWp/mGjrUFqG6Qi4L8uxtCW
 2uctatWeNfJd5pTI5LhC0PeAt7oD0ACTyhio8tXdCQFUecVruIis21lbzPmXNWI+j6i3t27X2
 3jsmP7f3zOW8OsZXGnrqi5Oh0WQEWa1vClCPzKcnuioWAzSsj8lt3JAvHHqxFprJAl88hrEBF
 mrTcSKQEbuRfpKSasefPO+c22E1mnEJicrt4ROmJEA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


