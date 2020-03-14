Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6736A185687
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 23:48:42 +0100 (CET)
Received: from localhost ([::1]:48990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDFaC-0007Bi-UB
	for lists+qemu-devel@lfdr.de; Sat, 14 Mar 2020 18:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDFZA-0006lW-HV
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 18:47:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDFZ9-0007Re-2a
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 18:47:36 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39389)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDFZ8-0007Jb-Qa
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 18:47:34 -0400
Received: by mail-pl1-x641.google.com with SMTP id j20so6022848pll.6
 for <qemu-devel@nongnu.org>; Sat, 14 Mar 2020 15:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2miZj5xTixwNA3xgvSUJHc0bNUublKZJRtOf/dCHW/o=;
 b=VoYJdVsVY0/UyOYocIP7DgNwp/cvnXCr4uDYRHXO00XpMpO91wvSNTrDY+Zl9mf8oN
 srF4KGBRoiU2AieoaCOd/tRfqSyjye53zHbjj8Kiba/LVg3gZh4ulTskpgnb9m2Y1Xzn
 kuLgtFyEaqR3ZddXTrvABoyLluANhkiDpZ0zUs/a5i8xUOE6jsujdR1IZZ6G0nEuNHAU
 V3dUVnww0n+KFUjn+8OWjQOso3sXmLCsKyHD/cBU0zTNgZkaSDWllfdKNJxr5N0mgXjA
 dJXMHJws1I4FcyzEgAKvkazy38cnokB+B1YdlWd8AeIrn+SUVlWj6/PlXsjbaKggPOmc
 Bn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2miZj5xTixwNA3xgvSUJHc0bNUublKZJRtOf/dCHW/o=;
 b=IJqce2CBDBWlBrNad2cc/eZnP5R3/bkniyUMgCh4pJb+onIoDnSEWZc+YxBOHHUnp5
 xeLDs447WAN/nwRBSP5jOwN7lwIhBsdJN6YkH3Hfuy/PNIkl9t8bw78RLv2DPRpLRU6G
 tERGinrwc76u9rT1y/N3dO3nWp0ZS/XPa5j8Z6zRFfVi6XpQ6ijBYEk2Agb9gnXgj0Cw
 5vdNh2vwL2FimmOB0RQaemtch/yJ9EKFhFqYzUD8L7xHby/yDiQgqJtYeism6aYr9d/i
 edwtkYqnv13f4ZqyqScY9EnO+0P5PUcX+9zze0+zCip5UEVcHqwpxaQQ/W9uelFB2CTT
 wBQQ==
X-Gm-Message-State: ANhLgQ23PfyIX1kamtp8hIn52tTj0996zTs9aZT8mtBGV8MtLxhl5yBi
 GpV2ES3KKcZtyM0W1kL3zeTfCw==
X-Google-Smtp-Source: ADFU+vvLr6PMYsku1hy3m2JKykMYhYthH9iCJZKynj5WZ23rxgttLhJedK3uDHptVTqFPFCqdtQ1YA==
X-Received: by 2002:a17:90a:858c:: with SMTP id
 m12mr16979413pjn.127.1584226053159; 
 Sat, 14 Mar 2020 15:47:33 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 p9sm15280860pgs.50.2020.03.14.15.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 15:47:32 -0700 (PDT)
Subject: Re: [PATCH v5 40/60] target/riscv: vector floating-point merge
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-41-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37215373-eead-9185-faf9-f2ebc0cb4193@linaro.org>
Date: Sat, 14 Mar 2020 15:47:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-41-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: guoren@linux.alibaba.com, wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +
> +/* Vector Floating-Point Merge Instruction */
> +static bool opfvf_vfmerge_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return (vext_check_isa_ill(s, RVV) &&
> +            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
> +            vext_check_reg(s, a->rd, false) &&
> +            vext_check_reg(s, a->rs2, false) &&
> +            ((a->vm == 0) || (a->rs2 == 0)) &&
> +            (s->sew != 0));
> +}
> +GEN_OPFVF_TRANS(vfmerge_vfm, opfvf_vfmerge_check)

Similar comments as for integer merge, using tcg_gen_gvec_dup_i64 for
unpredicated merges.

In fact, there's no reason at all to define a helper function for this one.  I
would expect you do be able to use the exact same helpers as for the integer
merges.


r~

