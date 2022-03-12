Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7F74D7135
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 22:56:39 +0100 (CET)
Received: from localhost ([::1]:41296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT9j3-0006lq-VD
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 16:56:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nT9iB-00062e-GL
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 16:55:43 -0500
Received: from [2a00:1450:4864:20::534] (port=41664
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nT9i9-0002n4-S9
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 16:55:43 -0500
Received: by mail-ed1-x534.google.com with SMTP id c20so15048924edr.8
 for <qemu-devel@nongnu.org>; Sat, 12 Mar 2022 13:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:in-reply-to:references:message-id:mime-version
 :content-transfer-encoding;
 bh=HPG4oh+zTxIr6OUOo88QsbxwEUjR8fhgfOa5FU4EAOw=;
 b=YBWQsbCvEC2rmzC/0y13XthqifyqvGsOE0zhH2y6YlwOZ91XM6v2+ib8jymFGPiybW
 HGWP/BU4a9s+w4aB2R9pn506zhJaWLqxTZ+bK0PwwGa7Yv8Ms6OObQaBAxKZ3sClncLW
 hKjkMhZk5ZWgUe911P0gJZZhQ/SQ0TLHCWEHeFo7ssfY6H+MCL5IyKrH9L0dVsWY4NN9
 YATq0fRGkwVBZc43SJs4+04ld5Qcp62u6051yZkhipFrYUQ9aUSvGl1+e0O4ajsNCT75
 RBlcELXV3OzKSeNWxVXr3NELBiqXPw8QYG2vaV/AcmJfbs/LBFdbIrvr0NnRmH2g9CSb
 5A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=HPG4oh+zTxIr6OUOo88QsbxwEUjR8fhgfOa5FU4EAOw=;
 b=xj6XC7RXVr0PFddB6lW5gUUgRoV3z2o7+KuyMURa2Q2YRIGU7LC+KA5LVs8mHTmsKl
 Raj3lhjO9t2B4nOZxTaKS3j7UL8e6DrYATOtAReEH8cairN6JVNWCIpydJkZX1wqBX8I
 LLmXQ7bR9x7983NRym7telHQ6OFlkHClma5+HnCSNqi8b+H/Zr02V475dBtwjg9EJdVN
 tcNqK+RExKbKwYCZA5hZlR+QD5frVl9YeRYEGio7aIfCuElDGduYG+TAVWhvq1r0g6IC
 f9s90+IDzB7UJDcloDE0Gnr24jr8G1bUOtuDYPEm6jg8t+8kZPc4PESv9HNhjClxVCh2
 qXEQ==
X-Gm-Message-State: AOAM5329NG7L+FFmdiRb1KvGWjydFoLQnap1MNxNhFHmgjlE2Sbpbq6y
 Uy5TJUAwDs4OUSLd0OdOMo4=
X-Google-Smtp-Source: ABdhPJx7De/6MQCaGie1SwWrgMMh3lkxwHDSDXUz6Jb58zZNO6PaCI964/Gd8rhhLRyqpTfS1AgOoA==
X-Received: by 2002:a05:6402:34ce:b0:417:7a71:c4b9 with SMTP id
 w14-20020a05640234ce00b004177a71c4b9mr7786067edc.329.1647122139330; 
 Sat, 12 Mar 2022 13:55:39 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-178-143.89.14.pool.telefonica.de.
 [89.14.178.143]) by smtp.gmail.com with ESMTPSA id
 gv9-20020a170906f10900b006d7128b2e6fsm4789510ejb.162.2022.03.12.13.55.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Mar 2022 13:55:38 -0800 (PST)
Date: Sat, 12 Mar 2022 21:54:46 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_0/7=5D_isa=3A_Resolve_unn?=
 =?US-ASCII?Q?eeded_IRQ_attributes_from_ISADevice?=
In-Reply-To: <43235477-83c2-1101-93df-25d52a9ac529@gmail.com>
References: <20220301220037.76555-1-shentey@gmail.com>
 <43235477-83c2-1101-93df-25d52a9ac529@gmail.com>
Message-ID: <E2FAC791-3706-401C-BD6C-AF9874B91DFA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 7=2E M=C3=A4rz 2022 00:34:27 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philippe=2Emathieu=2Edaude@gmail=2Ecom>:
>On 1/3/22 23:00, Bernhard Beschow wrote:
>
>> The IRQ attributes are mostly used for printing ('info qtree') and ther=
e is one
>> user, hw/ppc/pnv, to use the attributes directly=2E As it turns out, th=
e printing
>> is redundant if the IRQ numbers are exposed as QOM properties and hw/pp=
c/pnv
>> can be easily ported away=2E
>>=20
>> The patch series is structured as follows: Patch 1-3 QOM'ify the last d=
evices
>> which rely on printing their IRQ numbers via the ISADevice attributes=
=2E Patch
>> 4 and 5 remove the last users of the ISADevice attributes such that the=
y can be
>> removed in patch 6=2E The remainder of the patch series is cleanup=2E
>>=20
>> Patch 6 turns isa_init_irq() into a trivial wrapper for isa_get_irq()=
=2E That is,
>> the former function becomes redundant=2E All users are therefore conver=
ted to use
>> isa_get_irq() directly=2E Finally, the last patch removes the now unuse=
d
>> isa_init_irq()=2E
>>=20
>>=20
>> Bernhard Beschow (7):
>>    hw/rtc/mc146818rtc: QOM'ify IRQ number
>>    hw/rtc/m48t59-isa: QOM'ify IRQ number
>>    hw/input/pckbd: QOM'ify IRQ numbers
>>    hw/isa/isa-bus: Remove isabus_dev_print()
>>    hw/ppc/pnv: Determine ns16550's IRQ number from QOM property
>>    isa: Drop unused attributes from ISADevice
>>    isa: Inline and remove one-line isa_init_irq()
>>=20
>>   hw/audio/cs4231a=2Ec           |  2 +-
>>   hw/audio/gus=2Ec               |  2 +-
>>   hw/audio/sb16=2Ec              |  2 +-
>>   hw/block/fdc-isa=2Ec           |  2 +-
>>   hw/char/parallel=2Ec           |  2 +-
>>   hw/char/serial-isa=2Ec         |  2 +-
>>   hw/ide/isa=2Ec                 |  2 +-
>>   hw/input/pckbd=2Ec             | 26 +++++++++++++++++++++----
>>   hw/ipmi/isa_ipmi_bt=2Ec        |  2 +-
>>   hw/ipmi/isa_ipmi_kcs=2Ec       |  2 +-
>>   hw/isa/isa-bus=2Ec             | 37 +--------------------------------=
---
>>   hw/isa/piix4=2Ec               |  2 +-
>>   hw/net/ne2000-isa=2Ec          |  2 +-
>>   hw/ppc/pnv=2Ec                 |  5 ++++-
>>   hw/rtc/m48t59-isa=2Ec          |  9 ++++++++-
>>   hw/rtc/mc146818rtc=2Ec         | 13 +++++++++++--
>>   hw/tpm/tpm_tis_isa=2Ec         |  2 +-
>>   include/hw/isa/isa=2Eh         |  3 ---
>>   include/hw/rtc/mc146818rtc=2Eh |  1 +
>>   tests/qemu-iotests/172=2Eout   | 26 -------------------------
>>   20 files changed, 59 insertions(+), 85 deletions(-)
>>=20
>
>Please avoid posting 2 series going in different directions but touching
>the same files, and expect the same person to take them both and resolve
>resulting conflicts=2E Post one, then the second one based on the previou=
s
>one (and so on if multiple steps)=2E Anyway, for now I adapted this serie=
s
>on top of your "malta: Fix PCI IRQ levels" series and queued to mips=2E

Hi Phil,

I'm sorry to have caused you issues with my two patch series=2E In hindsig=
ht I should have communicated the merge conflict beforehand=2E I didn't bec=
ause I considered it a special case where two logically independent series =
happened to be created by the same person=2E Now I know that communicating =
it earlier had allowed us to find a solution beforehand=2E After all, I'm m=
ore than happy helping out to accellerate integration of my patches=2E

Anyway, thanks for having picked this up and also thanks a lot for your st=
eady stream of motivating review comments!

Best regards,
Bernhard

>
>Thanks,
>
>Phil=2E


