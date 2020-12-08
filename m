Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23AB2D2BDE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 14:29:04 +0100 (CET)
Received: from localhost ([::1]:53178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmd39-00081E-Cw
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 08:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmd24-0007bI-BY
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmd21-0002yi-GD
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607434072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8li1gQRD1ZYo3ACILf/FwOdiRVsfmEcVnFc7r4uhfGk=;
 b=f1/gm1JRO2H7EYNSby7XReXOcts3zkWSG5GdPTYpt31eAyF+zt0O3+ohxcWRMH3Lu2aRB3
 j5yp98x58dCAESsRRfzFMljgr4IWxOAyvlMWS4d+IIEEyeF24r4fTm4W69Q3BYxH1uCqjm
 vbcMdopmfBf0Xd8nTdnfHrs8sInJcug=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-7XxMlhlfNByjZAIktA-HxQ-1; Tue, 08 Dec 2020 08:27:49 -0500
X-MC-Unique: 7XxMlhlfNByjZAIktA-HxQ-1
Received: by mail-ed1-f70.google.com with SMTP id l33so3975979ede.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 05:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8li1gQRD1ZYo3ACILf/FwOdiRVsfmEcVnFc7r4uhfGk=;
 b=KRCMiY7pDlRe8TURLM78yFfiwNlwneVWayxFinzCSfX8uWKe+mPOJ3qmBLjw+adnlL
 am23QANnX7egdvCkSUNwXSiW/s0rs+0QclBJSeHDMq5r1pCXzURSojH+pYLIx7XjuzQ6
 9DfS+21C/1wpFBI3BUvO7UJM0Eimia24BlPmrZDR55chbK2ckJYQZqWOYqwYzZM/UYcb
 BiO4m36HJAt30P8R7nFu5w0xfrDKCpgZYVu0zpZAgkltr1LUcMrhwN3gCKNjgHuyfeLc
 PJW/9zbUteBjbDdq5iILMEb5Wmve2PT/5vReR7UBafYHuQAZa4NnxxZGCfdNIWekkw9y
 4Itg==
X-Gm-Message-State: AOAM5328nojcYG46DvelssW/GWmkAPcQR/2cFMy7SnIJS8JsRc2yaBbG
 Bd5Jk5OXuv72LNHXSwDMqZjW16uJsVlc4pWleKJUPZbAi8J456qPOdQb9IMSXxtWC1w045Ms6cK
 jQHVECfjtIR3suxQ=
X-Received: by 2002:a17:906:4756:: with SMTP id
 j22mr23969362ejs.353.1607434067954; 
 Tue, 08 Dec 2020 05:27:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxu3F4E6WfiePOypjYYdsq9hht5OBcAquMg75FNaBu1o47RZWsscYrYLjS9tc7ugbEE/bmNfQ==
X-Received: by 2002:a17:906:4756:: with SMTP id
 j22mr23969346ejs.353.1607434067751; 
 Tue, 08 Dec 2020 05:27:47 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j10sm17262992edj.97.2020.12.08.05.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 05:27:46 -0800 (PST)
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
 <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
 <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
 <20201207212638.GI1289986@habkost.net>
 <CAFEAcA_CNHucoBoq9_jWw9HLc_WneYko5s42z853NVJZdLCGuQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d3113905-fd76-28ee-8e6a-7a8dd5d3a3ee@redhat.com>
Date: Tue, 8 Dec 2020 14:27:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_CNHucoBoq9_jWw9HLc_WneYko5s42z853NVJZdLCGuQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Dongjiu Geng <gengdongjiu@huawei.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 10:50 PM, Peter Maydell wrote:
> On Mon, 7 Dec 2020 at 21:26, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> My understanding is that there's no reason for ARM KVM to use
>> another approach, and that CPUClass.do_interrupt is not really
>> TCG-specific.
>>
>> Do we have any case where the CPUClass.do_interrupt
>> implementation is really TCG-specific, or it is just a
>> coincidence that most other accelerators simply don't to call the
>> method?  It looks like the only cases where the
>> CPUClass.do_interrupt assignment is conditional on CONFIG_TCG are
>> i386 and s390x.
> 
> Looking at PPC, its kvm_handle_debug() function does a
> direct call to ppc_cpu_do_interrupt(). So the code of
> its do_interrupt method must be ok-for-KVM, it's just that
> it doesn't use the method pointer. (It's doing the same thing
> Arm is -- if a debug event turns out not to be for QEMU itself,
> inject a suitable exception into the guest.)
> 
> So of our 5 KVM-supporting architectures:
> 
>  * i386 and s390x have kernel APIs for "inject suitable
>    exception", don't need to call do_interrupt, and make
>    the cc->do_interrupt assignment only ifdef CONFIG_TCG,
>    so that the code for do_interrupt need not be compiled
>    into a KVM-only binary. (In both cases the code for the
>    function is in a source file that the meson.build puts
>    into the source list only if CONFIG_TCG)
>  * ppc and arm both need to use this code even in a KVM
>    only binary. Neither of them #ifdef the cc->do_interrupt
>    assignment, because there's not much point at the moment
>    if you're not going to try to compile out the code.
>    ppc happens to do a direct function call, and arm happens
>    to go via the cc->do_interrupt pointer, but I don't
>    think there's much significance in the choice either way.
>    In both cases, the only places making the call are within
>    architecture-specific KVM code.
>  * mips KVM does neither of these things, probably because it is
>    not sufficiently featureful to have run into the cases
>    where you might want to re-inject an exception and it's
>    not being sufficiently used in production for anybody to
>    have looked at minimising the amount of code in a
>    KVM-only QEMU binary for it.
> 
> So in conclusion we have a basically 50:50 split between
> "use the same do_interrupt code as TCG" and "have a kernel
> API to make the kernel do the work", plus one arch that
> probably hasn't had to make the choice yet.   ¯\_(ツ)_/¯

Why not introduce KVMCpuOperations similar to TCGCpuOperations
Claudio is introducing, and declare the do_interrupt(CPUState*)
in both structures?

Then we can assign the same handler to both fields, TCG keeps
calling cc->tcg->do_interrupt(), KVM calls cc->kvm->do_interrupt().
This allow building with a particular accelerator, while staying
compliant with the current 50:50 split...

> 
>> Oh, I thought you were arguing that CPUClass.do_interrupt is
>> not TCG_specific.
> 
> Well, I don't think it really is TCG-specific. But as
> a pragmatic thing, if these two lines in the Arm code
> are getting in the way of stopping us from having a
> useful compile-time check that code that's not supposed
> to call this method isn't calling it, I think the balance
> maybe leans towards just making the direct function call.
> I guess it depends whether you think people are likely to
> accidentally make cc->do_interrupt calls in non-target-specific
> code that gets used by KVM (which currently would crash if that
> code path is exercised on x86 or s390x, but under the
> proposed change would become a compile error).
> 
> thanks
> -- PMM
> 


