Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC096998BB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:24:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSg5r-0003Cu-NT; Thu, 16 Feb 2023 10:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSg5p-0003BO-Vl
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:22:41 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSg5o-00039T-BP
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:22:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id n33so1872107wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 07:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d7XA08xdcIK1eUZzRxyWO/RJMWiIQRpIilneaAXcLXU=;
 b=Yt7XCk3vA3rrHVg6xWR5JjSkk2IV3aN16aLFymNNLY/HA0Iac8g6EaiC67SZyf567J
 9Dcii7SLrXG1ny8ayUBs5jLh7wFAh7eYp0Nr4ylowztGRccXRz2kL1A/DREb97lC+ePH
 dQtDslAV93M/qmX9I+eitz+qSAKPzs7YJ5aopas5+Trb59NPFb13FV376Hj7kRnNTLSj
 Vsu/TKhEiMdzytnOeAfNNtLWD/LBA+CRLj7YLDuzAfnS1rWa7RGT+9kcCTUVAO7OcV1i
 zOJRcih3pydugIUYXYh1dLhOfv1/AAu0a070a7KCzn8JU5CzIoNWTrpuYH2FthhS0dFA
 nSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d7XA08xdcIK1eUZzRxyWO/RJMWiIQRpIilneaAXcLXU=;
 b=xKJ6SYsSyxXIKv0+S8yAJD8m6+AHKYqFKa7c/W/mvHKOC4GIuvFHO/BFYRbt8/ITuB
 VUvoKMPxbF8khat5oUBTBDMvtZWpNOAInmXABAKcwMwP52AMuvUGLS5RFLg8nPezHwTR
 1z4V8Ukur/ok/KaBUPZlQ9mdOKtgPkBUc4vRHumIN/604hrw+MS4ppRbS7pQvp61l9CS
 Hn+3LWHiaxhFf2VAl0yzYkFEZG7ItSAMd/NuB3RGVgG9Z+x5jGbfaTiwoOg2jnq28Y3s
 BG5vsJU1cJ3hQF9L1tbAPq10c4GE1F4gY/Etmo2k437xCdCa+D0cB3AvnaLg59SwuocA
 qtmQ==
X-Gm-Message-State: AO0yUKXHhk9YENxMOY1AVGpiUjR0I8zRYicc9qHOo96NTOs9wGZ9UgNx
 CaVPFs/ECgNa+MktgjQes7Z6NQ==
X-Google-Smtp-Source: AK7set/xgW45su+9r/IHtD4KuxmjuSIdMwtS5QwchBAcN1+gWuv5h6xxCrVHk9YnKIgfpVAMMFv8Pg==
X-Received: by 2002:a05:600c:2e95:b0:3df:f85a:46fe with SMTP id
 p21-20020a05600c2e9500b003dff85a46femr5989345wmn.40.1676560958940; 
 Thu, 16 Feb 2023 07:22:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a24-20020a1cf018000000b003dfee43863fsm5614848wmb.26.2023.02.16.07.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 07:22:38 -0800 (PST)
Message-ID: <9d1a3441-d09c-258a-6147-513046b0fc3a@linaro.org>
Date: Thu, 16 Feb 2023 16:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 01/14] hw/char/serial-pci: Replace
 DO_UPCAST(PCISerialState) by PCI_SERIAL()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230213184338.46712-1-philmd@linaro.org>
 <20230213184338.46712-2-philmd@linaro.org>
 <f987749e-d7d8-7812-b118-2eb449ff09f6@redhat.com>
 <892b6b09-6adc-c935-ab3d-d55965792d5f@linaro.org>
 <c39404f9-40ac-0595-45b7-f49bd251ca4e@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <c39404f9-40ac-0595-45b7-f49bd251ca4e@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

On 16/2/23 15:17, BALATON Zoltan wrote:
> On Thu, 16 Feb 2023, Philippe Mathieu-Daudé wrote:
>> On 16/2/23 12:20, Thomas Huth wrote:
>>> On 13/02/2023 19.43, Philippe Mathieu-Daudé wrote:
>>>> Use the PCI_SERIAL() QOM type-checking macro to avoid DO_UPCAST().
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>   hw/char/serial-pci.c | 7 +++++--
>>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
>>>> index 801b769aba..9689645cac 100644
>>>> --- a/hw/char/serial-pci.c
>>>> +++ b/hw/char/serial-pci.c
>>>> @@ -36,7 +36,10 @@
>>>>   #include "qom/object.h"
>>>>   struct PCISerialState {
>>>> +    /*< private >*/
>>>>       PCIDevice dev;
>>>> +    /*< public >*/
>>>> +
>>>
>>> I'm not sure about this part of the patch. It does not seem to be 
>>> related to the other changes at all, and are you sure about which 
>>> parts are really "public" and which parts are "private"? If so, I'd 
>>> like to see a description about this in the commit message, 
>>> preferably in a separate patch. Also, why an empty line after the 
>>> "public" comment?
>>
>> This is how QOM style separates the object 'private' part -- the
>> inherited parent, used by the QOM-cast macros -- and the fields
>> specific to this object.
>> The private field *must* be the first one in the structure for the
>> cast macros to work.
>>
>> Maybe this isn't a convention and we could make one, to unify the
>> API style. I'm open to better suggestion :)
>>
>> I suppose I got custom to see it to distinct the QOM hierarchy and
>> now it helps me to detect what is QOM and what isn't.
>> Anyway I'll remove from this patch.
> 
> I also dislike these comments and empty lines in these struct 
> definitions. 

Well this and the new line somehow helps to not reorder this field
elsewhere in the structure.

> I think it should be enough to document this QOM convention 
> in the docs saying that each QOM object state has to have it's parent's 
> state as first member and you're not supposed to access it directly 
> (except maybe from very closely related sub class) but do a QOM cast 
> instead. If this is clearly stated in the docs then there's no need to 
> add comments about this in every object. You could tell QOM objects from 
> other structs by the first member also being a QOM object and usually 
> called parent or similar but sometimes just dev.

Maybe "first_field_is_always_the_qom_parent" so nobody will be tempted
to access it directly? :)

> If you really want to 
> get fancy maybe you could hide it in a macro, something like:
> 
> OBJECT_STATE(PCISerialState, PCIDevice)
> ...
> END_OBJECT_STATE
> 
> but I'm not sure I like that because it has to hide the braces in the 
> macro so it's not clear it's just a struct. So just describing it in the 
> docs if it's not already is probably enough.
> 
> Regards,
> BALATON Zoltan


