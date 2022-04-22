Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855EE50B667
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:48:37 +0200 (CEST)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrm8-0000xJ-JF
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr3k-0003e3-0r
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:02:44 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:35740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr3i-00039K-Iy
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:02:43 -0400
Received: by mail-yb1-xb29.google.com with SMTP id w187so4443919ybe.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIqCO4oMy/8Z7xkB6wn9h4b2YGfdIc6Q+SatULAlINs=;
 b=W3PJQWMzF2uS9mGTX3wNoEU7Xc4IDlF/+IzGA4VwkwM4UT3dGUzgNm0iyfRvcs7hrW
 3SqFod0cR+BvwJ+dFfv8iLnfWYiZkvTsq3FPr4vFedZt3PGe8MBKbvJhkU3wFfrmmZJH
 YAnc0ywH5Vs/AIlMeaBU7U4BdnaL8w7QczfE9zhip/po+gRkJ1a6jeXCcCVmQ5++5PTZ
 mt8W3nA6sY0TKoCfKtMp9bmnKZYLt/DzT92+juVQleDWQo1N3oypVZkIAMEDYeky5hpv
 q3PJEIyCDXI1khIJNaO9gokZtiTMTjJe+2fFBcaQlehwlgizTLV8Vi+18y3DCN656Phy
 swOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIqCO4oMy/8Z7xkB6wn9h4b2YGfdIc6Q+SatULAlINs=;
 b=xONTbn0nISjZi6XK0RO7/E428H3pt404gKsCNSQK0/pORlMtUzmuPC7nritYaAL/CK
 x94rxYdX7CFLhqoBbELGOyYXSycPcsJWZd4khrmbOVV+RuIzHD24CsDSMrUwm45O5EQt
 1fHT+XwIuk6y0IL96IQB8ZmbP1gGdUSZyDpIE7V6sbVPV7ZylJ44l4zsFt1LUlbx6tC5
 Iy0jDacZutUtleDKpt/FmjTP6jFQWy8V397T3ZvdzE00pX1zjqJZqacntSYDxlYvju11
 rGoQsEPOcwnDUVs4R4PInazvBNksojVaiWKRmTqXkBgQNun2DJjMGZnyurlUKBmHODLX
 iRbA==
X-Gm-Message-State: AOAM533ga4065Xrxp8IHCJ6CV1lZ0KlAkziw2bMQckBfsKIZG++9ezt1
 boD/6pQzOvOzxINX9SlQK+9u/HO1oNVAWix7Q0trQDJqaZQ=
X-Google-Smtp-Source: ABdhPJxYESyKIjONOK1gFaDiFF3x1KOwpB9BZLynayhEdLv1BHYbxgtLECT9PyBBs0GCnD9i9mpoTvsREuqv2lP9fLY=
X-Received: by 2002:a25:a287:0:b0:645:3c4f:7dec with SMTP id
 c7-20020a25a287000000b006453c4f7decmr3782824ybi.479.1650625361553; Fri, 22
 Apr 2022 04:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-42-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 12:02:30 +0100
Message-ID: <CAFEAcA96W3yRXc44osYbKDcn2eS+CvMdThv7MZMUC7jSuzny_A@mail.gmail.com>
Subject: Re: [PATCH v3 41/60] target/arm: Update qemu-system-arm -cpu max to
 cortex-a57
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of starting with cortex-a15 and adding v8 features to
> a v7 cpu, begin with a v8 cpu stripped of its aarch64 features.
> This fixes the long-standing to-do where we only enabled v8
> features for user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

