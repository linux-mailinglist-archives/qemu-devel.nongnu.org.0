Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276E23A9D46
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:14:23 +0200 (CEST)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWJC-0007ss-7m
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWIC-0007DE-O3
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:13:20 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWIA-0002FJ-Gs
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:13:20 -0400
Received: by mail-ed1-x530.google.com with SMTP id b11so2918400edy.4
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OC67shx5oiIGjpkF80PR3jCQERDG4qvOzObgHIr01qo=;
 b=ovwFQX2FcSuUuMrB677dN2bobu77V4GhVepdwtXHlJPm55KyzI8cqBfy9fbntG68wD
 g1FEup9J3weLx8CjgwgZUqTTiejJeO7oa1jRx2hTpMhspzRBFWWwimSkyucq1NWebODd
 iBSmH4z450rmgy/ZuLWKXihXTXjEZqfsM8q3hj/yoa1CBlUoOIb86iMTUz9bs6rbRxCc
 Y6kW1ECIH9UQvHfEul7SwVyByzFPbUrT45V4cCAcnNzotTwx7B+eM8EmXkmAiyYlZhTt
 hRfXzJxACak2kqzJDuhJIUmHRRLuKKP0uY64zHBF59x2FIMSPJ6sraKJ3JyZvUDgQmdm
 etfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OC67shx5oiIGjpkF80PR3jCQERDG4qvOzObgHIr01qo=;
 b=F54AZnO2lL300bZ3v1fDl9P+40mJ17j5Sncso0AyxxfMfBl6LI0AfMkkmlTDUrnOQX
 6v6b7xUpI4GdWFvVaJOd7uksnTXasYml2kECjbl8xViEcOMrZ5tIqY2zBLfs7mTJFaYW
 EbTE9Gi9BE/+PQZYHKy5Y45664u/iLFba8zY5saVYmLDDpiDFFJIv2iMigTmpCtQkZzi
 6Hgh3vQxEtrzphoqCGdDCfGT0KCJpuRqPIzAPCugX12tKmEDGytSugwtsh3ZLCQFERed
 5RveKplA0u9tvvulGnIdNGZiKyR70wHZwT0WYRTzJbBqTf92rpBeDrFDlW/K0ukxJmrE
 8nVw==
X-Gm-Message-State: AOAM533ZM6k6tQoVQkgfQf75S5fryPKfljY9ksFOXYAc4kkqUneZpzXc
 FtaXuTgTOnjg2tk6+neSXYcon69Y+zBgQn75bhg=
X-Google-Smtp-Source: ABdhPJy0whxlGvlYUcwr2JZf26zo8P+23gcH1JMQsXOiUbuuVbrPMXXxaQsFruv+2lJJfaDtqK/AdOKcJPFxNJI/wMQ=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr2412644edc.319.1623852795210; 
 Wed, 16 Jun 2021 07:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210511185538.29344-1-gustavo@noronha.eti.br>
 <20210511185538.29344-2-gustavo@noronha.eti.br>
In-Reply-To: <20210511185538.29344-2-gustavo@noronha.eti.br>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 16 Jun 2021 23:13:04 +0900
Message-ID: <CAMVc7JVUabQvgxR_eVddvc0rtMf8RurgphaQnbpeYsOJF0P+bw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ui/cocoa: capture all keys and combos when mouse
 is grabbed
To: gustavo@noronha.eti.br
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B45=E6=9C=8812=E6=97=A5(=E6=B0=B4) 3:56 <gustavo@noronha.eti.br>=
:
> @@ -1877,11 +1934,17 @@ static void cocoa_display_init(DisplayState *ds, =
DisplayOptions *opts)
>      qemu_sem_wait(&app_started_sem);
>      COCOA_DEBUG("cocoa_display_init: app start completed\n");
>
> +    QemuCocoaAppController* controller =3D (QemuCocoaAppController *)[NS=
Application sharedApplication];
>      /* if fullscreen mode is to be used */
>      if (opts->has_full_screen && opts->full_screen) {
>          dispatch_async(dispatch_get_main_queue(), ^{
>              [NSApp activateIgnoringOtherApps: YES];
> -            [(QemuCocoaAppController *)[[NSApplication sharedApplication=
] delegate] toggleFullScreen: nil];
> +            [[controller delegate] toggleFullScreen: nil];
> +        });
> +    }
> +    if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
> +        dispatch_async(dispatch_get_main_queue(), ^{
> +            [[controller delegate] setFullGrab: nil];
>          });
>      }
>      if (opts->has_show_cursor && opts->show_cursor) {
> --
> 2.30.1 (Apple Git-130)
>

Hi,

I found a problem which I didn't notice when I reviewed this patch
before. [NSApplication sharedApplication] is casted to
QemuCocoaAppController *, but its type is QemuApplication. Perhaps it
should be:
QemuCocoaAppController* controller =3D (QemuCocoaAppController
*)[[NSApplication sharedApplication] delegate];
and the following [controller delegate] should be replaced with controller.

Regards,
Akihiko Odaki

