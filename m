Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4476D321974
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:54:50 +0100 (CET)
Received: from localhost ([::1]:45598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBfk-0007kY-Tf
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEBbL-0002ps-Gw
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:50:15 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEBb9-0006ys-13
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:50:15 -0500
Received: by mail-ej1-x62e.google.com with SMTP id u20so28766676ejb.7
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zTro1aiy38ufFTX5B59rHusra4xozQZlNXIDFpLFOLU=;
 b=dHZJLT1MpdtJ+Nb/A1ZHNyrUiTKXHGkS9B5gcsB2Br4XH7FBCpN/0woB60GXDVfp1b
 b4vPhC54n/HPkyLtLt+NXj+vOVAT4m2u2121rRMcw9fL7SYqNJoe8v4lDb04LG+Wpq6r
 psydR3X9x0b8zMWNWj+6a6HLDH57RCSlxzI4unxCmY+7hoMYmLMrN1P+HEw1EWNkaiBZ
 b6GyAbpE41BXf0yzVBRPHdlHZ/OK7pdc3YyO6xFbvcE1sFpj7wzr/on2V/j3P/gQmifj
 mz39ZPq9EufFqyeNa5yX00MMTJE9Z55QWNedbsZ5lGZ9IgFQYUcL+nryzbAoB7TAPND2
 +wmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zTro1aiy38ufFTX5B59rHusra4xozQZlNXIDFpLFOLU=;
 b=TeuVZQFfC7AB+jIkDzfz+6AqWSqe3e/Gufmd+p5NjI5gFDKMf1oRz15bgYCpStulHZ
 RtAbFQLj9HDy9YQBzmpTpblOYO3VwdiIKlwEcJLIZ7ijN0Zjz/sPlKn7qO4ebsYbUwrc
 +VfwRRMx+NZno69bLLfB92rkvmmj3NxFuVivRB2zqoVL2PTlXYjurf0q6efaIDzXtkC9
 O9aH4IJL9Ce9DZoEof12vbj5RTcwfeGpO/xk2Rrp6Pjw8LRE+ZIwVu36gVB+EnR46BbR
 P586ElNaQ9y/oyySi/lQixkD6NE22RIkZpd+6fe99BUTe0aNeOYos+zHfbwA8y3IB0FF
 AMvQ==
X-Gm-Message-State: AOAM530MzEe6yglvplrRP2f+md+uE+i+sz400Y6AatgcakoH+QkXgtbs
 3cyi+LJR4av7FdqoR4EFZtm6+GLgmQ6zNg057HpYHw==
X-Google-Smtp-Source: ABdhPJwMD1b6Odr8cAjkaPTfTbwKkR9AEbgu2jGtnjr1ZApiTrUvTtAeXjUoJQ/Ex1F2Jw7tTiorEgftNhasfu66yCc=
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr4694279ejp.382.1614001801494; 
 Mon, 22 Feb 2021 05:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20210221215915.2568943-1-f4bug@amsat.org>
 <20210221215915.2568943-8-f4bug@amsat.org>
In-Reply-To: <20210221215915.2568943-8-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2021 13:49:50 +0000
Message-ID: <CAFEAcA_EDUmov1is6e=y1iAKVPK0KV_u1EkwcVGWPpy0s0M0sQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] hw/pci-host: Introduce SH_PCI Kconfig entry
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 21:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We want to be able to use the 'SH4' config for architecture
> specific features. Add more fine-grained selection by adding
> a CONFIG_SH_PCI selector for the SH4 PCI controller.
> Move the file with the other PCI host devices in hw/pci-host
> and add its missing MAINTAINERS entries.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/{sh4 =3D> pci-host}/sh_pci.c | 0
>  MAINTAINERS                   | 1 +
>  hw/pci-host/Kconfig           | 4 ++++
>  hw/pci-host/meson.build       | 1 +
>  hw/sh4/Kconfig                | 1 +
>  hw/sh4/meson.build            | 1 -
>  6 files changed, 7 insertions(+), 1 deletion(-)
>  rename hw/{sh4 =3D> pci-host}/sh_pci.c (100%)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

