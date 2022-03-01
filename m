Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317784C95E0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 21:18:10 +0100 (CET)
Received: from localhost ([::1]:41444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8wi-0006Iv-NO
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 15:18:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP8ug-0005VE-T2
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 15:16:02 -0500
Received: from [2607:f8b0:4864:20::535] (port=45862
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP8uR-000371-JL
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 15:16:02 -0500
Received: by mail-pg1-x535.google.com with SMTP id z4so15184838pgh.12
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4aqV7LPZ8N9KOtKBkgoygdwJCp+HKI4pCis+b+IxtDA=;
 b=PBZBRwG9YS29xvHPRxph5goJqucv1pPINN9XeQ9Z90wwciXB55vHxZBIwZtcMmnFe9
 F0GoMj80biT8o0IQ6a9EVMSh2dywn1MVh1sbnDbgL1LagzS+spgNBCJsQmkiWEhqaexr
 BFrH9z+6c5j+dTiQkwau5uzgqoG1OiDOZ+YArEA9khBqSzjR5vx+LYRKWN42RXuvPrgf
 V1ToNjsC3zzM5QPC2WFBwj6R18zII51IoNbwokxfMx/3scm/sqEAI/lFH2+Jhf4pddjA
 cCwI87xIvZekWKJ42mmHKQe18C9wpxTbX6Lv/rp7NmHdq+VbwfVmDlm9qLSQ4J9f+Acx
 xQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4aqV7LPZ8N9KOtKBkgoygdwJCp+HKI4pCis+b+IxtDA=;
 b=tlUW3iuLm0uYiJUezXLx8t/WGul5NiwTp24fh9Uc7iVhe521HxjQwCYJ0K2Xlj6tgg
 tlwvERxNw09nU+2qmPpKZr4ulb6U0gOc/YS+n9DLbaGZIalrTvTthlpaXjfOWwhYI1fx
 aUTCbVt2ELl6Rd7RVkHFsoHpakfOVD/B4iB8K15d+IUo4DX4dNf74jzv4uFYtbp6H6AE
 m0jIsBUKew+LPiskgg7DEDzH5vJHvx9WzC8gRxUJSH/CquKnrEuu3LZ4vZ/e+hpkZtrQ
 8bXEpphytZhemnzNZiz2mQbTSCHqtKdggLdSjhwuHEYeyZC7L6ydf01g7YtlRdcZjoSy
 H+Qw==
X-Gm-Message-State: AOAM530H4SoerRHpHoRqbM8Z/TcjyZaQ0l+o660FKlOTw6/LLiCpNU9f
 +2vL/9h9hCXnEdESQCl8Q+DaYQ==
X-Google-Smtp-Source: ABdhPJzIOV2WP6GQ09nud3XLeMUPz+QOS7H9l3AptCH7La582/GdsCo/34iYDAsJh3F4j4aNqO208w==
X-Received: by 2002:a05:6a00:279e:b0:4ca:91aa:32ce with SMTP id
 bd30-20020a056a00279e00b004ca91aa32cemr29180588pfb.36.1646165746109; 
 Tue, 01 Mar 2022 12:15:46 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 w17-20020a056a0014d100b004f1063290basm18127770pfu.15.2022.03.01.12.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 12:15:45 -0800 (PST)
Message-ID: <234dc90d-7e7a-8281-d0db-14c8c4c6efea@linaro.org>
Date: Tue, 1 Mar 2022 10:15:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] tests/tcg/s390x: Cleanup of mie3 tests.
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220301195933.1500-1-dmiller423@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220301195933.1500-1-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/22 09:59, David Miller wrote:
> +{                       \
> +    uint64_t res = 0;   \
> +asm volatile (          \
> +    "lg %%r0, %[c]\n"   \
> +    "ltgr %%r0, %%r0\n" \
> +    ASM                 \
> +    "stg %%r0, %[res] " \
> +    : [res] "=m" (res)  \
> +    : [a] "r" (a),      \
> +      [b] "r" (b),      \
> +      [c] "m" (c)       \
> +    : "r0", "memory"    \
> +);                      \

I don't understand why you're still going through memory.

r~

