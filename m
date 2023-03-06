Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9036AD0DF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:53:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIlD-0005t7-Py; Mon, 06 Mar 2023 16:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZIkt-0005sY-5E
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:52:28 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZIkq-0004q4-Id
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:52:26 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mnq4Q-1qNTkh3sOg-00pLrP; Mon, 06 Mar 2023 22:52:18 +0100
Message-ID: <008ca1be-e4ca-1588-fe85-6be807b48b0b@vivier.eu>
Date: Mon, 6 Mar 2023 22:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] linux-user: fix sockaddr_in6 endianness
Content-Language: fr
To: Mathis Marion <Mathis.Marion@silabs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
 <20230220085822.626798-3-Mathis.Marion@silabs.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230220085822.626798-3-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yEtSxa37ZgEo0uYWWF3ERJ0rt8RhGCLXlH+kR2xkr6eqoI2+blj
 4tQc6Cnd3eFiwPkrupkWuw6jrIcUkS1Qh+qCqCjg4jtwXCTSotRdt59vf1i7jPRJ3/fugD0
 HfZ0PvB/xedN73K1LjIUfux6FUKZOWdmAgnVrokZih9a7mjNhrMHM8i5O5SfOwMDtUAlNdR
 9cCMup7IbcYjDcOjBY0ug==
UI-OutboundReport: notjunk:1;M01:P0:wSmCflhcCMQ=;Ad1a0RcZJrrn0BnY1sl9X35GX+5
 XAItU5wVaweMZ0BMjprEpfqNFEOa5xywFNdKOdduzTAwDvcbN0QU6T6KgwjMU75iommNh/ZCx
 CBEK7W4Q0H/7tjbFSXPPkEk1SoQC7PKP7foS+4RP2kEhsqvSlbdXp+Qy+z98KW8u6x/goMxaC
 m2Lj3BO8t5GstHYl1LKORzBNK7wSLiimpDtF6EjElOQ2ZZ5vp6psnshu3IFnB9L5gY6uQYLr2
 EnaDtQKgfP8RufB3VHqZftkehtvL9CF5FeQlFofaUGjANAyNxGFun/1aRsBS8BtuVnRESkErK
 ws2+yqIt7c/bmFn2j+1UTgb5rujXvRHWfkXsKibMaPkvmlashq/4KOeM/4AJkGjqiRN53Xiwb
 AJ3BJuGe5TRjIuQsN3SUClir38uRdKC3PmrPoD4xvte5mEzbq9uy87j8Ev6mOAMb2Mc6sOnlY
 AkisOC2avSXlqXXrME5aJ6qfrRn2/mWNcLbnQ7uxTEXp1p/Ra7YMDckEw69JDEfF2Z3itRU5t
 e/GA56D70L9mV63k4LOP18i8OcSB6S4i8sRwEFLfTkT1E8skuYtVw547/QIqshQKJo4vyf54v
 cxpDEC8PRPf2laBsKZggzOU7BmbDT85QxE5X1stLakmPcc8ypKrocWXaCjiIMJxJroOr368Tc
 weNix+ze58MwKI7GRu/6Th+mcRsl3P+YgS+RzFl6gA==
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

Le 20/02/2023 à 09:58, Mathis Marion a écrit :
> From: Mathis Marion <mathis.marion@silabs.com>
> 
> Fields sin6_flowinfo and sin6_scope_id use the host byte order, so there
> is a conversion to be made when host and target endianness differ.
> 
> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
> ---
>   linux-user/syscall.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 58549de125..1a6856abec 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1713,6 +1713,12 @@ static inline abi_long target_to_host_sockaddr(int fd, struct sockaddr *addr,
>   	lladdr = (struct target_sockaddr_ll *)addr;
>   	lladdr->sll_ifindex = tswap32(lladdr->sll_ifindex);
>   	lladdr->sll_hatype = tswap16(lladdr->sll_hatype);
> +    } else if (sa_family == AF_INET6) {
> +        struct sockaddr_in6 *in6addr;
> +
> +        in6addr = (struct sockaddr_in6 *)addr;
> +        in6addr->sin6_flowinfo = tswap32(in6addr->sin6_flowinfo);

In /usr/include/linux/in6.h, it's defined as a __be32, so I don't think we need to change its 
endianness.

> +        in6addr->sin6_scope_id = tswap32(in6addr->sin6_scope_id);
>       }
>       unlock_user(target_saddr, target_addr, 0);
>   


