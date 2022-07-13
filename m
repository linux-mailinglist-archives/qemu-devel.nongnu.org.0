Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F401573AED
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 18:13:41 +0200 (CEST)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBezb-0006E7-WF
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 12:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBeqe-0003wu-Kt
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:04:24 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBeqa-00050G-VM
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:04:23 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q5-20020a17090a304500b001efcc885cc4so4338692pjl.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 09:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ro+8T8kaynX7HF7OB0HKt8+YpbSwjw/MEWcFiToYUJM=;
 b=GcWhoe722wn0dnZUGgO1TARZDDeQCBAPI0iwbb2/lgCHq75REcHMzZ4yJ5SHBWOe4C
 xPQOEpyVTftgNpmDO1lAJ0nHLJrYUTTHAEulytX7lBj1zD2FMH3HK7sw27VZ6W8Qj5DD
 Y8IX600TIliXlHyr+fdSlDgAv3CH/8fvMsXUya6WaHbwtq5wLiYGgD3jS9AtBxqtq3Z5
 NkfN5mZpwCVw4pOOMf4d6Ui8/s4Jt6AHHbyhDsxNn9YiE7VsYQUTk2duKDiHg0szXo/w
 Jo5bUNVw6NWbTbnhsNCfBopyBLC6+bzGyYiQUU9xsIdgHRqR+xMpKyl+g0e2RwhwIPT+
 aujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ro+8T8kaynX7HF7OB0HKt8+YpbSwjw/MEWcFiToYUJM=;
 b=DypLJJoWytPvbBaTrXJvkkigiDlrSMRdegNwkKFR1tm7DKykiJtrK9eZDeLU1LCEYT
 I1tDGbFGA0zjSyEfD0RobUFKrGEbr6qU3JL3ZcLNVJwEt0Ys6WPGUdDY7kgBisWu1SpC
 W1BBhirwoS5y47Z0iKlD73xR13/QcEewyz0fAQgJujw/dg4/3QwOlBdp9zKl8DrxGjXz
 DF5QaPen2EH+hhVvfDFyCybJOjVcBImfWFvnJlDowEXkYxltFfRnuPrtHn+cAJswsGSb
 v1shhOiDExiVTMp/wkZDAJjr2yxaHXUZSzuj7wlQjnP7owH9ZBF7qr9tiwMyJDZtlCz3
 MK2g==
X-Gm-Message-State: AJIora+gQKqBgGQPNnc2wTO9AnIIf4ZpWICX/BeX25Zp9v/68PxGUK5t
 Yp2QdJSEmHulDl/2+2V0B6+LSw==
X-Google-Smtp-Source: AGRyM1tQGjnRpzYWfHz13TM+EUxKMi8En8y0kkEanMYqXq930rDm8cFW1lpUGkBYL29haZoWbvgvig==
X-Received: by 2002:a17:90a:6741:b0:1ef:7f62:6cd1 with SMTP id
 c1-20020a17090a674100b001ef7f626cd1mr4440868pjm.89.1657728259405; 
 Wed, 13 Jul 2022 09:04:19 -0700 (PDT)
Received: from [192.168.138.227] ([202.124.167.115])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a170902968200b00165105518f6sm8974957plp.287.2022.07.13.09.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 09:04:19 -0700 (PDT)
Message-ID: <b7ca2b86-99f8-2946-5c6d-02c8c893a77f@linaro.org>
Date: Wed, 13 Jul 2022 21:34:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] target/loongarch/cpu: Fix coverity errors about
 excp_names
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
 <20220713095036.705102-4-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220713095036.705102-4-yangxiaojuan@loongson.cn>
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

On 7/13/22 15:20, Xiaojuan Yang wrote:
> Fix out-of-bounds errors when access excp_names[] array. the valid
> boundary size of excp_names should be 0 to ARRAY_SIZE(excp_names)-1.
> However, the general code do not consider the max boundary.
> 
> Fix coverity CID: 1489758
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/cpu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

I gave you a reviewed-by for this patch in v1.
You must copy those into v2 so that I don't have to do it again.


r~

> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index ed26f9beed..89ea971cde 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -140,7 +140,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
>   
>       if (cs->exception_index != EXCCODE_INT) {
>           if (cs->exception_index < 0 ||
> -            cs->exception_index > ARRAY_SIZE(excp_names)) {
> +            cs->exception_index >= ARRAY_SIZE(excp_names)) {
>               name = "unknown";
>           } else {
>               name = excp_names[cs->exception_index];
> @@ -190,8 +190,8 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
>           cause = cs->exception_index;
>           break;
>       default:
> -        qemu_log("Error: exception(%d) '%s' has not been supported\n",
> -                 cs->exception_index, excp_names[cs->exception_index]);
> +        qemu_log("Error: exception(%d) has not been supported\n",
> +                 cs->exception_index);
>           abort();
>       }
>   


