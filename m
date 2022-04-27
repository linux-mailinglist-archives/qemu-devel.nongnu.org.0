Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8948F511C5B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 18:23:00 +0200 (CEST)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njkRP-0000Nf-Jr
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 12:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njkOz-0007na-0s
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:20:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njkOx-0008MN-1v
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:20:28 -0400
Received: by mail-pj1-x1029.google.com with SMTP id fv2so1901207pjb.4
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OW++peAFDsCVIrgYtbjFsekX4dEE9FsplicciWrO38k=;
 b=gFmyqR848xkKSvU2F+4xuckCfxK6TE7vQ9EvJ5YoUHAoxrkag0U988qSXjPLJKV2+L
 5N+MqE1bZyo3KhvGwhu3KGpwj1A436S2lnHO0/fi5OjY/Q3xBq0b0ySPEZL5A4K82/HR
 lauiW+QmVptC4BUZM9sR0c+3rWEGIbk6mLKFRiJU6tEbBSXFrmnj2DSE7Y3jC7yNA02q
 FS5ajK1dEpTL0YrkssidEmq51fKsIgcQlYiVK4ai7GBn4DMUNkGn3vqaWEzSuYLVNT7B
 PsxrFhPc4H0BApR3kB+4RJ2UJNsz/raS4QaYDZ50For9iokKFRBnj9CH9Lrhb6x+kbjT
 LJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OW++peAFDsCVIrgYtbjFsekX4dEE9FsplicciWrO38k=;
 b=Bd0s07Mb7CNRPydVb3qNdib+gmw6gh8ijC0f5/YLGuLST7K+OHknReYt+3DAlAlkry
 nWDK3bMw6zdQSVH2cSm+zPAtpNUbHOOikCGH4PBHYdw2Uw3Xk4JMaFUd6qciIvQs00L6
 k25OKQlrg7TJnImg4Oj2Qpq12gQPO1WPsXBok8RlN6icBMYl4nCxw3bmdtzd24/J78Gz
 XlFxdekp6c+4bSJKcXvf5Dj5QKgeKK4zeTRiV5aBAQEnRPMRmWn0ZYwuUhUDOZkg04MI
 OZytB29QTeP0i6/YyYiwPwg7EzyAFGP0Uo+P73xb0rmjeF6mQ55PRSeQqdYfSVh1yrOz
 Lp4w==
X-Gm-Message-State: AOAM532L8oTJCQ9V3fxJk5ntexFicLMkkbBP5tiZ1yh1r4PufEd5kWob
 /e2DmLIvcH7hJy2NRBPh7nfHUQ==
X-Google-Smtp-Source: ABdhPJzweAks9rnaD34n2IY8bkjlepJ6o9+4zDfhawr3Lp18U7qJdfqhSOk8pbppcAMewB8B7rUn4A==
X-Received: by 2002:a17:90b:1b06:b0:1d1:6633:5ec2 with SMTP id
 nu6-20020a17090b1b0600b001d166335ec2mr45033907pjb.103.1651076425621; 
 Wed, 27 Apr 2022 09:20:25 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a655a8d000000b003aae0fb5668sm14386981pgt.42.2022.04.27.09.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 09:20:25 -0700 (PDT)
Message-ID: <817b585f-3b0e-29c2-9373-39c93401d5d5@linaro.org>
Date: Wed, 27 Apr 2022 09:20:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] hw/arm/smmuv3: Cache event fault record
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com
References: <20220427111543.124620-1-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220427111543.124620-1-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 04:15, Jean-Philippe Brucker wrote:
> The Record bit in the Context Descriptor tells the SMMU to report fault
> events to the event queue. Since we don't cache the Record bit at the
> moment, access faults from a cached Context Descriptor are never
> reported. Store the Record bit in the cached SMMUTransCfg.
> 
> Fixes: 9bde7f0674fe ("hw/arm/smmuv3: Implement translate callback")
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   hw/arm/smmuv3-internal.h     |  1 -
>   include/hw/arm/smmu-common.h |  1 +
>   hw/arm/smmuv3.c              | 14 +++++++-------
>   3 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

