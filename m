Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B3C4B18FD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:04:43 +0100 (CET)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIIUT-00089M-Ke
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:04:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIISn-0007BZ-Lj
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:02:57 -0500
Received: from [2607:f8b0:4864:20::42d] (port=43660
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIISl-0007bz-SJ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:02:57 -0500
Received: by mail-pf1-x42d.google.com with SMTP id d187so12933389pfa.10
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QnW8FJ9V0aUnBQnjiGxlm/M/+iV3uutjJHZoYehmbPs=;
 b=bKwAxpt9kweQHO1pgS2USyyWM98rFOPhlv0wX+YyN5gfrJP55Vxkyx2uF7q8zJV41c
 mPrYfyGivufpM1qwvhArC3R6Gk5J0W9p89Bb2lT81uUH43zXfEPGzMrcZ3WxVQTir9Si
 xGULtATAfyyYrFV9nPHrMSOXJGSKRI7+kGpRopkJPORYrPXsJ5D2w2ZXaT82IsYVnqnx
 8RozSzpkdf2y+A7RTxhdEAKjXVkkJYpe2leR1NSsaEuCOMq6RT0zugVPW/B0DL2VI8Z7
 6fpYUBg08K9iYnEF6MI6OOoXNqKpFHsSyM0rQZvcJOvNZ4RkoaRQnM6IZrBCIg19W7Qn
 LZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QnW8FJ9V0aUnBQnjiGxlm/M/+iV3uutjJHZoYehmbPs=;
 b=IuPPK1hkOY6tXN1qmZ5qrPPnKf0gfrSNgVp0PIdhPrMer6oh7D9Y9T23O6w+6SufWr
 wkWdowgsvr4YZaxGJajrB430XCmk5aARQFPIEZnaTXdwi48r6sT5pQ87UG8LAU/wIGrM
 OAoQMoiWdk/bJR9daQ2eSIfAmQ12c9Acg6PxNIAd949QToz8bg48F7vx4ULSxzcIEAhk
 tW3/5vO9kw1eiJpGZFR9YgaAk6izXIkFTIQJ8W3l2vj2UIXA/9QBWQ832FluEWkUVZL0
 z9Kge9pDCkOXM8+usIQaZuNvhxrWJv6EMGesRkDsjFZREIZMl4D18oWnwpGjxXF5rW+H
 e5iw==
X-Gm-Message-State: AOAM531bWHVyXuHN9vFpwz1eNb949jNvUJMdIfrN1Y4Rs+F2+1e+EEvG
 c1Tavl2JvC/hRf1WQwWqfbDhMQ==
X-Google-Smtp-Source: ABdhPJxxwA4pOH8K3KUIn83azCEuE00oSQfKJc82xqonzqLZarYRh5lotMuu+hQiCt54i+0Vjqbgzw==
X-Received: by 2002:a62:5e47:: with SMTP id s68mr9644403pfb.10.1644534174133; 
 Thu, 10 Feb 2022 15:02:54 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id z13sm18343813pga.84.2022.02.10.15.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 15:02:53 -0800 (PST)
Message-ID: <5bcdf6f2-37a4-08a7-115f-b289ea896e1f@linaro.org>
Date: Fri, 11 Feb 2022 10:02:05 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 2/3] target/ppc: change xs[n]madd[am]sp to use
 float64r32_muladd
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
 <20220208203145.3844662-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208203145.3844662-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: danielhb413@gmail.com, alex.bennee@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 07:31, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Change VSX Scalar Multiply-Add/Subtract Type-A/M Single Precision
> helpers to use float64r32_muladd. This method should correctly handle
> all rounding modes, so the workaround for float_round_nearest_even can
> be dropped.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c | 54 +++++++++++++++--------------------------
>   1 file changed, 19 insertions(+), 35 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

