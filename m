Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2403343D84B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 02:59:16 +0200 (CEST)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftlD-0003Wj-9b
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 20:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftga-00005L-OV
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:54:31 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftgZ-0000ml-5c
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:54:28 -0400
Received: by mail-pf1-x429.google.com with SMTP id k26so4363615pfi.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ey7w2R2wbWV5X8Hx6NtpBMADhn+mL2JO8GzvzICaG+Y=;
 b=x1aGi5m6uRSu8Ml7150XRhx6wOMJTL+ldKBIsi1Zqo/sVQPNi68vrfMjwR2rBOMGrt
 YKU3AY4Q5RMoZ/RXjKIWoDO/iAfDqIHQJUKz9mGJY2HhnnW6nNze7nRZNmTIFuGjOICv
 QoB/po3ax0Ifgrr5AqMf08c9eeTPiVhZ2qmELJeP1hbWmdLWaeQxM5sSGvTNMpZ16V3O
 R/YBaG0UpWFIvYVlfp7ZIwF4ur/vYcPUh4ySxRvOn+yLzoPl1uQI5QjcK0sOpZoyh8Ed
 LM29Zf6+DfmltPtUcFd7wz0GPCP3/Ujn94irCE+RqbEuBYuiwUF95KlKQau3rDK8Pyz9
 TG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ey7w2R2wbWV5X8Hx6NtpBMADhn+mL2JO8GzvzICaG+Y=;
 b=WiZNwKztf3c67Kj8F2NAb3PWXm4g5vOAIZxyzXDYraGfzCXenD/LTzweDHaGWNWOnd
 Eucakp9Ai52hhJ0umptceXIU5o5Etk9ADByeOHfyZ0ZKebX8p0z8kJzWgpMbCjH2NWnA
 DD/tymQ+SOD6apVVC62lDyKMu30pzDxiv6Gd8SZziZs0HDLqyM+FlCD+fKNkltZ0La+k
 K/LnOjcZBNB5f1lgUFnfwy9d75kSztNF1V1kOitq5di1Lx0SsiJtvVX3A7DntpOWXyTE
 uVeGzRti8f7kRJstpV3VkTwzbPdwRCCeX+6utcs8w86mvtaO2XYOkiTm6k2jFm3b2xsg
 otGQ==
X-Gm-Message-State: AOAM531iW3TZc87RYO1ebE9VDPHZenO3tI+A6K92F9EwMvQDj1xvc1Bs
 EqQNnCPhK3T6SSTzfE8eDuZvhw==
X-Google-Smtp-Source: ABdhPJyPPxROrBCZhtcmRrDUnd56BgG7e63XFMfwuLczgfq8CQeMQe0KIhFNg6URiT5aH/3M0HUlHQ==
X-Received: by 2002:a05:6a00:2181:b0:44c:f4bc:2f74 with SMTP id
 h1-20020a056a00218100b0044cf4bc2f74mr1160668pfi.68.1635382465134; 
 Wed, 27 Oct 2021 17:54:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o6sm888934pgq.4.2021.10.27.17.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:54:24 -0700 (PDT)
Subject: Re: [PATCH v3 13/18] hw/intc/sh_intc: Remove excessive parenthesis
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635371671.git.balaton@eik.bme.hu>
 <c348abc5e52babc9f5f323184761b54888421208.1635371671.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a699e3d5-e0c4-6d54-740f-38a72482d394@linaro.org>
Date: Wed, 27 Oct 2021 17:54:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c348abc5e52babc9f5f323184761b54888421208.1635371671.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 2:54 PM, BALATON Zoltan wrote:
> Drop unneded parenthesis and split up one complex expression to write
> it with less brackets so it's easier to follow.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/intc/sh_intc.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

