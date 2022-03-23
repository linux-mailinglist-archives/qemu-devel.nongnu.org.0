Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B799E4E4A2B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 01:43:15 +0100 (CET)
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWp5l-00035q-Ve
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 20:43:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWp4H-0002KS-Dn
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:41:41 -0400
Received: from [2607:f8b0:4864:20::42a] (port=45691
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWp4F-0001Ok-Na
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:41:40 -0400
Received: by mail-pf1-x42a.google.com with SMTP id s8so175950pfk.12
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 17:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dm+g0HdQXfywzgNjDtGSAtzan4mMlCIj85DWtPLYH5w=;
 b=SVafHEXoNHoQTBU+DAidKxjnBj2tkDR/DWCZ3UeKAtgP1CwR3Dr0D8a27xL/PCWwCu
 W77FvZMurPgEr/94AfrPoGOHj26k7E8uyJxFifGxwWTPi6wImWst2ccGLfDHEswzi9I6
 9BNOlozzqFfMhLb4ZYPmAv50XEbb3VkRSMv5VxNWPga49A9MvSE6Kr8YtBknzD9uYCO6
 9k3UNkipPpIOg/r7JoMWbkdWH2B3X0DVyWyODex8K6D4eoRZ0kRSxdiDSMtO0gJc3t5R
 z6Ou28XyFRHgM/7YRlGWcfCBNWscs8kp8dUXVafScvI2Vp8TVbDeqaBGUevHLzZPGOdG
 oQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dm+g0HdQXfywzgNjDtGSAtzan4mMlCIj85DWtPLYH5w=;
 b=Hy/32U18sWpoCw3RGmszrR9LNz+89t2Yg2W7cwInCqC2BOmsVNn5vmuxeSp2k+STb4
 hZYpjfCxukwfH8ED0PVRaeYE7haXx6XiZXi8rux6zAN56ZdFmmTtzUs/A7SSpRBdrd7b
 dTefJ/yBpvkOPqUgBEuPBk3QcOez6httQD+ey8D27Un5a8LsPJGuJN1t6uBWSVBlSoDn
 VMtn7wyB24EW/fId4JH6xetecRI1Tc62u8KZPOIyolkINqVw0+184SWNJJxpOCF97lGs
 /G4mc8uEeNaO9AfIy1cv9U5wPGhH1prDu5oNS4fSz2Tf0Y6YCQwxKt+IotPRQO9uMVnw
 0kMA==
X-Gm-Message-State: AOAM533E5Vu+o3xurOVC/skrTmQzwlIY7U86pueJPVnHYyFPIZlj8E85
 HEMnwFnkRIbvUDDiivDm7X4a9w==
X-Google-Smtp-Source: ABdhPJxxY80XyLp8JoNzwwjFkdwMwJ60nJ0lYuTTxIfbLPBY6ojcNSUyUAe7cu/squc6TSKzG3xgRQ==
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id
 s3-20020a056a00194300b004cb79c9fa48mr31564726pfk.47.1647996097834; 
 Tue, 22 Mar 2022 17:41:37 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a62e211000000b004faa5233213sm7434334pfi.101.2022.03.22.17.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 17:41:37 -0700 (PDT)
Message-ID: <0e5f2c65-3b34-c162-5f30-b837e3e5876d@linaro.org>
Date: Tue, 22 Mar 2022 17:41:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] linux-user/arm: Implement __kernel_cmpxchg with host
 atomics
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-3-richard.henderson@linaro.org>
 <b93a6c01-6153-b9c4-7a7f-db1daed88d9c@vivier.eu>
 <6089ef2d-49e3-04c1-1e0a-e108d7fbd3c3@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6089ef2d-49e3-04c1-1e0a-e108d7fbd3c3@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 13:08, Laurent Vivier wrote:
> I have removed this patch and the following one from the branch because it hangs when 
> executed in an armhf/bionic chroot the following example:
> 
> cat > /tmp/hello.go <<EOF
> package main
> 
> import "fmt"
> 
> func main() {
>          fmt.Println("Hello Google!")
> }
> EOF
> 
> go run /tmp/hello.go

I don't see a hang.  I see a SIGBUS, due to a silly typo here:


> +static void arm_kernel_cmpxchg32_helper(CPUARMState *env)
> +{
> +    uint32_t oldval, newval, val, addr, cpsr, *host_addr;
> +
> +    oldval = env->regs[0];
> +    newval = env->regs[1];
> +    addr = env->regs[2];
> +
> +    mmap_lock();
> +    host_addr = atomic_mmu_lookup(env, addr, 8); 

s/8/4/.


r~

