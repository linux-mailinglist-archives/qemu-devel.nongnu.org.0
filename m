Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808BB69C5EC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 08:23:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU0Vc-0007yp-IJ; Mon, 20 Feb 2023 02:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU0Vb-0007yd-9E
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:22:47 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU0VZ-0000SS-K2
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:22:47 -0500
Received: by mail-wr1-x436.google.com with SMTP id bp28so1791158wrb.2
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 23:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SfkWTckSZ8+wkjKvjgcyMt9QwhLwEgD6avMOMCniA98=;
 b=gu+vbDFQRab7R9it+xIPeXY8dPLjohQporyXFEvOd0qlTWWVPXbExEOSanDYeH1qxk
 wEMRWRQxNucMqt4I3IUmC/oBXGV9p1zUD90yTn+QOjeQDXWB5aDZfy8hjvx358CqUeks
 clP0lEfbL22MEttPm+okijyxXrTJ8VgCWYYLBUGg8lj2rkSqoPaYo7jpWJH02u/4EWrf
 jqOq/z39+ZlcGvAvx8WS5FRSgZ8eIn19Xtrwqs1xn89YjoIj5iFc8qk74yb3i9zBhETH
 AO9e3avL0D/m6nH3xlhO/e6nQHJfGvdUrTCmuDdfUWb03tKGf2Dg45QbTyPgzbKDKM/P
 EPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SfkWTckSZ8+wkjKvjgcyMt9QwhLwEgD6avMOMCniA98=;
 b=r7wsYVUe6Gvhk51EmTHeR1tqTnzEn8m6v/LP0gE38+qdWzf4UJc5roQxYKViILOTpH
 uVNVxAVQbO4drvFzr6nZQhyUHBYnKBZ1DAYnJKkpM2WJbWKg3zrDrvzukZHCN67lDeVc
 SmGby7Z6sXC10RnPusShsPMHGAMZgt7R9VpJXTi1muMiJVG9wWh8g+wo7wX6vEyHUQ/H
 lu4b9rLEtFctL0atoJ6Op7pFROSHwFe1EBUjmwhd2nc9YtbNJv6vc7Jcol+Ko1ooL8lg
 5Opzies4AGpS+b2nZ4tAiuu8NlJhkK7t6OhHoF52iEIydmqTjIWd5lkearQeOj7s9qdp
 sxWw==
X-Gm-Message-State: AO0yUKXXJCO8l0I2MXV5YqfmEKE6DQennnOIpSCrlzr+1XOTIhF63bck
 XavvRTqxxOU3MAWd1jTx7y9/uw==
X-Google-Smtp-Source: AK7set+Dz9WRys4dXS3tXX/blmRJT6Q8I1RVOVaIF79ON1/Eu3KAHy5IsHt78DJ0Zazp6UfW74EjlQ==
X-Received: by 2002:adf:f50b:0:b0:2c6:e91d:1359 with SMTP id
 q11-20020adff50b000000b002c6e91d1359mr191069wro.61.1676877762865; 
 Sun, 19 Feb 2023 23:22:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j2-20020adfea42000000b002c573cff730sm11432854wrn.68.2023.02.19.23.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 23:22:42 -0800 (PST)
Message-ID: <823c5357-4403-ed2b-61aa-58b99d80f20a@linaro.org>
Date: Mon, 20 Feb 2023 08:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/4] linux-user: add target to host netlink conversions
Content-Language: en-US
To: Mathis Marion <Mathis.Marion@silabs.com>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230217163527.619486-1-Mathis.Marion@silabs.com>
 <20230217163527.619486-4-Mathis.Marion@silabs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230217163527.619486-4-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/2/23 17:35, Mathis Marion wrote:
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
>   linux-user/fd-trans.c | 64 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 146aaaafaa..aa398098ec 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -1284,6 +1284,49 @@ static inline abi_long host_to_target_nlmsg_route(struct nlmsghdr *nlh,
>       return host_to_target_for_each_nlmsg(nlh, len, host_to_target_data_route);
>   }
>   
> +static abi_long target_to_host_for_each_nlattr(struct nlattr *nlattr,
> +                                               size_t len, void *context,

You always pass a NULL context... Do we really need it?

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

If this fail, guest's nlattr is now inconsistent. Is this OK?

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
> @@ -1314,16 +1357,37 @@ static abi_long target_to_host_for_each_rtattr(struct rtattr *rtattr,
>       return 0;
>   }
>   
> +static abi_long target_to_host_data_spec_nlattr(struct nlattr *nlattr)
> +{
> +    switch (nlattr->nla_type) {
> +    case AF_INET6:
> +        return target_to_host_for_each_nlattr(NLA_DATA(nlattr), nlattr->nla_len,
> +                                              NULL,
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
> +                                              NULL,
> +                                              target_to_host_data_spec_nlattr);
>       default:
>           qemu_log_mask(LOG_UNIMP, "Unknown target QEMU_IFLA type: %d\n",
>                         rtattr->rta_type);


