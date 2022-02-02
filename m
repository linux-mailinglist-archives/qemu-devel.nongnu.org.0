Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C785C4A76AF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 18:19:47 +0100 (CET)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFJII-0002lD-OA
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 12:19:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nFHEZ-00079Y-Mc
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 10:07:47 -0500
Received: from [2a00:1450:4864:20::12c] (port=34588
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nFHEW-0004xI-1l
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 10:07:47 -0500
Received: by mail-lf1-x12c.google.com with SMTP id p27so41373542lfa.1
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 07:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FlDVtL9EgZrJlRDfN/6x3xtCNXXKf+8vxjpU+5kqVXU=;
 b=OCP4C1njNu1zz5bqsIduZTdYHGwsOFmqBKo5elqkV+ygU+Gu/t4ApLNuYJDzjoXEX1
 +Z5dhJf6tAN/Dn9eCWccoyCqZ0YgY+6oilDTi+OExoEbZnhJ+VHsI/AAfGHAvuLJkGQ/
 fQpPtXP+UvVqExrP07Af5kh0WimNH5rdkVOMCASBPyHsppTX8p44AIglSf98/mHbAYN6
 O0iFPpuP97P/3AI8zneSsle/UpX8o+dphT9RY7f4q4zHur3Pjnf56qpoRBNXjxOmBc3r
 R6iMU1l776SDKC/aMAKlUc+IH+3bDMLvz+j2ZJkmNb8ronNiW/ScS0WD+gjqNxLZiFKp
 irjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FlDVtL9EgZrJlRDfN/6x3xtCNXXKf+8vxjpU+5kqVXU=;
 b=0d++NvMMxDYs+j2f+3+TbZUNApc160+kJF2JvQPg04eyHibBpGxBx5+kXJCoBcJYPn
 pK+UdZX9a3MMFiYouGioT+1JM/7UvbN0X27KT9/4ISB/wo/PBFvSy7QHE61s985+kl1l
 OxJ7Cg29NBnDbJb83/FwYzosvm7f4zf6PUbLjrangllHamxfu/7kD/H2L1ar7YGizgNc
 TvxmDP71BdDRojtur12/tUCcpv3GkHMlhnncxOZbTDX1WsbfGd2IvA7UYxT5CChptfOR
 cwLPv0DtC9YWzwS43T/Y90RAbl1plXJUBWjWrecX/GYzn1AfAFUUknQDBrRyepucE34E
 KH1A==
X-Gm-Message-State: AOAM532UNUz2q7nnYopW3a2NQ6Ldn57+UCIeGTUtg1J5KThkOPpazbbs
 wT++vhzEjW88+hWo8lELqPbl2KCIUAnGPcWXbQygTUffyB2a8w==
X-Google-Smtp-Source: ABdhPJxnUCP9zB/OWx1+C7qweG1c9qA+iK/H8UUllo1y48BsZURBxe7LZOChJ2h+Df5PtKargOQ5faFIghz1xme/XPk=
X-Received: by 2002:a19:5f58:: with SMTP id a24mr22226179lfj.46.1643814441208; 
 Wed, 02 Feb 2022 07:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20220128005611.87185-1-wwcohen@gmail.com>
 <20220128005611.87185-5-wwcohen@gmail.com>
In-Reply-To: <20220128005611.87185-5-wwcohen@gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Wed, 2 Feb 2022 10:07:09 -0500
Message-ID: <CAB26zV0zKNzQ-Fk-TAq-UzqyuThW_aubHR+5+iE+SNZonRALQA@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] 9p: darwin: Handle struct dirent differences
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d851c905d70a5fda"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12c.google.com
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d851c905d70a5fda
Content-Type: text/plain; charset="UTF-8"

Does the version proposed in v3 address the V9fsFidState issues? In 9p.c
for v2 to v3, we propose

-    return telldir(fidp->fs.dir.stream);
+    return v9fs_co_telldir(pdu, fidp);

and in codir.c from v2 to v3 we propose
-        saved_dir_pos = telldir(fidp->fs.dir.stream);
+        saved_dir_pos = s->ops->telldir(&s->ctx, &fidp->fs);

This removes the direct access to fidp->, and we hope this should be
sufficient to avoid the concurrency
and undefined behaviors you noted in the v2 review.


On Thu, Jan 27, 2022 at 7:56 PM Will Cohen <wwcohen@gmail.com> wrote:

> From: Keno Fischer <keno@juliacomputing.com>
>
> On darwin d_seekoff exists, but is optional and does not seem to
> be commonly used by file systems. Use `telldir` instead to obtain
> the seek offset.
>
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Adjust to pass testing]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> Signed-off-by: Fabian Franz <github@fabian-franz.de>
> ---
>  hw/9pfs/9p-synth.c |  2 ++
>  hw/9pfs/9p.c       | 33 +++++++++++++++++++++++++++++++--
>  hw/9pfs/codir.c    |  4 ++++
>  3 files changed, 37 insertions(+), 2 deletions(-)
>
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index 4a4a776d06..09b9c25288 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -222,7 +222,9 @@ static void synth_direntry(V9fsSynthNode *node,
>  {
>      strcpy(entry->d_name, node->name);
>      entry->d_ino = node->attr->inode;
> +#ifndef CONFIG_DARWIN
>      entry->d_off = off + 1;
> +#endif
>  }
>
>  static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 1563d7b7c6..7851f85f8f 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -2218,6 +2218,25 @@ static int v9fs_xattr_read(V9fsState *s, V9fsPDU
> *pdu, V9fsFidState *fidp,
>      return offset;
>  }
>
> +/**
> + * Get the seek offset of a dirent. If not available from the structure
> itself,
> + * obtain it by calling telldir.
> + */
> +static int v9fs_dent_telldir(V9fsPDU *pdu, V9fsFidState *fidp,
> +                             struct dirent *dent)
> +{
> +#ifdef CONFIG_DARWIN
> +    /*
> +     * Darwin has d_seekoff, which appears to function similarly to d_off.
> +     * However, it does not appear to be supported on all file systems,
> +     * so use telldir for correctness.
> +     */
> +    return v9fs_co_telldir(pdu, fidp);
> +#else
> +    return dent->d_off;
> +#endif
> +}
> +
>  static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
>                                                    V9fsFidState *fidp,
>                                                    uint32_t max_count)
> @@ -2281,7 +2300,11 @@ static int coroutine_fn
> v9fs_do_readdir_with_stat(V9fsPDU *pdu,
>          count += len;
>          v9fs_stat_free(&v9stat);
>          v9fs_path_free(&path);
> -        saved_dir_pos = dent->d_off;
> +        saved_dir_pos = v9fs_dent_telldir(pdu, fidp, dent);
> +        if (saved_dir_pos < 0) {
> +            err = saved_dir_pos;
> +            break;
> +        }
>      }
>
>      v9fs_readdir_unlock(&fidp->fs.dir);
> @@ -2420,6 +2443,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> *pdu, V9fsFidState *fidp,
>      V9fsString name;
>      int len, err = 0;
>      int32_t count = 0;
> +    off_t off;
>      struct dirent *dent;
>      struct stat *st;
>      struct V9fsDirEnt *entries = NULL;
> @@ -2480,12 +2504,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> *pdu, V9fsFidState *fidp,
>              qid.version = 0;
>          }
>
> +        off = v9fs_dent_telldir(pdu, fidp, dent);
> +        if (off < 0) {
> +            err = off;
> +            break;
> +        }
>          v9fs_string_init(&name);
>          v9fs_string_sprintf(&name, "%s", dent->d_name);
>
>          /* 11 = 7 + 4 (7 = start offset, 4 = space for storing count) */
>          len = pdu_marshal(pdu, 11 + count, "Qqbs",
> -                          &qid, dent->d_off,
> +                          &qid, off,
>                            dent->d_type, &name);
>
>          v9fs_string_free(&name);
> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> index 032cce04c4..c1b5694f3f 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -167,7 +167,11 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> *fidp,
>          }
>
>          size += len;
> +#ifdef CONFIG_DARWIN
> +        saved_dir_pos = s->ops->telldir(&s->ctx, &fidp->fs);
> +#else
>          saved_dir_pos = dent->d_off;
> +#endif
>      }
>
>      /* restore (last) saved position */
> --
> 2.34.1
>
>

--000000000000d851c905d70a5fda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Does the version proposed in v3 address the V9fsFidSt=
ate issues? In 9p.c for v2 to v3, we propose</div><div><pre><code>-    retu=
rn telldir(fidp-&gt;fs.dir.stream);
+    return v9fs_co_telldir(pdu, fidp);<br><br></code></pre><pre><code><fon=
t face=3D"arial,sans-serif">and in codir.c from v2 to v3 we propose<br><cod=
e>-        saved_dir_pos =3D telldir(fidp-&gt;fs.dir.stream);
+        saved_dir_pos =3D s-&gt;ops-&gt;telldir(&amp;s-&gt;ctx, &amp;fidp-=
&gt;fs);<br><br></code></font></code></pre><pre><code><font face=3D"arial,s=
ans-serif"><code><font face=3D"arial,sans-serif">This removes the direct ac=
cess to </font>fidp-&gt;<font face=3D"arial,sans-serif">, and we hope this =
should be sufficient to avoid the concurrency <br>and undefined behaviors y=
ou noted in the v2 review.</font><code><font face=3D"arial,sans-serif"><cod=
e></code></font></code></code></font></code></pre></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 202=
2 at 7:56 PM Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com">wwcohen@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" ta=
rget=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
<br>
On darwin d_seekoff exists, but is optional and does not seem to<br>
be commonly used by file systems. Use `telldir` instead to obtain<br>
the seek offset.<br>
<br>
Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" =
target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
[Michael Roitzsch: - Rebase for NixOS]<br>
Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@icloud=
.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
[Will Cohen: - Adjust to pass testing]<br>
Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" target=
=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
Signed-off-by: Fabian Franz &lt;<a href=3D"mailto:github@fabian-franz.de" t=
arget=3D"_blank">github@fabian-franz.de</a>&gt;<br>
---<br>
=C2=A0hw/9pfs/9p-synth.c |=C2=A0 2 ++<br>
=C2=A0hw/9pfs/9p.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 33 +++++++++++++++++++++++++=
++++++--<br>
=C2=A0hw/9pfs/codir.c=C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
=C2=A03 files changed, 37 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c<br>
index 4a4a776d06..09b9c25288 100644<br>
--- a/hw/9pfs/9p-synth.c<br>
+++ b/hw/9pfs/9p-synth.c<br>
@@ -222,7 +222,9 @@ static void synth_direntry(V9fsSynthNode *node,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0strcpy(entry-&gt;d_name, node-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0entry-&gt;d_ino =3D node-&gt;attr-&gt;inode;<br>
+#ifndef CONFIG_DARWIN<br>
=C2=A0 =C2=A0 =C2=A0entry-&gt;d_off =3D off + 1;<br>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static struct dirent *synth_get_dentry(V9fsSynthNode *dir,<br>
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c<br>
index 1563d7b7c6..7851f85f8f 100644<br>
--- a/hw/9pfs/9p.c<br>
+++ b/hw/9pfs/9p.c<br>
@@ -2218,6 +2218,25 @@ static int v9fs_xattr_read(V9fsState *s, V9fsPDU *pd=
u, V9fsFidState *fidp,<br>
=C2=A0 =C2=A0 =C2=A0return offset;<br>
=C2=A0}<br>
<br>
+/**<br>
+ * Get the seek offset of a dirent. If not available from the structure it=
self,<br>
+ * obtain it by calling telldir.<br>
+ */<br>
+static int v9fs_dent_telldir(V9fsPDU *pdu, V9fsFidState *fidp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dirent *dent)<br>
+{<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Darwin has d_seekoff, which appears to function simi=
larly to d_off.<br>
+=C2=A0 =C2=A0 =C2=A0* However, it does not appear to be supported on all f=
ile systems,<br>
+=C2=A0 =C2=A0 =C2=A0* so use telldir for correctness.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 return v9fs_co_telldir(pdu, fidp);<br>
+#else<br>
+=C2=A0 =C2=A0 return dent-&gt;d_off;<br>
+#endif<br>
+}<br>
+<br>
=C2=A0static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0V9fsFidState *fidp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t max_count)<br>
@@ -2281,7 +2300,11 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9=
fsPDU *pdu,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0count +=3D len;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_stat_free(&amp;v9stat);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_path_free(&amp;path);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D dent-&gt;d_off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D v9fs_dent_telldir(pdu, fidp,=
 dent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (saved_dir_pos &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D saved_dir_pos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0v9fs_readdir_unlock(&amp;fidp-&gt;fs.dir);<br>
@@ -2420,6 +2443,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu,=
 V9fsFidState *fidp,<br>
=C2=A0 =C2=A0 =C2=A0V9fsString name;<br>
=C2=A0 =C2=A0 =C2=A0int len, err =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0int32_t count =3D 0;<br>
+=C2=A0 =C2=A0 off_t off;<br>
=C2=A0 =C2=A0 =C2=A0struct dirent *dent;<br>
=C2=A0 =C2=A0 =C2=A0struct stat *st;<br>
=C2=A0 =C2=A0 =C2=A0struct V9fsDirEnt *entries =3D NULL;<br>
@@ -2480,12 +2504,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pd=
u, V9fsFidState *fidp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qid.version =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 off =3D v9fs_dent_telldir(pdu, fidp, dent);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (off &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_string_init(&amp;name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_string_sprintf(&amp;name, &quot;%s&q=
uot;, dent-&gt;d_name);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 11 =3D 7 + 4 (7 =3D start offset, 4 =
=3D space for storing count) */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D pdu_marshal(pdu, 11 + count, &quo=
t;Qqbs&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;qid, dent-&gt;d_off,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;qid, off,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0dent-&gt;d_type, &amp;name);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_string_free(&amp;name);<br>
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c<br>
index 032cce04c4..c1b5694f3f 100644<br>
--- a/hw/9pfs/codir.c<br>
+++ b/hw/9pfs/codir.c<br>
@@ -167,7 +167,11 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState =
*fidp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size +=3D len;<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D s-&gt;ops-&gt;telldir(&amp;s=
-&gt;ctx, &amp;fidp-&gt;fs);<br>
+#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_dir_pos =3D dent-&gt;d_off;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* restore (last) saved position */<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000d851c905d70a5fda--

