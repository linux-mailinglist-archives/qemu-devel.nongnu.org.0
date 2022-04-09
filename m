Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C114FAA24
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:24:19 +0200 (CEST)
Received: from localhost ([::1]:48706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndFkw-0004Fp-5c
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFj9-0003NT-7W
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:22:27 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFj6-0000tc-S5
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:22:26 -0400
Received: by mail-pg1-x535.google.com with SMTP id s21so6075619pgv.13
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pKPilFg+il2wxELXEjscDA4gNJVNuvfC96NRxrtNdUE=;
 b=LrODJZglKVKQejkz/4qdaJa9uWHvgF7v9X86eAQnVc+cw/J2XJMFBUyYwEDJJygTzc
 fMCrJBfVkI5poS2q4R7mKQoOBrsk8HS6bbNJoJdgeKPtAKPkhOsD4ddsXQK7q1jKtBhS
 H3cnkdl7j9aK/G8KAxs6DGijdn529x4twmS9bD/OgJrHRA1VZe++2K1DQ6vWC272iMlI
 6AN4eaDoW5iGuXUJ2lS7RdcCsZ2XqqaIIU16k8easZ0KXnV/U0hGUlcMxaPkmFFyah+5
 PsoH04DdtQSiUlGC15iKU3GY2PFD4uZ+zm+xseirA1jFdV4JiAJeIq3O7etxLp7MfWbr
 BH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pKPilFg+il2wxELXEjscDA4gNJVNuvfC96NRxrtNdUE=;
 b=WEbQslY1FjkZ8Cjw6cQvLaIDLNQh4M/GajcXn+YWjEfzyg1II4y9FdQtojCIWy78Dc
 /wNGoFA6hJTF7L7SZTU2QRxaPoVOlda2vAsLWRfSfgKDIWtR6hJBgh8EIYnYVd4XXrWl
 8TscwczStQr6Zc4rtMcq7KXRbXzKxdtMaTZBSRfxDkAUHfrSIVRoiT0HqpT2zpFqHVuk
 0A4BWaOj4xqmsZeLLmqYl3s05woQct1fvyWC/BqLBPYE8jeh5ujBh5861nWyWePYNWus
 KY0aR/tASY+CksumGlnE2odk6sJU5Ii2KdqQ/Ighf2C0qVXMP87PPX/aEMkslyHhrQSE
 GGHg==
X-Gm-Message-State: AOAM53010Q5/Vf5w8zqbko2Q4ZCvZj2VOOAERqOGbBh5fusPkLo0Jgn8
 9nb4x3w8sTt5pR70pHebZ8pSlw==
X-Google-Smtp-Source: ABdhPJzcUFApeJsipXlfzqNpArf0LDfaM0B7McIE93mwKHCATIt9+tWq97/uV2AXCXAWnC1+7TjX8A==
X-Received: by 2002:a63:d855:0:b0:39c:e714:c79f with SMTP id
 k21-20020a63d855000000b0039ce714c79fmr9347602pgj.570.1649528542242; 
 Sat, 09 Apr 2022 11:22:22 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 w127-20020a627b85000000b00505a9142ce5sm1203372pfc.22.2022.04.09.11.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:22:21 -0700 (PDT)
Message-ID: <9d09dd24-6caf-201f-3952-c1259d74b4f9@linaro.org>
Date: Sat, 9 Apr 2022 11:22:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 18/41] hw/intc/arm_gicv3_its: Implement INV command
 properly
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> We were previously implementing INV (like INVALL) to just blow away
> cached highest-priority-pending-LPI information on all connected
> redistributors.  For GICv4.0, this isn't going to be sufficient,
> because the LPI we are invalidating cached information for might be
> either physical or virtual, and the required action is different for
> those two cases.  So we need to do the full process of looking up the
> ITE from the devid and eventid.  This also means we can do the error
> checks that the spec lists for this command.
> 
> Split out INV handling into a process_inv() function like our other
> command-processing functions.  For the moment, stick to handling only
> physical LPIs; we will add the vLPI parts later.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> We could also improve INVALL to only prod the one redistributor
> specified by the ICID in the command packet, but since INVALL
> is only for physical LPIs I am leaving it as it is.
> ---
>   hw/intc/gicv3_internal.h   | 12 +++++++++
>   hw/intc/arm_gicv3_its.c    | 50 +++++++++++++++++++++++++++++++++++++-
>   hw/intc/arm_gicv3_redist.c | 11 +++++++++
>   hw/intc/trace-events       |  3 ++-
>   4 files changed, 74 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

