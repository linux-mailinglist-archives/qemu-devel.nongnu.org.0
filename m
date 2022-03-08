Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A304D1826
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 13:45:19 +0100 (CET)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRZDJ-0005yV-Vc
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 07:45:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRZ2T-0007mw-7L; Tue, 08 Mar 2022 07:34:05 -0500
Received: from [2607:f8b0:4864:20::22c] (port=39505
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRZ2M-0008J6-Oo; Tue, 08 Mar 2022 07:34:00 -0500
Received: by mail-oi1-x22c.google.com with SMTP id j83so7944504oih.6;
 Tue, 08 Mar 2022 04:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Q2sRve6wyRrbxxsWXXKaNo6icEOZn5EadGXkmEQ80wI=;
 b=ZsPGKeMZmfD0ZMTTUGko1PFJMNX43I/hokktet5Rtkv7M9jWMn+Hyx+8cvOMiU6klK
 fiPa0nX23G4Uu4UQ+xUt7LYcHefUCzLjS3ds3qn9VQtIi9+PvofgGM509wkKFvEyvpWt
 ejGx/RzM8PmjtS9ELHhdJ38295V1MTpUo7WIcLmPBVqGlU9nbVRAPkVO/XPGZvny9Tdo
 bGTzcqyuDfN0eqUMvQZ+HBx/p7dliVEj8DrRfswWmFjlnj5TkOtGNZHrl9/4jLE9kFf1
 MyZLo9zWPXampjdGdo6BK03zuRX97lbcG3Ai84VISRh0KpY+exDMcMQnUKZNLOyJMPTZ
 j3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q2sRve6wyRrbxxsWXXKaNo6icEOZn5EadGXkmEQ80wI=;
 b=ypW8NzW6TCCIMhuZh3hL+ONEt4VwTGtRf26zJ8jbiAPHD+IwYUk50u8N12ecAYh2DT
 NQupF/Dv7nvaj1Bj9ovLAPPlnr1E2egv0ZjZaH1jF1kplD37DN+AfR6OHgtv701/wToH
 /SqE+B3d/13RLw5OTKurJ9dc55fQvLa7K2t6UU6ckRtMJEgmfhbU4M9Tfvzukxvf1CNl
 kOa1YD+3SyZihbgWKuJztBdGDJO4UhH5FOuwGnN2m0G+zDXlvGjI8TJPVsNBEjCsZCWT
 lFFCZIa2/fQrVB9JV9ZPQQJqTIpl4WJTDDi+dgyO29jhfob3/M4O1i0URXA7YyfBRYaZ
 OO3g==
X-Gm-Message-State: AOAM53020DTPRlOlbESf+gdS1/pk82mhzO29PP//PkcBrj5FaUq+hBDp
 69U2q8nZyZNSpgwzZ/oACp0=
X-Google-Smtp-Source: ABdhPJwjDX04TiT7ggEROeg6+Ibq5vYyKg0VMF/sVRiygNmiBXPd2rVioPdDBEczmXADP/FwcdiixA==
X-Received: by 2002:a05:6808:179b:b0:2d9:6d5a:1a70 with SMTP id
 bg27-20020a056808179b00b002d96d5a1a70mr2407640oib.102.1646742837278; 
 Tue, 08 Mar 2022 04:33:57 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6?
 ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a9d4d03000000b005b236de8911sm2592474otf.24.2022.03.08.04.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 04:33:56 -0800 (PST)
Message-ID: <c1018b88-c371-f662-dcc7-4406b9298cb3@gmail.com>
Date: Tue, 8 Mar 2022 09:33:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/9] add LOG_UNSUPP log type + mark hcalls as unsupp
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220307191553.429236-1-danielhb413@gmail.com>
 <CAFEAcA-=--vfvh9ZddyRKfcXqoW7fnjLVcqZpyP2tM8b8vhO=A@mail.gmail.com>
 <74b35947-b6f2-6155-45de-93777545753c@gmail.com>
 <CAFEAcA9koxjGmN1X0JNHfTuAthsy50zfB93XR6OEo48QzCx3pQ@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFEAcA9koxjGmN1X0JNHfTuAthsy50zfB93XR6OEo48QzCx3pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/8/22 06:18, Peter Maydell wrote:
> On Mon, 7 Mar 2022 at 22:00, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
>>
>>
>>
>> On 3/7/22 17:21, Peter Maydell wrote:
>>> On Mon, 7 Mar 2022 at 19:19, Daniel Henrique Barboza
>>> <danielhb413@gmail.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> I got a lot of noise trying to debug an AIX guest in a pseries machine when running with
>>>> '-d unimp'. The reason is that there is no distinction between features
>>>> (in my case, hypercalls) that are unimplemented because we never considered,
>>>> versus features that we made a design choice not to implement.
>>>>
>>>> This series adds a new log type, LOG_UNSUPP, as a way to filter the
>>>> second case. After changing the log level of existing unsupported
>>>> pseries hypercalls, -d unimp was reporting just the ones that I need to
>>>> worry about and decide whether we should implement it or mark as
>>>> unsupported in our model. After this series there's still one hypercall
>>>> thgat is being thrown by AIX. We'll deal with that another day.
>>>
>>> So the intention of the distinction is:
>>>     LOG_UNIMP: we don't implement this, but we should
>>>     LOG_UNSUPP: we don't implement this, and that's OK because it's optional
>>>
>>> ?
>>
>> The idea is that LOG_UNIMP is too broad and it's used to indicate features that are
>> unknown to QEMU and also features that QEMU knows about but does not support it. It's
>> not necessarily a way of telling "we should implement this" but more like "we know/do
>> not know what this is".
> 
>  From the point of view of debugging the guest, I don't care
> whether the QEMU developers know that they've not got round
> to something or whether they've just forgotten it. I care
> about "is this because I, the guest program, did something wrong,
> or is it because QEMU is not completely emulating something
> I should really be able to expect to be present". This is why we
> distinguish LOG_UNIMP from LOG_GUEST_ERROR.
> 
>>> I think I'd be happier about adding a new log category if we had
>>> some examples of where we should be using it other than just in
>>> the spapr hcall code, to indicate that it's a bit more broadly
>>> useful. If this is a distinction that only makes sense for that
>>> narrow use case, then as Philippe says a tracepoint might be a
>>> better choice.
>>
>> target/arm/translate.c, do_coproc_insn():
> 
>> This use of LOG_UNIMP is logging something that we don't know about, it's unknown.
> 
> (Some of the things that get logged here will really be things that
> we conceptually "know about" and don't implement -- the logging
> is a catch-all for any kind of unimplemented register, whether the
> specs define it or not.)
> 
>> And hw/arm/smmuv3.c, decode_ste():
> 
>> This is something we know what it is and are deciding not to support it. Both are being
>> logged as LOG_UNIMP. This is the distinction I was trying to achieve with this new
>> log type. The example in decode_ste() could be logged as LOG_UNSUPP.
> 
> I don't see much benefit in distinguishing these two cases, to be
> honest. You could maybe have sold me on "you're accessing something
> that is optional and we happen not to provide it" vs "you're
> accessing something that should be there and isn't", because that's
> a distinction that guest code authors might plausibly care about.
> To the extent that you want to helpfully say "this is because
> QEMU doesn't implement an entire feature" you can say that in the
> free-form text message.


Fair enough. I'll rely on tracepointing the cases where I think this distinction
is helpful for debugging.



Thanks,


Daniel

> 
> -- PMM

