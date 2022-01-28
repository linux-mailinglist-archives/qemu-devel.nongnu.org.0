Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F449F0AF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:46:54 +0100 (CET)
Received: from localhost ([::1]:44976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDGLl-0005ub-QJ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:46:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDGJI-0003sr-Vw
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 20:44:21 -0500
Received: from [2607:f8b0:4864:20::530] (port=39508
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDGJH-0003TK-EM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 20:44:20 -0500
Received: by mail-pg1-x530.google.com with SMTP id j10so3909414pgc.6
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 17:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aIiI9K7HSzTWg/+CIWHb8DFbzK4Rqsax+3pQDyFp32U=;
 b=NOppJAX9V9f7gCOZtM1jp1PcNvpJ9VQsZog6nNcoBWBP2+AEGNBYnoVnxp1tzr2H+T
 d+VaQUK0It277/I9oeKZ2W0hYcpaYkIHCsKo799VtTf9yDSKDN/dka+Y86j3wDrliRRT
 LaeIlvGdzqLUl38Xuc3+9xU4bMtm3UpL7GeCivAdTJ7DaiecpkSXzR5kkmkOUWGK//OD
 JmNPByeym5m0SNFXc3q7izIaruxbARIqTd1eAOzOhOExexsQXgQy8egQYeNnkpq9JWgU
 ePPRNuzQrXCAKSB7TaB/x0av67o1q4ukW9IMbDO7glorfb3OebgKWA2Pc7WTBjLbyLBH
 Ou8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aIiI9K7HSzTWg/+CIWHb8DFbzK4Rqsax+3pQDyFp32U=;
 b=YWrQRn3GFH1zpZa9dhnx3sjaqXZJsE83MtMe+7wPUq73xhBvrng8NF1Zjhwi72WANs
 0SsarfgDpRPJc5q1PHONBj3aHOtbQeOI5Sj67+SeJe09PTjZ78gOzBb52hiQ69PizTeU
 gEqq4iodtdcjGybf1aSlRe8GDTSvy4EcxsTPeR5ugj4skGc0Y602b+s/ZRL5gS9948GX
 DGch975/3OVzya4BXrJB/QjwlxwKrLcluhKmsmg8yW7UVluptWEznMYn0qy2TrJCMQ7C
 YcdpTAECiKE/Y8NAKj2OGhB2+q5gHZPVd8hGopnHRb9a4DmPe+VyVdmhwxDkzjk8njlq
 OkNA==
X-Gm-Message-State: AOAM531sf0pAp7EKXewxxf3LUBjp75+/lbkXl8fCCfyGTLoNltrL/l71
 eA7tRzG+JXe8onEo0BduD4ZgkA==
X-Google-Smtp-Source: ABdhPJxjZeMA0yiwj8Eqk3ZT5YPkwG0dv5jduQd8Plgr/DiTx+LElTDfCJ+5bcL4lUz+89iSoLhDkQ==
X-Received: by 2002:a05:6a00:2283:: with SMTP id
 f3mr5664887pfe.24.1643334258175; 
 Thu, 27 Jan 2022 17:44:18 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id b14sm7245555pfm.17.2022.01.27.17.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 17:44:17 -0800 (PST)
Message-ID: <e975ac85-eb64-8075-43d5-b9e6dc5a31bf@linaro.org>
Date: Fri, 28 Jan 2022 12:44:12 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 13/13] hw/intc/arm_gicv3_its: Range-check ICID before
 indexing into collection table
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111171048.3545974-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/22 04:10, Peter Maydell wrote:
> In process_its_cmd(), we read an ICID out of the interrupt table
> entry, and then use it as an index into the collection table.  Add a
> check that it is within range for the collection table first.
> 
> This check is not strictly necessary, because:
>   * we range check the ICID from the guest before writing it into
>     the interrupt table entry, so the the only way to get an
>     out of range ICID in process_its_cmd() is if a badly-behaved
>     guest is writing directly to the interrupt table memory
>   * the collection table is in guest memory, so QEMU won't fall
>     over if we read off the end of it
> 
> However, it seems clearer to include the check.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

