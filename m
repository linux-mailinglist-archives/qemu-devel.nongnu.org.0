Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC6E64A989
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 22:30:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qMC-00039P-M1; Mon, 12 Dec 2022 16:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4qMA-00039E-G3
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:29:02 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4qM1-0002ax-BW
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:29:02 -0500
Received: by mail-ed1-x534.google.com with SMTP id d14so14980189edj.11
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 13:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUSaJNT8/pX/DtVP04K1Py7fsvONsur5sY5qJwzASDM=;
 b=G7aUcSgNTNkaaR9LwYBal5bi/zticaeVXH7jjcDz7PopdGlHL3wwNFiXLGeJJEn7Co
 x2pUVR+jjkNVlATLYbMsPgIv/xLLTNCq+G3Imxq6sY7otzEWdpwEWqyJDYlgF0wVAmAc
 fuQtb9mpm59fDA5ca81opiePifXvvcgUG+mdWTMBxuDwNN81EWNKXuZ1nTFkYHzr4PZm
 AGFBRT3ARHFgTsz86Eaq4rgeICnK+2LADqP3UV2VkhUkaRZMoSAuJjRKu6xx1Se8VxVD
 0EQ+HkdymR11RRpI3Ou9zboGb5sWWfW6wjQqbnjJtJBGxHQv1fPwmOuFnfiek8IAoWJy
 aD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RUSaJNT8/pX/DtVP04K1Py7fsvONsur5sY5qJwzASDM=;
 b=4L/MwQU+Xo2WebvGmzo9u5jxE5fY3HulMV1NsbsU/BFGHX+pezmjsCT1ZlJq9m2J4r
 oy0Sa+9jh/2tCJ49n4W4mtvjMrIn4B19CQZ07UIoteMsjdR3kdNeMeRHRawg+ONBclZD
 xLz1RoQa+0xwfhqnl7tQOk44OlYcuB8O2hwbW2ISq8rSv/JUNL4rAiMFv80hd0/FhiqD
 qoJ6NHTUMKkAmNLi2YsxFlfYDs64SSsZzpBzgDbUarzBp8pULEacLVk/njunUDgR+lyx
 9CleshvD/V7Ds7uawB9pKXgEfT3syrenWQ1wO8SAfeM7REbInRxNJDkEPZT9TOShuWIk
 oolA==
X-Gm-Message-State: ANoB5plxCzzcjbNl2vSgMrmp/D09+tBFenZWKiu2xgk0Z5Ct7K5DMhNw
 vJI2LNx/1taTmGH38ClyBG4=
X-Google-Smtp-Source: AA0mqf6UyY6Ajir0dpjMTPEfUfkxUfg/cWB2Rcli0wUMRDnScEhS6yO4A+HDAZXUG33RUwCoF+riAQ==
X-Received: by 2002:a05:6402:4493:b0:46d:9471:8d9f with SMTP id
 er19-20020a056402449300b0046d94718d9fmr15211555edb.5.1670880531431; 
 Mon, 12 Dec 2022 13:28:51 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-188-068-187.77.188.pool.telefonica.de.
 [77.188.68.187]) by smtp.gmail.com with ESMTPSA id
 a19-20020a170906469300b007c0f217aadbsm3680680ejr.24.2022.12.12.13.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 13:28:51 -0800 (PST)
Date: Mon, 12 Dec 2022 20:11:39 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-8=2E0_1/7=5D_hw/mips/Kconfig=3A_Int?=
 =?US-ASCII?Q?roduce_CONFIG=5FGT64120_to_select_gt64xxx=5Fpci=2Ec?=
In-Reply-To: <fac75412-b6b0-558d-891f-1a6262da617e@linaro.org>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-2-philmd@linaro.org>
 <2C6A80F9-BAD4-43D6-8DFD-7D50E477CFFB@gmail.com>
 <fac75412-b6b0-558d-891f-1a6262da617e@linaro.org>
Message-ID: <4F55BECB-BB2A-4F64-A299-B4136506927D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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



Am 12=2E Dezember 2022 08:02:26 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>On 12/12/22 01:13, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 9=2E Dezember 2022 15:15:27 UTC schrieb "Philippe Mathieu-Daud=C3=A9=
" <philmd@linaro=2Eorg>:
>>> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat=2Ecom>
>>>=20
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat=2Ecom>
>>> ---
>>> hw/mips/Kconfig     | 6 ++++++
>>> hw/mips/meson=2Ebuild | 3 ++-
>>> 2 files changed, 8 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
>>> index 725525358d=2E=2Ed6bbbe7069 100644
>>> --- a/hw/mips/Kconfig
>>> +++ b/hw/mips/Kconfig
>>> @@ -1,5 +1,6 @@
>>> config MALTA
>>>      bool
>>> +    select GT64120
>>>      select ISA_SUPERIO
>>>=20
>>> config MIPSSIM
>>> @@ -59,3 +60,8 @@ config MIPS_BOSTON
>>>=20
>>> config FW_CFG_MIPS
>>>      bool
>>> +
>>> +config GT64120
>>> +    bool
>>> +    select PCI
>>> +    select I8259
>>=20
>> s/select I8259/depends on I8259/ since the model needs but doesn't prov=
ide I8259? Then just take my mail regarding the last patch as a reminder=2E
>
>I try to remember the 'depends on' directive as "depends on BUS"=2E
>If there is no BUS, then the option is pointless=2E Here "select PCI"
>means 'provide/expose a PCI bus on the machine'=2E
>
>I8259 must be available for GT64120 to be working=2E If you need a
>GT64120, its 'select' directive will select the minimum options
>required, so it will implicitly select a I8259=2E
>
>See docs/devel/kconfig=2Erst:
>
>**dependencies**: ``depends on <expr>``
>
>  This defines a dependency for this configurable element=2E Dependencies
>  evaluate an expression and force the value of the variable to false
>  if the expression is false=2E
>
>**reverse dependencies**: ``select <symbol> [if <expr>]``
>
>  While ``depends on`` can force a symbol to false, reverse dependencies
>  can be used to force another symbol to true=2E
>
>**devices**
>
>  Example::
>
>    config MEGASAS_SCSI_PCI
>      bool
>      default y if PCI_DEVICES
>      depends on PCI
>      select SCSI
>
>  Devices are the most complex of the five=2E  They can have a variety
>  of directives that cooperate so that a default configuration includes
>  all the devices that can be accessed from QEMU=2E
>
>  Devices *depend on* the bus that they lie on, for example a PCI
>  device would specify ``depends on PCI``=2E  An MMIO device will likely
>  have no ``depends on`` directive=2E

Yes, I agree that the patch follows this wording, so I should have given m=
y R-b regardless (fixed below)=2E

I was more contemplating aloud whether above wording could be interpretet =
as: I8259 is a device which provides an "interrupt bus" and GT64120 consume=
s that bus but doesn't provide I8259, hence "GT64120 depends on I8259"=2E

Of course, a classical PIC doesn't provide a bus in the usual sense while =
an APIC actually does, though this isn't modelled in QEMU that way=2E In a =
more abstract view one could see devices as providing and consuming communi=
cation channels (via PCI, MMIO, =2E=2E=2E), or even implementing and consum=
ing interfaces, in which case above conclusion might make more sense=2E Aft=
er all, it seems to me that today implementation details decide whether som=
ething should be "select" or "depends on"=2E

Anyway, this is getting off-topic - just some food for thought=2E Sorry fo=
r the noise=2E=2E=2E

>  Devices also *select* the buses
>  that the device provides, for example a SCSI adapter would specify
>  ``select SCSI``=2E  Finally, devices are usually ``default y`` if and
>  only if they have at least one ``depends on``; the default could be
>  conditional on a device group=2E
>
>> Otherwise:
>> Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

That should actually be:
Anyway,
Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

>
>Thanks!

