Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225C634BE74
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 21:11:40 +0200 (CEST)
Received: from localhost ([::1]:40810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQap1-0005Xw-7Y
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 15:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQamt-0004p4-RE
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:09:27 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQams-00032B-03
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:09:27 -0400
Received: by mail-oi1-x22d.google.com with SMTP id w70so11192796oie.0
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 12:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7cbpNakujgffnmUTsGbVNGADcGQImwlqbPCIEID9bKE=;
 b=vgihZTioqiNaZV95Sva9iPr1kzvNb/z2wdEGn6lUk72E7ZNlfSLGjZn17b3b4oX4k8
 cWIs7QiLDJfYyPIe/AeaprofBvVH0vcn5UTN8f+a6xLQHh/naAoNScamOsMVMNJNwlT7
 LLZ8wrOdj8LdQD84MvUYjU7vxuM6S41bKhbepg28CuKNptDG0VblHQeQC55jvf7114EC
 hJRwcEHBzvOrqLvZS32o/kQnB4wiSjvtq+UNy1DRNgc9cMT3EOl9hCpPFzmxOSaPIC69
 vVwu8w458QT/CFQ0bIPHeawJSf/QEsZQ3AJh9QzqyeTWZLJdTjMyuZKZ/UmVLKqUmny3
 ih3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7cbpNakujgffnmUTsGbVNGADcGQImwlqbPCIEID9bKE=;
 b=K/7e8mNPh/ezkjTvKTciGTbHRHNuRLJwwFks9LI1+Zi1+THNI0fA+Q9EG3XWYiD2h9
 mVvCOie65gbpRchTi35Xyaq70vJkzYU3loBP426RAKxw807fhs5yhMjcyOcWUqSkxMWw
 hsK30GmK5EgzPcEy2FhYZY+k/Z8cykj2ydP8Ix0PRyz8aH0Bnh6NjfJwZKi14y5NE4lt
 rjg17lUy/tc6HYtp/XTrr9HN+36E/ZF9rSWtQJk3prpSjw6/7qUXtrU5xrst5tl17tjV
 ESMnanbZ6UU8f4RV7YooToqOiomeaqoKPHmayZpVOUJwqMM3fM5q9InXzyXdISYM2d+G
 nITw==
X-Gm-Message-State: AOAM533Tb3os1B+YGi9t3VAZm5pSxb5vS/vmCsxNf/fhWtek+ajsbGhS
 gKkQXBokuoJw04q/j45p+hJ2Ow==
X-Google-Smtp-Source: ABdhPJwNStuet1dSi8TKGIVH+LgfHq2gOApnvEB/KZmuUjlDkGzM634A3kChv2QE2Sp3iuBzcdf68A==
X-Received: by 2002:aca:ad57:: with SMTP id w84mr16391913oie.100.1616958564383; 
 Sun, 28 Mar 2021 12:09:24 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id h24sm3808440otg.20.2021.03.28.12.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 12:09:24 -0700 (PDT)
Subject: Re: [RFC v12 61/65] cpu-sve: rename sve_zcr_len_for_el to
 cpu_sve_get_zcr_len_for_el
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-62-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7ebb3bb-e1e5-9d6d-ae2c-f3c9df6bd392@linaro.org>
Date: Sun, 28 Mar 2021 13:09:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-62-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> use a canonical module prefix followed by the get_zcr_len_for_el()
> method name. Also rename the static internal auxiliary function,
> where the module prefix is not necessary.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-sve.h     | 2 +-
>   target/arm/arch_dump.c   | 2 +-
>   target/arm/cpu-sve.c     | 6 +++---
>   target/arm/cpu64.c       | 2 +-
>   target/arm/tcg/cpregs.c  | 4 ++--
>   target/arm/tcg/helper.c  | 4 ++--
>   target/arm/tcg/tcg-sve.c | 4 ++--
>   7 files changed, 12 insertions(+), 12 deletions(-)

Reorder this patch next to where these functions are moved?

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

