Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003E1557828
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 12:51:09 +0200 (CEST)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4KQW-0005ZJ-3q
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 06:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4JpF-0007Su-5u
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 06:12:37 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:41595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4JpD-0003VR-C9
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 06:12:36 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31780ad7535so162850097b3.8
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GP08PTu0ONM+UgapC4xwFQOe8C7WZnhuELMj1bD7rRE=;
 b=sQEfLJdh5I/U1AIrWFlb4kuCkHfLtbjzVFjmJoP//Qd5zJcxEBpqMrFk1KiKhCJIk0
 oQ1RxhLcAp5qdOhH0I+5otfwvFQMvBbqFG5NnMDwhaCzoSmDDTEUF5vo7+oYNivM/QzW
 ZbmBIqEL5Is1i4zcHGM4ceJnvMJMzamwhZY3/4BRgSBWi1HFaeEuqHLPh4kxV01qnErQ
 TY+Fy+Q6yIuLBfhVyum1aGESTi6e7b8D88sBZFG+LXh3LJOx4ywlow/430JzOzRMKQpF
 zLl6sW1yFyrge5YCZHH/fr21+w+MaWxF83+HoNiMzBGL7va5Gel1c9OcoUw9Udfgvkx+
 6AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GP08PTu0ONM+UgapC4xwFQOe8C7WZnhuELMj1bD7rRE=;
 b=KHTX1p4QJQRUAWLsqLOXBgrv/TqCbaVQMvKwKW6DiKX3WINxH9vpS1jKrquAyqP8vZ
 Q2isRZO35ZKmM1ZCJ2PDASzrYl+sIFPmcCVwKGiEklUVjqAtmDpfBnenJZMxusjawt/W
 QjvL2d81bbm2voFc+L6h3eGWpUMYAyRsDZgjkwRdkcVVNCkuWXLGt9epDstU1K7VvQNO
 GYRakrp+b6wm6EG5fnm4hASsNFTMfbuHkNt9ujGMv4iRxBQ/yaSpvi0dj2awouP4NNkQ
 1TOjivtvnoATpJfu3ZsSxHI9nv8LvrIFqI27X5EgJMCHo2rXH5evPP8un4k4x2+I+yUh
 OU3A==
X-Gm-Message-State: AJIora8ip1Tx+zRLmq/MfI9HxabAUm8CokmKyYRvRBBEL1Pf/ubVkjiL
 T6j/SkWqdrAivFNHAgRKdMt86GkHpeTEDyImEj0BntTeKO4=
X-Google-Smtp-Source: AGRyM1up8hnGBuwCpNZfSoE2GoeboXsBGF68+7JUGw+nThUPt/SXCkhZJkP1Q4sY7gJKUTKse50krT0SdQhmCp+q4es=
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr9663470ywf.455.1655979154063; Thu, 23
 Jun 2022 03:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-24-richard.henderson@linaro.org>
 <CAFEAcA_f1dtuiTLuwZL+MTeNsJc1fiWUZmRzvZBHAFpbDzu4hg@mail.gmail.com>
 <a2848fea-8d1f-03eb-2168-3cf5c1eb2de0@linaro.org>
In-Reply-To: <a2848fea-8d1f-03eb-2168-3cf5c1eb2de0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 11:12:23 +0100
Message-ID: <CAFEAcA_RyLCeVTtGKbo-1P0pisXJY7PwYvob9wJUfbFftAuWtQ@mail.gmail.com>
Subject: Re: [PATCH v3 23/51] target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Jun 2022 at 01:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/21/22 10:23, Peter Maydell wrote:
> >> +static bool trans_RDSVL(DisasContext *s, arg_RDSVL *a)
> >> +{
> >> +    if (!dc_isar_feature(aa64_sme, s)) {
> >> +        return false;
> >> +    }
> >> +    if (sme_enabled_check(s)) {
> >> +        TCGv_i64 reg = cpu_reg(s, a->rd);
> >> +        tcg_gen_movi_i64(reg, a->imm * s->svl);
> >> +    }
> >> +    return true;
> >> +}
> >
> > I think we should define functions that parallel the SVE
> > vec_full_reg_size() and pred_full_reg_size() rather than directly
> > looking at s->svl, for consistency with how we did the SVE code.
>
> I had actually been thinking of removing vec_full_reg_size, at least within SVE.
> However... done.  I've propagated the new predicates forward through the following patches
> as well.

I don't strongly care whether we use vec_full_reg_size() or
look at s->vl, as long as we do the same thing in both SVE
and SME.

I do think that it's worth wrapping up the '/ 8' in a
function that describes what it's doing, so the other
option I guess would be to use s->vl and s->svl directly
when we want the vector length, and have a function like

/* Predicates have 1 bit per byte in the vector */
static int veclen_to_predlen(int veclen)
{
    return veclen / 8;
}

and then use veclen_to_predlen(s->svl);
(Adjust function name, types, / 8 vs >> 3, to taste.)

thanks
-- PMM

