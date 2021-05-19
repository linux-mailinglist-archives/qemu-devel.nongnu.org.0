Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB96B3892E4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:45:14 +0200 (CEST)
Received: from localhost ([::1]:58654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljONl-00064k-Q6
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOMT-0004XR-Jc
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:43:53 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:38781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOMR-0003CB-2g
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:43:53 -0400
Received: by mail-ua1-x92e.google.com with SMTP id q8so93874uap.5
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 08:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LLJ9KvdECIehzSj3mRRExloEyAODdoBOLEiahn8l//o=;
 b=T81O0MlKCThkOisrpD3qB1AOlhux2EV53jt6lye/ICue+gUfgBLznanoewcfP6iHCR
 BygRiLFcTba22RnBj/2OGdPrk6DSfJfOxYCW8vxfTZ2woc05pW/8uGKPwQERSfhQnJr5
 ZCe++Bo60LvDURfXmcyTOTBn3pcFUStHYt/s75QjgDdc91q15EZkqYShIuMlpcFCtYlk
 G5a4PTTDNOljAToJ8LDLe248I59YtHuLOtfGhB7/u02XMwIjiHdjE2pZfFGtYZG8EUt/
 iu3FlhYjXdjqZWlwHufDFPPX/RS72uFpzcspgb7PAqAYbOr2vNQNFbJaZ/usY81Gq2Zc
 fgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LLJ9KvdECIehzSj3mRRExloEyAODdoBOLEiahn8l//o=;
 b=k7L6BSytVzFP+VFwZ4fMdHyZB7O2FSNyKIqZJ1CQ/6zUrfC8OKvkDMHCvfK7wR770c
 iGWoHYf1RaeLKIjAgxxBv6ygYJ/8yF/SyhEMelncH0Q9zc0hTDZZWWaaXmGdC6H2jXI2
 NcdHrYDAYRKf+6XAD46TvJLKTH1szrZGR+xynphvUA1CcOdXw1WepXc2E5+DJdqyVmnD
 vC5+hDhvgwResWU/swSYH4btCiytDVVQzoSo5qR+itfD+PxuV/5nSFPNz25RyzvbFMiy
 AlE5Vp6pbSIRNjR8PZTlWfe5zppfm6glrQmxM/04BQVyrLhMtcvYHTcPMO/3JXgjdmNy
 AMfA==
X-Gm-Message-State: AOAM532lsKuLxDII/pgiIB509FF5MS2h6qc6BiN7cRdGPryNUCRrge9v
 sAeTkVKC7hW7aLIRgoIvLyTj0g==
X-Google-Smtp-Source: ABdhPJwQE2horOz8UIV0uoBklnTVK7FlQe3qFGnIVwwdc+Vqt3S2dU5woIFl+10MXio2IEHW86qJfw==
X-Received: by 2002:a9f:382c:: with SMTP id p41mr16294291uad.65.1621439029815; 
 Wed, 19 May 2021 08:43:49 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id d8sm1226vka.15.2021.05.19.08.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 08:43:49 -0700 (PDT)
Subject: Re: [PATCH] target/hppa: Remove unused 'memory.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517101558.1040191-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7acc5a6-fe81-0b68-75b7-951a28bab039@linaro.org>
Date: Wed, 19 May 2021 10:43:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517101558.1040191-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 5:15 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/hppa/cpu.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 61178fa6a2a..748270bfa31 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -22,7 +22,6 @@
>   
>   #include "cpu-qom.h"
>   #include "exec/cpu-defs.h"
> -#include "exec/memory.h"
>   
>   /* PA-RISC 1.x processors have a strong memory model.  */
>   /* ??? While we do not yet implement PA-RISC 2.0, those processors have
> 
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

