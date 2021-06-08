Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3EE39EEEE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 08:47:19 +0200 (CEST)
Received: from localhost ([::1]:50314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqVW9-0000Ft-7u
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 02:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqVUb-0007lK-QI; Tue, 08 Jun 2021 02:45:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqVUZ-0000WN-U5; Tue, 08 Jun 2021 02:45:41 -0400
Received: by mail-wr1-x433.google.com with SMTP id l2so20259419wrw.6;
 Mon, 07 Jun 2021 23:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kAFzmDdysgjGIwY2kz9I1L+yf0CVmoDge4NVJSm91UI=;
 b=dm+6kwNmUas8gHyKe86NaWC1CAqroXLfgFQHzY4DeRjQoe5pJcAPm2Nh+r2t+qT/96
 F8bd5p5JrkdsF/k3/cdGbDq+4O2C5uYnZHk+0ME5fXaTVUUa1DrQQnxBrCP2KsS31aqz
 Y7qQ0gWuh0YbmdjXhxqCFIsqcPe9RmPu2FIGhHtHe++408TDmU8RsRpbCBXNVe58betx
 hSf9Ygvy2EWYYD7s46rk0Ho2aMf+td2XZjY1lUt5Q5oXelUeNNXIdx29rQjEd+vy9mi2
 DrtteiAetd6kbK0gp8PFLuYPmpEnLrnMBd/JSGEfgr7fjXeux/wEVMW6optvJuJFonaM
 IZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kAFzmDdysgjGIwY2kz9I1L+yf0CVmoDge4NVJSm91UI=;
 b=lkmCwfvb0MqXR/IrLaQ0kIGQRaFoxROoy5shYeBfxqsitnpOvsS5Jpo7Yh+rVSWmOp
 jmV4XI+Y9VMmLLg6UA/GNZJDQHUFXhFEXLUqocR+UnA9SyWf2Aq+OaPIBRd5qseNrSnG
 bYh6dKb8Tc2sDkl/odPPFqxXcYufDbdqkrQ0ZZbzI22oJbcAdA+N4TVJPUkZg/HHpGIh
 TICAR+SvlZvx6dO4vlOA5/36LR8NJq3mRDglPVhDe7RMe+heL2KcBoORcBHn+2nyLGF3
 0hqcT0HdWPWNZ/nVXlkiIOA4TVO+2T8/KlHpAK7rei8BnFvavS0aip0i1HkdsbppMvdt
 zHFw==
X-Gm-Message-State: AOAM533uwlN2yTZYVhlduoxEIWIna9eXqw11Tz2q8tU570/1g0kUVbxf
 uwBKRznrGQ2NowElq12Ckmc=
X-Google-Smtp-Source: ABdhPJzLYlETi6RnJgxZytiIzW51OJbt8QyKkcnBWBgQ15g/8tNIvLeOS6bFln71KDWWzH0oFEtgDQ==
X-Received: by 2002:a05:6000:1a8f:: with SMTP id
 f15mr12358356wry.260.1623134737893; 
 Mon, 07 Jun 2021 23:45:37 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id b135sm1833132wmb.5.2021.06.07.23.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 23:45:37 -0700 (PDT)
Subject: Re: [PATCH 31/55] include/qemu/int128.h: Add function to create
 Int128 from int64_t
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-32-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e54583ef-1e9c-69a9-c56f-997b79387072@amsat.org>
Date: Tue, 8 Jun 2021 08:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 6:57 PM, Peter Maydell wrote:
> int128_make64() creates an Int128 from an unsigned 64 bit value; add
> a function int128_makes64() creating an Int128 from a signed 64 bit
> value.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qemu/int128.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/qemu/int128.h b/include/qemu/int128.h
> index 52fc2384211..64500385e37 100644
> --- a/include/qemu/int128.h
> +++ b/include/qemu/int128.h
> @@ -11,6 +11,11 @@ static inline Int128 int128_make64(uint64_t a)
>      return a;
>  }

> +static inline Int128 int128_makes64(int64_t a)
> +{
> +    return (Int128) { a, a >> 63 };

This file would be easier to review using explicit field names:

       return (Int128) { .lo = a, .hi = a >> 63 };

Also, maybe we could rename int128_makeX -> int128_make_uX
before introducing int128_make_sX.

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +}
> +
>  static inline Int128 int128_make128(uint64_t lo, uint64_t hi)
>  {
>      return (Int128) { lo, hi };
> 


