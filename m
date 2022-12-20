Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED17E6521DF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:59:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d79-0000Sd-EO; Tue, 20 Dec 2022 08:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7d70-0000Pd-01
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:56:54 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7d6x-0001ig-JT
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:56:53 -0500
Received: by mail-wm1-x329.google.com with SMTP id ay40so8805721wmb.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 05:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=yGdWNmigLciq8VDpUuSbIm/R4NbXICUTV1Yafo096FQ=;
 b=cOYZa8Itifino7MLehd/u4VZCzJaLfYNLOZo7N+WSCHLSWmGHHVvTR1Ry+ye5LcJ/K
 0yWJjGt5kb26WwIoKC0TR/R+oXDuAR4fl47HUaFUk1QeGkwvyhQ8FJDKnwyQuwQHVKMY
 gtfk4J+qhEItvIRGbAkm5iI7ZIkkgUcqkwwzTFT8ScguC18MsklG5x0jfnSNSxE0Vxjt
 w6gov7N9RvZSr1R0m1cbWcx2ODXAkGH3EUYS4rcZkzQkouS91EBaYUBMXKmh1UZFnswd
 k/2Pvo3H1//krM9zwZ5oQZtmtmFcjAWrKA0OH+KZodjqSdoPXWo9Ar5h6Hp0My+inQaN
 t1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yGdWNmigLciq8VDpUuSbIm/R4NbXICUTV1Yafo096FQ=;
 b=D6OwAR/PiPriJx6V3L5isZz7aJColoKEdtoC0NymKiqpCvD2EgBHeLznCzxrMavNgO
 r3pTBoyZgXN3t2Stt+apUgWkJkNetD8cSiEvCEvrp2ELwyMI4KKIadE+6wPmjFmaW3uN
 nGIWpyd9dj9Y7khN1LQHpMmJpXmaBPYCshTx/c0igXKvjhydGeKLzY0NrnQAPcQ4YNxy
 hM/Pw2elyYRfX3klmTjRJQE3PfaGN/XijhsPF/176Np46yfgEvCUf/zeXTuiapSHK/Ru
 wHcD616KUPZ9V0iGtlsYCmJtapOfy0tsbBMygPn7b2TCrLS63XdZcUZX6S4m2kc7/S5A
 Pw3Q==
X-Gm-Message-State: ANoB5pkMmNu4er7YHKbq5bFxekrtptD1ERCUTLE3fSE5hcnecE9PaO5J
 eXmsU1YCHomgi5r/AKK9wMU=
X-Google-Smtp-Source: AA0mqf4RNFZQIIkX5UEeE2eTA0BWWHdACejJwYfczA5qwQ7kEYYCZBhaAVpGoAWwvJ3WOFAwmT/Y/Q==
X-Received: by 2002:a1c:5404:0:b0:3d0:a531:5413 with SMTP id
 i4-20020a1c5404000000b003d0a5315413mr34017169wmb.34.1671544602053; 
 Tue, 20 Dec 2022 05:56:42 -0800 (PST)
Received: from [192.168.6.89] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a05600c341800b003d1de805de5sm14858559wmp.16.2022.12.20.05.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 05:56:41 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <bec6ab0c-c73e-f5f8-f4a3-e35aa0501e6e@xen.org>
Date: Tue, 20 Dec 2022 13:56:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v2 20/22] i386/xen: HVMOP_set_param /
 HVM_PARAM_CALLBACK_IRQ
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-21-dwmw2@infradead.org>
 <f4b7feff-c41a-25c6-d098-c4eab9b94eb1@xen.org>
 <9dbe4265d43063348a8fe6ddd2b732615f0631b9.camel@infradead.org>
 <65ccf311-be94-7cf2-6610-360549b547ab@xen.org>
 <eba6ab55c8fa4bf889744287d006a5c085ba8976.camel@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <eba6ab55c8fa4bf889744287d006a5c085ba8976.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 15/12/2022 20:54, David Woodhouse wrote:
> On Mon, 2022-12-12 at 16:39 +0000, Paul Durrant wrote:
>> On 12/12/2022 16:26, David Woodhouse wrote:
>>> On Mon, 2022-12-12 at 16:16 +0000, Paul Durrant wrote:
>>>> On 09/12/2022 09:56, David Woodhouse wrote:
>>>>> From: Ankur Arora <ankur.a.arora@oracle.com>
>>>>> The HVM_PARAM_CALLBACK_IRQ parameter controls the system-wide event
>>>>> channel upcall method.  The vector support is handled by KVM internally,
>>>>> when the evtchn_upcall_pending field in the vcpu_info is set.
>>>>> The GSI and PCI_INTX delivery methods are not supported. yet; those
>>>>> need to simulate a level-triggered event on the I/OAPIC.
>>>>
>>>> That's gonna be somewhat limiting if anyone runs a Windows guest with
>>>> upcall vector support turned off... which is an option at:
>>>>
>>>> https://xenbits.xen.org/gitweb/?p=pvdrivers/win/xenbus.git;a=blob;f=src/xenbus/evtchn.c;;hb=HEAD#l1928
>>>>
>>>
>>> Sure. And as you know, I also added the 'xen_no_vector_callback' option
>>> to the Linux command line to allow for that mode to be tested with
>>> Linux too:
>>> https://git.kernel.org/torvalds/c/b36b0fe96a
>>>
>>>
>>> The GSI and PCI_INTX modes will be added in time, but not yet.
>>
>> Ok, but maybe worth calling out the limitation in the commit comment for
>> those wishing to kick the tyres.
> 
> Hm... this isn't as simple in QEMU as I hoped.
> 
> The way I want to handle it is like the way that VFIO eventfd pairs
> work for level-triggered interrupts: the first eventfd is triggered on
> a rising edge, and the other one is a 'resampler' which is triggered on
> EOI, and causes the first one to be retriggered if the level is still
> actually high.
> 
> However... unlike the kernel and another VMM that you and I are
> familiar with, QEMU doesn't actually hook that up to the EOI in the
> APIC/IOAPIC at all.
> 
> Instead, when VFIO devices assert a level-triggered interrupt, QEMU
> *unmaps* that device's BARs from the guest so it can trap-and-emulate
> them, and each MMIO read or write will also trigger the resampler
> (whether that line is currently masked in the APIC or not).
> 
> I suppose we could try making the page with the vcpu_info as read-only,
> and trapping access to that so we spot when the guest clears its own
> ->evtchn_upcall_pending flag? That seems overly complex though.
> 
> So I've resorted to doing what Xen itself does: just poll the flag on
> every vmexit. Patch is at the tip of my tree at
> https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv
> and below.
> 
> However, in the case of the in-kernel irqchip we might not even *get* a
> vmexit all the way to userspace; can't a guest just get stuck in an
> interrupt storm with it being handled entirely in-kernel? I might
> decree that this works *only* with the split irqchip.
> 
> Then again, it'll work *nicely* in the kernel where the EOI
> notification exists, so I might teach the kernel's evtchn code to
> create those eventfd pairs like VFIO's, which can be hooked in as IRQFD
> routing to the in-kernel {IOA,}PIC.

The callback via is essentially just another line interrupt but its 
assertion is closely coupled with the vcpu upcall_pending bit. Because 
that is being dealt with in-kernel then the via should be dealt with 
in-kernel, right?

   Paul

