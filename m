Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE51100042
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 09:23:14 +0100 (CET)
Received: from localhost ([::1]:59140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWcJV-0002Xc-4O
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 03:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iWcIZ-0001zD-Qv
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:22:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iWcIY-0007HO-L0
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:22:15 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iWcIY-0007GI-Do
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:22:14 -0500
Received: by mail-wm1-x342.google.com with SMTP id l1so16301322wme.2
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 00:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=atGAxSqInUc7VQRL0TWcv+Od4BWkjzfh4qg5Iv9ahfU=;
 b=dlw8iiFp5dUu5zs52VJ9tZC4n33mIl/doaz5AZ/4vMIz6MCL6j5IrTsuwkpWz+XoAT
 sW8O07tmN4SwU8ZLhUnjujI94URbdicZS6ug0U++OCaUkIVyGIipMjkc7Sd7fRcAbUe1
 EKdoV96CNLDWeBCOkg0a+n4Rhd0xBoUpDUsAEyBxPlu8SSQulI/1Dx0eSbI+O1Fw2E1s
 oPvQ6HeCCvB5jAXlBCLd4/Qkxu8ocL4G392wqdhP8iRcaUUF6z+jsJ4jVBkj2OafhOMV
 ZTbuzNHoFsS9zxJukwgDMFUGAWM1m0IBObJxiljcfJI60lSLRO4kpH+11i2AaP8APraO
 +lVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=atGAxSqInUc7VQRL0TWcv+Od4BWkjzfh4qg5Iv9ahfU=;
 b=fC1LDb9ZczxRtd3MvUQwDt0O6F0KI2G5etiS/Zli4KqLW+WS+lbxY38gHoHe7qV+Ly
 CzAASwbayP+kOg/TB3XiPHNQclW/dAkympMx/9GMoON0P3LF9rjDsNE20ZP5zlS8M4F2
 yO6oaBcvomCJoCno7zv5+fC8GVisju/m7ARs5GbW65SHFzC47k2v82JhlnKFdzg8cg3z
 Q+RlWd9oFGVjIGVHJIYJIP0k85V1hjHLhoTs2xGXpnWtZQ5I7BLjyUmQSdPWsoMoMaO6
 qAvx+iHRNO8R0Sz9mTyNoGCh9Ru6/nOh8zCxPBfoz8g9j7mW3xR/JoDheGhdZnSBzsGf
 yjQg==
X-Gm-Message-State: APjAAAUT9BiOm6jPxxvtTO7R3kV7ZNPOU7BB4tsYHvZ3zih5QM+dxG5l
 v1Aaqvs3WkwrzVJCxbF962BrGA==
X-Google-Smtp-Source: APXvYqw2PATW1wpmJNc88XBdK/SNDovfy1jPIvOAnpVCdMIBAAfvi00JgtsEmXODKiRblgiNz8ix3g==
X-Received: by 2002:a05:600c:22c3:: with SMTP id
 3mr26597740wmg.139.1574065333106; 
 Mon, 18 Nov 2019 00:22:13 -0800 (PST)
Received: from [192.168.8.102] (65.red-79-149-41.dynamicip.rima-tde.net.
 [79.149.41.65])
 by smtp.gmail.com with ESMTPSA id t29sm23394091wrb.53.2019.11.18.00.22.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 00:22:12 -0800 (PST)
Subject: Re: [RFC PATCH 06/11] target/arm: use gdb_get_reg helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191115173000.21891-1-alex.bennee@linaro.org>
 <20191115173000.21891-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f41d3419-3c74-4748-6ca1-a3ab8f6cab5d@linaro.org>
Date: Mon, 18 Nov 2019 09:19:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115173000.21891-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, luis.machado@linaro.org,
 alan.hayward@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/19 6:29 PM, Alex Bennée wrote:
> This is cleaner than poking memory directly and will make later
> clean-ups easier.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index be67e2c66d6..bd821931b3d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -105,21 +105,17 @@ static int aarch64_fpu_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
>  {
>      switch (reg) {
>      case 0 ... 31:
> +    {
>          /* 128 bit FP register */
> -        {
> -            uint64_t *q = aa64_vfp_qreg(env, reg);
> -            stq_le_p(buf, q[0]);
> -            stq_le_p(buf + 8, q[1]);
> -            return 16;
> -        }
> +        uint64_t *q = aa64_vfp_qreg(env, reg);
> +        return gdb_get_reg128(buf, q[0], q[1]);

The elements of aa64_vfp_qreg are explicitly little-endian.
Since you defined gdb_get_reg128 as (buf, hi, lo), these
arguments are in the wrong order.


r~

