Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F318A6B292C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 16:52:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paIY6-00024i-D0; Thu, 09 Mar 2023 10:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1paIY4-00024E-8s
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 10:51:20 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1paIY2-0004CQ-Iw
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 10:51:20 -0500
Received: by mail-lf1-x129.google.com with SMTP id n2so2844315lfb.12
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 07:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678377076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXOKGwgLoZmOkxoV7UTg4DU6WdFVbjgzUQuRhNdukas=;
 b=BEwz9kheM+ktqPSMMwGoWzcgZgg+PgSS1dGsG4I0qIg0MMM7LF+Dxzd2PHcfBBbrOp
 C72AphvW8I3quqk+IRg5Z7hxZpnCGimlGpD3aIqXC+Y0AAbbYqBpm2k+txOSWyH9KXCQ
 cJ04hgCQWQbsYH0wPedS9yIfNopS4T6TdCINYc6qTUKjC95IP7vVbv3NsMD7TsZcjEfF
 JnFffkddNFPpEUMwgoyFZGl7zl7UAMmkclVAYdIToW3Yoi2RgJvhcMB5fEANd+Q8yq9M
 vOS5RT3THpT92HH+jaPR4ymVXiByOXMyL3mCxUWjuOxi87XqV07pcV8u4v5IgzaJBcCA
 +jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678377076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sXOKGwgLoZmOkxoV7UTg4DU6WdFVbjgzUQuRhNdukas=;
 b=7Y/wm4nsztzO4LzKIzguCbOlWQvwLPU5NHTHOu6X6a9RD1dHsk9JcLN9d1N7vOJyg8
 LPI+54ZYhDoprgguaq6wDv6XKAWorhthTLqISqaGgLaNGp2mqyIlANdfBkW9czffvM/l
 W1/wX4xDpkwaHY1UjNfttzsBZPrBn2WCt+gxULqdKqkBQwcMr6snjY1ECE+uBOK1oIRP
 r8IobIbNNiGWMkrnAE8KbPVX9doBbF0VWfD4JaLSrwvRVL4OBzUa1YfvyFCoY8Z/y1NP
 l2gRBUOm3DG85ug+Q4JobaZ8ts5W/ARWZjHSy0oXZoEM0U/M1nPrbE291cuabmiQ7eW0
 M6cQ==
X-Gm-Message-State: AO0yUKX2SSH8ywcljh4dUZZeT06aFZaR3Nqx8MDWDbGNuhuMtd0m99Kf
 2QbknVf9TcNV3OkUT8t7Q3xl7FXOgeBRG8++MUR2GZgjNwc=
X-Google-Smtp-Source: AK7set8QsRzINRIr4JZXOTGDWmjWwOJYlqBSYA6LvaAzx7yvDtnnVe0cTjxjRAf+zRkXUgAH3a2VK/oXkUQPhqsexvM=
X-Received: by 2002:ac2:5313:0:b0:4d8:5810:1ffa with SMTP id
 c19-20020ac25313000000b004d858101ffamr6695613lfh.11.1678377075579; Thu, 09
 Mar 2023 07:51:15 -0800 (PST)
MIME-Version: 1.0
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 9 Mar 2023 19:51:03 +0400
Message-ID: <CAJ+F1CJbouyPsvtTLoRp1RZPzX8M5S1meurpN56LvfvhN22dWg@mail.gmail.com>
Subject: Re: [PATCH v2 00/18] ui: dbus & misc fixes
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Tue, Mar 7, 2023 at 3:57=E2=80=AFPM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> This is a respin of a series I sent end of January that didn't get review=
s, here
> is your chance! :) A collection of fixes for UI related-stuff, and paving=
 the
> way for accelerated/egl dbus display support on win32 (for 8.1 hopefully)=
.
>
> I think they are worth including in 8.0, as little fixes and improvements=
. It
> would be nice to have included as early as rc0.

If there is nobody available/interested enough to review, I wonder if
I should use my ui/ maintainer hat and send a PR as is.

thanks

>
> v2:
> - add "ui/dbus: initialize cursor_fb"
> - add "ui/shader: fix #version directive must occur on first line"
> - add "ui/egl: print EGL error, helping debugging"
> - add "ui/sdl: add optional logging when _SDL_DEBUG is set"
> - add "ui/sdl: try to instantiate the matching opengl renderer"
> - add "ui: introduce egl_init()"
> - add "ui/dbus: do not require opengl & gbm"
> - add "ui/dbus: restrict opengl to gbm-enabled config"
> - drop "ui/dbus: update the display when switching surface", as I
>   am not yet confident enough about it
> - rebased
>
> Marc-Andr=C3=A9 Lureau (18):
>   ui/dbus: initialize cursor_fb
>   ui/dbus: unregister clipboard on connection close
>   audio/dbus: there are no sender for p2p mode
>   ui/dbus: set mouse is-absolute during console creation
>   meson: ensure dbus-display generated code is built before other units
>   ui: rename cursor_{put->unref}
>   ui: rename cursor_{get->ref}, return it
>   ui: keep current cursor with QemuConsole
>   ui: set cursor upon listener registration
>   ui: set cursor position upon listener registration
>   ui/sdl: get the GL context from the window
>   ui/shader: fix #version directive must occur on first line
>   ui/egl: print EGL error, helping debugging
>   ui/sdl: add optional logging when _SDL_DEBUG is set
>   ui/sdl: try to instantiate the matching opengl renderer
>   ui: introduce egl_init()
>   ui/dbus: do not require opengl & gbm
>   ui/dbus: restrict opengl to gbm-enabled config
>
>  meson.build                      |  2 -
>  audio/audio_int.h                |  2 +-
>  include/ui/console.h             |  5 +-
>  include/ui/egl-helpers.h         |  4 ++
>  include/ui/sdl2.h                |  2 +
>  ui/vnc.h                         |  1 -
>  audio/dbusaudio.c                |  6 ++-
>  hw/display/qxl-render.c          |  4 +-
>  hw/display/qxl.c                 |  2 +-
>  hw/display/vmware_vga.c          |  4 +-
>  ui/console.c                     | 18 ++++++++
>  ui/cursor.c                      |  5 +-
>  ui/dbus-clipboard.c              | 18 +++-----
>  ui/dbus-console.c                | 13 ++++--
>  ui/dbus-listener.c               | 22 ++++++---
>  ui/dbus.c                        | 29 ++++++++----
>  ui/egl-headless.c                | 16 +++----
>  ui/egl-helpers.c                 | 79 +++++++++++++++++++++++++++++---
>  ui/sdl2.c                        | 17 ++++++-
>  ui/spice-core.c                  |  7 +--
>  ui/spice-display.c               |  8 ++--
>  ui/vnc.c                         |  8 +---
>  tests/qtest/meson.build          |  2 +-
>  ui/meson.build                   |  6 ++-
>  ui/shader/texture-blit-flip.vert |  1 -
>  ui/shader/texture-blit.frag      |  1 -
>  ui/shader/texture-blit.vert      |  1 -
>  27 files changed, 203 insertions(+), 80 deletions(-)
>
> --
> 2.39.2
>
>


--=20
Marc-Andr=C3=A9 Lureau

