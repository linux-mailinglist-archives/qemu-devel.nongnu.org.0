Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CD3610B95
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 09:50:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooK74-0002Qh-0D; Fri, 28 Oct 2022 03:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooK6s-0002KW-5m; Fri, 28 Oct 2022 03:49:01 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooK6o-0007U3-9I; Fri, 28 Oct 2022 03:48:57 -0400
Received: by mail-ej1-x62d.google.com with SMTP id sc25so11018779ejc.12;
 Fri, 28 Oct 2022 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfouVwLeWtIrMTlV15TwuSIl6/2DO3tS5uVZMOVRHkk=;
 b=E5XkU5t8Ll8Yo8OVNqxvxfynOUbcUNxFP6chjY+DLBQhawqJyjBtZ+KvM7HaZQ867y
 hlrEx6sVExocoT4C3RcyWvHpvPHTvvkcHdazNhF8V/f7Btu5wG0ki7ScuJIxnYdjjz0h
 qosySODDgLKGq/bZzDPEQ51kTn0VvjmsNKHZitUXKF0W5VuhoWSGcMBp/ZVYLWzChjni
 s7PGv+K0WG7/PBJX5G91924ZGABwz5QehdyLP9ujvCbdTsaSZTlVGSmTpOSs7XZa57WP
 0fS1Vk/J9Z9KBrAU51UmG/M7K58QM6pAEcL7wFbYm9l5oW1Cs0Rp8BZ6TuqtVzp4j6lC
 RC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BfouVwLeWtIrMTlV15TwuSIl6/2DO3tS5uVZMOVRHkk=;
 b=wOKVPo1D0Ptr2YfZWOkl92ynFZbT7JDxf+dQQOapY6ejS0HhnGN+WhJmTnajKVNBN4
 Bb7l1wFLkIdxbLt9KW0ISDWsJV1dMBUhskT+e+50YhT3wWw8wWwBi3aQ42ucjHL9EjAL
 JVgMVjFX5pogBwx8W08AM4RVo8yYn3SQ3v8IoSITLlpKKzuN0GSkXSz/d5itLhas6SS1
 qq91XYclkCLh2zLLzv2A+UHxZpRwxoOzBC+r3IboQoxkT6yEnrP3umpi6Khhb4/RHxKE
 h2wipK3W6N7y9C6rqdFZ2FcmbB6fw0gNIe19dbVZ6U8EVCaWWKsQYlIgpeY+DfcfQqPA
 pr0Q==
X-Gm-Message-State: ACrzQf0iaCRbT/oinnGVvn347FC6ZYCoMCZNWkSlb3s9M14nXo/ZwiLx
 RhnOpACPIpSHVFafxWDxTsw=
X-Google-Smtp-Source: AMsMyM6oldkm1//w8qGU17i46q0vPNO9h05awS0rGmQIf//iiUaGqzeqTdR5EXe7GTVkM4XHJsB7Iw==
X-Received: by 2002:a17:906:9b92:b0:791:9355:cb89 with SMTP id
 dd18-20020a1709069b9200b007919355cb89mr44928621ejc.498.1666943330042; 
 Fri, 28 Oct 2022 00:48:50 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb20031070340668e537b.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:3107:340:668e:537b])
 by smtp.gmail.com with ESMTPSA id
 kw15-20020a170907770f00b00782fbb7f5f7sm1824032ejc.113.2022.10.28.00.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 00:48:49 -0700 (PDT)
Date: Fri, 28 Oct 2022 07:48:41 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v5 00/13] Instantiate VT82xx functions in host device
In-Reply-To: <38e64cb2-4409-dc5b-16a1-53e91c0f3dc1@linaro.org>
References: <20220901114127.53914-1-shentey@gmail.com>
 <E2820A94-3E30-46DB-9F83-8157C9A6FE1B@gmail.com>
 <25b0a116-7098-c285-cb20-af05dd03768b@amsat.org>
 <1D5930DC-EA4A-411F-BA3A-AA7FB0315368@gmail.com>
 <de35a684-6fe4-e5f2-3f6b-ca42d4ccbe22@gmail.com>
 <38e64cb2-4409-dc5b-16a1-53e91c0f3dc1@linaro.org>
Message-ID: <7CAAA1FA-6F10-4362-9BA9-3010F225A54C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

Am 27=2E Oktober 2022 22:11:21 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>Hi Daniel, Bernhard,
>
>On 27/10/22 11:47, Daniel Henrique Barboza wrote:
>> On 10/27/22 05:21, Bernhard Beschow wrote:
>>> Am 16=2E September 2022 14:36:05 UTC schrieb "Philippe Mathieu-Daud=C3=
=A9" <f4bug@amsat=2Eorg>:
>>>> On 12/9/22 21:50, Bernhard Beschow wrote:
>>>>> Am 1=2E September 2022 11:41:14 UTC schrieb Bernhard Beschow <shente=
y@gmail=2Ecom>:
>>>>=20
>>>>>> Testing done:
>>>>>>=20
>>>>>> * `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device =
ati-vga,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3=2E17=2Eiso -ker=
nel morphos-3=2E17/boot=2Eimg`
>>>>>>=20
>>>>>> =C2=A0=C2=A0 Boots successfully and it is possible to open games an=
d tools=2E
>>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>> * I was unable to test the fuloong2e board even before this series =
since it seems to be unfinished [1]=2E
>>>>>>=20
>>>>>> =C2=A0=C2=A0 A buildroot-baked kernel [2] booted but doesn't find i=
ts root partition, though the issues could be in the buildroot receipt I cr=
eated=2E
>>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>> [1] https://osdn=2Enet/projects/qmiga/wiki/SubprojectPegasos2
>>>>>>=20
>>>>>> [2] https://github=2Ecom/shentok/buildroot/commits/fuloong2e
>>>>>>=20
>>>>>=20
>>>>> Copying from v2 (just found it in my spam folder :/):
>>>>> Series:
>>>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>>>>>=20
>>>>> Review seems complete, thanks to all who participated! Now we just n=
eed someone to queue this series=2E
>>>>>=20
>>>>> Best regards,
>>>>> Bernhard
>>>>=20
>>>> Excellent cleanup! Series queued to mips-next=2E
>>>=20
>>> Hi Phil,
>>>=20
>>> would you mind doing a pull request in time for 7=2E2?
>>=20
>> I believe Phil was having problems with his amsat=2Eorg email=2E It's
>> better to CC him using his work email philmd@linaro=2Eorg (just added
>> it)=2E
>>=20
>> Phil, since this has pegasos2 changes I can queue it up via ppc-next
>> if you like=2E I'll toss a PR tomorrow=2E
>
>This series is already queued=2E I apologize for the loooong delay, I am
>trying to run my usual tests but various fileservers I was using to
>fetch MIPS binaries disappeared over the last year, so I have to pull
>these files from offline backups=2E The PR will be in time for 7=2E2
>however :)

Thanks Phil, excellent!

Best regards,
Bernhard
>
>Regards,
>
>Phil=2E


