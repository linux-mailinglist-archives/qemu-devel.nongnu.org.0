Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BCD3BBD91
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:38:49 +0200 (CEST)
Received: from localhost ([::1]:33312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OoC-0007G4-3N
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0OkU-00008K-91
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:34:58 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0OkS-000678-Lj
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:34:58 -0400
Received: by mail-ed1-x52e.google.com with SMTP id j11so23696588edq.6
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LJrvYJcp2ZPYU1A34zSDwQNIEom750B3NEvP7+ewCl0=;
 b=d+65ol0CRwi/2TTZ8UYSQtJVz4VeaLpjceSdO19y+mE7kRb9JDKQFSMurbVzyKM5gb
 5shYjUxy2FQkT3UOvYtC55nuprlssXEGWPbhoKKkAiTkiZqfngLHkBLmTr68OL6W+f5z
 7VdzYWXwb/mobg9OL7NSmgvBRXfGbs8hxlUDVQ3ioRuMx96zBb4CFml6HWZh9J817dzH
 /hbI9wJa2Am5/CbOL2i5E31qHhpF8q2oaXv9EIDaAoQ1tgiqUlglMCn+7bNKfyRQugVZ
 5BbY+oNDCw/fSCt9andRftPCoR3OlDpT9LltfH8y6peVYo+rpbAKAqpYO8Tb/7rD2+OP
 +RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LJrvYJcp2ZPYU1A34zSDwQNIEom750B3NEvP7+ewCl0=;
 b=uWO0HIAIDFvv3lAjy/Fv6GSmE3x5o8NF9p/Ikf4MWT4JRccOx3CImX2COXuEzcy8bk
 ztekWHkxGYQhNH8dznTqp7l7cVP5zCP5ZYVzJ9mBR3XSSqYnzo/d36TTIftSXakChE2t
 /JhjA/t1RXN/8vBfUsQnLUTbseZ7Edv9imEWJGmzENLyv/w3cXEGhgH3RDJcybEOL6pO
 bc10bzVQVK5F/aGElnHbJKhPPwKrZaOooPmyf00PujTlXCgEeY7P+YbiVacAEOt9I+dv
 eNLkeNnPrnypM2lynbTxQA3T98fzd4eAH8UC935oZxnFkV2778SCUrAY41s9TfNsdtNO
 KaLg==
X-Gm-Message-State: AOAM532DxWBbPXokkumb9Wp51AgIdWtZlwEfPKnEcFchujghNXP/2MeF
 MlF1GkA3Sgr5ahqkL5TfsWgWLyYMqVN/EUeK3S1auw==
X-Google-Smtp-Source: ABdhPJxPjT/INOorgqziutZD2ZUcVmjBnKIT+FNjIVBPherOkYSzI+ffxyUzF85Uwo9Q7cT46fdSaGhGz9FArH7plhU=
X-Received: by 2002:a50:99cf:: with SMTP id n15mr16701671edb.146.1625492091639; 
 Mon, 05 Jul 2021 06:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <CD536CB4-9110-47F4-8357-F9F2C867A532@gmail.com>
In-Reply-To: <CD536CB4-9110-47F4-8357-F9F2C867A532@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 14:34:13 +0100
Message-ID: <CAFEAcA-9QwRO=zwE_EQWMyxLxCR-uktmwDMCrQGNtS7XkzxOBg@mail.gmail.com>
Subject: Re: Help with patch
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Jul 2021 at 14:29, Programmingkid <programmingkidx@gmail.com> wrote:
>
> Hi, I made a patch that adds an icon to QEMU on Mac OS. Who should I send this patch to?
>
>
> From 45650a7f52deb8c2c436d71a3fcf5326287c2e05 Mon Sep 17 00:00:00 2001
> From: John Arbuckle <programmingkidx@gmail.com>
> Date: Tue, 2 Feb 2021 08:35:43 -0500
> Subject: [PATCH] Set icon for QEMU binary on Mac OS
>
> Before switching the build system over to Meson, an icon was
> added to the QEMU binary on Mac OS. This patch adds back that
> feature.
>
> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> ---
>  meson.build | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index f00b7754fd..7f534f4e75 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2183,6 +2183,26 @@ foreach target : target_dirs
>                 link_args: link_args,
>                 gui_app: exe['gui'])
>
> +# set QEMU's icon on Mac OS
> +if targetos == 'darwin'
> +    newiconpart1 = custom_target('Icon for ' + exe_name + ' - part 1',
> +          depends : emulator,
> +          input : emulator,
> +          output : 'new icon for ' + exe_name + ' - 1',
> +          command : ['Rez', '-append',
> +           meson.source_root() + '/pc-bios/qemu.rsrc', '-o',
> +           meson.current_build_dir() / exe['name']],
> +          build_by_default : true)
> +
> +    custom_target('Icon for ' + exe_name + ' - part 2',
> +          depends : newiconpart1,
> +          input : emulator,
> +          output : 'new icon for ' + exe_name + ' - 2',
> +          command : ['SetFile', '-a', 'C',
> +           meson.current_build_dir() / exe['name']],
> +          build_by_default : true)
> +endif
> +
>      if exe_sign
>        emulators += {exe['name'] : custom_target(exe['name'],
>                     install: true,

meson.build stuff is Paolo's domain.

thanks
-- PMM

