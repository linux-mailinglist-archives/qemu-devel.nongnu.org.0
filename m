Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1473737A2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:36:22 +0200 (CEST)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDx7-000485-JR
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leDuK-00023M-A4
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:33:28 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leDuG-000397-W4
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:33:28 -0400
Received: by mail-ed1-x535.google.com with SMTP id u13so1192497edd.3
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8osYa+C3XZmCnf246NQToaihMXNYNQuBlWsWnVx3UXA=;
 b=cBMXWmbExzKqOv6zU/FgyJ10o9mePmzeR7v7525SjPPyKnPhYTwveArsHvi8HgsXd7
 kPv4bWEw9V3yIeXIuYuhMPeMeQfndsMwh3qWy9CnjubH6qkqfGxre+DhawXSqSQd+0Pt
 kIkoA8kfdXIbVqYYMhz2/XReZq2lODzAOM/SLgLQNxEn01r5Im+ScZfqTEGYHeSAAlxG
 i9Uu+xrsgzBUQRSfdQSG3EKTAAFSx+dBN/mWQ1cwfzj7N7td94Pf7yxnXhOTa2tdt7JI
 3bmlPEz0qc/4p48r6uxqmNXZS8QjdnIk8oUig1DYAct7iEwGcXgAUbJ4d2haszolw5BW
 U5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8osYa+C3XZmCnf246NQToaihMXNYNQuBlWsWnVx3UXA=;
 b=d+y72S2PnhKGfZYdJ9nPNZVMULy8ioFovd5x+QXTzVNHFi5AHzXVhtMApayYY3kVyA
 3yHAbvf2Rjh2OLCxE45XlAy2AlpA7wP7a6h68SHzxQ5jJLnaOl/yDIrYy1aQs0iYfu2S
 KWuI6cx1aZ9K13h+tGzRwuOM3qaGOgKfBTDcyhgSfC3SKcv2wpa2PLXv4yXT4rjB/1uK
 2XRQnuuauOxnQVyJ/KtnEwBgZnSam8wEFI65zn2QBT3tvw19fUZbzRJ+N20HgRy3RUt/
 7F4WSKeE9XmXjgiGVQ4gxV5iYnc8oCjMRx59ardA5JIe+uGUn1n0jfGWHk7SaMWvA+BR
 4tww==
X-Gm-Message-State: AOAM533HrMySJiNlhSWqd/bnhY7MPl026dx+nWdUBcbVXdh+KE3UDHFl
 xBVOe/rO2mvaDAMHIMskyi/z/QJayGe3KgBJOMU=
X-Google-Smtp-Source: ABdhPJyZEdaGFqPK4JoDgEgfc22nDYF+PlYt18ZrXe4rWicQi48OOtXwDeTzp2kw6cpya/UvQH8stUcEgkIoRGLwYmg=
X-Received: by 2002:aa7:dd4d:: with SMTP id o13mr31792055edw.53.1620207203017; 
 Wed, 05 May 2021 02:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-7-liq3ea@163.com>
 <qq3n3949-n544-no21-649q-rqq0r7569n19@erqung.pbz>
 <CAJ+F1CL0Wz88FgUT-SYJMZdXKzgnYUdv3SsHPEstz9uSyqvTrQ@mail.gmail.com>
 <CAKXe6SLmbnmBs2NhyP=8Vm51wQXxFKW9m2XAYYcVTb3dpmEsYg@mail.gmail.com>
In-Reply-To: <CAKXe6SLmbnmBs2NhyP=8Vm51wQXxFKW9m2XAYYcVTb3dpmEsYg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 5 May 2021 13:33:10 +0400
Message-ID: <CAJ+F1C+j1VJjkgx49eTQmya07jxS0vSDivnrqduuZkMA8SkNmA@mail.gmail.com>
Subject: Re: [PATCH 6/7] vhost-user-gpu: fix memory leak in
 'virgl_resource_attach_backing'
To: Li Qiang <liq3ea@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000cc677c05c191e242"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Li Qiang <liq3ea@163.com>,
 Gerd Hoffmann <kraxel@redhat.com>, P J P <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cc677c05c191e242
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 5, 2021 at 1:24 PM Li Qiang <liq3ea@gmail.com> wrote:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> =E4=BA=8E2021=E5=B9=
=B45=E6=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=885:08=E5=86=99=
=E9=81=93=EF=BC=9A
> >
> > Hi
> >
> > On Wed, May 5, 2021 at 12:03 PM P J P <ppandit@redhat.com> wrote:
> >>
> >> +-- On Tue, 4 May 2021, Li Qiang wrote --+
> >> | diff --git a/contrib/vhost-user-gpu/virgl.c
> b/contrib/vhost-user-gpu/virgl.c
> >> | index c669d73a1d..a16a311d80 100644
> >> | --- a/contrib/vhost-user-gpu/virgl.c
> >> | +++ b/contrib/vhost-user-gpu/virgl.c
> >> | @@ -287,8 +287,11 @@ virgl_resource_attach_backing(VuGpu *g,
> >> |          return;
> >> |      }
> >> |
> >> | -    virgl_renderer_resource_attach_iov(att_rb.resource_id,
> >> | +    ret =3D virgl_renderer_resource_attach_iov(att_rb.resource_id,
> >> |                                         res_iovs, att_rb.nr_entries)=
;
> >> | +    if (ret !=3D 0) {
> >> | +        g_free(res_iovs);
> >> | +    }
> >> |  }
> >>
> >> * Similar to earlier,
> >>   hw/display/virtio-gpu-3d.c:virgl_resource_attach_backing() calls
> >>   'virtio_gpu_cleanup_mapping_iov'
> >>
> >> * should it be same for vhost-user-gpu?
> >>
> >>
> >
> > Good question, that's also what you did when you fixed it for virtio-gp=
u
> in:
> >
> > commit 33243031dad02d161225ba99d782616da133f689
> > Author: Li Qiang <liq3ea@gmail.com>
> > Date:   Thu Dec 29 03:11:26 2016 -0500
> >
> >     virtio-gpu-3d: fix memory leak in resource attach backing
> >
>
> Do you mean this;
> -->https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01156.html
>
> I think there is no need for this.
>
> The virtio_gpu_cleanup_mapping_iov is needed in virtio-gpu is because
> it need map guest memory.
> But in vhost-user-gpu case, the 'vg_create_mapping_iov' calls
> 'vu_gpa_to_va' and this function don't need
> do map memory.
>
> But for the beauty of symmetry we can abstract a function called
> 'vg_destroy_mapping_iov' and it just calls g_free(res->iov).
> Like the pair 'virtio_gpu_create_mapping_iov' and
> 'virtio_gpu_cleanup_mapping'.
>
>
Right. I think I like the suggestion to add a 'virtio_gpu_cleanup_mapping'
(with a comment to explain it) to avoid this kind of question again. Feel
free to add a patch on top if you want.

thanks


>
> >
> > Btw, for each patch, it would be nice to have a reference to the
> original fix in virtio-gpu.
> >
> > Thanks!
> >
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000cc677c05c191e242
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 5, 2021 at 1:24 PM Li Q=
iang &lt;<a href=3D"mailto:liq3ea@gmail.com">liq3ea@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_bla=
nk">marcandre.lureau@gmail.com</a>&gt; =E4=BA=8E2021=E5=B9=B45=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=885:08=E5=86=99=E9=81=93=EF=BC=9A<=
br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Wed, May 5, 2021 at 12:03 PM P J P &lt;<a href=3D"mailto:ppandit@re=
dhat.com" target=3D"_blank">ppandit@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; +-- On Tue, 4 May 2021, Li Qiang wrote --+<br>
&gt;&gt; | diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user=
-gpu/virgl.c<br>
&gt;&gt; | index c669d73a1d..a16a311d80 100644<br>
&gt;&gt; | --- a/contrib/vhost-user-gpu/virgl.c<br>
&gt;&gt; | +++ b/contrib/vhost-user-gpu/virgl.c<br>
&gt;&gt; | @@ -287,8 +287,11 @@ virgl_resource_attach_backing(VuGpu *g,<br>
&gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; |=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; |<br>
&gt;&gt; | -=C2=A0 =C2=A0 virgl_renderer_resource_attach_iov(att_rb.resourc=
e_id,<br>
&gt;&gt; | +=C2=A0 =C2=A0 ret =3D virgl_renderer_resource_attach_iov(att_rb=
.resource_id,<br>
&gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0res_iovs, att_rb.nr_entries);<br>
&gt;&gt; | +=C2=A0 =C2=A0 if (ret !=3D 0) {<br>
&gt;&gt; | +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(res_iovs);<br>
&gt;&gt; | +=C2=A0 =C2=A0 }<br>
&gt;&gt; |=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; * Similar to earlier,<br>
&gt;&gt;=C2=A0 =C2=A0hw/display/virtio-gpu-3d.c:virgl_resource_attach_backi=
ng() calls<br>
&gt;&gt;=C2=A0 =C2=A0&#39;virtio_gpu_cleanup_mapping_iov&#39;<br>
&gt;&gt;<br>
&gt;&gt; * should it be same for vhost-user-gpu?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; Good question, that&#39;s also what you did when you fixed it for virt=
io-gpu in:<br>
&gt;<br>
&gt; commit 33243031dad02d161225ba99d782616da133f689<br>
&gt; Author: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.com" target=3D"_bl=
ank">liq3ea@gmail.com</a>&gt;<br>
&gt; Date:=C2=A0 =C2=A0Thu Dec 29 03:11:26 2016 -0500<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0virtio-gpu-3d: fix memory leak in resource attach b=
acking<br>
&gt;<br>
<br>
Do you mean this;<br>
--&gt;<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg0=
1156.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archi=
ve/html/qemu-devel/2021-05/msg01156.html</a><br>
<br>
I think there is no need for this.<br>
<br>
The virtio_gpu_cleanup_mapping_iov is needed in virtio-gpu is because<br>
it need map guest memory.<br>
But in vhost-user-gpu case, the &#39;vg_create_mapping_iov&#39; calls<br>
&#39;vu_gpa_to_va&#39; and this function don&#39;t need<br>
do map memory.<br>
<br>
But for the beauty of symmetry we can abstract a function called<br>
&#39;vg_destroy_mapping_iov&#39; and it just calls g_free(res-&gt;iov).<br>
Like the pair &#39;virtio_gpu_create_mapping_iov&#39; and &#39;virtio_gpu_c=
leanup_mapping&#39;.<br>
<br></blockquote><div><br></div><div>Right. I think I like the suggestion t=
o add a &#39;virtio_gpu_cleanup_mapping&#39; (with a comment to explain it)=
 to avoid this kind of question again. Feel free to add a patch on top if y=
ou want.</div><div><br></div><div>thanks<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Btw, for each patch, it would be nice to have a reference to the origi=
nal fix in virtio-gpu.<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cc677c05c191e242--

