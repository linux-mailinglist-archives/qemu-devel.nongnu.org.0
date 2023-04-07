Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470936DB0A7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 18:34:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkp2H-0004ZK-3h; Fri, 07 Apr 2023 12:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pkp2F-0004Z4-Qx
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:33:59 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pkp2E-0001xu-6Y
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:33:59 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id r187so49493265ybr.6
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 09:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680885236; x=1683477236;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ufuxEPgcFxysP+JOinvhlQiqSzLUh8BMp+Ht6KNFQtw=;
 b=aB//ljzp0qGunX6QqkSuRP7tcIL7A/c6tnGpJTo5QamR60eqGXvFYknQPFv5MQpRS2
 Btr6miQ3QP55iLGCSGrG8BXQN9Q3nt/dJjvQgdLVgc8ZLgg18sH/joU0hxVU4zhwNPUD
 4qu6qBktFZPZRoHmANZ5bDZhFzgFOSOzCL6cKs737Mtm8hcAz1T5N4gaCfHqZH/5uSTa
 ky60qplwOzFpqSOElKOAV070fkvw3lNKLjFAhG30gbx40Y4NMFAjoxxB7NVFjQRgCsPp
 j/7vHT5+ax8lU7RXOYrUSMGWRvqn2faCMJ+iNOdqRFZ5WK1Jssqh3C5aRoZCgvRGAkPz
 FPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680885236; x=1683477236;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ufuxEPgcFxysP+JOinvhlQiqSzLUh8BMp+Ht6KNFQtw=;
 b=av1Q+7zw9PzCjqZR45Gy3b0np28xqNJlCHAOC1ZprPiUS4dzG831X5sgdztqVXYZbo
 1GzXdYuOC5qAjaq8IPqG0aOAkmT4HuewV+qRK/eSbrzhiPV3LcsHOR+Km1QQn9nOgHww
 X+Wt132+eyCblnOMY8xH0QYm7zKgesoKenZ68qwt4ZVsQyMnZc8KTVeRvR2kI4/3Yatn
 HUkFZkB2K49nANL9TKynYPi8hkhaoLkKIGc82I9g1zRtqxPLgRvbJU1yYRgxmo3PpyKE
 nHm0CShDiImackTAEblUDNQuCIvUSYI14qJohx4OjLYSDvMUsIVNwIomy+Xe2mIWeQoY
 c2iw==
X-Gm-Message-State: AAQBX9fetXaoFwIijjLqPU12w6IFP8Aca/WnIw7Ao9PAXFzHVkf2gFyO
 21H8uTBhwe9Go4n88GuzMGe+zac1IppjoD+6oz4=
X-Google-Smtp-Source: AKy350ZHvJCARISab0nS/2mVtW+ttXx9p/25zItVvOmHf6/xUgZaQ/gb5Q/6ju5qiWNiBSPzBnjJ+EbIY9xxD6UHPLQ=
X-Received: by 2002:a25:d10c:0:b0:b79:22d7:95ff with SMTP id
 i12-20020a25d10c000000b00b7922d795ffmr2095044ybg.2.1680885236696; Fri, 07 Apr
 2023 09:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230407134044.11638-1-pbonzini@redhat.com>
In-Reply-To: <20230407134044.11638-1-pbonzini@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 7 Apr 2023 12:33:45 -0400
Message-ID: <CAJSP0QUdysxU_wBLS0ekFALWJYZJV5f-DTpRa3L9zSRbGe1deg@mail.gmail.com>
Subject: Re: [PATCH] docs: explain effect of smp_read_barrier_depends() on
 modern architectures
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000071092505f8c1975a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000071092505f8c1975a
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 7, 2023, 09:41 Paolo Bonzini <pbonzini@redhat.com> wrote:

> The documentation for smp_read_barrier_depends() does not mention the
> architectures
> for which it is an optimization, for example ARM and PPC.  As a result, it
> is not
> clear to the reader why one would use it.  Relegate Alpha to a footnote
> together
> with other architectures where it is equivalent to smp_rmb().
>
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/devel/atomics.rst | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>

Modulo the typo that Peter mentioned:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

diff --git a/docs/devel/atomics.rst b/docs/devel/atomics.rst
> index 2157d3312956..8f6273c9283e 100644
> --- a/docs/devel/atomics.rst
> +++ b/docs/devel/atomics.rst
> @@ -201,10 +201,9 @@ They come in six kinds:
>    retrieves the address to which the second load will be directed),
>    the processor will guarantee that the first LOAD will appear to happen
>    before the second with respect to the other components of the system.
> -  However, this is not always true---for example, it was not true on
> -  Alpha processors.  Whenever this kind of access happens to shared
> -  memory (that is not protected by a lock), a read barrier is needed,
> -  and ``smp_read_barrier_depends()`` can be used instead of ``smp_rmb()``.
> +  Therefore, unlike ``smp_rmb()`` or ``qatomic_load_acquire()``,
> +  ``smp_read_barrier_depends()`` can be just a compiler barrier on
> +  weakly-ordered architectures such as ARM or PPC[#]_.
>
>    Note that the first load really has to have a _data_ dependency and not
>    a control dependency.  If the address for the second load is dependent
> @@ -212,6 +211,10 @@ They come in six kinds:
>    than actually loading the address itself, then it's a _control_
>    dependency and a full read barrier or better is required.
>
> +.. [#] The DEC Alpha is an exception, because
> ``smp_read_barrier_depends()``
> +   needs a processor barrier.  On strongly-ordered architectures such
> +   as x86 or s390, ``smp_rmb()`` and ``qatomic_load_acquire()`` can
> +   also be a compiler barriers.
>
>  Memory barriers and ``qatomic_load_acquire``/``qatomic_store_release`` are
>  mostly used when a data structure has one thread that is always a writer
> --
> 2.39.2
>
>
>

--00000000000071092505f8c1975a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Apr 7, 2023, 09:41 Paolo Bonzini &lt;<a href=
=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">The documentation for smp_read_barrier_depe=
nds() does not mention the architectures<br>
for which it is an optimization, for example ARM and PPC.=C2=A0 As a result=
, it is not<br>
clear to the reader why one would use it.=C2=A0 Relegate Alpha to a footnot=
e together<br>
with other architectures where it is equivalent to smp_rmb().<br>
<br>
Suggested-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" ta=
rget=3D"_blank" rel=3D"noreferrer">stefanha@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0docs/devel/atomics.rst | 11 +++++++----<br>
=C2=A01 file changed, 7 insertions(+), 4 deletions(-)<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Modulo the typo that P=
eter mentioned:</div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed=
-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@re=
dhat.com</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
diff --git a/docs/devel/atomics.rst b/docs/devel/atomics.rst<br>
index 2157d3312956..8f6273c9283e 100644<br>
--- a/docs/devel/atomics.rst<br>
+++ b/docs/devel/atomics.rst<br>
@@ -201,10 +201,9 @@ They come in six kinds:<br>
=C2=A0 =C2=A0retrieves the address to which the second load will be directe=
d),<br>
=C2=A0 =C2=A0the processor will guarantee that the first LOAD will appear t=
o happen<br>
=C2=A0 =C2=A0before the second with respect to the other components of the =
system.<br>
-=C2=A0 However, this is not always true---for example, it was not true on<=
br>
-=C2=A0 Alpha processors.=C2=A0 Whenever this kind of access happens to sha=
red<br>
-=C2=A0 memory (that is not protected by a lock), a read barrier is needed,=
<br>
-=C2=A0 and ``smp_read_barrier_depends()`` can be used instead of ``smp_rmb=
()``.<br>
+=C2=A0 Therefore, unlike ``smp_rmb()`` or ``qatomic_load_acquire()``,<br>
+=C2=A0 ``smp_read_barrier_depends()`` can be just a compiler barrier on<br=
>
+=C2=A0 weakly-ordered architectures such as ARM or PPC[#]_.<br>
<br>
=C2=A0 =C2=A0Note that the first load really has to have a _data_ dependenc=
y and not<br>
=C2=A0 =C2=A0a control dependency.=C2=A0 If the address for the second load=
 is dependent<br>
@@ -212,6 +211,10 @@ They come in six kinds:<br>
=C2=A0 =C2=A0than actually loading the address itself, then it&#39;s a _con=
trol_<br>
=C2=A0 =C2=A0dependency and a full read barrier or better is required.<br>
<br>
+.. [#] The DEC Alpha is an exception, because ``smp_read_barrier_depends()=
``<br>
+=C2=A0 =C2=A0needs a processor barrier.=C2=A0 On strongly-ordered architec=
tures such<br>
+=C2=A0 =C2=A0as x86 or s390, ``smp_rmb()`` and ``qatomic_load_acquire()`` =
can<br>
+=C2=A0 =C2=A0also be a compiler barriers.<br>
<br>
=C2=A0Memory barriers and ``qatomic_load_acquire``/``qatomic_store_release`=
` are<br>
=C2=A0mostly used when a data structure has one thread that is always a wri=
ter<br>
-- <br>
2.39.2<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000071092505f8c1975a--

