Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7783D459E6B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 09:42:09 +0100 (CET)
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpRNL-00064Z-LZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 03:42:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpRMA-0005PC-Em
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:40:50 -0500
Received: from [2a00:1450:4864:20::430] (port=38687
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpRM8-00022H-HY
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:40:50 -0500
Received: by mail-wr1-x430.google.com with SMTP id u18so37573904wrg.5
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 00:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gue66bgTJtwwoGEQETzHq0UPMhzhnANF/DYYGR4nAEw=;
 b=cNk7bFXQNpp8+Pez5DNw0drzn/T/d84Na78285TnZ9Lgr6aPFLCBsH2jewggPRc/PL
 mOsoOlCyFJKPZ8ompR9ebJvsZ/KDAhAIOk2+oDaLTrex+dkvodmykSVQ8yH1JvnxU27z
 5DdcnoQ0vGNJJYmMfXM4Djus/eIc52fOv1hrx7KW+8CWcQCl1XRPkRQRgf80VhBJ02+t
 7KNM+5gUVpCWQG1v0h0yFqD+lhIKd6s9lRWJAk636LaYqVTdqdEik+tEIjkn3rVKi3QA
 BTMWuGrnH+KVzjNaIwWnPzuVI27LUmuL/GWN1WynI24I6MSTTtcEyMdaxGH1eB/1/Vq3
 Ue9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gue66bgTJtwwoGEQETzHq0UPMhzhnANF/DYYGR4nAEw=;
 b=rk13pbNbNq+QVGE/J9dDod0haHDqsz7IWhmj3Woh2cBf/rarRnpiaIEyvOQuBKqRfH
 AWA8hOy2+6eCVy2oS2JGfAYY3R6RBC0XBJNBcWok5/YmpfOmfb2w7BRf/gXMDXsZ8PgZ
 yBQuEcnbS8pOsIYdsEWJ24C1Gc2PfG8SZjqs4IPsHgrMBJtOnC1y+cGuOjd/R0FkDvBP
 WzKIcmniJ8fR9k1YEgLUZrgvOy1S7FrCpgXy+VQE7COJ5zwA6MbI2OmAw8KWZhJ08g4w
 166JYokeKazxLhvxG/MmAoGsS8IXXRek9It26BlVBj2IZFsDHQbglQlag/LnRuF7vZhK
 HQ2Q==
X-Gm-Message-State: AOAM53185y4S1T9lnj0lUoUXdKFOxuEEBOpQ0PB5SG3KXmgvluSKT3m2
 zjnlhRlEKG++S39NV/69JFDj2XzicO6Q4i8xj+E=
X-Google-Smtp-Source: ABdhPJwX4BTJE1MPaIkZljb3gQGt9q3j0JvVkD7Sro2SWMubmbQef/RKhzqKSgFQ76ltpYCWQxBkaw==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr4979631wrs.437.1637656846778; 
 Tue, 23 Nov 2021 00:40:46 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id d2sm378370wmb.31.2021.11.23.00.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:40:46 -0800 (PST)
Subject: Re: [PULL 0/1] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211122184422.901437-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a6cf7c2-0647-ff5d-c89f-33ab4aa00c91@linaro.org>
Date: Tue, 23 Nov 2021 09:40:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122184422.901437-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 7:44 PM, Peter Maydell wrote:
> Apologies for sending two pullreqs today; Eric's patch came in a
> few hours after I sent the first one but it's definitely a
> release-critical fix.
> 
> -- PMM
> 
> The following changes since commit 89d2f9e4c63799f7f03e9180c63b7dc45fc2a04a:
> 
>    Merge tag 'pull-target-arm-20211122' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2021-11-22 16:35:54 +0100)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211122-1
> 
> for you to fetch changes up to 33a0c404fb90a3fa8eea6ebf5c535fc7bc0b9912:
> 
>    hw/intc/arm_gicv3_its: Revert version increments in vmstate_its (2021-11-22 18:17:19 +0000)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * drop spurious bump of ITS vmstate version fields
> 
> ----------------------------------------------------------------
> Eric Auger (1):
>        hw/intc/arm_gicv3_its: Revert version increments in vmstate_its
> 
>   hw/intc/arm_gicv3_its_common.c | 2 --
>   1 file changed, 2 deletions(-)

Applied, thanks.

r~


