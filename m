Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59C369C753
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:07:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU28H-0002ef-9M; Mon, 20 Feb 2023 04:06:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU28E-0002eV-Ll
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:06:46 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU28C-0002Pf-Pk
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:06:46 -0500
Received: by mail-wr1-x434.google.com with SMTP id t13so230751wrv.13
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nkOH1wcZppBj77CcVXxA+ucnYVBKnBkMUJtbiyRqU7k=;
 b=wPp4eIz20tI1xzN5dirsA0M6lhzwjqk7qU0yCdczQfaTq92MdBqDcGCh1HdxLSgusD
 cWdi1FzAvxNRjA3rSfSMtcjhpoHJ0a47KH2kz3XuL802iq5/+B82Q7gBdnq24Vb5RaI+
 6v+Fu56uvSzVC+Xy01h9Wh0oe/6ciQo5fHwxnCvk+TJkt9bPegh8E77vKY51BHPPNHb4
 jLZfifGy8RDkG8qoJZ5sk9A4UfnqrC3N1owt4nigMrrDQqyJAbU/xrA4urSd/Nb86Z8z
 PnAAs4en9I4tbQ2a+qhkWwy+9FAEZBAdTSahxQY3vyUg+8yCDxEuL6evJ0AbNyt+7m7l
 vGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nkOH1wcZppBj77CcVXxA+ucnYVBKnBkMUJtbiyRqU7k=;
 b=uM7c1Ro8pAVmGzuzx91CKp30HOp1wAPlO2ti+AS2oFVu5ck0Xi8+JCzDK1J9ZiWJ9C
 /gEoCL22dqhrrHKK6E69FqmaUYCSoqFSPW/vD7z5VSrEEFCuNA8Hpt1+3TweRWxy28CQ
 +X/E9v4A+yiUQN2Rwj0+9DlAAQ0cVvtZ8sAAanwZWWvbRxC95pSwgp0naEfcDyfkGxtn
 Xw/QJOn5z90GIns2n5PtMq+U9+fRlyiz3JRri1xs+ptZY3c6nCKQPRVYiYBscnkiAfPh
 2oc7HutyiFXP2Hnv9IvI4uJ6mAZaTBTRO9cxcPfwqOeUh096Lm2kNnoUjglzwfJQjF7l
 zX5A==
X-Gm-Message-State: AO0yUKX3SCuFDfuuDLk8UFeHyqomRrzbwPgkX3a5Tc7EB7ApK6vyo+UP
 PlzpOwbTqv3VQMbi/KmrKUF0Jf0o2KqCl+Rw
X-Google-Smtp-Source: AK7set+0LafRywsFJ0Mkw84QYmdRPgt9a7tsOoAYdwI8PmHoYC7z4lEtokji4ifgahiIl7B4OgXrig==
X-Received: by 2002:adf:e242:0:b0:2bf:c0e4:1bc5 with SMTP id
 bl2-20020adfe242000000b002bfc0e41bc5mr808853wrb.56.1676884002624; 
 Mon, 20 Feb 2023 01:06:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v6-20020adfedc6000000b002c5544b3a69sm11789126wro.89.2023.02.20.01.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 01:06:42 -0800 (PST)
Message-ID: <fc6b4e3f-378f-f415-79b9-79afbaef93ba@linaro.org>
Date: Mon, 20 Feb 2023 10:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] linux-user: fix sockaddr_in6 endianness
Content-Language: en-US
To: Mathis Marion <Mathis.Marion@silabs.com>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
 <20230220085822.626798-3-Mathis.Marion@silabs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220085822.626798-3-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 20/2/23 09:58, Mathis Marion wrote:
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
> +        in6addr->sin6_scope_id = tswap32(in6addr->sin6_scope_id);
>       }
>       unlock_user(target_saddr, target_addr, 0);
>   

Same content as v1, right?

If you don't change patch content, please include the reviewer tags
so we don't have to review your patches again.

So similarly to
https://lore.kernel.org/qemu-devel/6be6bf58-cf92-7068-008e-83f5543a1f01@linaro.org/
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


