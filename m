Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3AA2D79B1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:45:00 +0100 (CET)
Received: from localhost ([::1]:33710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkbL-00088e-3X
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkZB-0006dw-US
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:42:46 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:44341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkZA-0003bt-2l
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:42:45 -0500
Received: by mail-ed1-x544.google.com with SMTP id p22so9779131edu.11
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KKWbf63mxbw2z6c+D+rNHSYDlr6MG+7uzqHUldNCE2A=;
 b=aN+7cSAaV1gkSD4F7M43k32imB60BwVIqaV3i5AgNNGENqheKKyHIuLy2CF4pMIxmS
 10K7rPpwU7Jwjixwvdsn97FAfxPi+ZDmiqhPEAB/wc95ceVOWK/vn1M+w3yurDjL/fFn
 KpqhvNKWn3NfsKUcZjzbIn5RY7ODNsEfcA40M7v3nvgNGiQCF9czWIW7dJLlJl/H/eFk
 4NVv3hbDHe1XAVgy4M4BsZwESqAK0KDq+pFI4U1dbjxav6gHBU3g1vq8QzIkonPKX5XY
 0d4wIkufupTcEYkbgso4bmjZ4muxogM97suzBQhnOvEDQRsI4zTdAswwqJFB9Hk5Qhwt
 PzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KKWbf63mxbw2z6c+D+rNHSYDlr6MG+7uzqHUldNCE2A=;
 b=m+0Wt+gv9AhqekRTv9Ml5JBqsgjtU2xnr1r4X7NGUPsEBmaqsBcInDor+vR7og5D+9
 T9OY/pPjojejF3ZHisM2+mX5vy3ahqrlEtqisJy2Zjz0ZwuaIHoC1bn35mzrdiuwbklp
 53FGJCGM1aCzrCra8WeSWUFaUHm/nLEsmHfFd0xyfgOA1oFgEAatwKTCn0f9y3ABZzmP
 Qbo2KASSnztaQfDnmgyJl6nrzeRMrEsPm8NOFWmjnMg9Re1TVy2oaQ/dyw1J2SJopxp9
 Pg1AtSv1x9mQNrsVitTR0eNx8/+p247nk2XPZEnMLpn4u3FlokFPuPszOvGqmZN3ThW6
 1LSQ==
X-Gm-Message-State: AOAM5317Z9o4KrZHC3bXItKIUXmkt+HzMNu49HU9qDI5bO+rligD/M5O
 ChMCDyF10wgsZ/I1JNSOTJm+HwMoM5KEgVfdaUOZfw==
X-Google-Smtp-Source: ABdhPJz8pXpAY4RVO2uQUfpilRqU9hMBuXhp6fZe/MtWMbWr5XQlNozO9jMPM79LW2RPTXGNqAngIZMUrzlhIWNSXoY=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr12268495edq.36.1607701362232; 
 Fri, 11 Dec 2020 07:42:42 -0800 (PST)
MIME-Version: 1.0
References: <20201211152426.350966-1-thuth@redhat.com>
 <20201211152426.350966-13-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-13-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 15:42:30 +0000
Message-ID: <CAFEAcA8K4PAUFR2B5aLAbhH3gcSA_y56SMq-A9h7guHg2Ro0HQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] configure: Compile with -Wimplicit-fallthrough=2
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 15:24, Thomas Huth <thuth@redhat.com> wrote:
>
> Coverity always complains about switch-case statements that fall through
> the next one when there is no comment in between - which could indicate
> a forgotten "break" statement. Instead of handling these issues after
> they have been committed, it would be better to avoid them in the build
> process already. Thus let's enable the -Wimplicit-fallthrough warning now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configure b/configure
> index 18c26e0389..dc2bc3c2f0 100755
> --- a/configure
> +++ b/configure
> @@ -2007,6 +2007,7 @@ add_to warn_flags -Wempty-body
>  add_to warn_flags -Wnested-externs
>  add_to warn_flags -Wendif-labels
>  add_to warn_flags -Wexpansion-to-defined
> +add_to warn_flags -Wimplicit-fallthrough=2

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Maybe mention in the commit message why =2 is our preference ?

thanks
-- PMM

