Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0836EB03
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:59:23 +0200 (CEST)
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc6GJ-0005Ul-2I
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc6EO-0004o9-2T
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:57:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc6EK-0002Zl-Vb
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619701039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oti8ATbYq8Jbp2hVZiDT2qJSdqRp1r/F01P/IkBwRLM=;
 b=JfQj0lRYnrQdrL4P7QDFb/W3MQ5LzcVX9YuxbgCgrIkj3lv7JCba3Nx9HgKChZtAcmGW6K
 xXClRoko1a+lkcLLE9wA7lAeHCwdfbwV89tvQPncvGA1qEyqLrUKu8082a8dnggJtRHLYb
 rPFFCsTnNphhysQWkARB040jtP2Yyks=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-PsZx4xfSPPmaHtS7-hf_YA-1; Thu, 29 Apr 2021 08:57:16 -0400
X-MC-Unique: PsZx4xfSPPmaHtS7-hf_YA-1
Received: by mail-wr1-f69.google.com with SMTP id
 61-20020adf84430000b029010b4cd88298so6941172wrf.21
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 05:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oti8ATbYq8Jbp2hVZiDT2qJSdqRp1r/F01P/IkBwRLM=;
 b=PNnZb9fqC6+OujMxHENmNRvm0lxA7uXI26t9BMCL05r04rWvH75WKfw1EvfQiCc0jz
 SOC5wIFSOpx/bCCFPeFeKnl1wXRhIMR4Nwplnznpx/uIOg6zUH5YYICOeVlNuyITn+vt
 M+WFpI702uDFTD4IYxMu+RSQUOM+81yqQ1jFfQgYjZZT7nSBb/NDuHouXxL945GQVrCx
 x1npym+EDefG+3g92dgxpehaT/IWuWqEa5Esum141oYsnndbDllULfPtrp2vc1N4Qo/N
 qJ+By4M2PJJGZMk7IkaAULmp/A9mcHDDVWnzb/wDeLkocq4XVE4FOpnsFywmaibpNHGp
 kT8Q==
X-Gm-Message-State: AOAM532DIxJriQ3gbK5O0YYux3T42mUBEKTG9TRfoCSijineqFX/rRTe
 q1xkNjjygOcKNcGqqFxtQdnGrTtVGO2rupyMP8/3nI0KpXS7lzVDl7IV6E3YzQOKjHloJvegEgx
 uBrObGoK2REBdT8U=
X-Received: by 2002:a1c:35c6:: with SMTP id
 c189mr10038486wma.127.1619701035740; 
 Thu, 29 Apr 2021 05:57:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoR0rv/ZodLw/VmSMvtA70ZkWnL9QIIwW9yILcmZmsQJ7CKQK5QIzPBaEhxM5RZuY/6Rb3mw==
X-Received: by 2002:a1c:35c6:: with SMTP id
 c189mr10038461wma.127.1619701035543; 
 Thu, 29 Apr 2021 05:57:15 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id t17sm3538717wmq.12.2021.04.29.05.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 05:57:15 -0700 (PDT)
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if TCG
 is selected
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
 <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com> <874kfqs5gl.fsf@linaro.org>
 <763dbed9-35e9-0f85-3b94-01bffc7fcbf8@redhat.com> <871raus00j.fsf@linaro.org>
 <97b2e23c-bbb2-f2cc-bddd-6047d0cbe0be@redhat.com>
Message-ID: <9a4dfc32-91a7-df14-2601-f175c97a1dd5@redhat.com>
Date: Thu, 29 Apr 2021 14:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <97b2e23c-bbb2-f2cc-bddd-6047d0cbe0be@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 9:12 PM, Philippe Mathieu-Daudé wrote:
> On 4/28/21 9:04 PM, Alex Bennée wrote:
>>
>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>
>>> On 4/28/21 7:06 PM, Alex Bennée wrote:
>>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>>
>>>>> Alex, Richard, do you mind reviewing this one please?
>>>>
>>>> Isn't it already merged (with my r-b tag no less ;-)
>>>>
>>>>   f77147cd4de8c726f89b2702f7a9d0c9711d8875
>>>
>>> See ...
>>>
>>>>   Author:     Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>   AuthorDate: Fri Jan 22 21:44:31 2021 +0100
>>>>   Commit:     Paolo Bonzini <pbonzini@redhat.com>
>>>>   CommitDate: Mon Feb 8 14:43:55 2021 +0100
>>>>
>>>>>
>>>>> On 4/15/21 6:33 PM, Philippe Mathieu-Daudé wrote:
>>>>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>
>>>>>> The previous attempt (commit f77147cd4de) doesn't work as
>>>
>>> ... ^ this comment :(
>>
>> Ahh - my tooling was confused having searched by the subject title ;-)
> 
> Oh I see, I'll rename as:
> "tests/meson: Only build softfloat objects if TCG is selected (again)".

BTW you indeed reviewed/tested v1 of this patch:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg793900.html
but after addressing Paolo's comments I preferred to remove your tags.


