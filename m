Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E62B4F307D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 14:30:16 +0200 (CEST)
Received: from localhost ([::1]:60720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbiK7-0007UK-Fd
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 08:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nbiHo-0006Km-Lz; Tue, 05 Apr 2022 08:27:52 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nbiHm-0005fx-V4; Tue, 05 Apr 2022 08:27:52 -0400
Received: by mail-ej1-x631.google.com with SMTP id dr20so26214750ejc.6;
 Tue, 05 Apr 2022 05:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=9JVZ1K4aTiqwd4BpCYlSErVmpIsy/Cxe5HPltNDOqbA=;
 b=d5rCjuGUq/HP5AkS1v/Da+XujHKb62ca05SoUGOasiOHlnw7BJk2u6ia7tKRHiySei
 AxLv5RA8ggu8w/383pHOJxn4HEMr9EKW9E239CKsu/k5InKyvwstEhL/29ICAcv1KIen
 QYTOkXtB6GyrkcFTKGWAgSqhY98Gk2UKCcWghd3OweigeqBxEcXn73IRAt2+P9rS+Hes
 UNXFbp44kA4POgIHcn0PYMvMVvBljgmo70nN6keS09r4GWc1Gvm/9FUUsfs2TVxzr14/
 qKpTA4CNhORPP9clneA5m/eUYFV7x3yGJV+7gDFeSF6AIvvo4OlvSClT0RJf3HGT7AOp
 ouUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=9JVZ1K4aTiqwd4BpCYlSErVmpIsy/Cxe5HPltNDOqbA=;
 b=aSj6HRd6CBuNOuHXnTwPIHnOfw7mz08a4I0Bh2IY7aYC7CwWSpC5924E8afo4MiHvk
 F6uNHDZUanaTxZuRr4Gd57aJFz+aiujfeLr4bLvxKSbGzdqJ8K9jtsKLnNn1MvbodfGi
 g+JHtYLIoWionzHZzZux7rNDY/bR94VXuFVOQx8dxxjXguhgD/WhYXUf6Xf3N+h7RXyL
 AlQYpqDCdTkWTqrki+SADcMAfgVssNjAyBZsEYRngetC4oXHaPaVl3BOkAqUgzYX/3HB
 +ErNKe+Mp1bUI4kOuvlts02l54dIJB0u9dXwMH4p5/LibZAVu/Cb3RXBXSuPykbC+W58
 k5Bg==
X-Gm-Message-State: AOAM531gVkLh7+5+Dxuy6AzFIxyfaFXxMhqNVgPirZqDkGHWIkC/8ucE
 odSEVFdQgBL/nqgH3drMMDA=
X-Google-Smtp-Source: ABdhPJyzFG34RCDXd0g+kszD/Rqjp4aniyz9+06nljgaMOtGnNzujafCcU82Ym+DSwhm9yO/7j0TGQ==
X-Received: by 2002:a17:907:6296:b0:6da:64ee:1031 with SMTP id
 nd22-20020a170907629600b006da64ee1031mr3350788ejc.601.1649161668536; 
 Tue, 05 Apr 2022 05:27:48 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-166-174.77.13.pool.telefonica.de.
 [77.13.166.174]) by smtp.gmail.com with ESMTPSA id
 y17-20020a056402359100b0041926ea1e12sm6780713edc.53.2022.04.05.05.27.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Apr 2022 05:27:48 -0700 (PDT)
Date: Tue, 05 Apr 2022 12:27:46 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH] hw/ppc/ppc405_boards: Initialize g_autofree pointer
In-Reply-To: <CAFEAcA-uyzmOk87QDwUGW8iFKiB7V0zp-8OUhL88aWkdQUROfw@mail.gmail.com>
References: <20220405112838.15360-1-shentey@gmail.com>
 <CAFEAcA-uyzmOk87QDwUGW8iFKiB7V0zp-8OUhL88aWkdQUROfw@mail.gmail.com>
Message-ID: <551E289F-D2D6-4AAC-8D93-0D99E2FC6F86@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: qemu-trivial@nongnu.org,
 "open list:405 ref405ep and..." <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 5=2E April 2022 12:00:19 UTC schrieb Peter Maydell <peter=2Emaydell@lina=
ro=2Eorg>:
>On Tue, 5 Apr 2022 at 12:32, Bernhard Beschow <shentey@gmail=2Ecom> wrote=
:
>>
>> Resolves the only compiler warning when building a full QEMU under Arch=
 Linux:
>>
>>   Compiling C object libqemu-ppc-softmmu=2Efa=2Ep/hw_ppc_ppc405_boards=
=2Ec=2Eo
>>   In file included from /usr/include/glib-2=2E0/glib=2Eh:114,
>>                    from qemu/include/glib-compat=2Eh:32,
>>                    from qemu/include/qemu/osdep=2Eh:132,
>>                    from =2E=2E/src/hw/ppc/ppc405_boards=2Ec:25:
>>   =2E=2E/src/hw/ppc/ppc405_boards=2Ec: In function =E2=80=98ref405ep_in=
it=E2=80=99:
>>   /usr/include/glib-2=2E0/glib/glib-autocleanups=2Eh:28:3: warning: =E2=
=80=98filename=E2=80=99 may be used uninitialized in this function [-Wmaybe=
-uninitialized]
>>      28 |   g_free (*pp);
>>         |   ^~~~~~~~~~~~
>>   =2E=2E/src/hw/ppc/ppc405_boards=2Ec:265:26: note: =E2=80=98filename=
=E2=80=99 was declared here
>>     265 |         g_autofree char *filename;
>>         |                          ^~~~~~~~
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/ppc/ppc405_boards=2Ec | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/ppc405_boards=2Ec b/hw/ppc/ppc405_boards=2Ec
>> index 7e1a4ac955=2E=2E326353ea25 100644
>> --- a/hw/ppc/ppc405_boards=2Ec
>> +++ b/hw/ppc/ppc405_boards=2Ec
>> @@ -262,7 +262,7 @@ static void ref405ep_init(MachineState *machine)
>>      /* allocate and load BIOS */
>>      if (machine->firmware) {
>>          MemoryRegion *bios =3D g_new(MemoryRegion, 1);
>> -        g_autofree char *filename;
>> +        g_autofree char *filename =3D NULL;
>>          long bios_size;
>>
>>          memory_region_init_rom(bios, NULL, "ef405ep=2Ebios", BIOS_SIZE=
,
>
>The compiler's wrong here, because there's no way to get to the free
>without passing through the actual initialization:

Yep=2E It breaks compilation with -Werror, though, which is useful for dev=
elopment=2E

>
>        filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmwar=
e);
>
>I think I would prefer a fix which hoisted that up to the declaration,
>rather than setting it to NULL and then unconditionally overwriting that
>(which some future compiler version might notice and warn about):
>
> g_autofree char *filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS,
>machine->firmware);

Ack - I prefer that solution and I'll submit v2=2E

I'm often confused as to when to use RAII in QEMU and when not to=2E

Best regards,
Bernhard

>
>thanks
>-- PMM


