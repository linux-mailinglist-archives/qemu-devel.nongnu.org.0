Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCB465B694
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 19:27:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCPVT-0006CF-Uv; Mon, 02 Jan 2023 13:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pCPVQ-0006Ba-Pj; Mon, 02 Jan 2023 13:25:52 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pCPVO-0002zp-Pt; Mon, 02 Jan 2023 13:25:52 -0500
Received: by mail-ed1-x535.google.com with SMTP id i9so40837318edj.4;
 Mon, 02 Jan 2023 10:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=foctS36WMCcVD11exyCP7CnrLZjn9b3dqLSlWZ0EImw=;
 b=Z/wg8f+u38X4y43+SeUy8gz/ASV7LdOFYM+qiCxvm6fHaLUK25ntVKiQpLzmsxJ5Uk
 QLhRRcuCKWAxlxsmkOi85M7yd7CEegXCU0jVohaLq8dfHSSVt5L+UaVRJYyYbWeWqcZm
 SmAYmIpdYKzR7GaeGL2W4yHoqMc8SXRFYsdhUVV6fw9dh33BgTdiEmz1ekWrLOYUnXoF
 RDI8POZdD6Fd1fN2nBaW/ad5x35OnjQGd4mw0YuMrhy05Q/kxqq6uY0Z08aOaCJ/IYBC
 RnlqarmSESzYxoav04dfLu5MLtNuaQXraJkOySs9MpUTAqxBrXTXd25GHuTpnfvkZMav
 sI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=foctS36WMCcVD11exyCP7CnrLZjn9b3dqLSlWZ0EImw=;
 b=u8BF++OqVrdh47W7qfIvudkXKAAfqCIkimhs98P3Vq4RGJrTdenAA8sJi6JmB8oXM0
 rNO3Dill9in4gHQTIxeAG0WJw6vlEDko+vlNhOfS6JiZYKbDRkecpzP0asGh6Zwgi9cy
 3SBx7ag5YChX9DeBKvFxTsZZTjUhL/CoPfdsMWiurEE8UdpXV4k/PJA6k5dFQRJSuRaT
 fUziMJ+QmGydFzLSXZFWFDJnuYQS8dem1H1+xV2veqYD4L4CEgaBrGZ/C2IXeIYd8x2d
 jjEfKgtLRgbd68Z2SvgU0616G7caDFPZD4uU7KfmxIwAkBtET/Rm6KlDw7c2EZF6KcSi
 /Sxw==
X-Gm-Message-State: AFqh2krkQg61/I9tpwqSre0dZ9j0r7dIespfjA5ILiNtdpWVoJwW9BZZ
 y+KqgUgGAVhgJeToaKgkjsg=
X-Google-Smtp-Source: AMrXdXsrdQUl5ZKwqGAkeJL6W5pHvV13Pv8/69kYbmBv4T+98Hb4nYimIHiS72zYJ82EpRMLHO/EJQ==
X-Received: by 2002:a05:6402:538c:b0:472:f7c1:361 with SMTP id
 ew12-20020a056402538c00b00472f7c10361mr36506635edb.29.1672683947175; 
 Mon, 02 Jan 2023 10:25:47 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200a865bea1ed05d55a.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:a865:bea1:ed05:d55a])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a05640203d200b00463597d2c25sm12914403edw.74.2023.01.02.10.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 10:25:46 -0800 (PST)
Date: Mon, 02 Jan 2023 18:25:37 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_08/30=5D_hw/i386/pc=3A_Cre?=
 =?US-ASCII?Q?ate_RTC_controllers_in_south_bridges?=
In-Reply-To: <4ab5e721-6a05-1f91-64f0-f4e80ca3957d@redhat.com>
References: <20221221170003.2929-1-shentey@gmail.com>
 <20221221170003.2929-9-shentey@gmail.com>
 <4ab5e721-6a05-1f91-64f0-f4e80ca3957d@redhat.com>
Message-ID: <F1BB255D-4720-4175-8DAA-B2F7CE546FE5@gmail.com>
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



Am 2=2E Januar 2023 17:03:29 UTC schrieb Thomas Huth <thuth@redhat=2Ecom>:
>On 21/12/2022 17=2E59, Bernhard Beschow wrote:
>> Just like in the real hardware (and in PIIX4), create the RTC
>> controllers in the south bridges=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>> Message-Id: <20221022150508=2E26830-11-shentey@gmail=2Ecom>
>> ---
>>   hw/i386/pc=2Ec                  | 12 +++++++++++-
>>   hw/i386/pc_piix=2Ec             |  8 ++++++++
>>   hw/i386/pc_q35=2Ec              |  1 +
>>   hw/isa/Kconfig                |  2 ++
>>   hw/isa/lpc_ich9=2Ec             |  8 ++++++++
>>   hw/isa/piix3=2Ec                | 15 +++++++++++++++
>>   include/hw/i386/ich9=2Eh        |  2 ++
>>   include/hw/southbridge/piix=2Eh |  3 +++
>>   8 files changed, 50 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>> index fa69b6f43e=2E=2Ed154eedcb3 100644
>> --- a/hw/i386/pc=2Ec
>> +++ b/hw/i386/pc=2Ec
>> @@ -1299,7 +1299,17 @@ void pc_basic_device_init(struct PCMachineState =
*pcms,
>>           pit_alt_irq =3D qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
>>           rtc_irq =3D qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
>>       }
>> -    *rtc_state =3D mc146818_rtc_init(isa_bus, 2000, rtc_irq);
>> +
>> +    if (rtc_irq) {
>> +        qdev_connect_gpio_out(DEVICE(*rtc_state), 0, rtc_irq);
>> +    } else {
>> +        uint32_t irq =3D object_property_get_uint(OBJECT(*rtc_state),
>> +                                                "irq",
>> +                                                &error_fatal);
>> +        isa_connect_gpio_out(*rtc_state, 0, irq);
>> +    }
>> +    object_property_add_alias(OBJECT(pcms), "rtc-time", OBJECT(*rtc_st=
ate),
>> +                              "date");
>I think you could turn now the "ISADevice **rtc_state" parameter of this =
function into a normal "ISADevice *rtc_state" since the pointer is not a re=
turn value anymore=2E

This is done in patch 9/30: https://lists=2Egnu=2Eorg/archive/html/qemu-de=
vel/2022-12/msg03799=2Ehtml

Best regards,
Bernhard

>
> Thomas
>

