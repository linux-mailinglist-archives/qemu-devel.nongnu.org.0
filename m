Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C65B3F3D8D
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:21:27 +0200 (CEST)
Received: from localhost ([::1]:46768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHez8-0001NC-6V
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeq3-00067c-U1
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 00:12:04 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeq2-000566-7X
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 00:12:03 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t1so13363952pgv.3
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 21:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HEeuWdwf+SnYQwh58sj5ZxXDJnt7MIGTNQi/SC1os44=;
 b=sQZyDCCAy3OYOlKcoDKKG1UzmyGNxFp5gwkyBuTwZuBRI+s3Ejib2sv+LpXRRi/qjC
 Lcttci5NLpeXv5so2xYeXGz3yYPFPr/BjMgMezebStGP+fKteZcLfw/2bZymINnOUbU0
 1IlU8sp1od+Fe3OWsFTGpdPg80I/XFYAX+ELPFMCJs+jaHFAejejnJOJZEOCVddP1KzR
 FcxMMLtkB+YF956MJwCmG64mMuA5qkFmDaJotUOcY1YNNPWR8bE6PTGVW9f1L2GdOBEW
 1qZJwnXBfTQCQ7Y0zeoTqMKXqCn0orafbCXT0Exv4eM3id1A32fVnfhRBWeG7pr1TXto
 A+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HEeuWdwf+SnYQwh58sj5ZxXDJnt7MIGTNQi/SC1os44=;
 b=lZPdDq6Kd2GlFn84B9Qs3oZUqzAFG31m28TQMyI3ZWI/qL5a2CAfVhbZbSbuLQCXIT
 PMAtIK6Yx2eIS05aLA5xRs825ixDghqK/BMX6608AHUf5y6PwsYwY1tFTdxr+ptVjoI4
 Y8GXT9F8+dVPLCHJxJCgOF/7YiBJs38aq8IDFC6ALbOvztUkcig/kzkLUgqkf/EMcySj
 uuQpz459fcxfEC2t8uU+JoPH/5b4QTKrJWMhzoMT+uX81t37YgyReE0S1kWTz9XgAH6o
 TJyGTng44E6TjUON0NaDvILB6AQbEjRU4wMb3JzkDl1dfWmdGJRtsrYPOzf8U2Da3j+4
 fy4Q==
X-Gm-Message-State: AOAM530xj/gsuDbVskgWFm8GX37pFa3RgPP7RVdSUHwnxNAb9tAJRmTg
 u7/TVY8wMsjkhoRe6Ul8AIgvghiwuSxZEQ==
X-Google-Smtp-Source: ABdhPJydRkt850/jtuTDohbdE0X5qWbh/VuG+CiQR6lYM+0rfBlQou8CpFoG928yAnB32e2Bzct09Q==
X-Received: by 2002:a63:e413:: with SMTP id a19mr25949058pgi.408.1629605520761; 
 Sat, 21 Aug 2021 21:12:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id a10sm1855392pfo.75.2021.08.21.21.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Aug 2021 21:12:00 -0700 (PDT)
Subject: Re: [PATCH 2/5] qemu/qarray.h: weak scalar type check in
 QARRAY_CREATE()
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1629578875.git.qemu_oss@crudebyte.com>
 <a3f07198ba9e12b45ef38b45fa543e9b597ee70f.1629578875.git.qemu_oss@crudebyte.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <85cd9b4b-9137-d4c8-a12e-79d6e5790a36@linaro.org>
Date: Sat, 21 Aug 2021 21:11:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a3f07198ba9e12b45ef38b45fa543e9b597ee70f.1629578875.git.qemu_oss@crudebyte.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.49,
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/21/21 1:30 PM, Christian Schoenebeck wrote:
> Unfortunately something like
> 
>    _Static_assert(typeof(a) == typeof(b), "type mismatch");
> 
> is currently not suported by C. So for the time being at least
> check that the size of the scalar types match at compile time.

Did you try
_Static_assert(__builtin_types_compatible_p(X, Y), "type mismatch");


r~

> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>   include/qemu/qarray.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/include/qemu/qarray.h b/include/qemu/qarray.h
> index 230a556e81..2cb8656c5d 100644
> --- a/include/qemu/qarray.h
> +++ b/include/qemu/qarray.h
> @@ -27,6 +27,8 @@
>   #ifndef QEMU_QARRAY_H
>   #define QEMU_QARRAY_H
>   
> +#include "qemu/compiler.h"
> +
>   /**
>    * QArray provides a mechanism to access arrays in common C-style (e.g. by
>    * square bracket [] operator) in conjunction with reference variables that
> @@ -143,6 +145,10 @@
>    * @param len - amount of array elements to be allocated immediately
>    */
>   #define QARRAY_CREATE(scalar_type, auto_var, len) \
> +    QEMU_BUILD_BUG_MSG( \
> +        sizeof(scalar_type) != sizeof(*auto_var), \
> +        "QArray scalar type mismatch" \
> +    ); \
>       qarray_create_##scalar_type((&auto_var), len)
>   
>   #endif /* QEMU_QARRAY_H */
> 


