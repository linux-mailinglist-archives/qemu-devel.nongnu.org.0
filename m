Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD7652F76
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 11:28:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7wKQ-0005I1-4z; Wed, 21 Dec 2022 05:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7wKN-0005Hm-J0; Wed, 21 Dec 2022 05:27:59 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7wKM-0001mg-48; Wed, 21 Dec 2022 05:27:59 -0500
Received: by mail-oi1-x22c.google.com with SMTP id c129so12995211oia.0;
 Wed, 21 Dec 2022 02:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/BUjnBHekT9+TsSSJ6Bv43vx8pYCPSOPjBAWe1TO7dM=;
 b=PF+41CITZk6m4WzTOVML9KACLW4U7gj+htHF8QmxS/gAo3BNmCjRPFFzA0TJ7uh3jo
 NHqYgkBPNjBWdw5AYosFzP5hHJsPL2YotV8vxan1Ha6QDb1cG4SdBdYcYVj40xhbfeKi
 fGe7r1qpTPXvsLYngmLMBk45XllkmJl3ghkc50rpsnU0VryEF7G1pPEUhpYPOWE3bvwu
 E4gACQH6ISjHdoa8xChyvzr+2CjGO/L09yP/C6Z9kFwMG9H+o8kmOTwO9H+HwOdzWcfh
 N2pTIZgg6T365+4SGtyj2JYAr5+x0/kNGDpaX3xz74CtAnMC1W4sMqe9zExybIpq6V6H
 xcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/BUjnBHekT9+TsSSJ6Bv43vx8pYCPSOPjBAWe1TO7dM=;
 b=rMPXSBaB1dpQ/6W4EzCFWNjiSt4+Ct+D7Mw5V3F9XMkn/ebqopkPco/462OmuGmis0
 avCqRhcBgpZW3t7CpZGdoZ8E56Wp/gjqGnIGf14bP/wcXDXYPrlo48yVaBv84wly362Y
 +P213XVL2VlBkySMafN6qO2zwFnQ1kAq+oghCarXPZPYv3NJbinxu2f+xRzVpO3Mik2P
 4B1QVcpXyf8RYrp0cBmwpBEYeDZv8JP5er5mlKMVrX7MWXKFobmpqgVVH0YbcvB6It7z
 dWMyiLcs5aHK82GHIMgIG4rcEtJ9IwNlDVzCu5sbLajszVbHC+ehnTxJLU/c3Wh3qAQa
 6CZw==
X-Gm-Message-State: AFqh2ko0Rs7Re3lVYuuGik1p+IITa0ZrECpR9o64JoAyWva25AMAETH7
 vPaMup4e2U9ngwBb2V3UnRA=
X-Google-Smtp-Source: AMrXdXsIoDdoXIylbXFxf87ukFAEyXXVi6trHe/VKHJD51rhYR8/7kQevljEb79TmdHO0/4KIqoMfw==
X-Received: by 2002:aca:210a:0:b0:35e:de12:d768 with SMTP id
 10-20020aca210a000000b0035ede12d768mr413363oiz.53.1671618476245; 
 Wed, 21 Dec 2022 02:27:56 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 36-20020a9d02a7000000b0066f7e1188f0sm6655520otl.68.2022.12.21.02.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 02:27:56 -0800 (PST)
Message-ID: <f1b4f4c2-2e54-fd75-555a-7694748b1eb7@gmail.com>
Date: Wed, 21 Dec 2022 07:27:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/6] Trivial PPC cleanups
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev
 <mjt@tls.msk.ru>, qemu-trivial@nongnu.org, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20221216145709.271940-1-shentey@gmail.com>
 <6fc82e52-b7a4-778b-1510-4831570a50a3@gmail.com>
 <FBA6F5D9-F6B5-445D-BC47-12FD202BC929@gmail.com>
 <1B1DB7AC-0775-4A8D-B804-7AF826D1BDFE@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <1B1DB7AC-0775-4A8D-B804-7AF826D1BDFE@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.161,
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



On 12/20/22 19:53, Bernhard Beschow wrote:
> 
> 
> Am 20. Dezember 2022 22:40:25 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>
>>
>> Am 16. Dezember 2022 17:50:41 UTC schrieb Daniel Henrique Barboza <danielhb413@gmail.com>:
>>> Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,
>>
>> Thanks Daniel!
>>
>> Is there a way we could accomodate for Zoltan's comment still? It's just cosmetics, so should be pretty simple.
> 
> Yeah, you sent a pull request already! Thanks!
> 
> I''ll address Zoltan's comment in a future series since I'm working on e500 anyway.

I'll have to respin the pull request due to a clang error. I'll take the
opportunity to amend patch 4 with mister Balaton's suggestion.


Daniel

> 
> Best regards,
> Bernhard
> 
>>
>> Best regards,
>> Bernhard
>>>
>>>
>>> Daniel
>>>
>>> On 12/16/22 11:57, Bernhard Beschow wrote:
>>>> These are some patches which helped me when getting a u-boot image to run on ppce500 machine.
>>>>
>>>> Testing done:
>>>> - `make check`
>>>> - `make check-avocado`
>>>>
>>>> Bernhard Beschow (6):
>>>>     target/ppc/mmu_common: Log which effective address had no TLB entry
>>>>       found
>>>>     target/ppc/mmu_common: Fix table layout of "info tlb" HMP command
>>>>     hw/ppc/virtex_ml507: Prefer local over global variable
>>>>     hw/ppc/e500: Prefer local variable over qdev_get_machine()
>>>>     hw/ppc/e500: Resolve variable shadowing
>>>>     hw/ppc/e500: Move comment to more appropriate place
>>>>
>>>>    hw/ppc/e500.c           | 10 ++++------
>>>>    hw/ppc/virtex_ml507.c   |  2 +-
>>>>    target/ppc/mmu_common.c |  5 +++--
>>>>    3 files changed, 8 insertions(+), 9 deletions(-)
>>>>

