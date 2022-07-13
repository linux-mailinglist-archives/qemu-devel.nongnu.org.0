Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844A1573AE9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 18:13:02 +0200 (CEST)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBeyz-0005i0-I0
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 12:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBep5-0002cd-1a
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:02:47 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBep3-0003On-2U
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:02:46 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r186so3632876pgr.2
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 09:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AtyoZplQzYXFZzNVvyapLzGVgaJnQdYMj3OwW5MWIQY=;
 b=QkurS7vkt6tfyux9G898QxJXWJbZ/So24cipXtkh6qD8ratwqNv0irybGbBgwXe7mc
 9H3gY1hJTiXG+4gBqi4pjMz7+36FCPA6wt6OLnAcS8GG/scHtV64OFtEz2bhHcLinlQu
 ZoCj0lfK+/UmDFxmc4aiZhhZb4kGNtc2KHdVvk0mgDjMGzax5mhXc3NFpyP3hr9OuPtk
 Q7B+Ozojx/IBLcEhZbdcEG9KeejB93ITWMl94FOvcrNaOQuQkCFqKszBL0KbmjVZsMs3
 kBZ9DhDfZZi6vJ53deIc1f0vMzLsplgnid7t0rdxMB2RJzsm5wqa5tGkJu69BxR78VZc
 ac3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AtyoZplQzYXFZzNVvyapLzGVgaJnQdYMj3OwW5MWIQY=;
 b=b0SOhjKp7rDhZrQ6yJHunH9amSddEyv1l/51g2+o0KneEZRw25ayrs2gCTlCl5jUC9
 0z7yh9efpmwrLIe0/4Y9RAG1MLmFPdm9yh793WEjtBtWRtnsOfymxgy8N5RRfsuyx0AJ
 vfjhEpHTbPtDjrnD6kGe2GaEpXNDATK/H2OeMvFpWkVWD0PXVfEsjlhdD9hJytAngpJi
 sYAxDPg9+Dgry+tosQVV3OPLEFI/odIdDaBG7Nf6hxigjBAKfwRC+iEuRdMMwQhJB50l
 aB2O5ZVLH9TACJox1mcLaAEbKKwHZ1B2fBYcj7pwcqnLocKDh0LGAVPgzReGu5KyPoqs
 MvCw==
X-Gm-Message-State: AJIora9L0s44bxbPMY6PRsORWgp+L6ADK76MM+zex78l6cBGbwLT3EDy
 z65D8fJsfLIJb9IkokURMcTckQ==
X-Google-Smtp-Source: AGRyM1v6YBfMP5f3yZ9IhGN2k7VfgYMcXjOJA8Srwk26EXrAxY/W4HK+NdtiofFS3FT5dsOWzTnM9A==
X-Received: by 2002:a63:6888:0:b0:3fe:49fc:3be3 with SMTP id
 d130-20020a636888000000b003fe49fc3be3mr3365789pgc.182.1657728163400; 
 Wed, 13 Jul 2022 09:02:43 -0700 (PDT)
Received: from [192.168.138.227] ([202.124.167.115])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b0016c1f05a8fasm9056252plt.182.2022.07.13.09.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 09:02:42 -0700 (PDT)
Message-ID: <0bc8a18b-6f34-4313-15b7-26ee2ca01994@linaro.org>
Date: Wed, 13 Jul 2022 21:32:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/5] target/loongarch/cpu: Fix cpu_class_by_name function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
 <20220713095036.705102-2-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220713095036.705102-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

On 7/13/22 15:20, Xiaojuan Yang wrote:
> In loongarch_cpu_class_by_name(char *cpu_model) function,
> the argument cpu_model already has the suffix '-loongarch-cpu',
> so we should remove the LOONGARCH_CPU_TYPE_NAME(cpu_model) macro.
> And add the assertion that 'cpu_model' resolves to a class of the
> appropriate type.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/cpu.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index e21715592a..ed26f9beed 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -571,11 +571,12 @@ static void loongarch_cpu_init(Object *obj)
>   static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
>   {
>       ObjectClass *oc;
> -    char *typename;
>   
> -    typename = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
> -    oc = object_class_by_name(typename);
> -    g_free(typename);
> +    oc = object_class_by_name(cpu_model);
> +    if (!oc || !object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU) ||
> +        object_class_is_abstract(oc)) {
> +        return NULL;
> +    }
>       return oc;
>   }
>   


