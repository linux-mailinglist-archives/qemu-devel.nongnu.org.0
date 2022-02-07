Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9676F4AC6F6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:17:01 +0100 (CET)
Received: from localhost ([::1]:34782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7dM-0001y0-BW
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:17:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nH75F-0004t3-KN
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:41:45 -0500
Received: from [2a00:1450:4864:20::229] (port=44670
 helo=mail-lj1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nH75C-0006CO-D0
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:41:45 -0500
Received: by mail-lj1-x229.google.com with SMTP id c15so20437768ljf.11
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 08:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXqZEUYoEu0EmUEsJCTq1MIblP2OaFiw4qbDYU0CqEY=;
 b=hdbV4kdjscop3tJPP1jmZMhpUhtQp/UVIQV+aX1OOHJfO8lbL4Ti7ulUS2CNWsdtzo
 KNM/Hc3TljarL7L2f+wIloksfj88G9rDaRcCXxt/JBR/21iT8JsrZTdE5kT0PCnXLNOQ
 dUxgEKGslGF8oGCF0iQGE0CGWTIm/s6Xdhjim5onyccApcrwUR7mIX+nX+RI/yE9PHAH
 yMvcEx584zBXJ4/3CN1bC/NnQjNGP2FTbE1w2Ofb0FT2VwTnRIT+c1uf8BFZpbChSaNN
 pYm+/HqNewDfrrcGlaKuL5kuEA8hOdJHOakzhPaJaV7oUMXnuPvXe5AQzjrHZ8P7mdpv
 V9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXqZEUYoEu0EmUEsJCTq1MIblP2OaFiw4qbDYU0CqEY=;
 b=Ud4YettjoTRuROZVPifhb1XLv4PL6aszHmQClraQFpZqDb1bB9eQIbcgGHd976Zv2Y
 AAVMvSkApM1e2pY515QK6i91YtSvj6DZ71VUY6rvR6bqP9Y9klGnLIJNappb4W6mMUr4
 aM1gX3sElYh/yFvkD6x4YxaDnGyJNSeIZymF7nGxqR2GEa+ejdxHTlrCl7wyqA8DogMs
 fV5191K1AILeGyrG8eXwIkKmu3AIr6m0OMViWnNXZPFognf4sAorfJT+gNrQeilT5ty2
 IbVk6Eftz5hWBGOck0HIEtLf9NYCt9VoCuNEw1WRr7bexFNZhm4Ikvfs189El77YSemw
 Czcw==
X-Gm-Message-State: AOAM5300EG5IVj0C31EWPwSRDZNUNeJgyiRvaNd55vouk4kmVyfi5kOl
 oepl+qFP1TLH6SijEeb43n6jYhzletzTofoiXrE=
X-Google-Smtp-Source: ABdhPJyzCHX+FCfVtjmJ3f2NhnHu98TJGaZGAA3LZtDCLdLCpQrIpLJ0M/SsnETO0q2ilNoy3DPR+xHk3ryVX02d4H0=
X-Received: by 2002:a2e:bd83:: with SMTP id o3mr191659ljq.51.1644252095253;
 Mon, 07 Feb 2022 08:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-5-wwcohen@gmail.com>
 <1773154.tHhT6ugY5c@silver>
In-Reply-To: <1773154.tHhT6ugY5c@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 7 Feb 2022 11:41:23 -0500
Message-ID: <CAB26zV1KMpHg+ScpOR6DRdE_L-AUjjeMee4_nKoaLnsXqiSN7g@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] 9p: darwin: Handle struct dirent differences
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000000f0f5f05d7704644"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::229
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000f0f5f05d7704644
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 7, 2022 at 9:41 AM Christian Schoenebeck <qemu_oss@crudebyte.com>
wrote:

> On Sonntag, 6. Februar 2022 21:07:12 CET Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > On darwin d_seekoff exists, but is optional and does not seem to
> > be commonly used by file systems. Use `telldir` instead to obtain
> > the seek offset and inject it into d_seekoff, and create a
> > qemu_dirent_off helper to call it appropriately when appropriate.
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > [Michael Roitzsch: - Rebase for NixOS]
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > [Will Cohen: - Adjust to pass testing
> >              - Ensure that d_seekoff is filled using telldir
> >                on darwin, and create qemu_dirent_off helper
> >                to decide which to access]
> > [Fabian Franz: - Add telldir error handling for darwin]
> > [Will Cohen: - Ensure that telldir error handling uses
> >                signed int]
> > Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >  hw/9pfs/9p-local.c |  9 +++++++++
> >  hw/9pfs/9p-proxy.c | 16 +++++++++++++++-
> >  hw/9pfs/9p-synth.c |  4 ++++
> >  hw/9pfs/9p-util.h  | 17 +++++++++++++++++
> >  hw/9pfs/9p.c       | 15 +++++++++++++--
> >  hw/9pfs/codir.c    |  7 +++++++
> >  6 files changed, 65 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index 1a5e3eed73..7137a28109 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -559,6 +559,15 @@ static struct dirent *local_readdir(FsContext *ctx,
> > V9fsFidOpenState *fs)
> >
> >  again:
> >      entry = readdir(fs->dir.stream);
> > +#ifdef CONFIG_DARWIN
> > +    int td;
> > +    td = telldir(fs->dir.stream);
> > +    /* If telldir fails, fail the entire readdir call */
> > +    if (td < 0) {
> > +        return NULL;
> > +    }
> > +    entry->d_seekoff = td;
> > +#endif
> >      if (!entry) {
> >          return NULL;
> >      }
>
> 'entry' may be NULL, so the 'if (!entry) {' check should be before the
> Darwin
> specific code to avoid a crash on macOS.
>

Adjusting for v5.


>
> > diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> > index b1664080d8..8b4b5cf7dc 100644
> > --- a/hw/9pfs/9p-proxy.c
> > +++ b/hw/9pfs/9p-proxy.c
> > @@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx,
> > V9fsFidOpenState *fs)
> >
> >  static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenState
> *fs)
> >  {
> > -    return readdir(fs->dir.stream);
> > +    struct dirent *entry;
> > +    entry = readdir(fs->dir.stream);
> > +#ifdef CONFIG_DARWIN
> > +    if (!entry) {
> > +        return NULL;
> > +    }
> > +    int td;
> > +    td = telldir(fs->dir.stream);
> > +    /* If telldir fails, fail the entire readdir call */
> > +    if (td < 0) {
> > +        return NULL;
> > +    }
> > +    entry->d_seekoff = td;
> > +#endif
> > +    return entry;
> >  }
> >
> >  static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t
> off)
> > diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> > index 4a4a776d06..e264a03eef 100644
> > --- a/hw/9pfs/9p-synth.c
> > +++ b/hw/9pfs/9p-synth.c
> > @@ -222,7 +222,11 @@ static void synth_direntry(V9fsSynthNode *node,
> >  {
> >      strcpy(entry->d_name, node->name);
> >      entry->d_ino = node->attr->inode;
> > +#ifdef CONFIG_DARWIN
> > +    entry->d_seekoff = off + 1;
> > +#else
> >      entry->d_off = off + 1;
> > +#endif
> >  }
> >
> >  static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > index 546f46dc7d..accbec9987 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -79,3 +79,20 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char
> > *filename, const char *name);
> >
> >  #endif
> > +
> > +
> > +/**
> > + * Darwin has d_seekoff, which appears to function similarly to d_off.
> > + * However, it does not appear to be supported on all file systems,
> > + * so ensure it is manually injected earlier and call here when
> > + * needed.
> > + */
> > +
>
> Nitpicking: no blank line here please.
>

Adjusting for v5.


>
> > +inline off_t qemu_dirent_off(struct dirent *dent)
> > +{
> > +#ifdef CONFIG_DARWIN
> > +    return dent->d_seekoff;
> > +#else
> > +    return dent->d_off;
> > +#endif
> > +}
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 1563d7b7c6..cf694da354 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -27,6 +27,7 @@
> >  #include "virtio-9p.h"
> >  #include "fsdev/qemu-fsdev.h"
> >  #include "9p-xattr.h"
> > +#include "9p-util.h"
> >  #include "coth.h"
> >  #include "trace.h"
> >  #include "migration/blocker.h"
> > @@ -2281,7 +2282,11 @@ static int coroutine_fn
> > v9fs_do_readdir_with_stat(V9fsPDU *pdu, count += len;
> >          v9fs_stat_free(&v9stat);
> >          v9fs_path_free(&path);
> > -        saved_dir_pos = dent->d_off;
> > +        saved_dir_pos = qemu_dirent_off(dent);
> > +        if (saved_dir_pos < 0) {
> > +            err = saved_dir_pos;
> > +            break;
> > +        }
> >      }
>
> That check is no longer needed here, is it?
>

Correct! Adjusting for v5.


>
> >
> >      v9fs_readdir_unlock(&fidp->fs.dir);
> > @@ -2420,6 +2425,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> *pdu,
> > V9fsFidState *fidp, V9fsString name;
> >      int len, err = 0;
> >      int32_t count = 0;
> > +    off_t off;
> >      struct dirent *dent;
> >      struct stat *st;
> >      struct V9fsDirEnt *entries = NULL;
> > @@ -2480,12 +2486,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> > *pdu, V9fsFidState *fidp, qid.version = 0;
> >          }
> >
> > +        off = qemu_dirent_off(dent);
> > +        if (off < 0) {
> > +            err = off;
> > +            break;
> > +        }
>
> Likewise: is this check still needed?
>

As above, removing for v5.


>
> >          v9fs_string_init(&name);
> >          v9fs_string_sprintf(&name, "%s", dent->d_name);
> >
> >          /* 11 = 7 + 4 (7 = start offset, 4 = space for storing count) */
> >          len = pdu_marshal(pdu, 11 + count, "Qqbs",
> > -                          &qid, dent->d_off,
> > +                          &qid, off,
> >                            dent->d_type, &name);
> >
> >          v9fs_string_free(&name);
> > diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> > index 032cce04c4..fac6759a64 100644
> > --- a/hw/9pfs/codir.c
> > +++ b/hw/9pfs/codir.c
> > @@ -167,7 +167,14 @@ static int do_readdir_many(V9fsPDU *pdu,
> V9fsFidState
> > *fidp, }
> >
> >          size += len;
> > +        /* This conditional statement is identical in
> > +         * function to qemu_dirent_off, described in 9p-util.h,
> > +         * since that header cannot be included here. */
> > +#ifdef CONFIG_DARWIN
> > +        saved_dir_pos = dent->d_seekoff;
> > +#else
> >          saved_dir_pos = dent->d_off;
> > +#endif
>
> Why can't the header not be included here? Obvious preference would be to
> use
> qemu_dirent_off() here as well, to have control at one central code
> location.
>

Only my own imprecision in organizing the includes correctly. After
including "9p-xattr.h" as well, this works. Will adjust for v5.


>
> >      }
> >
> >      /* restore (last) saved position */
>
>
>

--0000000000000f0f5f05d7704644
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Feb 7, 2022 at 9:41 AM Christian =
Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyt=
e.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sonntag, 6. Februar 2022 21:07:12 CET W=
ill Cohen wrote:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; On darwin d_seekoff exists, but is optional and does not seem to<br>
&gt; be commonly used by file systems. Use `telldir` instead to obtain<br>
&gt; the seek offset and inject it into d_seekoff, and create a<br>
&gt; qemu_dirent_off helper to call it appropriately when appropriate.<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; [Michael Roitzsch: - Rebase for NixOS]<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; [Will Cohen: - Adjust to pass testing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Ensure that d_seekof=
f is filled using telldir<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 on darwin, and =
create qemu_dirent_off helper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to decide which=
 to access]<br>
&gt; [Fabian Franz: - Add telldir error handling for darwin]<br>
&gt; [Will Cohen: - Ensure that telldir error handling uses<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 signed int]<br>
&gt; Signed-off-by: Fabian Franz &lt;<a href=3D"mailto:fabianfranz.oss@gmai=
l.com" target=3D"_blank">fabianfranz.oss@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/9pfs/9p-local.c |=C2=A0 9 +++++++++<br>
&gt;=C2=A0 hw/9pfs/9p-proxy.c | 16 +++++++++++++++-<br>
&gt;=C2=A0 hw/9pfs/9p-synth.c |=C2=A0 4 ++++<br>
&gt;=C2=A0 hw/9pfs/9p-util.h=C2=A0 | 17 +++++++++++++++++<br>
&gt;=C2=A0 hw/9pfs/9p.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++++++++--<br>
&gt;=C2=A0 hw/9pfs/codir.c=C2=A0 =C2=A0 |=C2=A0 7 +++++++<br>
&gt;=C2=A0 6 files changed, 65 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>
&gt; index 1a5e3eed73..7137a28109 100644<br>
&gt; --- a/hw/9pfs/9p-local.c<br>
&gt; +++ b/hw/9pfs/9p-local.c<br>
&gt; @@ -559,6 +559,15 @@ static struct dirent *local_readdir(FsContext *ct=
x,<br>
&gt; V9fsFidOpenState *fs)<br>
&gt; <br>
&gt;=C2=A0 again:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 entry =3D readdir(fs-&gt;dir.stream);<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 int td;<br>
&gt; +=C2=A0 =C2=A0 td =3D telldir(fs-&gt;dir.stream);<br>
&gt; +=C2=A0 =C2=A0 /* If telldir fails, fail the entire readdir call */<br=
>
&gt; +=C2=A0 =C2=A0 if (td &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D td;<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!entry) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
&#39;entry&#39; may be NULL, so the &#39;if (!entry) {&#39; check should be=
 before the Darwin <br>
specific code to avoid a crash on macOS.<br></blockquote><div><br></div><di=
v>Adjusting for v5.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt; diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c<br>
&gt; index b1664080d8..8b4b5cf7dc 100644<br>
&gt; --- a/hw/9pfs/9p-proxy.c<br>
&gt; +++ b/hw/9pfs/9p-proxy.c<br>
&gt; @@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx,<br>
&gt; V9fsFidOpenState *fs)<br>
&gt; <br>
&gt;=C2=A0 static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenS=
tate *fs)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 return readdir(fs-&gt;dir.stream);<br>
&gt; +=C2=A0 =C2=A0 struct dirent *entry;<br>
&gt; +=C2=A0 =C2=A0 entry =3D readdir(fs-&gt;dir.stream);<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 if (!entry) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 int td;<br>
&gt; +=C2=A0 =C2=A0 td =3D telldir(fs-&gt;dir.stream);<br>
&gt; +=C2=A0 =C2=A0 /* If telldir fails, fail the entire readdir call */<br=
>
&gt; +=C2=A0 =C2=A0 if (td &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D td;<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 return entry;<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, =
off_t off)<br>
&gt; diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c<br>
&gt; index 4a4a776d06..e264a03eef 100644<br>
&gt; --- a/hw/9pfs/9p-synth.c<br>
&gt; +++ b/hw/9pfs/9p-synth.c<br>
&gt; @@ -222,7 +222,11 @@ static void synth_direntry(V9fsSynthNode *node,<b=
r>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 strcpy(entry-&gt;d_name, node-&gt;name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 entry-&gt;d_ino =3D node-&gt;attr-&gt;inode;<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D off + 1;<br>
&gt; +#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 entry-&gt;d_off =3D off + 1;<br>
&gt; +#endif<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 static struct dirent *synth_get_dentry(V9fsSynthNode *dir,<br>
&gt; diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h<br>
&gt; index 546f46dc7d..accbec9987 100644<br>
&gt; --- a/hw/9pfs/9p-util.h<br>
&gt; +++ b/hw/9pfs/9p-util.h<br>
&gt; @@ -79,3 +79,20 @@ ssize_t fremovexattrat_nofollow(int dirfd, const ch=
ar<br>
&gt; *filename, const char *name);<br>
&gt; <br>
&gt;=C2=A0 #endif<br>
&gt; +<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Darwin has d_seekoff, which appears to function similarly to d_off=
.<br>
&gt; + * However, it does not appear to be supported on all file systems,<b=
r>
&gt; + * so ensure it is manually injected earlier and call here when<br>
&gt; + * needed.<br>
&gt; + */<br>
&gt; +<br>
<br>
Nitpicking: no blank line here please.<br></blockquote><div><br></div><div>=
Adjusting for v5.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
&gt; +inline off_t qemu_dirent_off(struct dirent *dent)<br>
&gt; +{<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 return dent-&gt;d_seekoff;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 return dent-&gt;d_off;<br>
&gt; +#endif<br>
&gt; +}<br>
&gt; diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c<br>
&gt; index 1563d7b7c6..cf694da354 100644<br>
&gt; --- a/hw/9pfs/9p.c<br>
&gt; +++ b/hw/9pfs/9p.c<br>
&gt; @@ -27,6 +27,7 @@<br>
&gt;=C2=A0 #include &quot;virtio-9p.h&quot;<br>
&gt;=C2=A0 #include &quot;fsdev/qemu-fsdev.h&quot;<br>
&gt;=C2=A0 #include &quot;9p-xattr.h&quot;<br>
&gt; +#include &quot;9p-util.h&quot;<br>
&gt;=C2=A0 #include &quot;coth.h&quot;<br>
&gt;=C2=A0 #include &quot;trace.h&quot;<br>
&gt;=C2=A0 #include &quot;migration/blocker.h&quot;<br>
&gt; @@ -2281,7 +2282,11 @@ static int coroutine_fn<br>
&gt; v9fs_do_readdir_with_stat(V9fsPDU *pdu, count +=3D len;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_stat_free(&amp;v9stat);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_path_free(&amp;path);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D dent-&gt;d_off;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D qemu_dirent_off(dent);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (saved_dir_pos &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D saved_dir_pos;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
That check is no longer needed here, is it?<br></blockquote><div><br></div>=
<div>Correct! Adjusting for v5.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 v9fs_readdir_unlock(&amp;fidp-&gt;fs.dir);<br>
&gt; @@ -2420,6 +2425,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU =
*pdu,<br>
&gt; V9fsFidState *fidp, V9fsString name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int len, err =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int32_t count =3D 0;<br>
&gt; +=C2=A0 =C2=A0 off_t off;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct dirent *dent;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct stat *st;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct V9fsDirEnt *entries =3D NULL;<br>
&gt; @@ -2480,12 +2486,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPD=
U<br>
&gt; *pdu, V9fsFidState *fidp, qid.version =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 off =3D qemu_dirent_off(dent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (off &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D off;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
Likewise: is this check still needed?<br></blockquote><div><br></div><div>A=
s above, removing for v5.<br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_string_init(&amp;name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_string_sprintf(&amp;name, &quot=
;%s&quot;, dent-&gt;d_name);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 11 =3D 7 + 4 (7 =3D start offset,=
 4 =3D space for storing count) */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D pdu_marshal(pdu, 11 + count,=
 &quot;Qqbs&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;qid, dent-&gt;d_off,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;qid, off,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dent-&gt;d_type, &amp;name);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_string_free(&amp;name);<br>
&gt; diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c<br>
&gt; index 032cce04c4..fac6759a64 100644<br>
&gt; --- a/hw/9pfs/codir.c<br>
&gt; +++ b/hw/9pfs/codir.c<br>
&gt; @@ -167,7 +167,14 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidS=
tate<br>
&gt; *fidp, }<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size +=3D len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This conditional statement is identica=
l in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* function to qemu_dirent_off, desc=
ribed in 9p-util.h,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since that header cannot be inclu=
ded here. */<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D dent-&gt;d_seekoff;<br>
&gt; +#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D dent-&gt;d_off;<br=
>
&gt; +#endif<br>
<br>
Why can&#39;t the header not be included here? Obvious preference would be =
to use <br>
qemu_dirent_off() here as well, to have control at one central code locatio=
n.<br></blockquote><div><br></div><div>Only my own imprecision in organizin=
g the includes correctly. After including &quot;9p-xattr.h&quot; as well, t=
his works. Will adjust for v5.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* restore (last) saved position */<br>
<br>
<br>
</blockquote></div></div>

--0000000000000f0f5f05d7704644--

