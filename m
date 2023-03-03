Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D176A9FE6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:09:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAlo-0001qV-E5; Fri, 03 Mar 2023 14:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAlm-0001pI-6q
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:08:42 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAlj-0008H9-HP
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:08:41 -0500
Received: by mail-pg1-x534.google.com with SMTP id 16so2077507pge.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 11:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870518;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bM1g0LIyk5Cld/C2bL730fbqF1SCuPlRTB0UtNcPydo=;
 b=G8w0OrEut8qOFQSbXzCmEaySTF+JY2J+92rMagNbOncY1KOhyCNFK29YEZTvClq0MB
 Trsd2Q5sGL7dOWzKsW5QWLfwDDCv1cmtmdWr57RstLl/yCgN8vMMEOOT6JXAH6vuI4av
 xkxYob4bf5xxNshRcE5g3X+c/slQNXaiNsXFdwQpUpjCh2I7yBnTupri6YxPhiymNGcz
 wmjwClRDaxmN+ZaW/DGKhQEmFsvRMSujDNScoE1y0xnJj8J4DpbQi5vpcFDsxgZ4uWUh
 7gW/XOEsXawnGvZ/YPKOD8D9h12a1BVzGGP8NhKJIHpz2SH00KNLIQX3ZW7AWpsJSRB3
 83FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870518;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bM1g0LIyk5Cld/C2bL730fbqF1SCuPlRTB0UtNcPydo=;
 b=iapMzHJ1bK0z/yOvIvhGlqJKIYrKhlLWlLBkJVw3ISleuhAEWmOfCiaSw9z5dH4GQ5
 AQJWZdx3GoJyfZfgYwnMIuMGnxBt3pIzygVyjL1fZxpqWQ8rB10huUU1LHtoe3xlu+aL
 Gk3NpUH3R4ed5nvbdUazbLkDXD0/e+bgB+BN2Uvw62tEvo1V0U9BiTGvSipjnp4Q9/ZF
 L3hraxIpI9nUuE/Pd1ebnC/Ayfu2vZ5+/ByxP1wbO2ysIFRcPRd7WUHefGOEbu1HijKt
 6OkybUklsjSwbkRUrQ2DyBokZEVZia0/BM9BTqdOnyKZhz6q84WBmPt0/ldDCkkmClX/
 wuEg==
X-Gm-Message-State: AO0yUKX4mmJhSvPAP+fJwMFW1GivAT9GBhyA9ObR3isuc/TxJWsgvdFz
 TtVkdVWuvAQ1PTrM5h+dcA38LSAqk+tn6ICWBz17mQ==
X-Google-Smtp-Source: AK7set/w8xcLzZUoECso1cR1eLlbE6fwoY9BEPZOyLPtEHUXo7hHC5zWlGoeaVIZmwmSe3pJYAKzCEwDNPl4D+3HiOo=
X-Received: by 2002:a63:2918:0:b0:503:77c9:45aa with SMTP id
 bt24-20020a632918000000b0050377c945aamr827092pgb.9.1677870518079; Fri, 03 Mar
 2023 11:08:38 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-70-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-70-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:08:27 +0000
Message-ID: <CAFEAcA_3FEKE7w3jh3EQYcxGM3A1jX0Q=Tg7UsE3f41bY1tMNA@mail.gmail.com>
Subject: Re: [PATCH v2 69/76] target/sparc: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Mon, 27 Feb 2023 at 05:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/translate.c | 136 ---------------------------------------
>  1 file changed, 136 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

