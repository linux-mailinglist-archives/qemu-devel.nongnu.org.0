Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF56320DB5
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:49:45 +0100 (CET)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDvfk-0006fx-UH
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvdu-00058R-0A
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:47:51 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvds-0002Yv-CJ
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:47:49 -0500
Received: by mail-ed1-x535.google.com with SMTP id h25so5788067eds.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 12:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6TTEJ1U353KJkLby6FZzvhDbltPWoYhdC/eeKbwmF5c=;
 b=pSJ4EDr+Z/2RRYNrNSJI1UzDqN2ZeBpQ0Vf5hVPFKdPY9hyhma2tothc0ttOohX0OL
 RGmnPG/WNVeZMa881CAvchH8Bb5SPlgI3E6PpycFakBJtk9eR/5/QTHKZ6dnKNdedm13
 MLCtmrHlS4kUTNrC1CthDhdppfxbYkkM2ZXelzn4JPEaYhqVezS0DJyf+hq2knCl7lrX
 Ar+a7rAw2ANwpEw5DrLsuJQGW5NzSEy7ibQehdBPt7+z/MwUFX6ivUozSAVqfmqitDcN
 zsIYvcWkuCe72ouG6cYF+5HkI+kc59Qh/h6oK3bWWYlKMLrEs8gPCLu/IMRNNqxBv/9Q
 lF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6TTEJ1U353KJkLby6FZzvhDbltPWoYhdC/eeKbwmF5c=;
 b=BC/WV5E06TEb6u2iEL8Y6md1DCzFzHlPxBji0WyiT1e95PkR9nyiiOWpgg3j2Z5ZqR
 T6kyE9eJoMe2zdekQ/xDYkq2sxwKNvU0aXdW3L8a9a/9bxtNjR+VQTP7URsDYotaHBsp
 Gfv75toARoMaScwfIAtXMGtBDl+8PuJ0cjqBQG0qic68B6fgU9/rZR6JE99sstk6t7Dv
 MW6Sm2qZYlJtM3nFAjRnm9/ed6c1rurcpL4MElRZZ2kINf6Y1qgefDimYxUXvbn7QUp/
 cMMECttr/dBQw0Z8fmXve8bpsDeJ7Lsd3/3pTO90sJMcQIpvBwjC6rGG97YtxxEsMogq
 R0qw==
X-Gm-Message-State: AOAM533cm6NyD9sJsC2iKK9FDCKH/aAUmmBiOxIRINJqGBHHHDot6/OP
 coHGB9w/os5M3b98537qcbRGCuVdxMh+UXo/xSBOeg==
X-Google-Smtp-Source: ABdhPJwqOPLrJ4clAtmgTEIh59ctG51jrmYyr0TLDJ9SY9bsvELZjME+TsLYKugvCsRTzvWaMEX+x6zlW2WaB2d5wMo=
X-Received: by 2002:aa7:c144:: with SMTP id r4mr7426199edp.251.1613940467051; 
 Sun, 21 Feb 2021 12:47:47 -0800 (PST)
MIME-Version: 1.0
References: <20210221200249.2536247-1-f4bug@amsat.org>
 <20210221200249.2536247-7-f4bug@amsat.org>
In-Reply-To: <20210221200249.2536247-7-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 20:47:36 +0000
Message-ID: <CAFEAcA9-j39aE44D5ZbmuZAEd5GaTy0u=NOhDHJnr_JqyGZmsA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] hw/block: Introduce TC58128 eeprom Kconfig entry
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
> Add more fine-grained selection by adding a CONFIG_TC58128
> selector for the TC58128 eeprom.
>
> As this device is only used by the Shix machine, add an entry
> to the proper section in MAINTAINERS.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

