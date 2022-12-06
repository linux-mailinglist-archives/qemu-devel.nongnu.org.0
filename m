Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11F7643DF2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:59:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SqE-0002kP-2j; Tue, 06 Dec 2022 02:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SqC-0002k5-1f
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:58:12 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SqA-0001it-5z
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:58:11 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h7so16261786wrs.6
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l2x/opWv6+CykHb4vHRz4ZeFuXFJY6rL1490xLyP2io=;
 b=viodZ2qxjCu61XNlUr9loawI5+pubQbAXuvnq1sm+RaWzNRJFHelZmAmQqP++x+iMp
 sjrJDOVPqDW9xbNoYX5nTQ6poyAsqJobaetpuflckSHuC5qnxZVNaBRMk/WHfY/rN6FR
 e4noTlZ4johWrPhQXo/aL7O/bz1Q5DlVlpRNkmk4uNPxpgi/bcsM2n5kXOzoMaikqfSj
 2sUPgSE4/i6qaamUtPmslkaiSeQwDckKPj0ep5xtoZfUfaegNvm5MzwEBj55sdt3AjE/
 rXIQkhAexnj8QTwItYHU4YilVrTUb3IrphZNMtPHKR5Pfn8A3A6IbsFvipOQzSqrSFIB
 G5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l2x/opWv6+CykHb4vHRz4ZeFuXFJY6rL1490xLyP2io=;
 b=ZB6x6jI11TGn25j1gYiOdRD5TF7a3+k9MGobmEpDDFzwMc18VoHaThka9ORwn3Ccfl
 JIuYYU5ulhpPWp19aXtzYCjKJujs8bN6JFmza7hOtABjIuBWddoEObuiYwQ4d/Kx18xT
 fVdSiDx20RERJRwg7TPSZaAms/zUfr7pjfQ6YrhaTCnw0/u786bxKfD4BGHbvnkovkbt
 Bpm86A2w6yp6GuInS6excPmrJuI8JVaocb2Di1a47GECPhARbS/Fc2Ecou3NL747Wo/h
 i/SXS9x1mIjd3hIWYcYcD8rsr/g25+ZYjnGG2AVxLqTJ5bWrWCQtPLS0FUcqpwU5MqA1
 neqA==
X-Gm-Message-State: ANoB5pkmHJF3tl9tlPz+6ulwNjWKYvfeF36V89bLNZpuSL/Mz5S00/98
 8NTtZJTWek+FNtgGmg/AJtu4/Q==
X-Google-Smtp-Source: AA0mqf43oyR2o7Fy1bSe7CPoI/4ySUuYELMmn9fgR7SwA6nVc2yB1owSied/wskPRROqzZux/GxaZQ==
X-Received: by 2002:a5d:5a0c:0:b0:242:1c5f:ee55 with SMTP id
 bq12-20020a5d5a0c000000b002421c5fee55mr22682235wrb.712.1670313488371; 
 Mon, 05 Dec 2022 23:58:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b003b47e75b401sm27053551wmq.37.2022.12.05.23.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:58:07 -0800 (PST)
Message-ID: <6340aeda-9a57-4b21-5340-1c624f98f3e8@linaro.org>
Date: Tue, 6 Dec 2022 08:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 03/21] i386/kvm: handle Xen HVM cpuid leaves
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-4-dwmw2@infradead.org>
 <68be4619-50a1-83a9-290d-05618002b47d@linaro.org>
 <ba4fcebc4f3032d4cbf09928a8a0c37389dd6e72.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ba4fcebc4f3032d4cbf09928a8a0c37389dd6e72.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 6/12/22 01:18, David Woodhouse wrote:
> On Mon, 2022-12-05 at 22:58 +0100, Philippe Mathieu-Daudé wrote:
>>>
>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>> index 22b681ca37..45aa9e40a5 100644
>>> --- a/target/i386/cpu.c
>>> +++ b/target/i386/cpu.c
>>> @@ -7069,6 +7069,8 @@ static Property x86_cpu_properties[] = {
>>>         * own cache information (see x86_cpu_load_def()).
>>>         */
>>>        DEFINE_PROP_BOOL("legacy-cache", X86CPU, legacy_cache, true),
>>> +    DEFINE_PROP_BOOL("xen", X86CPU, xen, false),
>>
>> Maybe name it 'xen-hvm'?
> 
> I think I'd prefer it to go away completely. If the *machine* has the
> Xen feature enabled (which I've made implicit in the 'xen-version'
> property), perhaps we should *always* disable 'expose_kvm' and enable
> the Xen CPUID leaves instead?

It would be silly to run a non-Xen guest on the Xen machine, so it is
not a bad idea :)

>>> +    DEFINE_PROP_BOOL("xen-vapic", X86CPU, xen_vapic, false),
>>
>> What happens if we use -cpu host,-kvm,+xen,-xen-vapic ?
> 
> That's sane; it does the Xen CPUID thing but doesn't advertise the
> vAPIC feature in the Xen CPUID leaves.

In which case we don't want to use the vAPIC?

Thanks,

Phil.

