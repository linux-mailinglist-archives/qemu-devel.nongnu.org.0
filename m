Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42738321219
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:37:44 +0100 (CET)
Received: from localhost ([::1]:50628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6it-0000ZP-BE
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lE6ew-00026B-F9
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:33:38 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:42741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lE6eu-0000wD-DM
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 03:33:38 -0500
Received: by mail-ot1-x333.google.com with SMTP id e45so1975996ote.9
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 00:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DDP0Qk0cN5e18t3igZg9au/7WuJ7vtl5e/4MQf8x/uA=;
 b=EV7VPHPEQUQi35esRZgRVsEE1aCjrmCPiEuS6PI5mAuriIjlpeZGPH893QJpIc4MvH
 DVS6UBS70Afp2+6fj7ZxIx3IDVkCKOXppZMRjZBR9Rf59Mw6VsKGytI+h9oh+AX1mi1n
 bZViopfsin3klSiPq/FNNgt8A3O1S9FZxXw4xo+IR7q+K6kdCoyEH6lrP95KdVaGYexa
 SkQN4RsqfImw55rNSHnC6cCcIcPworEI4zzrX65nIT+HYf3pubt07sgXdfmBp3XfcrnV
 jeg3fI1LkcnqSwdX6MOvxlWbfciK0pDczkf661CrIBZbUviLQybG6WDaXLprorfWTkIM
 ysPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DDP0Qk0cN5e18t3igZg9au/7WuJ7vtl5e/4MQf8x/uA=;
 b=RigtujpAYzOFI7BVgrMMpZXdX9QxHbFuBIYRW382sSQNEdcOabsmuz0yIeOdcgwPJe
 yBlEPzJRDeYyBDpaxXzfb8ZTAWg1pXLFK8QAswvdaEKRtDuzU2X6/VF6xdsrLUiernCQ
 CTfEbM3ppsMWqwfG1bkcxZgh2h0Lzl+RwuIHudmVf0sl0wTbIVV4DJTZ/br5G5wk5isq
 RgcMRaqUOqP0ZfT7X4SVnahKIx3g+REGaLjvdRKqyk6UWAPIbdA//laHi1fo2TSVthsZ
 9RtDs7AR1mbVkaEDXyuYHLPNFHlOby3vXVPAMN8mMQBpobmO7loPnlpo87Dq7eYgd7nL
 Xa6w==
X-Gm-Message-State: AOAM5302pyMQVy5TCGv38gOUXti/i8yq8UiEKiS96vTsc1c3P7kfgkCW
 rD8rSET8dKztkAjAezoXNWsxuTaTn6EIDtfz7vA=
X-Google-Smtp-Source: ABdhPJwb1qPfgrjuHzCUwZi5Rew2PDzgK8UfNodqScjISrVUkHgOd0/0Z6ep3PU07NnPu1V7Zc0+j87p7Jmszvg+MMU=
X-Received: by 2002:a9d:4b16:: with SMTP id q22mr7717648otf.44.1613982813202; 
 Mon, 22 Feb 2021 00:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20210122180029.575284-1-cohuck@redhat.com>
 <20210129162719.7438dea2.cohuck@redhat.com>
 <20210208181745.1ac08f12.cohuck@redhat.com>
 <29651c01-6e9d-c7ef-def8-96dc75b00a3a@redhat.com>
 <a8e4d6ee-cc78-75d8-d626-705477dfd134@redhat.com>
In-Reply-To: <a8e4d6ee-cc78-75d8-d626-705477dfd134@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Mon, 22 Feb 2021 10:33:20 +0200
Message-ID: <CAC_L=vVoqVdetQfxDdvb=v9einKj+mhNs=p7Vybh1D6OgR1FvQ@mail.gmail.com>
Subject: Re: [PATCH RFC] pvrdma: wean code off pvrdma_ring.h kernel header
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000412a7e05bbe8a8d2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x333.google.com
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
Cc: qemu devel list <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000412a7e05bbe8a8d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jason.

On Tue, Feb 9, 2021 at 5:47 AM Jason Wang <jasowang@redhat.com> wrote:

>
> On 2021/2/9 =E4=B8=8A=E5=8D=881:28, Paolo Bonzini wrote:
> > On 08/02/21 18:17, Cornelia Huck wrote:
> >> On Fri, 29 Jan 2021 16:27:19 +0100
> >> Cornelia Huck <cohuck@redhat.com> wrote:
> >>
> >>> On Fri, 22 Jan 2021 19:00:29 +0100
> >>> Cornelia Huck <cohuck@redhat.com> wrote:
> >>>
> >>>> The pvrdma code relies on the pvrdma_ring.h kernel header for some
> >>>> basic ring buffer handling. The content of that header isn't very
> >>>> exciting, but contains some (q)atomic_*() invocations that (a)
> >>>> cause manual massaging when doing a headers update, and (b) are
> >>>> an indication that we probably should not be importing that header
> >>>> at all.
> >>>>
> >>>> Let's reimplement the ring buffer handling directly in the pvrdma
> >>>> code instead. This arguably also improves readability of the code.
> >>>>
> >>>> Importing the header can now be dropped.
> >>>>
> >>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >>>> ---
> >>>>
> >>>> Compile-tested only, needs both testing and more eyeballs :)
> >>>
> >>> Friendly ping :)
> >>>
> >>> Suggestions for a test setup to do some sanity checks (that does not
> >>> require special hardware) also welcome.
> >>
> >> Can I interest anyone in this? I'd be happy doing sanity tests myself,
> >> but I have a hard time figuring out even where to start...
> >
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > Jason, Michael, are you going to pick this up?
> >
> > Paolo
>
>
> I will queue this.
>


Have you picked it up? It will be great so I'll not send a PR with a single
patch...
BTW, Yuval tested and acked the patch.

Thanks,
Marcel

[...]


>
>

--000000000000412a7e05bbe8a8d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Jason.</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 9, 2021 at 5:47 AM J=
ason Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br=
>
On 2021/2/9 =E4=B8=8A=E5=8D=881:28, Paolo Bonzini wrote:<br>
&gt; On 08/02/21 18:17, Cornelia Huck wrote:<br>
&gt;&gt; On Fri, 29 Jan 2021 16:27:19 +0100<br>
&gt;&gt; Cornelia Huck &lt;<a href=3D"mailto:cohuck@redhat.com" target=3D"_=
blank">cohuck@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; On Fri, 22 Jan 2021 19:00:29 +0100<br>
&gt;&gt;&gt; Cornelia Huck &lt;<a href=3D"mailto:cohuck@redhat.com" target=
=3D"_blank">cohuck@redhat.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The pvrdma code relies on the pvrdma_ring.h kernel header =
for some<br>
&gt;&gt;&gt;&gt; basic ring buffer handling. The content of that header isn=
&#39;t very<br>
&gt;&gt;&gt;&gt; exciting, but contains some (q)atomic_*() invocations that=
 (a)<br>
&gt;&gt;&gt;&gt; cause manual massaging when doing a headers update, and (b=
) are<br>
&gt;&gt;&gt;&gt; an indication that we probably should not be importing tha=
t header<br>
&gt;&gt;&gt;&gt; at all.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Let&#39;s reimplement the ring buffer handling directly in=
 the pvrdma<br>
&gt;&gt;&gt;&gt; code instead. This arguably also improves readability of t=
he code.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Importing the header can now be dropped.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Cornelia Huck &lt;<a href=3D"mailto:cohuck@=
redhat.com" target=3D"_blank">cohuck@redhat.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Compile-tested only, needs both testing and more eyeballs =
:)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Friendly ping :)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Suggestions for a test setup to do some sanity checks (that do=
es not<br>
&gt;&gt;&gt; require special hardware) also welcome.<br>
&gt;&gt;<br>
&gt;&gt; Can I interest anyone in this? I&#39;d be happy doing sanity tests=
 myself,<br>
&gt;&gt; but I have a hard time figuring out even where to start...<br>
&gt;<br>
&gt; Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" =
target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Jason, Michael, are you going to pick this up?<br>
&gt;<br>
&gt; Paolo<br>
<br>
<br>
I will queue this.<br></blockquote><div><br></div><div><br></div><div>Have =
you picked it up? It will be great so I&#39;ll not send a PR with a single =
patch...</div><div>BTW, Yuval tested and acked the patch.</div><div><br></d=
iv><div>Thanks,</div><div>Marcel</div><div><br></div><div>[...]</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br></blockqu=
ote></div></div>

--000000000000412a7e05bbe8a8d2--

