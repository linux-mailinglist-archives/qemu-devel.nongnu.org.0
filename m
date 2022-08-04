Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B162058A2C4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 23:35:20 +0200 (CEST)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJiUx-0007kD-AE
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 17:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oJiSj-0006DJ-Vz
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 17:33:06 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oJiSi-00058h-BA
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 17:33:01 -0400
Received: by mail-ed1-x535.google.com with SMTP id z22so1232454edd.6
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 14:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=ctvKAjztAAinxR1CP9zAzJsw524A5yONe2RPgtONgb8=;
 b=FBfrrnI2udpbKnFF2hiUGZFST9MKQG/SX9FJn/8wDyHpKNjLzSJKNVOjCx82qOf4oh
 RVy6wbP+KYymwfoSFuQ7gOZKkmuZw42tO/oTIuTCzlwNToUHNdCUmoRIt3kma3xESXJS
 YmgEgp04gpJFfkhivrFzS7Dy7fiPltIC2FzVNmE78TmErvULBdW7PCJnn2CdtDixGppa
 TG4SXAjX0BEBxZBDkYYGy4nUpqLxh1po6oDSEs/eACYEzNEYl723blnAE2yXySUWma+Q
 fxHhGgp8Jj661zAPnegCr4xsKrGarILyQMecxVLo/oOK6HIIhNYcH0cmHYFelzIgGOtU
 wO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=ctvKAjztAAinxR1CP9zAzJsw524A5yONe2RPgtONgb8=;
 b=59EuXpIlwtMKB/7/7pzLiVzF3oZNveBO6jh08+TKNbJBmJTwB0WnAJvhLqCav/2kSJ
 nncAm9XUOlrFI1Y+QbE5bgCVPPoX4v3vCQcpr/evaxWICEJ/5nYalb8ImJ9ez40PAByB
 NcbeutmSgZ/bO59kfjJpUwk8xqaV+tg214YDrokA9dyx8/ePPZAfrfra8UctX/4VJRt/
 y/hn1C5GhgeNXl7SYY69TQIo2FPCGj4yPNPsTg6fy0Def3WElBw0bbNQDXanEihsj2YJ
 I2unANEhV3qvRc/W6DqlEaoomlxSUyjz+2pghILup/6m8HUBA0YmOI1ogSr/IsUZl5zX
 3peA==
X-Gm-Message-State: ACgBeo0m/w3EU0uIYh6fKzEPPlnj7dKa3dDiPTSuUs3IxWmojrI9nv3+
 7Wpe5MFhWSyMOyw/0aliKuY=
X-Google-Smtp-Source: AA6agR5t52+QB5KbBHDp7y+bNMRoNOlc+sIHpwUrrvcrjaHw0V7paPbzU9NXMPkMJvBVvVTjqrzitQ==
X-Received: by 2002:aa7:d053:0:b0:43d:b75:fd96 with SMTP id
 n19-20020aa7d053000000b0043d0b75fd96mr3840556edo.12.1659648777788; 
 Thu, 04 Aug 2022 14:32:57 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-152-133.77.11.pool.telefonica.de.
 [77.11.152.133]) by smtp.gmail.com with ESMTPSA id
 u3-20020aa7db83000000b0043a7293a03dsm1173261edt.7.2022.08.04.14.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 14:32:57 -0700 (PDT)
Date: Thu, 04 Aug 2022 23:32:45 +0200
From: BB <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Ani Sinha <ani@anisinha.ca>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_for-7=2E1=5D_hw/mips/malta=3A_tur?=
 =?US-ASCII?Q?n_off_x86_specific_features_of_PIIX4=5FPM?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFEAcA8Lp8djo3byv3HsU1rOGZBkGRFezAYH-WpMenX9otW6Ww@mail.gmail.com>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
 <20220728151627.119d57d5@redhat.com>
 <769cfc18-9585-5ddf-de46-52aa64328cea@amsat.org>
 <CAG4p6K53y=Oe9vynXgGYTZ9CfHewsDeE3mFDkEb-_us7rgaBcg@mail.gmail.com>
 <CAFEAcA8Lp8djo3byv3HsU1rOGZBkGRFezAYH-WpMenX9otW6Ww@mail.gmail.com>
Message-ID: <64366D4F-C910-4258-AABB-0AB14C99749B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 3=2E August 2022 20:00:18 MESZ schrieb Peter Maydell <peter=2Emaydell@l=
inaro=2Eorg>:
>On Wed, 3 Aug 2022 at 18:26, Bernhard Beschow <shentey@gmail=2Ecom> wrote=
:
>>
>> On Tue, Aug 2, 2022 at 8:37 AM Philippe Mathieu-Daud=C3=A9 via <qemu-de=
vel@nongnu=2Eorg> wrote:
>>>
>>> On 28/7/22 15:16, Igor Mammedov wrote:
>>> > On Thu, 28 Jul 2022 13:29:07 +0100
>>> > Peter Maydell <peter=2Emaydell@linaro=2Eorg> wrote:
>>> >
>>> >> On Thu, 28 Jul 2022 at 12:50, Igor Mammedov <imammedo@redhat=2Ecom>=
 wrote:
>>> >>> Disable compiled out features using compat properties as the least
>>> >>> risky way to deal with issue=2E
>>>
>>> So now MIPS is forced to use meaningless compat[] to satisfy X86=2E
>>>
>>> Am I wrong seeing this as a dirty hack creeping in, yet another
>>> technical debt that will hit (me=2E=2E=2E) back in a close future?
>>>
>>> Are we sure there are no better solution (probably more time consuming
>>> and involving refactors) we could do instead?
>>
>>
>> Working on the consolidation of piix3 and -4 soutbridges [1] I've stumb=
led over certain design decisions where board/platform specific assumptions=
 are baked into the piix device models=2E I figure that's the core of the i=
ssue=2E
>>
>> In our case the ACPI functionality is implemented by inheritance while =
perhaps it should be implemented using composition=2E With composition, the=
 ACPI functionality could be injected by the caller: The pc board would inj=
ect it while the Malta board wouldn't=2E This would solve both the crash an=
d above design problem=2E
>>
>> I'd be willing to implement it but can't make any promises about the ti=
me frame since I'm currently doing this in my free time=2E Any hints regard=
ing the implementation would be welcome, though=2E
>
>
>For the 7=2E1 release (coming up real soon now) can we get consensus
>on this patch from Igor as the least risky way to at least fix
>the segfault ? We can look at better approaches for 7=2E2=2E

Hi,

My proposal isn't 7=2E1 material=2E I merily intended to start a design di=
scussion how to proceed after 7=2E1 that would make Phil's maintainer life =
easier and provide further insights for my consolidation work=2E

I don't feel qualified enough to judge the impact of Igor's patch, so I'd =
leave that for the competent=2E

Best regards,
Bernhard

>
>thanks
>-- PMM

