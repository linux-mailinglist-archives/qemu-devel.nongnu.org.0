Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09508698425
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:09:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSN9H-00050i-Kl; Wed, 15 Feb 2023 14:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN9F-0004z3-V7
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:08:57 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN9E-0004J6-BW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:08:57 -0500
Received: by mail-pf1-x435.google.com with SMTP id n2so13424705pfo.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L+Lg+BQgWPuerY/vuUEpP7lPT2OYgMD7q7iZkm1jSIY=;
 b=tr+FMvVdJBmxZYpfQfIG/7sPdL13bdKawnecqQPT1Yu8UgpuupG5AfxgK+1Eperofr
 +ueajZ3KK2GRcaCznrDiH7ZOKCd0OA4oaWFMIrkCyUE6QyqxS1+1OhFX0dC8XmDrndZk
 9RuJcq/mz0w2skj28g+AwiOXg6yNwZfr03fMkYZB2dIIN3Sf6UM5Fk0/I3gxBfiWMCNt
 FRRuf+ohpIdmgH4BSa49o4n2wI4TCy8IvEvDKL7RNT8sdLbWe8rNK1C4/yjeKh6awY7u
 N1ae3RaOXTlCGc+uflgFo7TmR4Y4ixq0muKKJYbGtT3bX9GT6DZeNpBigwPpoX1JFU+d
 2okQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L+Lg+BQgWPuerY/vuUEpP7lPT2OYgMD7q7iZkm1jSIY=;
 b=ROEWX0ipAs8HWhiKvJLqpQ4AUudle9+dKPXEukqQBgXXnkqvp+hkTtQAfjctisilln
 MouU3aAZXE37INwaTzu86a7A7Buhosf+I0IPcsUPuLPKQGm8piu/AmRiAEyOfIL4Pnhm
 vg25nB2X+Maz6msF0YDJ5pHaAa3Tpyfk/uP4madX/33c1iRpNObJaf97oJmoEqD+vIcV
 OTvuv/cXGE6mLrP+sgPyx7eERRiLVSay1dcsjb3kbzDbqjyEtQTVcFfBr4XPYbeiOvti
 DbtL1BsivDarjaobVF96+vkUs4UeijQt2UFNycPeBGO69oqvY33unM9eTJ6wUxkvRI8t
 bcSw==
X-Gm-Message-State: AO0yUKU93pX7Bsfaafn4716tzd6EjI9Tl+XfjjdryhIFCAmUAsvmBHuv
 93Ui4Wwjsx7753nOYcNvzQSXOw==
X-Google-Smtp-Source: AK7set9DW5Wo/0K4Hf/CYGCGtnv9GN0VDZOhtmqqrJDZCOeAo6H8gZvfMEoAZGmnp2pH6LPRk1sfRQ==
X-Received: by 2002:aa7:96c6:0:b0:593:af12:9460 with SMTP id
 h6-20020aa796c6000000b00593af129460mr2395917pfq.34.1676488134944; 
 Wed, 15 Feb 2023 11:08:54 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 k23-20020aa790d7000000b005938f5b7231sm12004769pfk.201.2023.02.15.11.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:08:53 -0800 (PST)
Message-ID: <4a6ae710-89b4-1b3e-e37d-25e48608f575@linaro.org>
Date: Wed, 15 Feb 2023 09:08:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/20] hw/ide/isa: Remove intermediate ISAIDEState::irq
 variable
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 01:26, Philippe Mathieu-Daudé wrote:
> The intermediate ISAIDEState::irq variable just add noise, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/isa.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

