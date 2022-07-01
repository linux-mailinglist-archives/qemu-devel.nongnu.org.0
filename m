Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89682563370
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 14:22:49 +0200 (CEST)
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Ffb-00088H-Q9
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 08:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FcC-0005uM-VA
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:19:17 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:38698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Fc9-000342-5T
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:19:15 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3177f4ce3e2so21858137b3.5
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nlFl2EkXWUmkgmuIBVPdY3RBGRmYP9NERpplL9+6QUQ=;
 b=H4Mz+xsRow/M2WU0JsZ3miR/RJi0jEeAxAG3q32TNTZoV6Zna2sYwJBQ6shnH+tTUu
 9i68RO4Fbk1ghBa7wepZTPZvO4UDSEJOlNsB/uIcXtJSnGcIlsYySTu2XzMV299YzxVc
 vXklmBqjfC8WHpDE2YP1kEBqQXQ5kSDSZdh3jQzQkwjKcp/xDzKrfqpUby/S8ZpjUXOu
 k18V0qR9g+4JTNEaxBV4yWojuflItbg9hUwZ6z97Dvf7tvL9qRJ8Xr4BO4EANNIOuyMj
 hMd41N8pgAe1jeQuuWL+cQY2vNt+3jQBpPEx3u4ouh9kWWLdk3L5mhYT3BZLoeeH2qKN
 BPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nlFl2EkXWUmkgmuIBVPdY3RBGRmYP9NERpplL9+6QUQ=;
 b=4yTu5FmdgdNabxScRoEya/aT+P8/1PV7thRwG0Qe28Spt6wfP4+xAjOa/ZEHQ957Fj
 8LWSYMXwVqgJttTsi2BD1a4597G0szlmPOZ4uyJGbOQIY1XWuoJzY/S3XYy8KDo0/3yi
 /omOgy/cy32UhmVxuTslTFy1YEqPDpY/n5RD6GX7MrCYojfQnGafnm0v958myNT5i7aT
 yv6HNEd9gmI2iDSFPtrDrIwWOdPhv1E3bXW7SM732snbae4YG3/VdSVJmD0JxLRDq8VX
 bkScTKx82Fo11jgY4ypwxo0x3gnhkODYR+KBeO8yb3cjKBOAr/WoziGGvSXIfAe6T1fe
 Terg==
X-Gm-Message-State: AJIora9000L9BsX/gOsOiE4TOzZpdYtn08nkaMtoKPXML/3RiSC4AQt2
 1skc5JniJPgN45X1IN/Ua5i2r0BmthMwPtt//GOZy6T9NVUhlA==
X-Google-Smtp-Source: AGRyM1uTYTRLlya8jl30m8ky/OgVtjvKiqeVU6RDe3Oqxeuu84M1swzJlicNZDqayyM+CLRsmUaXSPSYhng78L51OGM=
X-Received: by 2002:a0d:db55:0:b0:31b:71d8:21af with SMTP id
 d82-20020a0ddb55000000b0031b71d821afmr17271146ywe.469.1656677951096; Fri, 01
 Jul 2022 05:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-8-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:18:33 +0100
Message-ID: <CAFEAcA9DrujnB==AXU3udYv_sfCcWT_sUxyqsYoMJDAoyOb+vw@mail.gmail.com>
Subject: Re: [PATCH v4 07/45] target/arm: Mark PMULL, FMMLA as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 28 Jun 2022 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sme-fa64.decode |  2 --
>  target/arm/translate-sve.c | 18 ++++++++++--------
>  2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
> index c25bad5ee5..c75a94e0fc 100644
> --- a/target/arm/sme-fa64.decode
> +++ b/target/arm/sme-fa64.decode
> @@ -58,8 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
>  #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
>  #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
>
> -FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)

This encoding pattern (as the comment says) covers only the esize = 128 case...

> -TRANS_FEAT(PMULLB, aa64_sve2, do_trans_pmull, a, false)
> -TRANS_FEAT(PMULLT, aa64_sve2, do_trans_pmull, a, true)
> +TRANS_FEAT_NONSTREAMING(PMULLB, aa64_sve2, do_trans_pmull, a, false)
> +TRANS_FEAT_NONSTREAMING(PMULLT, aa64_sve2, do_trans_pmull, a, true)

..but these trans functions cover all the esize values.

In the pseudocode for PMULLB/PMULLT it explicitly does
 if esize < 128 then CheckSVEEnabled(); else CheckNonStreamingSVEEnabled();
so it is definitely intended to distinguish the 128 bit case
from the 16 and 64 bit ones.

thanks
-- PMM

