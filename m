Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157C065AC8D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 01:05:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pC8Io-0001xN-B8; Sun, 01 Jan 2023 19:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pC8Im-0001x0-84
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 19:03:40 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pC8Ik-0002ju-Dd
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 19:03:39 -0500
Received: by mail-ed1-x52e.google.com with SMTP id m21so38034165edc.3
 for <qemu-devel@nongnu.org>; Sun, 01 Jan 2023 16:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Q1HMYqIVWqPZ1HjOyr7OqWJyu4K30+ZY+3XeS42dsg=;
 b=GSdXSpW3IwCSJLOQAkkxOl2nGBAnYv0zoKmRCEvPj8/ErIUhGCfg8wURIC4PiZhzkA
 hVoeN9LS9qywq+oUzXI9Mp9AbVxDu1fOCbkTb7xNbrzXPCxfAKlSszhmUn6cV7E8VY3U
 EnbJkSuRX4En8zwcl2sPugIX9ioB7D5251O3xpyEHk/gFXO6ejIjcpgS9k4aT495ebVI
 BFuI3PwOLHxDQE11bQFOFVQWULSXM7vMu1sc1rEirrxWovL/KVbsdze57OF2+MvEpjKd
 H8Dz5k177ISqlMSw6u8yZRJayXuDqLciv7956kr/hLCxyQOzDoAkWoA3DYUJTFrQYpch
 2Y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Q1HMYqIVWqPZ1HjOyr7OqWJyu4K30+ZY+3XeS42dsg=;
 b=r3WkdXV/jzwvG0cKfKzArnxZNRY54Ts3DhZMLygEaA8qjOdO5Wu3am5lgnloMOO2AU
 l/fnurO2ULtChHCrR2vzXzu5ybc89venu2ziY+7ZEY0N+W2+fMMpr17NyB1TsMGN59iQ
 qLhWQFv8kWc+DsiRoFguu1QkGlxPAVke82q8G6YV0PYlRTJCfn+0Ioq2Nb0GDehgonLo
 K2mxRRhWB8LxuX57ZdKJM5lvt3KXkevuCneaAYutZ55OEQ1LN0M0PxZwKsahdbJ4Z1aw
 KYyvDMZLE5DQWFOecQT0/bQ3PUf0oLv6yUUD2p7QfsMyyQp8ejUwYCxtkGvAs3717aW4
 vWpA==
X-Gm-Message-State: AFqh2kouXPkz3Tpycz4fXbOGQE4V8rSFVgl8JEZ3fMEC/h5VMdxJPCRo
 rFKfInRsBthjaZvOw8pYdgA=
X-Google-Smtp-Source: AMrXdXuzyG3RVXJmIu7RWHLHd2FVJC921aZmIIJoHih67C8m0iaM0O6NIHfQK14i1jI7d7DZTs1myA==
X-Received: by 2002:a05:6402:1217:b0:461:e5d1:73c5 with SMTP id
 c23-20020a056402121700b00461e5d173c5mr30234852edw.32.1672617816399; 
 Sun, 01 Jan 2023 16:03:36 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20048218d1b7e9d0fc3.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:4821:8d1b:7e9d:fc3])
 by smtp.gmail.com with ESMTPSA id
 u24-20020aa7d0d8000000b0046776f98d0csm12070774edo.79.2023.01.01.16.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Jan 2023 16:03:36 -0800 (PST)
Date: Mon, 02 Jan 2023 00:03:32 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/3=5D_hw/mips/malta=3A_Set_?=
 =?US-ASCII?Q?PIIX4_IRQ_routes_in_embedded_bootloader?=
In-Reply-To: <65f602e2-9067-f1e7-0c94-430e2b75e182@linaro.org>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-3-philmd@linaro.org>
 <9F566248-59DA-46E2-BD56-5DB98E9DB446@gmail.com>
 <2E4C442C-9057-4006-AE8D-123B513ED894@gmail.com>
 <65f602e2-9067-f1e7-0c94-430e2b75e182@linaro.org>
Message-ID: <ECE6DE21-1499-4BDF-A886-3FF4F36AF33F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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



Am 31=2E Dezember 2022 13:44:00 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>On 31/12/22 10:53, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 21=2E November 2022 15:34:05 UTC schrieb Bernhard Beschow <shentey@g=
mail=2Ecom>:
>>>=20
>>>=20
>>> Am 27=2E Oktober 2022 20:47:19 UTC schrieb "Philippe Mathieu-Daud=C3=
=A9" <philmd@linaro=2Eorg>:
>>>> Linux kernel expects the northbridge & southbridge chipsets
>>>> configured by the BIOS firmware=2E We emulate that by writing
>>>> a tiny bootloader code in write_bootloader()=2E
>>>>=20
>>>> Upon introduction in commit 5c2b87e34d ("PIIX4 support"),
>>>> the PIIX4 configuration space included values specific to
>>>> the Malta board=2E
>>>>=20
>>>> Set the Malta-specific IRQ routing values in the embedded
>>>> bootloader, so the next commit can remove the Malta specific
>>>> bits from the PIIX4 PCI-ISA bridge and make it generic
>>>> (matching the real hardware)=2E
>>>>=20
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>>> ---
>>>> FIXME: Missing the nanoMIPS counter-part!
>>>=20
>>> Who will be taking care of this? I have absolutely no clue how the wri=
te_bootloader functions work, so I don't see how to fix it=2E
>>=20
>> Ping
>
>This comment has been taken care of:
>https://lore=2Ekernel=2Eorg/qemu-devel/a3c3f639-dbb1-88a7-43fe-547a234c58=
90@linaro=2Eorg/

Ah, now I see where this is going=2E

>However while testing the MIPS pull request I prepared I
>found a bug in the GT64120 which I'm trying to fix since
>various days=2E=2E=2E Unfortunately your series depends on it,
>so this is a blocking issue=2E Sorry for this long delay=2E=2E=2E

Don't worry=2E

How can the bug be reproduced? Is there a test run in the CI? Note that I =
get a 404 when trying to access https://gitlab=2Ecom/philmd/qemu/-/commits/=
mips-testing/ =2E

Best regards,
Bernhard

>
>Phil=2E

