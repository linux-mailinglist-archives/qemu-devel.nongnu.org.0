Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0594CA796
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:10:21 +0100 (CET)
Received: from localhost ([::1]:34524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPgK-0005Pj-98
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:10:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOQM-0004JQ-UT
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:49:46 -0500
Received: from [2607:f8b0:4864:20::112b] (port=45815
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPOQL-0007jo-BR
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:49:46 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2db569555d6so15767007b3.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5fg8uctUUB/fz2PNgr78m78jIFM5UA87YAGAtPI7rXs=;
 b=rQzYFw40G+emuGH7o+VKGGZTOCc8oiwBOnwhFeSXqALijjaWmMTMyv4gDb+6bokQev
 PF+znpili/45Yo6Xy0v5upW2fLXBQ8GYQwTqQXyWM70lHxw56J4BGUGMDQOHqPeXOGZK
 39C1Rgjngjyqxt4emQs8kpKOSviaLsE0E2xNdc8WHg6EToJcM2V/l8hAM2nDw9ugfPlU
 i3O88W02+wD8SpVDgPzQ5pkBReEoMbzw0girFIfFkgwNsL2bFOMUZqQTDvgXE0QYK+rv
 T1AB534UNaKUaH21IM1MWY3u5z+13iuep/KWarqo4YZ+x9+3n1cl9cCokIO/DLgv7sg8
 qWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5fg8uctUUB/fz2PNgr78m78jIFM5UA87YAGAtPI7rXs=;
 b=TJFYM7/RLz5b1LRN4gtHChqmsEvZhE8caoLWzhap2gEvn7hGtRH2TXCkygF1ayVFeH
 sLbVImgT9IfzJP2YYmD6sk2uGu+MPjlSzHz5q3p4N5nhfnbg12TneqAouAysZTrwOu0v
 ER6dbQ01odLt+XANqLNVV1uLsxcu7Y5+5KkB5q9EaZALaCqKWG1L3qRrApTU1pOpKl4h
 MooBh8m99W23Qe/oJkDzjLETe4DvRH6YAu/ZXuVyHnTkeR3EMGo1M3p3UHA2QhQpoXYa
 mRECfDRJot3eC/z/pV/2dfbj+JSebagrbIvcq8yGHZFKkekRjYP5yg6sqhEWKPDI2Mw4
 aphA==
X-Gm-Message-State: AOAM531pcje8kcA2GnAAq12Xrpj+nTODjcrDgsX2vCzyM1yq+J85wAA0
 2y2HlBRyWRz5nkqsNEvlPbVTWBweuswMoFezQOV1Sw==
X-Google-Smtp-Source: ABdhPJwLRIRgwkXXJSp7i8qcMJGXCfvYlrXLadQUcJIFq/cT33NucLliv+5SmL+D9eUQGsq9UPrxH+9yki92Yr4jvkw=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr29686277ywh.329.1646225384456; Wed, 02
 Mar 2022 04:49:44 -0800 (PST)
MIME-Version: 1.0
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-4-richard.henderson@linaro.org>
In-Reply-To: <20220227182125.21809-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 12:49:33 +0000
Message-ID: <CAFEAcA-w2aB0_XLbFQ7KC8hjUNkFaisM1AUDCe7J95hBWVNAog@mail.gmail.com>
Subject: Re: [PATCH 3/7] target/nios2: Only build mmu.c for system mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can thus remove an ifdef covering the entire file.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/mmu.c       | 3 ---
>  target/nios2/meson.build | 3 +--

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

