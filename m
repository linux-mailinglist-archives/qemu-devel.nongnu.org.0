Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916293C14AA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:50:46 +0200 (CEST)
Received: from localhost ([::1]:57562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1UQO-0003ao-EK
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1UP8-0002vE-SF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:49:26 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1UP6-0003IH-2Z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:49:26 -0400
Received: by mail-ed1-x52b.google.com with SMTP id l24so8586541edr.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c8Z2FI9BK7T/qOwI6m56bzbOFYhlq7VWq2DFyCoLn2E=;
 b=XQQ4a6ZJXB3Ldf1FtAqfK5SbUEYBTD9+jbbP5CCB5erwCN3EZCrlpMPcrjzxk/I6eZ
 YQfpqetBrlNspT+z2EDOiVNheHOA0zGVoP1sNy9zvp8u43xTenxtWSnACHN0y7Di23KB
 wyqKgOh6AHjiPsLsmL55Hj2Phwm9Yi6VlWqBC4lGgCfGXu5uLtqjQZIaaXXu/6A0NuDa
 pGyQQ0nLCO0Q6BYB0dmD+qRxtTypeAvOvBOTPU1+/hgM9UPY95O3KZ9lq8bYblUKSBHR
 brYBPFJVwWN4xCbGVzJd9/N61ai2jMudq2xS/bdt/42zkPQMCZ2u3dDbSViQ8iVuV8GV
 98Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c8Z2FI9BK7T/qOwI6m56bzbOFYhlq7VWq2DFyCoLn2E=;
 b=Nuw+aGmB+hK54BPgRhOyxUEQ4B5Xp4Kz9qX249PgvfqOudJed/vpv3IyWku378e7eU
 DPHqkSMM8Xm0dDCsv+VPr5ibpskmvgmx0k6YckYzORaivXVH5L5c89bfy/fehJsW1xVC
 4wQoPdd7IbEa6rNrK6d3o1NYxDeTeXEX0EpJrwCcMlXrvk8KXron5YzJ2cGXTJgURm4d
 Z5Gr76WJ/u7L1KtDCFLiu7yJgTWOZYY70C2Grc/cQLig/q7fBvq8thUGGMXAVqYvTRhc
 9y7vMzsKL2iyZQIqATkABuPdtyo1XJlEgmwjaVHpfbWK01L/EfDMHx8xTjTa2yMtvJ0q
 lKOg==
X-Gm-Message-State: AOAM5319GAOd5beRLUzFPTUZmm/kXB1VDJ7a3K7fB1CGE4pkB2VRUiZV
 IN8+fWqx3guEZVNiy1ai6XY5Q4PkzUucSJxJjYY=
X-Google-Smtp-Source: ABdhPJzdhyUcD/RWaYMT7lF11EuUg0sj4MW6FcBd6j5T3ZyL89lXqmssfGa55OzXQVTuts66LsW9JC3K96A7CXXPOrg=
X-Received: by 2002:a05:6402:b79:: with SMTP id
 cb25mr38264120edb.164.1625752162530; 
 Thu, 08 Jul 2021 06:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-6-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-6-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 17:49:11 +0400
Message-ID: <CAJ+F1CKEec4=KH1kER5WmH2-LD+EshXhxQtPcXezCduuG7+_VQ@mail.gmail.com>
Subject: Re: [PATCH V5 05/25] as_flat_walk
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000023fb2d05c69cec5d"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000023fb2d05c69cec5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 7, 2021 at 9:28 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Add an iterator over the sections of a flattened address space.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/exec/memory.h | 17 +++++++++++++++++
>  softmmu/memory.c      | 18 ++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 7ad63f8..a030aef 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2023,6 +2023,23 @@ bool memory_region_present(MemoryRegion *container=
,
> hwaddr addr);
>   */
>  bool memory_region_is_mapped(MemoryRegion *mr);
>
> +typedef int (*qemu_flat_walk_cb)(MemoryRegionSection *s,
> +                                 void *handle,
> +                                 Error **errp);
>

Please document the callback type, especially returned values. (see for
example flatview_cb)

Usually, the user pointer is called "opaque".

Could it be named memory_region_section_cb instead ?

+
> +/**
> + * as_flat_walk: walk the ranges in the address space flat view and call
> @func
> + * for each.  Return 0 on success, else return non-zero with a message i=
n
> + * @errp.
>

Suggest address_space_flat_for_each_section() name ?



> + *
> + * @as: target address space
> + * @func: callback function
> + * @handle: passed to @func
>

opaque

+ * @errp: passed to @func
> + */
> +int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func,
> +                 void *handle, Error **errp);
> +
>  /**
>   * memory_region_find: translate an address/size relative to a
>   * MemoryRegion into a #MemoryRegionSection.
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index e9536bc..1ec1e25 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2577,6 +2577,24 @@ bool memory_region_is_mapped(MemoryRegion *mr)
>      return mr->container ? true : false;
>  }
>
> +int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func,
> +                 void *handle, Error **errp)
> +{
> +    FlatView *view =3D address_space_get_flatview(as);
> +    FlatRange *fr;
> +    int ret;
> +
> +    FOR_EACH_FLAT_RANGE(fr, view) {
> +        MemoryRegionSection section =3D section_from_flat_range(fr, view=
);
> +        ret =3D func(&section, handle, errp);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  /* Same as memory_region_find, but it does not add a reference to the
>   * returned region.  It must be called from an RCU critical section.
>   */
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000023fb2d05c69cec5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:28 PM Stev=
e Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@o=
racle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add an iterator over the sections of a flattened address space.<=
br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/exec/memory.h | 17 +++++++++++++++++<br>
=C2=A0softmmu/memory.c=C2=A0 =C2=A0 =C2=A0 | 18 ++++++++++++++++++<br>
=C2=A02 files changed, 35 insertions(+)<br>
<br>
diff --git a/include/exec/memory.h b/include/exec/memory.h<br>
index 7ad63f8..a030aef 100644<br>
--- a/include/exec/memory.h<br>
+++ b/include/exec/memory.h<br>
@@ -2023,6 +2023,23 @@ bool memory_region_present(MemoryRegion *container, =
hwaddr addr);<br>
=C2=A0 */<br>
=C2=A0bool memory_region_is_mapped(MemoryRegion *mr);<br>
<br>
+typedef int (*qemu_flat_walk_cb)(MemoryRegionSection *s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *handle,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp);<br></blockquote=
><div><br></div><div>Please document the callback type, especially returned=
 values. (see for example flatview_cb)<br></div><div><br></div><div>Usually=
, the user pointer is called &quot;opaque&quot;.</div><div><br></div><div>C=
ould it be named memory_region_section_cb instead ?<br></div><div> <br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+/**<br>
+ * as_flat_walk: walk the ranges in the address space flat view and call @=
func<br>
+ * for each.=C2=A0 Return 0 on success, else return non-zero with a messag=
e in<br>
+ * @errp.<br>
</blockquote><div><br></div><div>Suggest address_space_flat_for_each_sectio=
n() name ?</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">+ *<br>
+ * @as: target address space<br>
+ * @func: callback function<br>
+ * @handle: passed to @func<br></blockquote><div><br></div><div>opaque</di=
v><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+ * @errp: passed to @func<br>
+ */<br>
+int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *handle=
, Error **errp);<br>
+<br>
=C2=A0/**<br>
=C2=A0 * memory_region_find: translate an address/size relative to a<br>
=C2=A0 * MemoryRegion into a #MemoryRegionSection.<br>
diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
index e9536bc..1ec1e25 100644<br>
--- a/softmmu/memory.c<br>
+++ b/softmmu/memory.c<br>
@@ -2577,6 +2577,24 @@ bool memory_region_is_mapped(MemoryRegion *mr)<br>
=C2=A0 =C2=A0 =C2=A0return mr-&gt;container ? true : false;<br>
=C2=A0}<br>
<br>
+int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *handle=
, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 FlatView *view =3D address_space_get_flatview(as);<br>
+=C2=A0 =C2=A0 FlatRange *fr;<br>
+=C2=A0 =C2=A0 int ret;<br>
+<br>
+=C2=A0 =C2=A0 FOR_EACH_FLAT_RANGE(fr, view) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MemoryRegionSection section =3D section_from_f=
lat_range(fr, view);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D func(&amp;section, handle, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0/* Same as memory_region_find, but it does not add a reference to the=
<br>
=C2=A0 * returned region.=C2=A0 It must be called from an RCU critical sect=
ion.<br>
=C2=A0 */<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000023fb2d05c69cec5d--

