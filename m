Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022CA57C5E3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 10:12:17 +0200 (CEST)
Received: from localhost ([::1]:41384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oERI8-0001eY-3S
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 04:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oERBW-0006VW-Pn
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:05:29 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:38550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oERBU-0002af-6U
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:05:26 -0400
Received: by mail-lj1-x234.google.com with SMTP id a10so901734ljj.5
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJ/1UKLV6k7M4FNo5+u/J27CSt3EDrkCPuAMVn7yGKY=;
 b=CyIK/oqSLX8PYcPc8/d2PTM92Bd83DvK1l+Qq5AtYdMwIlhWM74GXXTtGmZWtiiOXc
 eTgtfh4lvzdWJ3ELl4rYH0PLdN9mL8M6Vzh6nMDtHHBstDVi9p/rM84WEJDOrdPunkih
 0B/V0B79eIcX57BvSHVg5DkQ/TGgI0oODTL3tOtgQYVvHltylXQKBxxy+oNsUBpQ48Ah
 S7PfWzwt7Fhzk3r0mKJeU5K0kbVqS5dkmd9vaxi+tUXG97/lWY3SpzdJjiJAG3ZbMe/L
 T6IUVl4Un/WDp4Ddh8w3AbimH6VNlde6JS3j8mahjiC8qV+SGEIZiFoBmFykwOga4Y2z
 61Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJ/1UKLV6k7M4FNo5+u/J27CSt3EDrkCPuAMVn7yGKY=;
 b=NF8XTaexelgEjCOZCrXkPdDvIwQ2HIMjphKMi9Ovb1+hgGVX8rU4dQ7MkVFM3B7pZs
 LpGzv5BWbfiY8TjtpKsQ7ifU1Q4jCVrdtyVSO/mhcqo6RxhFE2RURmJUA0Ws4nSD1OPc
 W8WdahCfcMNya/APh0Vb9osMHvvl8FQUCL4Fb9J2UgypxB6godWf+m8Ah0X5u8T+UivZ
 HcFiHZH5aP1RwUESE9ScCfb8LLznKqpty59i7vbk3OOl7ixjBuDy2NNNbfiuPn0WaSPn
 YRJg0L3ByH8nE1nlqjTXF3rM4OcXUGK2VoXAobF6w7y0n4vTdJ3ZZ1Bx4AwUYV7tBC+o
 1uiA==
X-Gm-Message-State: AJIora+OJxK8uDX2mqzXqO9ZfACi9AZFYEXEVEEOo+MflLrlnsjOOPq9
 oWVYHFz8D0OtaT7Cl/19ERpfa/qaWq3mmzV6+j8=
X-Google-Smtp-Source: AGRyM1sSyDmHV8FdO4Prt7TMZSo35UyxPcypd2vHuBMJlPXePJzaqLVz9mU1B0/RJhuqCuQ1GEJeFbk2sRVALPWex4Y=
X-Received: by 2002:a05:651c:1542:b0:249:5d86:3164 with SMTP id
 y2-20020a05651c154200b002495d863164mr18401595ljp.500.1658390721862; Thu, 21
 Jul 2022 01:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220721062118.2015-1-hogan.wang@huawei.com>
In-Reply-To: <20220721062118.2015-1-hogan.wang@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Jul 2022 12:05:10 +0400
Message-ID: <CAJ+F1C+KNu+=q2tFbQMvvZwiOMG41iAddg4poAku219r1yGF+w@mail.gmail.com>
Subject: Re: [PATCH] dump: introduce dump-cancel QMP command
To: Hogan Wang <hogan.wang@huawei.com>
Cc: QEMU <qemu-devel@nongnu.org>, wangxinxin.wang@huawei.com
Content-Type: multipart/alternative; boundary="000000000000e020af05e44c2dd4"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
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

--000000000000e020af05e44c2dd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 21, 2022 at 10:24 AM Hogan Wang via <qemu-devel@nongnu.org>
wrote:

> There's no way to cancel the current executing dump process, lead to the
> virtual machine manager daemon((e.g. libvirtd) cannot restore the dump
> job after daemon restart.
>
> Add the 'cancelling' and 'cancelled' dump states.
>
> Use 'dump-cancel' qmp command Set the dump state as 'cancelling'.
> The dump process check the 'cancelling' state and break loops.
> The 'cancelled' state mark the dump process cancelled success.
>

This will only really work if the dump was detached. You should explain
that in the commit message & in the documentation.

>
> ---
>  dump/dump.c               | 38 ++++++++++++++++++++++++++++++++++++--
>  include/sysemu/runstate.h |  1 +
>  qapi/dump.json            | 21 ++++++++++++++++++++-
>  3 files changed, 57 insertions(+), 3 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 4d9658ffa2..a0ac85aa02 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -118,6 +118,10 @@ static int fd_write_vmcore(const void *buf, size_t
> size, void *opaque)
>      DumpState *s =3D opaque;
>      size_t written_size;
>
> +    if (qemu_system_dump_cancelling()) {
> +        return -ECANCELED;
> +    }
> +
>      written_size =3D qemu_write_full(s->fd, buf, size);
>      if (written_size !=3D size) {
>          return -errno;
> @@ -627,6 +631,10 @@ static void dump_iterate(DumpState *s, Error **errp)
>
>      do {
>          block =3D s->next_block;
> +        if (qemu_system_dump_cancelling()) {
> +            error_setg(errp, "dump: job cancelled");
> +            return;
> +        }
>
>          size =3D block->target_end - block->target_start;
>          if (s->has_filter) {
> @@ -1321,6 +1329,11 @@ static void write_dump_pages(DumpState *s, Error
> **errp)
>       * first page of page section
>       */
>      while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
> +        if (qemu_system_dump_cancelling()) {
> +            error_setg(errp, "dump: job cancelled");
> +            goto out;
> +        }
> +
>          /* check zero page */
>          if (buffer_is_zero(buf, s->dump_info.page_size)) {
>              ret =3D write_cache(&page_desc, &pd_zero,
> sizeof(PageDescriptor),
> @@ -1540,6 +1553,22 @@ bool qemu_system_dump_in_progress(void)
>      return (qatomic_read(&state->status) =3D=3D DUMP_STATUS_ACTIVE);
>  }
>
> +bool qemu_system_dump_cancelling(void)
> +{
> +    DumpState *state =3D &dump_state_global;
> +    return (qatomic_read(&state->status) =3D=3D DUMP_STATUS_CANCELLING);
> +}
> +
> +void qmp_dump_cancel(Error **errp)
> +{
> +    DumpState *state =3D &dump_state_global;
> +    if (!qemu_system_dump_in_progress()) {
> +        return;
> +    }
> +    qatomic_set(&state->status, DUMP_STATUS_CANCELLING);
> +}
>

qemu_system_dump_in_progress() should probably be updated to take
CANCELLING state into account (and avoid another dump to be created
concurrently)



> +
> +
>  /* calculate total size of memory to be dumped (taking filter into
>   * acoount.) */
>  static int64_t dump_calculate_size(DumpState *s)
> @@ -1838,8 +1867,13 @@ static void dump_process(DumpState *s, Error **err=
p)
>
>      /* make sure status is written after written_size updates */
>      smp_wmb();
> -    qatomic_set(&s->status,
> -               (*errp ? DUMP_STATUS_FAILED : DUMP_STATUS_COMPLETED));
> +    if (qemu_system_dump_cancelling()) {
> +        qatomic_set(&s->status, DUMP_STATUS_CANCELLED);
> +    } else if (*errp) {
> +        qatomic_set(&s->status, DUMP_STATUS_FAILED);
> +    } else {
> +        qatomic_set(&s->status, DUMP_STATUS_COMPLETED);
> +    }
>
>      /* send DUMP_COMPLETED message (unconditionally) */
>      result =3D qmp_query_dump(NULL);
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index f3ed52548e..a36c1d43f6 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -76,6 +76,7 @@ void qemu_system_reset(ShutdownCause reason);
>  void qemu_system_guest_panicked(GuestPanicInformation *info);
>  void qemu_system_guest_crashloaded(GuestPanicInformation *info);
>  bool qemu_system_dump_in_progress(void);
> +bool qemu_system_dump_cancelling(void);
>
>  #endif
>
> diff --git a/qapi/dump.json b/qapi/dump.json
> index 90859c5483..6dfbb6b7de 100644
> --- a/qapi/dump.json
> +++ b/qapi/dump.json
> @@ -108,7 +108,7 @@
>  # Since: 2.6
>  ##
>  { 'enum': 'DumpStatus',
> -  'data': [ 'none', 'active', 'completed', 'failed' ] }
> +  'data': [ 'none', 'active', 'completed', 'failed', 'cancelling',
> 'cancelled' ] }
>
>  ##
>  # @DumpQueryResult:
> @@ -200,3 +200,22 @@
>  ##
>  { 'command': 'query-dump-guest-memory-capability',
>    'returns': 'DumpGuestMemoryCapability' }
> +
> +##
> +# @dump-cancel:
> +#
> +# Cancel the current executing dump process.
> +#
> +# Returns: nothing on success
> +#
> +# Notes: This command succeeds even if there is no dump process running.
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# -> { "execute": "dump-cancel" }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'dump-cancel' }
> --
> 2.33.0
>

Looks good to me, but I wish there would be some tests. Could you try to
write some?


--=20
Marc-Andr=C3=A9 Lureau

--000000000000e020af05e44c2dd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 21, 2022 at 10:24 AM Ho=
gan Wang via &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">There&#39;s no way to cancel the current executing dump process, lead t=
o the<br>
virtual machine manager daemon((e.g. libvirtd) cannot restore the dump<br>
job after daemon restart.<br>
<br>
Add the &#39;cancelling&#39; and &#39;cancelled&#39; dump states.<br>
<br>
Use &#39;dump-cancel&#39; qmp command Set the dump state as &#39;cancelling=
&#39;.<br>
The dump process check the &#39;cancelling&#39; state and break loops. <br>
The &#39;cancelled&#39; state mark the dump process cancelled success.<br><=
/blockquote><div><br></div><div>This will only really work if the dump was =
detached. You should explain that in the commit message &amp; in the docume=
ntation.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
---<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
8 ++++++++++++++++++++++++++++++++++++--<br>
=C2=A0include/sysemu/runstate.h |=C2=A0 1 +<br>
=C2=A0qapi/dump.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 ++++++++=
++++++++++++-<br>
=C2=A03 files changed, 57 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 4d9658ffa2..a0ac85aa02 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -118,6 +118,10 @@ static int fd_write_vmcore(const void *buf, size_t siz=
e, void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0DumpState *s =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0size_t written_size;<br>
<br>
+=C2=A0 =C2=A0 if (qemu_system_dump_cancelling()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ECANCELED;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0written_size =3D qemu_write_full(s-&gt;fd, buf, size);<=
br>
=C2=A0 =C2=A0 =C2=A0if (written_size !=3D size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -errno;<br>
@@ -627,6 +631,10 @@ static void dump_iterate(DumpState *s, Error **errp)<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0do {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block =3D s-&gt;next_block;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_system_dump_cancelling()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;dump: job=
 cancelled&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D block-&gt;target_end - block-&gt=
;target_start;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;has_filter) {<br>
@@ -1321,6 +1329,11 @@ static void write_dump_pages(DumpState *s, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0 * first page of page section<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0while (get_next_page(&amp;block_iter, &amp;pfn_iter, &a=
mp;buf, s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_system_dump_cancelling()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;dump: job=
 cancelled&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* check zero page */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (buffer_is_zero(buf, s-&gt;dump_info.p=
age_size)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D write_cache(&amp;pa=
ge_desc, &amp;pd_zero, sizeof(PageDescriptor),<br>
@@ -1540,6 +1553,22 @@ bool qemu_system_dump_in_progress(void)<br>
=C2=A0 =C2=A0 =C2=A0return (qatomic_read(&amp;state-&gt;status) =3D=3D DUMP=
_STATUS_ACTIVE);<br>
=C2=A0}<br>
<br>
+bool qemu_system_dump_cancelling(void)<br>
+{<br>
+=C2=A0 =C2=A0 DumpState *state =3D &amp;dump_state_global;<br>
+=C2=A0 =C2=A0 return (qatomic_read(&amp;state-&gt;status) =3D=3D DUMP_STAT=
US_CANCELLING);<br>
+}<br>
+<br>
+void qmp_dump_cancel(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 DumpState *state =3D &amp;dump_state_global;<br>
+=C2=A0 =C2=A0 if (!qemu_system_dump_in_progress()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qatomic_set(&amp;state-&gt;status, DUMP_STATUS_CANCELLING);<=
br>
+}<br>
</blockquote><div><br></div><div><div>qemu_system_dump_in_progress() should=
 probably be updated to take CANCELLING state into account (and avoid anoth=
er dump to be created concurrently)<br></div><div><br></div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">+<br>
+<br>
=C2=A0/* calculate total size of memory to be dumped (taking filter into<br=
>
=C2=A0 * acoount.) */<br>
=C2=A0static int64_t dump_calculate_size(DumpState *s)<br>
@@ -1838,8 +1867,13 @@ static void dump_process(DumpState *s, Error **errp)=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* make sure status is written after written_size updat=
es */<br>
=C2=A0 =C2=A0 =C2=A0smp_wmb();<br>
-=C2=A0 =C2=A0 qatomic_set(&amp;s-&gt;status,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*errp ? DUMP_STATU=
S_FAILED : DUMP_STATUS_COMPLETED));<br>
+=C2=A0 =C2=A0 if (qemu_system_dump_cancelling()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qatomic_set(&amp;s-&gt;status, DUMP_STATUS_CAN=
CELLED);<br>
+=C2=A0 =C2=A0 } else if (*errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qatomic_set(&amp;s-&gt;status, DUMP_STATUS_FAI=
LED);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qatomic_set(&amp;s-&gt;status, DUMP_STATUS_COM=
PLETED);<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* send DUMP_COMPLETED message (unconditionally) */<br>
=C2=A0 =C2=A0 =C2=A0result =3D qmp_query_dump(NULL);<br>
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h<br>
index f3ed52548e..a36c1d43f6 100644<br>
--- a/include/sysemu/runstate.h<br>
+++ b/include/sysemu/runstate.h<br>
@@ -76,6 +76,7 @@ void qemu_system_reset(ShutdownCause reason);<br>
=C2=A0void qemu_system_guest_panicked(GuestPanicInformation *info);<br>
=C2=A0void qemu_system_guest_crashloaded(GuestPanicInformation *info);<br>
=C2=A0bool qemu_system_dump_in_progress(void);<br>
+bool qemu_system_dump_cancelling(void);<br>
<br>
=C2=A0#endif<br>
<br>
diff --git a/qapi/dump.json b/qapi/dump.json<br>
index 90859c5483..6dfbb6b7de 100644<br>
--- a/qapi/dump.json<br>
+++ b/qapi/dump.json<br>
@@ -108,7 +108,7 @@<br>
=C2=A0# Since: 2.6<br>
=C2=A0##<br>
=C2=A0{ &#39;enum&#39;: &#39;DumpStatus&#39;,<br>
-=C2=A0 &#39;data&#39;: [ &#39;none&#39;, &#39;active&#39;, &#39;completed&=
#39;, &#39;failed&#39; ] }<br>
+=C2=A0 &#39;data&#39;: [ &#39;none&#39;, &#39;active&#39;, &#39;completed&=
#39;, &#39;failed&#39;, &#39;cancelling&#39;, &#39;cancelled&#39; ] }<br>
<br>
=C2=A0##<br>
=C2=A0# @DumpQueryResult:<br>
@@ -200,3 +200,22 @@<br>
=C2=A0##<br>
=C2=A0{ &#39;command&#39;: &#39;query-dump-guest-memory-capability&#39;,<br=
>
=C2=A0 =C2=A0&#39;returns&#39;: &#39;DumpGuestMemoryCapability&#39; }<br>
+<br>
+##<br>
+# @dump-cancel:<br>
+#<br>
+# Cancel the current executing dump process.<br>
+#<br>
+# Returns: nothing on success<br>
+#<br>
+# Notes: This command succeeds even if there is no dump process running.<b=
r>
+#<br>
+# Since: 7.2<br>
+#<br>
+# Example:<br>
+#<br>
+# -&gt; { &quot;execute&quot;: &quot;dump-cancel&quot; }<br>
+# &lt;- { &quot;return&quot;: {} }<br>
+#<br>
+##<br>
+{ &#39;command&#39;: &#39;dump-cancel&#39; }<br>
-- <br>
2.33.0<br>
</blockquote></div><div><br></div><div>Looks good to me, but I wish there w=
ould be some tests. Could you try to write some?</div><div><br></div><br>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br><=
/div></div>

--000000000000e020af05e44c2dd4--

