Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A432764A343
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:28:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jmG-0004YE-IT; Mon, 12 Dec 2022 09:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p4jlz-0004TV-JQ
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:27:15 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p4jlw-00063l-J8
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:27:15 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1322d768ba7so8523794fac.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GkEXcT5Q5eZkD+yzEE7ImunkEiPaZMtYQlQRNPeNZrM=;
 b=cs7G+ZOdc02WnC4HnuKgYlvisoLJrVY/CbknWcpJT1taeqU8S/gFdfWmAUkmvE2zXG
 H0C2L22mk7QoF3AUtDk0fXdpBrNvb926Cd56yoH3u+8xvUj5ntSou3S4ufip66ONbn2X
 Ruj/zIFtLGRQdX+CbH+ZV848jKnWWUFpULO9g4evgUX57x9Es5AZo7c5a4RLS9IuJqEr
 GavaYvE8S/vJykmfe+NEkn7myrdlEmS+9WqyaXOFF2nWTK9fXn/0WAHs1MJhm2/K0APR
 +BlDBjAVeonZmn3klao96DCbJAi5H/pmZ4zDr8mrGSL7rWZMkuCNkaBf9x5qSoXoXQwO
 22tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GkEXcT5Q5eZkD+yzEE7ImunkEiPaZMtYQlQRNPeNZrM=;
 b=R5QuToLIr1oHW1XoFmgLZZ0Cx25uplghoOE2UW8yehQ9Fzu8AweD/fW5rSYL82NM+p
 7dZJJGRNBbgVaPGQlOflSY30XQV/NDNtAn9BznTEReZ6XObQUQgLN8sIHDvhyc3fTSGY
 UclnoeLs3fL3UEN8K3icCGw0FGlK99cJs2GvU5UbN7Uf9qYbdyFS1TKd4uHRNDvnjQGu
 VLwBhARmaU/tR8p9H7KSCb3t18tFIj+1ZulQEaL/uKxLI4mY8KiYgpI68RwF81cDu6CM
 fcsR3Z0aFHcNVL/Qx62jA9CvZemAT3s3pXa7SI3V/dnpKMVwcEUW5vDdCYavVeQeownz
 TELw==
X-Gm-Message-State: ANoB5pmYKSuOBV+wlm8XgASRRa1ukNy6YxYbFgKgVszQMc31lax421A8
 Ym6dhY+44xTd2Oscxx4p5zo=
X-Google-Smtp-Source: AA0mqf4GVTXWSk4YYgdx5p2vVLqevZOBwczqvNN+WDX6U+YkzSsBSLRtY2laxpJ1hzB7NIFV7b58oA==
X-Received: by 2002:a05:6870:7c15:b0:144:24b5:c4cc with SMTP id
 je21-20020a0568707c1500b0014424b5c4ccmr7560201oab.46.1670855230405; 
 Mon, 12 Dec 2022 06:27:10 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 fp14-20020a056870658e00b00143d4709a38sm4957199oab.55.2022.12.12.06.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:27:09 -0800 (PST)
Message-ID: <81a71baf-3339-9928-b0b8-49f2168ffa57@roeck-us.net>
Date: Mon, 12 Dec 2022 06:27:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net> <Y5GPRiO0g2mgA3FS@cormorant.local>
 <Y5GbbF68N5ZiYNdv@cormorant.local> <20221208184740.GA3380017@roeck-us.net>
 <20221208201353.GA928427@roeck-us.net>
 <20221208203955.GA1367659@roeck-us.net> <Y5b7Mdtklu0xA5bJ@cormorant.local>
 <c09eaf86-f6b1-cc74-1732-e3c7576e9d88@roeck-us.net>
 <Y5cwjfmTN4SVcZdk@cormorant.local>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
In-Reply-To: <Y5cwjfmTN4SVcZdk@cormorant.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=groeck7@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 12/12/22 05:45, Klaus Jensen wrote:
> On Dec 12 05:39, Guenter Roeck wrote:
>> On 12/12/22 01:58, Klaus Jensen wrote:
>>> On Dec  8 12:39, Guenter Roeck wrote:
>>>> On Thu, Dec 08, 2022 at 12:13:55PM -0800, Guenter Roeck wrote:
>>>>> On Thu, Dec 08, 2022 at 10:47:42AM -0800, Guenter Roeck wrote:
>>>>>>>
>>>>>>> A cq head doorbell mmio is skipped... And it is not the fault of the
>>>>>>> kernel. The kernel is in it's good right to skip the mmio since the cq
>>>>>>> eventidx is not properly updated.
>>>>>>>
>>>>>>> Adding that and it boots properly on riscv. But I'm perplexed as to why
>>>>>>> this didnt show up on our regularly tested platforms.
>>>>>>>
>>>>>>> Gonna try to get this in for 7.2!
>>>>>>
>>>>>> I see another problem with sparc64.
>>>>>>
>>>>>> [    5.261508] could not locate request for tag 0x0
>>>>>> [    5.261711] nvme nvme0: invalid id 0 completed on queue 1
>>>>>>
>>>>>> That is seen repeatedly until the request times out. I'll test with
>>>>>> your patch to see if it resolves this problem as well, and will bisect
>>>>>> otherwise.
>>>>>>
>>>>> The second problem is unrelated to the doorbell problem.
>>>>> It is first seen in qemu v7.1. I'll try to bisect.
>>>>>
>>>>
>>>> Unfortunately, the problem observed with sparc64 also bisects to this
>>>> patch. Making things worse, "hw/nvme: fix missing cq eventidx update"
>>>> does not fix it (which is why I initially thought it was unrelated).
>>>>
>>>> I used the following qemu command line.
>>>>
>>>> qemu-system-sparc64 -M sun4v -cpu "TI UltraSparc IIi" -m 512 -snapshot \
>>>>       -device nvme,serial=foo,drive=d0,bus=pciB \
>>>>       -drive file=rootfs.ext2,if=none,format=raw,id=d0 \
>>>>       -kernel arch/sparc/boot/image -no-reboot \
>>>>       -append "root=/dev/nvme0n1 console=ttyS0" \
>>>>       -nographic -monitor none
>>>>
>>>
>>> Hi Guenter,
>>>
>>> Thank you very much for the detailed reports and I apologize for the
>>> fallout of this.
>>>
>>> I think this is related to missing endian conversions when handling the
>>> shadow doorbells. I'm not sure if there is a kernel issue here as well,
>>> because as far as I can tell, the shadow doorbells are updated like so:
>>>
>>>     old_value = *dbbuf_db;
>>>     *dbbuf_db = value;
>>>
>>> (where `value` is the new head/tail value depending on if this is an sq
>>> or cq).
>>>
>>> Keith, is the kernel doing something magically here I am not aware of,
>>> or isn't this missing some cpu_to_le32() / le32_to_cpu() calls as well?
>>
>> Wouldn't that mean that nvme doorbell support would be broken in Linux
>> on all big endian systems ? Maybe it is, but it seems a bit unlikely.
>>
> 
> No, not broken in general - only for shadow doorbells. On regular MMIO,
> the linux helpers takes care of endianness (and so does the MMIO
> callbacks in QEMU). However, for shadow doorbells, the doorbell value is
> written to host memory - and Linux (and QEMU) does not handle that
> correctly wrt. endianness.
> 
> I got it all working with the series I just posted for QEMU (v4) and
> fixing endianness conversion for the above in the kernel (patch pending
> for linux-nvme).

Hmm, interesting. I guess I'll wait for the Linux patch to be posted.

That makes me wonder, though: Are the Linux changes really necessary ?
If this never worked, would it be possible to adjust the qemu code
in a way that it just works with the existing Linux code ?

Alternatively, would it be possible to add a runtime flag to qemu
that would let me disable shadow doorbell support ? I am testing
all Linux kernel branches, and without such a flag I'd have to carry
a patch just disabling it in qemu until all kernel branches are fixed
(if that ever happens).

Thanks,
Guenter


