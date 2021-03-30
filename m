Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3428834F249
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 22:34:22 +0200 (CEST)
Received: from localhost ([::1]:47236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRL48-0001Tw-VE
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 16:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRL2S-0000sS-5s
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 16:32:36 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRL2H-0006d3-LR
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 16:32:35 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d8so6763917plh.11
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 13:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lAGLhnoAN0autVYBIN3z7m9YHFWU+fGKvYdeGcW/CHs=;
 b=cpbYNU1WmptU7tXu9i/q2JsRIPqBPzZkQ6uExr/HtTQBnzLd6x2fbBsiXIQkJfoqkO
 V9FYHkAau5fLR6ueiti/SZfEva4CqwofUjsh12dbmO1wWCa33Fakn3P/EVPMA6sHHELn
 KkjEMAvl+08LQuNFa7QjYY2lnR4SBkcTGGWbrvA64i80KYv7FfDXsCfY+/V+BR82u/bX
 tnpsQgksAZ5zYDpdhvaUgml3zZyNairGPW+tUuKdGQYku2W+W+y39y9eD2vWCh9EqFZ0
 X8b/NjO4YRtZTASpEBRIqE9IA5GdfCrmvAg8qYKOGfT3Y1FZkfLWS+vmKoeaiq/4nomu
 Ci9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lAGLhnoAN0autVYBIN3z7m9YHFWU+fGKvYdeGcW/CHs=;
 b=hq+7aAQbts5R9lq0BVzgSK5Atfokm/NCAcyhmJVTNI//1u22KXdP2Z4DkhQ08OuvDd
 aIMUNS0Gktn5u24KQPnuHljfnmBK9yiSxLJ8iSoGTRdmPQIg3irfcZ7dJ+//YBQYMFuB
 5DK33k3sArP5nxxce9Br+By8nvmAQ2ALx2ijJYVqV9VaQVFKcYn51ZAPqjHa1nyq4KJW
 SIMpKVhiWAUuIARMBYujGBpHY4tpoS1djlvIJ7LqzTHQ/Sn6jpVIrIh3bKuKte6swnD4
 5WXgQVQydHcAphegd5YXQZdoULxakkFeoDSGPO839PB2eXH+g/CCCoa7PlvwsqWeB81H
 QbYA==
X-Gm-Message-State: AOAM530jOjDXcFA5OFpvW2jCKSkaeHR1T18ejHkkB8a4skMNJ3EYjDGZ
 f090xchV59GlCN82y8CAq3ZBgw==
X-Google-Smtp-Source: ABdhPJxIxsyYj6GPT8Aikhm2f7h78lpbA/sRF7Eo9kmdDsXgxRMJk4B+Cv5nBXwqkYILexpUCJGb7Q==
X-Received: by 2002:a17:902:a587:b029:e7:347d:4872 with SMTP id
 az7-20020a170902a587b02900e7347d4872mr133421plb.2.1617136343637; 
 Tue, 30 Mar 2021 13:32:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r16sm21152911pfq.211.2021.03.30.13.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 13:32:23 -0700 (PDT)
Subject: Re: [PATCH] target/xtensa: fix core import to meson.build
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20210330073036.24575-1-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <874d23cb-4d14-a5a6-4e57-0d8add130c36@linaro.org>
Date: Tue, 30 Mar 2021 13:32:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210330073036.24575-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/21 1:30 AM, Max Filippov wrote:
> import_core.sh was not updated to change meson.build when new xtensa
> core is imported. Fix that.
> 
> Cc: qemu-stable@nongnu.org # v5.2.0
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>   target/xtensa/import_core.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/xtensa/import_core.sh b/target/xtensa/import_core.sh
> index c8626a8c02eb..f3404039cc20 100755
> --- a/target/xtensa/import_core.sh
> +++ b/target/xtensa/import_core.sh
> @@ -66,5 +66,5 @@ static XtensaConfig $NAME __attribute__((unused)) = {
>   REGISTER_CORE($NAME)
>   EOF
>   
> -grep -q core-${NAME}.o "$BASE"/Makefile.objs || \
> -    echo "obj-y += core-${NAME}.o" >> "$BASE"/Makefile.objs
> +grep -q core-${NAME}.c "$BASE"/meson.build || \
> +    echo "xtensa_ss.add(files('core-${NAME}.c'))" >> "$BASE"/meson.build

We should be able to do this directly in meson.build, without having to modify 
the source file at all.


r~

