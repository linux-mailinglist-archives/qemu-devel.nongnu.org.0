Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9072DC931
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 23:45:45 +0100 (CET)
Received: from localhost ([::1]:50766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpfYF-00071p-M0
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 17:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpfWK-0006RV-CW; Wed, 16 Dec 2020 17:43:44 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpfWI-0001rB-OB; Wed, 16 Dec 2020 17:43:44 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ga15so35094619ejb.4;
 Wed, 16 Dec 2020 14:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=90Q6AZzTl7VUndI3rULQeoUt16Yk6Kpcn5eb1cDTO8w=;
 b=CVH+Ten+Ke/3v3pw2CU9apaU1lj51iP0Y6nmBVpwf2VxARJDDmjWP0HQzAaQ0KT9CO
 InZIbByUxTG/HQ/e1aCmSVIHzYO0bmGyi/apTj6aC5zkf62GaMa3DcNGenPDn+Pfcijr
 oSSlsKhC/KTDG37REGnZPUcNLp5dsPXekBhclcuoaDq7Y7X/Vp+ergl1B4nVEZa5iMer
 1ZFeSEjfISZY5op017Jo0LOd9adSjnHcs72NiB60CqJzShdTWpyNYAtlXxzC6iQCtsjo
 tTBgEboCt0zVK4tlmgMTosAnCRAG6vJVHC1Ly5paGl3v6P7Fhf2YFyG4zED9gn6MU/Fa
 x99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=90Q6AZzTl7VUndI3rULQeoUt16Yk6Kpcn5eb1cDTO8w=;
 b=cnUQIlFD8voXcu6lQ2P5odh67PM8Tcu7C1FlP1qzVCWCsVZJcpLpns7OxixqUFo0u/
 VAGbPUEf4Oa8rwvsZi7g8rY2cIJ2EN9AaPZegUzfpFVIV78+7UsMJr0Uiuhz/SMoyOw0
 QuJKilu5QbF9qCGDfwB3bb15Z7pdxzzo2LlfU02dua9/MsQNw5LGSxdBGnkvXrgg2IpU
 MGUlbM/+XzP/+/3tjOi5tKh6EWqkoBv8KlXY5w53ShiCnhqDYTVeQ1VQ5yvNxFzzHPzK
 HlUc5HO15sHh/D8zGHZldlpwQIpccF89u/odQRLnEEhznhNDxpouxdY3bkuV7k0sW8Yi
 sGRg==
X-Gm-Message-State: AOAM530spiV7ZL7jE6jNpkAa+pKRh/AdpQBoCZLZ6bFYqEixEwQ421H3
 EVTIvaOh9qNkYgDZxmHzMehcf7BZzFk=
X-Google-Smtp-Source: ABdhPJyTqbcjAv0hjUPdcdodTWGYoJoYog/iuixCC4zKYTHF4aXjtc+aNe3KbcInJH2kaKln8MurGQ==
X-Received: by 2002:a17:906:4e50:: with SMTP id
 g16mr33971853ejw.191.1608158619959; 
 Wed, 16 Dec 2020 14:43:39 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b14sm16640555edu.3.2020.12.16.14.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 14:43:39 -0800 (PST)
Subject: Re: [PATCH v4 3/3] target/arm: Use object_property_add_bool for "sve"
 property
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201216221247.522686-1-richard.henderson@linaro.org>
 <20201216221247.522686-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a2b26de3-7181-38d5-053c-86128e20c22a@amsat.org>
Date: Wed, 16 Dec 2020 23:43:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201216221247.522686-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 11:12 PM, Richard Henderson wrote:
> The interface for object_property_add_bool is simpler,
> making the code easier to understand.
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

