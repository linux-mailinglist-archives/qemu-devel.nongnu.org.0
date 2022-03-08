Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710074D1957
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 14:37:51 +0100 (CET)
Received: from localhost ([::1]:46378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRa2A-0001Nl-1L
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 08:37:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRZvk-0007TV-5n; Tue, 08 Mar 2022 08:31:12 -0500
Received: from [2a00:1450:4864:20::330] (port=54836
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRZvf-0001Xk-5d; Tue, 08 Mar 2022 08:31:08 -0500
Received: by mail-wm1-x330.google.com with SMTP id c192so11150597wma.4;
 Tue, 08 Mar 2022 05:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d2/nFQdbtw8dz1WR4gf2oW5dDNzUqWSkviggFyOpRdw=;
 b=ALzkI8uD7JXkpHRqFtsT6saZpUb98Z9qQWvDhAiqYBy9QHBT3oaCD3oNuX4y23W80U
 Xvb6N3TwctXHkmebFP/o4+j9FbK13kB4W9cZpKS6x3JopXyLXc6TVaxvdRPIcxDXRrFH
 sfy88OGjyGAB1MwE6laWTwDbR2ZACM7diMgTDUBTlrNqMDw0CIkbVKbS12FpOl/F9299
 SORuWLb97H0tQWf9sdFa4HV1onGE9XMj41rtyBWZPHBm3mmmFd9LptygWLQIxfjnm/Zm
 cyjWfimmpKSsIex4xcKi8YAgm36d/zJMWituBi9kubgRH921LEu3+ZuonpRo9vfLhNAY
 2bIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d2/nFQdbtw8dz1WR4gf2oW5dDNzUqWSkviggFyOpRdw=;
 b=fRVUSmF4VFh26R1kc0UGkDhb91LYYaMxWMpMXSsj8QqWXaLIEgqOeqWTx+JAZhtcy9
 m2dSbilr7P2hmdO1ECJnWDgL8jvjOVt4ylX/OZQHR+nlmHOBMArW5b2DyeR6hk42Yej1
 i4pa5oQXG4AY0F6w9pwQxlZECJlRdVMLXCIAWRa2zbWhoMF+S0DpRnsicapeLl99t3wv
 B+gOBdG9x2dLBpNKMbITiNFP18+z+FwpKYeChcQBejPWJWXdUfHHuu9NMFwMjz0GEbEN
 viK+F3xMrCW3Z3s7c5h5GZVQzJIxCR6K1qx3xHEEvvKNG03UaCICQgRfxo65XMXN1f6r
 NNlA==
X-Gm-Message-State: AOAM5338cq0/gSsuS9dSgPgg25gm3LxaeyAtB/bSoy0mbySj0WAoItEC
 +ioB0y712rTwcIQZU0si6kE=
X-Google-Smtp-Source: ABdhPJz9KiRaZ3sMOMp5DEU7esOeI8woeFYwcwAo9jv3z31UVNN6dTXCgbOTofgcUbAcp+hm5iqqhA==
X-Received: by 2002:a7b:c154:0:b0:388:8e6e:ff76 with SMTP id
 z20-20020a7bc154000000b003888e6eff76mr3709574wmi.191.1646746265211; 
 Tue, 08 Mar 2022 05:31:05 -0800 (PST)
Received: from [192.168.16.175] (11.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.11]) by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm388093wri.0.2022.03.08.05.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 05:31:04 -0800 (PST)
Message-ID: <b004822f-0e12-fcce-1007-a5cecfb5430d@gmail.com>
Date: Tue, 8 Mar 2022 14:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 0/9] add LOG_UNSUPP log type + mark hcalls as unsupp
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220307191553.429236-1-danielhb413@gmail.com>
 <CAFEAcA-=--vfvh9ZddyRKfcXqoW7fnjLVcqZpyP2tM8b8vhO=A@mail.gmail.com>
 <74b35947-b6f2-6155-45de-93777545753c@gmail.com>
 <CAFEAcA9koxjGmN1X0JNHfTuAthsy50zfB93XR6OEo48QzCx3pQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA9koxjGmN1X0JNHfTuAthsy50zfB93XR6OEo48QzCx3pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: clg@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/22 10:18, Peter Maydell wrote:
> On Mon, 7 Mar 2022 at 22:00, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
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

I agree with this view. Another distinctions:

  * tracing API
    - have multiple backends to send the events
    - is optional, might be completely disabled in build
      (which is why we use it to debug or analyze perfs)

  * qemu_log() API
    - logs to stdout
    - is present in all build variants
      (so we can always look at guest misbehavior as
       Peter described).

LOG_UNSUPP doesn't add value wrt guest misbehavior IMO,
which is why I'd stick to trace events for this.

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
> 
> -- PMM
> 


