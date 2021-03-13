Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961D5339C37
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 06:44:47 +0100 (CET)
Received: from localhost ([::1]:45034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKx4v-0000lX-P9
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 00:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKx47-00007u-07
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 00:43:55 -0500
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:44273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKx45-0001Fd-1u
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 00:43:54 -0500
Received: by mail-il1-x12a.google.com with SMTP id v14so4571496ilj.11
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 21:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FOjpHAJJGo3QMIfvvLBoI/JaB/vhp37rDik9SfSrb58=;
 b=f73u9Ec53WZdJokRI+P3JnoD2SPdgp0i2PEvS8eDZzuskTYxNL7BpGHuXxDP+xXkvC
 Sra7aPzYwITqYL22GRAeFJXcD6jFptguAQFqeMurV+WaArS24q9oh18znsw4f04WY675
 duqoCulrDnV9AInisQablirURe6Hx6user7hK7ugU/a5PW43ZF9A6N/9k98cGkAgyGJr
 ExN4aRTKiGqrwi9ZIqw47fy7fYlW9uou1RrgqJjqWa3HuqeqXwNxmQNbaarEZXDTyJIZ
 br5ESyAZrSqpXtQgcu9t1aGVQBkEawLnOcLoE8TEXdZyYyeB8TlFsKqrkJjFo2SJDoAe
 AZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FOjpHAJJGo3QMIfvvLBoI/JaB/vhp37rDik9SfSrb58=;
 b=aO0y8LKCaBsp+7Lj2dx6THUoxEHiogzxirQ6ptbQw4I59sr2bQT+zUlYilP06+bybH
 PErvNUFMTZSWSwAXDwt+zzIB+KtWs4meMI8Z2lt9aaxzlrgqJDpcyBUAt+2AoQrgZ3/+
 i+c4KdDWUlo0OrvD4iVsdCEWJhl2qoJCnqx1k2ofGXsFiH6REPa12hVV6ELy/EQlKfmh
 g/5iRH7P4S2h6+5qxF02yhMjO2/GPfoVZObNw6UwjPJ5C1gaSYdXhC03nCAE5ByKl8qJ
 CUAxDlwczhkFqGlwOSzcB5qExBicHHg36/cCnyQjeshIJrYvidFQi8/VosAGCraUolU8
 HoIw==
X-Gm-Message-State: AOAM531aid0Ydwk52ehxN18/MdOmZFMWFCT44pY/LMghOeNH+oE83M9n
 YjBGPi6ce3njMBc5lOzkkOhpvlIcQ3Kee9siAX0tSaCiFqI=
X-Google-Smtp-Source: ABdhPJy1bBiKigG9C4zP37J7gsYoRuM2U7J1jwGqaUjlamEDoyfCSDutvrF0rupBNtN0arZzwM+J4Yv/TxqK9MraMvM=
X-Received: by 2002:a05:6e02:2:: with SMTP id h2mr4301992ilr.81.1615614231102; 
 Fri, 12 Mar 2021 21:43:51 -0800 (PST)
MIME-Version: 1.0
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <2248579.lIZarMFqrv@silver>
 <20210311125245.5127cd6d@bahia.lan> <2070220.8au7kWUZml@silver>
In-Reply-To: <2070220.8au7kWUZml@silver>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Sat, 13 Mar 2021 07:43:38 +0200
Message-ID: <CAD-LL6iS11_2Z1hFa9-Or6J4-X2fKfMhriRMby5G3VEZhhpf9w@mail.gmail.com>
Subject: Re: [PATCH 8/9] hw/9pfs/9p-synth: Replaced qemu_mutex_lock with
 QEMU_LOCK_GUARD
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="00000000000056c98005bd648055"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x12a.google.com
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000056c98005bd648055
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the fast review. I asked on the QEMU IRC channel
before committing whether to put all the changes into one patch
or split them and was instructed that it was better to split them up.
But in any case I was open to both ways and you can decide
on the best way to go.

On Thu, Mar 11, 2021 at 1:59 PM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 11. M=C3=A4rz 2021 12:52:45 CET Greg Kurz wrote:
> > On Thu, 11 Mar 2021 11:49:06 +0100
> >
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > On Donnerstag, 11. M=C3=A4rz 2021 04:15:37 CET Mahmoud Mandour wrote:
> > > > Replaced a call to qemu_mutex_lock and its respective call to
> > > > qemu_mutex_unlock and used QEMU_LOCK_GUARD macro in their place.
> > > > This simplifies the code by removing the call required to unlock
> > > > and also eliminates goto paths.
> > > >
> > > > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > > > ---
> > > >
> > > >  hw/9pfs/9p-synth.c | 12 ++++--------
> > > >  1 file changed, 4 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> > > > index 7eb210ffa8..473ef914b0 100644
> > > > --- a/hw/9pfs/9p-synth.c
> > > > +++ b/hw/9pfs/9p-synth.c
> > > > @@ -79,11 +79,11 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent=
,
> int
> > > > mode, if (!parent) {
> > > >
> > > >          parent =3D &synth_root;
> > > >
> > > >      }
> > > >
> > > > -    qemu_mutex_lock(&synth_mutex);
> > > > +    QEMU_LOCK_GUARD(&synth_mutex);
> > > >
> > > >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> > > >
> > > >          if (!strcmp(tmp->name, name)) {
> > > >
> > > >              ret =3D EEXIST;
> > > >
> > > > -            goto err_out;
> > > > +            return ret;
> > > >
> > > >          }
> > > >
> > > >      }
> > > >      /* Add the name */
> > > >
> > > > @@ -94,8 +94,6 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent,
> int
> > > > mode, node->attr, node->attr->inode);
> > > >
> > > >      *result =3D node;
> > > >      ret =3D 0;
> > > >
> > > > -err_out:
> > > > -    qemu_mutex_unlock(&synth_mutex);
> > > >
> > > >      return ret;
> > > >
> > > >  }
> > > >
> > > > @@ -116,11 +114,11 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode
> > > > *parent,
> > > > int mode, parent =3D &synth_root;
> > > >
> > > >      }
> > > >
> > > > -    qemu_mutex_lock(&synth_mutex);
> > > > +    QEMU_LOCK_GUARD(&synth_mutex);
> > > >
> > > >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> > > >
> > > >          if (!strcmp(tmp->name, name)) {
> > > >
> > > >              ret =3D EEXIST;
> > > >
> > > > -            goto err_out;
> > > > +            return ret;
> > > >
> > > >          }
> > > >
> > > >      }
> > > >      /* Add file type and remove write bits */
> > > >
> > > > @@ -136,8 +134,6 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode
> *parent,
> > > > int
> > > > mode, pstrcpy(node->name, sizeof(node->name), name);
> > > >
> > > >      QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
> > > >      ret =3D 0;
> > > >
> > > > -err_out:
> > > > -    qemu_mutex_unlock(&synth_mutex);
> > > >
> > > >      return ret;
> > > >
> > > >  }
> > >
> > > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > >
> > > Greg, I suggest I'll push this onto my queue as you seem to be busy.
> >
> > This cleanup spans over multiple subsystems but I think it makes more
> > sense to keep all these patches together. Let's wait for everyone to
> > ack/review and then we'll decide how to merge the patches.
>
> Sure, makes sense.
>
>
>
>

--00000000000056c98005bd648055
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks for the fast review. I asked on th=
e QEMU IRC channel=C2=A0</div><div dir=3D"ltr">before committing whether to=
 put all the changes into one patch=C2=A0</div><div dir=3D"ltr">or split th=
em and was instructed=C2=A0that it was better to split them up.=C2=A0</div>=
<div>But in any case I was open to both ways and you can decide</div><div>o=
n the best way to go.=C2=A0</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 1:59 PM Christian =
Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyt=
e.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Donnerstag, 11. M=C3=A4rz 2021 12:52:45 CET Greg Kurz wrote:<br>
&gt; On Thu, 11 Mar 2021 11:49:06 +0100<br>
&gt; <br>
&gt; Christian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" ta=
rget=3D"_blank">qemu_oss@crudebyte.com</a>&gt; wrote:<br>
&gt; &gt; On Donnerstag, 11. M=C3=A4rz 2021 04:15:37 CET Mahmoud Mandour wr=
ote:<br>
&gt; &gt; &gt; Replaced a call to qemu_mutex_lock and its respective call t=
o<br>
&gt; &gt; &gt; qemu_mutex_unlock and used QEMU_LOCK_GUARD macro in their pl=
ace.<br>
&gt; &gt; &gt; This simplifies the code by removing the call required to un=
lock<br>
&gt; &gt; &gt; and also eliminates goto paths.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mand=
ourr@gmail.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 hw/9pfs/9p-synth.c | 12 ++++--------<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 4 insertions(+), 8 deletions(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c<br>
&gt; &gt; &gt; index 7eb210ffa8..473ef914b0 100644<br>
&gt; &gt; &gt; --- a/hw/9pfs/9p-synth.c<br>
&gt; &gt; &gt; +++ b/hw/9pfs/9p-synth.c<br>
&gt; &gt; &gt; @@ -79,11 +79,11 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode =
*parent, int<br>
&gt; &gt; &gt; mode, if (!parent) {<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parent =3D &amp;synth_root=
;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 qemu_mutex_lock(&amp;synth_mutex);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;synth_mutex);<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 QLIST_FOREACH(tmp, &amp;parent-&gt;child=
, sibling) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(tmp-&gt;name, =
name)) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D EEXI=
ST;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_out;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Add the name */<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; @@ -94,8 +94,6 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *p=
arent, int<br>
&gt; &gt; &gt; mode, node-&gt;attr, node-&gt;attr-&gt;inode);<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 *result =3D node;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -err_out:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;synth_mutex);<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; @@ -116,11 +114,11 @@ int qemu_v9fs_synth_add_file(V9fsSynth=
Node<br>
&gt; &gt; &gt; *parent,<br>
&gt; &gt; &gt; int mode, parent =3D &amp;synth_root;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 qemu_mutex_lock(&amp;synth_mutex);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;synth_mutex);<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 QLIST_FOREACH(tmp, &amp;parent-&gt;child=
, sibling) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(tmp-&gt;name, =
name)) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D EEXI=
ST;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_out;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Add file type and remove write bits *=
/<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; @@ -136,8 +134,6 @@ int qemu_v9fs_synth_add_file(V9fsSynthNo=
de *parent,<br>
&gt; &gt; &gt; int<br>
&gt; &gt; &gt; mode, pstrcpy(node-&gt;name, sizeof(node-&gt;name), name);<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 QLIST_INSERT_HEAD_RCU(&amp;parent-&gt;ch=
ild, node, sibling);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -err_out:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;synth_mutex);<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; <br>
&gt; &gt; Reviewed-by: Christian Schoenebeck &lt;<a href=3D"mailto:qemu_oss=
@crudebyte.com" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Greg, I suggest I&#39;ll push this onto my queue as you seem to b=
e busy.<br>
&gt; <br>
&gt; This cleanup spans over multiple subsystems but I think it makes more<=
br>
&gt; sense to keep all these patches together. Let&#39;s wait for everyone =
to<br>
&gt; ack/review and then we&#39;ll decide how to merge the patches.<br>
<br>
Sure, makes sense.<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000056c98005bd648055--

