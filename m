Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC24AA48A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 00:41:44 +0100 (CET)
Received: from localhost ([::1]:44344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG8Cx-0003J2-Uc
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 18:41:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG8Bf-0002Uo-Ac
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 18:40:19 -0500
Received: from [2607:f8b0:4864:20::102e] (port=39650
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG8Bc-0001Ae-QN
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 18:40:18 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso517332pjt.4
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 15:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IscyioCbvdpXCGwq79cVdEYgB5VS/yeJagXhwDiwMjU=;
 b=OUvuOVw2bS2FAK18uzdujQziozduL/6Yu8urhcOJfnrlsSBV+kEXW9gj8fVDGU67XQ
 qzEhXVYunGwS7rYP9BlQZ4/K3cpDCEzfvwhQP6Bfy3L2Jlrn5k75rWRhFs0qjbcAz7BO
 UX9FDakDX+qwgBNGlqd3Fn6Wx2u2L8V/IuXn9d+cZYrdLmPwQG1tuGhmza5sIFlZGBqq
 hsGoIYvWB5zXp85WM2U2vIbh0OxTNG24BH7Sdfm1bxlT/taR5t7ABiQvAk8sPIe0OkaV
 RZl2vk4Spp3jU4LJWx48lMhlsPVnuv9JxMp1bGVsapsSXXsS7GKB5t1zdD0LoQjclCJ+
 0wVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IscyioCbvdpXCGwq79cVdEYgB5VS/yeJagXhwDiwMjU=;
 b=Wf7PXhebHm2G9QhclJGL1vzu0DJcn3d3YoVCsfybpDHSoNfx74MR8Re23t0yZkymW4
 Yylhz4yZ/GMLbxxR004FkYcPTXb4+R9EYLJdSyPw/PcTOMIeqKmwEUscIA3mWEONH9vb
 ssnygNUarASVbvehbpPMOPoDiilgGC4AoVVVVLrjQfUEMmgcOWolu1LbFWQJdKS+k33u
 zC4ojdkmBcp25jVYkRiLV44ACWIDCp9PwktQf4zggG0Y5ihFDkHSRJ8l36glsL6kv7uY
 ACNJeoTqTm5H2exeqPIbdfvblCp6JDwXZVzljdVrV1y6qHT/uPBKU7OjJE6p6azrXSZi
 XdaA==
X-Gm-Message-State: AOAM531G/Kba6N4CzevOFADcOv/AvfihMnjm75Jja9lhf9NI9NN+d0KX
 pg2qPZuE/gCNtg+0SVnTXe4=
X-Google-Smtp-Source: ABdhPJy/CU0b0IJOCSldrA8G6OGvw0mJ9BSWz913Mwl96J6ghDFtszlwY2tigAGe83zHrsf+EaopUQ==
X-Received: by 2002:a17:902:7ec1:: with SMTP id
 p1mr5264978plb.159.1644018015427; 
 Fri, 04 Feb 2022 15:40:15 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q140sm2592931pgq.7.2022.02.04.15.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 15:40:15 -0800 (PST)
Message-ID: <715f5c73-a24b-73ae-c767-050cc3ddcbe0@amsat.org>
Date: Sat, 5 Feb 2022 00:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 4/4] qapi/meson: Restrict machine-specific objects to
 sysemu
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220204152924.6253-1-f4bug@amsat.org>
 <20220204152924.6253-5-f4bug@amsat.org>
 <13f62b30-49b5-4635-4b9d-4eb5a3e8e7a6@redhat.com>
In-Reply-To: <13f62b30-49b5-4635-4b9d-4eb5a3e8e7a6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/2/22 18:00, Paolo Bonzini wrote:
> On 2/4/22 16:29, Philippe Mathieu-Daudé via wrote:
>> machine/ and net/ are only useful to machines;
>> block/ and migration/ to machine or tools.
>>
>> Note we need to keep building machine.json generated sources
>> on all targets because some want to access X86CPUFeatureWordInfo
>> from any architecture ¯\_(ツ)_/¯ Otherwise we get on all but
>> x86 targets:
>>
>>    /usr/bin/ld: libqemu-i386-linux-user.fa.p/target_i386_cpu.c.o: in 
>> function `x86_cpu_get_feature_words':
>>    ../target/i386/cpu.c:4587: undefined reference to 
>> `visit_type_X86CPUFeatureWordInfoList'
>>    collect2: error: ld returned 1 exit status
> 
> I suppose you mean "on all but x86 hosts", since it links 
> libqemu-i386-linux-user.fa.p?  But I don't understand how that happens. 
>   Is it related to
> 
> { 'struct': 'DummyForceArrays',
>    'data': { 'unused': ['X86CPUFeatureWordInfo'] } }
> 
> and if so can DummyForceArrays be moved to machine-target.json together 
> with X86CPUFeatureWordInfo, and under 'if': 'TARGET_I386'?

Err this one is not an *arch* problem, but a user/system one (sorry I
got confused with another one). Here the problem is it is not trivial
to restrict visit_type_X86CPUFeatureWordInfoList() to sysemu.

So machine.json must be in qapi_all_modules[] even if !have_system.

