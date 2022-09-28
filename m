Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AD55EE07E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:30:45 +0200 (CEST)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZ1B-0000Sk-HH
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1odW7B-0001Pa-Bn
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:24:39 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:41666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1odW78-0005U0-EM
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:24:37 -0400
Received: by mail-ua1-x92e.google.com with SMTP id y20so4585738uao.8
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 05:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=i92/cIWh7SKXYu37gx74Le2GBk1TlkkmSW8QU16LTks=;
 b=c6lw4rsuPPRSKPo4lA7bVOXYcLDbcRqNCY2GajmkaZIEovNP5HAQShMgWHP0CJfOE5
 Ufdg0+Or8wAN1MXsN4dtViWI6FKKT+LQmzKTRJIWpeDpDAemBG1Y4x2LtRq3k2MpoUGe
 hZJTDixVVcTJ3Ke6RQOSVWluvpaSqUt2iWrONTOes5zzuF3Nja/goo8FOKhaboisTwoj
 vfSt0jKAncboUafRYAxMM9V/FCnGonyzKMVoNDYA3YzAcZRE5Yq4IT+XPycRxjb0+Oop
 XlrPwQHUj+HpuZzhAVMrkr+wk3fJfaL/r34CKFV1pcK9g5NtG8qFzw5Q6piGIGQHz2jd
 E7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=i92/cIWh7SKXYu37gx74Le2GBk1TlkkmSW8QU16LTks=;
 b=jnEYXtKeiClDixnF/v6i0pwFgRD6yndUr+ZhxEBgwNQwxActKAwUBB4RuU3EfOde5p
 G0su+EPhhvudBjIJuP0qiTN1RbohPBjZu+Fg1X4ggoHGso4cjGh59LoAPXHm7wEXljhn
 8GIkMJJfpYHrI42I+fpQfLVfImk9Z/eutAzhwRYPg/Kh/twOof7FMZzfEvRV9VND/2JW
 0ut2tTs+D9WtjwatCb5dIptwqXnMbZ+rzaK3aHQfRyU8ThTNiMElg4XWKORhdeLYJjBz
 x+hxDY8qGP4t03HcvM3dVvOf/EKO4czyiDOcX+7T6upChG8VMrFda8O6xm0mwv8sifT3
 8T3Q==
X-Gm-Message-State: ACrzQf1q5oB3B2FcF+1br3rLwGwZqeyoyo7g5VXWKgaBhMYBOx54QNU+
 lou0AKcIfiGtQ5rhHqarwD+gcom3KTZgBAInTa4=
X-Google-Smtp-Source: AMsMyM69LEyQ4X5kGXlpZ9zn/Ms6PQRD+JgXkZNwZR7Q+qXnT/ITSfhNOvOG8ASMp0fvToiw7UVkhLju6tIm6d+PiqU=
X-Received: by 2002:ab0:a8f:0:b0:3d0:6ea6:e030 with SMTP id
 d15-20020ab00a8f000000b003d06ea6e030mr5107362uak.86.1664367871150; Wed, 28
 Sep 2022 05:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220926095509.3759409-1-kraxel@redhat.com>
 <20220926095509.3759409-14-kraxel@redhat.com>
 <CAJSP0QVoLf_v2xP6GwDzbFg_RDnP5ppM3UZwTN3XAWPcv6cFCQ@mail.gmail.com>
In-Reply-To: <CAJSP0QVoLf_v2xP6GwDzbFg_RDnP5ppM3UZwTN3XAWPcv6cFCQ@mail.gmail.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Wed, 28 Sep 2022 20:24:20 +0800
Message-ID: <CAAKa2j=2cdYxBFZO1pTJLFcPVb-6R4gnB9zad3rdptfuuo0ixw@mail.gmail.com>
Subject: Re: [PULL 13/25] hcd-ohci: Fix inconsistency when resetting ohci root
 hubs
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexandre Ratchov <alex@caoua.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bc4e7705e9bbd7f0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ua1-x92e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bc4e7705e9bbd7f0
Content-Type: text/plain; charset="UTF-8"

Hi,

I will take over this and fix it

Best,
Qiang

On Tue, Sep 27, 2022 at 9:11 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Mon, 26 Sept 2022 at 06:29, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > From: Qiang Liu <cyruscyliu@gmail.com>
> >
> > I found an assertion failure in usb_cancel_packet() and posted my
> analysis in
> > https://gitlab.com/qemu-project/qemu/-/issues/1180. I think this issue
> is
> > because the inconsistency when resetting ohci root hubs.
> >
> > There are two ways to reset ohci root hubs: 1) through HcRhPortStatus, 2)
> > through HcControl. However, when the packet's status is USB_PACKET_ASYNC,
> > resetting through HcRhPortStatus will complete the packet and thus
> resetting
> > through HcControl will fail. That is because IMO resetting through
> > HcRhPortStatus should first detach the port and then invoked
> usb_device_reset()
> > just like through HcControl. Therefore, I change usb_device_reset() to
> > usb_port_reset() where usb_detach() and usb_device_reset() are invoked
> > consequently.
> >
> > Fixes: d28f4e2d8631 ("usb: kill USB_MSG_RESET")
> > Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1180
> > Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> > Message-Id: <20220830033022.1164961-1-cyruscyliu@gmail.com>
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  hw/usb/hcd-ohci.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> This commit breaks boot-serial-test on ppc64-softmmu.
>
>   $ ./configure --enable-tcg-interpreter
> '--target-list=aarch64-softmmu alpha-softmmu arm-softmmu hppa-softmmu
> m68k-softmmu microblaze-softmmu ppc64-softmmu s390x-softmmu
> x86_64-softmmu'
>   $ make && cd build && QTEST_QEMU_BINARY=./qemu-system-ppc64
> ./tests/qtest/boot-serial-test; cd -
>
> (Yes, the full --target-list is needed because boot-serial-test isn't
> built when only ppc64-softmmu is selected.)
>
> Here is the CI failure:
> https://gitlab.com/qemu-project/qemu/-/jobs/3087540972#L22
>
> Stefan
>
> >
> > diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> > index 72bdde92617c..28d703481515 100644
> > --- a/hw/usb/hcd-ohci.c
> > +++ b/hw/usb/hcd-ohci.c
> > @@ -1436,7 +1436,7 @@ static void ohci_port_set_status(OHCIState *ohci,
> int portnum, uint32_t val)
> >
> >      if (ohci_port_set_if_connected(ohci, portnum, val & OHCI_PORT_PRS))
> {
> >          trace_usb_ohci_port_reset(portnum);
> > -        usb_device_reset(port->port.dev);
> > +        usb_port_reset(&port->port);
> >          port->ctrl &= ~OHCI_PORT_PRS;
> >          /* ??? Should this also set OHCI_PORT_PESC.  */
> >          port->ctrl |= OHCI_PORT_PES | OHCI_PORT_PRSC;
> > --
> > 2.37.3
> >
> >
>

--000000000000bc4e7705e9bbd7f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I will take over this an=
d fix it</div><div><br></div><div>Best,</div><div>Qiang</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 27, 2022=
 at 9:11 AM Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com">stefa=
nha@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Mon, 26 Sept 2022 at 06:29, Gerd Hoffmann &lt;<a href=3D"ma=
ilto:kraxel@redhat.com" target=3D"_blank">kraxel@redhat.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; From: Qiang Liu &lt;<a href=3D"mailto:cyruscyliu@gmail.com" target=3D"=
_blank">cyruscyliu@gmail.com</a>&gt;<br>
&gt;<br>
&gt; I found an assertion failure in usb_cancel_packet() and posted my anal=
ysis in<br>
&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1180" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues=
/1180</a>. I think this issue is<br>
&gt; because the inconsistency when resetting ohci root hubs.<br>
&gt;<br>
&gt; There are two ways to reset ohci root hubs: 1) through HcRhPortStatus,=
 2)<br>
&gt; through HcControl. However, when the packet&#39;s status is USB_PACKET=
_ASYNC,<br>
&gt; resetting through HcRhPortStatus will complete the packet and thus res=
etting<br>
&gt; through HcControl will fail. That is because IMO resetting through<br>
&gt; HcRhPortStatus should first detach the port and then invoked usb_devic=
e_reset()<br>
&gt; just like through HcControl. Therefore, I change usb_device_reset() to=
<br>
&gt; usb_port_reset() where usb_detach() and usb_device_reset() are invoked=
<br>
&gt; consequently.<br>
&gt;<br>
&gt; Fixes: d28f4e2d8631 (&quot;usb: kill USB_MSG_RESET&quot;)<br>
&gt; Reported-by: Qiang Liu &lt;<a href=3D"mailto:cyruscyliu@gmail.com" tar=
get=3D"_blank">cyruscyliu@gmail.com</a>&gt;<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/118=
0" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qem=
u/-/issues/1180</a><br>
&gt; Signed-off-by: Qiang Liu &lt;<a href=3D"mailto:cyruscyliu@gmail.com" t=
arget=3D"_blank">cyruscyliu@gmail.com</a>&gt;<br>
&gt; Message-Id: &lt;<a href=3D"mailto:20220830033022.1164961-1-cyruscyliu@=
gmail.com" target=3D"_blank">20220830033022.1164961-1-cyruscyliu@gmail.com<=
/a>&gt;<br>
&gt; Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" =
target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/usb/hcd-ohci.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
This commit breaks boot-serial-test on ppc64-softmmu.<br>
<br>
=C2=A0 $ ./configure --enable-tcg-interpreter<br>
&#39;--target-list=3Daarch64-softmmu alpha-softmmu arm-softmmu hppa-softmmu=
<br>
m68k-softmmu microblaze-softmmu ppc64-softmmu s390x-softmmu<br>
x86_64-softmmu&#39;<br>
=C2=A0 $ make &amp;&amp; cd build &amp;&amp; QTEST_QEMU_BINARY=3D./qemu-sys=
tem-ppc64<br>
./tests/qtest/boot-serial-test; cd -<br>
<br>
(Yes, the full --target-list is needed because boot-serial-test isn&#39;t<b=
r>
built when only ppc64-softmmu is selected.)<br>
<br>
Here is the CI failure:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/3087540972#L22" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jo=
bs/3087540972#L22</a><br>
<br>
Stefan<br>
<br>
&gt;<br>
&gt; diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c<br>
&gt; index 72bdde92617c..28d703481515 100644<br>
&gt; --- a/hw/usb/hcd-ohci.c<br>
&gt; +++ b/hw/usb/hcd-ohci.c<br>
&gt; @@ -1436,7 +1436,7 @@ static void ohci_port_set_status(OHCIState *ohci=
, int portnum, uint32_t val)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ohci_port_set_if_connected(ohci, portnum, val =
&amp; OHCI_PORT_PRS)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_usb_ohci_port_reset(portnum);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_device_reset(port-&gt;<a href=3D"http=
://port.dev" rel=3D"noreferrer" target=3D"_blank">port.dev</a>);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_port_reset(&amp;port-&gt;port);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port-&gt;ctrl &amp;=3D ~OHCI_PORT_PR=
S;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ??? Should this also set OHCI_POR=
T_PESC.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port-&gt;ctrl |=3D OHCI_PORT_PES | O=
HCI_PORT_PRSC;<br>
&gt; --<br>
&gt; 2.37.3<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000bc4e7705e9bbd7f0--

