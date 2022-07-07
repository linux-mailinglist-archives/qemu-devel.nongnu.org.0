Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39CA56AA3C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 20:07:57 +0200 (CEST)
Received: from localhost ([::1]:57752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Vuu-0002gi-Cf
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 14:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9VsZ-0001UP-IG; Thu, 07 Jul 2022 14:05:31 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:39814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o9VsW-0001YF-B0; Thu, 07 Jul 2022 14:05:30 -0400
Received: by mail-lf1-x130.google.com with SMTP id e12so32467733lfr.6;
 Thu, 07 Jul 2022 11:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Xq1C5DSWQ56ss5XAx6JECykBcbPk9pDXTzZ69DCTOg=;
 b=C01/5pvkhYs2I6JTlvXfoYsoY7O4SE3cCSyP02/gWPbo6Esk6vWpGw4+MvNAb1FvAi
 vl4Gfpmje3azklQiBmw7B66igSL/+PjSbJpex7jzTkAvctFjjw4G7hcHZKkrrsGRDwQZ
 6Aq4p0/sUNqxc4MP7iP5MGbZb5E3/xtA1txwJpNxfSR5BzmWVHqrtbCLkgaP5qnuXFDf
 0pILxK3VNKcuVwZzQyfY7qerzKIDJcLav0vL/DkWyuQy9C6uhSZtrnCgn7U5Up1FEyy0
 Loag07Hi3MqkruxinijZ44iuAAjP9n/bYrDDBe6S0ncKPFezdN7kub+xpitozv1V6qqP
 n9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Xq1C5DSWQ56ss5XAx6JECykBcbPk9pDXTzZ69DCTOg=;
 b=nLGDjpxz/xrZPy+oLoi4ZCPIqrM4TxmLgJYI3iYiX65WVqa7IoERYoN91if6ZNxXo6
 FSbt9Iu6eQsM7DL5nCmQdKWpw3MdvqUaaBKPCXMQ854H6d9Z/vmWjB8I6LgDMg/krBj1
 tECvnkhXzGZLwF2a+qNmLgbQh4OSyytDcOp24QMO0DZRmI0e0cJ7YV7DyJwiuWxfZ3sV
 Budm4jahteZDafwXgNm7Za6KBiLVVPpcytksMdvtKxRKwC4EN47PvK8BVdVzeEcG/0lR
 oNzuCgz12d183aHG0JEUYOV3UsLPWqYQrL/cI5lnzg2Kz0fU+M/HlloAWK32iR1KPgMq
 9ihw==
X-Gm-Message-State: AJIora8+79AzrmR7w4i7WqXO58zL2vwoVJOXoJk9h88pxqsOJi5Rnl3m
 5ceGXC7Iyg84KM3PyIxtaOII0Jx/8azapJWHF/o=
X-Google-Smtp-Source: AGRyM1sDYMZ1Onukv4V4Cdq8gNlItdTWgrDp6SYHkT9ynzBXjSE0y7tOcPVyTEWjnJqp/07mfV567C72Xio2qUx3xtI=
X-Received: by 2002:a05:6512:1193:b0:481:22b3:f198 with SMTP id
 g19-20020a056512119300b0048122b3f198mr29978204lfr.446.1657217126164; Thu, 07
 Jul 2022 11:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-7-marcandre.lureau@redhat.com>
 <87ilo9dsne.fsf@pond.sub.org>
In-Reply-To: <87ilo9dsne.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 7 Jul 2022 22:05:14 +0400
Message-ID: <CAJ+F1CLNa=edp=O8LB=5v-2iChEyYdP7-oa_DtnKDLeC1E3_vw@mail.gmail.com>
Subject: Re: [PATCH 6/9] error-report: add a callback to overwrite
 error_vprintf
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, 
 Kyle Evans <kevans@freebsd.org>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000001eec6505e33aee1c"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001eec6505e33aee1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 7, 2022 at 4:18 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > error_vprintf() is implemented in monitor.c, which overrides the
> > default implementation from stubs/, while avoiding a direct dependency
> > to the monitor from error-report.c.
> >
> > However, the stub solution isn't working when moving error-report.c and
> > stubs/error-printf.c in a common library. Linking with such library
> > creates conflicts for the error_vprintf() implementations
>
> I'm feeling dense today: how?
>

If I try to overwrite a symbol in qemu when linking with a static library
from a subproject, the linker fails:

FAILED: storage-daemon/qemu-storage-daemon
cc -m64 -mcx16  -o storage-daemon/qemu-storage-daemon
storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-introspec=
t.c.o
storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-types.c.o
storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-visit.c.o
storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-commands.=
c.o
storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-init-comm=
ands.c.o
storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-events.c.=
o
storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-emit-even=
ts.c.o
storage-daemon/qemu-storage-daemon.p/qemu-storage-daemon.c.o
-Wl,--as-needed -Wl,--no-undefined -pie -Wl,--whole-archive libblockdev.fa
libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa -Wl,--start-group
libevent-loop-base.a libchardev.fa libqmp.fa -Wl,--no-whole-archive
-Wl,--warn-common -Wl,-z,relro -Wl,-z,now -fstack-protector-strong
-Wl,-rpath,/usr/lib64/iscsi -Wl,-rpath-link,/usr/lib64/iscsi libqemuutil.a
subprojects/libvhost-user/libvhost-user-glib.a
subprojects/libvhost-user/libvhost-user.a
subprojects/qemu-common/libqemu-common.a libblockdev.fa
subprojects/libvduse/libvduse.a libblock.fa libcrypto.fa libauthz.fa
libqom.fa libio.fa libchardev.fa libqmp.fa @block.syms
/usr/lib64/libgnutls.so /usr/lib64/liburing.so /usr/lib64/libgio-2.0.so
/usr/lib64/libgobject-2.0.so /usr/lib64/libglib-2.0.so -Wl,--export-dynamic
-pthread -lgmodule-2.0 -lglib-2.0 -lglib-2.0 -lm /usr/lib64/libpixman-1.so
-lgmodule-2.0 -lglib-2.0 -lglib-2.0 -lgmodule-2.0 -lglib-2.0 -lglib-2.0
-lgmodule-2.0 -lglib-2.0 -lglib-2.0 /usr/lib64/libfuse3.so -lpthread
-lgmodule-2.0 -lglib-2.0 -lglib-2.0 /usr/lib64/libzstd.so
/usr/lib64/libz.so /usr/lib64/iscsi/libiscsi.so -laio -lpam -lutil
-Wl,--end-group
/usr/bin/ld:
subprojects/qemu-common/libqemu-common.a.p/src_error-report.c.o: in
function `error_init':
/home/elmarco/src/qemu/build/../subprojects/qemu-common/src/error-report.c:=
413:
multiple definition of `error_init';
libqmp.fa.p/monitor_qmp.c.o:/home/elmarco/src/qemu/build/../monitor/qmp.c:4=
0:
first defined here

But I can't really explain why it works when overwriting symbols from
libqemuutil.a, I am a bit puzzled here. Am I missing something obvious?
(this is a bit of dark linker magic going on)



> Why would the linker pull in error-printf.o when the symbols it defines
> are already provided by .o the linker processed before the library
> containing error-printf.o?
>
> >                                                           (and weak
> > symbols aren't great either).
>
> Weak symbols are great, except Windows isn't.
>
> >                               Instead, use the "traditional" approach t=
o
> > provide overidable callbacks.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001eec6505e33aee1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 7, 2022 at 4:18 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; error_vprintf() is implemented in monitor.c, which overrides the<br>
&gt; default implementation from stubs/, while avoiding a direct dependency=
<br>
&gt; to the monitor from error-report.c.<br>
&gt;<br>
&gt; However, the stub solution isn&#39;t working when moving error-report.=
c and<br>
&gt; stubs/error-printf.c in a common library. Linking with such library<br=
>
&gt; creates conflicts for the error_vprintf() implementations<br>
<br>
I&#39;m feeling dense today: how?<br></blockquote></div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">If I try to overwrite a symbol=
 in qemu when linking with a static library from a subproject, the linker f=
ails:</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=
FAILED: storage-daemon/qemu-storage-daemon <br>cc -m64 -mcx16 =C2=A0-o stor=
age-daemon/qemu-storage-daemon storage-daemon/qemu-storage-daemon.p/meson-g=
enerated_.._qapi_qapi-introspect.c.o storage-daemon/qemu-storage-daemon.p/m=
eson-generated_.._qapi_qapi-types.c.o storage-daemon/qemu-storage-daemon.p/=
meson-generated_.._qapi_qapi-visit.c.o storage-daemon/qemu-storage-daemon.p=
/meson-generated_.._qapi_qapi-commands.c.o storage-daemon/qemu-storage-daem=
on.p/meson-generated_.._qapi_qapi-init-commands.c.o storage-daemon/qemu-sto=
rage-daemon.p/meson-generated_.._qapi_qapi-events.c.o storage-daemon/qemu-s=
torage-daemon.p/meson-generated_.._qapi_qapi-emit-events.c.o storage-daemon=
/qemu-storage-daemon.p/qemu-storage-daemon.c.o -Wl,--as-needed -Wl,--no-und=
efined -pie -Wl,--whole-archive libblockdev.fa libblock.fa libcrypto.fa lib=
authz.fa libqom.fa libio.fa -Wl,--start-group libevent-loop-base.a libchard=
ev.fa libqmp.fa -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relro -Wl,-=
z,now -fstack-protector-strong -Wl,-rpath,/usr/lib64/iscsi -Wl,-rpath-link,=
/usr/lib64/iscsi libqemuutil.a subprojects/libvhost-user/libvhost-user-glib=
.a subprojects/libvhost-user/libvhost-user.a subprojects/qemu-common/libqem=
u-common.a libblockdev.fa subprojects/libvduse/libvduse.a libblock.fa libcr=
ypto.fa libauthz.fa libqom.fa libio.fa libchardev.fa libqmp.fa @block.syms =
/usr/lib64/libgnutls.so /usr/lib64/liburing.so /usr/lib64/<a href=3D"http:/=
/libgio-2.0.so">libgio-2.0.so</a> /usr/lib64/<a href=3D"http://libgobject-2=
.0.so">libgobject-2.0.so</a> /usr/lib64/<a href=3D"http://libglib-2.0.so">l=
ibglib-2.0.so</a> -Wl,--export-dynamic -pthread -lgmodule-2.0 -lglib-2.0 -l=
glib-2.0 -lm /usr/lib64/libpixman-1.so -lgmodule-2.0 -lglib-2.0 -lglib-2.0 =
-lgmodule-2.0 -lglib-2.0 -lglib-2.0 -lgmodule-2.0 -lglib-2.0 -lglib-2.0 /us=
r/lib64/libfuse3.so -lpthread -lgmodule-2.0 -lglib-2.0 -lglib-2.0 /usr/lib6=
4/libzstd.so /usr/lib64/libz.so /usr/lib64/iscsi/libiscsi.so -laio -lpam -l=
util -Wl,--end-group<br>/usr/bin/ld: subprojects/qemu-common/libqemu-common=
.a.p/src_error-report.c.o: in function `error_init&#39;:<br>/home/elmarco/s=
rc/qemu/build/../subprojects/qemu-common/src/error-report.c:413: multiple d=
efinition of `error_init&#39;; libqmp.fa.p/monitor_qmp.c.o:/home/elmarco/sr=
c/qemu/build/../monitor/qmp.c:40: first defined here</div><div class=3D"gma=
il_quote"><br><div>But I can&#39;t really explain why it works when overwri=
ting symbols from libqemuutil.a, I am a bit puzzled here. Am I missing some=
thing obvious? (this is a bit of dark linker magic going on)<br></div><div>=
<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Why would the linker pull in error-printf.o when the symbols it defines<br>
are already provided by .o the linker processed before the library<br>
containing error-printf.o?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(and weak=
<br>
&gt; symbols aren&#39;t great either).<br>
<br>
Weak symbols are great, except Windows isn&#39;t.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Instead, use the &quot;traditional=
&quot; approach to<br>
&gt; provide overidable callbacks.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001eec6505e33aee1c--

