Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E325461A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 15:40:27 +0200 (CEST)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBI8g-0000L4-FH
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 09:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBI7u-0008BW-JC
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 09:39:38 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBI7r-000687-TK
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 09:39:38 -0400
Received: by mail-ej1-x641.google.com with SMTP id m22so7660359eje.10
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 06:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uOOpIUEpKND8Xenl6ngCr01i2rdcJVzjIROy+VzT8mc=;
 b=BIKQVPU4RcwskeVNuunnMT/xS4nu5Nc9NqNaZIueGifjJjF3PDrCaooS0R/jrPEy+1
 fxKu08NIzewknB5Evyg9fhyWl13c+0Q2EyO6RIxjH2fojyCtVTQ8S0bxlq4KejeATY+4
 MLNWH/yOU5EbifLdzGHG4W3BZnRIMYWuDXDx6HSwWgPGixi7VGI0pkvNBnF/XosFWgiU
 TSxyURiC7hWBzIH4jLrjA+zaYXEO7CF0vqZTXk+pbVMasRVfUDopdWBkdnYX10fIiZTf
 AhXJqtXbBnIgNTRt9mxaMHr7gf+QdVwIzvotYAQTQOMdu7jMXr7ID0+2dpahQ9QNH15p
 cpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uOOpIUEpKND8Xenl6ngCr01i2rdcJVzjIROy+VzT8mc=;
 b=kcYPqgZznAQmDDZU7K5LToJ5SEcDgP/SrtoTN41uT3nLIxfiBPvY4YNZdli5Hk8yVN
 WJ/xCLlA2B9xPP9Wz+T52LC1PEqAiea/dLbhh9GvEPu84ko1FP61/lyI/Shwq2nE1HW6
 mWvVrpvsrIy1kH4ppyVLA1RtfcJ8VIMTLFT2M2ZMQJgjA37WQ5EtJOJGtTEc2MjQmsu6
 qKtQVmO372ZYmIm6YSmt6gSJNiEIyqFS+8auN9LhhaW556+egwEtvyMSsktHOhXzAseD
 plYbun8xI7KNV/rSR0lMVkGQQq7rSiwtznQLOhHdBrdFvqcYzGHXR/rzr0gdgG3Y+2+l
 Hn9Q==
X-Gm-Message-State: AOAM5300Yb/dC1WEyY7XqXP9603qtYfGusskx4zpyVfrC3pKciB3++Or
 nwLi2ygzftKMwputHi8P6/6Jnfuhro29ItWyeqx0vg==
X-Google-Smtp-Source: ABdhPJzVBY4MuI1TOYsVkS8YGdUcND7o4w95LR7qhsiKdta4bCzNqiu9ooX++LHXyPdCyt3uZ9ZUzRZw2IO3sMKdEEk=
X-Received: by 2002:a17:906:d8ca:: with SMTP id
 re10mr20234887ejb.382.1598535574148; 
 Thu, 27 Aug 2020 06:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-4-peter.maydell@linaro.org>
 <6dee2bdb-f585-ffec-e57f-47517e278baa@linaro.org>
In-Reply-To: <6dee2bdb-f585-ffec-e57f-47517e278baa@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2020 14:39:22 +0100
Message-ID: <CAFEAcA8Du8ejOK1v-CKtppB2GJvKtxPmhBTDKVndceOHMQ+cFg@mail.gmail.com>
Subject: Re: [PATCH 03/22] target/arm: Implement VFP fp16 for VFP_BINOP
 operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Aug 2020 at 19:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/24/20 7:29 AM, Peter Maydell wrote:
> > +DEF_HELPER_3(vfp_addh, f32, f32, f32, ptr)
>
> We do have an f16 entry in helper-head.h, for documentation purposes.  It
> expands to the same uint32_t, so it doesn't make any practical difference.
>
>
> > +float32 VFP_HELPER(name, h)(float32 a, float32 b, void *fpstp) \
>
> And here it would be better to use uint32_t explicitly, because we're
> definitely not returning float32.
>
> I guess you could see if dh_ctype_f16 works here?  But that looks a bit ugly to
> me.  Perhaps we should have introduced a better typedef somewhere...

dh_ctype_f16 does work, yes. Unless you can think of a better name
I think we should go with using that. I'm not sure that "16 bit float
held in a 32-bit unsigned integer for the benefit of the TCG calling
convention" is ever going to have a particularly snappy name...

thanks
-- PMM

