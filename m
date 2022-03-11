Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A474D69F0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 23:01:43 +0100 (CET)
Received: from localhost ([::1]:37760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSnKO-0004wV-Ji
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 17:01:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nSnIa-0004Am-Gw
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 16:59:48 -0500
Received: from [2a00:1450:4864:20::331] (port=51770
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nSnIY-0000eS-9G
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 16:59:48 -0500
Received: by mail-wm1-x331.google.com with SMTP id q20so5884720wmq.1
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 13:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OX3trYh2+ULB6eq2mAvNR4u2IUTJDH84l4rbXQRdHp0=;
 b=cnfrBsKfASi8dNA2GmtuTzb9iSTYALxcLzsZky8Ur5+ZHNAnozXj+HBku3sEUuZIsT
 etg3YrKtv7eBaD9EZ72SMr7miAEsHCZr3XR8a4lrxSrQbh+1pZbjbL2o/lcQ9ccH9C/f
 pwNmQoixjoN9Bm6SkwxwemQyClr0M/syrHpLkCe0XTifxB9o9AfhgDR+kIABQZun1iE8
 0+NX0WAooSdoOi+VoSryHTnqvCNxywYlfb9sE3VXzepp5n/JJhuScRednKYTRrjeyhIa
 TAuthpBkEmR9ga9U6yCIy3AluAOxub1xVBJLeW+JQMjf7Hebb1leW03fh7v0Yf2tIIqt
 4WZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OX3trYh2+ULB6eq2mAvNR4u2IUTJDH84l4rbXQRdHp0=;
 b=SJyCxrIhVfRHK+vwT/CkBMFBeARdy096/NurKh8fR2GEoHiE6NGd/ehUcfVzstN2HJ
 cj/nolGldvJakCwaZH5ZJerf4C59DWjr5q5mg2fcJI9vqXIQqjMKF02YTIxYIngturiP
 26oIWoXI28schKa085mZi+Fa5cmXXMh64KOiJ6qDheMyTP6OCmDHJP9/LQVIZ7fmMJaU
 sgJXda2U7mV4f2gWCdc52beUQl9sObx2VNz12G/M17mPLg2ZrzEfUAxJbBb5kyyEeoTm
 B2JkCazzH7h6tb1AiR8TyaCAtTtBmzEuLSd6TLYM9jWizS4VM4QRsbQtOI9m843Msicz
 BHng==
X-Gm-Message-State: AOAM530vSfhw1IFLV94uZ/eanqVKdi/+OXFfWXiB3OmLh9QaqL1QAZAs
 F/QPpLet0U1LWM1ffvRTUAfiKU2uQNpVWln1+MY=
X-Google-Smtp-Source: ABdhPJwkp4jFtcMXCj20roEpRBIhz0aqyW5EPU2R1fjy0LFVjK1m7olaQGJ4QdXXj3rwh8JpLL2IORTGCxMAdBWu4uw=
X-Received: by 2002:a7b:c5d6:0:b0:381:4127:84d3 with SMTP id
 n22-20020a7bc5d6000000b00381412784d3mr16961270wmk.24.1647035983814; Fri, 11
 Mar 2022 13:59:43 -0800 (PST)
MIME-Version: 1.0
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-12-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1C+O91Hohh6MLEaQ3e-3De2Ru1U+OemhX3B3DrJqXzuTMg@mail.gmail.com>
 <6e249462-ef96-a355-7d71-8407340904bc@oracle.com>
In-Reply-To: <6e249462-ef96-a355-7d71-8407340904bc@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 12 Mar 2022 01:59:31 +0400
Message-ID: <CAJ+F1CKtKeXLM-zkMwPQhgdz8VxkQS4w3PLe9Dnm+x5K9pPYtg@mail.gmail.com>
Subject: Re: [PATCH V7 11/29] qapi: list utility functions
To: Steven Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000bf658d05d9f87269"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bf658d05d9f87269
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Mar 11, 2022 at 8:46 PM Steven Sistare <steven.sistare@oracle.com>
wrote:

> On 3/9/2022 9:11 AM, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Dec 22, 2021 at 11:42 PM Steve Sistare <
> steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> >
> >     Generalize strList_from_comma_list() to take any delimiter
> character, rename
> >     as strList_from_string(), and move it to qapi/util.c.  Also add
> >     strv_from_strList() and QAPI_LIST_LENGTH().
> >
> > Looks like you could easily split, and add some tests.
>
> Will do.
> I don't see any tests that include qapi/util.h, so this will be a new tes=
t
> file.
>
> For the split, how about:
>   patch: qapi: strList_from_string
>   patch: qapi: strv_from_strList
>   patch: qapi: QAPI_LIST_LENGTH
>   patch: qapi: unit tests for lists
>
>
Sure, that's fine


> Or do you prefer that unit tests be pushed with each function's patch?
>

I don't have a strong preference. I usually prefer new code coming with its
own test, but if the resulting patch becomes too large, or if the test
touches other related aspects, might be better off as different patch. Up
to you!


> >     No functional change.
> >
> >     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:
> steven.sistare@oracle.com>>
> >     ---
> >      include/qapi/util.h | 28 ++++++++++++++++++++++++++++
> >      monitor/hmp-cmds.c  | 29 ++---------------------------
> >      qapi/qapi-util.c    | 37 +++++++++++++++++++++++++++++++++++++
> >      3 files changed, 67 insertions(+), 27 deletions(-)
> >
> >     diff --git a/include/qapi/util.h b/include/qapi/util.h
> >     index 81a2b13..c249108 100644
> >     --- a/include/qapi/util.h
> >     +++ b/include/qapi/util.h
> >     @@ -22,6 +22,8 @@ typedef struct QEnumLookup {
> >          const int size;
> >      } QEnumLookup;
> >
> >     +struct strList;
> >     +
> >      const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
> >      int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
> >                          int def, Error **errp);
> >     @@ -31,6 +33,19 @@ bool qapi_bool_parse(const char *name, const cha=
r
> *value, bool *obj,
> >      int parse_qapi_name(const char *name, bool complete);
> >
> >      /*
> >     + * Produce and return a NULL-terminated array of strings from @arg=
s.
> >     + * All strings are g_strdup'd.
> >     + */
> >     +char **strv_from_strList(const struct strList *args);
> >
> >     +
> >
> > I'd suggest to use the dedicated glib type GStrv
>
> Will do, here and in related code.
>

thanks


>
> - Steve
>
> >     +/*
> >     + * Produce a strList from the character delimited string @in.
> >     + * All strings are g_strdup'd.
> >     + * A NULL or empty input string returns NULL.
> >     + */
> >     +struct strList *strList_from_string(const char *in, char delim);
> >     +
> >     +/*
> >       * For any GenericList @list, insert @element at the front.
> >       *
> >       * Note that this macro evaluates @element exactly once, so it is
> safe
> >     @@ -56,4 +71,17 @@ int parse_qapi_name(const char *name, bool
> complete);
> >          (tail) =3D &(*(tail))->next; \
> >      } while (0)
> >
> >     +/*
> >     + * For any GenericList @list, return its length.
> >     + */
> >     +#define QAPI_LIST_LENGTH(list) \
> >     +    ({ \
> >     +        int len =3D 0; \
> >     +        typeof(list) elem; \
> >     +        for (elem =3D list; elem !=3D NULL; elem =3D elem->next) {=
 \
> >     +            len++; \
> >     +        } \
> >     +        len; \
> >     +    })
> >     +
> >      #endif
> >     diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> >     index b8c22da..5ca8b4b 100644
> >     --- a/monitor/hmp-cmds.c
> >     +++ b/monitor/hmp-cmds.c
> >     @@ -43,6 +43,7 @@
> >      #include "qapi/qapi-commands-run-state.h"
> >      #include "qapi/qapi-commands-tpm.h"
> >      #include "qapi/qapi-commands-ui.h"
> >     +#include "qapi/util.h"
> >      #include "qapi/qapi-visit-net.h"
> >      #include "qapi/qapi-visit-migration.h"
> >      #include "qapi/qmp/qdict.h"
> >     @@ -70,32 +71,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
> >          return false;
> >      }
> >
> >     -/*
> >     - * Produce a strList from a comma separated list.
> >     - * A NULL or empty input string return NULL.
> >     - */
> >     -static strList *strList_from_comma_list(const char *in)
> >     -{
> >     -    strList *res =3D NULL;
> >     -    strList **tail =3D &res;
> >     -
> >     -    while (in && in[0]) {
> >     -        char *comma =3D strchr(in, ',');
> >     -        char *value;
> >     -
> >     -        if (comma) {
> >     -            value =3D g_strndup(in, comma - in);
> >     -            in =3D comma + 1; /* skip the , */
> >     -        } else {
> >     -            value =3D g_strdup(in);
> >     -            in =3D NULL;
> >     -        }
> >     -        QAPI_LIST_APPEND(tail, value);
> >     -    }
> >     -
> >     -    return res;
> >     -}
> >     -
> >      void hmp_info_name(Monitor *mon, const QDict *qdict)
> >      {
> >          NameInfo *info;
> >     @@ -1103,7 +1078,7 @@ void hmp_announce_self(Monitor *mon, const
> QDict *qdict)
> >
>  migrate_announce_params());
> >
> >          qapi_free_strList(params->interfaces);
> >     -    params->interfaces =3D strList_from_comma_list(interfaces_str)=
;
> >     +    params->interfaces =3D strList_from_string(interfaces_str, ','=
);
> >          params->has_interfaces =3D params->interfaces !=3D NULL;
> >          params->id =3D g_strdup(id);
> >          params->has_id =3D !!params->id;
> >     diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
> >     index fda7044..edd51b3 100644
> >     --- a/qapi/qapi-util.c
> >     +++ b/qapi/qapi-util.c
> >     @@ -15,6 +15,7 @@
> >      #include "qapi/error.h"
> >      #include "qemu/ctype.h"
> >      #include "qapi/qmp/qerror.h"
> >     +#include "qapi/qapi-builtin-types.h"
> >
> >      CompatPolicy compat_policy;
> >
> >     @@ -152,3 +153,39 @@ int parse_qapi_name(const char *str, bool
> complete)
> >          }
> >          return p - str;
> >      }
> >     +
> >     +char **strv_from_strList(const strList *args)
> >     +{
> >     +    const strList *arg;
> >     +    int i =3D 0;
> >     +    char **argv =3D g_malloc((QAPI_LIST_LENGTH(args) + 1) *
> sizeof(char *));
> >     +
> >     +    for (arg =3D args; arg !=3D NULL; arg =3D arg->next) {
> >     +        argv[i++] =3D g_strdup(arg->value);
> >     +    }
> >     +    argv[i] =3D NULL;
> >     +
> >     +    return argv;
> >     +}
> >     +
> >     +strList *strList_from_string(const char *in, char delim)
> >     +{
> >     +    strList *res =3D NULL;
> >     +    strList **tail =3D &res;
> >     +
> >     +    while (in && in[0]) {
> >     +        char *next =3D strchr(in, delim);
> >     +        char *value;
> >     +
> >     +        if (next) {
> >     +            value =3D g_strndup(in, next - in);
> >     +            in =3D next + 1; /* skip the delim */
> >     +        } else {
> >     +            value =3D g_strdup(in);
> >     +            in =3D NULL;
> >     +        }
> >     +        QAPI_LIST_APPEND(tail, value);
> >     +    }
> >     +
> >     +    return res;
> >     +}
> >     --
> >     1.8.3.1
> >
> >
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000bf658d05d9f87269
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 11, 2022 at 8:46 PM Ste=
ven Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare=
@oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 3/9/2022 9:11 AM, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Dec 22, 2021 at 11:42 PM Steve Sistare &lt;<a href=3D"mailto:s=
teven.sistare@oracle.com" target=3D"_blank">steven.sistare@oracle.com</a> &=
lt;mailto:<a href=3D"mailto:steven.sistare@oracle.com" target=3D"_blank">st=
even.sistare@oracle.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Generalize strList_from_comma_list() to take any de=
limiter character, rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0as strList_from_string(), and move it to qapi/util.=
c.=C2=A0 Also add<br>
&gt;=C2=A0 =C2=A0 =C2=A0strv_from_strList() and QAPI_LIST_LENGTH().<br>
&gt; <br>
&gt; Looks like you could easily split, and add some tests.<br>
<br>
Will do.=C2=A0 <br>
I don&#39;t see any tests that include qapi/util.h, so this will be a new t=
est file.<br>
<br>
For the split, how about:<br>
=C2=A0 patch: qapi: strList_from_string<br>
=C2=A0 patch: qapi: strv_from_strList<br>
=C2=A0 patch: qapi: QAPI_LIST_LENGTH<br>
=C2=A0 patch: qapi: unit tests for lists<br>
<br></blockquote><div><br></div><div>Sure, that&#39;s fine<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Or do you prefer that unit tests be pushed with each function&#39;s patch?<=
br></blockquote><div><br></div><div>I don&#39;t have a strong preference. I=
 usually prefer new code coming with its own test, but if the resulting pat=
ch becomes too large, or if the test touches other related aspects, might b=
e better off as different patch. Up to you!<br></div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0No functional change.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:=
steven.sistare@oracle.com" target=3D"_blank">steven.sistare@oracle.com</a> =
&lt;mailto:<a href=3D"mailto:steven.sistare@oracle.com" target=3D"_blank">s=
teven.sistare@oracle.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include/qapi/util.h | 28 ++++++++++++++++++++=
++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0monitor/hmp-cmds.c=C2=A0 | 29 ++-------------=
--------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0qapi/qapi-util.c=C2=A0 =C2=A0 | 37 ++++++++++=
+++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A03 files changed, 67 insertions(+), 27 deletio=
ns(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/include/qapi/util.h b/include/qapi/uti=
l.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 81a2b13..c249108 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/include/qapi/util.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/include/qapi/util.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -22,6 +22,8 @@ typedef struct QEnumLookup {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0const int size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0} QEnumLookup;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct strList;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0const char *qapi_enum_lookup(const QEnumLooku=
p *lookup, int val);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0int qapi_enum_parse(const QEnumLookup *lookup=
, const char *buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0int def, Error **errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -31,6 +33,19 @@ bool qapi_bool_parse(const char =
*name, const char *value, bool *obj,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0int parse_qapi_name(const char *name, bool co=
mplete);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Produce and return a NULL-terminated array of s=
trings from @args.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * All strings are g_strdup&#39;d.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+char **strv_from_strList(const struct strList *arg=
s);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt; <br>
&gt; I&#39;d suggest to use the dedicated glib type GStrv<br>
<br>
Will do, here and in related code.<br></blockquote><div><br></div><div>than=
ks</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
- Steve<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * Produce a strList from the character delimited =
string @in.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * All strings are g_strdup&#39;d.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * A NULL or empty input string returns NULL.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+struct strList *strList_from_string(const char *in=
, char delim);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 * For any GenericList @list, insert @element=
 at the front.<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 * Note that this macro evaluates @element ex=
actly once, so it is safe<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -56,4 +71,17 @@ int parse_qapi_name(const char *=
name, bool complete);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0(tail) =3D &amp;(*(tail))-&gt;n=
ext; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0} while (0)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * For any GenericList @list, return its length.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define QAPI_LIST_LENGTH(list) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 ({ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D 0; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 typeof(list) elem; \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (elem =3D list; el=
em !=3D NULL; elem =3D elem-&gt;next) { \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len++; \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 })<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.=
c<br>
&gt;=C2=A0 =C2=A0 =C2=A0index b8c22da..5ca8b4b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/monitor/hmp-cmds.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/monitor/hmp-cmds.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -43,6 +43,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qapi/qapi-commands-run-state.h=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qapi/qapi-commands-tpm.h&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qapi/qapi-commands-ui.h&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+#include &quot;qapi/util.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qapi/qapi-visit-net.h&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qapi/qapi-visit-migration.h&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qapi/qmp/qdict.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -70,32 +71,6 @@ bool hmp_handle_error(Monitor *m=
on, Error *err)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0- * Produce a strList from a comma separated list.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0- * A NULL or empty input string return NULL.<br>
&gt;=C2=A0 =C2=A0 =C2=A0- */<br>
&gt;=C2=A0 =C2=A0 =C2=A0-static strList *strList_from_comma_list(const char=
 *in)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-{<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 strList *res =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 strList **tail =3D &amp;res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 while (in &amp;&amp; in[0]) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *comma =3D strchr=
(in, &#39;,&#39;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *value;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (comma) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =
=3D g_strndup(in, comma - in);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in =3D c=
omma + 1; /* skip the , */<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =
=3D g_strdup(in);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in =3D N=
ULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail,=
 value);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 return res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0void hmp_info_name(Monitor *mon, const QDict =
*qdict)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0NameInfo *info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1103,7 +1078,7 @@ void hmp_announce_self(Monito=
r *mon, const QDict *qdict)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migrate_announce_params());<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0qapi_free_strList(params-&gt;in=
terfaces);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 params-&gt;interfaces =3D strList_fr=
om_comma_list(interfaces_str);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 params-&gt;interfaces =3D strList_fr=
om_string(interfaces_str, &#39;,&#39;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0params-&gt;has_interfaces =3D p=
arams-&gt;interfaces !=3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0params-&gt;id =3D g_strdup(id);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0params-&gt;has_id =3D !!params-=
&gt;id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0index fda7044..edd51b3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/qapi/qapi-util.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/qapi/qapi-util.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -15,6 +15,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qemu/ctype.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &quot;qapi/qmp/qerror.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#include &quot;qapi/qapi-builtin-types.h&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0CompatPolicy compat_policy;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -152,3 +153,39 @@ int parse_qapi_name(const char=
 *str, bool complete)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0return p - str;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+char **strv_from_strList(const strList *args)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 const strList *arg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 int i =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 char **argv =3D g_malloc((QAPI_LIST_=
LENGTH(args) + 1) * sizeof(char *));<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 for (arg =3D args; arg !=3D NULL; ar=
g =3D arg-&gt;next) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[i++] =3D g_strdup=
(arg-&gt;value);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 argv[i] =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 return argv;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+strList *strList_from_string(const char *in, char =
delim)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 strList *res =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 strList **tail =3D &amp;res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 while (in &amp;&amp; in[0]) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *next =3D strchr(=
in, delim);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *value;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (next) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =
=3D g_strndup(in, next - in);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in =3D n=
ext + 1; /* skip the delim */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =
=3D g_strdup(in);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in =3D N=
ULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail,=
 value);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 return res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A01.8.3.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bf658d05d9f87269--

