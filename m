Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2415BECAE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:17:59 +0200 (CEST)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahok-0000KQ-OL
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeB4-0002ya-U3
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:24:47 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeB3-0005Bw-Au
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:24:46 -0400
Received: by mail-ed1-x52a.google.com with SMTP id w28so4095530edi.7
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=iCnHwFqGnExLVGQI6yrPq1fDyAe4h9fY6ggPnk1yyC8=;
 b=FHvPMmUMJTkTw/FeExLLUNZVYSHVN5pHxe9BmvES+BEb4Nlk6Nfb3F+vvMK2xWnF3E
 5SB8PSxkdxJZDEQtUWht701b+9/M6XshWiEmNW2n2oTmQzDSlmCWxVyHLLOBFfEuOmAw
 CXrFnWiunwCw5jArxk/smWXmdobGdnqbCeQyF19lk0lSraIp8gZs4aNz00wbEN6uGZl0
 uteto3OmPEN3/6zQLOMqWBClqtos6nikYG7KgNqD9AuzqZkUydLoPfVez8RzhUafccaO
 d48120z2YBE7e1KX/7sBLnYG3PuHhv234Px13JRLPBagAVxM7/2N8KREcbhCJux2QE1y
 +MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iCnHwFqGnExLVGQI6yrPq1fDyAe4h9fY6ggPnk1yyC8=;
 b=uO2oAGArsRZszddgm9alhIibTxIuM7qpo8HaUkbbXE1v7jGlaGsBY7AQ1W2YqS4VXT
 rsNxPgDYZGZYbNISPR4c5fU+vw16QkWUrah2BDD40n1U54QLrnM8IY6WbqJqBBgiMo/h
 4ZYDmNf3EiCw6GM8v6vElTOQk9r6Ori8J3ArpyeVCghuuQESx1RIXFDNjv0alkoz7JsV
 ZNESCNvP7VXPLeTbp1J7+pWcU5mCh77o4ZmMezNatI8j+YrZp6VctDGo04fIB9NoBFiQ
 pMKVBIyBA3Ie7zltYQ9AiDOddcBNSmSq4XG5WH7dy8VuLXPq0ZNBH1scbg4f936YrhjW
 lkcw==
X-Gm-Message-State: ACrzQf3Um7vTkA3U+hK+W1AXcrtuOQUV3b2OpICAvFkOPjT/Xf93Kgzw
 8ukE/IBipXJv0MDn4MuDgfPoMnqRLkYaLwgfLnNLrw==
X-Google-Smtp-Source: AMsMyM6ZgxJ3DLmHBwHC8lXBaPdXSfPKmD93Poct6Xp7uZcHK/kZWhNs4UmjiC2uPwu09z24DV1qSb8wdtnQ1/lXERw=
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr20700813edw.53.1663683881306; Tue, 20
 Sep 2022 07:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-4-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:24:29 +0100
Message-ID: <CAFEAcA8kq-LCeBG25g3nhN9Sh3XnHniZLr39AqaNwoCcgwJKMw@mail.gmail.com>
Subject: Re: [PATCH v2 03/66] target/arm: Use GetPhysAddrResult in
 get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 22 Aug 2022 at 16:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 69 ++++++++++++++++++------------------------------
>  1 file changed, 26 insertions(+), 43 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

