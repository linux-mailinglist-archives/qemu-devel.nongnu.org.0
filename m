Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2314EEC41
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:17:37 +0200 (CEST)
Received: from localhost ([::1]:50532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naFHc-0005sp-9q
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:17:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naFGR-0004O0-LI
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:16:23 -0400
Received: from [2a00:1450:4864:20::634] (port=34759
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naFGQ-0001Tb-1E
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:16:23 -0400
Received: by mail-ej1-x634.google.com with SMTP id o10so5192702ejd.1
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 04:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=829zWNqmUrjn4Kkg6N9Nx6v/q4B/T5NRx7TKMhRNLS0=;
 b=hsLB6yGtq8k7VAFvQhZb3CubGDLPHdxfnyEIHlkyCbq/DE/KLjZZPB6TVc0c1I57JI
 BXyxVPCspd8ctyBUvTJvt2rxyjMegzMXdrlfGG8TPDK8jNcTqFrsu8IztsPMT+G9H8YQ
 ZZhHTuT9fEwznYTttbvh7doCKTgpNtpE//QprEwoqSKrnA7S/AnOZh3+dtoOzn0D+vzn
 nvMskLf9QHT/fBsj9Bns439A01AdZoI6mS/6GTCIbuF0bhbW7ia/FCNdWiQfQTat/eRE
 LdC+H+mv3OeQtAimletaGyxg+hz4BFdZ6r9sWPealggnIFrlF3O5Z5eIA0bRA+osmgxa
 kgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=829zWNqmUrjn4Kkg6N9Nx6v/q4B/T5NRx7TKMhRNLS0=;
 b=fZQow3iZLtdIEFiX4G5856pC7B+R2JKhihib+Pd9S7K8VftVkC+CWDhONri20qpUFL
 d+Q88NbSg183dUYbGLr4iPHOnxpOD52Oq82rM06qGrOOCBhKEoBMq304iwdAcWUJGmAq
 hsq6q6n2mWF2b2x6xEbLjyGxFtfQT96EOU08crWqcVD7mGBLPcewd7XMXp5Fegw5I6aR
 chMo1VqsP6ZdBoKzyuX9jb3Kd2a3ue9ytQG0VLjOP2Sb5IeGqXtTvbgxSdu0R5Nhakvx
 dNooVeIw9K5pfYXv7oo8wl9Y335iDe0oE3GYcxEbgT3E77ES7jMvza0e/sY3gx0jkjKY
 icQQ==
X-Gm-Message-State: AOAM530wTtVXZBAWXBduI/WToDuGhbjmLvGAVmfPFyU08gBDja5Nf8nS
 4j+hL4DVcD6Vl1p9dEeV3lM=
X-Google-Smtp-Source: ABdhPJxiHSz2Cf6jDuarDTqlTvobBVH8ee4ADu0Ts5fAARctdtiU6GdanPMgDPxsskgwJWoG0dlWXQ==
X-Received: by 2002:a17:906:c113:b0:6d7:7b53:9cb with SMTP id
 do19-20020a170906c11300b006d77b5309cbmr9156850ejc.197.1648811780538; 
 Fri, 01 Apr 2022 04:16:20 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8ca6:a836:a237:fed1?
 ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a1709066d8700b006d4b4d137fbsm934888ejt.50.2022.04.01.04.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 04:16:20 -0700 (PDT)
Message-ID: <e17c3f3b-000f-4bab-1e3a-2adbafbcdcbb@redhat.com>
Date: Fri, 1 Apr 2022 13:16:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: use of uninitialized variable involving visit_type_uint32() and
 friends
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
 <CABgObfbu3MK6SCNGOFGGHWO72e3dYygUybgyavALKq5_pnWK0A@mail.gmail.com>
 <87y20p88qq.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87y20p88qq.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 11:15, Markus Armbruster wrote:
>   +    assert (v->type == expected_type);
>   +    if (expected_type & (VISITOR_INPUT | VISITOR_DEALLOC)) {
> 
> Backwards.

Yes, I always get input vs output wrong.

> With an input visitor @v,
> 
>      visit_type_uint32(v, "name", &val, errp)
> 
> stores to @val without looking at it first.  In other words,
> uninitialized @val is fine, just like for val = ...
> 
> Note: you don't actually need VISITOR_DEALLOC here, because a
> deallocation visitor isn't going to do anything for non-pointer values.

There's a philosophical question on whether other deallocation visitors 
can exist than "the" deallocation visitor, but it's not particularly 
germane to the topic.

> Two changes:
> 
> * Skip copying to and from full-width buffer @value:
> 
>    - Skip @value = *obj when we're going to overwrite @value without
>      reading it first.
> 
>      This leaves @value uninitialized instead of initializing it from a
>      (commonly) uninitialized variable.
> 
>      I'm not sure how this helps static analysis, but if it does...

If it can do really serious interprocedural analysis, it _might_ be able 
to see through the visitor constructor and know that the "value = *obj" 
is not initialized (e.g. "all callers of object_property_set use an 
input visitor").  I doubt that honestly, but a man can dream.

If the conditionals are enough to shut it up, then we won the battle 
(for now).

If the conditionals are not enough to shut it up, then you have a bit 
more confidence when marking the false positives.

>    - Skip *obj = @value when value must be *obj anyway.
> 
>      Should have no observable effect.
> 
>      Again, I'm not sure how this helps static analysis.

Mostly consistency, could also be changed to an assert(*obj == value); 
/* output visitors don't really need obj to be passed by reference */

> * Pass visitor type in addition to the visitor.  Can you explain why
>    that's useful?

Because it communicates what the caller expects: "I have left this 
uninitialized because I expect my "v" argument to be the kind of visitor 
that fills it in".  It's this argument that gives me the confidence 
needed to shut up Coverity's false positives.

Embedding the visitor type in the signature makes it impossible not to 
pass it, unlike e.g. an assertion in every getter or setter.

Paolo

