Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A7545414
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:24:58 +0200 (CEST)
Received: from localhost ([::1]:38032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMq1-0006pQ-Hz
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzL94-0000Vm-HY
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:36:30 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:43829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzL92-0004as-RW
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:36:30 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3137316bb69so52222877b3.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6xAVpoqHFm+71KOMFYJQmJ0/62hwCwd48un0G561MT0=;
 b=TvlmJYc4c+NMEpwvQ14RayKyAEHbi2byJWoM9Ob2PhWZBxgpj3UcfcLGallETZnUeq
 fR86vMvMttROLsi5nbs3iklue7IaesSSOLgFIrSf5unntzPLtIYvOQUp580YOt4sXmtR
 Kztr4KcfcgmsuHRHcKlFPQZirnydFrFS5KDJw96iGzkUjp+hCViT9Z8UDSC7wIS3/RiE
 8k2G4WFoF4d2v2rm7w4NofVsYRv5kgDbzUa9eS4tct7cVm1XTfy+s0YehiaRQq6qfE7I
 6+dOQpAPTEXrorb4bFBxmsqiteMx3ckoRo6VE1RW2zKx5BXUIok5TL+SWejWWSJB8WcM
 ogFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6xAVpoqHFm+71KOMFYJQmJ0/62hwCwd48un0G561MT0=;
 b=IAWZmGHY4b91qm1neYS06GS3IuD88/CUH8Tb7jOwElMZFohZhrg7L37V+zHgTnwKyB
 Y7Ys99QSZWmtncRP9yirJ2oEwIuuKWGpF5cvo2DcmeKxijwSLtJq9/8Sty43OK+mqV5q
 E5Ls2/mXzkBfDCuDEWcv8tQ8HsUkyHG8Ava0KmBBCjIZJHrnWMMrEoilLHz2Lt8rNBoL
 c2QAhMeTtBhS9XObjI7j7BfY55aG03AU+cCQzATzvkbHKGGch4sG+4wZHo3mp/p0atBb
 xrpgI/YDbzcfqe+k9e2NLwjWMwjiLGAsT8O4BKUYL00bgKpNqkm4DnObzhTp/QDBU7D6
 GMBA==
X-Gm-Message-State: AOAM532xKcZiNaw+D/CDtPiNomroMyVkv6DF9sJSOi1ci6Xzq7drCa0N
 ttnb9JLGQNkj8hBbAUsG9Icue9V+Pj4K/vTOTm0gJw==
X-Google-Smtp-Source: ABdhPJwColsLvx3Shg1wOnxAR18YpQFNia+kZZ8+qaepJW4psSP1agSIanWDc4AC+8FkriUEWTyiPWJjLlSFvWtm3l8=
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr42354437ywb.64.1654792587874; Thu, 09
 Jun 2022 09:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-16-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:36:17 +0100
Message-ID: <CAFEAcA8KhDtAjACeDLM05U+kCSM0e0+HYrOw55=_2CszbTwBxg@mail.gmail.com>
Subject: Re: [PATCH v2 15/25] target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Tue, 7 Jun 2022 at 03:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We no longer need this value during translation,
> as it is now handled within the helpers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

