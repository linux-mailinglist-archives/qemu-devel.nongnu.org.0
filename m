Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40214488EC7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 03:53:32 +0100 (CET)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6koN-0004cp-DH
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 21:53:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1n6knD-0003lp-PO
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 21:52:19 -0500
Received: from [2607:f8b0:4864:20::52e] (port=47096
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1n6knA-0008MO-2r
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 21:52:19 -0500
Received: by mail-pg1-x52e.google.com with SMTP id i8so9950586pgt.13
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 18:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=awwhCP6XphLiACndZxRFB2Xupn6PYGClmYSq0Yv0+zQ=;
 b=HUnAUDIaBTzcrGRIh/l6/+gtAYLQ++K1snGXWn90a1gIclKMTOEANqeyo2BGaezpXY
 tyvz+P31BmYmW1OZ+aNVXeX7OAxwAUVxqgff+O8aBb8c0h2v8KWwiTSLLBMxNvZqtm82
 Fz+qo6c7g2iiAFq2XqUh8KwNh0T4v69zHvJ9YCYriAFEgESxMG3582URyjw1NJVEnBYL
 QRssIyNV09+CWSBpkl0HnOet3hQGvjtrQkUO6U+Ik9O1bo4O+oTN+9ptIipeDQpf1KJ1
 KWOYDxwHhOkRRHVfWBV+NRueAQEggNjzYpp322A49AujgMkIUibquPbDQH9Hoe4Muvwm
 X7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=awwhCP6XphLiACndZxRFB2Xupn6PYGClmYSq0Yv0+zQ=;
 b=LsZPJIOTWnun7Z37YrjgdQVMO09gRarKcwEBQ0popMUvF9JfZAabK/Wq1lmkyoRhro
 TJPQL5QPogCGjyhmG1TpYaxPyxs27lVSEDnOUKQ8tjjOhJn/FrfQffs0B13bsfV/23fR
 q3S8hxs/6sXBKzjKZrGcyVxH8ExXyKfZZMRTeCBTWPqeNM2++C/Qn4biwsE4a6sEmOJw
 EczsDeJPVmQhETRhk4DpwN8gpQ2HFpXvZ9rt2gcrlw7J8rRGRhZ24cAhU5nXeQfDzLRR
 1mqiysYkD6PbZ0pAmXR91lhFd6IwkmhghAvfrMTHQsSpjC0NIbpf/8AV2U13Hm2MMqv+
 ZmXA==
X-Gm-Message-State: AOAM531Dq6OO5wC+V4EG3u6wv0NWb1EiHfeotvjBAAReBWHECPeyVI4Z
 Rabiq2PEUHeeR+FezqHSEK04qw==
X-Google-Smtp-Source: ABdhPJzWEIQZ8U69uu4kmXTg7CW85NB4o+VkkrFhtH6L1s43+pALhHb3t3uhJyJ28xuFs6MRmne53Q==
X-Received: by 2002:a63:92:: with SMTP id 140mr64397781pga.575.1641783133502; 
 Sun, 09 Jan 2022 18:52:13 -0800 (PST)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id y6sm4839358pfi.154.2022.01.09.18.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 18:52:12 -0800 (PST)
Message-ID: <4bad4da5-44b6-717c-7770-609ddd5256f0@ozlabs.ru>
Date: Mon, 10 Jan 2022 13:52:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <20220107125747.7ddfd3a0@bahia> <Ydgvt0VwFUP0MD5h@yekko>
 <20220107143910.4443af02@bahia>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220107143910.4443af02@bahia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/01/2022 00:39, Greg Kurz wrote:
> On Fri, 7 Jan 2022 23:19:03 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
>> On Fri, Jan 07, 2022 at 12:57:47PM +0100, Greg Kurz wrote:
>>> On Fri, 7 Jan 2022 18:24:23 +1100
>>> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>
>>>> "PowerPC Processor binding to IEEE 1275" says in
>>>> "8.2.1. Initial Register Values" that the initial state is defined as
>>>> 32bit so do it for both SLOF and VOF.
>>>>
>>>> This should not cause behavioral change as SLOF switches to 64bit very
>>>> early anyway.
>>>
>>> Only one CPU goes through SLOF. What about the other ones, including
>>> hot plugged CPUs ?
>>
>> Those will be started by the start-cpu RTAS call which has its own
>> semantics.
>>
> 
> Ah indeed, there's code in linux/arch/powerpc/kernel/head_64.S to switch
> secondaries to 64bit... but then, as noted by Cedric, ppc_cpu_reset(),
> which is called earlier sets MSR_SF but the changelog of commit 8b9f2118ca40
> doesn't provide much details on the motivation. Any idea ?

https://patchwork.kernel.org/project/qemu-devel/patch/1458121432-2855-1-git-send-email-lvivier@redhat.com/

this is probably it:

===
Reset is properly defined as an exception (0x100). For exceptions, the
970MP user manual for example says:

4.5 Exception Definitions
When an exception/interrupt is taken, all bits in the MSR are set to
‘0’, with the following exceptions:
• Exceptions always set MSR[SF] to ‘1’.
===

but it looks like the above is about emulation bare metal 970 rather 
than pseries VCPU so that quote does not apply to spapr.

