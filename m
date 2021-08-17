Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27FA3EE806
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 10:09:15 +0200 (CEST)
Received: from localhost ([::1]:33500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFu9q-00072M-QI
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 04:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFu8k-0006Av-5p
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:08:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFu8f-0005qH-LM
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629187680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnBnAzvJ/p4hX1uAzWCvMBS8Z7+pd2EHK0LpS6XAwow=;
 b=YnIEW2c5PHOccAo+nFThGmiAwI6rc+pEHm75Vcqk6M30RIwdVxhVzw3hgIAZUmkegvxkEW
 RZouc/CeWNUuGzUSz48f5SiePYlKBNyenEWKoAZ2TcoU+i6Ou6ah5OaL5sCn5+hmWQGiDD
 aFH+RFIYCgjFuyslNNY0biRNw9oxVco=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-ZstZKZyDMJmsuZVuzGS7MQ-1; Tue, 17 Aug 2021 04:07:58 -0400
X-MC-Unique: ZstZKZyDMJmsuZVuzGS7MQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n20-20020a05600c4f9400b002e6dc6a99b9so610432wmq.1
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 01:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RnBnAzvJ/p4hX1uAzWCvMBS8Z7+pd2EHK0LpS6XAwow=;
 b=ElOShwRcouLTi8SEamuAZW+LQUntqZ7coD1iV4l3UNtluOetuaywsndL6XyKqE6mP+
 ZVKMf1DyYXOnacq8bDyvFoG/sOTC4SDerVZfnEi606atSbXxpe/pT3GOyCtV26VKNTMX
 CIdMbk3pCi47nT2DCUWmPAnqkDq8ebMHS9h0gHT2VL3HhS5AIfEGuXqODq2lYW88/Pyn
 o5iPikcLORHeRw44ygFuptmYE3T7EzlMEkHUgq7YT7Yw+EfHozo8BXfCMF+XlH1Bt9AP
 eUlRv/vYYpleWdLf3KmNsqTiI13kU3jvUW+P55dbhsB457deRmJ1FyleItWI3jbOmmr+
 Yg0w==
X-Gm-Message-State: AOAM5316n2AcCzzMPZ38EmRXzLJ1cdoBEiuLgryFBSs6RtZqk5zZh5lL
 kup4sze6WYaq7KX8dcba7L/AdCjNQmzrgMYTAgsiJ9wm0t40brsxltO52KnRJg1xr41VmkqE+MK
 tBE6d4FOK2ePEtos=
X-Received: by 2002:adf:c006:: with SMTP id z6mr2461425wre.157.1629187677278; 
 Tue, 17 Aug 2021 01:07:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAG+xeEU8mLU0PuWS1VVnUpJYvR8rp2hWLYWLPHb6g7DGixWwadEu2XKzqVckJ3Jtbw7Hgaw==
X-Received: by 2002:adf:c006:: with SMTP id z6mr2461395wre.157.1629187677056; 
 Tue, 17 Aug 2021 01:07:57 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i8sm1407081wrv.70.2021.08.17.01.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 01:07:56 -0700 (PDT)
Subject: Re: [PATCH v3] vga: don't abort when adding a duplicate isa-vga device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, "Jose R. Ziviani" <jziviani@suse.de>,
 qemu-devel@nongnu.org
References: <20210816135504.9089-1-jziviani@suse.de>
 <f047a8d8-93f5-3f62-0834-c036931090d2@redhat.com>
 <cd2d673b-c9aa-1b9a-7025-9afb787f99b6@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bc835acf-7a75-3270-019b-d24b7fab3413@redhat.com>
Date: Tue, 17 Aug 2021 10:07:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cd2d673b-c9aa-1b9a-7025-9afb787f99b6@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 9:36 AM, Mark Cave-Ayland wrote:
> On 17/08/2021 08:25, Thomas Huth wrote:
> 
>> On 16/08/2021 15.55, Jose R. Ziviani wrote:
>>> If users try to add an isa-vga device that was already registered,
>>> still in command line, qemu will crash:
>>>
>>> $ qemu-system-mips64el -M pica61 -device isa-vga
>>> RAMBlock "vga.vram" already registered, abort!
>>> Aborted (core dumped)
>>>
>>> That particular board registers the device automaticaly, so it's
>>> not obvious that a VGA device already exists. This patch changes
>>> this behavior by displaying a message and exiting without crashing.
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
>>> ---
>>> v2 to v3: Improved error message
>>> v1 to v2: Use error_setg instead of error_report
>>>
>>>   hw/display/vga-isa.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
>>> index 90851e730b..30d55b41c3 100644
>>> --- a/hw/display/vga-isa.c
>>> +++ b/hw/display/vga-isa.c
>>> @@ -33,6 +33,7 @@
>>>   #include "hw/loader.h"
>>>   #include "hw/qdev-properties.h"
>>>   #include "qom/object.h"
>>> +#include "qapi/error.h"
>>>   #define TYPE_ISA_VGA "isa-vga"
>>>   OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
>>> @@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev,
>>> Error **errp)
>>>       MemoryRegion *vga_io_memory;
>>>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>>> +    /*
>>> +     * make sure this device is not being added twice, if so
>>> +     * exit without crashing qemu
>>> +     */
>>> +    if (qemu_ram_block_by_name("vga.vram")) {
>>> +        error_setg(errp, "'isa-vga' device already registered");
>>> +        return;
>>> +    }
>>> +
>>>       s->global_vmstate = true;
>>>       vga_common_init(s, OBJECT(dev));
>>>       s->legacy_address_space = isa_address_space(isadev);
>>>
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> Instead of checking for the presence of the vga.vram block, would it be
> better to use the standard object_resolve_path_type() method to check
> for the presence of the existing isa-vga device instead? See
> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00717.html for
> how this was done for virgl.

I remembered there was a nicer way but couldn't find it.
If this patch were for 6.1, it was good enough. Now it
will be merged in 6.2, I prefer Mark's suggestion.
Jose, do you mind a v4?


