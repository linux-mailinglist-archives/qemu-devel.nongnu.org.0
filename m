Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBDE196266
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 01:19:41 +0100 (CET)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHzCN-0004l8-3Z
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 20:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37649)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHzB0-0004Hs-5H
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:18:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHzAy-0006eM-Qd
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:18:13 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34383)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHzAy-0006cJ-Fn
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:18:12 -0400
Received: by mail-pg1-x535.google.com with SMTP id d37so4894789pgl.1
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 17:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Stdt4wZS8Bw1Pr/+C0ql/58da6XeGZWRl23JDh6f8gI=;
 b=fw0dPDSRqF7hvnzkx1Ke11TBvJgoTIjv4yp264rYGG3PRGdvPamo+rdoMpVYb2MA89
 hxmgpviuibELy6WPuFNmekHDSu1xzOBszD5IHMKoXRIWzKNJVWNK4oRg5Rn1QeTPz0GZ
 dzc/9JnyrcGRa5DbQADJlnTdUJanHm2lhFnEeegnE7wVHG7YKsqtRud5tIqYWRA0FFQK
 3lduiAwLl5t5KG/jbLYRj9u3A43AG3uQTNYTxM+fNlY8yxo+h5PH336P7eB8RojRBszK
 blngCqI2sgf0kPX2cpTRmEFceUX8iyUb6gO0rnmOCsvpaBKbyWdy8WKEpgdintn6p8bK
 +eRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Stdt4wZS8Bw1Pr/+C0ql/58da6XeGZWRl23JDh6f8gI=;
 b=SZYgHe0bFilC81Mmn3UVUvF3kDnAeUoEowoq4fOMyJYcXS2E3tSJfAa/0/YnLfBQY8
 OgenuooLkNhu0YCr0oUyY+RTuJjoFI81k+Ughqia/uMHDPY8vIlLi7+O7TL1BElzTiMs
 fKfyNutUjEj80a2DXhW7yIjWbdhN9ST6gKUygfglPaRN1apHak2rwf8yLdhl0Nh4Hdg0
 +hueUKp0S4jQxObInhe/wg6CpisGSt7S1QPOmpGXaBbA43URXF63tlAdKEMz6wLxy5JW
 CK8AEUCX/q96j73w3pjUkWe62fq0SDo/VZ1q5G4FVjij7rARhlH7zLhKgtYeVvuLIH0a
 MwqQ==
X-Gm-Message-State: ANhLgQ3kVL0k6Gx/xrtVtxOUV1nJd32XolFiIMesuuOJdc/nBwe7S1Pv
 lb7cJzi9se6gXaqwPEnV6gaHpA==
X-Google-Smtp-Source: ADFU+vuMYuKRlqi+vtg1ODV2HWgA0WGftstjbpPQiLyzPXggPPduSK6xZpqoKa9KswWASAozU45pNg==
X-Received: by 2002:a62:ae06:: with SMTP id q6mr1845983pff.137.1585354690898; 
 Fri, 27 Mar 2020 17:18:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id l62sm4654340pgd.82.2020.03.27.17.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 17:18:10 -0700 (PDT)
Subject: Re: [PATCH v6 23/61] target/riscv: vector integer merge and move
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-24-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e89b1f3f-8395-31be-4ff5-2ab2a21c1adf@linaro.org>
Date: Fri, 27 Mar 2020 17:18:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-24-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::535
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

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> +        if (s->vl_eq_vlmax) {
> +#ifdef TARGET_RISCV64
> +            tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
> +                                 MAXSZ(s), MAXSZ(s), s1);
> +#else
> +            tcg_gen_gvec_dup_i32(s->sew, vreg_ofs(s, a->rd),
> +                                 MAXSZ(s), MAXSZ(s), s1);
> +#endif

Note to self: Add tcg_gen_gvec_dup_tl to tcg-op-gvec.h.

> +            switch (s->sew) {
> +            case 0:
> +                tcg_gen_gvec_dup8i(vreg_ofs(s, a->rd),
> +                                   MAXSZ(s), MAXSZ(s), simm);
> +                break;
> +            case 1:
> +                tcg_gen_gvec_dup16i(vreg_ofs(s, a->rd),
> +                                    MAXSZ(s), MAXSZ(s), simm);
> +                break;
> +            case 2:
> +                tcg_gen_gvec_dup32i(vreg_ofs(s, a->rd),
> +                                    MAXSZ(s), MAXSZ(s), simm);
> +                break;
> +            default:
> +                tcg_gen_gvec_dup64i(vreg_ofs(s, a->rd),
> +                                    MAXSZ(s), MAXSZ(s), simm);
> +                break;
> +            }

Note to self: Add tcg_gen_gvec_dup_imm(vece, ...).

Neither are your problem, but we should remember to update this code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

