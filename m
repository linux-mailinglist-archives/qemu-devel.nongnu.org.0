Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC5C1ADDFD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 15:04:10 +0200 (CEST)
Received: from localhost ([::1]:46986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPQfA-0000cY-Oo
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 09:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jPQcX-0007bu-Ov
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 09:01:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1jPQcW-0006DU-0s
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 09:01:25 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37655)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1jPQcV-0006Cm-R8
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 09:01:23 -0400
Received: by mail-wm1-x343.google.com with SMTP id z6so2908374wml.2
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eHgOKnVBd1q/xV2B17t9P7XW6l+5qu53Br1CJnfa0xc=;
 b=hfvEnw/F29rCTvWYW/py5UVB9jxWeUHLh4eWq+ct2nu6PX3fwZbTK51t41/QJ4SwqB
 h7SO5i4kmUkkdytu4BfEL2hQLbVdR6nDyN8viUZXhtdPBkfuNHc7M9cNMqxFo3g+ilSi
 0Lmsu3W2cuj9EmJw/dthEb4ahWQaHYV+T4rirQ4mniSfgyWbw8Zcotdx5PtccJeRZSDs
 5z6JI4qPmuA39vkU3uwQKVPyBmQMAFAdrFmiEdFBReEVpCjDaeWvsgpTZCYhAd/UzfU+
 9BzT//S+s66ukKX1Fb0A8jjpHbROF2UAPQvTzWfTSYXOFoHhJJ2Cw8C+a5u6gMmAa511
 Mtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eHgOKnVBd1q/xV2B17t9P7XW6l+5qu53Br1CJnfa0xc=;
 b=quWfvWQi3x15k2sCr23FUkCliiWisKMiwSsuDn0Wt9iIkhAOgIdaJqLNRb6XWZJ4py
 5Uh/75KKbm6pNntS70x/8Pht2La0JPjuKQVXR17arv0DsOIICgIxhyUUyzJkNDd3jDIu
 u14Al0NBm41sUq2nfJCMsHeP5anDohSxmh4cubUUoBeIm4mtorw+bV6sTQFEMR6Q62pM
 YEmSXIgVr6UokgY8VGxjcjJqSpVhchzOpULl+PK6e8GFBUu0j2gYyUcMEkZ8Qm5JspZf
 NtjyXXOZtUEXGWy4vwJr21Nz/dO2gX2xzLWEH2661PkkJqEYd7e6NvolXoF7+mL7sTWX
 4RfA==
X-Gm-Message-State: AGi0Puamd3gWsezpbIpG7DvycvFD5aVb5JHC/MhkCFnnN6nVmkYGP3L6
 2Ls//IdMIJdvOHnOb5+623LQllEfoKDItWI1hc0=
X-Google-Smtp-Source: APiQypLs3t1sie2L5zs6WanPMRIZssjnDQJbU9dajyMG0TFXWAoAbTdYKEA1p1bUeDIzWwiSatqnmAmPlGgO3fS487g=
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr3299049wmj.55.1587128481803; 
 Fri, 17 Apr 2020 06:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <1587126653-5839-1-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1587126653-5839-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 17 Apr 2020 15:01:09 +0200
Message-ID: <CAJ+F1CKCjv6rY3t0Lk9sTUFcop2xgjf=TjmkEGM54AzWCwx-XQ@mail.gmail.com>
Subject: Re: [PATCH] chardev/char-socket: Properly make qio connections non
 blocking
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, edgari@xilinx.com,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Apr 17, 2020 at 2:38 PM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> In tcp_chr_sync_read function, there is a possibility of socket
> disconnection during read, then tcp_chr_hup function would clean up
> the qio channel pointers(i.e ioc, sioc).
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  chardev/char-socket.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 185fe38..30f2b2b 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -549,11 +549,13 @@ static int tcp_chr_sync_read(Chardev *chr, const ui=
nt8_t *buf, int len)
>
>      qio_channel_set_blocking(s->ioc, true, NULL);
>      size =3D tcp_chr_recv(chr, (void *) buf, len);
> -    qio_channel_set_blocking(s->ioc, false, NULL);

But here it calls tcp_chr_recv(). And I can't find cleanup there.
Nevertheless, I think this patch should be harmless.

I'd ask Daniel to have a second look.


>      if (size =3D=3D 0) {
>          /* connection closed */
>          tcp_chr_disconnect(chr);
> +        return 0;
>      }
> +    /* Connection is good */
> +    qio_channel_set_blocking(s->ioc, false, NULL);
>
>      return size;
>  }
> --
> 2.7.4
>
>


--=20
Marc-Andr=C3=A9 Lureau

