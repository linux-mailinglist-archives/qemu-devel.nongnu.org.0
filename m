Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7FC606377
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:47:01 +0200 (CEST)
Received: from localhost ([::1]:43066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWp1-0005gY-Iz
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:46:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWhl-0006aX-Qa
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1olVWt-0000VQ-JJ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:24:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1olVWq-00015E-00
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666272247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VnFdNmo3GGs1yCChTCtI8Dz/ozo508/JNUxZ6sgATe4=;
 b=alBQ1m9e6G31oU49zAIdGDk0sDa5n2SWk3ycu94dvupH26UWCS2/GU8EaYRGwp+0nqcnqj
 Ks2mV6z/5vk2uYB9e7PgJOsb+sClArCD0SRjVdPkOtMGEQURMW22HNsEBgZXEu1T9zg2oa
 HDirCc8HJeN2qivMcV9K1WM2mGXjJz8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-BP3a_I7ZNd-BvGv6KyYcPg-1; Thu, 20 Oct 2022 09:24:05 -0400
X-MC-Unique: BP3a_I7ZNd-BvGv6KyYcPg-1
Received: by mail-wr1-f70.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so6664204wrg.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 06:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VnFdNmo3GGs1yCChTCtI8Dz/ozo508/JNUxZ6sgATe4=;
 b=inwOKL7q/JV/DrJnJzy+1ZFxqLUBNk0rm9uFGYzkjA/gdBifA++5LGs190L7cAGF+t
 le5HSpxg6+L5RzndZ1k0c+r4X9AZg8Jfmm1w4+VgHZfnHpVltSA6aKYBlVCSeCNFHRMV
 AubtBLsx6hQWUJr75/FhIyJ/dW0Ta8rLjAfQCpZfL4l2bM6jf1SL5/Ukbo+DKyl+ErK9
 olWjaMUIrgbuYAvyKx59a9RWinVSw06XBwE1vyqvydWk+tnC8VGMIRig/yciGNY7Pz19
 8a9fInfx3H43NFeST4EG3thGYZXKAdYbDfDqMg13HW6PKlqrwRrljfU6c61NM/lTm0eu
 ZjAA==
X-Gm-Message-State: ACrzQf27grGYpBApuyXAaZ3G4LHxHaX0wJ2KBdk9gCFeMffq9IkPXC5V
 x4XUbUS+iq8AbGOaafz8VlFNlhO7MhPR46GcsFCu+aBm5MgrBJo0gY7QIf0OTqZFcjmDx1VszQz
 rnsixvZewxLA1al8=
X-Received: by 2002:a05:6000:18a1:b0:230:f9fb:c83 with SMTP id
 b1-20020a05600018a100b00230f9fb0c83mr8740446wri.329.1666272244589; 
 Thu, 20 Oct 2022 06:24:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kFyRERLflLBdwKFiXRmoNw/rwb4dYWxUCTL8NmHhdjfjXIrnBAm0SU02+0QoGsAiYwlXI1g==
X-Received: by 2002:a05:6000:18a1:b0:230:f9fb:c83 with SMTP id
 b1-20020a05600018a100b00230f9fb0c83mr8740424wri.329.1666272244293; 
 Thu, 20 Oct 2022 06:24:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:b100:1443:78d5:341f:c97a?
 (p200300cbc708b100144378d5341fc97a.dip0.t-ipconnect.de.
 [2003:cb:c708:b100:1443:78d5:341f:c97a])
 by smtp.gmail.com with ESMTPSA id
 dn3-20020a05600c654300b003a5f3f5883dsm2872684wmb.17.2022.10.20.06.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:24:03 -0700 (PDT)
Message-ID: <6309db80-4cc5-280f-2e5c-15605ccaeddf@redhat.com>
Date: Thu, 20 Oct 2022 15:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 25/26] target/s390x: fake instruction loading when
 handling 'ex'
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-26-alex.bennee@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221020115209.1761864-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 20.10.22 13:52, Alex Bennée wrote:
> The s390x EXecute instruction is a bit weird as we synthesis the
> executed instruction from what we have stored in memory. This missed
> the plugin instrumentation.
> 
> Work around this with a special helper to inform the rest of the
> translator about the instruction so things stay consistent.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> v2
>    - s/w/b/ for translator_fake_ldb
>    - add comment to extract_insn
>    - reword commit message
> ---
>   include/exec/translator.h    | 17 +++++++++++++++++
>   target/s390x/tcg/translate.c |  6 ++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/include/exec/translator.h b/include/exec/translator.h
> index 3b77f5f4aa..af2ff95cd5 100644
> --- a/include/exec/translator.h
> +++ b/include/exec/translator.h
> @@ -211,6 +211,23 @@ translator_ldq_swap(CPUArchState *env, DisasContextBase *db,
>       return ret;
>   }
>   
> +/**
> + * translator_fake_ldb - fake instruction load
> + * @insn8: byte of instruction
> + * @pc: program counter of instruction
> + *
> + * This is a special case helper used where the instruction we are
> + * about to translate comes from somewhere else (e.g. being
> + * re-synthesised for s390x "ex"). It ensures we update other areas of
> + * the translator with details of the executed instruction.
> + */
> +
> +static inline void translator_fake_ldb(uint8_t insn8, abi_ptr pc)
> +{
> +    plugin_insn_append(pc, &insn8, sizeof(insn8));
> +}
> +
> +

^ nit: one emtpy line would have been sufficient

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


