Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3A6BA9DA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 08:49:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcLsL-0005af-FG; Wed, 15 Mar 2023 03:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcLsJ-0005aR-Ni
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 03:48:43 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcLsH-0004Ia-TS
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 03:48:43 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso491114wmq.1
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 00:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678866519;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OgftObuJTNP008m6xoQZjZ0/0u/0zVJAfemwYNvM5dE=;
 b=tHchg+KitaWMnrm/wbH3sHuUCSzSPQCtuX5kA0Qy8/l9pdYKK6kQHUq3O1b+lDfi70
 AktyK/bVu5WM5E+E353Wxo+EbEBuwChivG3HwMbHRqhrZ6T8QBeeCoRH/KqnNgfxXvvC
 s9JBgJr+YPICBs66hFdecUCNGf8PMDkSgR5pXsZHoPZZA7lfcjQ1VH007hGzDwYRKcUf
 ZPCbVN0nS5YyYmmP0W5XiXhdaI3vCD+gHwR3AQ8hh2iGHaGTNzcpo7vRE7zZoucJgIst
 gjYyxTWPdeWo/N+97TMX3r3MHBssCUyGHUZRUGwyaDJKkvjDuATDzfwQbfJkjPmoGPfy
 osXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678866519;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OgftObuJTNP008m6xoQZjZ0/0u/0zVJAfemwYNvM5dE=;
 b=CEmEqqu1unW8GEkwdt+yyb6cmwhndkmXcfF+mbUzsVFgnlGnd5RLw27KXV4b/CSB8Z
 orfe1zIoReQGpZFQJjlK6Pj+jWMl4A0IrLVFaIVuIo9UWC2sHSAUlOjvQLH9qgzG4TLr
 VbhmuG9W+cabiznfwgpwpyXNERMonCg9dVMjexAkj9VdLqRdMUf/A3rJWktGcrf97VYJ
 v+qOyPd0z6WzKyYIp6WAoH2z/j2hIrltAZ4zj9LictYaxPcYEKTySu9Dj9hegDM4rSNC
 C/sHhusT1TtFHqwKs4uxo3GjXWKcYSo9XC8qtoCIzs4rf0XO0HUH0Pai/e8Nfptf3srC
 ZV4g==
X-Gm-Message-State: AO0yUKVFTyf7l9njtQX+r2Ir5v/n6+yqDQI0uyz7R9ubYXAzQpKX+fGB
 sxmX1LuU+fzsy/sskbqVTQ5wFA==
X-Google-Smtp-Source: AK7set8uD1aNsH8wIDS6Y9yGomkJAI/mSGeqejx5HCFBGymwrfD/XYZy2UEqg1VSNahrqg57cyEEmg==
X-Received: by 2002:a05:600c:1c95:b0:3eb:9822:28f7 with SMTP id
 k21-20020a05600c1c9500b003eb982228f7mr16948392wms.9.1678866519712; 
 Wed, 15 Mar 2023 00:48:39 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j8-20020a5d5648000000b002c559843748sm3828218wrw.10.2023.03.15.00.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 00:48:39 -0700 (PDT)
Message-ID: <5df2eb0a-3915-bc8b-eb58-5058bb7b11ab@linaro.org>
Date: Wed, 15 Mar 2023 08:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/tcg/xtensa: add linker.ld to CLEANFILES
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20230314220832.2211028-1-jcmvbkbc@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230314220832.2211028-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 14/3/23 23:08, Max Filippov wrote:
> Linker script for xtensa tests must be preprocessed for a specific
> target, remove it as a part of make clean.
> 

Fixes: be5cac175a ("tests/tcg/xtensa: enable system tests")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>   tests/tcg/xtensa/Makefile.softmmu-target | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa/Makefile.softmmu-target
> index 973e55298ee4..948c0e6506bd 100644
> --- a/tests/tcg/xtensa/Makefile.softmmu-target
> +++ b/tests/tcg/xtensa/Makefile.softmmu-target
> @@ -26,6 +26,7 @@ ASFLAGS = -Wa,--no-absolute-literals
>   LDFLAGS = -Tlinker.ld -nostartfiles -nostdlib
>   
>   CRT        = crt.o vectors.o
> +CLEANFILES += linker.ld
>   
>   linker.ld: linker.ld.S
>   	$(CC) $(XTENSA_INC) -E -P $< -o $@



