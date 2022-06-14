Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06454ADD5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:58:45 +0200 (CEST)
Received: from localhost ([::1]:54396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13Js-00068D-3F
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o13CL-0000BH-Vn
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:50:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o13CD-00022v-Ja
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655200248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0Y7yPXrPaqQh/DZv3moc1KCkhugMZvyClBpdR2sesw=;
 b=XKiZNngTgD23MLpl7NT4ryfEtgMMw/Oc+yZqVtUF9S68I2IH+eJfiSoVx8+s3/Sy+89QrJ
 APHlJt5N2OvGQ0Yh91VGOCBhWh0ZlPz3mKRtydwwx431P0OV5v+Je6fVlf5JjxtBfltUbr
 QIrkqRaLfM03guET2kPrERyJzxxt/3g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-5u9h0WyONQuQmUoHkuXTUg-1; Tue, 14 Jun 2022 05:50:46 -0400
X-MC-Unique: 5u9h0WyONQuQmUoHkuXTUg-1
Received: by mail-wm1-f70.google.com with SMTP id
 p18-20020a05600c23d200b0039c40c05687so3619538wmb.2
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 02:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=m0Y7yPXrPaqQh/DZv3moc1KCkhugMZvyClBpdR2sesw=;
 b=AfbGciIYZHqh4qHySRFOw0gcBajFE9k0ndb56uXKFJWP1hBS+tmihzl1T49D4iU2aT
 +D7velMjHU1TS3x+GsxKQXJEt30DO7VPGN4L/OXcDcKL+Yw22jqvfpHOzvetP0Ha/EkH
 2h/f8jv7Jc2OlQcZS580D3AZeY/aJeBU8H7OnNuJXSOVVGzxk32po0AdnUada1sY2BcX
 OkGhBK9WRnJpf5HuIMBCc3mTpM9JQhvOMUGvhCywAMW7IXxjUvgzAeqg4e+j2r4+dESu
 LYG0chMpyFsC6YXKSYWDooaB0meCh/hk/2k+S2jt9eHoKWvyisoPz6qTwS0e8zXalq4S
 J0wA==
X-Gm-Message-State: AJIora/ye3rkCbyGdQWSyeFhtS2UHEhYgXm0spVICJVKaZ1Jf0Fcyb2V
 NwQklXWcOeMLzhG49VQW7hvxraxB9kJuBoyd2XHg9S1VQofNP+r08lHTHSCgPzGL5L2TmBOUiVn
 ldeYajSk2ZLsS/xk=
X-Received: by 2002:a5d:4708:0:b0:215:d1fa:1b9e with SMTP id
 y8-20020a5d4708000000b00215d1fa1b9emr4093228wrq.202.1655200245250; 
 Tue, 14 Jun 2022 02:50:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sQF+sDr+4fjNbS9ZfAESHtK/N9EYS4ZC77siZj6b+XTuu0WjLv12b5EXf8RLmDMkBrecmfww==
X-Received: by 2002:a5d:4708:0:b0:215:d1fa:1b9e with SMTP id
 y8-20020a5d4708000000b00215d1fa1b9emr4093209wrq.202.1655200245015; 
 Tue, 14 Jun 2022 02:50:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:cf00:aace:de16:d459:d411?
 (p200300cbc70bcf00aacede16d459d411.dip0.t-ipconnect.de.
 [2003:cb:c70b:cf00:aace:de16:d459:d411])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b0039aef592ca0sm12093623wmg.35.2022.06.14.02.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 02:50:44 -0700 (PDT)
Message-ID: <ac7c0d9c-4fb2-c67b-db25-00e4bbc0eb42@redhat.com>
Date: Tue, 14 Jun 2022 11:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
References: <20220531145147.61112-1-jusual@redhat.com>
 <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
 <CAMDeoFUxG7B67BCm4nb303VEwBdiD=JNi_OWSaxirThWnTd6LA@mail.gmail.com>
 <YqdTQYUhO/3dzJvZ@stefanha-x1.localdomain>
 <20220614105408.235f0f41@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
In-Reply-To: <20220614105408.235f0f41@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 14.06.22 10:54, Igor Mammedov wrote:
> On Mon, 13 Jun 2022 16:09:53 +0100
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> 
>> On Mon, Jun 13, 2022 at 05:01:10PM +0200, Julia Suvorova wrote:
>>> On Tue, May 31, 2022 at 5:32 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:  
>>>>
>>>> On Tue, May 31, 2022 at 04:51:47PM +0200, Julia Suvorova wrote:  
>>>>> In the ACPI specification [1], the 'unarmed' bit is set when a device
>>>>> cannot accept a persistent write. This means that when a memdev is
>>>>> read-only, the 'unarmed' flag must be turned on. The logic is correct,
>>>>> just changing the error message.
>>>>>
>>>>> [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
>>>>>
>>>>> Signed-off-by: Julia Suvorova <jusual@redhat.com>
>>>>> ---
>>>>>  hw/mem/nvdimm.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)  
>>>>
>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>  
>>>
>>> It seems like Xiao is not active, whose tree should this patch go to?  

Is that a temporary or a permanent thing? Do we know?

> 
> Perhaps David can add himself as maintainer (i.e. put it
> under memory mantanership umbrella) and merge it 

Maybe it makes sense to combine NVDIMM with pc-dimm.c and
memory-device.c into a "MEMORY DEVICE" section. Then, remove "hw/mem/*"
from "ACPI/SMBIOS".

cxl_type3.c, npcm7xx_mc.c and sparse-mem.c in /hw/mem/ are a bit
different. We could add cxl_type3.c to "Compute Express Link".
npcm7xx_mc.c and sparse-mem.c should be already covered.

-- 
Thanks,

David / dhildenb


