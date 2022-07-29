Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABF1585100
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 15:37:18 +0200 (CEST)
Received: from localhost ([::1]:43040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHQB2-0006u9-Vo
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 09:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oHPjt-0005RG-SI
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:09:14 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:46605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oHPjo-00020I-Ai
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:09:10 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N01hu-1nVLSI07mQ-00x1j6; Fri, 29 Jul 2022 15:09:04 +0200
Message-ID: <a2e1767d-b83f-f7e5-19bc-ac76c52432ae@vivier.eu>
Date: Fri, 29 Jul 2022 15:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Do not treat madvise()'s advice as a bitmask
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220725134100.128035-1-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220725134100.128035-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9s75RjEkrBpKgbHkrZJiBrwW55klXlt4o7eh4LQRrGkYZQe1N0C
 PP4DbSFXugvhVsfLFsFM0vuOyyW5nZjYsU9/hbLt5DHYDgxFZU2IEEZTnSRH8XbPG+K6Avl
 2nIIseN4EK7S8xgSVoiJxGR4jbDiLI77WqSsUtOFZ0YME+hFdzbplpLCekgPIOxtX0BNE8C
 emZnKUZ5d5zsonV6UQQ0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y73OD4Vt32s=:bL8jdkwvFefz0FjlchXUBY
 Cd7NSf6VmOy/6W5zX8EdQgpzaRMNbva36N4Tc45aSLTQJFyT1O95VKLmmykQVPPoCEs1k8hPr
 Z7UvdtuS4crXB+/Ji2UJmOUTW/1X+FFbI/cr+bac1HOAi2S/Vk21K9HyhU6Z/DfqM5Zbob4bP
 NcqoimiMI3QAh/z+qjlYy0UvIG9FEXxTcbMOv2AePa8iJlHVwBn4D9oSDO8RVjwU6ketsM5Og
 A01NVVdsiSNoXXVorjQZdfCdsvHMXqyl1JwLKLD3S3zhTebXkBOJ2hpSLYitD8qPxyty2yt1i
 fzbZn/ZxgHtEpy/0YW/PjqvEXZOePguzWbCjZshufsAti9oyKLNIteopyO+2kiTTodnEsJa+r
 ZlsFzmdBI8kp59ceafrqj2qhQe14cR7e6pjDdRqbZ1d9eNI45DyrkTWeke9rzAywafpDm6zUR
 XmlUpC+XMIcoG4M1BRC5vK7/cbxejGIi9kZTraIZPJON9pYF/KMkWgnROGXP2PG0hKG8bxxaE
 9AYuAVVBxPJAHU7X2zy5Sjywof8ez+BFNnDWKlDo2uHErW8H+/TUKPVWA/GSl8fKwD6RsFzY/
 P1o1Ep469fuumXqvr6944RtRTCnztsqYm9TLyslWor2lTkb2eqTJ3NInSpLu4WNrUkRJW493g
 CgJCi2iTWDvRgqOxJ8bBwikM9b5m4T80Wwd4yBrW1+LJa5AmuR1cj5Rrpd5FGgSGuQXGVWolk
 rFrKbhDEAv96HSdwRc6msTlYswDlLkb8ZgWZkA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/07/2022 à 15:41, Ilya Leoshkevich a écrit :
> Advice is enum, not flags. Doing (advice & MADV_DONTNEED) also matches
> e.g. MADV_MERGEABLE.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/mmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 4e7a6be6ee..edceaca4a8 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -891,7 +891,7 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
>        * anonymous mappings. In this case passthrough is safe, so do it.
>        */
>       mmap_lock();
> -    if ((advice & MADV_DONTNEED) &&
> +    if (advice == MADV_DONTNEED &&
>           can_passthrough_madv_dontneed(start, end)) {
>           ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
>       }


Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent

