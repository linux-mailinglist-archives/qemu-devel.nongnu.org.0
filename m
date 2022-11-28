Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A063A6E4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 12:15:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozc6C-0002zl-2y; Mon, 28 Nov 2022 06:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozc6A-0002zK-FC
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:14:54 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozc68-0005KD-LN
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:14:54 -0500
Received: by mail-wr1-x42c.google.com with SMTP id x17so16218842wrn.6
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 03:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D6TpMzvJ9/DGrV+bzhvDi1AF35qLCGuf7JKBtB/loTw=;
 b=NW85BT1t9l8Wr7ZvkJIlqmvEn67NF6hSckN7wFJ7vZ5BVfqEVAA+jGQFBbqMXcn8mc
 IE/OHzdc5b5M5SISeMH4XNVED71+LFnDiX3sg76U032GDtYtgvYNDP2miebedmAVCouP
 zRRajCXsI/0au6iB2gCCyKSOw3YVBGaIunY1JxSfcxt4STknALP11dAYlWd8iAbL5v6j
 xEuXwfa2+z1on3yMo5TG8Sq0eIcu6rK7rs+oTfg3zVNwqqQFcwgMSwsioG5yuCwhMG2g
 DWzJV86HzFp52/AsyXDO9HvoM7rDrT1AzbKBkirLRGyxwTxgYHJyYmZKT5SyGu2ZVab1
 90Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D6TpMzvJ9/DGrV+bzhvDi1AF35qLCGuf7JKBtB/loTw=;
 b=tK795o0c/hfbdC6+N6NE24eSBzQPhfyRFBVCtiKEqrNdMx07DbkbDvUH08f1VYzXry
 gx9Fzz0m2A1kUDgmEvaCQiBONcDOnYYWOphwuKR9FIF3DyuPedxUHNjVxpRhu046UxVW
 9ScR5dnQWUltqkdEEa/iql6iN1jBf7M4yVREKePyepYRzx6tZo49XT93ynkIwS5/EMa6
 N4fn81QYMeyAMp33yqX6gwRXocXGwZGmTY1N2/5PmwzoRuoeA7B+LjZgjCPwZ2JhBtb/
 2pJrVI2Y6e/h0VrF8K2oNjhBu6jNaKSlJv8HDBxA2TTOI9c2+cISN3kYBgBnUxqjkBUV
 GtIA==
X-Gm-Message-State: ANoB5plBxGl4iiHeMI1fRuwQtJcR0DLGZwuMu/emdHbubdZWezCkZUqY
 8CWxNL4xILh1gXJZAUbP1+PNlg==
X-Google-Smtp-Source: AA0mqf6Xvpxjw5yVvfkk+NB4glwTxl/V1e83lGByVJ6z9k+n645gIXhgKMipcMX47qFJ2fGcQWWN/Q==
X-Received: by 2002:a05:6000:1d84:b0:236:5022:c705 with SMTP id
 bk4-20020a0560001d8400b002365022c705mr29751936wrb.466.1669634091072; 
 Mon, 28 Nov 2022 03:14:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f2-20020a1c6a02000000b003b4868eb71bsm18080491wmc.25.2022.11.28.03.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 03:14:50 -0800 (PST)
Message-ID: <47fb60f1-4276-4f48-0856-7c02f8b00558@linaro.org>
Date: Mon, 28 Nov 2022 12:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH-for-7.2 4/4] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt (CVE-2022-4144)
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Mauro Matteo Cascella <mcascell@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221125154030.42108-1-philmd@linaro.org>
 <20221125173119.46665-1-philmd@linaro.org>
 <20221125173119.46665-2-philmd@linaro.org>
 <CAJ+F1CKD95i6B5QGZYtHzenTwweX3=99c_UELCyJu+JhtzQA4A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJ+F1CKD95i6B5QGZYtHzenTwweX3=99c_UELCyJu+JhtzQA4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 28/11/22 09:35, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Nov 25, 2022 at 9:35 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> Return NULL if the requested buffer size does not fit
>> within the slot memory region.
>>
>> Reported-by: Wenxu Yin (@awxylitol)
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/display/qxl.c | 11 ++++++++++-
>>   hw/display/qxl.h |  2 +-
>>   2 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
>> index 231d733250..e5e162f82d 100644
>> --- a/hw/display/qxl.c
>> +++ b/hw/display/qxl.c
>> @@ -1462,7 +1462,7 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
>>   void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
>>                       size_t size)
>>   {
>> -    uint64_t offset;
>> +    uint64_t offset, ptr_end_offset;
>>       uint32_t slot;
>>       void *ptr;
>>
>> @@ -1474,6 +1474,15 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
>>           if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
>>               return NULL;
>>           }
>> +
>> +        ptr_end_offset = qxl->guest_slots[slot].offset + offset + size;
> 
> This is unlikely subject to int overflow, but perhaps it's worth
> considering using some int128 instead?

If so this should be done after an audit of the codebase, many places 
are similar. I'll try to avoid using subtraction on "available size".


Note qxl_dirty_one_surface() seems to have the same issue when calling
qxl_set_dirty().

Should this check be moved to qxl_get_check_slot_offset()?

>> +        if (ptr_end_offset > memory_region_size(qxl->guest_slots[slot].mr)) {
> 
>> +            qxl_set_guest_bug(qxl,
>> +                              "slot %d offset %"PRIu64" size %zu: "
>> +                              "overrun by %"PRIu64" bytes\n",
>> +                              slot, offset, size, ptr_end_offset - offset);
>> +            return NULL;
>> +        }
>>           ptr = memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
>>           ptr += qxl->guest_slots[slot].offset;
>>           ptr += offset;


