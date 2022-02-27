Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F694C5C76
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 15:58:01 +0100 (CET)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOKzo-0007lL-Tc
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 09:58:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOKy6-0006no-Es
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 09:56:14 -0500
Received: from [2607:f8b0:4864:20::1135] (port=44645
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOKy5-00062l-0O
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 09:56:14 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so81976837b3.11
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 06:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Csyo6lMeFxUo1OivTyQPi3Vd8ncw2dNoxJJWMrMF9v0=;
 b=vidXYq0Ep3e/QKOoXnbdCipw+FVslchh4FlvTjI0KzvRGZScsUQsl8HNjC8VqPaa6Z
 I0z3IzMawi7EIMdaciF2SHw/MhbAzM1wBKIozWRGEX35gLW8b6bO28wlmA1mRluM6HW2
 wDryK1zCkd96sR2nGr/5biWXuhbVMyq/vln6e6BR8llZpl6MjsQRUK5+mWg2Dv2qRjgt
 C+EvQ+/+hMg/0mXe8LMZK2YJ4wiFXTTLtwl+x4uzZ1DdBbE4BuhaYWtRuet6g80ui8mp
 T24zhJf19GIW7F0C5lj9yyUoqBKckNPe7EPtz2XvroJxWrqoLnxjAJhBV+vUjGyDoHdx
 /OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Csyo6lMeFxUo1OivTyQPi3Vd8ncw2dNoxJJWMrMF9v0=;
 b=mU74o3yaM7hqDN+b9Rv6nCgriYIfn5UrdzUXKK4xZzi6eK7uulbZ9vpxT+kw4k88nF
 QrG4hylvHp7fRntx/+ft3p2T2SYlTVtFQ5akk+10/5j8QS+UA5zIaVCJfB7gU8cESND3
 wKAKWXZZTgGK6rbW9pv/HtV+cmMwqMeZO1Xly3jL1ZmXfM20NHKfm/QBY84omXRMxpNk
 UzGRnUBM1IcR9WBtIaIMSDB+07peqPIHsjQrKXM4tMceR84Sq1vwLq5fIKJu1DNs5pHZ
 adCpjFags+rpYf4NN/FnewYmXyGWssusGds/hYzFNfyN0S0qNzLPlXlfsxcX0kV0Ib4T
 npCQ==
X-Gm-Message-State: AOAM530jba3ksc8vpUYZEE5lhZs1LLeuu2+yGnl81exeSDY1ebRqAmed
 2XwbxlLhIi6y5W/e74wsvJl3e3+IXycHWDJKoky6eJyyGFg=
X-Google-Smtp-Source: ABdhPJxXO6ufccbXckJUD3LxQ2ifTK/BE6G4J4l0kgl1jxmskEhkIiPZDCF0ST0GbWji65OBogwB4mF7hUwEaFOIxLE=
X-Received: by 2002:a0d:d5c8:0:b0:2d5:e0a:56c0 with SMTP id
 x191-20020a0dd5c8000000b002d50e0a56c0mr16107037ywd.10.1645973772081; Sun, 27
 Feb 2022 06:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20220226104054.43538-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220226104054.43538-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 27 Feb 2022 14:56:01 +0000
Message-ID: <CAFEAcA_OprFX4ub6dYzTNmwP7y2D31AmhknQ0xjQ11jYw8Nxig@mail.gmail.com>
Subject: Re: [PATCH v4] ui/cocoa: Use NSWindow's ability to resize
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Feb 2022 at 10:41, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> This change brings two new features:
> - The window will be resizable if "Zoom To Fit" is eanbled
> - The window can be made full screen by clicking full screen button
>   provided by the platform. (The left-top green button.)
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  ui/cocoa.m | 543 +++++++++++++++++++++++++----------------------------
>  1 file changed, 252 insertions(+), 291 deletions(-)

This is making too many changes in a single patch to be
reviewable -- can you break it down into more digestible
chunks, please?

thanks
-- PMM

