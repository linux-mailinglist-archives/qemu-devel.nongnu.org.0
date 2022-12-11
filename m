Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF636494F3
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:44:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OUv-0001p6-Jv; Sun, 11 Dec 2022 10:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OUt-0001nr-Is
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:44:11 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OUq-0006s3-SO
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:44:11 -0500
Received: by mail-ej1-x630.google.com with SMTP id m18so22278594eji.5
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HyWLC8AuBHQ2oJlTqQIB2Rst4CDqi36gPfQ8t4M5bPg=;
 b=R6x5p0ASMfFX7RyjEnRwsOoKjTd6LYIVxH+wQmzLpo4H0ACXoH5oPxeuscZqr+Ix0s
 RCQ7BIhgv7jy8NM/RJPLSxMqzYbUdLaN3oObuyW3FxsqE/K74R9p6Lzg5+6a4Hcc53CG
 fnPton/Qr9AoB/2ER6RYyN9tl6vAMmtpN+2Vi9i2/34riIlEbS+mJ0vK9cnCYFxwor7j
 fEtbFjQ6OXQib7Mh4Ci1yNjZ4pJl4lvdGiSmn0TBYnRq15jmNOr3iu8bOCe4HGGzXfQu
 IlvgbThAFpNUwwSyhdfl7kuPXEc3sAVtvOkQHv3mrnKLUP6EcChAi+u3p7No7kuPKTGr
 Z38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HyWLC8AuBHQ2oJlTqQIB2Rst4CDqi36gPfQ8t4M5bPg=;
 b=VW8Hr17EVGjXA03ikcDh6UIyIOL6gKxhhIrqMawMS+h4akMEQdZA1lVFulF7SZ5ggF
 2GpyXazd0f8wj/o0tUhHY8aGfR0Dmhry02a38sQjlVnOxro4/JIVTvwIQA1lBe7CsCce
 C2Ox8/kYuqL72uMbzSMa7WkXnBm/0zXuVgJSO1Im19+FFDZG4jhKsWskfdZR/UGwkxyZ
 H4EWYTUDkCbiGKHcvJzl0SjgTPEamD0irfhyxh/wnZ26xXUOQNu5lrsZ/Zh28CdluO5V
 1fPUled3O6X34ksTTBs4msGSpvBGQsfVn/k8lGtnhjdGEls8zTndhubC3x8Da2XtcTMD
 SS8A==
X-Gm-Message-State: ANoB5pnQl4cm5zH1SCOc91OeLk1LXigH/Xi2r3KFJX40rLT47D2wzg5g
 u3edfByiAg4TIeUbToid0peSdA==
X-Google-Smtp-Source: AA0mqf578phJRMpcFLpWdaCJQVVunC/2c7PfYP94DARkiDJLjO7v15C3XaPCTTMdi3hcoCvb72KK4g==
X-Received: by 2002:a17:906:d18f:b0:7b2:75c6:6d3c with SMTP id
 c15-20020a170906d18f00b007b275c66d3cmr11376959ejz.74.1670773447288; 
 Sun, 11 Dec 2022 07:44:07 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a17090653cf00b00734bfab4d59sm2209990ejo.170.2022.12.11.07.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 07:44:06 -0800 (PST)
Message-ID: <d9228dc2-bf22-a1c7-d83e-887a6352bdab@linaro.org>
Date: Sun, 11 Dec 2022 16:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 03/27] target/s390x: Use tcg_constant_i32 for
 fpinst_extract_m34
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
 <20221211152802.923900-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221211152802.923900-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/12/22 16:27, Richard Henderson wrote:
> Return a constant or NULL, which means the free may be
> removed from all callers of fpinst_extract_m34.
> 
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 26 +-------------------------
>   1 file changed, 1 insertion(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


