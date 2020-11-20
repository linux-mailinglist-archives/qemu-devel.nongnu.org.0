Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF1B2BB137
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:12:59 +0100 (CET)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9xy-0002aQ-Fp
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg9wS-0001HX-Dt; Fri, 20 Nov 2020 12:11:24 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg9wQ-0007KP-UA; Fri, 20 Nov 2020 12:11:24 -0500
Received: by mail-wr1-x444.google.com with SMTP id l1so10742748wrb.9;
 Fri, 20 Nov 2020 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iv26Ap7hnRx82/xd3BUuBa/TqmQw9eULOQHdeBaVt1w=;
 b=Ryw47rg4mE3EsyUBqiHvjsjP4bZ8kNglmnOQuxL4kEJakmAvGAkk/K+TbQdN02Uh0U
 +wH/CwXK2SGkm+KjNi15calIkPZC6qgH2dgkZ/jvuR/iwFwTw2xNuVK8ZAYmQa3DZV9V
 hqtZ+nvhUdhbakN76PO/2SOgP1et7FJwm4G7LxOzwhUehjZozZYlbxPXAlTfdq4pto7H
 tMueT7oi49y/QxIpSIw3HrvoawYRoy9cpt2aFv7ynVxHMWA0HPcVIwakOxqPZLm2c0yR
 QrjBuWdmStWI3ogl84mUD1eG7BWw2BibOb9zv06gqjBVqJEnEaG2/aDtPBPJUKUOTcwX
 oWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iv26Ap7hnRx82/xd3BUuBa/TqmQw9eULOQHdeBaVt1w=;
 b=ScFZ4WAosjQSp9onX0KhA8MZiTRD5Aj1BElBF3p3fy57a41Fx42FySw6LG3WLd+o0F
 aPfP6LFSmiPHayrS/abEPPuMcpOf0J6oVlWEgy6t3wN9ExfRjpa7o1WBfn5LA9oyill/
 /hRsMsrzzlV0eDeCUyJ9qB9TOZ2sqRfSJQAL1HxN86FeNJIjGrwIFPrumMr6/1l5rpKh
 s9690CQbF2H0Utv88AT/lwg39gwAC4WZWkvBCzICMZuXN+AlVI9kZly0/XF1onH5CxHR
 FxqXGL3O3ie6pkSW2B/E3+MClIlq+EUzomPPrjm2mEpnE8JT5SP59hbH8djFr9aJz8CP
 P6Aw==
X-Gm-Message-State: AOAM530TMch7Y5VycaFGji/IvhWByMV3V+kzHANYL6Uvf7wT32lxjeWI
 kuvUpvtiZkTyFIoH/vXN0w8=
X-Google-Smtp-Source: ABdhPJxvxsAHaWu2Z/DVcu07FuemmtD3jz+6YgRVKKEnwR9H4u7c6EscV/ApRvvTVReegPkBW9SgqA==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr18043024wrn.277.1605892281189; 
 Fri, 20 Nov 2020 09:11:21 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id h4sm5529182wrq.3.2020.11.20.09.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 09:11:20 -0800 (PST)
Subject: Re: [RFC PATCH-for-5.2 4/4] docs/system/arm: Document the Sharp
 Zaurus SL-6000
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201120152140.2493197-1-f4bug@amsat.org>
 <20201120152140.2493197-5-f4bug@amsat.org>
 <CAFEAcA-YV3d0u1UymuOw3+XbUz7aV8=U3T23pYFb0eaHxXz0aA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <44fe4478-218d-5b50-da79-d1798ff7e57a@amsat.org>
Date: Fri, 20 Nov 2020 18:11:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-YV3d0u1UymuOw3+XbUz7aV8=U3T23pYFb0eaHxXz0aA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 5:52 PM, Peter Maydell wrote:
> On Fri, 20 Nov 2020 at 15:22, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> List the 'tosa' machine with the XScale-based PDAs models.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  docs/system/arm/xscale.rst | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/system/arm/xscale.rst b/docs/system/arm/xscale.rst
>> index 89ec93e904e..2dd2f8f9a56 100644
>> --- a/docs/system/arm/xscale.rst
>> +++ b/docs/system/arm/xscale.rst
>> @@ -1,16 +1,19 @@
>> -Sharp XScale-based PDA models (``akita``, ``borzoi``, ``spitz``, ``terrier``)
>> -=============================================================================
>> +Sharp XScale-based PDA models (``tosa``, ``spitz``, ``akita``, ``borzoi``, ``terrier``)
>> +=======================================================================================
> 
> These were in alphabetical order -- why the rearrangement ?

Ah I didn't notice, I sorted by chronological order. I'll add tosa
at the end (alphabetically last).

> 
>> +
>> +The Sharp Zaurus SL-6000 (``tosa``), released in 2005, was a PDA based on the
>> +PXA255.
>>
>>  The XScale-based clamshell PDA models (\"Spitz\", \"Akita\", \"Borzoi\"
>>  and \"Terrier\") emulation includes the following peripherals:
> 
> If you want to add tosa to this file (which seems reasonable) then
> you need to rewrite this para that introduces the bulleted list
> because it currently only describes spitz/akita/borzoi/terrier,
> so that it is instead a suitable introductory paragraph that
> covers all of the boards.

OK, I think added \"Tosa\" at the end is enough.

> 
>> --  Intel PXA270 System-on-chip (ARMv5TE core)
>> +-  Intel PXA255/PXA270 System-on-chip (ARMv5TE core)
>>
>> --  NAND Flash memory
>> +-  NAND Flash memory - not in \"Tosa\"
>>
>>  -  IBM/Hitachi DSCM microdrive in a PXA PCMCIA slot - not in \"Akita\"
>>
>> --  On-chip OHCI USB controller
>> +-  On-chip OHCI USB controller - not in \"Tosa\"
>>
>>  -  On-chip LCD controller
> 
> 
> thanks
> -- PMM
> 

