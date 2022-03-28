Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C94E9FAF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 21:19:25 +0200 (CEST)
Received: from localhost ([::1]:43808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYutf-0006nl-Mu
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 15:19:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYurp-000668-Ed
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 15:17:30 -0400
Received: from [2607:f8b0:4864:20::32e] (port=42700
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYurn-000304-OL
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 15:17:28 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 k18-20020a9d7012000000b005cdb11186f2so10064137otj.9
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 12:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qw/dy1Qr7MjxPKfMH0kx/KSAUUlutfB5qhDS4ahYDCk=;
 b=NDOrklC+M1To3ZSb576MV6uZ1YglUrqMb6f2xIkvfFrw55j9yCK4rzFA8wJvxdHVOU
 uXTR01kXaPjivl9ZyN6kNiSgvnpHl5jzm+xyPtirGrfaPUoy68LrCFwysDpG/1ZAxeN+
 mee1ZAU22GZxFZlxzp+i4DSXr5lwPWrwWgmeDJ5ROY8YRea9vDGvwiITT9Bb5TLLCwsp
 MeIOFGLS+dqm1dZ1fjAl1JKnfGhoBp/leNNTUGP528aFoY4iA8xQOpiBBKExDQZFoDlY
 dCxSpYRo32v/Q8UKZx7CPnRtfPTXSi60dQlzPg1ITut1BW2WPDmI9XFzC012bqvzYmCD
 a/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qw/dy1Qr7MjxPKfMH0kx/KSAUUlutfB5qhDS4ahYDCk=;
 b=0u91DFlu6TldAzQ25RlEKL9h5XXdXc1WA0GuqDqsCD3TfAei65Y+Tn7tsl3fiCjMt8
 rFeHX4jfadYswtLpnCUVY4bGGQnJ++3gOy8eXpq0DuT8whkijkfloGBYClem7SdAjfkc
 0gYm1QvFGjBAe52CJ38yYzg1Yi9cl5RAllhzrrd1hmti8A+XHtHr4kp7Owr5m5dAGroi
 phOt0oy8JpRx34rXL0JQugI795Xu+3l/+XWzWQ0KC+73uyz7l6XBVNFop7uo0aV3/qx4
 v1Ohw2SWHwwDDPMWMU6bfKSD5WCI0YT3JySjVRFunaENe2wi+sdgjyk2EyVJPNEZmLVB
 +mtg==
X-Gm-Message-State: AOAM5329poQ6CSCuthXJpGIWZYkIM2ehIvOEqQJOfSJbZgbin8PA0eU8
 rfEXV0idWYTs7LVX/o7O47VQcA==
X-Google-Smtp-Source: ABdhPJwyl8GE43rpjURGJExe1it6RmEjjANblqK/z0vw7TsGDj+pc00TM7G0gKa/O2/ZJqFNR0WuMw==
X-Received: by 2002:a9d:3ad:0:b0:5c9:297f:b20b with SMTP id
 f42-20020a9d03ad000000b005c9297fb20bmr10692212otf.234.1648495046287; 
 Mon, 28 Mar 2022 12:17:26 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 b188-20020aca34c5000000b002da579c994dsm7581697oia.31.2022.03.28.12.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:17:11 -0700 (PDT)
Message-ID: <c4a42c86-4f38-1350-9132-9e19e3136f90@linaro.org>
Date: Mon, 28 Mar 2022 13:16:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 02/29] target/loongarch: Add CSRs definition
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-3-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-3-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +++ b/target/loongarch/cpu.h
> @@ -11,6 +11,7 @@
>   #include "exec/cpu-defs.h"
>   #include "fpu/softfloat-types.h"
>   #include "hw/registerfields.h"
> +#include "cpu-csr.h"

Do you need this include here?
I would hope that there would be only a few extra files that need this.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

