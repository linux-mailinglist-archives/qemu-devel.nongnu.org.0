Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC46ADA6C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 10:32:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZTgK-00047g-FO; Tue, 07 Mar 2023 04:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZTgH-00046m-F5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:32:25 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZTgF-0003pJ-A7
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:32:25 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKKIZ-1prQbf39Y7-00Lo0Y; Tue, 07 Mar 2023 10:32:16 +0100
Message-ID: <d9c65637-5596-785e-83f2-95a8440d1a53@vivier.eu>
Date: Tue, 7 Mar 2023 10:32:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/4] linux-user: add target to host netlink conversions
Content-Language: fr
To: Mathis Marion <Mathis.Marion@silabs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
 <20230220085822.626798-4-Mathis.Marion@silabs.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230220085822.626798-4-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:f7GXAa6aB+Qk+tQSoItIOB4poFFPFmOY5JY5Ea/zS2KoxlDJUI0
 6jpxCS92MpxYEpCP67DXoN8AArXuwHesny+SHarQbTpvS1qgmBDhqYIN3ohkqY578QQTJJX
 B8B+dfZujKE6/NM7od+CiD/+06ihgEUyVurY+XZCA/0yAoFJQP8XxYXzdlDO65cS0EzLscO
 PSNos4epCgWpYh7MB7w4A==
UI-OutboundReport: notjunk:1;M01:P0:XjlPMMSxvTc=;Vb/J7T9SFjJVIuyr09+jURoK7/y
 9Y23iYd/Qh1jSlADnJjBwGTSBgdwU3xzrj4ACYvEBU3qMY5VqJ+d0J9tuDIpnZfgLzftYYexi
 cWziD+s1czB80kZWLg05Vt76elIkGiXSZZK3v/OJrFDrjgOTIDkaALJYRe8kR+TTRon0MAGT0
 aLqImQCRKRF6WHCUAmfTzegI/NwQ0J6NZ2xh5lYyA83Z1U3McRjLJvf1l8xAJgFbCtxT8uq7V
 nV0ElfUmF90Vy54IhR8VF68M9lwkZbwYm3a/uva49mwmZtj1St6blDFgPoQpWlTtt7k616oBN
 2EYNJp5Q60BMcUS5HtIl8q+RM3M7FVpTTo91rhdGt1U+8vNpZDaChytjOGLy/DGoNXeYSP1l5
 wf8a+svAUeujN04MGtprnL/s1aeys2BVGkOWOAFxzc7fv2IJXCSJCVLYHMJYSbGh9IfTYP8Uw
 kQhoULbLpuHICaC9gBTGrT3Z3kj5IVszUCLLQ8qNMWaIMXD8JaD2pdF5PJ2jkJ6HTstQ0xOJW
 I8lC07j/JrPSZJiGOdCYZo9Nb6SGm+FUGRzRk208/soePK+hLUz8xKzqHJBYpcGdui1vY1CfV
 bHmUHoEP9RZcwkXsgAon2RajnPWioL+gO9FTJKXfpVpp0fGmJLrFti1nIrNgAwcE4AZSqEK+h
 G5O/HYyJfqisEtzn5Sy89Io+JemIcJgfRaoTuyMfaw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
> Added conversions for:
> - IFLA_MTU
> - IFLA_TXQLEN
> - IFLA_AF_SPEC AF_INET6 IFLA_INET6_ADDR_GEN_MODE
> These relate to the libnl functions rtnl_link_set_mtu,
> rtnl_link_set_txqlen, and rtnl_link_inet6_set_addr_gen_mode.
> 
> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
> ---
>   linux-user/fd-trans.c | 62 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 146aaaafaa..4852a75d9d 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -1284,6 +1284,49 @@ static inline abi_long host_to_target_nlmsg_route(struct nlmsghdr *nlh,
>       return host_to_target_for_each_nlmsg(nlh, len, host_to_target_data_route);
>   }
>   
> +static abi_long target_to_host_for_each_nlattr(struct nlattr *nlattr,
> +                                               size_t len,
> +                                               abi_long (*target_to_host_nlattr)
> +                                                        (struct nlattr *))
> +{
> +    unsigned short aligned_nla_len;
> +    abi_long ret;
> +
> +    while (len > sizeof(struct nlattr)) {
> +        if (tswap16(nlattr->nla_len) < sizeof(struct rtattr) ||
> +            tswap16(nlattr->nla_len) > len) {
> +            break;
> +        }
> +        nlattr->nla_len = tswap16(nlattr->nla_len);
> +        nlattr->nla_type = tswap16(nlattr->nla_type);
> +        ret = target_to_host_nlattr(nlattr);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +
> +        aligned_nla_len = NLA_ALIGN(nlattr->nla_len);
> +        if (aligned_nla_len >= len) {
> +            break;
> +        }
> +        len -= aligned_nla_len;
> +        nlattr = (struct nlattr *)(((char *)nlattr) + aligned_nla_len);
> +    }
> +    return 0;
> +}
> +
> +static abi_long target_to_host_data_inet6_nlattr(struct nlattr *nlattr)
> +{
> +    switch (nlattr->nla_type) {
> +    /* uint8_t */
> +    case QEMU_IFLA_INET6_ADDR_GEN_MODE:
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Unknown target AF_INET6 type: %d\n",
> +                      nlattr->nla_type);
> +    }
> +    return 0;
> +}
> +
>   static abi_long target_to_host_for_each_rtattr(struct rtattr *rtattr,
>                                                  size_t len,
>                                                  abi_long (*target_to_host_rtattr)
> @@ -1314,16 +1357,35 @@ static abi_long target_to_host_for_each_rtattr(struct rtattr *rtattr,
>       return 0;
>   }
>   
> +static abi_long target_to_host_data_spec_nlattr(struct nlattr *nlattr)
> +{
> +    switch (nlattr->nla_type) {
> +    case AF_INET6:
> +        return target_to_host_for_each_nlattr(NLA_DATA(nlattr), nlattr->nla_len,
> +                                              target_to_host_data_inet6_nlattr);
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Unknown target AF_SPEC type: %d\n",
> +                      nlattr->nla_type);
> +        break;
> +    }
> +    return 0;
> +}
> +
>   static abi_long target_to_host_data_link_rtattr(struct rtattr *rtattr)
>   {
>       uint32_t *u32;
>   
>       switch (rtattr->rta_type) {
>       /* uint32_t */
> +    case QEMU_IFLA_MTU:
> +    case QEMU_IFLA_TXQLEN:
>       case QEMU_IFLA_EXT_MASK:
>           u32 = RTA_DATA(rtattr);
>           *u32 = tswap32(*u32);
>           break;
> +    case QEMU_IFLA_AF_SPEC:
> +        return target_to_host_for_each_nlattr(RTA_DATA(rtattr), rtattr->rta_len,
> +                                              target_to_host_data_spec_nlattr);
>       default:
>           qemu_log_mask(LOG_UNIMP, "Unknown target QEMU_IFLA type: %d\n",
>                         rtattr->rta_type);

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


