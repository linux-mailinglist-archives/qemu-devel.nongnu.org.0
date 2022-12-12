Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1BB64A55C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:57:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4m64-0007QT-43; Mon, 12 Dec 2022 11:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4m5r-0007Q7-Fv
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:55:56 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4m5p-0001VY-Pv
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:55:55 -0500
Received: by mail-pf1-x432.google.com with SMTP id c7so272303pfc.12
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0y93YknlDyp10D0U+YwGDvLaXp43jTaM4QTS61IooXg=;
 b=HpJYMiHX/lQjtP3EastXpn/sTrslvr/FAygPEmkomJdOYo2qTWzP12z5TGBwIvGaMV
 pe2HL2VuCWnXhl9FyJdUTvucaHbEdoidYNU9xILkL8UoWMcwPuqpQMtG3bBhJ/hX59xh
 r+QyMkVWYn91AAXWdlsxeTx2sxUT6KtGCrXlqXAUb0J8jNFHylrJeEwBmppREZo1duo/
 LhTfMFh0QYwNUcWCu465P5/eU0qcfdBNbdXzFgxMBXw6xDGatHv1ktn7Tc6BXYdVQAsU
 Fow6ItWVrvO/PKxTQQ1LFrDg3LTYJsgBzNIP0xUMd8xETXm+rLMP8xT2PA9qCpcT1r0i
 7MAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0y93YknlDyp10D0U+YwGDvLaXp43jTaM4QTS61IooXg=;
 b=kkr1cq6My4ep50z2uMazD7qimF7AZw9c/oQOWPa/1QcVVJgfmZcJcR0DcrOTLRp++j
 oRJ3FumbeUfyAnYdbI+wXZhe8wm3QsubbB9T9Z+6Ripj25mrROlnfs5dAhJYL/U39k6U
 cF/SGC0bTM1qHeYyAImsWuiVK3nVkqWU8K3N/OfliB2g27e2RWCgKOgb8r+txkIi9bWZ
 Gg9FVSigOJxuZF5IcazchCxtr/aWL9CYZ6d5Ez30Sy3J+jrnYjD3NhXabqk2hCHdfnoF
 2DMA0puRY0ZF1Z9M9NKN43O4ZwhiW0dsbQBCqdCoUMLLUTjA2tMvuxRIhIlemeUcM2B3
 nvcA==
X-Gm-Message-State: ANoB5pnqNyg7KP0EbTAy0lSb2NSkFJvrJJQGVNe18xhggYPzXMgN1ADk
 qSOichN8WI9JYzKysmQuwKTVT0L48aUBrHmk+/WieA==
X-Google-Smtp-Source: AA0mqf5NHv56TurXGoeHFn3DcGtt0snK/jM0oXZvfDAuFmXpMB7vIxaokpYHCbFHQn6ZFcyr48oXquqkFGm8VEcphO0=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr79501477pfb.3.1670864152137; Mon, 12
 Dec 2022 08:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-31-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-31-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Dec 2022 16:55:28 +0000
Message-ID: <CAFEAcA_2LajSOA8CE2xiAtX3FaQuxhMoZtmeDRHn5bv+1ozE7g@mail.gmail.com>
Subject: Re: [PATCH 30/30] meson: always log qemu-iotests verbosely
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 9 Dec 2022 at 11:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> ---
>  tests/qemu-iotests/meson.build | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> index 583468c5b9b3..3d8637c8f2b6 100644
> --- a/tests/qemu-iotests/meson.build
> +++ b/tests/qemu-iotests/meson.build
> @@ -43,5 +43,6 @@ foreach format, speed: qemu_iotests_formats
>         protocol: 'tap',
>         suite: suites,
>         timeout: 0,
> +       verbose: true,
>         is_parallel: false)
>  endforeach

How much does this increase the size of a build-and-test logfile by?
I know the gitlab CI has a size limit on that these days, so if this
noticeably increases the total log size we might want to check how
close we are to the limit...

thanks
-- PMM

