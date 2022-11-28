Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1298263AC76
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 16:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozg1F-0001Ru-6P; Mon, 28 Nov 2022 10:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozg1B-0001Qp-2T
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:26:03 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozg19-00010D-Ap
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:26:00 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h11so10117336wrw.13
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 07:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i5wUvwgd6yzR6eR0Ze/zXDxbdRXowIEV/wQb09Pk+xo=;
 b=JAOa/IOt1l+dETAv1VKdRkz665/oBQDaMStq6uW0Jx8CKx4pPXinXCOLqXYgVjmHKa
 40PTw0qRqm81seyXLWfcJPcl9i/fPWirZo6o4x+l/hz9XJWxxA7ElZMPmM5ZaodkZa3J
 w5GFZ7h2A8sw95WeDCNECahQtEW37DPn91XrjkITmgtj+KYh7Ia5q9g4GGO2oZCPUeyu
 c1cD6GwsnwuhTxPN6bc8eNvgI0EKGSFM7yqNmcXcADlKt5mAS7txHsy61bWYfByrgdzN
 11feGRNFU//YvTNDH807wVu7WuLHmSGDSeGWajZ/USePoByx3yj6GOIkrFxDwXaY9WWx
 Du3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i5wUvwgd6yzR6eR0Ze/zXDxbdRXowIEV/wQb09Pk+xo=;
 b=va5CT23lY4Z/bYJXEm1cDkQgFQ90hUdSEcZO7bnistJRqSzYE+HXmCTx1G/P7zZvrT
 zYVRchTP3vncPs2iMH4GMobkN/1VbVsuBb9uiVxWVPCmm9yXOsU08twtXyvqQTozeDzR
 QT9OfwhNIV7Lp3J/DxRsaDDDrKPbd850p04ADm58VYJA5GcjCY8wzP4jqOLohIyuWOP2
 Ig5kspxOgcUACno25wZwh9MT067HPv+jWs0zjf89byYBtVA2rC97PMM+w+fK95pX0SkD
 nbengzlUbE+j9rVRAlfP5Fnm/GArGJjtVIejlI6/dXf2inv6kg7/SqYRlEjBoKiGlQMq
 /TKw==
X-Gm-Message-State: ANoB5pnGv+1A7yDhwmwUOgv/v5XNtvzjvslyqi1VZggR0qNjrhsOGcsf
 7KZWyyrjHLTUhGR7AGmAGkDFDQ==
X-Google-Smtp-Source: AA0mqf7oAZmhlCx6nmQ8z7GwxZHWnWvG+85cJtKZ4dnYeqXhngAPUDWv8YGCXcXVnXQBiLnS6v1Tmg==
X-Received: by 2002:a05:6000:a13:b0:236:a920:73e8 with SMTP id
 co19-20020a0560000a1300b00236a92073e8mr32040299wrb.5.1669649157554; 
 Mon, 28 Nov 2022 07:25:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v8-20020adfebc8000000b00236545edc91sm11209155wrn.76.2022.11.28.07.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 07:25:57 -0800 (PST)
Message-ID: <68346f84-d9f0-c232-dcaf-d614c3261c4e@linaro.org>
Date: Mon, 28 Nov 2022 16:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH-for-7.2 4/5] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt (CVE-2022-4144)
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221128134832.84867-1-philmd@linaro.org>
 <20221128134832.84867-5-philmd@linaro.org>
 <CAJSP0QUNU1CEJ8AMmo=tDC60ChY=Qo67nOEBBZmtaYeXvOybFQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJSP0QUNU1CEJ8AMmo=tDC60ChY=Qo67nOEBBZmtaYeXvOybFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 28/11/22 16:16, Stefan Hajnoczi wrote:
> On Mon, 28 Nov 2022 at 08:53, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Have qxl_get_check_slot_offset() return false if the requested
>> buffer size does not fit within the slot memory region.
>>
>> Similarly qxl_phys2virt() now returns NULL in such case, and
>> qxl_dirty_one_surface() aborts.
>>
>> This avoids buffer overrun in the host pointer returned by
>> memory_region_get_ram_ptr().
>>
>> Fixes: CVE-2022-4144 (out-of-bounds read)
>> Reported-by: Wenxu Yin (@awxylitol)
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/display/qxl.c | 22 ++++++++++++++++++----
>>   hw/display/qxl.h |  2 +-
>>   2 files changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
>> index 231d733250..afa157d327 100644
>> --- a/hw/display/qxl.c
>> +++ b/hw/display/qxl.c
>> @@ -1424,11 +1424,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
>>
>>   /* can be also called from spice server thread context */
>>   static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
>> -                                      uint32_t *s, uint64_t *o)
>> +                                      uint32_t *s, uint64_t *o,
>> +                                      size_t size_requested)
>>   {
>>       uint64_t phys   = le64_to_cpu(pqxl);
>>       uint32_t slot   = (phys >> (64 -  8)) & 0xff;
>>       uint64_t offset = phys & 0xffffffffffff;
>> +    uint64_t size_available;
>>
>>       if (slot >= NUM_MEMSLOTS) {
>>           qxl_set_guest_bug(qxl, "slot too large %d >= %d", slot,
>> @@ -1453,6 +1455,18 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
>>           return false;
>>       }
>>
>> +    size_available = memory_region_size(qxl->guest_slots[slot].mr);
>> +    assert(qxl->guest_slots[slot].offset + offset < size_available);
> 
> Can this assertion be triggered by the guest (via an invalid pqxl
> value)? I think the answer is no, but I don't know the the qxl code
> well enough to be sure.

'qxl->guest_slots[slot].offset' is initialized in qxl_add_memslot()
(host); 'size_available' also comes from the host, but 'offset'
comes from the guest via 'QXLPHYSICAL pqxl' IIUC.

I added this check to avoid overflow, but it can be changed to return
an error.

Thanks,

Phil.

