Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1223B7390
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:58:33 +0200 (CEST)
Received: from localhost ([::1]:60470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEG0-0007En-6E
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEDp-00057B-8p
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:56:17 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEDn-0005r6-FH
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:56:16 -0400
Received: by mail-ed1-x534.google.com with SMTP id w17so15927086edd.10
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PIbtiXc3VW/IgoahqyTFHqKxaXJrFPkRlG5Tzvkz6Zo=;
 b=VN7ZKMxZAYjWbr/+kPv3NXjQzirY4qCoXEOJEFPsAkpsJJjSoL44nZefvizxX081YB
 vqQ3ayXMkD6JWRidQvF52qJIpVyEBv7+F5UM7FBqd6kDqXrQCrxhW4JpXK3zMVwYZqKt
 PaVIx46WOPvYBUBue5qe03gjUcHFc9G0kA8XirLxgajvm1iWe8JxG8AtVmPhznRLgC7b
 ECbT7shHPnGs8vRthFpZ8jHOD0Iizf5kdBB3NAXE6iO/FnYGe4XQresLC6RdUMrfGqI2
 63m7WDX5Bz6ebMyHBHdISHez12KiOR1r5qypZxeJybA+VMpMWKYb7Td6mwnMVUrBGIWT
 +waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PIbtiXc3VW/IgoahqyTFHqKxaXJrFPkRlG5Tzvkz6Zo=;
 b=gc7yecjsInkXJVLCOQZJUYssMQYxY3m8GQGpKhHzAEFvXomH9FuvNuaKvo5IJ5eBTE
 aOxzpu9W5QIdOvA94MNjOUn89q21M+mPlRHVQl21S+kmkHo06XxYEm6vU9NZ2UtUyR0q
 l7laLtxDTOtcXkfHxlJ89QIQjeyfeG6irF4wHnzGiF/1sjVXHsgYkKr1DlpvH7HG2L1f
 s5okaaCgfNaegyt6aAh+zoyu5WWZ6PxcULINoArzTK770T1I7mR+1HYlqmmC2NMdBrS9
 s/Ag7vRvdTXHvIaFIIzMJoiZN5PsJ9gYARx1+IKCB0+O5zBa77L7XVMfdE6l/pekBe2w
 SwNg==
X-Gm-Message-State: AOAM533epKyuXk7RoNQSOyeZXnX2c8lQ1SEHOZYmu8UE0mE0GO21RoVR
 0OGeYo3STtjaD92YI+XNAgA6rvrUO2/tERyNt8d1mA==
X-Google-Smtp-Source: ABdhPJxOarBrDWydd9cwj5ZN23Lb6MJUTBt0gnhxUvrbm8Zr4+8izg7NFfC7fJCv06fPFmddUNZ6QcfIUmWUzHf/pAY=
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr40044330edz.36.1624974973870; 
 Tue, 29 Jun 2021 06:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
 <20210628220810.2919600-9-richard.henderson@linaro.org>
 <CAFEAcA8jOHKcCqFhZ=M+qt-WBguiqv7j+Jwi0tAVKtYajVBN=Q@mail.gmail.com>
 <c92ee048-3f17-a5fd-a2af-8e07734aaaca@linaro.org>
In-Reply-To: <c92ee048-3f17-a5fd-a2af-8e07734aaaca@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 14:55:37 +0100
Message-ID: <CAFEAcA_ydDZGfo8qgu3YVmoxcn3uGepOix35hHTb46mq35EcRQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] target/nios2: Inline handle_instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Tue, 29 Jun 2021 at 14:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/29/21 2:27 AM, Peter Maydell wrote:
> > On Mon, 28 Jun 2021 at 23:13, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Move handle_instruction into nios2_tr_translate_insn
> >> as the only caller.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/nios2/translate.c | 66 +++++++++++++++++++---------------------
> >>   1 file changed, 31 insertions(+), 35 deletions(-)
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > Side note: I think we could replace all the handling of dc->zero
> > by having load_gpr() return a tcg_constant_i32(0) for R_ZERO,
> > which then never needs freeing. (We never try to write back
> > to what we get from load_gpr().)
>
> Quite right.  There are several targets that could benefit from that simplification.

I'm still hoping one day you'll get around to making tcg_temp_free_*()
calls entirely unnecessary :-)

-- PMM

