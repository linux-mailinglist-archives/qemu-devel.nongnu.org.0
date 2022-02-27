Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E07D4C5F18
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 22:35:21 +0100 (CET)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nORCI-0003Ne-VM
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 16:35:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nORB1-0002Wr-7f
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 16:33:59 -0500
Received: from [2a00:1450:4864:20::529] (port=40736
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nORAz-0005zm-96
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 16:33:58 -0500
Received: by mail-ed1-x529.google.com with SMTP id h15so14915888edv.7
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 13:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=nLy5rJ2WpE1oCu+f+2RtMw0Q9frZl570yr5+gEg/esI=;
 b=PlpEZBUAhVJvqx8kPruMuHnIJDlPDIO4Angmvg/D9O9EXx/TWbEYqwz/Z4EQiQ0llO
 H3vpwku4A03dKXEFBF0zME5myKEMPFsBhUNWi4Gjz8Y4rXVqsFu+Dv8Evaa95rfdDmW2
 Y1xoxKw8rNQ9uKtiAAxTMcBixIo4qiE58R/K3bst9AFEPeVmsmEJOw/MSNGfbm34NVTo
 1TTUUui1Zx71ZqIUpOQ90pKcd7jUKHOT8QKLSLWGNgnLlLqTlJhNAOvldjqiUpUFLVPb
 PCuDm9l5MkUj8yvPv8ahE7sukHyGU2WOKN70s/BiFMVXbLV6fKXRorZ5A+vchXTSifQz
 u2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=nLy5rJ2WpE1oCu+f+2RtMw0Q9frZl570yr5+gEg/esI=;
 b=uK2VAqRq+iKjaTAmR90lX5dAhw2P4Wx/S3TantXDV7Xg1Ifs6HDeDKuIR+7jCSjS+o
 XnQyImm7OGDxAVD6cIQZC4Iljkf5cqU996LVL4cp1hn9w4HtqzLPjgMJQkEp6IzPn2d5
 /fxHNBbf7VAEIvil0Bg/jwbspnjub9nqmzN4VNcAxVG4LYg2dMRfdvQgiGtx0L1mKlF+
 SAtUWtQqtekvaqTwszMZGVhzJ+I3aZSZJg80rvbZTYXrPBbcZCcDBIxZa7g1fPsXtMKn
 FA6MYlNa77FibCp8v0ysnBKWkaGexW/X0lqXVR5nqxDm3XXrwdqgHrXtcLHVEBsPXNUa
 LHJg==
X-Gm-Message-State: AOAM532Hz17RLpx33ksimfy7LF8aJsaVXl7LlajAEOCHVlrP50DW2YJB
 6AY+hTxfzTSVLRWYHe7+hpA=
X-Google-Smtp-Source: ABdhPJz8q9tmrveNbped8PIC+hk9vHrPk/MRnAnwV+q8LULTAG4fOzYDnL9ZK3hAEF2Kp2RqWHEBjQ==
X-Received: by 2002:aa7:c983:0:b0:410:d314:6451 with SMTP id
 c3-20020aa7c983000000b00410d3146451mr16268139edt.56.1645997635514; 
 Sun, 27 Feb 2022 13:33:55 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-134-204.77.191.pool.telefonica.de.
 [77.191.134.204]) by smtp.gmail.com with ESMTPSA id
 w11-20020a056402128b00b00412ec3f5f74sm5162098edv.62.2022.02.27.13.33.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Feb 2022 13:33:55 -0800 (PST)
Date: Sun, 27 Feb 2022 21:33:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Liav Albani <liavalb@gmail.com>, qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_3/4=5D_hw/acpi=3A_add_indication_fo?=
 =?US-ASCII?Q?r_i8042_in_IA-PC_boot_flags_of_the_FADT_table?=
In-Reply-To: <6e598f82-e68e-548d-7f72-ea7bcbca0e63@gmail.com>
References: <20220226063019.1112654-1-liavalb@gmail.com>
 <20220226063019.1112654-4-liavalb@gmail.com>
 <BE89AC1C-6ED9-4F1E-9DE6-EB1E2CC863E7@gmail.com>
 <6e598f82-e68e-548d-7f72-ea7bcbca0e63@gmail.com>
Message-ID: <A73557B9-3656-4143-984E-F074EFB8ADBD@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: ani@anisinha.ca, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27=2E Februar 2022 18:58:18 UTC schrieb Liav Albani <liavalb@gmail=2Ecom=
>:
>
>On 2/27/22 12:48, Bernhard Beschow wrote:
>> Am 26=2E Februar 2022 06:30:18 UTC schrieb Liav Albani <liavalb@gmail=
=2Ecom>:
>>> This can allow the guest OS to determine more easily if i8042 controll=
er
>>> is present in the system or not, so it doesn't need to do probing of t=
he
>>> controller, but just initialize it immediately, before enumerating the
>>> ACPI AML namespace=2E
>>>
>>> Signed-off-by: Liav Albani <liavalb@gmail=2Ecom>
>>> ---
>>> hw/acpi/aml-build=2Ec         | 7 ++++++-
>>> hw/i386/acpi-build=2Ec        | 8 ++++++++
>>> hw/i386/acpi-microvm=2Ec      | 9 +++++++++
>>> include/hw/acpi/acpi-defs=2Eh | 1 +
>>> 4 files changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/acpi/aml-build=2Ec b/hw/acpi/aml-build=2Ec
>>> index 8966e16320=2E=2Eef5f4cad87 100644
>>> --- a/hw/acpi/aml-build=2Ec
>>> +++ b/hw/acpi/aml-build=2Ec
>>> @@ -2152,7 +2152,12 @@ void build_fadt(GArray *tbl, BIOSLinker *linker=
, const AcpiFadtData *f,
>>>      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
>>>      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
>>>      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
>>> -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
>>> +    /* IAPC_BOOT_ARCH */
>>> +    if (f->rev =3D=3D 1) {
>>> +        build_append_int_noprefix(tbl, 0, 2);
>>> +    } else {
>>> +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
>>> +    }
>>>      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
>>>      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
>>>
>>> diff --git a/hw/i386/acpi-build=2Ec b/hw/i386/acpi-build=2Ec
>>> index ebd47aa26f=2E=2E65dbc1ec36 100644
>>> --- a/hw/i386/acpi-build=2Ec
>>> +++ b/hw/i386/acpi-build=2Ec
>>> @@ -192,6 +192,14 @@ static void init_common_fadt_data(MachineState *m=
s, Object *o,
>>>              =2Eaddress =3D object_property_get_uint(o, ACPI_PM_PROP_G=
PE0_BLK, NULL)
>>>          },
>>>      };
>>> +    /*
>>> +     * second bit of 16 but IAPC_BOOT_ARCH indicates presence of 8042=
 or
>>> +     * equivalent micro controller=2E See table 5-10 of APCI spec ver=
sion 2=2E0
>>> +     * (the earliest acpi revision that supports this)=2E
>>> +     */
>>> +
>>> +    fadt=2Eiapc_boot_arch =3D isa_check_device_existence("i8042") ? 0=
x0002 : 0x0000;
>> Couldn't qdev_find_recursive() be used here instead? This would also ma=
ke patch 1 unneccessary=2E Same below=2E
>>
>> Best regards
>> Bernhard
>
>I tried it first, but because it tries to find the ID of a device=20
>instead of a type (I look for i8042 type which is a string of the device=
=20
>type), it didn't work as expected=2E We don't compare DeviceState id, but=
=20
>ObjectClass type->name here :)

I see=2E What about object_resolve_path_type()? It takes a typename parame=
ter=2E It even tells you if the match is ambiguous if you care=2E

Best regards,
Bernhard

>
>With my patch we could just find the device without any problem whatsoeve=
r=2E
>
>Best regards,
>Liav
>


