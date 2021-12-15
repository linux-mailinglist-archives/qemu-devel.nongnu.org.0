Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998A0476175
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:18:19 +0100 (CET)
Received: from localhost ([::1]:37684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZn8-0005zg-ED
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:18:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxYSd-0004Bk-PT
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:53:03 -0500
Received: from [2607:f8b0:4864:20::436] (port=41696
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxYSY-0006Qu-VI
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:53:03 -0500
Received: by mail-pf1-x436.google.com with SMTP id g19so21362957pfb.8
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 09:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b5R/QdnhO98HEddeJlZug87zCkRtj7PdhL9CfjR6WGM=;
 b=IfVccMiHJ1q/Zdd6EJsvbD9TU/Qrdua0fo8jCrFj1DUUdBJNGGFAG0BWyEQVS4Zm2w
 QTfDdIWZioREZbURC/vzRP5lZ3YWpdkVljxc6AIxNmJ+KjBtZ5qfF5zwSGsuguPCmZck
 Lu53/3eBBtIDrGQJ20jpHtAkg8d/weGYQvqEHNr2dhVf7p2drnwr7Gn51d2oEU9Ykpml
 +haguTdQc0Dku1Jss0/0uV2dj0+B3TdWprkYtHOICOE6NBMOJ/L/uLJGqWq1g25XHFVj
 9okQfwJXbg8DLVVVUXfJXT9JAdR0BAi7C7u7t+JLR0A5wrmZKMuaBhZWO0vQ9ZTaRLS8
 /Xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b5R/QdnhO98HEddeJlZug87zCkRtj7PdhL9CfjR6WGM=;
 b=ZTKBiYgBm8di5sRtYUpLTK1Diw+JKvRuinq/1MzRAnQkP6rDzQLEGkETaa7ZQ/Xy7f
 LcUfYGIiIuLVvCbb7keAb+BY/8YKFb03lsrrVGDc7vyL5hIkf4CVDtis5dnHIcZINfko
 USDEubD7dpZCbkUgnwg876cKz9dDlY6gkjd1bcAax5iRePu7w4UQOGVfjCejR/tDdnwO
 cOt6DQvnC7KWFRgXKpTe94FGNLsfx0p3HQlUtQLSHzq6l0Hut5PNusnFmGsAtr3NMSn+
 GrWqKL+cr2dxpiceQ8I57yZMM9QJ1HbdedWH2nfKDTh+bbNkEjs0mNA0tFsq4XAF02Vd
 WOww==
X-Gm-Message-State: AOAM533s+rvPLkHEsm41otNuWQDXU18fv0Oe55slnICHKtqTKcCuEujv
 8wqua1BYdo3tc1QLUSp5Y8xkzg==
X-Google-Smtp-Source: ABdhPJwJIZ2F8JzXxZXlx9P8DlJcbyDnhzyCgaXRe9Ic5+t8gi4xpJwySPGvlNR9v8mo4WDBgoJszA==
X-Received: by 2002:a63:4a63:: with SMTP id j35mr8487467pgl.409.1639590776926; 
 Wed, 15 Dec 2021 09:52:56 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id o15sm2981018pgk.7.2021.12.15.09.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 09:52:56 -0800 (PST)
Subject: Re: [RFC PATCH] docs/devel: update C standard to C11
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211215152055.1748462-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08cf6058-974e-ebca-4e3d-bbb1ad257d0f@linaro.org>
Date: Wed, 15 Dec 2021 09:52:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215152055.1748462-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 7:20 AM, Alex Bennée wrote:
> Since 8a9d3d5640 (configure: Use -std=gnu11) we have allowed C11 code
> so lets reflect that in the style guide.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/style.rst | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index d7315f45f4..a80abcd0c7 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -486,11 +486,11 @@ of arguments.
>   C standard, implementation defined and undefined behaviors
>   ==========================================================
>   
> -C code in QEMU should be written to the C99 language specification. A copy
> -of the final version of the C99 standard with corrigenda TC1, TC2, and TC3
> -included, formatted as a draft, can be downloaded from:
> +C code in QEMU should be written to the C11 language specification. A
> +copy of the final version of the C11 standard formatted as a draft,
> +can be downloaded from:
>   
> -    `<http://www.open-std.org/jtc1/sc22/WG14/www/docs/n1256.pdf>`_
> +    `<http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf>`_
>   
>   The C language specification defines regions of undefined behavior and
>   implementation defined behavior (to give compiler authors enough leeway to

Oops, yes.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


