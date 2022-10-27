Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43D60F24E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:26:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ony95-000353-58; Thu, 27 Oct 2022 04:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ony8n-00028t-Kl; Thu, 27 Oct 2022 04:21:32 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ony8g-0004eh-CF; Thu, 27 Oct 2022 04:21:29 -0400
Received: by mail-ed1-x533.google.com with SMTP id 21so1441498edv.3;
 Thu, 27 Oct 2022 01:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZeaVPseicQY+J7u2d6tH2WEF+3YejWRLeAUXvXQgu8A=;
 b=k9jNVr+Z84vCrDCfL+YPEfR5LGnLAN21ouAEWw3x/1OJRlozWwjiprVGgk0weNLZsH
 5f2N3N/yHgX4JsYc+sZ422lz03yCs9P5NxMSuR3gsgNClrydcWOk9kT9H8k9b9sK2Xyh
 2Tm5E+65doWi+KGNJe3TQVve9etPyyE525pXSvub1G8ejVCtf5cP0sBfoZZcLkJZ7v4k
 wK2MRCt4nNlEnEmkaJp5y0RzTPsBwgI/ZuklBLdqCIEVdc5nwTGDlfAtvRQUCVu1OxAC
 j1yGPU7WrO1WBs8eIvT89meXLLs2j7eOhcxXctHa+1292RiXmnlQ4eWChrPbWy+uCNKh
 rstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZeaVPseicQY+J7u2d6tH2WEF+3YejWRLeAUXvXQgu8A=;
 b=f5bod6H8FCvjx4DpcJaULzCNuRABrXstApY1Da0GdFmC7n4lXlCJ03Luxhk47gu2Ws
 HgCYFArD6leB2eWufLhmQQbtTSbDrKSamqBAizlRsXwF4KoknluzPLVFNAVSxwbqkDzN
 DcOZEqKG3NXUQTsRSaGVTk6RrFvUGC0ppmvErv44d26aVhS2R1ug2+qzndRwvw2VGKvk
 R0XPeS4BRufN1Gc9hyly1h44B0KW6Uw76905Eer77f55af2Jt61L9Y/iRwNYcJ5jr4vx
 sDX2ydhwvLKERYdoGH6a7gQOzq8n+xMIVrQRTA6SHveHfsj1+c8YfF7z4dqMQFKipkdy
 tLPA==
X-Gm-Message-State: ACrzQf2c/PtYXbgwOvsFjzbpwj2ULcZwbfemWdos0K4axSswmc/y5YSD
 eDlKkHFmqrWrKg/LWxLLu+c=
X-Google-Smtp-Source: AMsMyM4utI+WuBuRmsxER5SmACnZbmlLjYxuoO4J95cT/hGzhm19bcpP1COCBIgGf0+VS5LHBB5byg==
X-Received: by 2002:a05:6402:268f:b0:462:7cbe:953a with SMTP id
 w15-20020a056402268f00b004627cbe953amr4269646edd.385.1666858877288; 
 Thu, 27 Oct 2022 01:21:17 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb20095e0bdce03702654.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:95e0:bdce:370:2654])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a1709064c5800b0073bdf71995dsm404906ejw.139.2022.10.27.01.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 01:21:16 -0700 (PDT)
Date: Thu, 27 Oct 2022 08:21:10 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v5 00/13] Instantiate VT82xx functions in host device
In-Reply-To: <25b0a116-7098-c285-cb20-af05dd03768b@amsat.org>
References: <20220901114127.53914-1-shentey@gmail.com>
 <E2820A94-3E30-46DB-9F83-8157C9A6FE1B@gmail.com>
 <25b0a116-7098-c285-cb20-af05dd03768b@amsat.org>
Message-ID: <1D5930DC-EA4A-411F-BA3A-AA7FB0315368@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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

Am 16=2E September 2022 14:36:05 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<f4bug@amsat=2Eorg>:
>On 12/9/22 21:50, Bernhard Beschow wrote:
>> Am 1=2E September 2022 11:41:14 UTC schrieb Bernhard Beschow <shentey@g=
mail=2Ecom>:
>
>>> Testing done:
>>>=20
>>> * `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device ati=
-vga,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3=2E17=2Eiso -kernel=
 morphos-3=2E17/boot=2Eimg`
>>>=20
>>>   Boots successfully and it is possible to open games and tools=2E
>>>=20
>>>=20
>>>=20
>>> * I was unable to test the fuloong2e board even before this series sin=
ce it seems to be unfinished [1]=2E
>>>=20
>>>   A buildroot-baked kernel [2] booted but doesn't find its root partit=
ion, though the issues could be in the buildroot receipt I created=2E
>>>=20
>>>=20
>>>=20
>>> [1] https://osdn=2Enet/projects/qmiga/wiki/SubprojectPegasos2
>>>=20
>>> [2] https://github=2Ecom/shentok/buildroot/commits/fuloong2e
>>>=20
>>=20
>> Copying from v2 (just found it in my spam folder :/):
>> Series:
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>>=20
>> Review seems complete, thanks to all who participated! Now we just need=
 someone to queue this series=2E
>>=20
>> Best regards,
>> Bernhard
>
>Excellent cleanup! Series queued to mips-next=2E

Hi Phil,

would you mind doing a pull request in time for 7=2E2?

Thanks,
Bernhard


