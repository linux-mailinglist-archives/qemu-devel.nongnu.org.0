Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D5E43A2C5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:50:16 +0200 (CEST)
Received: from localhost ([::1]:42958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5z5-0008Ty-RY
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5pg-0007Q7-GN
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5pX-0003de-9b
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635190821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gdqIirO7/6TIFeEs37qaZf8eLvshsT6tfXjHk5koOsA=;
 b=jREVeDUj2vjSvG/OJiPHeTFMKOmQDSJtpZcgjegaqXQguTa9Hu9cyK/5UHu59DXFxZZWBk
 O/GLxZ3PbIvYSwClFgmyRbQXfDdXU+fZn10qnKqfNwFeC+DDST9mJdzAIlo12p20d2E0m3
 FZj9oc5+cjgyiU31BkuBS1rcyz5XB5U=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304--uEPLXEnM2ynqZKopSpSlg-1; Mon, 25 Oct 2021 15:40:18 -0400
X-MC-Unique: -uEPLXEnM2ynqZKopSpSlg-1
Received: by mail-vk1-f200.google.com with SMTP id
 x16-20020a1f3110000000b002a40c805e53so3720563vkx.7
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gdqIirO7/6TIFeEs37qaZf8eLvshsT6tfXjHk5koOsA=;
 b=L4bmO1s6WywjRrPYMwdqeN9sGb7246s1DI/yeQS4V5KzNGIVqx3EsWlLmZO28J5BU9
 dBxOODQ1kuIoz5QgW2yZ3vrCZVqJLthYas02cyBfb9uzRQtGakFjm1EKlP8Ee7+xmdi7
 HHaV+dI7avTQ53doYsemS4NzA3No/ejXo0AIKQ0BlRK544KIvzj5MeFgwduq5jmtVW9a
 uuELVFz3PX+mZjGKbfwBbVoWIAprsNfVCGS2h6TOKtZcD7frgb/t0ccwrZSznVyjgrnT
 rEjcDMDtQCa+awqTfxd3eTST5Ub2INDuY7v7aT7G/SRYCrKLOq5jHQpNoNKyAwbCmOjl
 4BKA==
X-Gm-Message-State: AOAM5311YUYmtZhBdqJX2rhMAL4HyPcc5n6fYCrFwAl54qex0lY28K28
 2Jt40r46cEgKh177CsHWyphfqXJv/K/vGA3qzLUv2Md2R73fYJ+YdS5OLx6CJ8R1EyTPvs0PmUe
 hrGPhQYhLbi92IBGFRJSt1fscUmFf7wo=
X-Received: by 2002:a05:6122:2214:: with SMTP id
 bb20mr17225245vkb.9.1635190817915; 
 Mon, 25 Oct 2021 12:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6dukVC+DTTKzCUAzk73WTow5e09w9u/f2Y/kDedw4gBn9qH6cJY8XnTS03S5MnLiVpIz0xJJQotd8XTZe/34=
X-Received: by 2002:a05:6122:2214:: with SMTP id
 bb20mr17225203vkb.9.1635190817693; 
 Mon, 25 Oct 2021 12:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-10-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-10-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Oct 2021 15:40:07 -0400
Message-ID: <CAFn=p-ZVn5KKOEEGDkc55ycQYCU+6oxikEG+qa_WXSBA6UptNg@mail.gmail.com>
Subject: Re: [PATCH 9/9] qapi: Extend -compat to set policy for unstable
 interfaces
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d438a305cf3287b0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d438a305cf3287b0
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 1:26 AM Markus Armbruster <armbru@redhat.com> wrote:

> New option parameters unstable-input and unstable-output set policy
> for unstable interfaces just like deprecated-input and
> deprecated-output set policy for deprecated interfaces (see commit
> 6dd75472d5 "qemu-options: New -compat to set policy for deprecated
> interfaces").  This is intended for testing users of the management
> interfaces.  It is experimental.
>
> For now, this covers only syntactic aspects of QMP, i.e. stuff tagged
> with feature 'unstable'.  We may want to extend it to cover semantic
> aspects, or the command line.
>
> Note that there is no good way for management application to detect
> presence of these new option parameters: they are not visible output
> of query-qmp-schema or query-command-line-options.  Tolerable, because
> it's meant for testing.  If running with -compat fails, skip the test.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/compat.json              |  6 +++++-
>  include/qapi/util.h           |  1 +
>  qapi/qmp-dispatch.c           |  6 ++++++
>  qapi/qobject-output-visitor.c |  8 ++++++--
>  qemu-options.hx               | 20 +++++++++++++++++++-
>  scripts/qapi/events.py        | 10 ++++++----
>  scripts/qapi/schema.py        | 10 ++++++----
>  7 files changed, 49 insertions(+), 12 deletions(-)
>
> diff --git a/qapi/compat.json b/qapi/compat.json
> index 74a8493d3d..9bc9804abb 100644
> --- a/qapi/compat.json
> +++ b/qapi/compat.json
> @@ -47,9 +47,13 @@
>  #
>  # @deprecated-input: how to handle deprecated input (default 'accept')
>  # @deprecated-output: how to handle deprecated output (default 'accept')
> +# @unstable-input: how to handle unstable input (default 'accept')
> +# @unstable-output: how to handle unstable output (default 'accept')
>  #
>  # Since: 6.0
>  ##
>  { 'struct': 'CompatPolicy',
>    'data': { '*deprecated-input': 'CompatPolicyInput',
> -            '*deprecated-output': 'CompatPolicyOutput' } }
> +            '*deprecated-output': 'CompatPolicyOutput',
> +            '*unstable-input': 'CompatPolicyInput',
> +            '*unstable-output': 'CompatPolicyOutput' } }
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 0cc98db9f9..81a2b13a33 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -13,6 +13,7 @@
>
>  typedef enum {
>      QAPI_DEPRECATED,
> +    QAPI_UNSTABLE,
>  } QapiSpecialFeature;
>
>  typedef struct QEnumLookup {
> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index e29ade134c..c5c6e521a2 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -59,6 +59,12 @@ bool compat_policy_input_ok(unsigned special_features,
>                                      error_class, kind, name, errp)) {
>          return false;
>      }
> +    if ((special_features & (1u << QAPI_UNSTABLE))
> +        && !compat_policy_input_ok1("Unstable",
> +                                    policy->unstable_input,
> +                                    error_class, kind, name, errp)) {
> +        return false;
> +    }
>      return true;
>  }
>
> diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c
> index b5c6564cbb..74770edd73 100644
> --- a/qapi/qobject-output-visitor.c
> +++ b/qapi/qobject-output-visitor.c
> @@ -212,8 +212,12 @@ static bool qobject_output_type_null(Visitor *v,
> const char *name,
>  static bool qobject_output_policy_skip(Visitor *v, const char *name,
>                                         unsigned special_features)
>  {
> -    return !(special_features && 1u << QAPI_DEPRECATED)
> -        || v->compat_policy.deprecated_output ==
> COMPAT_POLICY_OUTPUT_HIDE;
> +    CompatPolicy *pol = &v->compat_policy;
> +
> +    return ((special_features & 1u << QAPI_DEPRECATED)
> +            && pol->deprecated_output == COMPAT_POLICY_OUTPUT_HIDE)
> +        || ((special_features & 1u << QAPI_UNSTABLE)
> +            && pol->unstable_output == COMPAT_POLICY_OUTPUT_HIDE);
>  }
>
>  /* Finish building, and return the root object.
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 5f375bbfa6..f051536b63 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3641,7 +3641,9 @@ DEFHEADING(Debug/Expert options:)
>
>  DEF("compat", HAS_ARG, QEMU_OPTION_compat,
>      "-compat
> [deprecated-input=accept|reject|crash][,deprecated-output=accept|hide]\n"
> -    "                Policy for handling deprecated management
> interfaces\n",
> +    "                Policy for handling deprecated management
> interfaces\n"
> +    "-compat
> [unstable-input=accept|reject|crash][,unstable-output=accept|hide]\n"
> +    "                Policy for handling unstable management
> interfaces\n",
>      QEMU_ARCH_ALL)
>  SRST
>  ``-compat
> [deprecated-input=@var{input-policy}][,deprecated-output=@var{output-policy}]``
> @@ -3659,6 +3661,22 @@ SRST
>          Suppress deprecated command results and events
>
>      Limitation: covers only syntactic aspects of QMP.
> +
> +``-compat
> [unstable-input=@var{input-policy}][,unstable-output=@var{output-policy}]``
> +    Set policy for handling unstable management interfaces (experimental):
> +
> +    ``unstable-input=accept`` (default)
> +        Accept unstable commands and arguments
> +    ``unstable-input=reject``
> +        Reject unstable commands and arguments
> +    ``unstable-input=crash``
> +        Crash on unstable commands and arguments
> +    ``unstable-output=accept`` (default)
> +        Emit unstable command results and events
> +    ``unstable-output=hide``
> +        Suppress unstable command results and events
> +
> +    Limitation: covers only syntactic aspects of QMP.
>  ERST
>
>  DEF("fw_cfg", HAS_ARG, QEMU_OPTION_fwcfg,
> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> index 82475e84ec..27b44c49f5 100644
> --- a/scripts/qapi/events.py
> +++ b/scripts/qapi/events.py
> @@ -109,13 +109,15 @@ def gen_event_send(name: str,
>          if not boxed:
>              ret += gen_param_var(arg_type)
>
> -    if 'deprecated' in [f.name for f in features]:
> -        ret += mcgen('''
> +    for f in features:
> +        if f.is_special():
> +            ret += mcgen('''
>
> -    if (compat_policy.deprecated_output == COMPAT_POLICY_OUTPUT_HIDE) {
> +    if (compat_policy.%(feat)s_output == COMPAT_POLICY_OUTPUT_HIDE) {
>          return;
>      }
> -''')
> +''',
> +                         feat=f.name)
>
>      ret += mcgen('''
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 55f82d7389..b7b3fc0ce4 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -254,9 +254,11 @@ def doc_type(self):
>
>      def check(self, schema):
>          QAPISchemaEntity.check(self, schema)
> -        if 'deprecated' in [f.name for f in self.features]:
> -            raise QAPISemError(
> -                self.info, "feature 'deprecated' is not supported for
> types")
> +        for feat in self.features:
> +            if feat.is_special():
> +                raise QAPISemError(
> +                    self.info,
> +                    f"feature '{feat.name}' is not supported for types")
>
>      def describe(self):
>          assert self.meta
> @@ -726,7 +728,7 @@ class QAPISchemaFeature(QAPISchemaMember):
>      role = 'feature'
>
>      def is_special(self):
> -        return self.name in ('deprecated')
> +        return self.name in ('deprecated', 'unstable')
>
>
>  class QAPISchemaObjectTypeMember(QAPISchemaMember):
> --
> 2.31.1
>
>
Python bits: Acked-by: John Snow <jsnow@redhat.com>

Looks good overall from what I can see, minor style quibbles that I'd
probably fold on if you frowned at me.

--js

--000000000000d438a305cf3287b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 1:26 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">New =
option parameters unstable-input and unstable-output set policy<br>
for unstable interfaces just like deprecated-input and<br>
deprecated-output set policy for deprecated interfaces (see commit<br>
6dd75472d5 &quot;qemu-options: New -compat to set policy for deprecated<br>
interfaces&quot;).=C2=A0 This is intended for testing users of the manageme=
nt<br>
interfaces.=C2=A0 It is experimental.<br>
<br>
For now, this covers only syntactic aspects of QMP, i.e. stuff tagged<br>
with feature &#39;unstable&#39;.=C2=A0 We may want to extend it to cover se=
mantic<br>
aspects, or the command line.<br>
<br>
Note that there is no good way for management application to detect<br>
presence of these new option parameters: they are not visible output<br>
of query-qmp-schema or query-command-line-options.=C2=A0 Tolerable, because=
<br>
it&#39;s meant for testing.=C2=A0 If running with -compat fails, skip the t=
est.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0qapi/compat.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 6 +++++-<br>
=C2=A0include/qapi/util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
 +<br>
=C2=A0qapi/qmp-dispatch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6=
 ++++++<br>
=C2=A0qapi/qobject-output-visitor.c |=C2=A0 8 ++++++--<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 20 +++++++++++++++++++-<br>
=C2=A0scripts/qapi/events.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++----<br>
=C2=A0scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++----<br>
=C2=A07 files changed, 49 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/qapi/compat.json b/qapi/compat.json<br>
index 74a8493d3d..9bc9804abb 100644<br>
--- a/qapi/compat.json<br>
+++ b/qapi/compat.json<br>
@@ -47,9 +47,13 @@<br>
=C2=A0#<br>
=C2=A0# @deprecated-input: how to handle deprecated input (default &#39;acc=
ept&#39;)<br>
=C2=A0# @deprecated-output: how to handle deprecated output (default &#39;a=
ccept&#39;)<br>
+# @unstable-input: how to handle unstable input (default &#39;accept&#39;)=
<br>
+# @unstable-output: how to handle unstable output (default &#39;accept&#39=
;)<br>
=C2=A0#<br>
=C2=A0# Since: 6.0<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;CompatPolicy&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;*deprecated-input&#39;: &#39;CompatPoli=
cyInput&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*deprecated-output&#39;: &#=
39;CompatPolicyOutput&#39; } }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*deprecated-output&#39;: &#=
39;CompatPolicyOutput&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*unstable-input&#39;: &#39;=
CompatPolicyInput&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*unstable-output&#39;: &#39=
;CompatPolicyOutput&#39; } }<br>
diff --git a/include/qapi/util.h b/include/qapi/util.h<br>
index 0cc98db9f9..81a2b13a33 100644<br>
--- a/include/qapi/util.h<br>
+++ b/include/qapi/util.h<br>
@@ -13,6 +13,7 @@<br>
<br>
=C2=A0typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0QAPI_DEPRECATED,<br>
+=C2=A0 =C2=A0 QAPI_UNSTABLE,<br>
=C2=A0} QapiSpecialFeature;<br>
<br>
=C2=A0typedef struct QEnumLookup {<br>
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c<br>
index e29ade134c..c5c6e521a2 100644<br>
--- a/qapi/qmp-dispatch.c<br>
+++ b/qapi/qmp-dispatch.c<br>
@@ -59,6 +59,12 @@ bool compat_policy_input_ok(unsigned special_features,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_class, kin=
d, name, errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if ((special_features &amp; (1u &lt;&lt; QAPI_UNSTABLE))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !compat_policy_input_ok1(&quot;Unst=
able&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 policy-&gt;unstable_in=
put,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_class, kind, nam=
e, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c<=
br>
index b5c6564cbb..74770edd73 100644<br>
--- a/qapi/qobject-output-visitor.c<br>
+++ b/qapi/qobject-output-visitor.c<br>
@@ -212,8 +212,12 @@ static bool qobject_output_type_null(Visitor *v, const=
 char *name,<br>
=C2=A0static bool qobject_output_policy_skip(Visitor *v, const char *name,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned=
 special_features)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return !(special_features &amp;&amp; 1u &lt;&lt; QAPI_DEPREC=
ATED)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 || v-&gt;compat_policy.deprecated_output =3D=
=3D COMPAT_POLICY_OUTPUT_HIDE;<br>
+=C2=A0 =C2=A0 CompatPolicy *pol =3D &amp;v-&gt;compat_policy;<br>
+<br>
+=C2=A0 =C2=A0 return ((special_features &amp; 1u &lt;&lt; QAPI_DEPRECATED)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; pol-&gt;deprecated_ou=
tput =3D=3D COMPAT_POLICY_OUTPUT_HIDE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || ((special_features &amp; 1u &lt;&lt; QAPI_U=
NSTABLE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; pol-&gt;unstable_outp=
ut =3D=3D COMPAT_POLICY_OUTPUT_HIDE);<br>
=C2=A0}<br>
<br>
=C2=A0/* Finish building, and return the root object.<br>
diff --git a/qemu-options.hx b/qemu-options.hx<br>
index 5f375bbfa6..f051536b63 100644<br>
--- a/qemu-options.hx<br>
+++ b/qemu-options.hx<br>
@@ -3641,7 +3641,9 @@ DEFHEADING(Debug/Expert options:)<br>
<br>
=C2=A0DEF(&quot;compat&quot;, HAS_ARG, QEMU_OPTION_compat,<br>
=C2=A0 =C2=A0 =C2=A0&quot;-compat [deprecated-input=3Daccept|reject|crash][=
,deprecated-output=3Daccept|hide]\n&quot;<br>
-=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Policy for handling deprecated management interfaces\n&quot;,<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Policy for handling deprecated management interfaces\n&quot;<br>
+=C2=A0 =C2=A0 &quot;-compat [unstable-input=3Daccept|reject|crash][,unstab=
le-output=3Daccept|hide]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Policy for handling unstable management interfaces\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0QEMU_ARCH_ALL)<br>
=C2=A0SRST<br>
=C2=A0``-compat [deprecated-input=3D@var{input-policy}][,deprecated-output=
=3D@var{output-policy}]``<br>
@@ -3659,6 +3661,22 @@ SRST<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Suppress deprecated command results and e=
vents<br>
<br>
=C2=A0 =C2=A0 =C2=A0Limitation: covers only syntactic aspects of QMP.<br>
+<br>
+``-compat [unstable-input=3D@var{input-policy}][,unstable-output=3D@var{ou=
tput-policy}]``<br>
+=C2=A0 =C2=A0 Set policy for handling unstable management interfaces (expe=
rimental):<br>
+<br>
+=C2=A0 =C2=A0 ``unstable-input=3Daccept`` (default)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Accept unstable commands and arguments<br>
+=C2=A0 =C2=A0 ``unstable-input=3Dreject``<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Reject unstable commands and arguments<br>
+=C2=A0 =C2=A0 ``unstable-input=3Dcrash``<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Crash on unstable commands and arguments<br>
+=C2=A0 =C2=A0 ``unstable-output=3Daccept`` (default)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Emit unstable command results and events<br>
+=C2=A0 =C2=A0 ``unstable-output=3Dhide``<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Suppress unstable command results and events<b=
r>
+<br>
+=C2=A0 =C2=A0 Limitation: covers only syntactic aspects of QMP.<br>
=C2=A0ERST<br>
<br>
=C2=A0DEF(&quot;fw_cfg&quot;, HAS_ARG, QEMU_OPTION_fwcfg,<br>
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py<br>
index 82475e84ec..27b44c49f5 100644<br>
--- a/scripts/qapi/events.py<br>
+++ b/scripts/qapi/events.py<br>
@@ -109,13 +109,15 @@ def gen_event_send(name: str,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not boxed:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D gen_param_var(arg_=
type)<br>
<br>
-=C2=A0 =C2=A0 if &#39;deprecated&#39; in [<a href=3D"http://f.name" rel=3D=
"noreferrer" target=3D"_blank">f.name</a> for f in features]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 for f in features:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if f.is_special():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<b=
r>
<br>
-=C2=A0 =C2=A0 if (compat_policy.deprecated_output =3D=3D COMPAT_POLICY_OUT=
PUT_HIDE) {<br>
+=C2=A0 =C2=A0 if (compat_policy.%(feat)s_output =3D=3D COMPAT_POLICY_OUTPU=
T_HIDE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-&#39;&#39;&#39;)<br>
+&#39;&#39;&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0feat=3D<a href=3D"http://f.name" rel=3D"noreferrer" target=
=3D"_blank">f.name</a>)<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
<br>
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
index 55f82d7389..b7b3fc0ce4 100644<br>
--- a/scripts/qapi/schema.py<br>
+++ b/scripts/qapi/schema.py<br>
@@ -254,9 +254,11 @@ def doc_type(self):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def check(self, schema):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaEntity.check(self, schema)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;deprecated&#39; in [<a href=3D"http://=
f.name" rel=3D"noreferrer" target=3D"_blank">f.name</a> for f in self.featu=
res]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
self.info" rel=3D"noreferrer" target=3D"_blank">self.info</a>, &quot;featur=
e &#39;deprecated&#39; is not supported for types&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for feat in self.features:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if feat.is_special():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError=
(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a h=
ref=3D"http://self.info" rel=3D"noreferrer" target=3D"_blank">self.info</a>=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&qu=
ot;feature &#39;{<a href=3D"http://feat.name" rel=3D"noreferrer" target=3D"=
_blank">feat.name</a>}&#39; is not supported for types&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def describe(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert self.meta<br>
@@ -726,7 +728,7 @@ class QAPISchemaFeature(QAPISchemaMember):<br>
=C2=A0 =C2=A0 =C2=A0role =3D &#39;feature&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0def is_special(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return <a href=3D"http://self.name" rel=3D"nor=
eferrer" target=3D"_blank">self.name</a> in (&#39;deprecated&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return <a href=3D"http://self.name" rel=3D"nor=
eferrer" target=3D"_blank">self.name</a> in (&#39;deprecated&#39;, &#39;uns=
table&#39;)<br>
<br>
<br>
=C2=A0class QAPISchemaObjectTypeMember(QAPISchemaMember):<br>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>Python bits: Acked-by: John Snow &lt;<=
a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</div><div><br><=
/div><div>Looks good overall from what I can see, minor style quibbles that=
 I&#39;d probably fold on if you frowned at me.</div><div><br></div><div>--=
js<br></div></div></div>

--000000000000d438a305cf3287b0--


