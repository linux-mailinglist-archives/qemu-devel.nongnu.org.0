Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C2653503
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:23:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82Wr-0005Eq-Kj; Wed, 21 Dec 2022 12:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Wm-0005Cw-0g; Wed, 21 Dec 2022 12:05:13 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Wk-0000m9-Ds; Wed, 21 Dec 2022 12:05:11 -0500
Received: by mail-ed1-x532.google.com with SMTP id d14so22819653edj.11;
 Wed, 21 Dec 2022 09:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7gEnt/QLMcsTzMecV7cXs67rFH18YUSDra5/MgXAK6g=;
 b=cmtTBLMv9QPUFJaDORUyaFFN4nrCHQxSEVndfdmsx0TKhii54n/n8J88ioqewsFFxD
 aK+2hnFz7MCViqM2lz+MTsbsf5mOmA6hqg8cNDJo9WCP5huvejMdyZNsx4ohfeoWVQLk
 Ev3ccEJvY1vz3zr3dPfk8DHLkp77C2iBAdk8nkD3oo+Y/xXjhAXL7bQq8pCPF5Xp2dWQ
 qptdsSj93taiPfijcQJdgQZ4WY2Z5W2mbTX6ZMKwFBu1JGPqJrNfPDzMSoppeOF2YUyG
 X/2S9z0St+fhuPOYb1z4wa/DU+QuTDj7advMKcM/8dYybIWteEALFCe6MHFSoBql+Mrp
 Nscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7gEnt/QLMcsTzMecV7cXs67rFH18YUSDra5/MgXAK6g=;
 b=BAzxEjVv7BXuNddaBtV54/F6v+UluZtZwDVAHssIjOMnadrO8/X0SMpcVMv/RkTpet
 5xtB5MLIMP/LLFyi1eDvBn1Q8LfP9u29aUn5kB5UeF/01unIYYKA0THsDcvY4ilq5YaE
 vS6qkOAFCgbOIIhsNHSBhSAlQMUw1ihk7XhWwtG3+FXTQKvxMZBDfEMKpPsQbU2ELb7F
 8WR5oWaxlP86t5BApNKBP0krre13eb9DNSn2wImKvL/k6mLQPd0nc1ke/W64IneJUBi/
 oRSJpcoCkV21mm8Jo2hwdimJYiEm62AxzvLjNHCPDx8Yj+vUviUbOGBA3gRHj7U4gr1M
 nbfA==
X-Gm-Message-State: AFqh2krxZMUeC6PjQA2GE2ufYJdRbzbCZmtSoXh63RF0o6aRKLeycUSJ
 HwuhJdeJHh+24B1atdpVmFs=
X-Google-Smtp-Source: AMrXdXvbeGe6PDDMAoYqHnbirsJ0lbBCSm1DCKLuzcHW5wi37q2RN7od7C10LyADmcvHzMKQ2x7yLg==
X-Received: by 2002:a05:6402:7ca:b0:461:5b2f:2d81 with SMTP id
 u10-20020a05640207ca00b004615b2f2d81mr2099927edy.33.1671642308147; 
 Wed, 21 Dec 2022 09:05:08 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-051-061.92.224.pool.telefonica.de.
 [92.224.51.61]) by smtp.gmail.com with ESMTPSA id
 er7-20020a056402448700b0046bf7ebbbadsm7247323edb.42.2022.12.21.09.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 09:05:07 -0800 (PST)
Date: Wed, 21 Dec 2022 17:04:57 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev <mjt@tls.msk.ru>, 
 qemu-trivial@nongnu.org, Greg Kurz <groug@kaod.org>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 0/6] Trivial PPC cleanups
In-Reply-To: <f1b4f4c2-2e54-fd75-555a-7694748b1eb7@gmail.com>
References: <20221216145709.271940-1-shentey@gmail.com>
 <6fc82e52-b7a4-778b-1510-4831570a50a3@gmail.com>
 <FBA6F5D9-F6B5-445D-BC47-12FD202BC929@gmail.com>
 <1B1DB7AC-0775-4A8D-B804-7AF826D1BDFE@gmail.com>
 <f1b4f4c2-2e54-fd75-555a-7694748b1eb7@gmail.com>
Message-ID: <55D50BF4-7563-4661-81E8-817C942DEF9A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 21=2E Dezember 2022 10:27:51 UTC schrieb Daniel Henrique Barboza <danie=
lhb413@gmail=2Ecom>:
>
>
>On 12/20/22 19:53, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 20=2E Dezember 2022 22:40:25 UTC schrieb Bernhard Beschow <shentey@g=
mail=2Ecom>:
>>>=20
>>>=20
>>> Am 16=2E Dezember 2022 17:50:41 UTC schrieb Daniel Henrique Barboza <d=
anielhb413@gmail=2Ecom>:
>>>> Queued in gitlab=2Ecom/danielhb/qemu/tree/ppc-next=2E Thanks,
>>>=20
>>> Thanks Daniel!
>>>=20
>>> Is there a way we could accomodate for Zoltan's comment still? It's ju=
st cosmetics, so should be pretty simple=2E
>>=20
>> Yeah, you sent a pull request already! Thanks!
>>=20
>> I''ll address Zoltan's comment in a future series since I'm working on =
e500 anyway=2E
>
>I'll have to respin the pull request due to a clang error=2E I'll take th=
e
>opportunity to amend patch 4 with mister Balaton's suggestion=2E

Yay!

Best regards,
Bernhard
>
>
>Daniel
>
>>=20
>> Best regards,
>> Bernhard
>>=20
>>>=20
>>> Best regards,
>>> Bernhard
>>>>=20
>>>>=20
>>>> Daniel
>>>>=20
>>>> On 12/16/22 11:57, Bernhard Beschow wrote:
>>>>> These are some patches which helped me when getting a u-boot image t=
o run on ppce500 machine=2E
>>>>>=20
>>>>> Testing done:
>>>>> - `make check`
>>>>> - `make check-avocado`
>>>>>=20
>>>>> Bernhard Beschow (6):
>>>>>     target/ppc/mmu_common: Log which effective address had no TLB en=
try
>>>>>       found
>>>>>     target/ppc/mmu_common: Fix table layout of "info tlb" HMP comman=
d
>>>>>     hw/ppc/virtex_ml507: Prefer local over global variable
>>>>>     hw/ppc/e500: Prefer local variable over qdev_get_machine()
>>>>>     hw/ppc/e500: Resolve variable shadowing
>>>>>     hw/ppc/e500: Move comment to more appropriate place
>>>>>=20
>>>>>    hw/ppc/e500=2Ec           | 10 ++++------
>>>>>    hw/ppc/virtex_ml507=2Ec   |  2 +-
>>>>>    target/ppc/mmu_common=2Ec |  5 +++--
>>>>>    3 files changed, 8 insertions(+), 9 deletions(-)
>>>>>=20

