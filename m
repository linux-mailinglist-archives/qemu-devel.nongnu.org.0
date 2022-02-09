Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBF74B0123
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:22:02 +0100 (CET)
Received: from localhost ([::1]:57838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHwHh-0000jq-PH
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:22:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nHwCb-00044l-Ff
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:16:46 -0500
Received: from [2a00:1450:4864:20::52b] (port=33506
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nHwCZ-0000zk-AR
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:16:44 -0500
Received: by mail-ed1-x52b.google.com with SMTP id b13so8180339edn.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=WhpG7YlLa3O3+WuIPyPW31+jWsbpD5DN6k6/uoAurWo=;
 b=k0GgihIwJ/h9Gfibyzz06T+S/xTDTB+Mc8BdxDUVTmn++7gmDONvs1YwjziQf5auhu
 ouedmxFGgjgJfC+1wg7M2MUPBdx72Wi9lXepEf6biy3JNoqVNU6PA11FDijpI9D3ixhl
 04PS0m5oFq69L30mqqrxTRc0Ze+Y9i2jNfEKs9cowICKbktoMVCTM2qa97g/Nnz7cPiN
 XW7Tafx+bwCG3YYsq90jTkij8lHcufZFHTCArLLy0aEkSm6URZKnsOeYl582rEPum/nW
 gD3fneDJ93iIgG+vXKJRt0ctUFAG53W9Fp9fnwllnHBbNMAGD5nwacjF4uJVt2oWot3F
 SfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=WhpG7YlLa3O3+WuIPyPW31+jWsbpD5DN6k6/uoAurWo=;
 b=dk0Rq6OQRZmyaFdLaWVAEK50OqC30L/i2u7zIciNjH1+k1iL9sX3dM3n3HlVKTSySn
 fA+b2IQH+2x8BaanH44OER9cDnK+Zh2YWfa0UTWSm6q+LXgTSJgVJ8w7qJMIYs1xPtvo
 A7QzxDcDnc24W0CcGqXfe94SExp/u6I986838qVjLhHxru/JdY5X6An69Gwjck57aeuV
 9/qHjp67TAfP+kS82n7G4pqdb1mQ37GAPK7R/8Q5MYODE+7wZOpH0GB724j4kz71dFo6
 F7pla3EMpr8mVBbkV3cbH++TnKG/KeCS44p5VYMnOIOLPGA8t70QDIoVRw1wCrFA6arw
 8UbA==
X-Gm-Message-State: AOAM533JXMhmqH6rr04czV2raIm7amy4m29zPLhe8nLA3q7fjrz9tClE
 P66tQXGnMqFgNCcZaKdM7vc=
X-Google-Smtp-Source: ABdhPJwLuXJ54OxueiPy7+lpLnxmRwg1ErYnOzpvgFN8acv0vlqmbH3vN8qux1SX5WJrVMt2eYoECg==
X-Received: by 2002:aa7:d898:: with SMTP id u24mr5288482edq.60.1644448596620; 
 Wed, 09 Feb 2022 15:16:36 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-173-215.77.183.pool.telefonica.de.
 [77.183.173.215])
 by smtp.gmail.com with ESMTPSA id i18sm2903990ejy.190.2022.02.09.15.16.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Feb 2022 15:16:36 -0800 (PST)
Date: Thu, 10 Feb 2022 00:16:34 +0100
From: BB <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/3] isa/piix4: Resolve global variables
User-Agent: K-9 Mail for Android
In-Reply-To: <b21fefc6-a7f6-c101-5f1f-99cd3191933b@amsat.org>
References: <20220112213629.9126-1-shentey@gmail.com>
 <20220112213629.9126-4-shentey@gmail.com>
 <CAFEAcA_HE6UCaeyM7+5n0O+hFKLGk=Sc6Mpr_VBD_RJR=WJg=w@mail.gmail.com>
 <b21fefc6-a7f6-c101-5f1f-99cd3191933b@amsat.org>
Message-ID: <3DD424F7-FC1C-471E-A5E5-1E06783D7254@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 30=2E Januar 2022 23:53:42 MEZ schrieb "Philippe Mathieu-Daud=C3=A9" <f4=
bug@amsat=2Eorg>:
>On 14/1/22 14:36, Peter Maydell wrote:
>> On Wed, 12 Jan 2022 at 22:02, Bernhard Beschow <shentey@gmail=2Ecom> wr=
ote:
>>>
>>> Now that piix4_set_irq's opaque parameter references own PIIX4State,
>>> piix4_dev becomes redundant and pci_irq_levels can be moved into PIIX4=
State=2E
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> ---
>>>   hw/isa/piix4=2Ec                | 22 +++++++++-------------
>>>   include/hw/southbridge/piix=2Eh |  2 --
>>>   2 files changed, 9 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>>> index a31e9714cf=2E=2E964e09cf7f 100644
>>> --- a/hw/isa/piix4=2Ec
>>> +++ b/hw/isa/piix4=2Ec
>>> @@ -39,14 +39,14 @@
>>>   #include "sysemu/runstate=2Eh"
>>>   #include "qom/object=2Eh"
>>>
>>> -PCIDevice *piix4_dev;
>>> -
>>>   struct PIIX4State {
>>>       PCIDevice dev;
>>>       qemu_irq cpu_intr;
>>>       qemu_irq *isa;
>>>       qemu_irq i8259[ISA_NUM_IRQS];
>>>
>>> +    int pci_irq_levels[PIIX_NUM_PIRQS];
>>> +
>>=20
>> I wondered how we were migrating this state, and the answer
>> seems to be that we aren't (and weren't before, when it was
>> a global variable, so this is a pre-existing bug)=2E
>
>Indeed the migrated VM starts with PCI IRQ levels zeroed=2E
>
>> Does the malta platform support migration save/load?
>
>Maybe a "best effort" support, but not versioned machines=2E
>
>> We should probably add this field to the vmstate struct
>> (which will be a migration compatibility break, which is OK
>> as the malta board isn't versioned=2E)
>
>Yeah good catch=2E
>
>Bernhard, do you mind adding it?

Sure, I'll give it a try=2E Shall I submit a v2 of this patch series then?=
 If so, would it be ok to change the topic of the cover letter or would tha=
t be confusing?

Last but not least: How to treat the version_id and the version parameters=
 of the new and existing fields?

Regards,

Bernhard=2E


