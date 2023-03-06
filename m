Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6166AD104
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIv1-0003rh-FX; Mon, 06 Mar 2023 17:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZIuy-0003mc-UV
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:02:52 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZIux-0006j8-70
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:02:52 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mk0e8-1qJc6O2wO0-00kQfb; Mon, 06 Mar 2023 23:02:44 +0100
Message-ID: <58f463ba-ff12-e0a4-5bf8-8c9e361ae647@vivier.eu>
Date: Mon, 6 Mar 2023 23:02:43 +0100
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
X-Provags-ID: V03:K1:01anwgNK6y/RCkZzJldQ9igcwIkH0Xtj1rOEJBoFfcVW9Un6aS9
 1hyt1NTYvHGeftFwhxiB61ozs72Eh51s7K5PIFMBxoYaRscm+T5SeQVG6pWy10tqljoOVTa
 ZTn4Spm/U+wHZbg3/MHB7Ab5SbNdUbyfGpa7yfmpjTNMeWjA45Iiu9ibcmCtZI8Q+Jm+YRs
 4LcWYP4cAHH69eMOK1P/g==
UI-OutboundReport: notjunk:1;M01:P0:+/Iwg/jd/aU=;4KwIKM7ufDPfn5qtljqI3dUMXfq
 ElBZYAIrA7MG7HEb626PRlfQhnMVI+TK8zCZyNUIGcxug0D+RQrYbSuYlzzHi5r303fehbCpH
 PANKBsJcB6NAzDj1wzdS66mEO9WHqnQb76NH3w1RBgRLwYhmJpKYobbCR6T1JQPJh8LsPNKzr
 Ifzx3luwZPLbgibVkWL4yVUbZBuh8AWGXesfVFEFnwarM5YhFOH1Hza4Zze2Fof2lOvavG2CM
 OTncwmMHZFzybEnHU/EdF07bebR/KR0fKgPwuJegJQEjS1r3M98jPhIH1p+uUdKlJCYKCuw8U
 Hmzvt9fvB3dbgEbCHSf+LAVGB2osORWoqIqb7R/sgM/dJWyLwI9lgscD4q/Mn/x8mG7ojjXL/
 4rZW0igcmN1kM0GhCMKB5j1b/DZEi2zq5uBy38zWLwVA/5XI3clDCvOIaPB4UvSiBVlEYnKjs
 CE1Gv+5dghBVbJChg+yEMI87uEFXyBUMC58N+uTasmDywTSF+lHENzElE4LUNIajMLsgcHiUU
 HzfkjWPe6F+5QMSDoafDJsZ0+l3JYU3eiecYsA2YXy9+8SajECiIQVohrxjGeVEpz83LA3pKF
 nObhL+bjEDTV9f7SPWc7kSrnZG+z3PVRGU6YGFu8VbX4I1vQXyzh/bDF1hp6/cyV6KTXrTvc1
 jWDwwJggBjTzkYKnR3PMKA8hl+DKS+g/RBJWbj6kSQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

