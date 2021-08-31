Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485C53FCC2E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:18:31 +0200 (CEST)
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7Ou-0001Sk-6X
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL7II-0001xV-F3
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:11:30 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL7IF-0005UP-MQ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:11:30 -0400
Received: by mail-pf1-x429.google.com with SMTP id 7so15480930pfl.10
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 10:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iK8qKBCAfXdXNT0fhqVujm9i9jZYPtJKZtQkRpA2xww=;
 b=dLI9DLNXNAdU6JFqlqkAhGMuU48PgBzs5svopPHR3Le18dslnQ1cqSkRIKUFtDbxo/
 74QKhszZoVyPvd4WW8IzdLY/zCCwq4D5TOr2QIQKkbQKBLUBmm2CnDal/hGLpIX4fIEj
 dgAgtJJNFkXk7FEvC64z207ml5o/TlEiH1yFij61NUfUclap7TSE2uY+JIL3RvAucKPk
 o2eiPwnpS+cPY04mN+023aar2Lr6tzYeS38pGtUeD7gX/2XN6Rkp/6Hg1QYrthKsIOAu
 1gZPSqFs3ZO+PFN2FsU8HxnF2fGoGyBNBv5DRdjadMcF5wZMh8i5ZOGUgb5Xa6Ic9GEI
 NixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iK8qKBCAfXdXNT0fhqVujm9i9jZYPtJKZtQkRpA2xww=;
 b=lMJXvgF6NrO6mWLVFJijKt5YHmi1ka6w8VxbUQfJ2siTrRIpEYFRKzjMmEECzEIF58
 GkOcVDl9TxOq+I4CFN0D1gIV8UIhTXwTc1njW9XLLYut1o51cJYZSP0k0XYEntn0oM0U
 FAU6RDvMd/h+3JsIrCYAaR6+GstC9cNM6Mi9pPEN1LnNKAiBmne90dkeXMzUJjj32p17
 x08/HjAFH+cDbCyUwLLdewWxTp+1Xaj1FCLyZfjSAf/Vnw65f25HN8Z1IyHG9qBpWi3o
 1WtZ0ojWA7PI2wSQtU2/8xsPPUi5SpUB0QHjRTwlFMVyejcWRJpzqnFkLEgj7dpKTGWJ
 F6xA==
X-Gm-Message-State: AOAM530zuA5ei2DKEby+0h5IIazffee+KBcQ6Im5C/T6gykmUtsW9XtG
 sWwmMSMu/HFvLPCEoH/14Up/cA==
X-Google-Smtp-Source: ABdhPJzpBj6JeYCKzYX+aiqWqU4nYUcQtQ8vD4ExRBclldS1ZEgyrGBR1H6Ef3lSAivcyN4i/85qgA==
X-Received: by 2002:a63:4344:: with SMTP id q65mr27469220pga.364.1630429886043; 
 Tue, 31 Aug 2021 10:11:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id ml10sm3408145pjb.9.2021.08.31.10.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 10:11:25 -0700 (PDT)
Subject: Re: [PATCH v2 02/19] host-utils: move abs64() to host-utils as
 uabs64()
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-3-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <71e260b3-5fbd-5f27-bffa-ad438daa8ef6@linaro.org>
Date: Tue, 31 Aug 2021 10:11:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831164007.297781-3-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, groug@kaod.org,
 Eduardo Habkost <ehabkost@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 9:39 AM, Luis Pires wrote:
> Move abs64 to host-utils as uabs64, so it can be used elsewhere.
> The function was renamed to uabs64 and modified to return an
> unsigned value. This avoids the undefined behavior for common
> abs implementations, where abs of the most negative value is
> undefined.
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
>   hw/i386/kvm/i8254.c       | 7 +------
>   include/qemu/host-utils.h | 8 ++++++++
>   2 files changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

