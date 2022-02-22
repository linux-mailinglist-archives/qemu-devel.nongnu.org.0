Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E204C01FA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:25:38 +0100 (CET)
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMan2-00075y-LL
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:25:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMafc-0000Xd-1F
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:17:56 -0500
Received: from [2607:f8b0:4864:20::52b] (port=35434
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMafX-0004MT-Hn
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:17:55 -0500
Received: by mail-pg1-x52b.google.com with SMTP id p23so17843498pgj.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jiMKc0M/1JC+szTVQNrvOUUlQJTnhdAb95dP75gZUSA=;
 b=ShmOdy733jXKA3bCwSXjBTUA2m05laIhIGzYYFRf/jJVPhjfVB/joHMWCr57bGLVix
 UNmRsmom2a1mlk1/3p8M4ffTyaYxjC6fnF9Qdrivhe8WuTU95cb1ZdKhhQXvpGRH4a7z
 ZbrEf/haShR4YIgYaMhoJkcRAbyXyRLhHEanD/zA7NVTW/2GXbzA3tI0FZNliEFPTVYQ
 2l7epkX1TZR5sw9oTR+mxXE+BQ6YimYpPDTSR3ZnoHQUto4Z6FrqRH5rhJ1Hku/DX1uN
 XQcUhPrmrS4FihZ399gOLG56VMqNSlwVS6231l8RfcIKGnYLjficSotorsIvgis7wSnZ
 VJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jiMKc0M/1JC+szTVQNrvOUUlQJTnhdAb95dP75gZUSA=;
 b=fq2dBIMKgjoyPAFeZ9dqI/aTOEXrubHZZBedK4NLK3irMyw0w+4Q/q8w+Caf2E+R9t
 LLBVIwMLFCtq+wxttd4uCPdDQaN9Rwapu/GlNh2Sbs+oAc5+u241antw6CgaY5bIC3xO
 vhbkq+Lb+y5BnwLBQRbclix5Yn7zyMxxkfYR5glJz6g06AC/0fuurPWR/FJU92BqlP3Q
 I1Dp4VhoYUyiH7T2X0BGq6RW36LgqfRQoSnJlxnbhpg/N4VJpkQVq9pkvGWi0+fhRo6D
 Rck3kaCEaAXyAt8ZpuhScIwv0E//XxFaVkG+exlRlXnlCGHMc5Vh1Dkl/xdADeJswkbR
 ziRw==
X-Gm-Message-State: AOAM531WiGnG3WIBgd1MvzQbkQPrDw0e98POG1P7IT8uTBKjX6wEmvct
 TY9tNbdAwsyXpPW8NocqZThT7Q==
X-Google-Smtp-Source: ABdhPJzeQH1AuPYQdE7p1/2r40xKRZEgwg8M63XxYvjq9OliXAaKHYiSisFMV0LVrZ+PMSCf/fxpVQ==
X-Received: by 2002:a05:6a00:244f:b0:4cc:a2ba:4cd8 with SMTP id
 d15-20020a056a00244f00b004cca2ba4cd8mr26675034pfj.74.1645557470190; 
 Tue, 22 Feb 2022 11:17:50 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id r72sm11779491pgr.80.2022.02.22.11.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 11:17:49 -0800 (PST)
Message-ID: <58faf8d2-cdfb-a2a5-ccf3-cfac62b3178b@linaro.org>
Date: Tue, 22 Feb 2022 09:17:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 16/47] target/ppc: implement vclrrb
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-17-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-17-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/translate/vmx-impl.c.inc | 32 +++++++++++++++++++++--------
>   2 files changed, 25 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

