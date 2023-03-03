Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FAE6A9DA7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9AP-0001aR-1g; Fri, 03 Mar 2023 12:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY99z-0000tn-JM
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:25:36 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY99w-0005if-G9
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:25:34 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so2909403pjg.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864330;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=raqoH4xnGC35ms6zXFn3a1ISCKigouTArbSSUf/deY4=;
 b=OA+E4IELnfNcQfbsHXoAI+7BVSv/InEaDzNALq7lj5GP7jOog1wOh0IYXlk1IxoU5t
 sOwNesKYdpb7VDdO3XQ+i2uNXMXc1czH1FWf25xdLx0QrUAEKc6+oEhe0wdbNO62c8kc
 VUC0uv08kxlzuxB7CLs5Gn7IymRXMJsOHC8JCLDnu4fA9ROVhOq9eTZrd2wD3jpPqgXZ
 vl0NSqtzHNflkcnvY9HXroRg7ILzI+y6JOaXUfhmIuZ7plPvdM5n8G+bOt3OdlTd2u1A
 hlYnaTDIEpMUzioVPrJQI+dXbSPibrGRhtavqvndXJCEqHeCQPaI+L5+baoZq/Kl9QnD
 eWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864330;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=raqoH4xnGC35ms6zXFn3a1ISCKigouTArbSSUf/deY4=;
 b=OZcKroKvheqgqv1jBTNXy4iqQAQtSHi7AqvflcjChEKKNSiLHcr7gMhdcinRSVoRtn
 Vg24Jo92f7fAI82Rk4SdDr5L0rf62HYM+X9LOrmWzgSsUDQtKnHbbvSiuifiGK15mErZ
 AIKqzPJO5+vTwmwonPspO2We33VLTdlk0ebzv35qBXQc+IFFWCOWUGUoiML/b2j7e4au
 UgSid2nJGbyllxa5j459D44LFe8FXUz0mnDC6rkyLJx94ziXazFDhJJgoyBEyGGv1lpM
 7DcAK7ILlZyLwHaoS8Mcc1ZuL/d3tNLfQbcXfjD9l9KAMbZWUZ4L+5+ubThT8bxdZ8G+
 hCgA==
X-Gm-Message-State: AO0yUKWjf+freteqvfRmM1DiCG+LKpxZARhyB5p4nnYo3ekaegcazAVx
 1lxXXMKoSd2QWH8WGd4q8mKeaErKEINZXxXDHO6K2w==
X-Google-Smtp-Source: AK7set/eojrNH1fSUVifJX8Vboip1gHfsgXOeK+j57JWn5t5Q8QdFq9V+vhi5/cbEL9kLCHvD0PqxBnfjv3PBblFGro=
X-Received: by 2002:a17:90b:893:b0:237:7edd:2e08 with SMTP id
 bj19-20020a17090b089300b002377edd2e08mr901355pjb.0.1677864330484; Fri, 03 Mar
 2023 09:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-2-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:25:18 +0000
Message-ID: <CAFEAcA_+PNfRrYR3=2rHtg2w+BRWRmeP8_kpzec-Xejb4Loidw@mail.gmail.com>
Subject: Re: [PATCH v2 01/76] tcg: Remove tcg_check_temp_count,
 tcg_clear_temp_count
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since all temps allocated by guest front-ends are now TEMP_TB,
> and we don't recycle TEMP_TB, there's no point in requiring
> that the front-ends free the temps at all.  Begin by dropping
> the inner-most checks that all temps have been freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

