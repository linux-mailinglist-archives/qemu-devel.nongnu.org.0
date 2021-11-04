Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24A445B7C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 22:05:11 +0100 (CET)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mijv4-0005z1-2g
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 17:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1mijtG-00056c-8W
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 17:03:18 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:34421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1mijt5-00054d-OB
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 17:03:16 -0400
Received: by mail-qt1-x829.google.com with SMTP id u7so5458111qtc.1
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 14:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mrY7XYsshlWINi/ntqPQWdODsirNvwgmcp8qH3+fM8A=;
 b=DkHHN7YZKMI0PCyvRTq9Kz9g2r5EWBEz9rHfjiua/PNSLxpo0HWPgAIVENMzdRYFIf
 S8ANHLhOqt/3EBEwlJN1QViy2CVhImMzMwjlkKrwvARkbs43DhBVPlJrb4lpMbt9Iz5g
 uVNSioO91zUvgC9l94BRp94+1Qej2KpMoe0AlFY8mGVppB+dlUqCzdflTKzOV+pHIkCT
 3aTJ0LLlHu//tt77h4soDToI4jymL59FHJmMaMnzFqq/5O7qpvF+CXpx9UniUiFoyDMb
 cGrtUEk+nMe+n0Qj670sEq/d+aZWsP7JT0T25oEvFtSxbsOQ7YCe9uF/s7fYMtTfaI4/
 qfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mrY7XYsshlWINi/ntqPQWdODsirNvwgmcp8qH3+fM8A=;
 b=sDwljBtOOKqKTb+AxB6m0I9wdiEYh+djhJtzWCRyisXxHwBTP8mviHyA4Fzr9fmQ6G
 N2mAYvw0smkjcLCz+vvl0S/9FHy+8NQZ/WVUPauhDdOgHj3VUuVPZzip/+U7t0XPg0Vl
 os6EdkInqlcHxm57IzAYj0Zdap478s2k8u9onXsS9G9zlV3vlyyaHoRCr3LEqli3Od1K
 mrq6osmwGBMQ1pl63Zyp5CicBp2Faa9a6cz/lwVXPzK/8P4REkeMw0j09pkJ3Et3Iemk
 2Bogw/TWbkNYPDndJA+YeeN/KPOtQzveZYQRznnlZHi+8jS16Ma6p/MfST06v/DzbygN
 qjyg==
X-Gm-Message-State: AOAM531TdLDZ31FCQUXpYWCyLekiLwaoDWM+mBiISAmjAJ2kL3ba8rQ5
 ovNh2zVuGG2DU0TGIQsULPs8aSzgm7yN8g==
X-Google-Smtp-Source: ABdhPJwHuMCGjVDmVFBVDKiv11mcd4S6NMuV9esUYoHAh08ruWHHFXaqlCokLHixUSvUV14/8/mRfA==
X-Received: by 2002:ac8:5745:: with SMTP id 5mr32618366qtx.37.1636059785949;
 Thu, 04 Nov 2021 14:03:05 -0700 (PDT)
Received: from ?IPv6:2804:7f0:4841:487c:e9de:2240:b4c1:9cfa?
 ([2804:7f0:4841:487c:e9de:2240:b4c1:9cfa])
 by smtp.gmail.com with ESMTPSA id v22sm4888886qta.74.2021.11.04.14.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 14:03:05 -0700 (PDT)
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
From: Luis Machado <luis.machado@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de> <874kjdugip.fsf@linaro.org>
 <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de> <871regvs0w.fsf@linaro.org>
 <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
 <3c1521e5-5182-18f3-b5bf-9340745ec92f@linaro.org>
Message-ID: <e7c11bc8-e7ba-8192-e4ba-887c38f27b15@linaro.org>
Date: Thu, 4 Nov 2021 18:03:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3c1521e5-5182-18f3-b5bf-9340745ec92f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=luis.machado@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 3:44 PM, Luis Machado wrote:
> Hi,
> 
> On 9/21/21 10:55 AM, Peter Maydell wrote:
>> On Tue, 19 Jan 2021 at 15:57, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> On 1/19/21 3:50 PM, Alex Bennée wrote:
>>>>>
>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>> qemu-system-aarch64: -gdb 
>>>>>> unix:path=/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server: 
>>>>>> info: QEMU waiting for connection on: 
>>>>>> disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
>>>>>> warning: while parsing target description (at line 47): Vector 
>>>>>> "svevhf" references undefined type "ieee_half"
>>>>>> warning: Could not load XML target description; ignoring
>>>>>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>>>>>
>>>>>> Seems to indicate it is "ieee_half" -related?
>>
>>> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
>>> and there is no probing possible during the gdbstub connection. I guess
>>> I can either go back to stubbing it out (which would break gdb's SVE
>>> understanding) or up our minimum GDB version check for running tests.
>>> That would mean less people test GDB (or at least until the distros
>>> catch up) but considering it was zero people not too long ago maybe
>>> that's acceptable?
>>
>> I just ran into this trying to connect qemu-aarch64 to the
>> Ubuntu gdb-multiarch. I don't care about SVE at all in this
>> case, but the 'max' CPU includes SVE by default, so we report
>> it to gdb even if the guest program being run doesn't use SVE at all.
>> This effectively means that usecases that used to work no longer do :-(
>>
>> Luis: do we really have to report to gdb all the possible
>> data types that might be in SVE vector registers? Won't
>> gdb autogenerate pseudoregisters the way it does with
>> Neon d0..d31 ?
>>
>> thanks
>> -- PMM
>>
> 
> I'll check what can be done here.

Apologies. I got sidetracked with a few other things. I'm getting back 
to this one.

I'm guessing the less painful solution would be for QEMU to report a 
more compact XML description for SVE, supported by the oldest GDB we 
would like to validate things on, and leave it to GDB (newer releases) 
to add whatever pseudo-registers it deems appropriate.

