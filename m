Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B51557176E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:34:58 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBDEG-000422-IZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBD9W-0007Ae-Iq
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:30:03 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBD9U-0007UQ-Ob
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:30:02 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 v4-20020a17090abb8400b001ef966652a3so10960636pjr.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WSjBhF0YzHcl6wlz9hstFvCuHPialzP31d7pQsVVCZ4=;
 b=t2wH0FL4CsoEb0h89XFP+zh/5jhl4kx/5CI7q1JX9JKx8honlwDhH96v6k65jBWrGd
 6FiCoD3w77q+eO/YNP5lTLqhBRWFHWsjf5BH3/mtq0xSHLVwKz+j4fQw5PLcKAk54zzF
 Z/lzTjpGRr90dewmbN5J/IpbQsxR0kDIb7bVyOUcIZLBs57s/IoqMC1F0EBvFxGfg3hE
 tf3DKP2kGfEwje0tWE7hOpbXUtCDYGwsFxdB87Dzd0MjXwokCqm1vnA5aiby0pos2obE
 /yMTZ3B3sBt+22H98laCQgudkLgbv7TyUTK9hwaxz5f3qRhrKsulrhUQTFeO1NP8Ez10
 CsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WSjBhF0YzHcl6wlz9hstFvCuHPialzP31d7pQsVVCZ4=;
 b=eXzpNysA2TizzIhgM/HHgJyBN6Q/TdeifrwxYaSK1pP2IuMRT4ms+Lkgn3XuTeH5g5
 UjT7uO0NKl3X572zpe0YVxDw5CRb760R0gGDyJj7AGHkjskSNDEXm+23C/dYUcJRC0cS
 VsPjTV5j2UYFytYWpEx2HSV10P7OAF1mqaKpA0Ivbi8szoBSDThD3JQ/9QbEboX4ct9j
 P7vn8CYwHmyXrgpz+PR0yZxASyHzCOED3kOxEmEJRiKyK1snOnfkwcwpmp63G3xdMVXl
 n2jYTI3TydyI/WRwHcsE1KdTDuYOUC7COFwqT48/aL0o8gigrLJ1X5XEUX//C2NYBuwX
 ZNUQ==
X-Gm-Message-State: AJIora8QabqHAp+SgjgOBdNCy7nX1FNA1QVtqwUYuNk/65xobrs1GEZ3
 1ydBt+Np5f/wKpAO4R60lM+LNA==
X-Google-Smtp-Source: AGRyM1s5kJj5RX1xxXKBoTMxG6FhAaCCIc5sRo8fB5ZK/EoQRhgJEHrgezI7jQSWsmki0Mde3oAJyQ==
X-Received: by 2002:a17:90b:4aca:b0:1f0:3395:6432 with SMTP id
 mh10-20020a17090b4aca00b001f033956432mr3387006pjb.19.1657621798249; 
 Tue, 12 Jul 2022 03:29:58 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 u28-20020a63471c000000b0040c644e82efsm5693541pga.43.2022.07.12.03.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 03:29:57 -0700 (PDT)
Message-ID: <1e9faeff-5797-5093-ea31-d9b77faf474d@linaro.org>
Date: Tue, 12 Jul 2022 15:59:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/5] target/loongarch/cpu: Fix cpu_class_by_name function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
 <20220712080133.4176971-2-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712080133.4176971-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/12/22 13:31, Xiaojuan Yang wrote:
> In loongarch_cpu_class_by_name(char *cpu_model) function,
> the argument cpu_model already has the suffix '-loongarch-cpu',
> so we should remove the LOONGARCH_CPU_TYPE_NAME(cpu_model) macro.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/cpu.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index e21715592a..8294b05ee8 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -571,11 +571,8 @@ static void loongarch_cpu_init(Object *obj)
>   static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
>   {
>       ObjectClass *oc;
> -    char *typename;
>   
> -    typename = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
> -    oc = object_class_by_name(typename);
> -    g_free(typename);
> +    oc = object_class_by_name(cpu_model);
>       return oc;
>   }
>   

Looks like we're missing the assertion that 'cpu_model' resolves to a class of the 
appropriate type.  From e.g riscv/cpu.c,

     if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU) ||

         object_class_is_abstract(oc)) {

         return NULL;

     }



r~

