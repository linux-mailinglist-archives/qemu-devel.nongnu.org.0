Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8373B3B6500
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:17:00 +0200 (CEST)
Received: from localhost ([::1]:41628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxt0N-00025U-J9
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsye-0000fn-T1
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:15:13 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsyc-0000gO-GE
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:15:11 -0400
Received: by mail-ed1-x529.google.com with SMTP id w17so10942298edd.10
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wKksJ+GgiGnaSlqHvYhXmYTbnSZr5PFOyls+d33xa0Y=;
 b=YsmvFJ6JAyfXe0dmwuzp2z4YcorNdci0xvfJbgZt1ImuMVJ9A50zvDcI6iXvFHUxqc
 nS+9RfB73TPVVteGdxXzaSC4P3pwAgz/zzS8FDdwwj2pLtU4E3t5bC6OLSRex0K7qRZa
 RY4osVNVXQD91UN3rRpbwWHekMaWurknpsF9zkm+iHfEHk48YOPwMpw/f66aRJEew4N5
 aqnFVDvHbRfrENLbjB0894LKq0m83LmcpZLBqB8Cr56wFZaN/+LNTs8BbE1DbsBAGpNZ
 JVuMUDFxLpXgbsg42UoOZ+COnDQyHyrmw6YDdwL+trxgEABopEYAAMvwubha+qHGk4Mm
 hjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wKksJ+GgiGnaSlqHvYhXmYTbnSZr5PFOyls+d33xa0Y=;
 b=TlYJ4KavkHXkK4YjRRl5Ykz2LM34yGTlBT9GiTOPMb++qSpbp4dqXqY96aiXdxxEfH
 nxjZDm7h+3L2EN6/dPO/nKP56mLhFS4e1iMOHOh2VpnHWI1poFOZgcflPtTYv1eYReVf
 g8/X+PGSZAcHsoyA7ejvIFu03Z73yeU1sb0Hb38vL5XSHANPaNCTTfOxM/A55tO2Vn6o
 kxdqdA+mUSj9uSyTBlKcvirhmCX1JteBWbVxeBvAfflPX6r/lgt+dgLX9Zqg3tzmulOA
 +gS95GvBXD5Gf//Xsd+16sQUcFEzilUSFaGUHQKc+BnWJcBFnPTCOEHoqenlel8MPLLe
 lFOw==
X-Gm-Message-State: AOAM532Y1IJyV1h79mEDiMhrTiGVt51T3wYxME9rIgNY7hJ1qRTLqGo5
 9xFC0pvF0YS8b1GxZp7h1WPLSAEZ3U+cIXN09q/4aA==
X-Google-Smtp-Source: ABdhPJyZIs40lX0wObohn8mrw8VqOXyX7g+CTDfnyCMPqUvpfNXjk94w21U24Qv8hNHELWwonQUuMuR1t8bQqgX/7Fc=
X-Received: by 2002:a05:6402:759:: with SMTP id
 p25mr34067245edy.146.1624893308851; 
 Mon, 28 Jun 2021 08:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210620052543.1315091-1-richard.henderson@linaro.org>
 <20210620052543.1315091-3-richard.henderson@linaro.org>
In-Reply-To: <20210620052543.1315091-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 16:14:31 +0100
Message-ID: <CAFEAcA_FuuFzMgxkdPmZRCO0mQ4XWe6K4MdPXatTcFtkFdhZmA@mail.gmail.com>
Subject: Re: [PATCH 2/7] target/nios2: Use global cpu_env
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Jun 2021 at 06:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We do not need to copy this into DisasContext.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

