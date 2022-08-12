Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1B590F94
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 12:39:34 +0200 (CEST)
Received: from localhost ([::1]:60100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMS4j-0004h5-Ha
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 06:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMS0I-0000Qw-EG
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:34:59 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:42532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMS0G-0007ba-Rk
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:34:58 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-32a17d3bba2so5851687b3.9
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=KRvRLEmnKZud9SRQRXdnMaHnOtx0ctCn3LMLrdGNl6c=;
 b=goUlJafP3qk0WBcTyHoTCXAD2XGa2j3OeWrCvQDWH385RLEufwDU8K6vWkyaLiEQO2
 NeCQmoGlZLbhBerzgk0sMUXhTKyVe3p+El1f2dC1B0lInqud6u2wGjD8SPmPES/sxrGB
 H8bVZzYCvGP7eA+X6UoBmG2ZR/w3qNCu11bo5X0PTiRX5Gva00dD4E/cpLkLAGDv0lsZ
 ryzvd7bVF2GAMA+cEr2YM8CjWOgzi1AXdnfsH1+ZgyALPpQ/YjH6esYozC35yaIxYlX6
 DJr0r1JGkajcU3WckLJqnVE5z7B4A89NO7qMva+MfZ7kTa7VaX+QN75HH7AwkFU1Ve6y
 ZNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=KRvRLEmnKZud9SRQRXdnMaHnOtx0ctCn3LMLrdGNl6c=;
 b=djqkkcFZwpuYcfiyvqGlkIu42KKdZIYS04Bd5tlj3gnajjSNy1BgFRW741v549MAY6
 A4jN1+iv8gwgTQgjx+PPCwZpYfuro4Fon2cwRuOpITMkggFlsVQ97Oc41NoVSxwExd3V
 VRCTjmk/FUFe+xuAa3Csi6e5Wfbq5bmzinMiotYeLVcFMjfEOS0rL6Qe8Y8Fb2O/W3t2
 WBv4Lu03Vh2AZAfzt7aFzd+AzEBVzZ0++a+YVTXeCvZfkNFqMocywqrPK8+kI0Qm099P
 Tykof8Xfd69WzTRqW7HoK2ZjqDgLiR05dbsCiON696kunSY4TqKEby8b9S3UijPKAc9G
 5hNw==
X-Gm-Message-State: ACgBeo3zkxuGo5N5ghQM48LQ89HX+lUmRV/1AiVoFQVKPW3sUf1hf568
 5gO0jkXw/LwkOsc7u6i4wwfs7jDPJsQnIiEwFrHluQ==
X-Google-Smtp-Source: AA6agR4H8Nl53bpg7vKGsAGhxIejJb3gjK4aOq8K/U7bOpITue+fjvY1cHvJWbOZ2T+I20vZSky0xsaHYxGUy09y6fc=
X-Received: by 2002:a81:7bd6:0:b0:328:297a:f31f with SMTP id
 w205-20020a817bd6000000b00328297af31fmr3249695ywc.469.1660300495768; Fri, 12
 Aug 2022 03:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220809222046.30812-1-f4bug@amsat.org>
In-Reply-To: <20220809222046.30812-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 11:34:44 +0100
Message-ID: <CAFEAcA98Ux219kJEsD2ggec786UCxkx1V99OHzgyaz9R4GxCCg@mail.gmail.com>
Subject: Re: [PATCH for-7.1] cutils: Add missing dyld(3) include on macOS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Aug 2022 at 23:22, Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> Commit 06680b15b4 moved qemu_*_exec_dir() to cutils but forgot
> to move the macOS dyld(3) include, resulting in the following
> error (when building with Homebrew GCC on macOS Monterey 12.4):
>
>   [313/1197] Compiling C object libqemuutil.a.p/util_cutils.c.o
>   FAILED: libqemuutil.a.p/util_cutils.c.o
>   ../../util/cutils.c:1039:13: error: implicit declaration of function '_=
NSGetExecutablePath' [-Werror=3Dimplicit-function-declaration]
>    1039 |         if (_NSGetExecutablePath(fpath, &len) =3D=3D 0) {
>         |             ^~~~~~~~~~~~~~~~~~~~
>   ../../util/cutils.c:1039:13: error: nested extern declaration of '_NSGe=
tExecutablePath' [-Werror=3Dnested-externs]
>
> Fix by moving the include line to cutils.
>
> Fixes: 06680b15b4 ("include: move qemu_*_exec_dir() to cutils")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>

I wonder why this doesn't show up with clang?

Anyway, obvious fix. I'll take it via target-arm.next for my
pull for rc3, unless anybody has a different preference.

thanks
-- PMM

