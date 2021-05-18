Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA43387766
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:23:36 +0200 (CEST)
Received: from localhost ([::1]:56780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixp1-0005Og-CR
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixng-0003tz-43
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:22:12 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixne-0000qx-CB
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:22:11 -0400
Received: by mail-ej1-x62d.google.com with SMTP id n2so13953089ejy.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 04:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2499h/GkY7p5xuQ4/MVuzdWJM5HyKuKCmQRDGWVS0Pg=;
 b=cKM5g07Y6hFoxoyNFky9kjnuuUMquUaMt9wj5g4gYuPzvrXcxWqAN3GQdqRPpNy8eu
 bBeVWt8iLxSeN+vRVGyT90WF5UkuwCISLtFpPg1dH7C7HfzzD4+5Pnq9Meo4Q+gm1Uva
 L3Jw7YYdIcHsrbJFdiQ2A3jfoLpusQwSz3QkBp+yzteyPrEKxHsXTTGTwl1bZCC4uHXt
 cX9bqDwsxvPaxTLW9CFUXDl/BZ8nwvVhP2y9MvtXugA7tObR4qUh0sgCWSWaRqnfxAT2
 aZfrz59+wZyIL6XQzSeSlnISt5VJhWhGfpG+OsSwh6K7axTGRMWWH9cCYWu+SK8AmQ4n
 eixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2499h/GkY7p5xuQ4/MVuzdWJM5HyKuKCmQRDGWVS0Pg=;
 b=MVONl3PZiDKXJHIzhcvm9xLDQXCa70Y4k9nupcvD2Ky3R2ODOQZ6HgnnbbfKodSkLN
 JtS7G1IaXaSgeLsPh/8dy8lC2adzF92tC+JlNNr54xzdY9dlf1k4go6U4DOjET0CEFsd
 HDFd4D5u+YBG1ZuaJkhYS7cTJH86j0YyNWLZbZBNkgN7YeWhFM0Xsq5T12YFXkYcV0HL
 k3KGHrJoUsyRdV5KdjpeDKHEwCQiqq6NCnS19cNBA3FzYgVqpX0ZG0vWHHBF/qF73/Ny
 /1pUJ0Fe/WHJ0eb61PwHFrbpBIFgFKvz08LxekKdUiQAM4VeqFTva8kFFBoWDT+LNxqn
 wKtA==
X-Gm-Message-State: AOAM530ke1/DmmQvB0Eum3TM16Fngl+N9OMlGXHD8h6mJ/+1CwqU3yfM
 qSZtdG/RkNwgF0YYjxA7NYHOVLSksu8X35LZTrpg2A==
X-Google-Smtp-Source: ABdhPJxSRaXorYnhAOwM63aTMjX4dTxcrmbRQCa7QTWMTv1e2lOKGl6sNDVX8OstiTHbNvrKcWbablDieLGuWyuats0=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr5423781ejb.407.1621336928877; 
 Tue, 18 May 2021 04:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210516141133.739701-1-richard.henderson@linaro.org>
In-Reply-To: <20210516141133.739701-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 12:21:52 +0100
Message-ID: <CAFEAcA_X5u1KJxLrNvH9iprbZmhjNCCy3XTaoDLjm=wgKz7U=A@mail.gmail.com>
Subject: Re: [PULL v2 0/4] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Sun, 16 May 2021 at 15:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 2 drops the bsd cleanup and includes a minor improvement
> to the dump of the constant pool.
>
>
> r~
>
>
> The following changes since commit 2d3fc4e2b069494b1e9e2e4a1e3de24cbc036426:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-05-12' into staging (2021-05-13 20:13:24 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210516
>
> for you to fetch changes up to 6c6a4a76eea900112c343ba4f9c5737e298feddf:
>
>   accel/tcg: Align data dumped at end of TB (2021-05-16 09:05:14 -0500)
>
> ----------------------------------------------------------------
> Minor MAINTAINERS update.
> Tweak to includes.
> Add tcg_constant_tl.
> Improve constant pool dump.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

