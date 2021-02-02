Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5506730B89E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 08:29:13 +0100 (CET)
Received: from localhost ([::1]:44926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6q7b-0004PJ-U5
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 02:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l6q5t-0003we-O4
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:27:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l6q5p-0004b6-8X
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612250838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2GrxLCgQ7Zn+dxbUe8UrXtcBYgBfNNnFeoJGvV1meeo=;
 b=DFI8BGjryV6RQJ3gXzFAWEMCh1tHYP+V9ccsSwJ1U+5R91Aa/D0JaMdxp6UW8R3+VTvPiL
 cncVz50F2usfTjua6/mt8cWWvq6SUE4ZO261+AYkYxIWjx+Qlc8qUrWPUoR3yfTdTi9i0j
 LwCaQ9SmPjMrkajbYHxdPtl+nWdwLKQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-T8Q5YdpZPRWSytOJ03xXVw-1; Tue, 02 Feb 2021 02:27:16 -0500
X-MC-Unique: T8Q5YdpZPRWSytOJ03xXVw-1
Received: by mail-il1-f197.google.com with SMTP id e16so2919363ile.19
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 23:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2GrxLCgQ7Zn+dxbUe8UrXtcBYgBfNNnFeoJGvV1meeo=;
 b=pfbzPAMXAGcCg73qKTnjsf+MkI2EjPqz/zWReUU3yN5ttqM7EBiOUFjGjI0MFcIzlv
 KwDRilFhbM7OcOm0yvMcpinLCs6+wOh9s3RNrbcXgeLtMxMwxQdxxGPTaUt5c/flrwLG
 BV74k1F09d3eNwf0C092NkRxJ5bwrJxKc+GJnL2DznoKjKYLYtbgesqNEILSxhUQ8sOr
 MmBklkg/ppuFDE4R1tjkhB0Oe85jAQsn1/LwWbv/MI9dQzlMxf7nHCq5UKKETqnAEd9z
 OMt1/c55Z3oNq56VPx4bAtO3DEGaEMm8F0uyeQhAbzRX5EzBmpRRh3ocdxbtxOpVKOSw
 1bNg==
X-Gm-Message-State: AOAM532j65T15N0Z2Q//5LQ1ZjGvdMc8HDUfLRwHjvJFQgud0jmoFdjL
 B4rUMaPvlqvI9MDpmcELMHdaJIVJAEnn7oYkLZE0PCU1MDlg9l/GfhVrbFB6A8l9P1KV0lh6XjS
 SnB+Eis/Cx4I8JhGPQbsEPb+cPpiIUf0=
X-Received: by 2002:a05:6e02:4cc:: with SMTP id
 f12mr876235ils.182.1612250835368; 
 Mon, 01 Feb 2021 23:27:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwade935BED686IF6Va86ATrJV7GwT5nxQgb5IBeu/pEJsENYMonWPM3/9enT62/HHeCyRghDKhx3oGvrXXvE=
X-Received: by 2002:a05:6e02:4cc:: with SMTP id
 f12mr876219ils.182.1612250835176; 
 Mon, 01 Feb 2021 23:27:15 -0800 (PST)
MIME-Version: 1.0
References: <161224971122.79781.8594358970645859667.stgit@pasha-ThinkPad-X280>
In-Reply-To: <161224971122.79781.8594358970645859667.stgit@pasha-ThinkPad-X280>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 2 Feb 2021 11:27:04 +0400
Message-ID: <CAMxuvax4eUGGfLH4sQpS4ocD43bsMVFjiFsv2xcywwbXZ0-JJA@mail.gmail.com>
Subject: Re: [PATCH] char: don't fail when client is not connected
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000051e79d05ba55669a"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000051e79d05ba55669a
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, Feb 2, 2021 at 11:18 AM Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
wrote:

> This patch checks that ioc is not null before
> using it in tcp socket tcp_chr_add_watch function.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>

Do you have a backtrace or a reproducer when this happens?
thanks

---
>  chardev/char-socket.c |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 213a4c8dd0..cef1d9438f 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -385,6 +385,9 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf,
> size_t len)
>  static GSource *tcp_chr_add_watch(Chardev *chr, GIOCondition cond)
>  {
>      SocketChardev *s = SOCKET_CHARDEV(chr);
> +    if (!s->ioc) {
> +        return NULL;
> +    }
>      return qio_channel_create_watch(s->ioc, cond);
>  }
>
>
>

--00000000000051e79d05ba55669a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 2, 2021 at 11:18 AM Pav=
el Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgalyuk@ispras.ru">pavel.dovgaly=
uk@ispras.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">This patch checks that ioc is not null before<br>
using it in tcp socket tcp_chr_add_watch function.<br>
<br>
Signed-off-by: Pavel Dovgalyuk &lt;<a href=3D"mailto:Pavel.Dovgalyuk@ispras=
.ru" target=3D"_blank">Pavel.Dovgalyuk@ispras.ru</a>&gt;<br></blockquote><d=
iv><br></div><div>Do you have a backtrace or a reproducer when this happens=
?</div><div>thanks</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
---<br>
=C2=A0chardev/char-socket.c |=C2=A0 =C2=A0 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index 213a4c8dd0..cef1d9438f 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -385,6 +385,9 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, si=
ze_t len)<br>
=C2=A0static GSource *tcp_chr_add_watch(Chardev *chr, GIOCondition cond)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SocketChardev *s =3D SOCKET_CHARDEV(chr);<br>
+=C2=A0 =C2=A0 if (!s-&gt;ioc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0return qio_channel_create_watch(s-&gt;ioc, cond);<br>
=C2=A0}<br>
<br>
<br>
</blockquote></div></div>

--00000000000051e79d05ba55669a--


