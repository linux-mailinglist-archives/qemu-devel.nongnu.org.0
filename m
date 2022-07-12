Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A459571771
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:35:34 +0200 (CEST)
Received: from localhost ([::1]:34984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBDEq-0004yN-VE
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCtU-0005kG-KL
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:13:28 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCtS-0000KW-PN
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:13:28 -0400
Received: by mail-pg1-x529.google.com with SMTP id p11so377217pgr.12
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 03:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kZqn4TXEwJMW1HgVDNGK+WjAkBTafguZAbPsc8RKmfk=;
 b=YMKDzpeePrvZAZyA/TFiqs5rUlcPI+y/MiwcYhJ3ENqRfBK0JQZBLp8ZkiQB9iKThZ
 u5RsrMmsuqRAnyiOmjeAOa6SWwHgYX81ACJsNMZSf9fB/w/CGCWcn98JGz204IJ6Ygvk
 dp6Zhnmr3a+mcdcOelEe/dqhZzFUgQcsQlyD2VX4CbGek2mVP0/aXjSEP0QJZ4cRkj8t
 aFXJ9j5K2Zdj/NWyBHB1FbkpmSMdfEnaJvMPfHhcJn5KX+iXjisXuc1/xNecWLEVj1j3
 aIoF9s+vzkBJUqZoNfi9FyDuoT9mOY6knLw7X2otNTtrTYfIxv94Sk+swz+TR6tbUZvy
 +7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kZqn4TXEwJMW1HgVDNGK+WjAkBTafguZAbPsc8RKmfk=;
 b=22bTom1bNmy0uOJFBa5H4min/OKg+RmVZu/g4ojMvQGEGfXnNRbOCsL7Z/qbM04WlX
 kxNi1L1HGisn1CIiUSzZYZfg1XyKWEhetytBN+n74YkVZSkKdgSE4Q3ipivDscrJh3Om
 ZFWL/60HDx9OzKiyrVSf0i7nxCneZ9Ugh3s7gHLzGFWtEhZ6bHdTeO6vUVW39pLfHW8P
 DlpFHWDaN16fDGutSeXgV7QsnfWuY31G3OW1on/T2s1brV65VVeT/xLme4N3tXC5uh6Z
 9NyTUYgsm4ku21008SCTfObWKOXfOHCJeOZtBIYhXspcEHKmZPqoEqSxEjb3q9vJY6Zd
 wACA==
X-Gm-Message-State: AJIora9M0d009e2LeyvPNtWBt861UH10wcoia+JKkaR+lnkep3FrLGfp
 tnLFFiDaXE5VL3zJMZA23xpOwA==
X-Google-Smtp-Source: AGRyM1v/nGf4UcoZusX6rcagYgd8rSQFDXy7QbDIxXENCx/iOwmiDbijbQGnelwEN0gWc4mf7JTVVw==
X-Received: by 2002:a63:500c:0:b0:412:a56c:9ac with SMTP id
 e12-20020a63500c000000b00412a56c09acmr20660194pgb.158.1657620805215; 
 Tue, 12 Jul 2022 03:13:25 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a170903228d00b0016c35b21901sm6064814plh.195.2022.07.12.03.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 03:13:24 -0700 (PDT)
Message-ID: <342916e7-f296-60bf-d0ad-4d8a0df13e0b@linaro.org>
Date: Tue, 12 Jul 2022 15:43:17 +0530
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
References: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
 <20220712080133.4176971-4-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712080133.4176971-4-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 8294b05ee8..8e17b61a85 100644
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


