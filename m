Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902F4694A78
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:11:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRaSt-0008EU-Je; Mon, 13 Feb 2023 10:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRaSr-0008EL-TI
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:09:57 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRaSq-0002A5-6w
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:09:57 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso3916850wmo.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 07:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8hkVbIBbeOuX3x2pO0Ct051e1ssy7d6rrFsIdz2asrU=;
 b=iHsZhkyCGcZuT3uihpo7KofNGWcJvRldLyPxPmDnAD/CnYrgUjy9vCVZqhTimCKuxt
 QYjpiYWSq/vyocJhE/5Uhzfa1zrj9ni2OEjhRsyqtPTOiXqHNejorYSyCIVaWsZXh081
 EY7oS+OOpCbBM/Rt415aoYoAKY0MQLv/ynJxg63LT4yTXi+tg55TkGFYt7ZYQ8pvL6H6
 w5Hxaew0t/jyEB3jURrZFUxYCLR4/Hp8Z71n5twvaOluWOvD95UwIp1fJuvJ1mpPFoHs
 3PV1BvqMaZgMV30R427ddtpa/hOl/1mNQQKfz+nCfJ1sQj4paqmKrB+XesBjY8Cp7NMx
 zXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8hkVbIBbeOuX3x2pO0Ct051e1ssy7d6rrFsIdz2asrU=;
 b=fUZPh/2VyV8iBUkB2ho/FokZrvwKAizY1M1qiwG8rzWXXfpKoQXfqnAjCZ/ToA9tT/
 qtSFcDX+8VfVjRwoKa5y9Om4/aImucOf045Kd5tiuo1igryJPauvcsrDWHDhFjQEbMrq
 HcWZYekwLBCbeF/+Wu2k2Xt6whGbGibch3tk/mLx2fmAQ7jD/17EtzdzCBl0Ghxw4liF
 lT6TtEWfki5LPLovjbE3PDEhEyD5ZHWkCqzR4G2zoH//shW/5J6EIkTm73O0hkfy7iL7
 5EnHAUDI3O4G/l9ha5tHWU7Z0SqO8qd/cfbj6IMGEaa1J3oK8j/9mfpDanof2FG5tYyS
 7r0g==
X-Gm-Message-State: AO0yUKXkaMjGL8XPb0lKCZ4g8N2FQ2goROkIonKVzYfNrjROuJf+PjRX
 zjz+p2sLMVaFNlBLTswrX75pVA==
X-Google-Smtp-Source: AK7set8Ra815l4Nc1cmXOC1dCSIuRqJubKkSTVXS7PIfjOzsQpE4XILCDqdGbOil08IsyrSkPHgdyA==
X-Received: by 2002:a05:600c:44c9:b0:3df:f9e9:7600 with SMTP id
 f9-20020a05600c44c900b003dff9e97600mr19418384wmo.25.1676300994324; 
 Mon, 13 Feb 2023 07:09:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s21-20020a1cf215000000b003e001119927sm16841743wmc.24.2023.02.13.07.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 07:09:53 -0800 (PST)
Message-ID: <1ec94e51-264a-36ad-6ab4-5eb2f26e492b@linaro.org>
Date: Mon, 13 Feb 2023 16:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
 <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
 <fcd09b07-c0ac-d617-8503-a5ecef947cfe@redhat.com> <Y+pM+H1PvTUUHrhx@x1n>
 <7ae34a52-13a5-05e0-3cea-10a9fb89ec1c@eik.bme.hu>
 <b19dbcdd-1246-f7d1-2d8f-8f9e2978d2d0@linaro.org>
In-Reply-To: <b19dbcdd-1246-f7d1-2d8f-8f9e2978d2d0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 13/2/23 15:58, Philippe Mathieu-Daudé wrote:
> On 13/2/23 15:47, BALATON Zoltan wrote:
>> On Mon, 13 Feb 2023, Peter Xu wrote:
>>> On Mon, Feb 13, 2023 at 12:41:29PM +0100, Thomas Huth wrote:
>>>> On 07/02/2023 17.33, BALATON Zoltan wrote:
>>>>> On Tue, 31 Jan 2023, BALATON Zoltan wrote:
>>>>>> On Thu, 19 Jan 2023, BALATON Zoltan wrote:
>>>>>>> Currently -d guest_errors enables logging of different invalid 
>>>>>>> actions
>>>>>>> by the guest such as misusing hardware, accessing missing 
>>>>>>> features or
>>>>>>> invalid memory areas.

- misusing hardware => LOG_GUEST_ERROR
- accessing missing features => LOG_UNIMP
- invalid memory areas => depending on the bus bridge, can be:

   #define MEMTX_OK              0
   #define MEMTX_ERROR          (1U << 0) /* device returned an error */
   #define MEMTX_DECODE_ERROR   (1U << 1) /* nothing at that address */
   #define MEMTX_ACCESS_ERROR   (1U << 2) /* access denied */

>>>>>>> The memory access logging can be quite verbose
>>>>>>> which obscures the other messages enabled by this debug switch so
>>>>>>> separate it by adding a new -d memaccess option to make it 
>>>>>>> possible to
>>>>>>> control it independently of other guest error logs.
>>>>>>>
>>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>>
>>>>>> Ping? Could somebody review and pick it up please?
>>>>>
>>>>> Ping?
>>>>
>>>> Patch makes sense to me and looks fine, so:
>>>>
>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>>
>>>> ... I think this should go via one of the "Memory API" maintainers 
>>>> branches?
>>>> Paolo? Peter? David?
>>>
>>> Paolo normally does the pull, I assume that'll still be the case.  The
>>> patch looks good to me if Phil's comment will be addressed on merging 
>>> with
>>> the old mask, which makes sense to me:
>>
>> Keeping the old mask kind of defies the purpose. I've tried to explain 
>> that in the commit message

It is hard to justify we need a new mask and scripts have to adapt to
your new format. I assume you can not use trace-event because you want
this logging available in a RELEASE build, right?

>> but now that two of you did not get it 
>> maybe that message needs to be clarified instead?
> 
> Is your use case memaccess enabled and guest-errors disabled?




