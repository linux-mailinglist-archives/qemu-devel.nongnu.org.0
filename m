Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC8E4AACF7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:06:55 +0100 (CET)
Received: from localhost ([::1]:58752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGU8s-0005yy-Sw
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:06:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGU6f-0005AX-T5
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:04:37 -0500
Received: from [2607:f8b0:4864:20::52e] (port=42532
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGU6e-00089E-0L
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:04:37 -0500
Received: by mail-pg1-x52e.google.com with SMTP id d186so8249357pgc.9
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7bpAmLRUeS0ebqdE51SLeukNIUhFLTCH0SebOhjV/bQ=;
 b=Zao89ilmDiGrrvXjWtVgtO3G23m3NiBfBYPy8tdque4V5dBPghA8lbERJFr4VNAMO1
 wxmfhA60pZ0NUcMA+W/jHRf37gWqFLyWn1uFwXMugHpXK0Sifw+enq7JAkFTRMC6wbig
 OzgiuP5diQAuA6wmMKuj21AYW4rEt8nRRnvrn5X4gLN6Xj2mlDeGrcbabj4wRjTIRuj2
 TtnIwu3jzePjAEcNIUUcptOqbR+RWVT++Wo5ft+82fd7AAIaECGJY+J2urPx6lgP/EgZ
 LKHuq840cQbJ5eMsxXhiFchO23KyfttlANM8+FZLYD3c7d3in4L2mBodtAxqONifbKKh
 JIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7bpAmLRUeS0ebqdE51SLeukNIUhFLTCH0SebOhjV/bQ=;
 b=GH0OobFIzUIJd4CfS0/wadkpBmMLGH1Yt3gBJPdeVaqatQRwsEZfCjW8SS0jNbqNeS
 aXw8sdV8ut0e9Ugj8rfEwLTDRG1sUjlPCyn1+ICM8W2o1TtAtTLLeP56i2AWBPOCTVuM
 FCRQxvR8HLWr491e5Q9VIqeQ/QDX2wzDc6mUXF/KpTcjybcCGrK93Q9yxyswAzppaVkf
 qdQh6fXTvxl0hwYzWHYx0Un6haSvqGtFfNIL/xM5rcrQrYeIUyJTexRnOySm3mR38WUs
 HxaNxSJ9umzNvwfp4UI/S0Nni+K+Y7nj9mlihSL90qOVJXIiSUKlEPzc2zQLynMV7IXL
 6qHg==
X-Gm-Message-State: AOAM530w77tOB5D9itwvB88d6Wffo2zaUFAObMFaVcjnEs/rJvvQ3r36
 O2MkRFW/PeDqMmhn71Vyqtas4w==
X-Google-Smtp-Source: ABdhPJylFBu0FT4MyTGySv0VkLRk7X3qVJc2W9nh0juUFUTKPnm/PupcyJ4RtsBq53Q5niU2nQyN7A==
X-Received: by 2002:aa7:85c6:: with SMTP id z6mr9509910pfn.45.1644102266104;
 Sat, 05 Feb 2022 15:04:26 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id k3sm7274254pfu.180.2022.02.05.15.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:04:25 -0800 (PST)
Message-ID: <f0a0a25c-060b-94a6-a4b4-8703aacfb10d@linaro.org>
Date: Sun, 6 Feb 2022 10:04:20 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/21] accel: Restrict sysemu stubs to system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-2-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:17, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/stubs/meson.build | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
> index 12dd1539af..0249b9258f 100644
> --- a/accel/stubs/meson.build
> +++ b/accel/stubs/meson.build
> @@ -1,4 +1,7 @@
> -specific_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
> -specific_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
> -specific_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
> -specific_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
> +sysemu_stubs_ss = ss.source_set()
> +sysemu_stubs_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
> +sysemu_stubs_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
> +sysemu_stubs_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
> +sysemu_stubs_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
> +
> +specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: sysemu_stubs_ss)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

