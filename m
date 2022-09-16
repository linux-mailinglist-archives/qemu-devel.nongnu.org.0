Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6182C5BB1C3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 19:55:42 +0200 (CEST)
Received: from localhost ([::1]:44010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZFYy-0000aM-VF
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 13:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZFXn-0007Sk-7r; Fri, 16 Sep 2022 13:54:27 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZFXk-0007T2-22; Fri, 16 Sep 2022 13:54:26 -0400
Received: by mail-ed1-x530.google.com with SMTP id z21so32629606edi.1;
 Fri, 16 Sep 2022 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=/evkdWe8d6vycgy01+4NgMi2wNVMPYPN4gR4ymDFscE=;
 b=XkiVwkj15AjE/16uQIZaOMUQAJvrwiq6UO372imNg6ObRK//9kv2+O3/tIkJC6DfRH
 sA8qmBqc9JzCtSLQ3btAeGIcu31j2I63N9qNb3wX4U3lZDWveanY+m+0Wn/RLcYDnJ2u
 NMQyLwnPy9rEJPILu5SiTDbGyHe6Eexq9NDihL+InZii4481lAgzZ+qqco5c5a2E81hO
 UtCwid4AMHet/i3nfm6k21GG3bE+6oIXfwvFuImwk53Vtb6PDFBLtEB9nrLISz9nioow
 AlTecntcxWX9wUwod3Gbfp9fNqOW4zlWCI3DmJ4GQs4NwWoUxTU5SwTyy1EQ437QYUO2
 XdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/evkdWe8d6vycgy01+4NgMi2wNVMPYPN4gR4ymDFscE=;
 b=UhAfvLJfesEqXfNPUgmgWd2qm8ELgJeFMFWwPgE8UVUkhvFEvksDZp4WUHqrxbsHwk
 nxLcuGUifczNjf5/M507Gqh6a1tNShHY6FiU00WwTs6vJF6udBYPjfk88w9MHI/BA1EO
 7Vc4GjsysrKNMEUl++TMt8KO2pl6CIDkLJ2FRrAhh/fDfdPfCxNQT0NsfAqEZQnUH0sP
 uQF6A1+KJONMzW5I3H9Dk2a/2AIefDhG0yuWaZEI5kYsPjiUgHt/I4aWnb3DQ5UU8L+8
 J2SnPjzRkLzwj9UghjW2cIEnMrlLjbKpOQsl84EI6HVGI4YXQ6hVYQYyfUBbG+ZK4lmj
 8TPQ==
X-Gm-Message-State: ACrzQf3o/txdM29TrYzgvPY7qQHYrxuUYV3d3Q6pcjoTMCpnepKLGk5v
 Djq4kVszyqgw4K23dp6rpvw=
X-Google-Smtp-Source: AMsMyM6Aggsso2RYyJkPgQ6jMZQmtBW011EbPSt5dOl38rkXsneNBEr8l1nHpOHRr2C4WcRmYr5cyg==
X-Received: by 2002:a05:6402:5106:b0:451:787c:9fcc with SMTP id
 m6-20020a056402510600b00451787c9fccmr4832760edd.164.1663350860447; 
 Fri, 16 Sep 2022 10:54:20 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-154-155.77.191.pool.telefonica.de.
 [77.191.154.155]) by smtp.gmail.com with ESMTPSA id
 p20-20020a17090653d400b0077086d2db8esm10753435ejo.140.2022.09.16.10.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 10:54:19 -0700 (PDT)
Date: Fri, 16 Sep 2022 17:54:15 +0000
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
Message-ID: <C800E0ED-32B3-4643-BC0E-E6C83ACAF439@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

Great! Can't wait for it to land=2E


