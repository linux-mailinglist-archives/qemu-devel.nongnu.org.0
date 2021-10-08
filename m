Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163542663C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 10:51:01 +0200 (CEST)
Received: from localhost ([::1]:47274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYlam-0003s5-4I
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 04:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYlWi-0000he-Mz
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 04:46:51 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYlWh-0003wM-8U
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 04:46:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m22so27499097wrb.0
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HVDj5Lz8e+K1aRnG+hMy8IwRte6w7yNdH5xZOGcpCW4=;
 b=XeFw5Jq4vcqsDwC5/VvUkc0F+611uhClXoM0yuiiGG6X+qEpiFMe7Xij5wW1LHmcWn
 XldI5IOewn3E4lIP2fL64Pkq4FXreVq3V/2XAhD5ixgoZvMwVrv3F/tDxwdz3OUbBaPf
 2UsQvJ+LE30M6cvd+X59QRKzwSfAyRbrbnWtunGKFAVINHrW2erJ8dDJzQtNGVHaFP75
 Xt2T/kevlKe0EWHBUhRZP18UzITRyDOMc2k8a9FhDmDAK1DNTmJwzmu7usID7dLhNkyW
 G2YXEJJajYRHlIfTS3Qu7c3Rs1ABfJxZhx/OZriTPcB5UQFPs18ZiuhNnzkYXD1tDrCw
 rGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HVDj5Lz8e+K1aRnG+hMy8IwRte6w7yNdH5xZOGcpCW4=;
 b=yUJoYKPoUwVUGaIa7VZWxPPxD9orh4mKOlpNEHVp89YkpSqvMBHCIFmCbSUtRPirf9
 TrMANAx5eKwPy8NQgaAYiQnnS6Vb62UEBHJzWdC8kU990fKktwu2AlP8w/MlmQguaTzf
 G1ltVZ2wAvN7QUkbFrPI6AHE3MTzFtqqhBvyDKjZjcffPxPdhUEbfunoJ+T3MWeKaBK2
 wWbaETiQ7BdbJE3++T38GvedioELZ/C/yTFyw3h3suWQwMZHq+ATp0+qi42x2isi+fGT
 XDwoFyomY7TWdDQdEv8T7jLbLY7Z140TYBjolD3pTKG/sk4NJFltVhMExISep6b3Mkpm
 Kh5g==
X-Gm-Message-State: AOAM530Q1G+Q0raT03bgoZ6/xmU6TlY4ogZCRl3b4hdT6KhTHwndPKAP
 1Un5fWs8GlPwX9jrN+jRlCNfkQMNayeF43YBmRE=
X-Google-Smtp-Source: ABdhPJwNy+2/n1vA5bAhD2c2lo84srkc1+5ugsrY1nLxITRFaD+Zcbyj6upuC8TH6iIaWGIcTwQOEleDp5+Zebe3PEk=
X-Received: by 2002:a1c:a5cd:: with SMTP id o196mr2105976wme.96.1633682805494; 
 Fri, 08 Oct 2021 01:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-19-pbonzini@redhat.com>
 <CAJ+F1C+YriVhkYRtiHe=US3MmhEyLkVPnfwuAJqYvSOCR-uGEg@mail.gmail.com>
 <32011430-0e48-46c7-9f1e-c5b484a4eaf4@redhat.com>
In-Reply-To: <32011430-0e48-46c7-9f1e-c5b484a4eaf4@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 12:46:33 +0400
Message-ID: <CAJ+F1C+dx-=7tydmWfrEZKctXVp0k_TXNhoCbqdFvTZyQhFjbw@mail.gmail.com>
Subject: Re: [PATCH 24/24] configure: automatically parse command line for
 meson -D options
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004c18d105cdd36b0f"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004c18d105cdd36b0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Oct 8, 2021 at 12:43 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 07/10/21 22:41, Marc-Andr=C3=A9 Lureau wrote:
> >
> > I have not investigated why, but this broke at least
> > --enable-trace-backend=3Dlog for me:
> > ERROR: unknown option --enable-trace-backend=3Dlog
>
>  From the commit message:
>
> "A few options change name: --enable-tcmalloc and --enable-jemalloc
> become --enable-malloc=3D{tcmalloc,jemalloc}; --disable-blobs becomes
> --disable-install-blobs; --enable-trace-backend becomes
> --enable-trace-backends".
>
>
Right, I got tired of reviewing at this point to read the whole thing.


> I'll add some code for backwards compatibility.
>

Yes, I guess that will help others as well, thanks!


--=20
Marc-Andr=C3=A9 Lureau

--0000000000004c18d105cdd36b0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 8, 2021 at 12:43 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 07/10/21 22:41, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; <br>
&gt; I have not investigated why, but this broke at least <br>
&gt; --enable-trace-backend=3Dlog for me:<br>
&gt; ERROR: unknown option --enable-trace-backend=3Dlog<br>
<br>
=C2=A0From the commit message:<br>
<br>
&quot;A few options change name: --enable-tcmalloc and --enable-jemalloc<br=
>
become --enable-malloc=3D{tcmalloc,jemalloc}; --disable-blobs becomes<br>
--disable-install-blobs; --enable-trace-backend becomes<br>
--enable-trace-backends&quot;.<br>
<br></blockquote><div><br></div><div>Right, I got tired of reviewing at thi=
s point to read the whole thing.<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
I&#39;ll add some code for backwards compatibility.<br>
</blockquote><div><br></div><div>Yes, I guess that will help others as well=
, thanks! <br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004c18d105cdd36b0f--

