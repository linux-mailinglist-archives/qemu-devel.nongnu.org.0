Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B516AE5F5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:08:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZqg-0007dn-VF; Tue, 07 Mar 2023 11:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZqP-0007Tc-N9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:07:21 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZqO-0002k1-1g
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:07:17 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2lv2-1qaJxh3Iqa-0139LO; Tue, 07 Mar 2023 17:07:09 +0100
Message-ID: <29c480ea-1c63-63a8-a933-65473dee39ed@vivier.eu>
Date: Tue, 7 Mar 2023 17:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] linux-user: fix sockaddr_in6 endianness
Content-Language: fr
To: Mathis Marion <Mathis.Marion@silabs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230307154256.101528-1-Mathis.Marion@silabs.com>
 <20230307154256.101528-2-Mathis.Marion@silabs.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230307154256.101528-2-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:taIe5NhnGUT2zmAx6r/zVewL2NhDmBFnvdKq95jrM6PJ9BVIqkA
 ylaRGBing/yXz2eSZt6ZjU+0d4ffPVaaEvInfy7QRdYTVbbTYq3tS8fiLs+PzXQG4TnvJQ/
 +m09bwklbdnL3NC+X/VI0QdwdikMev7i7VPS0qFk1vADGCLvZGvgieB3wQgiDxTiNcrg6R4
 2MWaD/Xy62DN5/GekVm1w==
UI-OutboundReport: notjunk:1;M01:P0:9/F0ymblWdo=;8DyX2AG72vyVKpiGrVhY/855LMV
 XWSZoFRgr1P2tIkq0xs4G+lnY51aeYf+YtbNwpTBwRPIRv05XX0bMJHv7QP0VyBzOrND78tlz
 35YqaEzthrxqYVSnMwFOEzghgRakhObhF0zIK5E5A+yWrFHFgSXe91+XhYTtwqsWS4GRBaJMZ
 EapeBtKzHkZxJ2fUaZcdDCY+0PykevOTd6nHJBVjZu9wxpySK00BLprurGhKdUhXeFIFt/C50
 IJmycW/vNvq7sGfjGrHU8ydYZLmJDF5I9u+J+RZqSr4BauW3KLuAjG6cIc+BnE2zutDtaFi7l
 KjP5t27YD+7cqXwrujebq5pMwbS2tF3i99MypEGiDx3xmXXcjkyJH4wU1uGoL/hvnPtttESS+
 rO0h8pVxdyWKZsD7ajXgO9Difs/i+RGwRaS+KmkwcPgVNqMLV8GmUsNA4dQQ6N10nneGYnTVg
 pcKrGJsb9NjM3DQCGKH/qUcaoJSiFmn5/HbXUP2xK/8vza5I50hXAMwbqZviXjvqZWJf3Tkvl
 nm59+iUWrDt8GgpHFtLmCxseCz487hO1irnFwfiHcJajozLaTn7KTA5V4DJjlgPnLCrDe9zl4
 Ky+1DaXBJRhCDrtgPAJbT7cvmEgpiwU6awoeEAIVXRh5YOHwT++xpjySGVowuVPzwFFx6gLf/
 aSx+Z7hArBi4gn5aHKv0EJVexUlC0XphUdbslmM8Rg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 07/03/2023 à 16:42, Mathis Marion a écrit :
> From: Mathis Marion <mathis.marion@silabs.com>
> 
> The sin6_scope_id field uses the host byte order, so there is a
> conversion to be made when host and target endianness differ.
> 
> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
> ---
>   linux-user/syscall.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 247e20572d..bafa77d353 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1713,6 +1713,11 @@ static inline abi_long target_to_host_sockaddr(int fd, struct sockaddr *addr,
>   	lladdr = (struct target_sockaddr_ll *)addr;
>   	lladdr->sll_ifindex = tswap32(lladdr->sll_ifindex);
>   	lladdr->sll_hatype = tswap16(lladdr->sll_hatype);
> +    } else if (sa_family == AF_INET6) {
> +        struct sockaddr_in6 *in6addr;
> +
> +        in6addr = (struct sockaddr_in6 *)addr;
> +        in6addr->sin6_scope_id = tswap32(in6addr->sin6_scope_id);
>       }
>       unlock_user(target_saddr, target_addr, 0);
>   

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


