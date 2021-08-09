Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074D43E4DE7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 22:34:40 +0200 (CEST)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDByp-0002la-4B
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 16:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDBy1-00025I-AO
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:33:49 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDBxz-0001Kz-Ut
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:33:49 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 lw7-20020a17090b1807b029017881cc80b7so805381pjb.3
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 13:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MUFw5V6SGX96UP2ZO47hsKDgsfvzAuNWiOJy1ADb9m0=;
 b=xA/DQ/ultH0uYKcoi7/Alg6dFikoshhe7RaNdnPuIVTzIcvOv3SczXE4Vyf02S9cle
 XqdwjpC/C8/z3trvujs+0u9/ej4z0ddlXfyHYl7FET8DrhFYGFTr5Ox1HKOEDpi9uMJm
 zQ2Hq4Q4gicu6kNTYG+xS8Lv/Kmu+HaLwvsqNjaDDb0j3U6SQI5vSZvNIfGcm+HdhiHF
 n6f7/c5hyqoNJ69ttgDB6NiRUwT8rcmaQUxO85B246CJPYgie+eA5nMp9yrIE23vY8Eg
 amRRV1pkXSQIMbUWNQaZ3DrTocY+ZF3GDMtYx2I7Q/OazJeoPnXZ0lJIcIAiJzoWRZ2r
 T+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MUFw5V6SGX96UP2ZO47hsKDgsfvzAuNWiOJy1ADb9m0=;
 b=XVJFDvJf8IGCQK7F+u3U6snZv+NoXY/KGUn+KsgntQCgApu0syU/qsc8EBl1jpBKzR
 opwyrpW0aQhYasftwusN91mzum3ziKxB+JoGTg4YJdpjJnKD6tULgs/RnRCV33uQQXDl
 PpGZwjooGh+/f1fCi/I5f7FmroyZRvYaQWo3lS7ihf1c4a8EqehMmcn0UAIP/rs7BgWJ
 5JT+KlQQYVHnUEwDJOXEu1M81gaBDrEKxHCMvifB3JKon/KuVbJ4VM+t7ym03L3FC0zo
 as28gjKFlBVMXKZ3E2qRXXHE6ejIbspzIC3a02mNq0yVwMmvfvCL2zdTvtyfBHuOcVul
 I4wA==
X-Gm-Message-State: AOAM532Azt2m8JM0AQa90nYC6qripQNvonprfjZG89sWJkHiOQw7v1G3
 Re4PQlLEwZ5Cw4jXUpSqj8mLpe9GwqsJLA==
X-Google-Smtp-Source: ABdhPJye+4Saa9t6ICEPQGNyCs833Zad/Tha6XyTISMS4HWo00xfD+cTWth+5hh3uRr3mBGxsyp1xA==
X-Received: by 2002:a17:902:edd7:b029:12c:a5f6:dfe1 with SMTP id
 q23-20020a170902edd7b029012ca5f6dfe1mr4038plk.34.1628541226573; 
 Mon, 09 Aug 2021 13:33:46 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id q1sm21795014pfn.6.2021.08.09.13.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 13:33:46 -0700 (PDT)
Subject: Re: [PATCH for 6.2 25/49] bsd-user: define max args in terms of pages
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-26-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <392c25d5-e37d-cb85-85de-7692bc049599@linaro.org>
Date: Mon, 9 Aug 2021 10:33:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-26-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh <imp@FreeBSD.org>
> 
> For 32-bit platforms, pass in up to 256k of args. For 64-bit, bump that
> to 512k.
> 
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +#define TARGET_ARG_MAX (512 * 1024)
> +#else
> +#define TARGET_ARG_MAX (256 * 1024)

For the to-do list: qemu/units.h has KiB for clarity.


r~

