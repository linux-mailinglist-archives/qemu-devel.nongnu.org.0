Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331C469C7BD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:34:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2Y3-0008Mu-BU; Mon, 20 Feb 2023 04:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Xn-0008Ht-O3
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:33:15 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Xk-0000FE-IF
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:33:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so415635wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SxUkKogj0OHT2CNnIaMX4tw5KuKOFfRBaSJr60hQU4Q=;
 b=Nlu4EmMf61CyU7OZ/rRFB2ET8SFvUuphIfJXTcO14/PHdkybSC2BgteZ4lmlDbsHEj
 LCIQI2bEKZ4QVzAIvnRyTRtuP6LpuFteSJ2xfMKFQp5iLFpcPNcb6p7CKe9Ebhxu2/PV
 gSwLjVgpAtQnst4hvLpNuBzqsfBUyNuoOfyBXlOyc5fOZoKkXPV0MivCCD1uyYX5h0VY
 MhaW1ohjzLZPwUvKf8pI01Lyon2jF6LB0fZ9mzpWU8UoFc5KiZcKNS/n1j3YKHWtAMYL
 UbLCkiZW1zEsa/smhw9J2vo2DzqWdON/kPprDb6yCrX/5Az3dVQhbDlz8rl7gcK7/vQH
 nGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SxUkKogj0OHT2CNnIaMX4tw5KuKOFfRBaSJr60hQU4Q=;
 b=NKX2bM8iiDBWFaUlhPzJ8fGej3UO/v8rTS9n5gRCh6i8EGjLgsMjbAy+MliNkMlhHk
 CHCTSL/o+jY8FT3VAzIDH+P1t4ahMkHVxHeR9cey6smH4oOKoILkS9D8Et0H1/GvcGg7
 i2nPGHKs/6VWV33yjQOsonmdnmiyDLLf69fGy13v734VIVXiQ899j/0yFv+j2WaIAM1+
 FF74VOQMiOJ3foVOcdcUXih8ErCXZe1cwTSojcqrmmSZbLX/59OaWmydWzExiixbanep
 t/1qRelNIrC24L2Ir6QT4hpt4cvykePb4BlgkCZofQUDBkfbOQCf2Q9aGTFFTz7l5Lvu
 VVPA==
X-Gm-Message-State: AO0yUKUfqaWuRS+8arioePegqbq959WSbQMYSwUFzHx6X9ugsnN2Uinu
 xuNWgGvEcg3cDj4oV4On0uY6rQ==
X-Google-Smtp-Source: AK7set/UNeQB0cB8wwUGmj8FCMAhFatwvEratzKcSDsH31MTW9/8sC46l5V5GL6mF2cTEjPZVHZqhg==
X-Received: by 2002:a7b:c446:0:b0:3df:e1e9:201d with SMTP id
 l6-20020a7bc446000000b003dfe1e9201dmr84100wmi.40.1676885578790; 
 Mon, 20 Feb 2023 01:32:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay14-20020a05600c1e0e00b003e20cf0408esm959843wmb.40.2023.02.20.01.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 01:32:58 -0800 (PST)
Message-ID: <0499d7b2-8683-5428-d6c2-bb8005e45a88@linaro.org>
Date: Mon, 20 Feb 2023 10:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] linux-user: fix sockaddr_in6 endianness
Content-Language: en-US
To: Mathis MARION <mamarion1@silabs.com>,
 Mathis Marion <Mathis.Marion@silabs.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
 <20230220085822.626798-3-Mathis.Marion@silabs.com>
 <fc6b4e3f-378f-f415-79b9-79afbaef93ba@linaro.org>
 <cb86de96-8f44-d92f-f19b-260da1ec5512@silabs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cb86de96-8f44-d92f-f19b-260da1ec5512@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 20/2/23 10:09, Mathis MARION wrote:
> On 20/02/2023 10:06, Philippe Mathieu-Daudé wrote: >> On 20/2/23 09:58, Mathis Marion wrote:
>>> From: Mathis Marion <mathis.marion@silabs.com>
>>>
>>> Fields sin6_flowinfo and sin6_scope_id use the host byte order, so there
>>> is a conversion to be made when host and target endianness differ.
>>>
>>> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
>>> ---
>>>   linux-user/syscall.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index 58549de125..1a6856abec 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -1713,6 +1713,12 @@ static inline abi_long 
>>> target_to_host_sockaddr(int fd, struct sockaddr *addr,
>>>       lladdr = (struct target_sockaddr_ll *)addr;
>>>       lladdr->sll_ifindex = tswap32(lladdr->sll_ifindex);
>>>       lladdr->sll_hatype = tswap16(lladdr->sll_hatype);
>>> +    } else if (sa_family == AF_INET6) {
>>> +        struct sockaddr_in6 *in6addr;
>>> +
>>> +        in6addr = (struct sockaddr_in6 *)addr;
>>> +        in6addr->sin6_flowinfo = tswap32(in6addr->sin6_flowinfo);
>>> +        in6addr->sin6_scope_id = tswap32(in6addr->sin6_scope_id);
>>>       }
>>>       unlock_user(target_saddr, target_addr, 0);
>>>
>>
>> Same content as v1, right?
>>
>> If you don't change patch content, please include the reviewer tags
>> so we don't have to review your patches again.
>>
>> So similarly to
>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/6be6bf58-cf92-7068-008e-83f5543a1f01@linaro.org/__;!!N30Cs7Jr!X8OE0Z6gfU2FYtWrk0_Dhk_gUPlhqRPtJ60B7HxeicEaFDDFCLRsmoqhnC3MXGOw7ZfEkgLQhDwsyQv76w$
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
> 
> Yes, I am still new to this. Thank you for you consideration, I will
> remember it for next time.

Sorry I didn't notice you are new because your patch series already
have a very high quality :)

You can see guidelines here:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#proper-use-of-reviewed-by-tags-can-aid-review

In particular:

   When reviewing a large series, a reviewer can reply to some of the
   patches with a Reviewed-by tag, stating that they are happy with
   that patch in isolation [...]. You should then update those commit
   messages by hand to include the Reviewed-by tag, so that in the next
   revision, reviewers can spot which patches were already clean from
   the previous round.

Regards,

Phil.

