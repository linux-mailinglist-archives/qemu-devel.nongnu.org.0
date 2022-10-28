Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE37612093
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 07:35:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooeU4-0002ay-4z; Sat, 29 Oct 2022 01:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olekstysh@gmail.com>)
 id 1ooVwD-000169-KV
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 16:26:45 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <olekstysh@gmail.com>)
 id 1ooVwA-0005nJ-Dl
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 16:26:45 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b185so5705706pfb.9
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 13:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OXDBbwRSJNCji3jISCvGg1G1iOkeozCcaMRPzPzWFQ8=;
 b=doIPLx0kLWCXHT8iMjLNP+JtDUAVuJgmQ7CzhU8FcE+H8nw0CedGgn3AYpi9MWDo0K
 jmavq23FhbbM7zbsVYWuhF0SQI1grfrQsoXdR6tF1rHiD44jMhudTwV5O8B8uYVuxX3p
 4h3O6veHniM2trJPG0MEOnrGCRCA1wozEnfAvKNBx9hxfIPCDhetrXsoPgQBk2Fk7ios
 /aWTEr7mMeTjm7+xps0/u9zzKeofLYPhz6ZICK4nScoPq9BPrfyQ0X15kLK9QwM5KTD2
 hTVCw4S/nwSLKIOtPTVEc7Og8EJejLv4ADR+jbZdjKPyiaBfUfehA2kq5lQyOskl8b/9
 eVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OXDBbwRSJNCji3jISCvGg1G1iOkeozCcaMRPzPzWFQ8=;
 b=36qkNGjQK98MVHqrtleyQztdd+fzsj0HpzPA1eHKziDH+sWuhVKahWprlLqsmMoB5c
 H5sDzkP07nKyixY8cmJbZqXS7pFtQTWrenfnFmlJt+BTd/XxmodtbyqRfj+jNbMTQkkm
 QSErUI06NbaimYKnIG41nJCZ9YgK5ATvTBGl+BYjR13JtkgQBA3QMTxw4Xx0oagp/elj
 eOO433kz9/iV8CHkiZIHCCDxyIDeEwLGMqxFTZUCOVy86v7PUU/ab/8HqnV344HV6bfc
 5SorAfGdKU+Oj7q+IfcbIxGWcR9nRtpz1e9gk9El1CqJBcjRuwgi779N45bEFmmbG0jN
 2KyQ==
X-Gm-Message-State: ACrzQf2STqr4zSVTFPuZebkGEjTveo+MpbopCPypCDeFFmfUcd8LiHJ4
 NNguIKkdhOc8JjYjAe2ia5rmIZ18eKpAEGeSgsI=
X-Google-Smtp-Source: AMsMyM4zrYEfDDYckj6NMgHQPAC9dscffKiIflNN9hjZpznv/3MPmKl0sySmXt0fxy8wzOwgRVaaaWMbP6g0SMgLJ0Y=
X-Received: by 2002:a63:e806:0:b0:44b:d45b:b8a2 with SMTP id
 s6-20020a63e806000000b0044bd45bb8a2mr1147699pgh.14.1666988799900; Fri, 28 Oct
 2022 13:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-10-vikram.garhwal@amd.com>
 <87pmed1uww.fsf@linaro.org>
In-Reply-To: <87pmed1uww.fsf@linaro.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Fri, 28 Oct 2022 23:26:28 +0300
Message-ID: <CAPD2p-=gTqAevPi8-Tq_wkbd+PeVgnLLergmJVLh_eE2HumbGA@mail.gmail.com>
Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export
 xenstore_record_dm_state
To: Vikram Garhwal <vikram.garhwal@amd.com>, stefano.stabellini@amd.com
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004340f305ec1e135c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=olekstysh@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 29 Oct 2022 00:27:05 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000004340f305ec1e135c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 12:24 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:

Hello all



> Vikram Garhwal <vikram.garhwal@amd.com> writes:
>
> > xenstore_record_dm_state() will also be used in aarch64 xenpv machine.
> >
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> >  accel/xen/xen-all.c  | 2 +-
> >  include/hw/xen/xen.h | 2 ++
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> > index 69aa7d018b..276625b78b 100644
> > --- a/accel/xen/xen-all.c
> > +++ b/accel/xen/xen-all.c
> > @@ -100,7 +100,7 @@ void xenstore_store_pv_console_info(int i, Chardev
> *chr)
> >  }
> >
> >
> > -static void xenstore_record_dm_state(struct xs_handle *xs, const char
> *state)
> > +void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
> >  {
> >      char path[50];
> >
> > diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> > index afdf9c436a..31e9538a5c 100644
> > --- a/include/hw/xen/xen.h
> > +++ b/include/hw/xen/xen.h
> > @@ -9,6 +9,7 @@
> >   */
> >
> >  #include "exec/cpu-common.h"
> > +#include <xenstore.h>
>
> This is breaking a bunch of the builds and generally we try and avoid
> adding system includes in headers (apart from osdep.h) for this reason.
> In fact there is a comment just above to that fact.
>
> I think you can just add struct xs_handle to typedefs.h (or maybe just
> xen.h) and directly include xenstore.h in xen-all.c following the usual
> rules:
>
>
> https://qemu.readthedocs.io/en/latest/devel/style.html#include-directives
>
> It might be worth doing an audit to see what else is including xen.h
> needlessly or should be using sysemu/xen.h.
>
> >
> >  /* xen-machine.c */
> >  enum xen_mode {
> > @@ -31,5 +32,6 @@ qemu_irq *xen_interrupt_controller_init(void);
> >  void xenstore_store_pv_console_info(int i, Chardev *chr);
> >
> >  void xen_register_framebuffer(struct MemoryRegion *mr);
> > +void xenstore_record_dm_state(struct xs_handle *xs, const char *state)=
;
> >
> >  #endif /* QEMU_HW_XEN_H */
>
>
> --
> Alex Benn=C3=A9e
>
>

For considering:
I think this patch and some other changes done in "[PATCH v1 10/12] hw/arm:
introduce xenpv machine" (the opening of Xen interfaces and
calling xenstore_record_dm_state() in hw/arm/xen_arm.c:xen_init_ioreq())
could be avoided if we enable the Xen accelerator (either by passing "-M
xenpv,accel=3Dxen" or by adding mc->default_machine_opts =3D "accel=3Dxen";
to hw/arm/xen_arm.c:xen_arm_machine_class_init() or by some other method).
These actions are already done in accel/xen/xen-all.c:xen_init(). Please
note, that I am not too familiar with that code, so there might be nuances.

Besides that, Xen accelerator will be needed for the xen-mapcache to be in
use (this is needed for mapping guest memory), there are a few
xen_enabled() checks spreading around that code to perform Xen specific
actions.

--=20
Regards,

Oleksandr Tyshchenko

--0000000000004340f305ec1e135c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 27, 2022 at 12:24 PM Alex=
 Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blank=
">alex.bennee@linaro.org</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"=
gmail_attr"><br></div><div class=3D"gmail_attr">Hello all</div><div dir=3D"=
ltr" class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Vikram Garhwal &lt;<a href=3D"mailto:vikram.garhwal@amd.com" target=3D"_bla=
nk">vikram.garhwal@amd.com</a>&gt; writes:<br>
<br>
&gt; xenstore_record_dm_state() will also be used in aarch64 xenpv machine.=
<br>
&gt;<br>
&gt; Signed-off-by: Vikram Garhwal &lt;<a href=3D"mailto:vikram.garhwal@amd=
.com" target=3D"_blank">vikram.garhwal@amd.com</a>&gt;<br>
&gt; Signed-off-by: Stefano Stabellini &lt;<a href=3D"mailto:stefano.stabel=
lini@amd.com" target=3D"_blank">stefano.stabellini@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 accel/xen/xen-all.c=C2=A0 | 2 +-<br>
&gt;=C2=A0 include/hw/xen/xen.h | 2 ++<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c<br>
&gt; index 69aa7d018b..276625b78b 100644<br>
&gt; --- a/accel/xen/xen-all.c<br>
&gt; +++ b/accel/xen/xen-all.c<br>
&gt; @@ -100,7 +100,7 @@ void xenstore_store_pv_console_info(int i, Chardev=
 *chr)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -static void xenstore_record_dm_state(struct xs_handle *xs, const char=
 *state)<br>
&gt; +void xenstore_record_dm_state(struct xs_handle *xs, const char *state=
)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char path[50];<br>
&gt;=C2=A0 <br>
&gt; diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h<br>
&gt; index afdf9c436a..31e9538a5c 100644<br>
&gt; --- a/include/hw/xen/xen.h<br>
&gt; +++ b/include/hw/xen/xen.h<br>
&gt; @@ -9,6 +9,7 @@<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;exec/cpu-common.h&quot;<br>
&gt; +#include &lt;xenstore.h&gt;<br>
<br>
This is breaking a bunch of the builds and generally we try and avoid<br>
adding system includes in headers (apart from osdep.h) for this reason.<br>
In fact there is a comment just above to that fact.<br>
<br>
I think you can just add struct xs_handle to typedefs.h (or maybe just<br>
xen.h) and directly include xenstore.h in xen-all.c following the usual<br>
rules:<br>
<br>
=C2=A0 <a href=3D"https://qemu.readthedocs.io/en/latest/devel/style.html#in=
clude-directives" rel=3D"noreferrer" target=3D"_blank">https://qemu.readthe=
docs.io/en/latest/devel/style.html#include-directives</a><br>
<br>
It might be worth doing an audit to see what else is including xen.h<br>
needlessly or should be using sysemu/xen.h. <br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* xen-machine.c */<br>
&gt;=C2=A0 enum xen_mode {<br>
&gt; @@ -31,5 +32,6 @@ qemu_irq *xen_interrupt_controller_init(void);<br>
&gt;=C2=A0 void xenstore_store_pv_console_info(int i, Chardev *chr);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void xen_register_framebuffer(struct MemoryRegion *mr);<br>
&gt; +void xenstore_record_dm_state(struct xs_handle *xs, const char *state=
);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #endif /* QEMU_HW_XEN_H */<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
<br></blockquote><div><br></div><div><br></div><div>For considering:</div><=
div>I think this patch and some other changes done in &quot;[PATCH v1 10/12=
] hw/arm: introduce xenpv machine&quot; (the opening of Xen interfaces and =
calling=C2=A0xenstore_record_dm_state() in hw/arm/xen_arm.c:xen_init_ioreq(=
))</div><div>could be avoided if we enable the Xen accelerator (either by p=
assing &quot;-M xenpv,accel=3Dxen&quot; or by adding mc-&gt;default_machine=
_opts =3D &quot;accel=3Dxen&quot;; to=C2=A0hw/arm/xen_arm.c:xen_arm_machine=
_class_init() or by some other method).<br></div><div>These actions are alr=
eady done in=C2=A0accel/xen/xen-all.c:xen_init(). Please note, that I am no=
t too familiar with that code, so there might be nuances.=C2=A0<br></div><d=
iv><br></div>Besides that, Xen accelerator will be needed for the xen-mapca=
che to be in use (this is needed for mapping guest memory), there are a few=
 xen_enabled() checks=C2=A0spreading around that code to perform Xen specif=
ic actions.</div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=3D"background-color:r=
gb(255,255,255)"><font size=3D"2"><span style=3D"color:rgb(51,51,51);font-f=
amily:Arial,sans-serif">Regards,</span></font></span></div><div dir=3D"ltr"=
><br></div><div dir=3D"ltr"><div><span style=3D"background-color:rgb(255,25=
5,255)"><font size=3D"2">Oleksandr Tyshchenko</font></span></div></div></di=
v></div></div></div></div></div>

--0000000000004340f305ec1e135c--

