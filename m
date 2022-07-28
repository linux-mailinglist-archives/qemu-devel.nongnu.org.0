Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB535583F0E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:41:46 +0200 (CEST)
Received: from localhost ([::1]:38132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH2pl-0001ym-PZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH2lT-0006fu-Ub
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:37:19 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:36633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH2lR-0007kR-VR
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:37:19 -0400
Received: by mail-lf1-x130.google.com with SMTP id q23so2665640lfr.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QIFminAmJp/ZQxlQRozu0rYif+gCG4I2QJAe3+PtMhA=;
 b=bLKVrW68Lth8YF6YoSODKgw95fTT1ATZLLRZ8QhGMemwdF9DCCwuxT6GPAY7xl9SNJ
 Xd94OxYScVb3BKpxKxY+Np89BUkimpn1OjfxBSa9W3rtCFXW7mbQ/8+gmmRuOpjbSPJD
 yxLrMUUTNXZC1HSHaorE3hIiiG3BDAO/R44zdf5vJmjsCyJ9hjauj8+wRoaJj07zY1X3
 N7qZhpCjIKwiKovKlga84knv04XTFyXiLuxfK7uRrfV0MRdeKDiQ2K2wi/GWblVG1x6t
 9kciNTR0oXibzDAFGjC+PR8izZsmTqiphaaRucLB/TdfiusC+74gUn58wmrffpJR6WdW
 A+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QIFminAmJp/ZQxlQRozu0rYif+gCG4I2QJAe3+PtMhA=;
 b=D8DAMckNjBbTqqtd5LrzQy0oUO5R5MWILEZI/4lAyxEQF9YVycaxfT2xMvavQT/FLs
 ex7v+JXazNk0aC/dYsnME0d+ZDKm3UB4msAy0iNCFvsN8d0uC1Or2S4w5CLnC0iftbX1
 aV1OOvwd1I3oWK9m//BJycvfLyD3Keb0F56XFlN4uVASoiS0ws0APcDZZmmciVNgHW5Z
 p3aZqyGzsTvFj3YdavY6d26wR3GlI1EVVyfKtVi0h9bL5Ih0arhQT7jK03HOlEOPT9fW
 f937PNyhUf8dV4ssaDNXrlDrkuIV+lIFBd51sfbRgOt96F7vesKdnQ7dLJdBY0+FRSvg
 0nQA==
X-Gm-Message-State: AJIora8dxOchn/351pk8okkxZOMAusGbMLIQIq792fDS1/jaBPf3hdkH
 0becQlt65gvp/vz/b02GX4kHnG5ewLryDnXWihA=
X-Google-Smtp-Source: AGRyM1uDDzdvflii+PbunAaPQFvCmAx80Tk39Rdp9sQsKh5cUqRRsfpuA6oZOPfq5pbH9J8FuYN5r81+49CM3hqg1JU=
X-Received: by 2002:a05:6512:10c9:b0:48a:beea:122f with SMTP id
 k9-20020a05651210c900b0048abeea122fmr2041073lfg.94.1659011835514; Thu, 28 Jul
 2022 05:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220727140110.2698-1-hogan.wang@huawei.com>
 <20220727140110.2698-3-hogan.wang@huawei.com>
In-Reply-To: <20220727140110.2698-3-hogan.wang@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jul 2022 16:37:04 +0400
Message-ID: <CAJ+F1CK_YZBsy8UEem0aJd6FKgeA1QfYK60Tn0tCTUAuT7LZHw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dump: support cancel dump process
To: Hogan Wang <hogan.wang@huawei.com>, Kevin Wolf <kwolf@redhat.com>
Cc: berrange@redhat.com, qemu-devel@nongnu.org, wangxinxin.wang@huawei.com
Content-Type: multipart/alternative; boundary="00000000000022586405e4dccb32"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000022586405e4dccb32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 27, 2022 at 6:02 PM Hogan Wang via <qemu-devel@nongnu.org>
wrote:

> Break saving pages or dump iterate when dump job in cancel state,
> make sure dump process exits as soon as possible.
>
> Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
>

Overall, the series looks good to me. Please send it with a top cover
letter, so it can be processed by patchew too.

I am not familiar with the job infrastructure, it would be nice if Kevin
could check the usage or give some advice.

thanks

---
>  dump/dump.c           | 24 ++++++++++++++++++++++++
>  include/sysemu/dump.h |  2 ++
>  2 files changed, 26 insertions(+)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 51dc933c7c..881895e831 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -54,6 +54,8 @@ static Error *dump_migration_blocker;
>        DIV_ROUND_UP((name_size), 4) +                    \
>        DIV_ROUND_UP((desc_size), 4)) * 4)
>
> +static bool dump_cancelling(void);
> +
>  static inline bool dump_is_64bit(DumpState *s)
>  {
>      return s->dump_info.d_class =3D=3D ELFCLASS64;
> @@ -118,6 +120,10 @@ static int fd_write_vmcore(const void *buf, size_t
> size, void *opaque)
>      DumpState *s =3D opaque;
>      size_t written_size;
>
> +    if (dump_cancelling()) {
> +        return -ECANCELED;
> +    }
> +
>      written_size =3D qemu_write_full(s->fd, buf, size);
>      if (written_size !=3D size) {
>          return -errno;
> @@ -627,6 +633,10 @@ static void dump_iterate(DumpState *s, Error **errp)
>
>      do {
>          block =3D s->next_block;
> +        if (dump_cancelling()) {
> +            error_setg(errp, "dump: job cancelled");
> +            return;
> +        }
>
>          size =3D block->target_end - block->target_start;
>          if (s->has_filter) {
> @@ -1321,6 +1331,10 @@ static void write_dump_pages(DumpState *s, Error
> **errp)
>       * first page of page section
>       */
>      while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
> +        if (dump_cancelling()) {
> +            error_setg(errp, "dump: job cancelled");
> +            goto out;
> +        }
>          /* check zero page */
>          if (buffer_is_zero(buf, s->dump_info.page_size)) {
>              ret =3D write_cache(&page_desc, &pd_zero,
> sizeof(PageDescriptor),
> @@ -1548,6 +1562,15 @@ bool qemu_system_dump_in_progress(void)
>      return (qatomic_read(&state->status) =3D=3D DUMP_STATUS_ACTIVE);
>  }
>
> +static bool dump_cancelling(void)
> +{
> +    DumpState *state =3D &dump_state_global;
> +    if (state->job && job_is_cancelled(state->job)) {
> +        return true;
> +    }
> +    return false;
> +}
> +
>  /* calculate total size of memory to be dumped (taking filter into
>   * acoount.) */
>  static int64_t dump_calculate_size(DumpState *s)
> @@ -1894,6 +1917,7 @@ static int coroutine_fn
> dump_guest_memory_job_run(Job *job, Error **errp)
>
>      s->errp =3D errp;
>      s->co =3D qemu_coroutine_self();
> +    state->job =3D job;
>
>      if (state->detached) {
>          /* detached dump */
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index ffc2ea1072..41bdbe595f 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -15,6 +15,7 @@
>  #define DUMP_H
>
>  #include "qapi/qapi-types-dump.h"
> +#include "qemu/job.h"
>
>  #define MAKEDUMPFILE_SIGNATURE      "makedumpfile"
>  #define MAX_SIZE_MDF_HEADER         (4096) /* max size of
> makedumpfile_header */
> @@ -154,6 +155,7 @@ typedef struct DumpState {
>      GuestPhysBlockList guest_phys_blocks;
>      ArchDumpInfo dump_info;
>      MemoryMappingList list;
> +    Job *job;
>      uint32_t phdr_num;
>      uint32_t shdr_num;
>      bool resume;
> --
> 2.33.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000022586405e4dccb32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 6:02 PM Hog=
an Wang via &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Break saving pages or dump iterate when dump job in cancel state,<br>
make sure dump process exits as soon as possible.<br>
<br>
Signed-off-by: Hogan Wang &lt;<a href=3D"mailto:hogan.wang@huawei.com" targ=
et=3D"_blank">hogan.wang@huawei.com</a>&gt;<br></blockquote><div><br></div>=
<div>Overall, the series looks good to me. Please send it with a top cover =
letter, so it can be processed by patchew too.</div><div><br></div><div>I a=
m not familiar with the job infrastructure, it would be nice if Kevin could=
 check the usage or give some advice.</div><div><br></div><div>thanks<br></=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 ++++++++++++=
++++++++++++<br>
=C2=A0include/sysemu/dump.h |=C2=A0 2 ++<br>
=C2=A02 files changed, 26 insertions(+)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 51dc933c7c..881895e831 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -54,6 +54,8 @@ static Error *dump_migration_blocker;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP((name_size), 4) +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP((desc_size), 4)) * 4)<br>
<br>
+static bool dump_cancelling(void);<br>
+<br>
=C2=A0static inline bool dump_is_64bit(DumpState *s)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return s-&gt;dump_info.d_class =3D=3D ELFCLASS64;<br>
@@ -118,6 +120,10 @@ static int fd_write_vmcore(const void *buf, size_t siz=
e, void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0DumpState *s =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0size_t written_size;<br>
<br>
+=C2=A0 =C2=A0 if (dump_cancelling()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ECANCELED;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0written_size =3D qemu_write_full(s-&gt;fd, buf, size);<=
br>
=C2=A0 =C2=A0 =C2=A0if (written_size !=3D size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -errno;<br>
@@ -627,6 +633,10 @@ static void dump_iterate(DumpState *s, Error **errp)<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0do {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block =3D s-&gt;next_block;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dump_cancelling()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;dump: job=
 cancelled&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D block-&gt;target_end - block-&gt=
;target_start;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;has_filter) {<br>
@@ -1321,6 +1331,10 @@ static void write_dump_pages(DumpState *s, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0 * first page of page section<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0while (get_next_page(&amp;block_iter, &amp;pfn_iter, &a=
mp;buf, s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dump_cancelling()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;dump: job=
 cancelled&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* check zero page */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (buffer_is_zero(buf, s-&gt;dump_info.p=
age_size)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D write_cache(&amp;pa=
ge_desc, &amp;pd_zero, sizeof(PageDescriptor),<br>
@@ -1548,6 +1562,15 @@ bool qemu_system_dump_in_progress(void)<br>
=C2=A0 =C2=A0 =C2=A0return (qatomic_read(&amp;state-&gt;status) =3D=3D DUMP=
_STATUS_ACTIVE);<br>
=C2=A0}<br>
<br>
+static bool dump_cancelling(void)<br>
+{<br>
+=C2=A0 =C2=A0 DumpState *state =3D &amp;dump_state_global;<br>
+=C2=A0 =C2=A0 if (state-&gt;job &amp;&amp; job_is_cancelled(state-&gt;job)=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
=C2=A0/* calculate total size of memory to be dumped (taking filter into<br=
>
=C2=A0 * acoount.) */<br>
=C2=A0static int64_t dump_calculate_size(DumpState *s)<br>
@@ -1894,6 +1917,7 @@ static int coroutine_fn dump_guest_memory_job_run(Job=
 *job, Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;errp =3D errp;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;co =3D qemu_coroutine_self();<br>
+=C2=A0 =C2=A0 state-&gt;job =3D job;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (state-&gt;detached) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* detached dump */<br>
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
index ffc2ea1072..41bdbe595f 100644<br>
--- a/include/sysemu/dump.h<br>
+++ b/include/sysemu/dump.h<br>
@@ -15,6 +15,7 @@<br>
=C2=A0#define DUMP_H<br>
<br>
=C2=A0#include &quot;qapi/qapi-types-dump.h&quot;<br>
+#include &quot;qemu/job.h&quot;<br>
<br>
=C2=A0#define MAKEDUMPFILE_SIGNATURE=C2=A0 =C2=A0 =C2=A0 &quot;makedumpfile=
&quot;<br>
=C2=A0#define MAX_SIZE_MDF_HEADER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(4096) /=
* max size of makedumpfile_header */<br>
@@ -154,6 +155,7 @@ typedef struct DumpState {<br>
=C2=A0 =C2=A0 =C2=A0GuestPhysBlockList guest_phys_blocks;<br>
=C2=A0 =C2=A0 =C2=A0ArchDumpInfo dump_info;<br>
=C2=A0 =C2=A0 =C2=A0MemoryMappingList list;<br>
+=C2=A0 =C2=A0 Job *job;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t phdr_num;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t shdr_num;<br>
=C2=A0 =C2=A0 =C2=A0bool resume;<br>
-- <br>
2.33.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000022586405e4dccb32--

