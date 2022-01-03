Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D8F483899
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 22:38:56 +0100 (CET)
Received: from localhost ([::1]:51548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4V2c-00026D-O3
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 16:38:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4V1f-0001Gj-3z; Mon, 03 Jan 2022 16:37:55 -0500
Received: from [2607:f8b0:4864:20::82d] (port=33673
 helo=mail-qt1-x82d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4V1d-0000So-GW; Mon, 03 Jan 2022 16:37:54 -0500
Received: by mail-qt1-x82d.google.com with SMTP id v4so29623438qtk.0;
 Mon, 03 Jan 2022 13:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OHHAKkfKTZsIahpHduSpta8mxiHCrAlb3m8ZlZtz/CQ=;
 b=c7LK6pfPVNcJYkPVg1ZdzDFNhmqSgFRZh6kejZbr1SFZYN6UA7yWCDmmoe1VFDqMeK
 YPv8YVAC8P/kM1+jHGsRlIK/TcM99LCOPG+CGPrUgmxEzWZpWrqytApBLjvJgEE24FG/
 X42aaF/z3Q3po/0SQsJAjdbaUjjSWnqIzK8po2wlyLZC9L1upUHLkP5RQzoWSsJgkchi
 9sPsnazzeOyUynAx5M4epDQwBBD3A5vUZ8M7DGqrvXRp9kLPYS0dHZoWA3n+bQ0kaoWS
 0BJEJxQkQHbMAKJwC2/U6Oy9qG3hVWBOiBX3dtlTA0ywF4x/cEIh5JXOat+8hiK63zXI
 JIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OHHAKkfKTZsIahpHduSpta8mxiHCrAlb3m8ZlZtz/CQ=;
 b=6bk8KppyfJawFQtKacLvlPS7xUuPz4VwTtK1xvRhd0wARJddQECAut4gLBQkbb0/pL
 c/IbP1Jdnur/PPRIcqvmbLj2HT8evM45Z3icq2SDKxvAMXM54M9fW7D1Z89MSAeeTcLp
 aX19p9FEVVMMlZWBn/oXopEa4FhIEou0QlwYM+3vAzM1xRFAbvt6PsNb6T7XTgOdVk+s
 0uiFCWzZrfGoKIx7eqmJifEdK7Kufq4T57LAWXjTPrLnQqXVNqKcUiRR3/muVYQ74uTl
 y0QAYKjVrCS9e+araAyE8ltimaFY1jwEDth74if2rSb1+DIQw4walUnFrg4X9mTQabPn
 HS5Q==
X-Gm-Message-State: AOAM531xLCcIGis6NfQsLVHp9E3zfN2hc3oY/pcrdzMHeH3vl2GkLvic
 R/nq/V2sUsSuPASrDeV8muM=
X-Google-Smtp-Source: ABdhPJynqhn/n1836ry7kSWA++LWIh6Rnq1JPLaG9BuGldlvt3w8Dm7hRufVCN1Y/ZoFXt+sKmTZSA==
X-Received: by 2002:a05:622a:352:: with SMTP id
 r18mr42508980qtw.61.1641245872295; 
 Mon, 03 Jan 2022 13:37:52 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id c7sm32055753qtx.67.2022.01.03.13.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 13:37:52 -0800 (PST)
Message-ID: <3d837bb6-9fa2-7204-9c13-78c2bbd486e9@gmail.com>
Date: Mon, 3 Jan 2022 18:37:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 00/17] ppc/pnv: enable pnv-phb4 user devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <e62ca8df-25a2-222c-1ffe-12fc52a4a82f@kaod.org>
 <91929906-0ade-51ce-295f-38cd68c519b9@gmail.com>
 <e52685ef-d9d6-9ad4-dd7a-a12d9feeaf13@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <e52685ef-d9d6-9ad4-dd7a-a12d9feeaf13@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/3/22 18:20, Cédric Le Goater wrote:
> On 1/3/22 19:58, Daniel Henrique Barboza wrote:
>>
>>
>> On 1/3/22 05:21, Cédric Le Goater wrote:
>>> Hello Daniel,
>>>
>>> On 12/28/21 20:37, Daniel Henrique Barboza wrote:
>>>> Hi,
>>>>
>>>> This series implements pnv-phb4 user devices for the powernv9 machine.
>>>> It also includes a couple of pnv-phb3 and pnv-phb3-root-port fixes that
>>>> were also applied for the pnv4 equivalents.
>>>>
>>>> During the enablement I had to rollback from the previously added
>>>> support for user creatable pnv-phb4-pec devices. The most important
>>>> reason is user experience. PEC devices that doesn't spawn the PHB
>>>> devices will be just a placeholder to add PHBs, having no use of their
>>>> own as far as the user sees it. From this standpoint it makes more sense
>>>> to just create all PECs and attach the PHBs the user wants on them.
>>>> Patch 14 also describes technical reasons to rollback this support.
>>>>
>>>> The series is rebased using Cedric's 'powernv-6.2' branch [1]i, which
>>>> includes the '[PATCH 0/5] ppc/pnv: Preliminary cleanups before user
>>>> created PHBs' patches [2].
>>>
>>> It would be easier if you based the patchset on mainline. It's not
>>> a problem to resend patches of another person or/and even rework
>>> them to fit your needs.
>>
>> Sure, I'll send the v2 based on the mainline + the required patches.
> 
> Let me merge a couple first. It should reduce the overhead. I will drop
> these :

No problem. I'll re-send the v2 after the merge.

> 
>    ppc/pnv: Attach PHB3 root port device when defaults are enabled
>    ppc/pnv: Attach PHB4 root port device when defaults are enabled
> 
> They are in the way for your changes.


I`ll drop these in my side as well.


Thanks,


Daniel







> 
> Thanks,
> 
> C.

