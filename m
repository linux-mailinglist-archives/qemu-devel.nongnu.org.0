Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D82403DAC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:37:14 +0200 (CEST)
Received: from localhost ([::1]:55452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0ZV-0001sx-Gl
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mO0X8-00086L-9D
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:34:46 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mO0X6-0006Qr-J1
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:34:46 -0400
Received: by mail-wr1-x436.google.com with SMTP id n5so4165361wro.12
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 09:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=05fHryxNsibzZ+BllvJWHTThc31B5HdDLqQV5pACex8=;
 b=QTO193MgSgBrTkmaNMfnTmnGXylQANe34FS+gK25M57qXwhAwBhV12lgvm19CUfkpy
 gt7uG8uyZZAaZa2LAoy6NLR1b1RJWYFzQuKIU8wc5Z9RiX4AFhKliRfFYZxHTl5VIii3
 CXYpmUEDyZJr+ayFJRmcNbVEYBRgqNonEeW6Or4YhleqG6WPtKx12xXq3TwEzgqVhpbq
 PP0Ps3brt28OqzPcYZOTxpuJ/Ymq9x9drxPzhI7KSq0LZagAIFIOAVDgo2Aa5FSxClOl
 l0OYTUD70xszKfH9VMQFrhVYgcUPUsM30op60ZZM3klJ2vNUakanTpzakCyEeMi7iGmr
 F3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=05fHryxNsibzZ+BllvJWHTThc31B5HdDLqQV5pACex8=;
 b=EjQ+FTmYAHd0kSwpejUkdd/APSMIcknX/x6gNzYIvCxMI5171PwnW72RpaxWSqbzee
 23jHFrzcAfvXxv8ArMzftddnazPq9GdHRu+AyVL70nZ7cLKJR0/O70gjdnyUFAkrG/zY
 aAXQysEgVsckvZH9nEq+LMnC6uCyLYD9oy0S8ukryjkFwKUbXKZ1qTOl0HFe1HXGU6A0
 kCIxEFRA+GqCqKF28XtOyGhQBj1tdVqvTv/gDD7swXIMgRxvdNXVtYFUftcmvA6JMotj
 o6JVEAycuY83mjrTJ+WVNfCWVPdVn+b4HNE0r65/8NPaonc7/OmB94DHdalP/dLSgESZ
 Q08Q==
X-Gm-Message-State: AOAM530QK9JucE/SPNdzq1HLq5QkE7ZoCgp1lxg3wbeEcAHiSetVei4H
 1VuhHi8w0s7kJk+Sorbt8UqPutWZgp/LkxDhET4=
X-Google-Smtp-Source: ABdhPJxC+wx+5hpqsZeU05aAYhzPHCGz3ar8HUnGX/qhPKCH+vBv9vQcJVFIB6N/XO9KgJ4/HlteMengFSWvcL4U6Uw=
X-Received: by 2002:adf:c542:: with SMTP id s2mr5201827wrf.374.1631118882950; 
 Wed, 08 Sep 2021 09:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <24888.55565.53378.616422@mariner.uk.xensource.com>
 <CAJ+F1CJR9hAd+2MJZ1X9s2vBW=fG++mgk75M+Ww166orq3KdNg@mail.gmail.com>
 <24888.58624.549030.64132@mariner.uk.xensource.com>
In-Reply-To: <24888.58624.549030.64132@mariner.uk.xensource.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 8 Sep 2021 20:34:31 +0400
Message-ID: <CAJ+F1CJFdrU38BwK=V-89fYYu3ySywREAF-WuBNJLftsMP52rg@mail.gmail.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
To: Ian Jackson <iwj@xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000009ad15a05cb7e7544"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009ad15a05cb7e7544
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 8, 2021 at 8:29 PM Ian Jackson <iwj@xenproject.org> wrote:

> Marc-Andr=C3=A9 Lureau writes ("Re: [RFC v3 13/32] rust: use vendored-sou=
rces"):
> > You can start by reading `cargo doc -p common --open`. The generated
> > code needs some environment variables set, so `cargo doc -p qga`
> > will fail unless you set the environment variable
> >
> > MESON_BUILD_ROOT=3D`pwd` cargo doc -p qga --open --document-private-ite=
ms
>
> Thanks.  I did this (and your rune from bofere) and I have the docs
> open.
>
> I wasn't quite sure where to start.  I didn't see where the
> entrypoints were.  I did find
>
>  .../target/doc/qga/qmp/fn.qmp_guest_set_vcpus.html
>
> which err, doesn't look like the kind of safe api I was hoping to
> find.
>

Yes, this is the shim to provide a C ABI QMP handler from Rust. This is
where all the FFI<->Rust conversion takes place.

The "safe" code is qga/qmp/vcpus.rs. However, there is no documentation
there, since it's not meant to be the public interface. It's documented
with the QAPI schema.


--=20
Marc-Andr=C3=A9 Lureau

--0000000000009ad15a05cb7e7544
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 8, 2021 at 8:29 PM Ian =
Jackson &lt;<a href=3D"mailto:iwj@xenproject.org">iwj@xenproject.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Marc-An=
dr=C3=A9 Lureau writes (&quot;Re: [RFC v3 13/32] rust: use vendored-sources=
&quot;):<br>
&gt; You can start by reading `cargo doc -p common --open`. The generated<b=
r>
&gt; code needs some environment variables set, so `cargo doc -p qga`<br>
&gt; will fail unless you set the environment variable<br>
&gt; <br>
&gt; MESON_BUILD_ROOT=3D`pwd` cargo doc -p qga --open --document-private-it=
ems<br>
<br>
Thanks.=C2=A0 I did this (and your rune from bofere) and I have the docs<br=
>
open.<br>
<br>
I wasn&#39;t quite sure where to start.=C2=A0 I didn&#39;t see where the<br=
>
entrypoints were.=C2=A0 I did find<br>
<br>
=C2=A0.../target/doc/qga/qmp/fn.qmp_guest_set_vcpus.html<br>
<br>
which err, doesn&#39;t look like the kind of safe api I was hoping to<br>
find.<br></blockquote><div><br></div><div>Yes, this is the shim to provide =
a C ABI QMP handler from Rust. This is where all the FFI&lt;-&gt;Rust conve=
rsion takes place.<br></div><div><br></div><div>The &quot;safe&quot; code i=
s qga/qmp/<a href=3D"http://vcpus.rs">vcpus.rs</a>. However, there is no do=
cumentation there, since it&#39;s not meant to be the public interface. It&=
#39;s documented with the QAPI schema.<br></div><br clear=3D"all"></div><br=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<b=
r></div></div>

--0000000000009ad15a05cb7e7544--

