Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EA60DE65
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:48:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oncyj-0005Tm-DZ; Wed, 26 Oct 2022 05:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oncyd-0004C3-S9; Wed, 26 Oct 2022 05:45:37 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oncyc-0000bP-3A; Wed, 26 Oct 2022 05:45:35 -0400
Received: by mail-ej1-x62a.google.com with SMTP id kt23so14150241ejc.7;
 Wed, 26 Oct 2022 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eIvLrtaL16TNuysBnsiGUqFyLE8nKwwRmVNlgg40430=;
 b=RtGhmeZt56C0+HUDZUurOF7Y7bNBj0BAkEt7G8qOZDj+l9I4tKPs+CibvSR4mB1NZt
 2VqTlbN1maZNR/eZf/8r7ibDj5kyExZuHZU5JU4iNc55Vm8fdiXFbjP8iJREOl647yl5
 484ez1/Rc0FZJwQl4pXylW6Z7q2QFKpDd9XODu31iLDHJHliaCGFkJQTG8qhANcGWByg
 gM6sN/pE2vxMLgC8TQRBfyPP6TJOCqPDb4sdkYXNGV2hbA8CmT2hLsABrzUjG/CFUeJ7
 s2v8Dqa3HX3REJVpfmgSURP5fyK10I9FBztP+KjEndjj/Frck02/wkenM7JoxUXUgAVb
 cLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eIvLrtaL16TNuysBnsiGUqFyLE8nKwwRmVNlgg40430=;
 b=awJhZlFvS/Ayk2x9AcInGyf1RK9+NRL98hSy5Egimjt7w/Fk+J/JTWQ62rPHZKM4Lm
 DIK7Hg5g7mM4dDImXYOG7eFAUZI61E6IfWyEv3U0icQEwPkYyp41FsWj0Om1MCW6uMYP
 BZfXPNsdqoaZNhfImtpZ1SRHIIUQ5ERbNx1eAJtNXf0R/u0CvNb0pskT8y842Q10CWL1
 JM+D08cRvkLWpy7hoLvOh9jbBzZ77QuT8SFc+S73WTh/wSlOBby2deRHjTuMDPH1tArr
 DRnMkr6OM07ObJkfOpVRjPhYhtsrzVYThPlQG0x1/EoD9SP2QYyGakJMAPwcuQO3UN0k
 0uIw==
X-Gm-Message-State: ACrzQf3vXaUHuiz04hor3AdU1Id5Y5HBuWtCgsah6KdMCvEKBPM6Bc0o
 7y1d4mF9cOBPxUQFNxzXgL8=
X-Google-Smtp-Source: AMsMyM5qe35StTwdq+gvQPXZopzvMudeejOFWpjkvWEpHuSjM0IxS02xxD8aPd3HOMYgZeQpT4EWYQ==
X-Received: by 2002:a17:907:7d90:b0:78d:bc5a:913c with SMTP id
 oz16-20020a1709077d9000b0078dbc5a913cmr35963838ejc.390.1666777531290; 
 Wed, 26 Oct 2022 02:45:31 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb20095e0bdce03702654.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:95e0:bdce:370:2654])
 by smtp.gmail.com with ESMTPSA id
 h1-20020aa7cdc1000000b0046182b3ad46sm3190832edw.20.2022.10.26.02.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 02:45:30 -0700 (PDT)
Date: Wed, 26 Oct 2022 09:45:26 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_19/43=5D_hw/isa/piix3=3A_Allo?=
 =?US-ASCII?Q?w_board_to_provide_PCI_interrupt_routes?=
In-Reply-To: <eeeac077-2e9b-20db-9bb1-692c663f9695@linaro.org>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-20-shentey@gmail.com>
 <eeeac077-2e9b-20db-9bb1-692c663f9695@linaro.org>
Message-ID: <F445CE4A-219B-4639-B345-2B9ECF291CE8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Phil,

Am 25=2E Oktober 2022 23:34:15 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>On 22/10/22 17:04, Bernhard Beschow wrote:
>> PIIX3 initializes the PIRQx route control registers to the default
>> values as described in the 82371AB PCI-TO-ISA/IDE XCELERATOR (PIIX4)
>> April 1997 manual=2E PIIX4, however, initializes the routes according t=
o
>> the Malta=E2=84=A2 User=E2=80=99s Manual, ch 6=2E6, which are IRQs 10 a=
nd 11=2E In order to
>> allow the reset methods to be consolidated, allow board code to specify
>> the routes=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/isa/piix3=2Ec                | 12 ++++++++----
>>   include/hw/southbridge/piix=2Eh |  1 +
>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/hw/isa/piix3=2Ec b/hw/isa/piix3=2Ec
>> index aa32f43e4a=2E=2Ec6a8f1f27d 100644
>> --- a/hw/isa/piix3=2Ec
>> +++ b/hw/isa/piix3=2Ec
>> @@ -168,10 +168,10 @@ static void piix3_reset(DeviceState *dev)
>>       pci_conf[0x4c] =3D 0x4d;
>>       pci_conf[0x4e] =3D 0x03;
>>       pci_conf[0x4f] =3D 0x00;
>> -    pci_conf[0x60] =3D 0x80;
>> -    pci_conf[0x61] =3D 0x80;
>> -    pci_conf[0x62] =3D 0x80;
>> -    pci_conf[0x63] =3D 0x80;
>
>These values are the correct reset ones however (also for PIIX4)=2E
>
>The problem is the Malta machine abuse of the PIIX4 model=2E IOW
>this doesn't seem the correct approach, we should fix how Malta
>use the PIIX4 (in the emulated tiny boot loader)=2E I'll try to
>write smth before reviewing the rest of this series, because
>it might simplify your refactor=2E

Indeed my first approach for the refactor was to implement MachineClass::r=
eset for Malta where the Malta-specific values would be set=2E I could redo=
 that if you want=2E Just let me know=2E

Best regards,
Bernhard
>
>> +    pci_conf[PIIX_PIRQCA] =3D d->pci_irq_reset_mappings[0];
>> +    pci_conf[PIIX_PIRQCB] =3D d->pci_irq_reset_mappings[1];
>> +    pci_conf[PIIX_PIRQCC] =3D d->pci_irq_reset_mappings[2];
>> +    pci_conf[PIIX_PIRQCD] =3D d->pci_irq_reset_mappings[3];
>>       pci_conf[0x69] =3D 0x02;
>>       pci_conf[0x70] =3D 0x80;
>>       pci_conf[0x76] =3D 0x0c;
>> @@ -383,6 +383,10 @@ static void pci_piix3_init(Object *obj)
>>     static Property pci_piix3_props[] =3D {
>>       DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
>> +    DEFINE_PROP_UINT8("pirqa", PIIX3State, pci_irq_reset_mappings[0], =
0x80),
>> +    DEFINE_PROP_UINT8("pirqb", PIIX3State, pci_irq_reset_mappings[1], =
0x80),
>> +    DEFINE_PROP_UINT8("pirqc", PIIX3State, pci_irq_reset_mappings[2], =
0x80),
>> +    DEFINE_PROP_UINT8("pirqd", PIIX3State, pci_irq_reset_mappings[3], =
0x80),
>>       DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
>>       DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
>>       DEFINE_PROP_BOOL("smm-enabled", PIIX3State, smm_enabled, false),
>> diff --git a/include/hw/southbridge/piix=2Eh b/include/hw/southbridge/p=
iix=2Eh
>> index 1f22eb1444=2E=2Edf3e0084c5 100644
>> --- a/include/hw/southbridge/piix=2Eh
>> +++ b/include/hw/southbridge/piix=2Eh
>> @@ -54,6 +54,7 @@ struct PIIXState {
>>         /* This member isn't used=2E Just for save/load compatibility *=
/
>>       int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
>> +    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
>>         ISAPICState pic;
>>       RTCState rtc;
>


