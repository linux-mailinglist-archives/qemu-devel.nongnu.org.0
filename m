Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DCB36631C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 02:40:08 +0200 (CEST)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ0uP-0002xg-E1
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 20:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZ0tf-0002Z6-JW
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 20:39:15 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:35437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZ0td-0007GC-K8
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 20:39:15 -0400
Received: by mail-io1-xd2d.google.com with SMTP id h141so32008623iof.2
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 17:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uVJRj2tE2nezofmVlObTkKqRr47I4K5in3MT/Ka7fnc=;
 b=iaOpnI19VJF0A4hV9XkUBxXvwGsZMM9aqLBLZxo3OPLyksMVEjTOee29/yS89EPjQ7
 Qs/R4MjT/afhZLGtMsFllg6E9Dmif5UfnkZUlrx3X+cyWqR1pzhSmU2TNzJ0LElIDdry
 i4R9KLoXwkO3i9nx7K2TkiZJVa3asLykur+kOpXaGuFRAdQLdTd4a2AYiZMjEOeEl2S0
 8XuffOcI4jvm2pBFx+RanpS1HRRlVNJvXmQw5evo1VcRP2QnUqiS0qu+ap44Kg8KH2Bd
 XaR5njvmULhVRSeqWb98O4T+OoUjL46yYqSwM/J93/IuyDE46yNH/Q1RcuKfgho3YJy1
 KF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uVJRj2tE2nezofmVlObTkKqRr47I4K5in3MT/Ka7fnc=;
 b=eMBHngKyFt/eda30F5w2B6Y4X9GofPhUQ+Rq4pZ561edhhcALVVoE4mtt7tmTb+JUx
 nXekiUvk9IQPMbhtKNPrMonqi8vDV1V9FRDv6pwpnaaX87Bo5pO4boloWaEIjJYbK1Vy
 64LGxv31HsRF5iIrxyQlXJCCQSzaixdyMhdp9HRVolevzKUfWJCN5CN1WJ2fSJE+0FBA
 pScFvqNSPLb2hxgKncM41SaH3r0/4UwMv4dUuuN/RI+sTwyRu+GPW94fKfqzq4oJvPaZ
 rV2XgpzZe0PTVOC5nVW5xobUebIGaS+ONYnp48nzorA6IugSgD+ncGlVnF0uplxA1VOe
 2lJQ==
X-Gm-Message-State: AOAM531v2O8ZiaPpxKWaLcfwXUJHBG4jDzYLyTUlFGXaTORmW9g+XDye
 VdhgdHT4tqkmegADHKYpf7sGJJQb0R0KLul8dYU=
X-Google-Smtp-Source: ABdhPJzdw0vOFuoxAzeev7x5nQWYaOX9cQybl/Y9X1Ama5kW549zgek7x2WBK1S/nmVKYx+v3AgGwVRDrgZajIGsIVU=
X-Received: by 2002:a05:6638:2591:: with SMTP id
 s17mr23051193jat.87.1618965551053; 
 Tue, 20 Apr 2021 17:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
 <20210420154643.58439-2-ma.mandourr@gmail.com>
 <20210420190334.GE1529659@redhat.com>
In-Reply-To: <20210420190334.GE1529659@redhat.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 21 Apr 2021 02:39:00 +0200
Message-ID: <CAD-LL6jeKzfY5ehBU_D6Bnpm53jNneecWLvYs_seGTOmZ=Am6Q@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH v2 1/7] virtiofsd: Changed allocations of
 fuse_req to GLib functions
To: Vivek Goyal <vgoyal@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000092fc0905c070ca1a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd2d.google.com
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
Cc: "open list:virtiofs" <virtio-fs@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000092fc0905c070ca1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2021 at 9:03 PM Vivek Goyal <vgoyal@redhat.com> wrote:

> On Tue, Apr 20, 2021 at 05:46:36PM +0200, Mahmoud Mandour wrote:
> > Replaced the allocation and deallocation of fuse_req structs
> > using calloc()/free() call pairs to a GLib's g_try_new0()
> > and g_free().
>
> Hi,
>
> What's the context of these patches. I see all of them are switching
> to glib functions. Why to do that? What's the advantage.
>
> Vivek
>
> >
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  tools/virtiofsd/fuse_lowlevel.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/virtiofsd/fuse_lowlevel.c
> b/tools/virtiofsd/fuse_lowlevel.c
> > index 58e32fc963..812cef6ef6 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.c
> > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > @@ -106,7 +106,7 @@ static void list_add_req(struct fuse_req *req,
> struct fuse_req *next)
> >  static void destroy_req(fuse_req_t req)
> >  {
> >      pthread_mutex_destroy(&req->lock);
> > -    free(req);
> > +    g_free(req);
> >  }
> >
> >  void fuse_free_req(fuse_req_t req)
> > @@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct
> fuse_session *se)
> >  {
> >      struct fuse_req *req;
> >
> > -    req =3D (struct fuse_req *)calloc(1, sizeof(struct fuse_req));
> > +    req =3D g_try_new0(struct fuse_req, 1);
> >      if (req =3D=3D NULL) {
> >          fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate request\n");
> >      } else {
> > @@ -1684,7 +1684,7 @@ static struct fuse_req *check_interrupt(struct
> fuse_session *se,
> >          if (curr->u.i.unique =3D=3D req->unique) {
> >              req->interrupted =3D 1;
> >              list_del_req(curr);
> > -            free(curr);
> > +            g_free(curr);
> >              return NULL;
> >          }
> >      }
> > --
> > 2.25.1
> >
> > _______________________________________________
> > Virtio-fs mailing list
> > Virtio-fs@redhat.com
> > https://listman.redhat.com/mailman/listinfo/virtio-fs
>
>
Hello Vivek,

Taken from the Qemu Coding Style document in the documentation:
"Use of the malloc/free/realloc/calloc/valloc/memalign/posix_memalign APIs
is not allowed in the QEMU codebase. Instead of these routines, use the
GLib memory allocation routines
g_malloc/g_malloc0/g_new/g_new0/g_realloc/g_free or QEMU=E2=80=99s
qemu_memalign/qemu_blockalign/qemu_vfree APIs."
It's also in the bite-sized contributions page as a task.

Thanks,
Mahmoud

--00000000000092fc0905c070ca1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Apr 20, 2021 at 9:03 PM Vivek Goyal &lt;<a href=3D"mailto:vgoyal@red=
hat.com">vgoyal@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Tue, Apr 20, 2021 at 05:46:36PM +0200, Mahmoud=
 Mandour wrote:<br>
&gt; Replaced the allocation and deallocation of fuse_req structs<br>
&gt; using calloc()/free() call pairs to a GLib&#39;s g_try_new0()<br>
&gt; and g_free().<br>
<br>
Hi,<br>
<br>
What&#39;s the context of these patches. I see all of them are switching<br=
>
to glib functions. Why to do that? What&#39;s the advantage.<br>
<br>
Vivek<br>
<br>
&gt; <br>
&gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail=
.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tools/virtiofsd/fuse_lowlevel.c | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lo=
wlevel.c<br>
&gt; index 58e32fc963..812cef6ef6 100644<br>
&gt; --- a/tools/virtiofsd/fuse_lowlevel.c<br>
&gt; +++ b/tools/virtiofsd/fuse_lowlevel.c<br>
&gt; @@ -106,7 +106,7 @@ static void list_add_req(struct fuse_req *req, str=
uct fuse_req *next)<br>
&gt;=C2=A0 static void destroy_req(fuse_req_t req)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pthread_mutex_destroy(&amp;req-&gt;lock);<br>
&gt; -=C2=A0 =C2=A0 free(req);<br>
&gt; +=C2=A0 =C2=A0 g_free(req);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void fuse_free_req(fuse_req_t req)<br>
&gt; @@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct f=
use_session *se)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct fuse_req *req;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 req =3D (struct fuse_req *)calloc(1, sizeof(struct fuse=
_req));<br>
&gt; +=C2=A0 =C2=A0 req =3D g_try_new0(struct fuse_req, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (req =3D=3D NULL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fuse_log(FUSE_LOG_ERR, &quot;fuse: f=
ailed to allocate request\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; @@ -1684,7 +1684,7 @@ static struct fuse_req *check_interrupt(struct f=
use_session *se,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (curr-&gt;u.i.unique =3D=3D req-&=
gt;unique) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req-&gt;interrupted =
=3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list_del_req(curr);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(curr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(curr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; Virtio-fs mailing list<br>
&gt; <a href=3D"mailto:Virtio-fs@redhat.com" target=3D"_blank">Virtio-fs@re=
dhat.com</a><br>
&gt; <a href=3D"https://listman.redhat.com/mailman/listinfo/virtio-fs" rel=
=3D"noreferrer" target=3D"_blank">https://listman.redhat.com/mailman/listin=
fo/virtio-fs</a><br>
<br></blockquote><div><br></div>Hello=C2=A0Vivek,<div><br></div><div>Taken =
from the Qemu Coding Style document in the documentation:</div><div>&quot;U=
se of the malloc/free/realloc/calloc/valloc/memalign/posix_memalign APIs is=
 not allowed in the QEMU codebase. Instead of these routines, use the GLib =
memory allocation routines g_malloc/g_malloc0/g_new/g_new0/g_realloc/g_free=
 or QEMU=E2=80=99s qemu_memalign/qemu_blockalign/qemu_vfree APIs.&quot;</di=
v><div>It&#39;s also in the bite-sized contributions page as a task.</div><=
div><br></div><div>Thanks,</div><div>Mahmoud=C2=A0</div></div></div></div>

--00000000000092fc0905c070ca1a--

