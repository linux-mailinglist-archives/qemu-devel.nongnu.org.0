Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E230103F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 23:45:57 +0100 (CET)
Received: from localhost ([::1]:50184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l35Bk-0002XE-2i
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 17:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l359l-0001fp-Gh
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:43:53 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l359k-0007zF-1K
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:43:53 -0500
Received: by mail-ej1-x630.google.com with SMTP id g12so9908941ejf.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 14:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LOrznqPju5sUSt9l2zOZNjy97OGkNwnhDp5rn6IuZSE=;
 b=IYb8KhJa0YYIQu/oUZh8NgyyOfszHCX1P1kEE66Js38wcS+zq45QxJHiTyNHXuY5Tt
 XeKu+M9EG2k0CRG0AeKs74JiDVHCXQG/fLFsf+LEBziL5eBqjUJm02/XddNavI7f1EQi
 3iFyajB671U//FG5kedO2zjCRriDnuzd4q7E9tWgpJO7P5LVp9cwis6+lqz3O4lRgBid
 x9QG7mvziHbQ5sCzP4HrrtJYJgCZ8pz50LqVm8FTToRU8tDW6DvIJh6Lbp1o8giae8RZ
 chxc9XKo/odxDaebYpIrdVjGBR+j3WBdOm44yBryCFTxQh+CjutNiitGJ6+sR/Hu0d52
 0wyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LOrznqPju5sUSt9l2zOZNjy97OGkNwnhDp5rn6IuZSE=;
 b=opp5Fauf7IDim/H/fwCUQNy0GvAwIi78A51bgIIJTXIhcDP4IIX546EeexazgbUPWC
 ZfFeXMS2SNEi5be2XfWIbhedJwYU9d+7BcrbxTwSdJxNcMPoP8G6c6Q2VHmoOlyDVxxx
 gzYzOrl0FKpdAwsoeqVmUD1PgqOhoe5aIG6w4Ff0wyiIQO/hGswRu+t05fL9yQiHaVbq
 ktEoM50WbIxBRjc5JyDZ3LznXE/qz2qRwG8qRuR+Y0j+ANso0S4waRJNs7VOW3UXd7DQ
 Mw1FpUNgcwV4w87Dfq/oY9vvVc1B5rTwJNL8b+ju7X4vVZ7MWghf6n6Z3i2DbFHs4xo5
 0o7A==
X-Gm-Message-State: AOAM533yN0679fk25AoU/78RHoOTWFLQrqnJYaXC2yfVB35z78zX7DYY
 1Q4ER9/dXcf6NFJlf4gSrTHbWdGyjnelSIe13CogTA==
X-Google-Smtp-Source: ABdhPJyQpvxiGkWyLizgYdOYDOjAwC89dPsjHSG8+6FEnTAt8euEYVCwxEm2OkKzXbQ00iWZIpGXYbl4r3sqFAGWC+A=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr4277186ejb.382.1611355430753; 
 Fri, 22 Jan 2021 14:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-7-j@getutm.app>
In-Reply-To: <20210122201113.63788-7-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 22:43:39 +0000
Message-ID: <CAFEAcA-Z7=tTU5hrhNTGYUoQKaFcRjiZ05WwSpsjqUcmcvH9DA@mail.gmail.com>
Subject: Re: [PATCH v7 06/11] darwin: remove redundant dependency declaration
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 20:20, Joelle van Dyne <j@getutm.app> wrote:
>
> Meson will find CoreFoundation, IOKit, and Cocoa as needed.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/configure b/configure
> index 82ce28c660..4c485dd962 100755
> --- a/configure
> +++ b/configure
> @@ -781,7 +781,6 @@ Darwin)
>    fi
>    audio_drv_list="coreaudio try-sdl"
>    audio_possible_drivers="coreaudio sdl"
> -  QEMU_LDFLAGS="-framework CoreFoundation -framework IOKit $QEMU_LDFLAGS"
>    # Disable attempts to use ObjectiveC features in os/object.h since they
>    # won't work when we're compiling with gcc as a C compiler.
>    QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I notice that configure also sets
      coreaudio_libs="-framework CoreAudio"
but that looks like it's something that hasn't yet been moved
into meson.build, so we can't remove it yet.

thanks
-- PMM

