Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E99320DB0
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:46:47 +0100 (CET)
Received: from localhost ([::1]:44572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDvcs-0002Ym-Q1
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvar-0001Xf-DN
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:44:41 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvap-00019e-8O
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:44:41 -0500
Received: by mail-ej1-x62a.google.com with SMTP id hs11so26039972ejc.1
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 12:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sDfm+JnsOUcjKjX+ZlFbGHsiprqsAoK+Qs/plQ9lJ1c=;
 b=BLeyrMBvM611ral6hMpajqBCLhn48Ce0QtQx5Sebs45qg3qUbvWFrGW/nTm1CcL4KT
 mFuIMR8gruQXCPXS2/0DQW7uQSBnoIEewzph3tnw2do7Vx6Y1ImPSkELGrMv3EyNl30E
 45xzdhBac+zvAIB2Pp/VQtDWPw/FdCGZs3LB2RpJzGazdQcPvUOQllPVCCWP/4B50YFC
 8j6yJUYTpPhw6pB6OlvAdx7CqhhIJWPSKVHF9Dxv7cPib+WK3bINyW/UGaTyse+fp6ox
 hKl4S7sqcUrFxcOUAkEkS5ciWteurTnOGPmqHS2+B4vLvW3IAXs/CreKps63enyIFC5L
 DkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sDfm+JnsOUcjKjX+ZlFbGHsiprqsAoK+Qs/plQ9lJ1c=;
 b=MXggyYt6TNS2Yefw5Yn6ZVOSodknPRQ3e/SST4Fh+apRhh84iSsUYrrc3tGpAxtxLx
 DMR97G5Y9FqN4FdUh85SuH3Ycr3zBAbqWiXz4IoA11QBDNlRvN9UyD1ZNE3G/iCgX5vg
 6MRRVKe/5DselKs91eLty9ywoD2W/P6gAEX9a8m6ioNarjgidnTt1irHwjUcNN7lQh/2
 xoYrc/hcnGNRg6msLNYm6xW0Tr6dCVMQTXq4yUMl3M2bE5DtuJ+EOw3j65g8z/xJC/HW
 kRskhcS+lIuXKHcSl+80VU51gk63IuMF9YL8c1GnS6GISavYbLftEhO+EfOukeutKUdn
 xcvA==
X-Gm-Message-State: AOAM532I9UAS46X9luk/WmjGGN6bCKakcGVM+/UxXk0mHVm1d2Wz8AT0
 PA+7DQsqx0eQlvMU5/FDOAr5aMSk3/b7iHZK9UcmIg==
X-Google-Smtp-Source: ABdhPJxtiOyiE9I+oCU078v9j9IkyLyykPt2XdkGZYQheWkuHiP7Eb89Z8NiWRUw9MCkIed5tmV4iqh6pIYWLbys5M0=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr18630346ejd.250.1613940277798; 
 Sun, 21 Feb 2021 12:44:37 -0800 (PST)
MIME-Version: 1.0
References: <20210221200249.2536247-1-f4bug@amsat.org>
 <20210221200249.2536247-4-f4bug@amsat.org>
In-Reply-To: <20210221200249.2536247-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 20:44:26 +0000
Message-ID: <CAFEAcA95mz+PkBxdF5xBNA4xnqWBmHhv9b04g2zV6s9LhO0s+A@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] hw/intc: Introduce SH_INTC Kconfig entry
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Qemu-block <qemu-block@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 20:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We want to be able to use the 'SH4' config for architecture
> specific features. Add more fine-grained selection by adding
> a CONFIG_SH_INTC selector for the SH4 interrupt controller.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/intc/Kconfig     | 3 +++
>  hw/intc/meson.build | 2 +-
>  hw/sh4/Kconfig      | 1 +
>  3 files changed, 5 insertions(+), 1 deletion(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

