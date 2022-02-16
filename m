Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB97B4B8556
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:16:14 +0100 (CET)
Received: from localhost ([::1]:40610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHM5-0003NM-S9
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:16:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.kanavin@gmail.com>)
 id 1nKH7H-0007xw-KV
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:00:56 -0500
Received: from [2607:f8b0:4864:20::633] (port=40518
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.kanavin@gmail.com>)
 id 1nKH7B-00084T-2R
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:00:53 -0500
Received: by mail-pl1-x633.google.com with SMTP id l8so1613952pls.7
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 02:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jcedYCN2ai16XbS2x9XY/3NHTtRXRqopcKv0XxiM5q0=;
 b=d5wNwj3FR3YbtPdTiw2Do0nKIzQ5dUPdYyl6bcmb0c3SztXab8LGDVSQYmnKLAs8+W
 o22ARPw6/dN21Cth0JcbHSThRKdZQNWtgV9calVWxF9UPDXXqCFMM9dCdGiTUn/4lREd
 pUDtxglkuk1rGotVObYVLdzMGK3wbnro5yWwU8Ey0u0lYk5rxLVc+jlcNooR0gSqkT3Q
 oGZIblQ/ndOb3ps8OGQIlXfaJ3ICbCpg9NyBXPwvGvtBz3S04PUL/m8ArISuDvZdTM94
 eg7+eTORmzFEz8tz1RVhXGLYzaEWaaubIx9X+9wYtgmPOzgpirFPbIkse8SioSQSft/G
 iKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jcedYCN2ai16XbS2x9XY/3NHTtRXRqopcKv0XxiM5q0=;
 b=bmDnwHB+5nPo22P4+1Up5QVNwuRj5StKyo1OkVc73Me0BQvqTJRXl2wOhTYPBfPmV0
 2rqTGDUux1lySr31ENE4Xq/E+pIMwdyIiWlwHdat3zlSixhBN3cMxd8Jm1HXWTV6nVhv
 9he9JKTbWCgejrrGeSV1cb2bT48iYFRPeOPu7YI8iHH/Kz+e68bxvVZXf/wPVYVYuJHB
 yi1ujohiQqU2TJBIcWhFgT6vPA5Y6dQiQrKFMyNxhiw8/egDyOieV4D62JsrJkG2h6UV
 ymRNo0eLTbUZHfIDrjBBbGXCx0zhxAM9zXeaDRgmNdvZWV2yS/NhArJroZnOpJAH7JJE
 hxNA==
X-Gm-Message-State: AOAM532wcE7B4c+AgrMv+YtG+59Aw/LHNBCN+4qG3YlUklmysGwde9Hw
 HzwWihP6KSJHHrx1DrsIjX7yPrRrsAU/j8kNZzreamLA
X-Google-Smtp-Source: ABdhPJwL8bKnuAkwQwsh1H4QOuOGuaTkplUgpePI3FBLcQ4wu5epbwMuDPsXwfbNTyBc2YAF738sv32FutzsXvak3ZE=
X-Received: by 2002:a05:6122:509:b0:31f:55fb:db52 with SMTP id
 x9-20020a056122050900b0031f55fbdb52mr593265vko.4.1645005158053; Wed, 16 Feb
 2022 01:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20220215205637.36863-1-alex@linutronix.de>
 <65399dfb-02bd-473f-a7b7-23131fde30be@linaro.org>
In-Reply-To: <65399dfb-02bd-473f-a7b7-23131fde30be@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 16 Feb 2022 10:52:25 +0100
Message-ID: <CANNYZj-2g2bt3LZveAnLwORuZZiE9eSo62PcghZGUYu9bi+fnA@mail.gmail.com>
Subject: Re: [RFC PATCH] i386/tcg: add AVX/AVX2 support (severely incomplete, 
 just for preliminary feedback)
To: Richard Henderson <richard.henderson@linaro.org>, jan.bobek@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=alex.kanavin@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Feb 2022 at 10:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
> > There's an enormous amount of legacy SSE instructions to adjust
> > for VEX-128 and VEX-256 flavours, so I would want to know that this
> > way would be acceptable.
> >
> > Signed-off-by: Alexander Kanavin<alex@linutronix.de>
> > ---
>
> Have a look at updating some existing work:
>
> https://lore.kernel.org/qemu-devel/20190821172951.15333-1-jan.bobek@gmail.com/

Nice! I agree that gen_sse() is in a bad need of a structured,
extensible rewrite and glad to see it's been done, as I've been merely
tweaking existing code.

Jan, do you have a later version of these patches, or is v4 the final
revision as of now? Do you have them in a git branch somewhere?

Alex

