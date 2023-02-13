Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710AA694DF6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:28:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcbX-0006on-NO; Mon, 13 Feb 2023 12:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcbU-0006nA-Ix
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:27:01 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcbP-0004UE-UX
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:27:00 -0500
Received: by mail-wr1-x433.google.com with SMTP id co8so9284298wrb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PDaMrOi9onKoQJVqYI8Gvd2j6vtm14z6rsFUFvDkleg=;
 b=RuDUVaUpxtaXfN6CQ/OJYYZnA0A83UYKLw8KNx1jckB6Ka6hHkg59lJsnJcyiXoKv3
 tL/GUqHG5vUe0l+shdkO+ylJddT3usDD4g3qF9U39z83oWOTaAhF0sh70idrxikX80Wq
 C9IG8mBXHM437oF4HNduqmVL4vMrQ5Z9O2EuZFj4iG+6KO73Zo4IRf2TFUnj+ytht3xP
 R5Ue2jlbuMg1aKYGvwGZy75abE22Ndd6OQjfV9Z672Hp0VaD1MfOJjnfEUF7nw/Ej/+n
 jfJav2ei4dKDDcovS1YtlW5xE+KIjvGuhKKIdwMcfeAY3JbHeIT8LAWxBfGAfepkUAJt
 jTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PDaMrOi9onKoQJVqYI8Gvd2j6vtm14z6rsFUFvDkleg=;
 b=Vhlhu4K8qqnjIaEOv/wdcO6FfzSQjav+jEZ1isgVOQH2x/IMRtZEJc0RQ4FFhGCLbs
 Gomy2wibZYvnFadpiEFkC/8QqMU7zMkktaqCGWvTT9fll2jewJPyCYHU7BNOeaC+ZyXQ
 U8vHC07AgH/JzspislEsPuvDyKEgICCPbv7Ib53BuuiqUm/QMAIt4W2Sio3HJjECRaMY
 Z6AeadBzxZEa76gPTy85+YDxJwvCMS8VzdCQCYI5gRqKy8jXBSCv8i1y73/5f3LDs0+/
 57o6mxDYbOcl+5eieUIFZTKZEPt7zBWkA8ZpN819wWKLzUcEQoJn8NnWkD3rzJAXR1+r
 cTiQ==
X-Gm-Message-State: AO0yUKVQktLgh2Q8SvNG7LortL2qKiLvTEGHspurqPAH91LXN2OAg+Mo
 3RMjQ/WK6Pv8RsiTc/Iywf/qYQ==
X-Google-Smtp-Source: AK7set/3Cl8lReG+0Ivy6BhK5AWLOtyDneL31lPTxCgLvjJAdpsqC7szOuA6/fcwQvd/5kcISga6OQ==
X-Received: by 2002:adf:f350:0:b0:2c3:da3f:1def with SMTP id
 e16-20020adff350000000b002c3da3f1defmr24851954wrp.7.1676309213311; 
 Mon, 13 Feb 2023 09:26:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n2-20020a5d67c2000000b002c53f6c7599sm10295003wrw.29.2023.02.13.09.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 09:26:52 -0800 (PST)
Message-ID: <c3ac2c68-d0d0-fc2e-9f19-1b29a422b306@linaro.org>
Date: Mon, 13 Feb 2023 18:26:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 libvir-list@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
 <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
 <fcd09b07-c0ac-d617-8503-a5ecef947cfe@redhat.com> <Y+pM+H1PvTUUHrhx@x1n>
 <7ae34a52-13a5-05e0-3cea-10a9fb89ec1c@eik.bme.hu> <Y+piDukOkeg+xs9G@x1n>
 <0d85fc1d-4c97-5874-d49c-03ac3c265e2f@eik.bme.hu> <Y+pwnar8b17Mu0u4@x1n>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y+pwnar8b17Mu0u4@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 13/2/23 18:17, Peter Xu wrote:
> On Mon, Feb 13, 2023 at 05:34:04PM +0100, BALATON Zoltan wrote:
>> On Mon, 13 Feb 2023, Peter Xu wrote:
>>> On Mon, Feb 13, 2023 at 03:47:42PM +0100, BALATON Zoltan wrote:
>>>> On Mon, 13 Feb 2023, Peter Xu wrote:
>>>>> On Mon, Feb 13, 2023 at 12:41:29PM +0100, Thomas Huth wrote:
>>>>>> On 07/02/2023 17.33, BALATON Zoltan wrote:
>>>>>>> On Tue, 31 Jan 2023, BALATON Zoltan wrote:
>>>>>>>> On Thu, 19 Jan 2023, BALATON Zoltan wrote:
>>>>>>>>> Currently -d guest_errors enables logging of different invalid actions
>>>>>>>>> by the guest such as misusing hardware, accessing missing features or
>>>>>>>>> invalid memory areas. The memory access logging can be quite verbose
>>>>>>>>> which obscures the other messages enabled by this debug switch so
>>>>>>>>> separate it by adding a new -d memaccess option to make it possible to
>>>>>>>>> control it independently of other guest error logs.
>>>>>>>>>
>>>>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>>>>
>>>>>>>> Ping? Could somebody review and pick it up please?
>>>>>>>
>>>>>>> Ping?
>>>>>>
>>>>>> Patch makes sense to me and looks fine, so:
>>>>>>
>>>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>>>>
>>>>>> ... I think this should go via one of the "Memory API" maintainers branches?
>>>>>> Paolo? Peter? David?
>>>>>
>>>>> Paolo normally does the pull, I assume that'll still be the case.  The
>>>>> patch looks good to me if Phil's comment will be addressed on merging with
>>>>> the old mask, which makes sense to me:
>>>>
>>>> Keeping the old mask kind of defies the purpose. I've tried to explain that
>>>> in the commit message but now that two of you did not get it maybe that
>>>> message needs to be clarified instead?
>>>
>>> I think it's clear enough.  My fault to not read carefully into the
>>> message, sorry.
>>>
>>> However, could you explain why a memory_region_access_valid() failure
>>> shouldn't belong to LOG_GUEST_ERROR?
>>>
>>> commit e54eba1986f6c4bac2951e7f90a849cd842e25e4
>>> Author: Peter Maydell <peter.maydell@linaro.org>
>>> Date:   Thu Oct 18 14:11:35 2012 +0100
>>>
>>>     qemu-log: Add new log category for guest bugs
>>>
>>>     Add a new category for device models to log guest behaviour
>>>     which is likely to be a guest bug of some kind (accessing
>>>     nonexistent registers, reading 32 bit wide registers with
>>>     a byte access, etc). Making this its own log category allows
>>>     those who care (mostly guest OS authors) to see the complaints
>>>     without bothering most users.
>>>
>>> Such an illegal memory access is definitely a suitable candidate of guest
>>> misbehave to me.
>>
>> Problem is that a lot of machines have unimplemented hardware that are valid
>> on real machine but we don't model them so running guests which access these
>> generate constant flow of unassigned memory access log which obscures the
>> actual guest_errors when an modelled device is accessed in unexpected ways.
>> For an example you can try booting MorphOS on mac99,via=pmu as described
>> here: http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos
>> (or the pegasos2 command too). We could add dummy registers to silence these
>> but I think it's better to either implement it correctly or leave it
>> unimplemented so we don't hide errors by the dummy implementation.
>>
>>> Not to mention Phil always have a good point that you may be violating
>>> others using guest_error already so what they wanted to capture can
>>> misterious going away without noticing, even if it may service your goal.
>>> IOW it's a slight ABI and I think we ned justification to break it.
>>
>> Probably this should be documented in changelog or do we need depracation
>> for a debug option meant for developers mostly? I did not think so. Also I
>> can't think of other way to solve this without changing what guest_erorrs do
>> unless we change the name of that flag as well. Also not that when this was
>> originally added it did not contain mem access logs as those were controlled
>> by a define in memory.c until Philippe changed it and added them to
>> guest_errors. So in a way I want the previous functionality back.
> 
> I see, thanks.
> 
> Indeed it's only a debug option, so I don't know whether the abi needs the
> attention here.
> 
> I quickly looked at all the masks and afaict this is really a special and
> very useful one that if I'm a cloud provider I can run some script trying
> to capture those violations using this bit to identify suspecious guests.
> 
> So I think it would still be great to not break it if possible, IMHO.
> 
> Since currently I don't see an immediate limitation of having qemu log mask
> being a single bit for each of the entry, one way to satisfy your need (and
> also keep the old behavior, iiuc), is to make guest_errors a sugar syntax
> to cover 2 bits.  It shouldn't be complicated at all, I assume:
> 
> +/* This covers the generic guest errors besides memory violations */
>   #define LOG_GUEST_ERROR    (1 << 11)
> 
> +/*
> + * This covers the guest errors on memory violations; see LOG_GUEST_ERROR
> + * for generic guest errors.
> + */
> +#define LOG_GUEST_ERROR_MEM      (1 << 21)
> +#define LOG_GUEST_ERROR_ALL      (LOG_GUEST_ERROR | LOG_GUEST_ERROR_MEM)
> 
> -    { LOG_GUEST_ERROR, "guest_errors",
> +    { LOG_GUEST_ERROR_ALL, "guest_errors",
> 
> Then somehow squashed with your changes.  It'll make "guest_errors" not
> exactly matching the name of LOG_* but I think it may not be a big concern.

Thanks Peter for having a look. Cc'ing libvir-list@ to see if this
change could have an impact. If no one else object I'm OK to take the
patch as is, except if you (Peter) want the description to be reworded.

Regards,

Phil.

