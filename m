Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529D248F0E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 21:30:15 +0200 (CEST)
Received: from localhost ([::1]:51516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcxKY-0007Hp-9g
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 15:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51120)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxJH-0006kX-Rr
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 15:28:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxJH-0008Tr-0X
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 15:28:55 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43855)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcxJG-0008TL-QN
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 15:28:54 -0400
Received: by mail-pg1-x541.google.com with SMTP id f25so6330409pgv.10
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 12:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TnR1/CrViroDbPRAdO2Ey4SNXzabMwcH1ZVN64D4JOs=;
 b=OcRe1Wv/EHc+ftubSVErgtoKFGzZTcP7N2imRD15pfqr1KtT5cL2iuXM4NLDrCvtGn
 owoo05l1+UAdEZ/0hlU9wPDxTCvYfQ8T/5v6dPc0+dY7DwJ9AEBzqXlXFT7EZN3hSXre
 YN3HfVpG22WcknEHqCIGjhkWnz5uphw1N6KfYrjdxPx+LwBPv0CvCGOYK8rxdeXn4CBa
 3mREdjuI0+GlQjsqK75F1GU5p+xaBhAmsyUPVCMbEQNjDfG1pQPUQTNnCZaN831yD8kT
 SvqZw5hzcfFCAuvvaHjvlLNtFhkPFU4l6TBArMKZMVfTuw5l10netJu4uPxB3+IROytS
 aAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TnR1/CrViroDbPRAdO2Ey4SNXzabMwcH1ZVN64D4JOs=;
 b=eCgewwTRPshY6WQsC7wdJulZaUj3Z3wr1s6gfntU3Eio+WHN7vHP1Kdm5KgnmEMc8s
 O5CrnQxC8deKgqC4B7iA7AnNfmdz/VYtABJ8FEsi8aMEEDLzwwNHwUoFn1y1WuIjOgGI
 rw/z3hCCMgywRSI4MHEb24y7DP6aUTC3cu8XSSBAdiBX5h7nt/ljSphg3frJ0rS1D+wE
 VIwbzFOkPhEVJmw6XmkpAx2KIFksBBaJP2PO9zCO542qMdq9JeXRr8L0WJC5rBzUloex
 N/ReTblrwyP0yktVwTcg4dDBb9Qe0eff2n9cXAqEJZq72+pRSdNx4uVw58ghwpkWKWjT
 n0TA==
X-Gm-Message-State: APjAAAXQLdpTb0wFM6vVYIhl6P25/H//4tqQkjUXQG3RRVZ9uP6w9iGa
 WUc1OYyBUGL76K+OiQkv/vuUbkp667E=
X-Google-Smtp-Source: APXvYqy4TYouoD661tIr61deO3j0yqKeR1m/otEaFaWqme9Redr4BIPmkLqi0BkMOsvABXpfce4enw==
X-Received: by 2002:a17:90a:d3d7:: with SMTP id
 d23mr530453pjw.26.1560799733270; 
 Mon, 17 Jun 2019 12:28:53 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id 3sm12209029pfp.114.2019.06.17.12.28.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 12:28:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190617175317.27557-1-peter.maydell@linaro.org>
 <20190617175317.27557-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <38277bbe-b942-337e-4a7c-dac3ad3a60b5@linaro.org>
Date: Mon, 17 Jun 2019 12:28:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617175317.27557-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH 1/6] target/arm: NS BusFault on vector
 table fetch escalates to NS HardFault
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

On 6/17/19 10:53 AM, Peter Maydell wrote:
> +     * The HardFault is Secure if BFHFNMINS is 0 (meaning that all HFs are
> +     * secure); otherwise it targets the same security state as the
> +     * underlying exception.
>       */
> -    exc_secure = targets_secure ||
> -        !(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK);
> +    if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
> +        exc_secure = false;
> +    }

exc_secure = true, surely?


r~

