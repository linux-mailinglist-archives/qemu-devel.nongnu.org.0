Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F39578124
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 13:44:16 +0200 (CEST)
Received: from localhost ([::1]:38670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPAd-0003dI-VJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 07:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP4g-000597-TO
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:38:08 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:36559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP4e-0003JN-Sl
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:38:06 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31caffa4a45so103598997b3.3
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 04:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCBtcHtX3oYQipZUSu5koaA9OW473QyAlI5Upd1su+Q=;
 b=bKRx5R5Eza8FjCWPcjrxXCqMBfZ/QUmWmrV/pUtXRA1tAwJKV/7ihiJYAdEA8DrvFu
 TVZYxNqVfVGJSEknbCKK8jzYDKX2HxEkUmAxkskyBvQuc1FM504OfhLkIzngSQKXRj/P
 AQiwSupyoLtt2XAQniGSiBJ94Kqh1DoVSSA5siBO2iiHPrYvILn+Sl9doUZNSYznNt84
 VBU2g6FlLnM5U9dd9MUYd0chGhI54+st3n/HvmWIYujRb3LfZENK1kyvFZwlkDBVbN2L
 UHuyadNpz6npF7ayOAtNX6qtg0T/x1GINqoSGoRY/G4k4M2NT3tA14tbmWBiNge78EV9
 b5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCBtcHtX3oYQipZUSu5koaA9OW473QyAlI5Upd1su+Q=;
 b=CrVD/dOyl2yM+OKfGhkiBKTvBT3xGrX5CLCV1vrTCG/nXVyeisfqvuvVsAO4KocZ6j
 HrUBWciRNeLY7/ukuxhbDrbLVhi/WUavIgkahVoilaSk7+3sYRilSo594lp35rUf2KUF
 3E1rcR7tDOKIDH8J8kUh3Y5vnsDaS2VbKB0292uKpn/veuQ8E98RSkYJxpDzIlV3FSQo
 GER4WgkPtKARFeWhwEv33P6cQgJwAUmnfYZj1KlALw/tWYN/13JJiDDT7iuilIlh4+EI
 /J0LcBA/PDMeJfk6kV69cPvPndugGzrVN6nnQnkhXc4pFnvuas3hyI11c4VOLo/iMIVO
 fqug==
X-Gm-Message-State: AJIora8cr7ipSD/N5T4x6cVqhnFxEUk3h4H8sbQuyXVEGwIYWWtFpy1L
 pPSzbwdHNoDiKb7RfpkCo1t+gzTJKW59sO7S/oDumQ==
X-Google-Smtp-Source: AGRyM1skk1tbTAFyTFEoIHgSMi9aTaxiH/Sx5JQLin6KKU6BNlxTOWrxqwn2Co5NJznRq/5U9xQZ1ZvnxL613QAMsOY=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr29436824ywb.257.1658144282285; Mon, 18
 Jul 2022 04:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-19-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 12:37:51 +0100
Message-ID: <CAFEAcA8zq9muMkU5Ex1256qxZhHHQPGWk6HSQcqde=MiFEsSAw@mail.gmail.com>
Subject: Re: [RISU PATCH v4 18/29] Compute reginfo_size based on the reginfo
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Fri, 8 Jul 2022 at 17:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will allow dumping of SVE frames without having
> to know the SVE vector length beforehand.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

