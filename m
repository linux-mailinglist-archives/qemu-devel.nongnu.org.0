Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB839923F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 20:10:53 +0200 (CEST)
Received: from localhost ([::1]:38570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loVKO-0000sF-Nc
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 14:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loVBO-00016a-1W
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:01:34 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loVBM-0007Bg-Br
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:01:33 -0400
Received: by mail-ed1-x533.google.com with SMTP id ba2so2249042edb.2
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rI4Z3aelTil49JmdVbpqcMQvlLMTBSZ1QxenWE7aFtM=;
 b=FLiHX9Q3ZA1FvNBcrpL2z2SNUxFTQNCOQirikNm5nPRHeNPdB+X6RdhWW32+Z5LkDI
 fRkv7sleLAf3iKBzh/mBCRWe2FqbQpKJHuWmiBfAk1Ann0PdIVQgsrwZLCASjHL5J0nv
 s84q0/k+ElR/xdVhPeo2GbjeU/waQUXu7CZ/wHOJi3guDGqcNN4lW72VHh6v2G315cec
 vV3omCCxINZSoTTuHYpse24CNI5gTDTE1Bj9qHy2QsenA9Bi3iMBh+p9EpElf032rLi8
 vn2/cFodXR3HmEB2tn1USvVZHTTqOfkHYXPxUb8bJ0Oeqsq1JS40onoESovCUey7Hmfq
 XmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rI4Z3aelTil49JmdVbpqcMQvlLMTBSZ1QxenWE7aFtM=;
 b=EPOBFk+h8P6zIuMywoRaKroEYvsAN+40/MX15WZe2qSn2hdtzfW+q+P0562STgglGA
 zfkKGOQDnmxUzUoVOOFwI2iEyFCxVYeJ0uBWutLJwDw9kFP7+70N4cpaP9SzYsiR6JJj
 jwkbqztMneYw8T28KRdixzFeNJcMvpfOipEH5tp47WX+I0qS37Ql7udYSfsuBPrQca0J
 NLJyx0sfXEF3ys8Dh1j1QAmQrZQusumMej3idq0z153wOJkyaAYGAsk/J9jZtOzGnHFt
 shFcXf50rl02bY9h3mSrPc+gHuOAT4NzjsjlcES6/x75ksUtp6UGHSHriwK0kQLXJ9Li
 C0AQ==
X-Gm-Message-State: AOAM533w3PKWetjpVU71keol2dAmLjefsuzMXGBnD8ppUgACpjB0zUNM
 FakkLbUn7M0UuVHh9YvzkxLZwHnodRQYDg==
X-Google-Smtp-Source: ABdhPJyIR25GRyZi2RSdPMSXu/Sk59KSMt+DXy0GbNKpuwkv2t21IXFKrnoFaygF1jw/mHNBQbKTyQ==
X-Received: by 2002:aa7:db16:: with SMTP id t22mr24810263eds.49.1622656890680; 
 Wed, 02 Jun 2021 11:01:30 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id w11sm399577ede.54.2021.06.02.11.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 11:01:30 -0700 (PDT)
Subject: Re: [PATCH v7 23/27] tcg/tci: Split out tci_qemu_ld, tci_qemu_st
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6cef4f63-2529-db6e-61df-68c114f2c8f3@amsat.org>
Date: Wed, 2 Jun 2021 20:01:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.613,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 5:01 PM, Richard Henderson wrote:
> We can share this code between 32-bit and 64-bit loads and stores.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 183 +++++++++++++++++++++---------------------------------
>  1 file changed, 71 insertions(+), 112 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

