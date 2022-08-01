Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC1C5865CF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 09:42:39 +0200 (CEST)
Received: from localhost ([::1]:33000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIQ4U-0004Ds-4D
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 03:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIPzz-000855-4P
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:37:59 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIPzw-0001XY-OX
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:37:58 -0400
Received: by mail-lj1-x22c.google.com with SMTP id a13so11332432ljr.11
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 00:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xq0soZywYhhnzf9o1hJ3q6VR2CKeh7wTYUyKKkz6E/c=;
 b=lIc8aqHClss3iQiXoFbxawlJVLxbn2K2nuhLdWd6CcSubbGjD0Yc8Krv0PB1araLBl
 IRlpdPZ8POjTeuFt4CTzu1dH9XqPkWZc2DlDXABI4+uLq/xy5FiKDXUh9dYQA9qBUVUV
 jT9bTgKnVNDXyTFqGKISD6FlNq7O3OvutfJmYsF82O/p5XyWo8YJkrnvvznrnT3jLRnN
 xrCWBFvFUx3EbPZ3po50WAAvVzN/Uv7FMiV8KAZFS9Y0N8JbFLCFbLwFOA2icX8YQ6iS
 lmqahyt/rYmyqO92D/j1EI1dQO8nmeMLxsgYh6cernjESLlezRIN4FhbAa7QdgezMDXD
 bCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xq0soZywYhhnzf9o1hJ3q6VR2CKeh7wTYUyKKkz6E/c=;
 b=rX1alpkeCgfMHkL1sLsgFvKoNt9CD6Rg/xz8aAijnwEmQCOlwet7u75++Xbc5Jp4gM
 JZDPx7VzkaHdxqbqbTBWbzhoiqqxLt1FTDhxQaLyfta0Gz/fWd6lvWmLR7kJSHbZRC7U
 FnQdhkDE2tEIdEJcAt4wWpRsM3b0JLiNH15Ckr0mf6vUwrZivDvkJ4R0ZGnfKBWmbNIr
 zyen5MqGoWfCzVLKR7SXSrzgUKtN0cwc758AjmdcLXyPlE4Tu2PHxvAZhHKlqKlG+4F1
 7/r5JTcaHLkP4N+ER5ELH1f8Wd6MIF6YiBq3GrQ018I205OHjadYvZTdPYae3gH3uMx5
 tv+g==
X-Gm-Message-State: ACgBeo0gIkDh4/HToSOBbKygAp2NLaM2BYlZEAkaeaHPAJacg/Nj8LhC
 ru4azDpILFhae9hxAIvqjY4VhT0BYyAJ71OO18Y=
X-Google-Smtp-Source: AA6agR57Z3lSMN/kBsNyulQXZTvKxGcKUcHpqqz7j/LaWHRIcmHtlpA+0PoQEdmjoxMb0ZCxK+ZtVQqBn67GwjPi6E0=
X-Received: by 2002:a2e:8e72:0:b0:25e:485e:cc94 with SMTP id
 t18-20020a2e8e72000000b0025e485ecc94mr2646637ljk.516.1659339474975; Mon, 01
 Aug 2022 00:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220730031951.3172-1-hogan.wang@huawei.com>
In-Reply-To: <20220730031951.3172-1-hogan.wang@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 1 Aug 2022 11:37:43 +0400
Message-ID: <CAJ+F1CJmVWsJDq9dVRDqHCLpBSOAxOUu9faVjRiYUME9OUbtpA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] job: introduce dump guest memory job
To: Hogan Wang <hogan.wang@huawei.com>
Cc: kwolf@redhat.com, berrange@redhat.com, armbru@redhat.com, 
 qemu-devel@nongnu.org, wangxinxin.wang@huawei.com
Content-Type: multipart/alternative; boundary="000000000000f7c38405e529136e"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
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

--000000000000f7c38405e529136e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, Jul 30, 2022 at 7:20 AM Hogan Wang via <qemu-devel@nongnu.org>
wrote:

> There's no way to cancel the current executing dump process, lead to the
> virtual machine manager daemon((e.g. libvirtd) cannot restore the dump
> job after daemon restart.
>
> Introduce dump guest memory job type, and add an optional 'job-id'
> argument for dump-guest-memory QMP to make use of jobs framework.
>
> Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
> ---
>  dump/dump-hmp-cmds.c | 12 ++++++++++--
>  dump/dump.c          |  1 +
>  qapi/dump.json       |  6 +++++-
>  qapi/job.json        |  5 ++++-
>  4 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/dump/dump-hmp-cmds.c b/dump/dump-hmp-cmds.c
> index e5053b04cd..ba28a5e631 100644
> --- a/dump/dump-hmp-cmds.c
> +++ b/dump/dump-hmp-cmds.c
> @@ -24,9 +24,11 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict
> *qdict)
>      bool has_begin =3D qdict_haskey(qdict, "begin");
>      bool has_length =3D qdict_haskey(qdict, "length");
>      bool has_detach =3D qdict_haskey(qdict, "detach");
> +    bool has_job_id =3D qdict_haskey(qdict, "job-id");
>      int64_t begin =3D 0;
>      int64_t length =3D 0;
>      bool detach =3D false;
> +    const char *job_id =3D NULL;
>      enum DumpGuestMemoryFormat dump_format =3D DUMP_GUEST_MEMORY_FORMAT_=
ELF;
>      char *prot;
>
> @@ -62,10 +64,16 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict
> *qdict)
>          detach =3D qdict_get_bool(qdict, "detach");
>      }
>
> +    if (has_job_id) {
> +        job_id =3D qdict_get_str(qdict, "job-id");
> +    }
> +
>      prot =3D g_strconcat("file:", file, NULL);
>
> -    qmp_dump_guest_memory(paging, prot, true, detach, has_begin, begin,
> -                          has_length, length, true, dump_format, &err);
> +    qmp_dump_guest_memory(paging, prot, has_job_id, job_id,
> +                          true, detach, has_begin, begin,
> +                          has_length, length, true, dump_format,
> +                          &err);
>      hmp_handle_error(mon, err);
>      g_free(prot);
>  }
> diff --git a/dump/dump.c b/dump/dump.c
> index a57c580b12..cec9be30b4 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1895,6 +1895,7 @@ DumpQueryResult *qmp_query_dump(Error **errp)
>  }
>
>  void qmp_dump_guest_memory(bool paging, const char *file,
> +                           bool has_job_id, const char *job_id,
>                             bool has_detach, bool detach,
>                             bool has_begin, int64_t begin, bool has_lengt=
h,
>                             int64_t length, bool has_format,
> diff --git a/qapi/dump.json b/qapi/dump.json
> index 90859c5483..5209d0b74f 100644
> --- a/qapi/dump.json
> +++ b/qapi/dump.json
> @@ -59,6 +59,9 @@
>  #            2. fd: the protocol starts with "fd:", and the following
> string
>  #               is the fd's name.
>  #
> +# @job-id: identifier for the newly-created memory dump job. If
> +#          omitted, use 'memory-guest-dump' by default. (Since 7.2)
>

That's not what is done in the patch, probably the comment needs to be
adjusted

+#
>  # @detach: if true, QMP will return immediately rather than
>  #          waiting for the dump to finish. The user can track progress
>  #          using "query-dump". (since 2.6).
> @@ -88,7 +91,8 @@
>  #
>  ##
>  { 'command': 'dump-guest-memory',
> -  'data': { 'paging': 'bool', 'protocol': 'str', '*detach': 'bool',
> +  'data': { 'paging': 'bool', 'protocol': 'str',
> +            '*job-id': 'str', '*detach': 'bool',
>              '*begin': 'int', '*length': 'int',
>              '*format': 'DumpGuestMemoryFormat'} }
>
> diff --git a/qapi/job.json b/qapi/job.json
> index d5f84e9615..e14d2290a5 100644
> --- a/qapi/job.json
> +++ b/qapi/job.json
> @@ -28,11 +28,14 @@
>  #
>  # @snapshot-delete: snapshot delete job type, see "snapshot-delete"
> (since 6.0)
>  #
> +# @dump-guest-memory: dump guest memory job type, see "dump-guest-memory=
"
> (since 7.2)
> +#
>  # Since: 1.7
>  ##
>  { 'enum': 'JobType',
>    'data': ['commit', 'stream', 'mirror', 'backup', 'create', 'amend',
> -           'snapshot-load', 'snapshot-save', 'snapshot-delete'] }
> +           'snapshot-load', 'snapshot-save', 'snapshot-delete',
> +           'dump-guest-memory'] }
>
>  ##
>  # @JobStatus:
> --
> 2.33.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f7c38405e529136e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 30, 2022 at 7:20 AM Hog=
an Wang via &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">There&#39;s no way to cancel the current executing dump process, lead to=
 the<br>
virtual machine manager daemon((e.g. libvirtd) cannot restore the dump<br>
job after daemon restart.<br>
<br>
Introduce dump guest memory job type, and add an optional &#39;job-id&#39;<=
br>
argument for dump-guest-memory QMP to make use of jobs framework.<br>
<br>
Signed-off-by: Hogan Wang &lt;<a href=3D"mailto:hogan.wang@huawei.com" targ=
et=3D"_blank">hogan.wang@huawei.com</a>&gt;<br>
---<br>
=C2=A0dump/dump-hmp-cmds.c | 12 ++++++++++--<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0qapi/dump.json=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++-<br>
=C2=A0qapi/job.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++-<br>
=C2=A04 files changed, 20 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/dump/dump-hmp-cmds.c b/dump/dump-hmp-cmds.c<br>
index e5053b04cd..ba28a5e631 100644<br>
--- a/dump/dump-hmp-cmds.c<br>
+++ b/dump/dump-hmp-cmds.c<br>
@@ -24,9 +24,11 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict *qd=
ict)<br>
=C2=A0 =C2=A0 =C2=A0bool has_begin =3D qdict_haskey(qdict, &quot;begin&quot=
;);<br>
=C2=A0 =C2=A0 =C2=A0bool has_length =3D qdict_haskey(qdict, &quot;length&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0bool has_detach =3D qdict_haskey(qdict, &quot;detach&qu=
ot;);<br>
+=C2=A0 =C2=A0 bool has_job_id =3D qdict_haskey(qdict, &quot;job-id&quot;);=
<br>
=C2=A0 =C2=A0 =C2=A0int64_t begin =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0int64_t length =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0bool detach =3D false;<br>
+=C2=A0 =C2=A0 const char *job_id =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0enum DumpGuestMemoryFormat dump_format =3D DUMP_GUEST_M=
EMORY_FORMAT_ELF;<br>
=C2=A0 =C2=A0 =C2=A0char *prot;<br>
<br>
@@ -62,10 +64,16 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict *q=
dict)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0detach =3D qdict_get_bool(qdict, &quot;de=
tach&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (has_job_id) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 job_id =3D qdict_get_str(qdict, &quot;job-id&q=
uot;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0prot =3D g_strconcat(&quot;file:&quot;, file, NULL);<br=
>
<br>
-=C2=A0 =C2=A0 qmp_dump_guest_memory(paging, prot, true, detach, has_begin,=
 begin,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 has_length, length, true, dump_format, &amp;err);<br>
+=C2=A0 =C2=A0 qmp_dump_guest_memory(paging, prot, has_job_id, job_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 true, detach, has_begin, begin,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 has_length, length, true, dump_format,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;err);<br>
=C2=A0 =C2=A0 =C2=A0hmp_handle_error(mon, err);<br>
=C2=A0 =C2=A0 =C2=A0g_free(prot);<br>
=C2=A0}<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index a57c580b12..cec9be30b4 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -1895,6 +1895,7 @@ DumpQueryResult *qmp_query_dump(Error **errp)<br>
=C2=A0}<br>
<br>
=C2=A0void qmp_dump_guest_memory(bool paging, const char *file,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bool has_job_id, const char *job_id,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool has_detach, bool detach,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool has_begin, int64_t begin, bool has_length,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int64_t length, bool has_format,<br>
diff --git a/qapi/dump.json b/qapi/dump.json<br>
index 90859c5483..5209d0b74f 100644<br>
--- a/qapi/dump.json<br>
+++ b/qapi/dump.json<br>
@@ -59,6 +59,9 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. fd: the protocol starts=
 with &quot;fd:&quot;, and the following string<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is the fd&#39=
;s name.<br>
=C2=A0#<br>
+# @job-id: identifier for the newly-created memory dump job. If<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 omitted, use &#39;memory-guest-dump&#3=
9; by default. (Since 7.2)<br></blockquote><div><br></div><div>That&#39;s n=
ot what is done in the patch, probably the comment needs to be adjusted <br=
></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+#<br>
=C2=A0# @detach: if true, QMP will return immediately rather than<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 waiting for the dump to finish. T=
he user can track progress<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 using &quot;query-dump&quot;. (si=
nce 2.6).<br>
@@ -88,7 +91,8 @@<br>
=C2=A0#<br>
=C2=A0##<br>
=C2=A0{ &#39;command&#39;: &#39;dump-guest-memory&#39;,<br>
-=C2=A0 &#39;data&#39;: { &#39;paging&#39;: &#39;bool&#39;, &#39;protocol&#=
39;: &#39;str&#39;, &#39;*detach&#39;: &#39;bool&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;paging&#39;: &#39;bool&#39;, &#39;protocol&#=
39;: &#39;str&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*job-id&#39;: &#39;str&#39;=
, &#39;*detach&#39;: &#39;bool&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*begin&#39;: &#39;int&=
#39;, &#39;*length&#39;: &#39;int&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*format&#39;: &#39;Dum=
pGuestMemoryFormat&#39;} }<br>
<br>
diff --git a/qapi/job.json b/qapi/job.json<br>
index d5f84e9615..e14d2290a5 100644<br>
--- a/qapi/job.json<br>
+++ b/qapi/job.json<br>
@@ -28,11 +28,14 @@<br>
=C2=A0#<br>
=C2=A0# @snapshot-delete: snapshot delete job type, see &quot;snapshot-dele=
te&quot; (since 6.0)<br>
=C2=A0#<br>
+# @dump-guest-memory: dump guest memory job type, see &quot;dump-guest-mem=
ory&quot; (since 7.2)<br>
+#<br>
=C2=A0# Since: 1.7<br>
=C2=A0##<br>
=C2=A0{ &#39;enum&#39;: &#39;JobType&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: [&#39;commit&#39;, &#39;stream&#39;, &#39;mirr=
or&#39;, &#39;backup&#39;, &#39;create&#39;, &#39;amend&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;snapshot-load&#39;, &#39;sna=
pshot-save&#39;, &#39;snapshot-delete&#39;] }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;snapshot-load&#39;, &#39;sna=
pshot-save&#39;, &#39;snapshot-delete&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dump-guest-memory&#39;] }<br=
>
<br>
=C2=A0##<br>
=C2=A0# @JobStatus:<br>
-- <br>
2.33.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f7c38405e529136e--

