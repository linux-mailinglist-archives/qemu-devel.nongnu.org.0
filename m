Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1B6391FCC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:58:04 +0200 (CEST)
Received: from localhost ([::1]:35916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyjD-0007X1-BP
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llygF-0003a2-9P
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:54:59 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llygA-000468-VZ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:54:58 -0400
Received: by mail-pj1-x102d.google.com with SMTP id g24so1318772pji.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Er/n4B9aBaXPXP4658LiUQhCkMey/127l0ZicCfFUTo=;
 b=kb0D3hPddxdeo1LI4ue6utmCO5tmxvuo/9uh99LjpCKldge90UW48LPqUtF5Uqt2PE
 2h3Mpbfn4fFu4BNxk+FagG0IRdgpYQRb152l9369/+4m6Us3eLCeYga9ozyFgbBbtpFm
 LKXkA7eHXjqbQzNnPtfuF2/beimBm8/zByFKzB8t/oUk/ZXss0MY13Zu/ikVSQxO2Yxt
 K8i3GVREClVMnGEJOR3zxxphLkupEuKIolm78os6mjL89Nj8wW86Oz8CROD431A2XlUW
 fvkd9KpjdrVjArRb4uPmRfxuGJ8q26M7qYJCpGmgynJu/5aogZhNkjQog7APud9/HtEZ
 c6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Er/n4B9aBaXPXP4658LiUQhCkMey/127l0ZicCfFUTo=;
 b=FKlftvkiqNTbiU9PwK8U09tvf9ziJbyhtQVlPXfqpcyUuJmkJ7NzLNWjbst4gqL31m
 vSaba5R3wgupqPqJvpzJ/DO9sFZIZ832g5sPkJCn1/3g8QzyIgRFIGcHaj72Yei47ZIk
 uBGaNh2tDj9WRomamzdejAxZMlPbYtEm2FMDC2PB0Js/pAg9Gayhiprp3i3B9lC1zIWx
 MbsR6abOlqigutxB8F89froLhLSlDFFMq6FNDiYqtr6pmwef75FxDva6Zbvk71KeflUh
 uNGa8/pg+uRys/M2JtoJWKfqsjQAgvVKJzbYlqgjPMXbvB9u4Dehjb15W7IBsGTfnbLd
 9voQ==
X-Gm-Message-State: AOAM530ygJECXW7x+t5ooVeHNLgk9WcbFELPgnC9nA3SXbhguZidMGiU
 Mmtt3ZxmFBnnXPIz8UrASnpUwg==
X-Google-Smtp-Source: ABdhPJzY46ggm3nvjAPOjw6ebkQKbLybj7CRwBinmqnG6MaHlUBWqdxSzsLK1QwP2prLcCcuczVpTA==
X-Received: by 2002:a17:903:2290:b029:f3:9129:8397 with SMTP id
 b16-20020a1709032290b02900f391298397mr36720340plh.13.1622055292586; 
 Wed, 26 May 2021 11:54:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ch24sm85269pjb.18.2021.05.26.11.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 11:54:52 -0700 (PDT)
Subject: Re: [RFC PATCH 07/15] softmmu/globals: Remove unused 'hw/i386/*'
 headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1a75f8a-7705-1f69-12cd-960eba66f9e2@linaro.org>
Date: Wed, 26 May 2021 11:54:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/globals.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

