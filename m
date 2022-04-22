Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789AA50B6DA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:08:15 +0200 (CEST)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhs56-000365-PJ
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr2n-0002GM-Kr
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:01:46 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:35733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr2l-0002zY-Ti
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:01:45 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id w187so4439242ybe.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=15HCelTn89GVoVii42oJ7MIkT0EjpcUkRB6PWE5ANNw=;
 b=yLdII2706Vg8E38zWXXIustwedqgEx0q2slumtmRrKVNqy8T0/+6E51dQnB0uhiuRm
 FkeXW0xzRFcNXwbZw17OHLe/A3WMTPU8KcNKbyt+3ObQXkGQ2Sw8oYrEeDotBflnIt1M
 MXHrRcyEHHbfSiszgKXoI57sLVsQwzJ7APw9FYRM75TGGZo7GtypOG4Dh00N4N/SW6o2
 hLPikBOZqotCcJf+h4+jgpJnvDJeU5J5f2/sd9b6ZNnsgPWJ0JuKswU0UHNEBMAUGBrf
 t9gRZzwjG2p/u1/w05KljklCJfF9/0ZvRKob6xK5sACcITjYjzWHZk8K7Pmqb+hzTkz0
 NTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15HCelTn89GVoVii42oJ7MIkT0EjpcUkRB6PWE5ANNw=;
 b=ejv4PomjDJ0nc+l11xVIhsUFeRro1IWxqxipNvp8S8gNzPYDi3Zi0NAtvWRTcxFSoi
 osu4QMpC1Sxw6ELliO+HgmqH+G4gPt88C/TNyUyl4ck3E/GfLwhrzJL6aRK1cb2b63SQ
 6D0mygXZBbAkkMWR1JP5dRaU5tCyce4X3ZsBYqSBxxtwk/kIqZ7DOiEwMCvAcGXrGagZ
 /WoahvBM6+vC4NKd+pif28DZXtzZLbABuvMO9hrqhHILuP2FADmo46XWBvyTphq42qFJ
 CRLpa2qjN37EaMXsND6NlAxmb8QdGAGvcEtsy6xpboYVv8RukZP/g7sneUs2hYfbAyH1
 bOXA==
X-Gm-Message-State: AOAM531RAHaq+2iFtAOyFu8GmLTSPE5eGGfbHTasWW7kHLynYCx82mp6
 49Nw4RfoZmRH4cRqw3aUHDqLEVRuHgoZ4XTLdVYw8VW6ii0=
X-Google-Smtp-Source: ABdhPJx4w+uHhZE7746qxSPGVmn3o0krKuSeezmP6LB+EP+HmwJlAucAvrHTqAd8AP3JmLS7ICIWRugnJjkegTUGiOY=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr3772484ybs.85.1650625302791; Fri, 22
 Apr 2022 04:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-41-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 12:01:31 +0100
Message-ID: <CAFEAcA-SkzLtj-8rj5xZgfxUW7QpYyPBymzuq5DYBsUazPKyOQ@mail.gmail.com>
Subject: Re: [PATCH v3 40/60] target/arm: Move cortex impdef sysregs to
 cpu_tcg.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Previously we were defining some of these in user-only mode,
> but none of them are accessible from user-only, therefore
> define them only in system mode.
>
> This will shortly be used from cpu_tcg.c also.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: New patch.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

