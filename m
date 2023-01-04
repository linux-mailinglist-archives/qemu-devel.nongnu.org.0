Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F9765DDED
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 21:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDApa-0004Oh-9C; Wed, 04 Jan 2023 15:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDApY-0004Nh-9i; Wed, 04 Jan 2023 15:57:48 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDApW-0005fG-F4; Wed, 04 Jan 2023 15:57:48 -0500
Received: by mail-ed1-x52a.google.com with SMTP id z11so34486744ede.1;
 Wed, 04 Jan 2023 12:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfNNTYVeZp2L8I0OZ1Yn+LacJaC9RdgsMu9+prUteIg=;
 b=UvqYJJ81mOijONS35NawJ3V2PazvWKC9FdKces+SV0Ot2+tNXT9Nq2SKEvBrEHASoW
 TLB9LrSNBXzqs03jz9xYAOZXV40NRIP8mcVrBpXWmBw6eAexian74yIaIVL9skd+Lbvw
 bWs/fb4pRoMc23Uhjp0dd6jfxx06kscAguA88icfowT15VrQ6nT52BVQvOxI2t4DppMq
 CoiwX0QEo/Xd4w7wC04JwwcEerZzIraGn3zpw5zRpVDD8uixHIcOVqvVIlrUEo1N0KXA
 B09r47RCtnIQm7h63N0VFWfB+b7EL6Q/IcWg0RI1JUwW9cSr7cPffyi37H1vnAECAzJa
 CI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfNNTYVeZp2L8I0OZ1Yn+LacJaC9RdgsMu9+prUteIg=;
 b=o3EIty5Yq0Q0JdanOHjY+CE1d1/XEncCcm3m3ByKTD64OO6c1Qbx8WkZfm0pLq9l6x
 uvFCoBcQeXOxaMesEXrlsQWJIzTCaXMQEO/PXXEGALgEmL3JbLQ/EFuIeJVCOcP9vvuB
 MxCTk+01B6YD3nQHTmXboelVa549Wf5BpqCnCczbzmJ0lwhDTLbxPSkvcciKwaqejJCR
 MzhBqd8BQe8TYaK8cHzygvazqlNOl4LLW5CuGJ/K/iYiyEbDiolRdAUewAq8V3WZgaCN
 1DxrYq+U9gjX3icj/Q4u+r7ILz0Ko716i+FCpFlDvALidcooi0EMrbZ5ewowlxqzucyj
 DnjA==
X-Gm-Message-State: AFqh2kqO68OA862ETvSNYqzZ5322n2m1s29MMiVd1hDHth/Y9RPpcXjz
 wQugKOiowZdaJBK0Q0SgzPM=
X-Google-Smtp-Source: AMrXdXu9CTDowOrfpQZQ50GlpbzzUiYyNT+4zVsudQAILjKduUmO+P3S3tZLU670k/vjiaNitu8WTQ==
X-Received: by 2002:aa7:d78b:0:b0:48c:cb73:7be0 with SMTP id
 s11-20020aa7d78b000000b0048ccb737be0mr12177905edq.23.1672865864523; 
 Wed, 04 Jan 2023 12:57:44 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2008108eedf25879029.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8108:eedf:2587:9029])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a056402500f00b0047eeaae9558sm15095352eda.60.2023.01.04.12.57.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 12:57:44 -0800 (PST)
Date: Wed, 04 Jan 2023 20:57:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Burton <mburton@qti.qualcomm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v4 12/30] hw/core: Introduce proxy-pic
In-Reply-To: <719d01ad-424d-80eb-3c99-4c1120ed4b88@linaro.org>
References: <20221221170003.2929-1-shentey@gmail.com>
 <20221221170003.2929-13-shentey@gmail.com>
 <3986f4f2-d6bd-9abe-42ef-18311de53bf6@linaro.org>
 <112DBAA3-978C-42C5-B1A5-F614D7A2141B@gmail.com>
 <b82d440e-94e2-c01d-a09d-ce097b29f4c4@linaro.org>
 <44D9DAA2-871D-4B42-99C8-748B2B65A78C@gmail.com>
 <719d01ad-424d-80eb-3c99-4c1120ed4b88@linaro.org>
Message-ID: <A841C644-22E3-4E4F-B73A-47FD491F72F4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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



Am 4=2E Januar 2023 20:31:15 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>On 4/1/23 21:12, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 4=2E Januar 2023 16:35:57 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>>> On 4/1/23 17:01, Bernhard Beschow wrote:
>>>> Am 4=2E Januar 2023 14:37:29 UTC schrieb "Philippe Mathieu-Daud=C3=A9=
" <philmd@linaro=2Eorg>:
>>>>> On 21/12/22 17:59, Bernhard Beschow wrote:
>>>>>> Having a proxy PIC allows for ISA PICs to be created and wired up i=
n
>>>>>> southbridges=2E This is especially useful for PIIX3 for two reasons=
:
>>>>>> First, the southbridge doesn't need to care about the virtualizatio=
n
>>>>>> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
>>>>>> attached) and out-IRQs (which will trigger the IRQs of the respecti=
ve
>>>>>> virtzalization technology) are separated=2E Second, since the in-IR=
Qs are
>>>=20
>>> Typo "virtualization"=2E
>>=20
>> Fixed=2E=2E=2E
>
>
>>>>> Why restrict to 16 and not use a class property and allocate
>>>>> on the heap? See TYPE_SPLIT_IRQ for example=2E
>>>>=20
>>>> TYPE_SPLIT_IRQ doesn't allocate on the heap and instead has a hardcod=
ed limit of MAX_SPLIT_LINES which equals 16 ;)
>>>>=20
>>>> I was unsure on when to free the memory and how to dispose the elemen=
ts so I went with this solution for simplicity=2E I'll look for inspitation=
 in other device models and respin=2E
>>>=20
>>> Oh indeed=2E Well this model as is is OK, but it could be more useful
>>> if able to proxy any range of IRQs=2E
>>=20
>> I've responded with a new, single patch to this patch=2E Is that okay o=
r shall I respin the whole series? Is anything missing? IIUC we can make th=
e proxy-pic dynamic in a follow-up?
>
>I think we are good :) If you can point me to a branch with all your patc=
hes, I could verify everything is properly applied locally=2E

Sure, here we go: https://github=2Ecom/shentok/qemu/commits/piix-consolida=
te

Thanks for your help and for picking up this beast ;)

>
>>> I have the feeling we are cycling around this IRQ proxy:
>>>=20
>>> 22ec3283ef ("irq: introduce qemu_irq_proxy()")
>>> 078778c5a5 ("piix4: Add an i8259 Interrupt Controller as specified in =
datasheet")
>>> fc531e7cab ("Revert "irq: introduce qemu_irq_proxy()"")
>>>=20
>>> What is our problem? IRQ lines connect 2 devices in a fixed direction=
=2E
>>> Current model expects one edge to be wired to a device before wiring
>>> the other device, so device composition with IRQs in middle is
>>> impossible? If so, this doesn't scale with dynamic machine creation=2E
>>=20
>> My PIIX consolidation series and even more so my effort to make the VT8=
2xx south bridges work with the PC machine are indeed bottom-up exploration=
s of dynamic/flexible machine creation=2E
>
>Yeah (I have been there too=2E=2E=2E)=2E

I've seen it=2E Eventually I'll also pick up your work of eliminating the =
isabus global=2E=2E=2E

Best regards,
Bernhard

> Also Mark Cave-Ayland confirmed
>elsewhere in this thread that yourv effort points toward the right
>direction :)
>
>Regards,
>
>Phil=2E

