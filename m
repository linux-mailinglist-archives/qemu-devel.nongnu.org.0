Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB14B4E2D03
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:58:39 +0100 (CET)
Received: from localhost ([::1]:59434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKQZ-0005oV-0V
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:58:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWK4J-00005M-8D
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:35:39 -0400
Received: from [2607:f8b0:4864:20::52e] (port=44719
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWK4H-0007NQ-Pq
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:35:38 -0400
Received: by mail-pg1-x52e.google.com with SMTP id c11so10562069pgu.11
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pg7f9ImMNivE+wLU68fTE1E+ucAKT+1C95oZMUsx+yg=;
 b=PNen7UoNvQJC6wnnmpUjTRlJgONFr4EkOLNGpBhrXHY1AaLVH/1dKeDshpC33O9RF8
 +dEhdXYO97b02TnYEeJWAbttc2vGfnlf0ZZDkjqMiOTJFPCzlo7/FeOFsWYaJW3F+JIK
 +VhG+0DseXWfqcB4Vla4cRCscHrlJVkAjHnebbLGrW3qD0Suf2uh3pYAFIiklCmyS3da
 +3LXPwAVYSE0Khgfje0IHX34AYAn2PAneRLiDRuLHSYbL7mNdIaBoEe4EZ21G6IfSDtT
 9KEx8Ni/tZOYXXuwCPtNzsuhSVrfGqTikuChuO0EbSlsjxI1htxjxPhjSY75cGSxYfHC
 a6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pg7f9ImMNivE+wLU68fTE1E+ucAKT+1C95oZMUsx+yg=;
 b=RCd8kFWqXEBAVnbTFQYthK/HsYFabJ8+2S7oBOMyN0YMHy9TL0yd9t73vaAWyVHvJv
 O+jNNJVVu0kjn9+Gaw7kkM9Y6UlxlGI6YpYcuWt3P9czj4Q1dTt5uZ9bMKcUdiT9eqza
 zwN2OKaZGpHet+MrCyOhd+mtroVqIpQlnEfQ7oLuZkoV/JaOWA/YWQ6hE2Zu3CxyzCAR
 hTAUWD3VDUPFrkrgeIqwMzxKGU6uC4NexJIVi+kqVl59hoMe4+3vQFj9/dL+6hmFygdg
 eoCOl70WHH3hGhsWwjvbjU6CUWVxNJYOw5Akn7yDlAdPx/4dWWX7L1Tq9H22jbsocFJ7
 ktdg==
X-Gm-Message-State: AOAM532/6kfl1F9UQL3+gbjjBBquIrLijyCZHPRjJvOLMGHtq7SNL8NW
 UZ39jey7zC4WZNqyeNgNx/oYjA==
X-Google-Smtp-Source: ABdhPJxnt0F2C1CpYzzk/ucAFeIwSWXkxx2OxmtVOo4P0tcosFMbyzyHl+jdSoDrRNq0cOh4d/GnUQ==
X-Received: by 2002:a63:305:0:b0:381:7d61:5fe7 with SMTP id
 5-20020a630305000000b003817d615fe7mr18685214pgd.238.1647876936081; 
 Mon, 21 Mar 2022 08:35:36 -0700 (PDT)
Received: from [192.168.33.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056a00234300b004faabba358fsm3311267pfj.14.2022.03.21.08.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 08:35:35 -0700 (PDT)
Message-ID: <49573ed3-2084-fcd0-5765-cf1c83e78c3a@linaro.org>
Date: Mon, 21 Mar 2022 08:35:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 06/11] target/s390x: vxeh2: vector {load, store}
 elements reversed
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-7-richard.henderson@linaro.org>
 <ec84c578-1518-26e1-b1a9-082f1eeed2dc@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ec84c578-1518-26e1-b1a9-082f1eeed2dc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/22 04:35, David Hildenbrand wrote:
>> +    /* Probe write access before actually modifying memory */
>> +    gen_helper_probe_write_access(cpu_env, o->addr1, tcg_constant_i64(16));
> 
> We have to free the tcg_constant_i64() IIRC.

We do not.


r~

