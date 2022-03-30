Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600334ECC12
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:27:50 +0200 (CEST)
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZd2r-0000N6-GB
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:27:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcmM-0006cE-Ux
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:10:46 -0400
Received: from [2607:f8b0:4864:20::22b] (port=35445
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcmL-0006dK-Fx
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:10:46 -0400
Received: by mail-oi1-x22b.google.com with SMTP id e4so22850751oif.2
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 11:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y9wtnu3rBShNxV9sXb/mYx3o0a/lYYAIEWbVgU2F9gA=;
 b=PWxmn0vYwgKhG/0Wkzlmte30v+qqnJeJiyo4LO7QbUaPTfb03ruuKfRzdSfI17o1e8
 Rtdr98h4/WFr+1RGY4QVG746MdCYrJ/ZpIGAT9cnUglKnlpEhcJWfWWYLoTsFOm5cLhM
 Wud+AO67TI0oTBTtemV01QbOllfpb0WkN88uOlGBkDDRqsSIH5vOkEdPfz4aoTIPaFP5
 y0wuGHfzIBSNR0xSXkIu6S91kgHaTHcjN4pmEchnGzDqTToGicaj3G1InwjN/OMQXRpD
 fugdsEPFoqHuqWr++FE61Z3bt7B42WhSy0J8FbYrJUbXsWVsIAetzWCIhP8JR0RUFOAu
 41iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y9wtnu3rBShNxV9sXb/mYx3o0a/lYYAIEWbVgU2F9gA=;
 b=qxtkcDOXz6p9UmHcXx0aTZVFSxgCrKgILT8DDnruJFMA7uiw6177Vk1UMb+k97HEYp
 gLpU7X/P2e+h4uHe2xu7GGMLOmlOncL8kCAGzDddScVO+UOnK5E0MKJRrhXDj83rGczv
 SGQuEgleCUJWf4ocAsPGr/j7IYP9Y1dhwco91qLb8+j+HpxC3qnqe3zX2p/W4xP9+o1r
 4wFsKh/CfTgGEZu4Ft4rhWt1pb6ZcD52R30xKjuPSrKkJK+m2pQ69fRnjPLWXSLBDYZ9
 ccMH9c92XBJrJxt724hi5IimieHuYoiOehFFDt34mDPvua84QwLz3PUVDUxGO6+dbr9H
 egZw==
X-Gm-Message-State: AOAM530jW7BUnDSqFLuIHx4NrIGbfDPhbNbl0k7tefsoojXsO+a83mx4
 dZ4sVdtpal9jkDdMZ0VxbF48JQ==
X-Google-Smtp-Source: ABdhPJzj4Qdn0L7UUR1qEyy76usW1WVUR99aQOcugN9rENK5wmfgSHzgu1ygIiz3+sP3AmwQ3yyWTg==
X-Received: by 2002:a54:4683:0:b0:2d9:9229:7d52 with SMTP id
 k3-20020a544683000000b002d992297d52mr547376oic.91.1648663844385; 
 Wed, 30 Mar 2022 11:10:44 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 w4-20020a4adec4000000b0032109de628esm10233784oou.6.2022.03.30.11.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 11:10:43 -0700 (PDT)
Message-ID: <a2cb6337-be91-0fff-30e8-1fcb6f4da88c@linaro.org>
Date: Wed, 30 Mar 2022 12:10:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 3/8] softfloat: add uint128_to_float128
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
 <20220330175932.6995-4-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330175932.6995-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, danielhb413@gmail.com,
 groug@kaod.org, clg@kaod.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 11:59, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Based on parts_uint_to_float, implements uint128_to_float128 to convert
> an unsigned 128-bit value received through an Int128 argument.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   fpu/softfloat.c         | 25 +++++++++++++++++++++++++
>   include/fpu/softfloat.h |  2 ++
>   2 files changed, 27 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

