Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D63949E2D9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:50:16 +0100 (CET)
Received: from localhost ([::1]:48808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD4EB-00017F-1x
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:50:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nD40P-0006re-Rf; Thu, 27 Jan 2022 07:36:03 -0500
Received: from [2607:f8b0:4864:20::32e] (port=46669
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nD40O-0003GQ-3w; Thu, 27 Jan 2022 07:36:01 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 10-20020a9d030a000000b0059f164f4a86so2362080otv.13; 
 Thu, 27 Jan 2022 04:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=frviFjzFoJwU3UyzQQKhqP+/zOnx/pgEYIPA/emyeAg=;
 b=Yy07Jp0OHp3cCxbJ86O0ZyTa4fbLNeKt6ns9y4/RFYl2Fydfrkf8EBG7HJflRGv8Wc
 u3TaYrc/BUcKMoxVZx7BAPhPBt8uAkb2PjX5KVxKt9TZjLGX/lFAtyXQDRKfmhl+mpRD
 +LO+FJY3ofdX/VDCyRxWK2Iur5xO4+o5ZPPz8HIJf6qx69GKMtGRoWDo1nhg4RALq9Zu
 ht2TlkZNtcpE5BMRQvD5tuPYSAo0m0WmI3KrfqkcEH4kLZKo5beBW2CY53SDxH/AfhJv
 i+Y6MBfw4YXfqBVQGcsBAqBT4fjr66uuzvzbz7B7g1Yi+AwqRt/GzUyHdmzzjE5Ey57f
 cWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=frviFjzFoJwU3UyzQQKhqP+/zOnx/pgEYIPA/emyeAg=;
 b=auebC57F40nT1KgV0W4FUM01F/qBCoC1B4MYM1ufZtBvVsCjaqsGdV4n5gMF8e+Qqu
 7A6fshP+kTXuRf1Y9Voj2sE8272g1m/Ym3P8bYrpc555hFBMP3L36TpJs0CcZ+RAXUtc
 s+fEsFnmKbQU6erYw01R/tFQ/alAFLi2lzf/l9YgmN0Gs5wOcjONlvZSHjDmBeMxpe86
 v1NIMIu3+vOjwo+TiBHtCNs5CoiPOe+47LvMMQaaaSPZyr5J+bR5cMbi1DgeGmYU2ThW
 2btm9P9OWxN/Sb1RllNAKRGqW+55C+Z8pkDUTSLtVO9Q4IKuRvjAcyxzUGLEk5ilqfv2
 z+5g==
X-Gm-Message-State: AOAM531OLqADQYW469q+s72jtJrWyVEzBItrXGOcqV04Gh+/CqbZ2HeB
 6uBz74XDr+jVGZTV8kVSJu0=
X-Google-Smtp-Source: ABdhPJxRCd/K16hmBDirymMtRw6uIenItQz4WyjupfHXYi/uS8zwnHjY/QigeJXYPvkEecieB6i/aQ==
X-Received: by 2002:a9d:710b:: with SMTP id n11mr2005956otj.144.1643286958384; 
 Thu, 27 Jan 2022 04:35:58 -0800 (PST)
Received: from [192.168.10.222] (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id y3sm3398905otu.52.2022.01.27.04.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 04:35:58 -0800 (PST)
Message-ID: <d5b3c3d8-634a-9980-dc10-5a2bd302854d@gmail.com>
Date: Thu, 27 Jan 2022 09:35:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] ppc/pnv: use a do-while() loop in
 pnv_phb3_translate_tve()
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20220126201438.822457-1-danielhb413@gmail.com>
 <20220126201438.822457-2-danielhb413@gmail.com>
 <5b9fc0c6-f6b4-64e1-9126-de54229d05c1@eldorado.org.br>
 <171f02a2-cf95-fd79-4dc7-94a667f3ef81@gmail.com>
 <f8848945-a175-bd6d-d53c-3d5c9944d363@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <f8848945-a175-bd6d-d53c-3d5c9944d363@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/27/22 09:28, Matheus K. Ferst wrote:
> On 27/01/2022 09:09, Daniel Henrique Barboza wrote:
>> On 1/27/22 08:41, Matheus K. Ferst wrote:
>>> On 26/01/2022 17:14, Daniel Henrique Barboza wrote:
>>>> The 'taddr' variable is left unintialized, being set only inside the
>>>> "while ((lev--) >= 0)" loop where we get the TCE address. The 'lev' var
>>>> is an int32_t that is being initiliazed by the GETFIELD() macro, which
>>>> returns an uint64_t.
>>>>
>>>> For a human reader this means that 'lev' will always be positive or zero.
>>>> But some compilers may beg to differ. 'lev' being an int32_t can in theory
>>>> be set as negative, and the "while ((lev--) >= 0)" loop might never be
>>>> reached, and 'taddr' will be left unitialized. This can cause phb3_error()
>>>> to use 'taddr' uninitialized down below:
>>>>
>>>> if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
>>>>      phb3_error(phb, "TCE access fault at 0x%"PRIx64, taddr);
>>>>
>>>> A quick way of fixing it is to use a do/while() loop. This will keep the
>>>> same semanting as the existing while() loop does and the compiler will
>>>> understand that 'taddr' will be initialized at least once.
>>>>
>>>> Suggested-by: Matheus K. Ferst <matheus.ferst@eldorado.org.br>
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/573
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>   hw/pci-host/pnv_phb3.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
>>>> index 7fb35dc031..39a6184419 100644
>>>> --- a/hw/pci-host/pnv_phb3.c
>>>> +++ b/hw/pci-host/pnv_phb3.c
>>>> @@ -792,7 +792,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
>>>>           sh = tbl_shift * lev + tce_shift;
>>>>
>>>>           /* TODO: Multi-level untested */
>>>> -        while ((lev--) >= 0) {
>>>> +        do {
>>>>               /* Grab the TCE address */
>>>>               taddr = base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) << 3);
>>>>               if (dma_memory_read(&address_space_memory, taddr, &tce,
>>>> @@ -813,7 +813,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
>>>>               }
>>>>               sh -= tbl_shift;
>>>>               base = tce & ~0xfffull;
>>>> -        }
>>>> +        } while ((lev--) >= 0);
>>>
>>> This changes the number of iterations in this loop.
>>
>> ooofff
>>
>>> We'd need "while ((--lev) >= 0)" to keep it the same, but then we would be checking "!(tce & 3)" for the last iteration. Is that a problem?
>>
>>
>> I don't think that's a problem because then (lev >= 0) will not be true 
> 
> That holds for "while ((lev--) >= 0)", where the last iteration has "lev=-1", but "while ((--lev) >= 0)" would make lev=0 in the last execution of this loop. I guess we need to either decrement lev elsewhere or adjust its use inside the loop (e.g.: if (lev > 0 && !(tce & 3)))

Oh, I mentioned that considering that I screwed up and the decrement should
be done at the start of the loop.

Changing the logic to accommodate the lev decrement at the end seems too much
trouble. I'd rather keep the same original logic.


Daniel

> 
>> and we'll
>> not going to check !(tce &3), so even if 'tce' has a bogus value it's fine.
>>
> 
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

