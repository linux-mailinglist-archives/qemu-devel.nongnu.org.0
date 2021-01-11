Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C02F0F71
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 10:51:00 +0100 (CET)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kytql-0007ZQ-Ts
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 04:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kytpR-0006zz-51
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:49:37 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kytpH-00015p-JA
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:49:35 -0500
Received: by mail-pj1-x102a.google.com with SMTP id lj6so7487631pjb.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 01:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q1iEf947VCghePgSJ74LaLv2dmH3vzHIZoLAV+/bBUI=;
 b=pBVTSHVOY/QS8yD6vKY15uHg1cdsFgeE9rw0vZ6eKzgL5XJIPeQkGjBDXeKDWuzrp2
 1Q9prQ6/1zs3rCOYggIxF24aXLG5WV4ENZj8QUqfiUstmT3Wcei2WcKSCdQSGoLu/Tdx
 SrPxZxJNYdRy2bw2iSzFH4eKjlgGXgkQQRZ1qSHEwTh/nqfLh4mHeFDASv2xssJ5JbIf
 pKHNv51zqCvEpypWy/VGRnVYjj4Afg3wb4uQtSwrbCdDj91uDxRy7sqRH1Ps+RS6QFmZ
 20KTYwPuSJ45ojJQa3vJRWxGHTNX/d8JCKeuDkGkDFZieWcu128UupWV6B/PkPFijtcH
 l6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q1iEf947VCghePgSJ74LaLv2dmH3vzHIZoLAV+/bBUI=;
 b=iWiyjigy84yaC8R695WaWBzXVO7aLVkCFDZ+xSZD2rSNDN0NxEz8F+PBy+x4HEvdzT
 zgSmfIjl/kdt8fGQU9davSW85wTTMNSticPWNDuB7ckAgBObzEvkmeVbNEXhldyt3t6u
 9gSs5KXhXdOtF8p+Hr+PR5TR9tUa8hv78Vyktz1at2xqdBdfLJsGGzxmpkYs9ojuJDBw
 loUOei4HqN+8kKsTY/r14t6AAm+zBF7euED5zWdjnR0yzxFLNddH3zpJuUpIKLGzPKWW
 OqNTxrNQQ2d9JEl2IaQaXZtNPt3r415f/tZYylC7rJCG7K1FclwimRbzAkjKffMJ7A5K
 SWsg==
X-Gm-Message-State: AOAM531QB9YWewAIQMWdFoGOYM45RGMMcxCGMRDuLY7MtFIqEGrR7YYZ
 sCwA0nIzGK85aFEDmax/7pymFA==
X-Google-Smtp-Source: ABdhPJyyrlqcs2vbkC2CjNPhg+y+uoS+m9hoVTbx8tlvg+hOwBkDWbU5iGPwGziwkX7P9QBN+TlZkA==
X-Received: by 2002:a17:90b:19d2:: with SMTP id
 nm18mr17825571pjb.159.1610358564924; 
 Mon, 11 Jan 2021 01:49:24 -0800 (PST)
Received: from [10.2.24.220] ([61.120.150.77])
 by smtp.gmail.com with ESMTPSA id s7sm14999908pgi.69.2021.01.11.01.49.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 01:49:24 -0800 (PST)
Subject: Re: [External] Re: [PATCH] hw/block/nvme: add smart_critical_warning
 property
To: Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210111075003.151764-1-pizhenwei@bytedance.com>
 <3ebda26a-2734-242b-c553-2092ba7f4b35@redhat.com>
 <X/wYhMjr03odt+eq@apples.localdomain>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <85e2b54b-7fb0-26b1-8bd5-73d470d3b386@bytedance.com>
Date: Mon, 11 Jan 2021 17:49:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <X/wYhMjr03odt+eq@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: kbusch@kernel.org, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 5:21 PM, Klaus Jensen wrote:
> On Jan 11 10:14, Philippe Mathieu-Daudé wrote:
>> On 1/11/21 8:50 AM, zhenwei pi wrote:
>>> There is a very low probability that hitting physical NVMe disk
>>> hardware critical warning case, it's hard to write & test a monitor
>>> agent service.
>>>
>>> For debugging purposes, add a new 'smart_critical_warning' property
>>> to emulate this situation.
>>>
>>> Test with this patch:
>>> 1, append 'smart_critical_warning=16' for nvme parameters.
>>> 2, run smartctl in guest
>>>   #smartctl -H -l error /dev/nvme0n1
>>>
>>>    === START OF SMART DATA SECTION ===
>>>    SMART overall-health self-assessment test result: FAILED!
>>>    - volatile memory backup device has failed
>>>
>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>> ---
>>>   hw/block/nvme.c | 4 ++++
>>>   hw/block/nvme.h | 1 +
>>>   2 files changed, 5 insertions(+)
>>>
>>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>>> index 27d2c72716..2f0bcac91c 100644
>>> --- a/hw/block/nvme.c
>>> +++ b/hw/block/nvme.c
>>> @@ -1215,6 +1215,8 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
>>>   
>>>       trans_len = MIN(sizeof(smart) - off, buf_len);
>>>   
>>> +    smart.critical_warning = n->params.smart_critical_warning;
>>> +
>>>       smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
>>>                                                           1000));
>>>       smart.data_units_written[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_written,
>>> @@ -2824,6 +2826,8 @@ static Property nvme_props[] = {
>>>       DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
>>>       DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
>>>       DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
>>> +    DEFINE_PROP_UINT8("smart_critical_warning", NvmeCtrl,
>>> +                      params.smart_critical_warning, 0),
>>>       DEFINE_PROP_END_OF_LIST(),
>>>   };
>>>   
>>> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
>>> index e080a2318a..76684f5ac0 100644
>>> --- a/hw/block/nvme.h
>>> +++ b/hw/block/nvme.h
>>> @@ -16,6 +16,7 @@ typedef struct NvmeParams {
>>>       uint32_t aer_max_queued;
>>>       uint8_t  mdts;
>>>       bool     use_intel_id;
>>> +    uint8_t  smart_critical_warning;
>>>   } NvmeParams;
>>>   
>>>   typedef struct NvmeAsyncEvent {
>>>
>>
>> This is an easy way to achieve your goal.
>>
>> However a better way is to add a QMP command to
>> change NvmeCtrl->temperature.
>>
>> See for example tmp105_initfn() in hw/misc/tmp105.c
>> and qmp_tmp105_set_temperature() in tests/qtest/tmp105-test.c.
>>
> 
> Nice.
> 
> +1 for this approach.
> 

Using QMP command to change NvmeCtrl->temperature only triggers 
NVME_SMART_TEMPERATURE warning, it's OK to test the work flow of uplayer 
software, but it's not enough to test all the cases of each warning.

 From NVMe version 1.3 to 1.4, a new bit definition has been added(bit 
5, Persistent Memory Region has become read-only or unreliable). Before 
we really hit this warning on a physical disk, we can use QEMU to test 
this feature(maybe another new feature in the future).

I don't disagree "add a QMP command" solution, but I think QEMU should 
be able to emulate all of the warnings(not only temperature).

-- 
zhenwei pi

