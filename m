Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12FA4AC11E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:29:09 +0100 (CET)
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH50u-00063T-Sa
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nH4SC-00005y-Jc
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:53:36 -0500
Received: from [2a00:1450:4864:20::12e] (port=35733
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nH4SA-0008AF-6k
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:53:16 -0500
Received: by mail-lf1-x12e.google.com with SMTP id i34so27065659lfv.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 05:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uWDtopB+QM4jYEMTZ9lWMjlZMaJJyZaNy2Ftd+Ik3yA=;
 b=kEfHKK4kNfrnkbvNIfUmbrSxr2SkmgBEG64S1hC9LsPHbt9/SQRVb8cxAUDH2XGQsn
 +Y8UODWfIhDZ//Xt6EJh7HTYty+LNIJllTNf3RTAOUgfasQRcQh+LHWyvoXSI9rmtw8F
 DMQxO5BmWOFhMUzH2HsYsaLToRgPaMbYlnZhEoPz3AsITMk9KsUt9hC8EUPbuaXnMtRU
 +ufU4beSqStfmFSvrDrU6YMoIuzY/wA0bs09xzOioJ77yPIAHI8GvJ+GQLv2nlYyDhlh
 EpnAnmuNkQH/iPHiELGbef7AR85ZbgTHTrRiYIuVaKYj5DtjEPnoxkPnik041Li7034y
 +c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uWDtopB+QM4jYEMTZ9lWMjlZMaJJyZaNy2Ftd+Ik3yA=;
 b=iimUvCe6EgLrnMEf/vrqLtdvFMLHxerF41y/HC0M31gWqnPlYFL546c6RyTafQfkT7
 OKie78rqwH/ItYrCXF6WnO5EgeXly8hADzzWLxK76wx45a3m5U9KjCx5KrOQEOGzE8V0
 729mR7m3kPXqpHhB0rGWJYelPE8BNQg/XYIE3agRymdVhjTPD6At8CC2BbEHA3gEszg3
 9iL9fzPjerinoAXsKuJh5nRcovtDT1lrWDZVPidvYqVOqxZzXKWVva8KwaIbScIM0Hwn
 NkkDJofAh+fM0zzeiLS2xng2gPWVSUEIcGk61+QvzUwfA6Tpqkt9jGkSWclrOH52Rr/Q
 DIEg==
X-Gm-Message-State: AOAM531BUSnX9mLhWJGm7XTZZLXH1hkL9l209udUq56pylsl23TPZbJK
 Nt9VRWGwtXE6pnEagvtNavAYo76OgUbqlbLOIls=
X-Google-Smtp-Source: ABdhPJzO9nRxB5kV+U8KiGZOGGQctlgzeBNryox6+z2KeDWOLYwpPF02Hjl1IUZ2IS2Hk05lMsXeVv07Bry0XoRZyO0=
X-Received: by 2002:a05:6512:368f:: with SMTP id
 d15mr8147724lfs.447.1644241989784; 
 Mon, 07 Feb 2022 05:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-5-wwcohen@gmail.com>
 <CAP+dFMJPB5RrYd3DjsX1YXeuw-grL+iW6yV5jmE_yiTRU-c5Rg@mail.gmail.com>
In-Reply-To: <CAP+dFMJPB5RrYd3DjsX1YXeuw-grL+iW6yV5jmE_yiTRU-c5Rg@mail.gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 7 Feb 2022 08:52:58 -0500
Message-ID: <CAB26zV2dt+n8uF2r21VegNy2q2mudUb0QjArQ0dAoyo8+kXAZA@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] 9p: darwin: Handle struct dirent differences
To: Fabian Franz <fabianfranz.oss@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b9d6ea05d76deb01"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12e.google.com
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
 qemu-devel@nongnu.org, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b9d6ea05d76deb01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2022 at 4:53 AM Fabian Franz <fabianfranz.oss@gmail.com>
wrote:

> Comments inline:
>
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
>> index 1a5e3eed73..7137a28109 100644
>> --- a/hw/9pfs/9p-local.c
>> +++ b/hw/9pfs/9p-local.c
>> @@ -559,6 +559,15 @@ static struct dirent *local_readdir(FsContext *ctx,
>> V9fsFidOpenState *fs)
>>
>>  again:
>>      entry =3D readdir(fs->dir.stream);
>> +#ifdef CONFIG_DARWIN
>> +    int td;
>> +    td =3D telldir(fs->dir.stream);
>
>
> Maybe call this =E2=80=9Eoff=E2=80=9C?
>

Yes, off is better. Will adjust for v5.


>
>> +    /* If telldir fails, fail the entire readdir call */
>> +    if (td < 0) {
>> +        return NULL;
>> +    }
>> +    entry->d_seekoff =3D td;
>> +#endif
>>      if (!entry) {
>>          return NULL;
>>      }
>
>
> This needs to be before the #ifdef!
>

Good catch, will adjust for v5. I moved it around twice and forgot to put
it in the right place.


>
>
>> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
>> index b1664080d8..8b4b5cf7dc 100644
>> --- a/hw/9pfs/9p-proxy.c
>> +++ b/hw/9pfs/9p-proxy.c
>> @@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx,
>> V9fsFidOpenState *fs)
>>
>>  static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenState *f=
s)
>>  {
>> -    return readdir(fs->dir.stream);
>> +    struct dirent *entry;
>> +    entry =3D readdir(fs->dir.stream);
>> +#ifdef CONFIG_DARWIN
>> +    if (!entry) {
>> +        return NULL;
>> +    }
>> +    int td;
>> +    td =3D telldir(fs->dir.stream);
>> +    /* If telldir fails, fail the entire readdir call */
>> +    if (td < 0) {
>> +        return NULL;
>> +    }
>> +    entry->d_seekoff =3D td;
>> +#endif
>> +    return entry;
>>  }
>>
>>  static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t
>> off)
>> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
>> index 4a4a776d06..e264a03eef 100644
>> --- a/hw/9pfs/9p-synth.c
>> +++ b/hw/9pfs/9p-synth.c
>> @@ -222,7 +222,11 @@ static void synth_direntry(V9fsSynthNode *node,
>>  {
>>      strcpy(entry->d_name, node->name);
>>      entry->d_ino =3D node->attr->inode;
>> +#ifdef CONFIG_DARWIN
>> +    entry->d_seekoff =3D off + 1;
>> +#else
>>      entry->d_off =3D off + 1;
>> +#endif
>>  }
>>
>>  static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
>> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
>> index 546f46dc7d..accbec9987 100644
>> --- a/hw/9pfs/9p-util.h
>> +++ b/hw/9pfs/9p-util.h
>> @@ -79,3 +79,20 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char
>> *filename,
>>                                  const char *name);
>>
>>  #endif
>> +
>> +
>> +/**
>> + * Darwin has d_seekoff, which appears to function similarly to d_off.
>> + * However, it does not appear to be supported on all file systems,
>> + * so ensure it is manually injected earlier and call here when
>> + * needed.
>> + */
>> +
>> +inline off_t qemu_dirent_off(struct dirent *dent)
>> +{
>> +#ifdef CONFIG_DARWIN
>> +    return dent->d_seekoff;
>> +#else
>> +    return dent->d_off;
>> +#endif
>> +}
>
>
> Are we sure we want a helper for two times the same ifdef? Deferring to
> maintainers here however.
>

Either way works for me too -- my current inclination is to leave it this
way (as originally suggested by the maintainers), if for no other reason
than that it allows the one comment to be referenced in the case of both
uses.


>
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
>> index 1563d7b7c6..cf694da354 100644
>> --- a/hw/9pfs/9p.c
>> +++ b/hw/9pfs/9p.c
>> @@ -27,6 +27,7 @@
>>  #include "virtio-9p.h"
>>  #include "fsdev/qemu-fsdev.h"
>>  #include "9p-xattr.h"
>> +#include "9p-util.h"
>>  #include "coth.h"
>>  #include "trace.h"
>>  #include "migration/blocker.h"
>> @@ -2281,7 +2282,11 @@ static int coroutine_fn
>> v9fs_do_readdir_with_stat(V9fsPDU *pdu,
>>          count +=3D len;
>>          v9fs_stat_free(&v9stat);
>>          v9fs_path_free(&path);
>> -        saved_dir_pos =3D dent->d_off;
>> +        saved_dir_pos =3D qemu_dirent_off(dent);
>> +        if (saved_dir_pos < 0) {
>> +            err =3D saved_dir_pos;
>> +            break;
>> +        }
>
>
> Do we still need this error-handling? I had removed it in my interdiff
> patch.
>

That's correct, it in fact can be removed. d_seekoff yields a __uint64_t (
https://developer.apple.com/documentation/kernel/direntry/1415494-d_seekoff=
?language=3Dobjc).
Will adjust for v5.


>
>>      }
>>
>>      v9fs_readdir_unlock(&fidp->fs.dir);
>> @@ -2420,6 +2425,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
>> *pdu, V9fsFidState *fidp,
>>      V9fsString name;
>>      int len, err =3D 0;
>>      int32_t count =3D 0;
>> +    off_t off;
>>      struct dirent *dent;
>>      struct stat *st;
>>      struct V9fsDirEnt *entries =3D NULL;
>> @@ -2480,12 +2486,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
>> *pdu, V9fsFidState *fidp,
>>              qid.version =3D 0;
>>          }
>>
>> +        off =3D qemu_dirent_off(dent);
>> +        if (off < 0) {
>> +            err =3D off;
>> +            break;
>> +        }
>
>
> Same here - if this can never fail, why add the error handling?
>

See above.


>
>
>>          v9fs_string_init(&name);
>>          v9fs_string_sprintf(&name, "%s", dent->d_name);
>>
>>          /* 11 =3D 7 + 4 (7 =3D start offset, 4 =3D space for storing co=
unt) */
>>          len =3D pdu_marshal(pdu, 11 + count, "Qqbs",
>> -                          &qid, dent->d_off,
>> +                          &qid, off,
>>                            dent->d_type, &name);
>>
>>          v9fs_string_free(&name);
>> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
>> index 032cce04c4..fac6759a64 100644
>> --- a/hw/9pfs/codir.c
>> +++ b/hw/9pfs/codir.c
>> @@ -167,7 +167,14 @@ static int do_readdir_many(V9fsPDU *pdu,
>> V9fsFidState *fidp,
>>          }
>>
>>          size +=3D len;
>> +        /* This conditional statement is identical in
>> +         * function to qemu_dirent_off, described in 9p-util.h,
>> +         * since that header cannot be included here. */
>> +#ifdef CONFIG_DARWIN
>> +        saved_dir_pos =3D dent->d_seekoff;
>> +#else
>>          saved_dir_pos =3D dent->d_off;
>> +#endif
>>      }
>>
>>      /* restore (last) saved position */
>> --
>> 2.32.0 (Apple Git-132)
>>
>>

--000000000000b9d6ea05d76deb01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 7, 2022 at 4:53 AM Fabian=
 Franz &lt;<a href=3D"mailto:fabianfranz.oss@gmail.com">fabianfranz.oss@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"auto">Comments inline:</div><div><br><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex" dir=3D"auto">
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>
index 1a5e3eed73..7137a28109 100644<br>
--- a/hw/9pfs/9p-local.c<br>
+++ b/hw/9pfs/9p-local.c<br>
@@ -559,6 +559,15 @@ static struct dirent *local_readdir(FsContext *ctx, V9=
fsFidOpenState *fs)<br>
<br>
=C2=A0again:<br>
=C2=A0 =C2=A0 =C2=A0entry =3D readdir(fs-&gt;dir.stream);<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 int td;<br>
+=C2=A0 =C2=A0 td =3D telldir(fs-&gt;dir.stream);</blockquote><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Maybe call this =E2=80=9Eoff=E2=80=9C?</di=
v></div></div></blockquote><div><br></div><div>Yes, off is better. Will adj=
ust for v5.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex" dir=3D"auto"><br>
+=C2=A0 =C2=A0 /* If telldir fails, fail the entire readdir call */<br>
+=C2=A0 =C2=A0 if (td &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D td;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0if (!entry) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}</blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">This needs to be before the #ifdef!</div></div></div></blockquote><div=
><br></div><div>Good catch, will adjust for v5. I moved it around twice and=
 forgot to put it in the right place.<br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div=
 dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" d=
ir=3D"auto"><br>
diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c<br>
index b1664080d8..8b4b5cf7dc 100644<br>
--- a/hw/9pfs/9p-proxy.c<br>
+++ b/hw/9pfs/9p-proxy.c<br>
@@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx, V9fsFidOpen=
State *fs)<br>
<br>
=C2=A0static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenState =
*fs)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return readdir(fs-&gt;dir.stream);<br>
+=C2=A0 =C2=A0 struct dirent *entry;<br>
+=C2=A0 =C2=A0 entry =3D readdir(fs-&gt;dir.stream);<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 if (!entry) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 int td;<br>
+=C2=A0 =C2=A0 td =3D telldir(fs-&gt;dir.stream);<br>
+=C2=A0 =C2=A0 /* If telldir fails, fail the entire readdir call */<br>
+=C2=A0 =C2=A0 if (td &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D td;<br>
+#endif<br>
+=C2=A0 =C2=A0 return entry;<br>
=C2=A0}<br>
<br>
=C2=A0static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t=
 off)<br>
diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c<br>
index 4a4a776d06..e264a03eef 100644<br>
--- a/hw/9pfs/9p-synth.c<br>
+++ b/hw/9pfs/9p-synth.c<br>
@@ -222,7 +222,11 @@ static void synth_direntry(V9fsSynthNode *node,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0strcpy(entry-&gt;d_name, node-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0entry-&gt;d_ino =3D node-&gt;attr-&gt;inode;<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D off + 1;<br>
+#else<br>
=C2=A0 =C2=A0 =C2=A0entry-&gt;d_off =3D off + 1;<br>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static struct dirent *synth_get_dentry(V9fsSynthNode *dir,<br>
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h<br>
index 546f46dc7d..accbec9987 100644<br>
--- a/hw/9pfs/9p-util.h<br>
+++ b/hw/9pfs/9p-util.h<br>
@@ -79,3 +79,20 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *f=
ilename,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name);<br>
<br>
=C2=A0#endif<br>
+<br>
+<br>
+/**<br>
+ * Darwin has d_seekoff, which appears to function similarly to d_off.<br>
+ * However, it does not appear to be supported on all file systems,<br>
+ * so ensure it is manually injected earlier and call here when<br>
+ * needed.<br>
+ */<br>
+<br>
+inline off_t qemu_dirent_off(struct dirent *dent)<br>
+{<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 return dent-&gt;d_seekoff;<br>
+#else<br>
+=C2=A0 =C2=A0 return dent-&gt;d_off;<br>
+#endif<br>
+}</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Are we sure we=
 want a helper for two times the same ifdef? Deferring to maintainers here =
however.</div></div></div></blockquote><div><br></div><div>Either way works=
 for me too -- my current inclination is to leave it this way (as originall=
y suggested by the maintainers), if for no other reason than that it allows=
 the one comment to be referenced in the case of both uses.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div cla=
ss=3D"gmail_quote"><div dir=3D"auto"><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex" dir=3D"auto">
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c<br>
index 1563d7b7c6..cf694da354 100644<br>
--- a/hw/9pfs/9p.c<br>
+++ b/hw/9pfs/9p.c<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &quot;virtio-9p.h&quot;<br>
=C2=A0#include &quot;fsdev/qemu-fsdev.h&quot;<br>
=C2=A0#include &quot;9p-xattr.h&quot;<br>
+#include &quot;9p-util.h&quot;<br>
=C2=A0#include &quot;coth.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;migration/blocker.h&quot;<br>
@@ -2281,7 +2282,11 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9=
fsPDU *pdu,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0count +=3D len;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_stat_free(&amp;v9stat);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_path_free(&amp;path);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D dent-&gt;d_off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D qemu_dirent_off(dent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (saved_dir_pos &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D saved_dir_pos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</blockquote><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Do we still need this error-handling? I had removed it in my =
interdiff patch.</div></div></div></blockquote><div><br></div>That&#39;s co=
rrect, it in fact can be removed. d_seekoff yields a __uint64_t (<a href=3D=
"https://developer.apple.com/documentation/kernel/direntry/1415494-d_seekof=
f?language=3Dobjc">https://developer.apple.com/documentation/kernel/direntr=
y/1415494-d_seekoff?language=3Dobjc</a>). Will adjust for v5.<br><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" dir=3D"a=
uto"><br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0v9fs_readdir_unlock(&amp;fidp-&gt;fs.dir);<br>
@@ -2420,6 +2425,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu,=
 V9fsFidState *fidp,<br>
=C2=A0 =C2=A0 =C2=A0V9fsString name;<br>
=C2=A0 =C2=A0 =C2=A0int len, err =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0int32_t count =3D 0;<br>
+=C2=A0 =C2=A0 off_t off;<br>
=C2=A0 =C2=A0 =C2=A0struct dirent *dent;<br>
=C2=A0 =C2=A0 =C2=A0struct stat *st;<br>
=C2=A0 =C2=A0 =C2=A0struct V9fsDirEnt *entries =3D NULL;<br>
@@ -2480,12 +2486,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pd=
u, V9fsFidState *fidp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qid.version =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 off =3D qemu_dirent_off(dent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (off &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</blockquote><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Same here - if this can never fail, why add the error handlin=
g?</div></div></div></blockquote><div><br></div><div>See above.<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div =
class=3D"gmail_quote"><div dir=3D"auto"><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex" dir=3D"auto"><br>
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
index 032cce04c4..fac6759a64 100644<br>
--- a/hw/9pfs/codir.c<br>
+++ b/hw/9pfs/codir.c<br>
@@ -167,7 +167,14 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState =
*fidp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size +=3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This conditional statement is identical in<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* function to qemu_dirent_off, described=
 in 9p-util.h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since that header cannot be included h=
ere. */<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D dent-&gt;d_seekoff;<br>
+#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_dir_pos =3D dent-&gt;d_off;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* restore (last) saved position */<br>
-- <br>
2.32.0 (Apple Git-132)<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000b9d6ea05d76deb01--

