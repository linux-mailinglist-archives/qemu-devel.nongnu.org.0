Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32292633F69
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:53:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxUcv-0004VR-5l; Tue, 22 Nov 2022 09:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxUcW-0004Me-J8
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:51:47 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxUcU-0007HN-P4
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:51:32 -0500
Received: by mail-wr1-x434.google.com with SMTP id bs21so25091248wrb.4
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XosywobY+VobbvvsDv13aF4tfeAQ+wLW1u+COqdwmpk=;
 b=zGpNsA3gr2rzhCCq966xlAoLRkZZpsLcsewetNZujNtJNKMK+zhSBE4+hwN4HWxvgz
 XGqBNEATbE9DDwenQtMagLOw9zxGWrcs42Ozawu7DmgiqPJbW5y3acTAJ7dnHTlODN69
 0VhDlJ3yWwnuY5hAYYdUZAhvA+khI9c9f+nCMxLRrhWAMjddTQJ94JNmMENQY4u/wc2b
 nAexSfFwug1SHVrB9F/VWD9c39aCfysIRMh/WJQjm5VekVy47/exVqJ8r36x0mw8SDhI
 W+OugBIQpv2/B7YkNwUT5pmtYi7OeDzxf7GEC0s2rxD4shNCP3d4AvtzhuppYuVDIa0L
 pk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XosywobY+VobbvvsDv13aF4tfeAQ+wLW1u+COqdwmpk=;
 b=VDKw8ULD8KC+haypJRVnh19sxWCkM0cI4DMaqjyP0QM2F4UTGuQLDjrdx720cMTjjV
 t7jRlb0DYDvwVz8Ddp03Iz0gbXBQBf93O/svK2sA7ZIAiGV7rGb/JaqFmBAFcgmnZCaz
 ILdfD4fZi2lGVvhCEjUbe6HZZaNm4lUU4+hg9f0oierKLX2I4z3HbgCfd8Zp+QWrQOqQ
 SHzXqIFNIK7EkmaQcXt+sFdcBomhzFtiCTTSrNCYf43fOWGdrZ6OHqFacxMcWlODCdz6
 ugeGWb4jT3J1z3wW2J60UBiDGI6OE0uB+NOee1vlP9apLhK7c9KuEdKjdOzcZk4XX6Uk
 k9wQ==
X-Gm-Message-State: ANoB5pkk+0GPy0HV4zeWiyydQ1WBxsCYGjvZvmQHkdmiGvp5kf83/hj4
 OAMtUNBsAOhWZaIQ+2Mc4gC7EA==
X-Google-Smtp-Source: AA0mqf4hdwPIkF/tBnXcHkXFSZCfVhQCNmqK39ELxf9E4zWvBktNoa0pEnTUUsPKOhqOBh53F1G8CA==
X-Received: by 2002:adf:fb46:0:b0:22e:2d49:7d3d with SMTP id
 c6-20020adffb46000000b0022e2d497d3dmr3640047wrs.505.1669128687998; 
 Tue, 22 Nov 2022 06:51:27 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056000014d00b0024165454262sm14190687wrx.11.2022.11.22.06.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 06:51:27 -0800 (PST)
Message-ID: <73b7e755-412f-e1c2-a6b0-28063c0084b8@linaro.org>
Date: Tue, 22 Nov 2022 15:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com, groug@kaod.org,
 qemu_oss@crudebyte.com, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 palmer@dabbelt.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pavel.dovgaluk@ispras.ru,
 alex.bennee@linaro.org, peterx@redhat.com, david@redhat.com,
 mrolnik@gmail.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 jcmvbkbc@gmail.com, berrange@redhat.com, lvivier@redhat.com,
 suhang16@mails.ucas.ac.cn, chen.zhang@intel.com, lizhijian@fujitsu.com,
 stefanha@redhat.com, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, virtio-fs@redhat.com
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
 <7875a42b-2776-9d36-5373-78ac75cff89d@linaro.org>
 <87a64ki7zn.fsf@pond.sub.org>
 <47e0d3d8-607d-5e29-6780-c0a4364993a9@redhat.com>
 <87h6yrfjr4.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87h6yrfjr4.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 22/11/22 09:58, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 21/11/2022 17.32, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> On 21/11/22 15:36, Peter Maydell wrote:
>>>>> On Mon, 21 Nov 2022 at 14:03, Markus Armbruster <armbru@redhat.com> wrote:
>>>>>>
>>>>>> Tweak the semantic patch to drop redundant parenthesis around the
>>>>>> return expression.
>>>>>>
>>>>>> Coccinelle drops comments in hw/rdma/vmw/pvrdma_cmd.c; restored
>>>>>> manually.
>>>>>>
>>>>>> Coccinelle messes up vmdk_co_create(), not sure why.  Transformed
>>>>>> manually.
>>>>>>
>>>>>> Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
>>>>>> manually.
>>>>>>
>>>>>> Whitespace in fuse_reply_iov() tidied up manually.
>>>>>>
>>>>>> checkpatch.pl complains "return of an errno should typically be -ve"
>>>>>> two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
>>>>>> it visible to checkpatch.pl.
>>>>>>
>>>>>> checkpatch.pl complains "return is not a function, parentheses are not
>>>>>> required" three times for target/mips/tcg/dsp_helper.c.  False
>>>>>> positives.
>>>>>>
>>>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>>>
>>>>>>     .../user/ase/msa/bit-count/test_msa_nloc_b.c  |   9 +-
>>>>>>     .../user/ase/msa/bit-count/test_msa_nloc_d.c  |   9 +-
>>>>> [snip long list of other mips test files]
>>>>>
>>>>>>     328 files changed, 989 insertions(+), 2099 deletions(-)
>>>>> This patch seems to almost entirely be huge because of these
>>>>> mips test case files. Are they specific to QEMU or are they
>>>>> effectively a 3rd-party import that it doesn't make sense
>>>>> to make local changes to?
>>>>
>>>> They are imported and will unlikely be modified.
>>>
>>> Not obvious to me from git-log.
>>>
>>> Should I drop the changes to tests/tcg/mips/?
>>
>> I'd say yes. At least move them to a separate patch.
> 
> Possible status of tests/tcg/mips/:
> 
> 1. Imported, should not be modified
> 
>     Drop from the patch.
> 
> 2. Not imported, should be modified
> 
> 2a. To be reviewed separately from the remainder of the patch
> 
>      Split off.
> 
> 2b. Likewise, but nobody will care to review, realistically
> 
>      Split off and merge anyway, or drop.  I'd go for the latter.
> 
> 2c. To be reviewed together with the remainder of the patch
> 
>      Keep as is.
> 
> Which one is it?

"1. Imported, should not be modified" please :)

