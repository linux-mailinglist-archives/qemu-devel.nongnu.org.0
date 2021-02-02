Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED530BC81
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:04:24 +0100 (CET)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6tTr-00061z-I9
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:04:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6tSu-0005bO-G3
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:03:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6tSs-00033n-TS
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612263801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnIC//Io4FNMWwG4ZU/AqTszM7dREHW/Q/OdCh6EnOY=;
 b=g5PxH2sDNXqaDOa2WNSva9zt+s+IbSiJcCNNJ4UVlbM0HNqzt9EoqbS+03MG/6FyqBz5/Z
 a6o5LDhTdOWeOm1oQQg7NZAQ6ywqutXaOwg0eM4GATo+n+0TcDaaxPtOb8/iRCP0mrRsv4
 UduDhVeT/NtQbjrgVqAJzCfIXbyrk4k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-7WDyUrf2OE6I9eiQEvpTzA-1; Tue, 02 Feb 2021 06:03:18 -0500
X-MC-Unique: 7WDyUrf2OE6I9eiQEvpTzA-1
Received: by mail-ed1-f70.google.com with SMTP id m18so9364527edp.13
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 03:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bnIC//Io4FNMWwG4ZU/AqTszM7dREHW/Q/OdCh6EnOY=;
 b=eLpRQhptRjs9VmBwbyV4nyIudkIWduLS7WfiCXShpgLJ1y0bPZN+FSEFthX+Sr9OVT
 DhmuKwqrdQxChl4oGnowsTu+TR0bNe/+6+ITOL+QcZI52CKqw5Bw2AXz/0/ax71vyE1o
 awFlB0JGKZkiUqV7iv9zg5oaTxnxTlKb/0CyHAwQkn9/U+FcJi6GsU5q0AGZmlo/EVVO
 1bI05HmC/Nq95aXi9kyF5CEiwkY2HUHSMVUBPkNFqO2KvXu7g3gMND+X6Qn+pR5hxiYI
 mC3jPfUFMhYADuWaIRekRrGFoDnotvr3XNWjia8e4ZknAVlsfmsEVAdZUJPNGZAaiveN
 sleg==
X-Gm-Message-State: AOAM531QXt4gfIad35q4yT4vJAQ5djwtXeOhbNfdjHu6imWCuabnZzPl
 K56UtQAFjpxlpYQPynLeCa75q9947YTx+06nuRrik39dYhifzoRHqI8JTwCSRXQ5xXBkgSeMPa2
 gWmCDMo+mcNkY1vIOiYzVST+WsmXva/1mxlW22sAI9Dh82cf89YP/Bh46d7rrNRS/2IU=
X-Received: by 2002:a17:906:24d1:: with SMTP id
 f17mr6234339ejb.503.1612263796833; 
 Tue, 02 Feb 2021 03:03:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5s9L7HToHwssa8zfKw5Y4WyIa6aTIlJ/Bi22cHkMuFDRWCdb6YUBGs/deJNDtQvr4TUV0Bg==
X-Received: by 2002:a17:906:24d1:: with SMTP id
 f17mr6234306ejb.503.1612263796461; 
 Tue, 02 Feb 2021 03:03:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f9sm9946119edm.6.2021.02.02.03.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 03:03:15 -0800 (PST)
Subject: Re: [PATCH] target/i386: Add bus lock debug exception support
To: Chenyi Qiang <chenyi.qiang@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
References: <20210202090224.13274-1-chenyi.qiang@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7aad62b9-d455-bf30-bea3-187a20578038@redhat.com>
Date: Tue, 2 Feb 2021 12:03:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202090224.13274-1-chenyi.qiang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/02/21 10:02, Chenyi Qiang wrote:
> Bus lock debug exception is a feature that can notify the kernel by
> generate an #DB trap after the instruction acquires a bus lock when
> CPL>0. This allows the kernel to enforce user application throttling or
> mitigations.
> 
> This feature is enumerated via CPUID.(EAX=7,ECX=0).ECX[bit 24].
> 
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> ---
>   target/i386/cpu.c | 2 +-
>   target/i386/cpu.h | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ae89024d36..55f3b5829f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -963,7 +963,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>               "avx512bitalg", NULL, "avx512-vpopcntdq", NULL,
>               "la57", NULL, NULL, NULL,
>               NULL, NULL, "rdpid", NULL,
> -            NULL, "cldemote", NULL, "movdiri",
> +            "bus-lock-detect", "cldemote", NULL, "movdiri",
>               "movdir64b", NULL, NULL, NULL,
>           },
>           .cpuid = {
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index d23a5b340a..417f49b721 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -762,6 +762,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>   #define CPUID_7_0_ECX_LA57              (1U << 16)
>   /* Read Processor ID */
>   #define CPUID_7_0_ECX_RDPID             (1U << 22)
> +/* Bus Lock Debug Exception */
> +#define CPUID_7_0_ECX_BUS_LOCK_DETECT   (1U << 24)
>   /* Cache Line Demote Instruction */
>   #define CPUID_7_0_ECX_CLDEMOTE          (1U << 25)
>   /* Move Doubleword as Direct Store Instruction */
> 

Queued, thanks.

Paolo


