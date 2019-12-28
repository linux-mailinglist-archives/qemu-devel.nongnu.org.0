Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E71712BC16
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Dec 2019 02:15:14 +0100 (CET)
Received: from localhost ([::1]:40080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1il0hE-00005u-Po
	for lists+qemu-devel@lfdr.de; Fri, 27 Dec 2019 20:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57893)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1il0gI-000837-AG
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 20:14:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1il0gG-0002x7-6b
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 20:14:13 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40052)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1il0gF-0002to-1r
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 20:14:11 -0500
Received: by mail-pf1-x443.google.com with SMTP id q8so15490002pfh.7
 for <qemu-devel@nongnu.org>; Fri, 27 Dec 2019 17:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LY8/I6oCe77RHO8azBFmKDBIFNG+bdbJcscB4Wpyyz4=;
 b=VPOQfxSR7+9ZQMqVJ+Uno3Au9UTNVgG+MQzZ7tPX+3rNxzb9CPnK20k43+5VJSMuzI
 1j/SuFZafgC7lHy3ylShiQsU5VJdQGXV9Gptb6IXZmcyajgZW4IklJxJPl+Zjlfhw87C
 PEf2BD+DqQLDjRx6YcodkLZk9NBp9jy5jgQeywjae2fq5YfVHufEzOz6NKizXxxB9NMR
 wIhMJkvkBvSpiIs0TmMjQoWp26OaT3UVZnxsidAknGCcKhae3tC8gEMlGMC0mTTAup7f
 eIDYGolSf9Ko0tvJaoZwLCRCWdub1StWrwAwcDWgPf51d8FHEG0aNgkG7aSIcqu029NQ
 Y7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LY8/I6oCe77RHO8azBFmKDBIFNG+bdbJcscB4Wpyyz4=;
 b=WES/UxNvlLqrQKEeQ7n12d2zh+20kH3TmKQ+N7RJwoFtljdRuAhqm1gw5K1LSkHGz5
 Z84jiOK4D+rRYpGhthOBS+zbpHrpZ5SiV3vCT8OIjmZU8F4dtTJUFHxeMR55HY7AXHxb
 AX2cBiaaFnAgR66c0XBFI6bpDXrfk3uKv8aVf302ogiaaF6y26y93UKCCevkPy57F1Xy
 az+NKECMgxl3CYWR8knVuFXIdnPPzRLhL8vw+5RE/kKBxLEB2NoKsSmkNNBKReZSu7Ka
 IhFllfNY80trMIfplt996rMTNH2LdnDQadRwxW5BL29FTmGhLx9jWX4igCltBfwWJVv9
 P/+w==
X-Gm-Message-State: APjAAAUcI+KWK6N1cPpHpByOJ038dfIPmqWLIlnchIbcQTUqYGkBhmyW
 dTOriYcXD0VrYRGlN4VNSkt/wgYW3/TaKQ==
X-Google-Smtp-Source: APXvYqzjtoVqYHoGImae5m/H91UNGEFcM6MNzoEq+9SZrZcht/Cgpw3hbyMw0JXVI2lBnVQOsIkEDg==
X-Received: by 2002:aa7:9562:: with SMTP id x2mr57375601pfq.147.1577495648532; 
 Fri, 27 Dec 2019 17:14:08 -0800 (PST)
Received: from [192.168.1.118] (194-223-58-9.tpgi.com.au. [194.223.58.9])
 by smtp.gmail.com with ESMTPSA id c68sm43187223pfc.156.2019.12.27.17.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2019 17:14:07 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH] RISCV: support riscv vector extension 0.7.1
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <1566959818-38369-1-git-send-email-zhiwei_liu@c-sky.com>
 <ba8c7451-b0a7-0405-f881-0c6d0d8574fb@linaro.org>
 <1b1826c3-50e4-2481-56a2-4ebb01e04498@c-sky.com>
 <fe1a210e-e4cf-f62a-a39f-2818358d53c9@linaro.org>
 <ea5d5926-48ba-e204-cad8-7e5260b2e2ee@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e1c5407-3704-9c34-92d7-fd59e48eb13a@linaro.org>
Date: Sat, 28 Dec 2019 12:14:01 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ea5d5926-48ba-e204-cad8-7e5260b2e2ee@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, qemu-devel@nongnu.org,
 Chih-Min Chao <chihmin.chao@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/25/19 8:36 PM, LIU Zhiwei wrote:
> struct {
> 
>         uint64_t vreg[32 * RV_VLEN_MAX / 64] QEMU_ALIGNED(16);
>         target_ulong vxrm;
>         target_ulong vxsat;
>         target_ulong vl;
>         target_ulong vstart;
>         target_ulong vtype;
>     } vext;
> 
> Is it OK?
I don't think there's a good reason for the vext structure -- I would drop
that.  Otherwise it looks good.

> However, there are still some differences from SVE.
> 
> 1)cpu_env must be used as a parameter for helper function.
> 
>     The helpers need  use env->vext.vl and env->vext.vstart.  Thus it will be
> difficult to use out of line tcg_gen_gvec_ool.

Sure.  That's also true of any of the fp operations, which will want to
accumulate ieee exceptions.

See tcg_gen_gvec_*_ptr(), which allows you to pass in cpu_env.

> 2）simd_desc is not proper.
> 
>     I also need to transfer some members of DisasContext to helpers. 
> 
>     (Data, Vlmax, Mlen) is my current choice. Vlmax is the num of elements of
> this operation, so it will defined as ctx->lmul * ctx->vlen / ctx->sew;

The oprsz & maxsz parameters to tcg_gen_gvec_* should be given (ctx->lmul *
ctx->vlen).  The sew parameter should be implied by the helper function called,
each helper function using a different type.  Therefore vlmax can be trivially
computed within the helper from oprsz / sizeof(type).

> Data is reserved to expand.  Mlen is mask length for one elment, so it will
> defined as ctx->sew/ctx->lmul. As with Mlen, a active element will
> 
> be selected by
> 
>     static inline int vext_elem_mask(void *v0, int mlen, int index)
>     {
>         int idx = (index * mlen) / 8;
>         int pos = (index * mlen) % 8;
> 
>         return (v0[idx] >> pos) & 0x1;
>     }
> 
>     So I may have to implement vext_desc instead of use the simd_desc, which
> will be another redundant. Maybe a better way to mask elements?

I think you will want to define your own vext_desc, building upon simd_desc,
such that lg2(mlen) is passed in the first N bits of simd_data.


r~

