Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F4340DBE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 20:03:21 +0100 (CET)
Received: from localhost ([::1]:37670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxvU-0003di-JZ
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 15:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMxt7-0002rW-3T
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:00:53 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMxt5-0004KG-AV
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:00:52 -0400
Received: by mail-ed1-x52b.google.com with SMTP id dm8so8028222edb.2
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ckylw5kRvd9EaD01fFCghWh9uV57LbKAYUwZlli7yQ=;
 b=DM1BtRirkm8xD2ItCSeI1Ypxlw4URmGg+Z3WARnBktkefrfLdSRuQrUUrU/e1VxLry
 X7pIvXVCwKHfm8Ukd12xtLsKplzvB7q35aLJkfv9E+q4GlwYtGvBuXjTlUBXmxTF9xSa
 beGVa5UBHYPesok7PNdn54+JwCw/guZdnSP28iZNYZnZE3vHji2vuDPvHQADD04aXFWQ
 JSw2Zx+UbH4xAYqE/6Nd1oY4L+0bW67cizkLWgXLEDqSL1hWd6X97PdVZmgeMONzCWRC
 zxKJteqXQpcpMdzU552IEpOvaa/Kh+QH1l2D22T05IzMLc1Z5IEN6svqchE0+0vWTHzk
 Ez8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ckylw5kRvd9EaD01fFCghWh9uV57LbKAYUwZlli7yQ=;
 b=jbcowaaGv8DVljufJLQ50WFrH3p+EWGF83ZfhhFrcDjnd34NSYEmnkUIefkn2JPsND
 nfiYVzTSY3kqygRgj0U6maVbbj2QwJP5HLQvmMu6eiONn1/cvj9HVDU+bd+Gc1lx9bia
 lLl5lDvNUOc0a420dgpNapvdPfZVu9bTwMxyb32bsr4sN42lqcc0qrsUjasra+l6VCWF
 5hoJifDQ4/+ccvEoK1A0VbG53Fif8H3PgAEwMnY1LqKpljRTC8+sAOBAYhH2FRy5g8SE
 uUKc4tLGavT9pa9bBBueXZbommO1JGlh7TNR+ajkqk62n7O+XFVHh2m6AasTNcEGlzos
 B6ow==
X-Gm-Message-State: AOAM532lCfQI0wTJwmCg7fLqJSVUFUN+DD1ufll6hRAIyfD9VQCvRle6
 udR4tHL2OtzJa50nYrnPJJ+3mu7ZGaywxAObHZSf8A==
X-Google-Smtp-Source: ABdhPJzrp7ZKaGIezKLf7dhw0+mYLjC/KxaHHH8WdTWCikp4wC+ft8tH48Z3c0PFYCb3ZB3vTvYP9Qa+0USTHxMIDIU=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr5425199edt.36.1616094049346; 
 Thu, 18 Mar 2021 12:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210317153444.310566-1-richard.henderson@linaro.org>
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 19:00:24 +0000
Message-ID: <CAFEAcA9M98zRLjU-cep8bNw3D5u_rMg-XttHSrR1ZgQWwxuVug@mail.gmail.com>
Subject: Re: [PULL 00/38] tcg patch queue for 6.0
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 15:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 5d1428d6c43942cfb40a909e4c30a5cbb81bda8f:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210315' into staging (2021-03-17 09:07:28 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210317
>
> for you to fetch changes up to 5e8892db93f3fb6a7221f2d47f3c952a7e489737:
>
>   tcg: Fix prototypes for tcg_out_vec_op and tcg_out_op (2021-03-17 09:04:45 -0600)
>
> ----------------------------------------------------------------
> TCI argument extraction helpers and disassembler
> TCG build fix for gcc 11


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

