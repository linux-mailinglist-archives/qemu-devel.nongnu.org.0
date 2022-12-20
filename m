Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6040765224E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:19:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dOt-0006DR-Nh; Tue, 20 Dec 2022 09:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7dOS-00067S-8C
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:14:58 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7dOQ-0004k8-1n
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:14:55 -0500
Received: by mail-wr1-x432.google.com with SMTP id f18so11870815wrj.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=2nawQEyhVNVr1D6lqgheUfCq2PTOFJQyVyDoG7toulU=;
 b=MpolAMKzXJ9WiN4WiH8mGeYhxUnFafVGxgu2b9okm3cyOG65x7VughgRsLDE5ykf6v
 5ZR+TeITgw9inach19sUqrF2hCprNq6FLKrDAiygoHc+EBIbGaYAnIkkIVnw9X/J6SL4
 YyTcX/Pdw9LrLs0vMi4VVk8uu6ORxMdN8kDnktnh6CJDIvjTc9WIXm6bnxaANXvRtZ8z
 p6uQHL9PGYgvjKHFG+eZQFRs/3nGYaI2Iuz453g4/nV4LidLJBa9n31hCkTHZywy3f6l
 c0CX6qfSNl4T2AJbwMfww//3E0AUx13Wb9YsGEeJOz/5IUbg90NjUrTYwyvEytc/BCtN
 WqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2nawQEyhVNVr1D6lqgheUfCq2PTOFJQyVyDoG7toulU=;
 b=TSXF50j9YpUhIp91cHG066ymDJoAqYSsCBg8kNWPsCupIo6dEsmN6MuYhrURwRYWqm
 7BnmPuOhjvLI6dgz7sRSXMAW2ql7NeokbbY2bjKrszRa2k5eBbtpPxxxz2e2FTlif0kV
 lEswdVCN4WKuvRhD8IxF4kQA8i2RT4NKQ8xO43aoZ9Tv3Fx7kr5GYpdVz0aE3B6irx3R
 5lDe9cvP0u6JrhAWwRp7SG0dvxDvJ/KnUHsfSfD31UF/bDjL7G7I9NUfitySIVnxXR/5
 2C7iWvtC9tLJlRr7O2KTWGQsOFWs5+kEGbTvCssHw5ki9ag+RLdslRaARE64KjqPHy62
 URKw==
X-Gm-Message-State: ANoB5pk9jS7g9epLSu68r5LEIGqCopgJnSwdXjQbpa3yGWqYyd/8irC8
 bnKpuU12W3cvri7j5Guo1Dc=
X-Google-Smtp-Source: AA0mqf7XNi251mrQAEocE6E17JU5ytDBDPhnkl2IVHZOf8RVE0cTCNnu/AU0DPBIvRe/Fx5SxR8D7A==
X-Received: by 2002:adf:e710:0:b0:24c:f3b8:816d with SMTP id
 c16-20020adfe710000000b0024cf3b8816dmr25209665wrm.60.1671545691748; 
 Tue, 20 Dec 2022 06:14:51 -0800 (PST)
Received: from [192.168.6.89] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfe602000000b002368f6b56desm15187919wrm.18.2022.12.20.06.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 06:14:51 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <aea5de7d-a938-6e36-69ca-68792d758004@xen.org>
Date: Tue, 20 Dec 2022 14:14:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 01/38] include: import xen public headers
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221216004117.862106-1-dwmw2@infradead.org>
 <20221216004117.862106-2-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221216004117.862106-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x432.google.com
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

On 16/12/2022 00:40, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Update to Xen public headers from 4.16.2 release]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   include/standard-headers/xen/arch-x86/cpuid.h |  118 ++
>   .../xen/arch-x86/xen-x86_32.h                 |  194 +++
>   .../xen/arch-x86/xen-x86_64.h                 |  241 ++++
>   include/standard-headers/xen/arch-x86/xen.h   |  398 +++++++
>   include/standard-headers/xen/event_channel.h  |  388 ++++++
>   include/standard-headers/xen/features.h       |  143 +++
>   include/standard-headers/xen/grant_table.h    |  686 +++++++++++
>   include/standard-headers/xen/hvm/hvm_op.h     |  395 +++++++
>   include/standard-headers/xen/hvm/params.h     |  318 +++++
>   include/standard-headers/xen/memory.h         |  754 ++++++++++++
>   include/standard-headers/xen/physdev.h        |  383 ++++++
>   include/standard-headers/xen/sched.h          |  202 ++++
>   include/standard-headers/xen/trace.h          |  341 ++++++
>   include/standard-headers/xen/vcpu.h           |  248 ++++
>   include/standard-headers/xen/version.h        |  113 ++
>   include/standard-headers/xen/xen-compat.h     |   46 +
>   include/standard-headers/xen/xen.h            | 1049 +++++++++++++++++
>   17 files changed, 6017 insertions(+)
>   create mode 100644 include/standard-headers/xen/arch-x86/cpuid.h
>   create mode 100644 include/standard-headers/xen/arch-x86/xen-x86_32.h
>   create mode 100644 include/standard-headers/xen/arch-x86/xen-x86_64.h
>   create mode 100644 include/standard-headers/xen/arch-x86/xen.h
>   create mode 100644 include/standard-headers/xen/event_channel.h
>   create mode 100644 include/standard-headers/xen/features.h
>   create mode 100644 include/standard-headers/xen/grant_table.h
>   create mode 100644 include/standard-headers/xen/hvm/hvm_op.h
>   create mode 100644 include/standard-headers/xen/hvm/params.h
>   create mode 100644 include/standard-headers/xen/memory.h
>   create mode 100644 include/standard-headers/xen/physdev.h
>   create mode 100644 include/standard-headers/xen/sched.h
>   create mode 100644 include/standard-headers/xen/trace.h
>   create mode 100644 include/standard-headers/xen/vcpu.h
>   create mode 100644 include/standard-headers/xen/version.h
>   create mode 100644 include/standard-headers/xen/xen-compat.h
>   create mode 100644 include/standard-headers/xen/xen.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>


