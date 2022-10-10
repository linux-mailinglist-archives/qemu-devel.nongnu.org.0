Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDC15FA0FA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:15:47 +0200 (CEST)
Received: from localhost ([::1]:37764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuVN-0003iT-Vc
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohu0G-0002w3-Cs
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:43:40 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohu0E-0007u4-RO
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:43:36 -0400
Received: by mail-pg1-x52f.google.com with SMTP id h185so3403108pgc.10
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v6n+KmgCaZ0hlw3tIe/vi1H9eXivEtYs8TD4Kj7dvVY=;
 b=IdZ6xKMfScFvj87uGBeshxKSKkqxUpQUhknxjOUzF0Zt+etCiPoSc7SX1t/KzHb4gL
 5JeYT4WCUY2d0cCLnk0Hx9rBhngprLN+eYXOQ6lnTZbt+RpizhRtY/4o9Qbr0nlpAnSe
 uSy+pbCBRGB28Ff4zwZmPJTuHpYjvnEOrALZPB599nhXjlfhwNEtGiPLdhkMv8xQ/4Cs
 HJOOnNsyfxugEfvCAHFHOk7RXJsoeCIsHWwLuugF1jDe2hWCZ/+tgZsE/8lAVPaqncI6
 aHgotwDbhPsfm22UyuRUQX+KNYSqCpI7/FpqQFkHQgJGBv+v8cVfYhhd8gdylAmzkCvB
 /DtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v6n+KmgCaZ0hlw3tIe/vi1H9eXivEtYs8TD4Kj7dvVY=;
 b=6l7m+8hoxJP4GIigDiAAu1p/qI93Zbxku/9iAXZyVqXJV4hfbgoQq4S0LM/QIVpTb5
 1fjVPGXUwwhu1vlqub81KDIWeI+IGPj1CEa6q0cu9eVOEjKKRXcav5xRRuylYcnd4ec1
 V/yElzginNi35MxzaytFPiueV9CbJTT7MnbK31p9Habu/AbPL1Ysv9a/nqbD/PrHrEh0
 lOIljow/wo07L7FkMbQbCuDdULWCwiLdsrshiyf7FCDcskS/VY0hpYTiLQ4XqdddA8LM
 eKOrOzqfwmm1mKc1EydnQMRvWiSy+oSEJCjM61Wky2Vhl1KBzTcTmMumCHeSuUMjMec7
 1vMg==
X-Gm-Message-State: ACrzQf1lDEXpAk0+56uvb13+jcFsxdcdVIrWc+KNqYsD3Np1EeARwpq5
 +JhdXWEUanMiFqoE4op8HbqcNGOBc2D3RPKHaXhJqyVStSU=
X-Google-Smtp-Source: AMsMyM6SuJG+BzSqzshipMuqb4JkOKMSTO5QWZoS3qx+nUgZm37R3oPq419b6fp0zwrFs63uebveD6h1IEdHt3qoFSk=
X-Received: by 2002:a63:8549:0:b0:461:3995:60d1 with SMTP id
 u70-20020a638549000000b00461399560d1mr7990456pgd.105.1665413012743; Mon, 10
 Oct 2022 07:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220917074317.1410274-1-gaosong@loongson.cn>
 <20220917074317.1410274-2-gaosong@loongson.cn>
 <82e86c6f-4304-119a-49e6-d0b16bd9a7e0@linaro.org>
In-Reply-To: <82e86c6f-4304-119a-49e6-d0b16bd9a7e0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 15:43:21 +0100
Message-ID: <CAFEAcA_T7T=9gt3Xm37zMpY5AZDRz9sKMjagQOXX9AX-CgqFNw@mail.gmail.com>
Subject: Re: [RISU PATCH 1/5] risu: Use alternate stack
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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

On Mon, 10 Oct 2022 at 15:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/17/22 00:43, Song Gao wrote:
> > We can use alternate stack, so that we can use sp register as intput/ouput register.
> > I had tested aarch64/LoongArch architecture.
> >
> > Signed-off-by: Song Gao<gaosong@loongson.cn>
> > ---
> >   risu.c | 16 +++++++++++++++-
> >   1 file changed, 15 insertions(+), 1 deletion(-)
>
> Good idea.

Depending on the architecture there might still need to be
restrictions on use of the stack pointer, eg aarch64's
alignment requirements, but this at least means you can
in theory write some risu rules that use SP.

-- PMM

