Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAFB68B32F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 01:21:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOpF6-0007U4-9I; Sun, 05 Feb 2023 19:20:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOpF2-0007Sc-Nu; Sun, 05 Feb 2023 19:20:16 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOpF1-0008HI-0i; Sun, 05 Feb 2023 19:20:16 -0500
Received: by mail-ej1-x635.google.com with SMTP id qw12so29877814ejc.2;
 Sun, 05 Feb 2023 16:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a7O5nGsl6rLGvX+8pr+dC3SNQLc9hdIqF5LsDfipkeE=;
 b=gKuSCuNlzIJ4S2m+uDDSxpeg5OYx62SScb4OdicVLE/HIMvaxQHPwZ81FTeNuRZd1w
 3wzLK5ag+WUM3JlcAcs20Bn77SFAemOtUoYBKCBnitTWjtDa2mVq7Fkf00jmPRBtVojm
 M3f0UFrAB1e1KkH3qlcHll5M1XoDtfZnhi5SA+TGJSqstMGaUcJ/E/5Nd4cdrk+VeZg/
 3c1i7z98UdcqPNjt4zcuW74W2PGypeC8ZNlsTR+6GbMcF2QfDm8EUtm+IopYqhacb6/B
 YTFKMKVmm5Ueh30xp+PxaIxzRr82rgRTGa0CCgOiyNN9nLwWQqnyND8y2AOG3Q3L8cUO
 jBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7O5nGsl6rLGvX+8pr+dC3SNQLc9hdIqF5LsDfipkeE=;
 b=KVTi6jF/GPN34X7H5k8H1HJ6WZlv8jBlNXQ+5WkGhCtw+pvyyXhxsyETgRxy56ydXI
 qetPsOYRR5ZHx3XLcoJG2By7jxcGy0VN6Z7AJ4ySzjjak2vIh6A+iolw9+GwdiyzBrCJ
 7d5mTevf1nSIFiyy42YhcP5tYJH+1TSZCgGBAaTjmF3H4AdTD19ceXzhiFrb7pI8IkuY
 oMhwjPSab/545D+V87Fxcci7cbKiptiJt+SCsZ5bDKmk0uIUZR+beOERjlexSgskquNz
 tEuBIGs2tHnKDND6T/2Qg/sjuuZSvjD49l8yP4Ei6treiw4MpKIylTE/1WXEkHSfOhvI
 RFsA==
X-Gm-Message-State: AO0yUKWP8iGrgFRk0azYhQO2fUGi8HPujICq2x+VscOa6dMV2lLjtihY
 qm1OhKLOCsOQvJC6By62sMU=
X-Google-Smtp-Source: AK7set+pEv/zR5e4bVNleT/hHIg9K829co8WqujXTQV+SuYW+/oQC8tn3yv/jvH+ASEcZlvR9dSd5w==
X-Received: by 2002:a17:906:b817:b0:86d:f880:5193 with SMTP id
 dv23-20020a170906b81700b0086df8805193mr20307594ejb.38.1675642810782; 
 Sun, 05 Feb 2023 16:20:10 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-013-009-140.77.13.pool.telefonica.de.
 [77.13.9.140]) by smtp.gmail.com with ESMTPSA id
 f17-20020a1709064dd100b0087276f66c6asm4718729ejw.115.2023.02.05.16.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 16:20:10 -0800 (PST)
Date: Mon, 06 Feb 2023 00:20:08 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 03/10] softmmu/ioport: Remove unused functions
In-Reply-To: <dea7bf85-85c1-620c-9a98-4d696fa291f6@ilande.co.uk>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-4-shentey@gmail.com>
 <dea7bf85-85c1-620c-9a98-4d696fa291f6@ilande.co.uk>
Message-ID: <092C7A4D-9947-4D70-9631-AC644B65EF2A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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



Am 5=2E Februar 2023 21:37:01 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ay=
land@ilande=2Eco=2Euk>:
>On 26/01/2023 21:17, Bernhard Beschow wrote:
>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/exec/ioport=2Eh |  2 --
>>   softmmu/ioport=2Ec      | 24 ------------------------
>>   2 files changed, 26 deletions(-)
>>=20
>> diff --git a/include/exec/ioport=2Eh b/include/exec/ioport=2Eh
>> index ec3e8e5942=2E=2E1ef5aebba3 100644
>> --- a/include/exec/ioport=2Eh
>> +++ b/include/exec/ioport=2Eh
>> @@ -67,7 +67,5 @@ void portio_list_init(PortioList *piolist, Object *ow=
ner,
>>                         void *opaque, const char *name,
>>                         MemoryRegion *address_space_io, uint16_t start)=
;
>>   void portio_list_set_flush_coalesced(PortioList *piolist);
>> -void portio_list_destroy(PortioList *piolist);
>> -void portio_list_del(PortioList *piolist);
>>     #endif /* IOPORT_H */
>> diff --git a/softmmu/ioport=2Ec b/softmmu/ioport=2Ec
>> index c92e3cb27d=2E=2E0a55d39196 100644
>> --- a/softmmu/ioport=2Ec
>> +++ b/softmmu/ioport=2Ec
>> @@ -118,19 +118,6 @@ void portio_list_set_flush_coalesced(PortioList *p=
iolist)
>>       piolist->flush_coalesced_mmio =3D true;
>>   }
>>   -void portio_list_destroy(PortioList *piolist)
>> -{
>> -    MemoryRegionPortioList *mrpio;
>> -    unsigned i;
>> -
>> -    for (i =3D 0; i < piolist->nr; ++i) {
>> -        mrpio =3D container_of(piolist->regions[i], MemoryRegionPortio=
List, mr);
>> -        object_unparent(OBJECT(&mrpio->mr));
>> -        g_free(mrpio);
>> -    }
>> -    g_free(piolist->regions);
>> -}
>> -
>>   static const MemoryRegionPortio *find_portio(MemoryRegionPortioList *=
mrpio,
>>                                                uint64_t offset, unsigne=
d size,
>>                                                bool write)
>> @@ -280,14 +267,3 @@ void portio_list_init(PortioList *piolist, Object =
*owner,
>>       /* There will always be an open sub-list=2E  */
>>       portio_list_add_1(piolist, pio_start, count, start, off_low, off_=
high);
>>   }
>> -
>> -void portio_list_del(PortioList *piolist)
>> -{
>> -    MemoryRegionPortioList *mrpio;
>> -    unsigned i;
>> -
>> -    for (i =3D 0; i < piolist->nr; ++i) {
>> -        mrpio =3D container_of(piolist->regions[i], MemoryRegionPortio=
List, mr);
>> -        memory_region_del_subregion(piolist->address_space, &mrpio->mr=
);
>> -    }
>> -}
>
>I think it may be worth leaving these functions=2E There were previous di=
scussions around the cmd646 and via PCI-IDE interfaces which have a bit in =
PCI configuration space that switches the chip between compatibility (ISA) =
mode and PCI mode=2E I could see that switching the device to PCI mode woul=
d require removal of the old ISA ports, for example, as in PCI mode the reg=
isters would be accessed exclusively via the PCI BAR=2E

Sure, I can skip this patch=2E

BR,
Bernhard

>
>
>ATB,
>
>Mark=2E

