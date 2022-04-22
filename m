Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D47150B86B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:26:42 +0200 (CEST)
Received: from localhost ([::1]:54502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtJ3-0002w5-E6
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhsrO-00017F-Om
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:58:06 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:34954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhsrN-0002LR-9L
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:58:06 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ef4a241cc5so84371347b3.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FEmx25pWrnf6pNgvif3Yfo8ZAJtEYF/E/qkCwE0TyDI=;
 b=oPfEhZKTGy5P7Z7rp6ycVgv7GUOjrlYVJ8wLNEK3ZPH9vKZEwjFCbO7yvOiBpiCoJS
 WsKrgtjIW6930OwcSONtLnEMxf4Mqa974iMQ8vHt2RXvfjDSFvLwGrDBqOyhE/nbf6aT
 oBOKkgd6OAwplP0ymXKbNTAk34LUK17RkMuLrV0m13R3Y2FBcKDgYo7gr6Az/vzfhn2C
 8T8SFC1FkO4Qe3z9VlewFOwLK315wLA0ZUJAyrFi2sHHgjJ0Q68zRpp5y6P7m7P7rcP5
 oJoUn429ByJzcIQzkwLpgYryRNGkLQaf7mbjw3cBGhD8BnTuftOEuJHIMp106qghiUxu
 tzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FEmx25pWrnf6pNgvif3Yfo8ZAJtEYF/E/qkCwE0TyDI=;
 b=ZsG9mYFu9Wg617tBjsQ2eGOLWfkuQDsW1HCqGsIeXEWI54hPNnR+F/lS/jN8PVlg+4
 gt9vp+QZP1AioZvbmd68mRUKoUZxXXgnAfbv24u97xIuDPMqDWGhzsU9wWFxL7+EhJFI
 tZfADeka1f9S1nWxWgkZfQ6bihQymCLxVs0Dstm91eD3G73N/71skDM6ncxjT/XYinGV
 9Yxoqn9cKQaV8ziW0Bcm/oZOyQL3ugbcqk6Rb3fVWFhgYoGwxk6s6HZoGiSGqxjfxXnh
 p1uZsxWYnRgtRjZ5BkO1OEkGw1ttTAZWQmafRppqzPXEWWA4ZtdshvNUKOjO6xdHlrlB
 L9dA==
X-Gm-Message-State: AOAM530fZQWunYanaM7E7Tg5AAuf0fYnFZ+qegv6lQvOBL0FiK35bmmm
 KTXHv5I+RLqCBMG0I1uSlzPpeSKf5FGsD9hUAfR1kA==
X-Google-Smtp-Source: ABdhPJxmKUoAFua72nav3Wb4JlFiEImQsq27SdaFzbifUvAM5icoWZfn/ljOv7xGb1XYp8rtCk/9fg4h/spPK8X43+U=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr4536240ywj.329.1650632284251; Fri, 22
 Apr 2022 05:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-44-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 13:57:53 +0100
Message-ID: <CAFEAcA93XFU9Ct6EnpQ8Zrf6s0J7pF33_ezixW5yguwq6-Sqhw@mail.gmail.com>
Subject: Re: [PATCH v7 43/64] target/nios2: Split out named structs for
 [IRJ]_TYPE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 17:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Currently the structures are anonymous within the macro.
> Pull them out to standalone types.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 48 ++++++++++++++++++++++------------------
>  1 file changed, 27 insertions(+), 21 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

