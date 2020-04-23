Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790EF1B6461
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 21:18:54 +0200 (CEST)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRhN7-0005hh-2c
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 15:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jRhL3-0004V6-Fd
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 15:16:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jRhL1-000231-Ib
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 15:16:44 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jRhL0-0001oE-84; Thu, 23 Apr 2020 15:16:42 -0400
Received: by mail-wm1-x341.google.com with SMTP id r26so7818883wmh.0;
 Thu, 23 Apr 2020 12:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+wyQ2QGtkYVcNx6dUqs2SNql04F92a4RgpaY4RSL3Y0=;
 b=cfSV9XXhtIKuZGjFpjWZtBtsK9Q461Qd1ufwShCNlDz5vm3E6yNE6M6yfruWfyZsRt
 uIDNaLEgFi3cNYB2eOQNL/BWPqbRPZG4WWgWoZ/N6ERYd1U0fld3b8dUYl/xi0WIli8d
 aRQc93Y+csa0nrMT2OzJgAGhi3MhSl9EglYKTPJdIUKFScGTwhn5mBhz/mMP4Cxanf+/
 fXXXGgxyUY+PB49aUzE+Muuf6n42zhNIk75LoYQBIZsd9U/Bkpg4c/mrQepnnMG5TyNR
 rYY3JaAfdQrm1hgi7fwDmoN1o6PxxGON16aJpRmv7u3USZxyggvTy9MOHFaaqcChx4gV
 IxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+wyQ2QGtkYVcNx6dUqs2SNql04F92a4RgpaY4RSL3Y0=;
 b=G9ABf+cOViZ7VXapEVaoqIRMK2S/IGkdG2SxIv/9+JakMrOZWuEZDsWqg+zYTlzLtt
 S3TPXBGfLD3AYWOPwsO+NX2ad4u7nlKFMeQRL+TCSvvp/MzT+XAgCooSdjVX7pNCxVzN
 fJyWwyGhyPA+Dej9uib+0cl0vyYCVpuVOzhXB32/7DXL6rMqoDT5KPEwnYVKMBhP7beV
 xd0duKo/weL9p+w3HV/Jawx6pCn5KH217NdkyBaMKOHgkoRkWtCbKQ5/3C3ycdL01u1c
 mJWqNZmwQvyIxHZlkcIM0UiRxzVo+zbDAaJWeulSFZ/wxYralCvpGi5KotrzhFOWo/v2
 qq/A==
X-Gm-Message-State: AGi0Puajn0Z6TfdmxpZdbGClawlidiUf9aplvekRXTUd+xRwUoSt9rjs
 vRhhkv/eDDwfUtpv8kEcRNvzF6GmP+OYPhqntGE=
X-Google-Smtp-Source: APiQypIWX7F/+C1ZJyLntoqRAp0DFZbo6QM+mkUEFA+K1ZXmNw2PXr+Ho6coszQX13cvbjfqUhn2nR3uhoEy3qfvjGw=
X-Received: by 2002:a1c:1bcb:: with SMTP id b194mr5946395wmb.4.1587669396897; 
 Thu, 23 Apr 2020 12:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587667007.git.dimastep@yandex-team.ru>
 <23b36a73ce1150cc501f436684ca558608de3322.1587667007.git.dimastep@yandex-team.ru>
In-Reply-To: <23b36a73ce1150cc501f436684ca558608de3322.1587667007.git.dimastep@yandex-team.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 23 Apr 2020 21:16:24 +0200
Message-ID: <CAJ+F1CJgzqSDnU==Fi4-fQ3Fh97BgEnNd_GZOg8n9i1C4xsOmw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/7] char-socket: initialize reconnect timer only
 if close is emitted
To: Dima Stepanov <dimastep@yandex-team.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gonglei <arei.gonglei@huawei.com>, Li Feng <fengli@smartx.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Apr 23, 2020 at 8:41 PM Dima Stepanov <dimastep@yandex-team.ru> wro=
te:
>
> During vhost-user reconnect functionality testing the following assert
> was hit:
>   qemu-system-x86_64: chardev/char-socket.c:125:
>   qemu_chr_socket_restart_timer: Assertion `!s->reconnect_timer' failed.
>   Aborted (core dumped)

That looks related to "[PATCH 3/4] char-socket: avoid double call
tcp_chr_free_connection"

> This is observed only if the connection is closed by the vhost-user-blk
> daemon during the initialization routine. In this case the
> tcp_chr_disconnect_locked() routine is called twice. First time it is
> called in the tcp_chr_write() routine, after getting the SIGPIPE signal.
> Second time it is called when vhost_user_blk_connect() routine return
> error. In general it looks correct, because the initialization routine
> can return error in many cases.
> The tcp_chr_disconnect_locked() routine could be fixed. The timer will
> be restarted only if the close event is emitted.
>
> Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
> ---
>  chardev/char-socket.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index c128cca..83ca4d9 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -476,7 +476,7 @@ static void update_disconnected_filename(SocketCharde=
v *s)
>  static void tcp_chr_disconnect_locked(Chardev *chr)
>  {
>      SocketChardev *s =3D SOCKET_CHARDEV(chr);
> -    bool emit_close =3D s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED;
> +    bool was_connected =3D s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED;
>
>      tcp_chr_free_connection(chr);
>
> @@ -485,11 +485,11 @@ static void tcp_chr_disconnect_locked(Chardev *chr)
>                                                chr, NULL, chr->gcontext);
>      }
>      update_disconnected_filename(s);
> -    if (emit_close) {
> +    if (was_connected) {
>          qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
> -    }
> -    if (s->reconnect_time) {
> -        qemu_chr_socket_restart_timer(chr);
> +        if (s->reconnect_time) {
> +            qemu_chr_socket_restart_timer(chr);
> +        }
>      }
>  }
>
> --
> 2.7.4
>
>


--=20
Marc-Andr=C3=A9 Lureau

