Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F65305825
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:20:23 +0100 (CET)
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hvy-0007jB-9G
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l4hur-0006r5-HO
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:19:13 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l4hup-0003XW-To
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:19:13 -0500
Received: by mail-ed1-x531.google.com with SMTP id b21so1752860edy.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 02:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yffz35jNcMTUpbWIxKV9MRN5toulQg5wZETpv9g7JeA=;
 b=HV3Nu8bQ02rm52pPqG80Oh0Oz9muqbtk0oJLzrcswDzhoLcmGoBRh2cEnCqPneOjHs
 ImXFXMuRzE9Qy3kefuVI+ISWM3clYCG6RWZz3n/h4KMCJnDzseN/xXNXN4L9I9vHakW0
 /CNV31ML31CRFNuXElBUSMqtoxgO8fQVaRYpAzxAIiCB89MIfigTgs/otr/6LNRivi6p
 xP1QtG72TUKpYEBldQHJ1/OU6l3EuyGvvNyUIDTPv5t5b3PDw82340SootH0Whms+SNp
 ddyNsEYKdF1inkD/rUWaJwHL3i/dyHpcOQ5ygzimrGYE2styxqo4MDIrsWYW16buAcIs
 KOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yffz35jNcMTUpbWIxKV9MRN5toulQg5wZETpv9g7JeA=;
 b=j2+k4E2fLYCSX7m9bLNZ0O6x7WkZebaO2QMtVZNve+ofoXKVzwVaNzHJOpufJYMQeZ
 AZU+CrhsofBXy5ONlpb27FpGqujlSYR/WbdHwgTSLxJwl6j66z3U7gpSpEboNCL8EwmA
 Jbj8IwBF8+k0GIqBpTmawAgNUGcWm3wvJi/lUh+QaJ923M0PFLarSzxAgtDsGB3ps2dY
 9MPCwTB8eLQJ0RGxEhTD6MJG7aaBC7UP3kFT79zIwEj5hNwHxqe3hiEjP5QhYOTcvSFn
 hhJSEYlt+Un9uL29QdRKSBEFcJUyKahHlcxAGXd1HJY3J5B0qmj8hJeSvjR0SvnDWFfJ
 Bb4w==
X-Gm-Message-State: AOAM530PwLC/K3cFHkuE6jfaVXvCDrTgVKS0QCHaX5MAuSqGAFY9DsPa
 9KRIJGBqo98zBxYAh0klWw0IsQpnOSdIMVmQyceWa2SrnlYkiQ==
X-Google-Smtp-Source: ABdhPJzpRXmvEEDGqAzcJf2tMh2YHfMw91lTFe0JwLfQtFrUsTccBdmAYJct/yys97IZ3Qrkj1fTbccZZId5rAkGXh0=
X-Received: by 2002:a05:6402:18f:: with SMTP id
 r15mr8601339edv.53.1611742749363; 
 Wed, 27 Jan 2021 02:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20210127100206.277698-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210127100206.277698-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 27 Jan 2021 14:18:57 +0400
Message-ID: <CAJ+F1CLJsyq0cQRUg=neJOWOuhm94xKceR4sQFaKOUQxVRi=Yg@mail.gmail.com>
Subject: Re: [PATCH] ui: fix spice display regression
To: QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Jan 27, 2021 at 2:03 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Since commit b4e1a342112e50e05b609e857f38c1f2b7aafdc4 ("vl: remove
> separate preconfig main_loop"), spice initialization is a bit dodgy, and
> the client get stuck waiting for server events.
>
> The initialization order changed, so that qemu_spice_display_start() is
> called before the display interfaces are added. The new interfaces
> aren't started by spice-server automatically (yet?), so we have to tell
> the server explicitely when we are already running.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/spice-core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index 5746d0aae7..6eebf12e3c 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -830,6 +830,8 @@ static void qemu_spice_init(void)
>
>  static int qemu_spice_add_interface(SpiceBaseInstance *sin)
>  {
> +    int ret;
> +
>      if (!spice_server) {
>          if (QTAILQ_FIRST(&qemu_spice_opts.head) !=3D NULL) {
>              error_report("Oops: spice configured but not active");
> @@ -848,7 +850,13 @@ static int qemu_spice_add_interface(SpiceBaseInstanc=
e *sin)
>          qemu_add_vm_change_state_handler(vm_change_state_handler, NULL);
>      }
>
> -    return spice_server_add_interface(spice_server, sin);
> +    ret =3D spice_server_add_interface(spice_server, sin);
> +    /* make sure the newly added interface is started */
> +    if (ret =3D=3D 0 && spice_display_is_running) {
> +        spice_server_vm_start(spice_server);
> +    }
> +
> +    return ret;
>  }
>
>  static GSList *spice_consoles;
> --
> 2.29.0
>
>

Oops, it doesn't work reliably. There is some race in spice server now.

spice_server_vm_start() sends RED_WORKER_MESSAGE_START to the QXL
worker thread. But if two of those come, it will assert... It should
probably not, I will send a patch to spice.

I am looking for other options for QEMU though.

--=20
Marc-Andr=C3=A9 Lureau

