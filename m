Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629ED68AB9B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 18:18:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOM9u-0002Sf-5z; Sat, 04 Feb 2023 12:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOM9q-0002SD-DX
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 12:16:58 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOM9o-0001Ti-Nv
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 12:16:58 -0500
Received: by mail-pg1-x52f.google.com with SMTP id v3so5652345pgh.4
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 09:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LCarfAFzO19bTCJxw4nsBdGAps81F9oszSmhGvhRj0Y=;
 b=eJGpTJ+lCleDsm7ciSfMt537UnXu4rTMZLavd9sXdrEQulKxApeVebVnOKsGkPx2Nk
 b6c7MFplY0kNU+vy4GncUCQXQ1uO7w11QhUo+wL7df5W15O0lh6cGLhJ7lz3iLMdA1On
 oiNzbXwdX2DnPPu1e1RNyJwBY5A2WH/KYN7OMD6Rh/8xTKBwp25Umz3N5DiailPbQwJF
 1g8YUKIx0Y0AHzLYtXwsTlFJnhear+EYpzNwWhzs19wfg6+2g57E05sztOEOH8kfDUTv
 McbBZSUhqWZciCsulb7YwnSjd416vHxSemTh9Yi0efIYaXUNqbjr9WnGShcD+CFfsJLL
 BbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LCarfAFzO19bTCJxw4nsBdGAps81F9oszSmhGvhRj0Y=;
 b=HLIEnSK2vxIqmlkZ+aawUe4/mxZKEllx9VRg8fle8LEhYKblpgL1n+bTUuIxqaXFmZ
 go4OwNLYdgTgj+Wr90EHVh9W4pmrizbOQ34ddAvVAB9b4isawO/3sdd9ziUMc7lit/hH
 5mHW/z4Meqv4noCzPOY15b/GSY42CJjHbGAb3SyxGiCHUYrSK5yrGrVb9GP4kLeV7/JN
 Pnm94mPZVG6eYncN2Fc/hGzCVSae/BWvHq9q2tXvgs7ILetGJn3z8DyTwxeqcAUsXL9C
 hxqcg8j4Hr0jfl8sKv6sWbNhs/OAvUN0r1dA1cYQe1VOCQT+b4h9gpv95KBe3CCYBps2
 74ww==
X-Gm-Message-State: AO0yUKWCQLROcLiZmNSkWMfDu5GNLNw6TIhzAoAnkdiEUBvpkuRRy4Db
 ycWFB0FwyiuSw8tTknJ+U9sJj6Ydffa3M1iFSkALQA==
X-Google-Smtp-Source: AK7set+hAIbiHIKCLWi0XhEK/Xk3ZVFPad+LyvitO1XvKZha2wS0XdtdRKIT8b7qoYrc832BWeNLun2fOcffGNW0cX4=
X-Received: by 2002:a05:6a00:1490:b0:593:dc7d:a31d with SMTP id
 v16-20020a056a00149000b00593dc7da31dmr3315906pfu.23.1675531014994; Sat, 04
 Feb 2023 09:16:54 -0800 (PST)
MIME-Version: 1.0
References: <20230201095402.1002350-1-laurent@vivier.eu>
In-Reply-To: <20230201095402.1002350-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Feb 2023 17:16:43 +0000
Message-ID: <CAFEAcA-B1cs1i74pTOvj9XYYMOdRhvj43WvrXzRGRzE5wk+umg@mail.gmail.com>
Subject: Re: [PULL 0/1] M68k next patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 1 Feb 2023 at 09:54, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/vivier/qemu-m68k.git tags/m68k-next-pull-request
>
> for you to fetch changes up to c1fc91b82545a2b8ab73f81e5b7b6b0fec292ea1:
>
>   m68k: fix 'bkpt' instruction in softmmu mode (2023-02-01 10:18:21 +0100)
>
> ----------------------------------------------------------------
> m68k pull request 20230201
>
> fix 'bkpt' instruction in softmmu mode
>
> ----------------------------------------------------------------
>
> Laurent Vivier (1):
>   m68k: fix 'bkpt' instruction in softmmu mode
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

