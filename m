Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0DB3CEB55
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 21:27:51 +0200 (CEST)
Received: from localhost ([::1]:37178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Yve-0007MK-TL
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 15:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1m5Yur-0006dF-EO
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:27:01 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:42702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1m5Yup-00081b-AX
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:27:01 -0400
Received: by mail-qt1-x82d.google.com with SMTP id w26so13764090qto.9
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 12:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NyPSdJTccPoREQSDXB4QOb3MXZO/y0QqD2aNn4xkYxk=;
 b=Xy//DkIdXu3PTJ196A76DKT5u5zW3H/0O56tT5uE2kPrQ4+ov6U4cEpffhmJftS1Il
 95Z8vHufRFnUhleLzWJ6VfyqFBa15+nsAj0sv7BPPgo9EbY2+CUCmLQ3v2gwBtSrNNW4
 XO67NzXYCCIwgLmXLKCxLiGWrkT5IcmOfD6sSQckaFB21ap6+3yvBrySfykdz6QtPHZI
 GyYjTahnMDwvcNsz6PSayABvXlGKeju88x86hoK5zA6dDyA1P+QKxOKvaWpXj0CTUiKt
 vOeAG8QX5GJCHPzjgIjwrGMWfqQAqrW0Yz/TB8mUiR6/9EYLobBwqbw9nvZaXkQ/aTGT
 FW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NyPSdJTccPoREQSDXB4QOb3MXZO/y0QqD2aNn4xkYxk=;
 b=US9AgkJFj1uYyY6MIs9UXW1kB2HFof8nTdGeehjxGE1RorpMC55KNI0+9UWRBd+zPA
 iHM6Uixb0IKKxX1ty3At1c7jCnDe/fTfHHAVL1HJTovCPPitoCQzA3t6dlifNbvhrZbD
 p+3muFw4NJ3GRqxzAXaYRxet6oIvPm/DTTHLmPLvFu67HCEQf4Sg7Cj/wN+cysKB+vuR
 aKTviNry5IUeD5MBm6hTr+9CJ+5Yp7bF+meZEYe7oKNjfpSM0iDb46C2YF1zhiW5LLH+
 oHVXSx64+f+GBUZvINh2v9lUyAnLp8xaPXi6oyCfv+GfubWWDwUsHX0a0YwlhhAsxM9S
 LY7g==
X-Gm-Message-State: AOAM531CUwnIWBXBIF5GdwWMD1aooWVJhvKTN/eLLtBAyTm7iCFGK9ki
 uR9GNb1E5U6YwBPsbCK0smzjQ708IxkUwrqx9UFKWA==
X-Google-Smtp-Source: ABdhPJyUXg+qIE35qreYgWYDxYQlsGioTGWRu+EpbRQG2yBsKX2o0jnBx1OZTmpPDnCo6diiNnpvISJ5G2o9BjQaj1g=
X-Received: by 2002:ac8:7d44:: with SMTP id h4mr6209817qtb.101.1626722817910; 
 Mon, 19 Jul 2021 12:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210719123732.24457-1-alex.bennee@linaro.org>
 <87im16pfsq.fsf@linaro.org>
 <CANCZdfpsEdupxRPxKt42ki1B0Kckmgu=+m8pXRRFS2J+qDJrTQ@mail.gmail.com>
 <87eebunm6u.fsf@linaro.org>
In-Reply-To: <87eebunm6u.fsf@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 19 Jul 2021 13:26:45 -0600
Message-ID: <CANCZdfpxn7Y8PX5ixqOruQ-kSx4BJzDd9zjSLpxEThv_K-APSQ@mail.gmail.com>
Subject: Re: [RFC PATCH] tcg/plugins: implement a qemu_plugin_user_exit helper
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b5c13105c77eebac"
Received-SPF: none client-ip=2607:f8b0:4864:20::82d;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: minyihh@uci.edu, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, robhenry@microsoft.com,
 Laurent Vivier <laurent@vivier.eu>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Alexandre Iooss <erdnaxe@crans.org>, Chen Qun <kuhn.chenqun@huawei.com>,
 ma.mandourr@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b5c13105c77eebac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021, 1:22 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

>
> Warner Losh <imp@bsdimp.com> writes:
>
> > On Mon, Jul 19, 2021, 7:57 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
> >
> >  Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> >
> >  > In user-mode emulation there is a small race between preexit_cleanup
> >  > and exit_group() which means we may end up calling instrumented
> >  > instructions before the kernel reaps child threads. To solve this we
> >  > implement a new helper which ensures the callbacks are flushed along
> >  > with any translations before we let the host do it's a thing.
> >  >
> >  > While we are at it make the documentation of
> >  > qemu_plugin_register_atexit_cb clearer as to what the user can expec=
t.
> >  >
> >  <snip>
> >  >
> >  > +/*
> >  > + * Handle exit from linux-user. Unlike the normal atexit() mechanis=
m
> >  > + * we need to handle the clean-up manually as it's possible threads
> >  > + * are still running. We need to remove all callbacks from code
> >  > + * generation, flush the current translations and then we can safel=
y
> >  > + * trigger the exit callbacks.
> >  > + */
> >  > +
> >  > +void qemu_plugin_user_exit(void)
> >  > +{
> >  > +    enum qemu_plugin_event ev;
> >  > +
> >  > +    QEMU_LOCK_GUARD(&plugin.lock);
> >  > +
> >  > +    start_exclusive();
> >  > +
> >  > +    /* un-register all callbacks except the final AT_EXIT one */
> >  > +    for (ev =3D 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
> >  > +        if (ev !=3D QEMU_PLUGIN_EV_ATEXIT) {
> >  > +            struct qemu_plugin_ctx *ctx;
> >  > +            QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
> >  > +                plugin_unregister_cb__locked(ctx, ev);
> >  > +            }
> >  > +        }
> >  > +    }
> >  > +
> >  > +    tb_flush(current_cpu);
> >
> >  We also need to disable memory helpers during the exclusive period as
> >  that is another route into a callback:
> >  --8<---------------cut here---------------start------------->8---
> >  modified   plugins/core.c
> >  @@ -498,6 +499,7 @@ void
> qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
> >   void qemu_plugin_user_exit(void)
> >   {
> >       enum qemu_plugin_event ev;
> >  +    CPUState *cpu;
> >
> >       QEMU_LOCK_GUARD(&plugin.lock);
> >
> >  @@ -514,6 +516,11 @@ void qemu_plugin_user_exit(void)
> >       }
> >
> >       tb_flush(current_cpu);
> >  +
> >  +    CPU_FOREACH(cpu) {
> >  +        qemu_plugin_disable_mem_helpers(cpu);
> >  +    }
> >  +
> >       end_exclusive();
> >
> >       /* now it's safe to handle the exit case */
> >  --8<---------------cut here---------------end--------------->8---
> >
> > I think both of these are find from a bsd-user point of view.
>
> Acked-by: or Reviewed-by:?
>

Sorry I wasn't clear.

Acked-by: Warner Losh <imp@bsdimp.com>



> --
> Alex Benn=C3=A9e
>

--000000000000b5c13105c77eebac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jul 19, 2021, 1:22 PM Alex Benn=C3=A9e &lt;<a =
href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><br>
Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank" rel=3D"=
noreferrer">imp@bsdimp.com</a>&gt; writes:<br>
<br>
&gt; On Mon, Jul 19, 2021, 7:57 AM Alex Benn=C3=A9e &lt;<a href=3D"mailto:a=
lex.bennee@linaro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@lin=
aro.org</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" t=
arget=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt; writes:<=
br>
&gt;<br>
&gt;=C2=A0 &gt; In user-mode emulation there is a small race between preexi=
t_cleanup<br>
&gt;=C2=A0 &gt; and exit_group() which means we may end up calling instrume=
nted<br>
&gt;=C2=A0 &gt; instructions before the kernel reaps child threads. To solv=
e this we<br>
&gt;=C2=A0 &gt; implement a new helper which ensures the callbacks are flus=
hed along<br>
&gt;=C2=A0 &gt; with any translations before we let the host do it&#39;s a =
thing.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; While we are at it make the documentation of<br>
&gt;=C2=A0 &gt; qemu_plugin_register_atexit_cb clearer as to what the user =
can expect.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &lt;snip&gt;<br>
&gt;=C2=A0 &gt;=C2=A0 <br>
&gt;=C2=A0 &gt; +/*<br>
&gt;=C2=A0 &gt; + * Handle exit from linux-user. Unlike the normal atexit()=
 mechanism<br>
&gt;=C2=A0 &gt; + * we need to handle the clean-up manually as it&#39;s pos=
sible threads<br>
&gt;=C2=A0 &gt; + * are still running. We need to remove all callbacks from=
 code<br>
&gt;=C2=A0 &gt; + * generation, flush the current translations and then we =
can safely<br>
&gt;=C2=A0 &gt; + * trigger the exit callbacks.<br>
&gt;=C2=A0 &gt; + */<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +void qemu_plugin_user_exit(void)<br>
&gt;=C2=A0 &gt; +{<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 enum qemu_plugin_event ev;<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;plugin.lock);<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 start_exclusive();<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 /* un-register all callbacks except the fina=
l AT_EXIT one */<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 for (ev =3D 0; ev &lt; QEMU_PLUGIN_EV_MAX; e=
v++) {<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ev !=3D QEMU_PLUGIN_EV_ATE=
XIT) {<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct qemu_plug=
in_ctx *ctx;<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_FOREACH(c=
tx, &amp;plugin.ctxs, entry) {<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl=
ugin_unregister_cb__locked(ctx, ev);<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 &gt; +<br>
&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 tb_flush(current_cpu);<br>
&gt;<br>
&gt;=C2=A0 We also need to disable memory helpers during the exclusive peri=
od as<br>
&gt;=C2=A0 that is another route into a callback:<br>
&gt;=C2=A0 --8&lt;---------------cut here---------------start-------------&=
gt;8---<br>
&gt;=C2=A0 modified=C2=A0 =C2=A0plugins/core.c<br>
&gt;=C2=A0 @@ -498,6 +499,7 @@ void qemu_plugin_register_atexit_cb(qemu_plu=
gin_id_t id,<br>
&gt;=C2=A0 =C2=A0void qemu_plugin_user_exit(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0enum qemu_plugin_event ev;<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 CPUState *cpu;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU_LOCK_GUARD(&amp;plugin.lock);<br>
&gt;<br>
&gt;=C2=A0 @@ -514,6 +516,11 @@ void qemu_plugin_user_exit(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tb_flush(current_cpu);<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 CPU_FOREACH(cpu) {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_disable_mem_helpers(cpu=
);<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0end_exclusive();<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* now it&#39;s safe to handle the exit case=
 */<br>
&gt;=C2=A0 --8&lt;---------------cut here---------------end---------------&=
gt;8---<br>
&gt;<br>
&gt; I think both of these are find from a bsd-user point of view.<br>
<br>
Acked-by: or Reviewed-by:?<br></blockquote></div></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Sorry I wasn&#39;t clear.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Acked-by: Warner Losh &lt;<a href=3D"mailto:imp=
@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div></div>

--000000000000b5c13105c77eebac--

