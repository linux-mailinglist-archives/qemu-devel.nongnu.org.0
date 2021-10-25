Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5943A4B6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 22:30:57 +0200 (CEST)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf6cS-0007KF-2Y
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 16:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5eC-00019t-8P
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:28:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5e6-00040u-1F
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635190111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0tNvEpZ3qet9Ead1AGmc7KKOZBlFUbBeHNZO9uMqWDc=;
 b=hzxLwsxnnHgA2SgwWuvmXy2nSZvp1S7Fun5ztsbYg/vAqmBD15QWNZxwuwS5g1TAjHiNWU
 gfZCVP4gWoUC4m/0LozCb6xBh7neK8kyNLyapZPg/EFM588bJKMCMR5XPcb4TfJ6//z4O/
 PXPt/jbFZ9MxpQED1yjPk0xXOifnnao=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-LLdPGPegMl6Bxe1ctfnW7Q-1; Mon, 25 Oct 2021 15:28:27 -0400
X-MC-Unique: LLdPGPegMl6Bxe1ctfnW7Q-1
Received: by mail-ua1-f71.google.com with SMTP id
 e5-20020ab04985000000b002cad81164cbso6893323uad.10
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0tNvEpZ3qet9Ead1AGmc7KKOZBlFUbBeHNZO9uMqWDc=;
 b=xlwyX3jYLoUQDG5Xv9G/SvU1MPBADElNwYWS7I1xerZedNUd8MiRtDu0CIdlYS343i
 do0IL1QM1uAeZXfef/TTbXShPrIQKYMFCxf7kV5HaXjon7zY8BLWd0f2zJ4uentF/KDT
 aRWEc4BZTxy8RJhg15uJn3WIsNVLKLfabXWIhUBmZZA6yAzK/fIpKMNUdqCAlXW+IAM5
 uabL9YH/iB2NH1e10514vk/CZDdarY34O4dCjRIONO46tdyR+80uAYq78oTabLE0CqY4
 VMyZfInvAy6LVVVFBbr343HAmb8tlOOfeM38DkvTHEj2OIfR8JEeR2178qFllVTn+WUW
 AVaA==
X-Gm-Message-State: AOAM5302qADOMjATlIf2kyJpVOgg5shYaClzUO6WHwOKW2fmvVXLA05K
 seyK6M6ve/KurHFoutAl0ARURHwscHmkTSAb69maQt9JPvN8GStjURY7oaO/mQZRn1nnhW/2YlX
 USTqv8+odQWb0ai7q/jZiMKh6BVSHfa8=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr17220448vsp.59.1635190106617; 
 Mon, 25 Oct 2021 12:28:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEKYgknRBoV2B19P1ef9tPBP+SB6mE5lees9aag0CEyhy29rWvGjwKuc67+GqqR42oyQ7GUaguT+gSzzyfi3U=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr17220410vsp.59.1635190106359; 
 Mon, 25 Oct 2021 12:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-6-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-6-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Oct 2021 15:28:15 -0400
Message-ID: <CAFn=p-a9w7Qn8kVK4AADKgj-c7ewhDRhvAHKKN-omwjiSstjSw@mail.gmail.com>
Subject: Re: [PATCH 5/9] qapi: Generalize struct member policy checking
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006e1e2b05cf325dcc"
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

--0000000000006e1e2b05cf325dcc
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster <armbru@redhat.com> wrote:

> The generated visitor functions call visit_deprecated_accept() and
> visit_deprecated() when visiting a struct member with special feature
> flag 'deprecated'.  This makes the feature flag visible to the actual
> visitors.  I want to make feature flag 'unstable' visible there as
> well, so I can add policy for it.
>
> To let me make it visible, replace these functions by
> visit_policy_reject() and visit_policy_skip(), which take the member's
> special features as an argument.  Note that the new functions have the
> opposite sense, i.e. the return value flips.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/visitor-impl.h   |  6 ++++--
>  include/qapi/visitor.h        | 17 +++++++++++++----
>  qapi/qapi-forward-visitor.c   | 16 +++++++++-------
>  qapi/qapi-visit-core.c        | 22 ++++++++++++----------
>  qapi/qobject-input-visitor.c  | 15 ++++++++++-----
>  qapi/qobject-output-visitor.c |  9 ++++++---
>  qapi/trace-events             |  4 ++--
>  scripts/qapi/visit.py         | 14 +++++++-------
>  8 files changed, 63 insertions(+), 40 deletions(-)
>
> diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h
> index 72b6537bef..2badec5ba4 100644
> --- a/include/qapi/visitor-impl.h
> +++ b/include/qapi/visitor-impl.h
> @@ -114,10 +114,12 @@ struct Visitor
>      void (*optional)(Visitor *v, const char *name, bool *present);
>
>      /* Optional */
> -    bool (*deprecated_accept)(Visitor *v, const char *name, Error **errp);
> +    bool (*policy_reject)(Visitor *v, const char *name,
> +                          unsigned special_features, Error **errp);
>
>      /* Optional */
> -    bool (*deprecated)(Visitor *v, const char *name);
> +    bool (*policy_skip)(Visitor *v, const char *name,
> +                        unsigned special_features);
>
>      /* Must be set */
>      VisitorType type;
> diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
> index dcb96018a9..d53a84c9ba 100644
> --- a/include/qapi/visitor.h
> +++ b/include/qapi/visitor.h
> @@ -461,22 +461,31 @@ void visit_end_alternate(Visitor *v, void **obj);
>  bool visit_optional(Visitor *v, const char *name, bool *present);
>
>  /*
> - * Should we reject deprecated member @name?
> + * Should we reject member @name due to policy?
> + *
> + * @special_features is the member's special features encoded as a
> + * bitset of QapiSpecialFeature.
>   *
>   * @name must not be NULL.  This function is only useful between
>   * visit_start_struct() and visit_end_struct(), since only objects
>   * have deprecated members.
>   */
> -bool visit_deprecated_accept(Visitor *v, const char *name, Error **errp);
> +bool visit_policy_reject(Visitor *v, const char *name,
> +                         unsigned special_features, Error **errp);
>
>  /*
> - * Should we visit deprecated member @name?
> + *
> + * Should we skip member @name due to policy?
> + *
> + * @special_features is the member's special features encoded as a
> + * bitset of QapiSpecialFeature.
>   *
>   * @name must not be NULL.  This function is only useful between
>   * visit_start_struct() and visit_end_struct(), since only objects
>   * have deprecated members.
>   */
> -bool visit_deprecated(Visitor *v, const char *name);
> +bool visit_policy_skip(Visitor *v, const char *name,
> +                       unsigned special_features);
>
>  /*
>   * Set policy for handling deprecated management interfaces.
> diff --git a/qapi/qapi-forward-visitor.c b/qapi/qapi-forward-visitor.c
> index a4b111e22a..25d098aa8a 100644
> --- a/qapi/qapi-forward-visitor.c
> +++ b/qapi/qapi-forward-visitor.c
> @@ -246,25 +246,27 @@ static void forward_field_optional(Visitor *v, const
> char *name, bool *present)
>      visit_optional(ffv->target, name, present);
>  }
>
> -static bool forward_field_deprecated_accept(Visitor *v, const char *name,
> -                                            Error **errp)
> +static bool forward_field_policy_reject(Visitor *v, const char *name,
> +                                        unsigned special_features,
> +                                        Error **errp)
>  {
>      ForwardFieldVisitor *ffv = to_ffv(v);
>
>      if (!forward_field_translate_name(ffv, &name, errp)) {
>          return false;
>      }
> -    return visit_deprecated_accept(ffv->target, name, errp);
> +    return visit_policy_reject(ffv->target, name, special_features, errp);
>  }
>
> -static bool forward_field_deprecated(Visitor *v, const char *name)
> +static bool forward_field_policy_skip(Visitor *v, const char *name,
> +                                      unsigned special_features)
>  {
>      ForwardFieldVisitor *ffv = to_ffv(v);
>
>      if (!forward_field_translate_name(ffv, &name, NULL)) {
>          return false;
>      }
> -    return visit_deprecated(ffv->target, name);
> +    return visit_policy_skip(ffv->target, name, special_features);
>  }
>
>  static void forward_field_complete(Visitor *v, void *opaque)
> @@ -313,8 +315,8 @@ Visitor *visitor_forward_field(Visitor *target, const
> char *from, const char *to
>      v->visitor.type_any = forward_field_type_any;
>      v->visitor.type_null = forward_field_type_null;
>      v->visitor.optional = forward_field_optional;
> -    v->visitor.deprecated_accept = forward_field_deprecated_accept;
> -    v->visitor.deprecated = forward_field_deprecated;
> +    v->visitor.policy_reject = forward_field_policy_reject;
> +    v->visitor.policy_skip = forward_field_policy_skip;
>      v->visitor.complete = forward_field_complete;
>      v->visitor.free = forward_field_free;
>
> diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
> index 49136ae88e..b4a81f1757 100644
> --- a/qapi/qapi-visit-core.c
> +++ b/qapi/qapi-visit-core.c
> @@ -139,22 +139,24 @@ bool visit_optional(Visitor *v, const char *name,
> bool *present)
>      return *present;
>  }
>
> -bool visit_deprecated_accept(Visitor *v, const char *name, Error **errp)
> +bool visit_policy_reject(Visitor *v, const char *name,
> +                         unsigned special_features, Error **errp)
>  {
> -    trace_visit_deprecated_accept(v, name);
> -    if (v->deprecated_accept) {
> -        return v->deprecated_accept(v, name, errp);
> +    trace_visit_policy_reject(v, name);
> +    if (v->policy_reject) {
> +        return v->policy_reject(v, name, special_features, errp);
>      }
> -    return true;
> +    return false;
>  }
>
> -bool visit_deprecated(Visitor *v, const char *name)
> +bool visit_policy_skip(Visitor *v, const char *name,
> +                       unsigned special_features)
>  {
> -    trace_visit_deprecated(v, name);
> -    if (v->deprecated) {
> -        return v->deprecated(v, name);
> +    trace_visit_policy_skip(v, name);
> +    if (v->policy_skip) {
> +        return v->policy_skip(v, name, special_features);
>      }
> -    return true;
> +    return false;
>  }
>
>  void visit_set_policy(Visitor *v, CompatPolicy *policy)
> diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
> index 71b24a4429..fda485614b 100644
> --- a/qapi/qobject-input-visitor.c
> +++ b/qapi/qobject-input-visitor.c
> @@ -662,16 +662,21 @@ static void qobject_input_optional(Visitor *v, const
> char *name, bool *present)
>      *present = true;
>  }
>
> -static bool qobject_input_deprecated_accept(Visitor *v, const char *name,
> -                                            Error **errp)
> +static bool qobject_input_policy_reject(Visitor *v, const char *name,
> +                                        unsigned special_features,
> +                                        Error **errp)
>  {
> +    if (!(special_features && 1u << QAPI_DEPRECATED)) {
> +        return false;
> +    }
> +
>      switch (v->compat_policy.deprecated_input) {
>      case COMPAT_POLICY_INPUT_ACCEPT:
> -        return true;
> +        return false;
>      case COMPAT_POLICY_INPUT_REJECT:
>          error_setg(errp, "Deprecated parameter '%s' disabled by policy",
>                     name);
> -        return false;
> +        return true;
>      case COMPAT_POLICY_INPUT_CRASH:
>      default:
>          abort();
> @@ -712,7 +717,7 @@ static QObjectInputVisitor
> *qobject_input_visitor_base_new(QObject *obj)
>      v->visitor.end_list = qobject_input_end_list;
>      v->visitor.start_alternate = qobject_input_start_alternate;
>      v->visitor.optional = qobject_input_optional;
> -    v->visitor.deprecated_accept = qobject_input_deprecated_accept;
> +    v->visitor.policy_reject = qobject_input_policy_reject;
>      v->visitor.free = qobject_input_free;
>
>      v->root = qobject_ref(obj);
> diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c
> index 9b7f510036..b5c6564cbb 100644
> --- a/qapi/qobject-output-visitor.c
> +++ b/qapi/qobject-output-visitor.c
> @@ -13,6 +13,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qapi/compat-policy.h"
>  #include "qapi/qobject-output-visitor.h"
>  #include "qapi/visitor-impl.h"
>  #include "qemu/queue.h"
> @@ -208,9 +209,11 @@ static bool qobject_output_type_null(Visitor *v,
> const char *name,
>      return true;
>  }
>
> -static bool qobject_output_deprecated(Visitor *v, const char *name)
> +static bool qobject_output_policy_skip(Visitor *v, const char *name,
> +                                       unsigned special_features)
>  {
> -    return v->compat_policy.deprecated_output !=
> COMPAT_POLICY_OUTPUT_HIDE;
> +    return !(special_features && 1u << QAPI_DEPRECATED)
> +        || v->compat_policy.deprecated_output ==
> COMPAT_POLICY_OUTPUT_HIDE;
>  }
>
>  /* Finish building, and return the root object.
> @@ -262,7 +265,7 @@ Visitor *qobject_output_visitor_new(QObject **result)
>      v->visitor.type_number = qobject_output_type_number;
>      v->visitor.type_any = qobject_output_type_any;
>      v->visitor.type_null = qobject_output_type_null;
> -    v->visitor.deprecated = qobject_output_deprecated;
> +    v->visitor.policy_skip = qobject_output_policy_skip;
>      v->visitor.complete = qobject_output_complete;
>      v->visitor.free = qobject_output_free;
>
> diff --git a/qapi/trace-events b/qapi/trace-events
> index cccafc07e5..ab108c4f0e 100644
> --- a/qapi/trace-events
> +++ b/qapi/trace-events
> @@ -17,8 +17,8 @@ visit_start_alternate(void *v, const char *name, void
> *obj, size_t size) "v=%p n
>  visit_end_alternate(void *v, void *obj) "v=%p obj=%p"
>
>  visit_optional(void *v, const char *name, bool *present) "v=%p name=%s
> present=%p"
> -visit_deprecated_accept(void *v, const char *name) "v=%p name=%s"
> -visit_deprecated(void *v, const char *name) "v=%p name=%s"
> +visit_policy_reject(void *v, const char *name) "v=%p name=%s"
> +visit_policy_skip(void *v, const char *name) "v=%p name=%s"
>
>  visit_type_enum(void *v, const char *name, int *obj) "v=%p name=%s obj=%p"
>  visit_type_int(void *v, const char *name, int64_t *obj) "v=%p name=%s
> obj=%p"
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 9d9196a143..e13bbe4292 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -21,7 +21,7 @@
>      indent,
>      mcgen,
>  )
> -from .gen import QAPISchemaModularCVisitor, ifcontext
> +from .gen import QAPISchemaModularCVisitor, gen_special_features,
> ifcontext
>  from .schema import (
>      QAPISchema,
>      QAPISchemaEnumMember,
> @@ -76,7 +76,6 @@ def gen_visit_object_members(name: str,
>                       c_type=base.c_name())
>
>      for memb in members:
> -        deprecated = 'deprecated' in [f.name for f in memb.features]
>          ret += memb.ifcond.gen_if()
>          if memb.optional:
>              ret += mcgen('''
> @@ -84,14 +83,15 @@ def gen_visit_object_members(name: str,
>  ''',
>                           name=memb.name, c_name=c_name(memb.name))
>              indent.increase()
> -        if deprecated:
> +        special_features = gen_special_features(memb.features)
> +        if special_features != '0':
>

Would it be possible for gen_special_features to return something false-y
instead of '0'? Do we actually *use* the '0' return anywhere other than to
test it to see if we should include additional code?

If you actually use the '0' anywhere: Go ahead and treat this as an ack. If
you don't, can we clean this up?
(Sorry, I find the mcgen stuff hard to read in patch form and I am trying
to give you a quick review instead of NO review.)

--js


>              ret += mcgen('''
> -    if (!visit_deprecated_accept(v, "%(name)s", errp)) {
> +    if (visit_policy_reject(v, "%(name)s", %(special_features)s, errp)) {
>          return false;
>      }
> -    if (visit_deprecated(v, "%(name)s")) {
> +    if (!visit_policy_skip(v, "%(name)s", %(special_features)s)) {
>  ''',
> -                         name=memb.name)
> +                         name=memb.name,
> special_features=special_features)
>              indent.increase()
>          ret += mcgen('''
>      if (!visit_type_%(c_type)s(v, "%(name)s", &obj->%(c_name)s, errp)) {
> @@ -100,7 +100,7 @@ def gen_visit_object_members(name: str,
>  ''',
>                       c_type=memb.type.c_name(), name=memb.name,
>                       c_name=c_name(memb.name))
> -        if deprecated:
> +        if special_features != '0':
>              indent.decrease()
>              ret += mcgen('''
>      }
> --
> 2.31.1
>
>

--0000000000006e1e2b05cf325dcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 1:25 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
generated visitor functions call visit_deprecated_accept() and<br>
visit_deprecated() when visiting a struct member with special feature<br>
flag &#39;deprecated&#39;.=C2=A0 This makes the feature flag visible to the=
 actual<br>
visitors.=C2=A0 I want to make feature flag &#39;unstable&#39; visible ther=
e as<br>
well, so I can add policy for it.<br>
<br>
To let me make it visible, replace these functions by<br>
visit_policy_reject() and visit_policy_skip(), which take the member&#39;s<=
br>
special features as an argument.=C2=A0 Note that the new functions have the=
<br>
opposite sense, i.e. the return value flips.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qapi/visitor-impl.h=C2=A0 =C2=A0|=C2=A0 6 ++++--<br>
=C2=A0include/qapi/visitor.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 +++++++++++++-=
---<br>
=C2=A0qapi/qapi-forward-visitor.c=C2=A0 =C2=A0| 16 +++++++++-------<br>
=C2=A0qapi/qapi-visit-core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 22 ++++++++++++--=
--------<br>
=C2=A0qapi/qobject-input-visitor.c=C2=A0 | 15 ++++++++++-----<br>
=C2=A0qapi/qobject-output-visitor.c |=C2=A0 9 ++++++---<br>
=C2=A0qapi/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 ++--<br>
=C2=A0scripts/qapi/visit.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++++++--=
-----<br>
=C2=A08 files changed, 63 insertions(+), 40 deletions(-)<br>
<br>
diff --git a/include/qapi/visitor-impl.h b/include/qapi/visitor-impl.h<br>
index 72b6537bef..2badec5ba4 100644<br>
--- a/include/qapi/visitor-impl.h<br>
+++ b/include/qapi/visitor-impl.h<br>
@@ -114,10 +114,12 @@ struct Visitor<br>
=C2=A0 =C2=A0 =C2=A0void (*optional)(Visitor *v, const char *name, bool *pr=
esent);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Optional */<br>
-=C2=A0 =C2=A0 bool (*deprecated_accept)(Visitor *v, const char *name, Erro=
r **errp);<br>
+=C2=A0 =C2=A0 bool (*policy_reject)(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned special_features, Error **errp);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Optional */<br>
-=C2=A0 =C2=A0 bool (*deprecated)(Visitor *v, const char *name);<br>
+=C2=A0 =C2=A0 bool (*policy_skip)(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 unsigned special_features);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Must be set */<br>
=C2=A0 =C2=A0 =C2=A0VisitorType type;<br>
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h<br>
index dcb96018a9..d53a84c9ba 100644<br>
--- a/include/qapi/visitor.h<br>
+++ b/include/qapi/visitor.h<br>
@@ -461,22 +461,31 @@ void visit_end_alternate(Visitor *v, void **obj);<br>
=C2=A0bool visit_optional(Visitor *v, const char *name, bool *present);<br>
<br>
=C2=A0/*<br>
- * Should we reject deprecated member @name?<br>
+ * Should we reject member @name due to policy?<br>
+ *<br>
+ * @special_features is the member&#39;s special features encoded as a<br>
+ * bitset of QapiSpecialFeature.<br>
=C2=A0 *<br>
=C2=A0 * @name must not be NULL.=C2=A0 This function is only useful between=
<br>
=C2=A0 * visit_start_struct() and visit_end_struct(), since only objects<br=
>
=C2=A0 * have deprecated members.<br>
=C2=A0 */<br>
-bool visit_deprecated_accept(Visitor *v, const char *name, Error **errp);<=
br>
+bool visit_policy_reject(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0unsigned special_features, Error **errp);<br>
<br>
=C2=A0/*<br>
- * Should we visit deprecated member @name?<br>
+ *<br>
+ * Should we skip member @name due to policy?<br>
+ *<br>
+ * @special_features is the member&#39;s special features encoded as a<br>
+ * bitset of QapiSpecialFeature.<br>
=C2=A0 *<br>
=C2=A0 * @name must not be NULL.=C2=A0 This function is only useful between=
<br>
=C2=A0 * visit_start_struct() and visit_end_struct(), since only objects<br=
>
=C2=A0 * have deprecated members.<br>
=C2=A0 */<br>
-bool visit_deprecated(Visitor *v, const char *name);<br>
+bool visit_policy_skip(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned special_features);<br>
<br>
=C2=A0/*<br>
=C2=A0 * Set policy for handling deprecated management interfaces.<br>
diff --git a/qapi/qapi-forward-visitor.c b/qapi/qapi-forward-visitor.c<br>
index a4b111e22a..25d098aa8a 100644<br>
--- a/qapi/qapi-forward-visitor.c<br>
+++ b/qapi/qapi-forward-visitor.c<br>
@@ -246,25 +246,27 @@ static void forward_field_optional(Visitor *v, const =
char *name, bool *present)<br>
=C2=A0 =C2=A0 =C2=A0visit_optional(ffv-&gt;target, name, present);<br>
=C2=A0}<br>
<br>
-static bool forward_field_deprecated_accept(Visitor *v, const char *name,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Error **errp)<br>
+static bool forward_field_policy_reject(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned=
 special_features,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **=
errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ForwardFieldVisitor *ffv =3D to_ffv(v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!forward_field_translate_name(ffv, &amp;name, errp)=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 return visit_deprecated_accept(ffv-&gt;target, name, errp);<=
br>
+=C2=A0 =C2=A0 return visit_policy_reject(ffv-&gt;target, name, special_fea=
tures, errp);<br>
=C2=A0}<br>
<br>
-static bool forward_field_deprecated(Visitor *v, const char *name)<br>
+static bool forward_field_policy_skip(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned specia=
l_features)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ForwardFieldVisitor *ffv =3D to_ffv(v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!forward_field_translate_name(ffv, &amp;name, NULL)=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 return visit_deprecated(ffv-&gt;target, name);<br>
+=C2=A0 =C2=A0 return visit_policy_skip(ffv-&gt;target, name, special_featu=
res);<br>
=C2=A0}<br>
<br>
=C2=A0static void forward_field_complete(Visitor *v, void *opaque)<br>
@@ -313,8 +315,8 @@ Visitor *visitor_forward_field(Visitor *target, const c=
har *from, const char *to<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.type_any =3D forward_field_type_any;<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.type_null =3D forward_field_type_null;<br=
>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.optional =3D forward_field_optional;<br>
-=C2=A0 =C2=A0 v-&gt;visitor.deprecated_accept =3D forward_field_deprecated=
_accept;<br>
-=C2=A0 =C2=A0 v-&gt;visitor.deprecated =3D forward_field_deprecated;<br>
+=C2=A0 =C2=A0 v-&gt;visitor.policy_reject =3D forward_field_policy_reject;=
<br>
+=C2=A0 =C2=A0 v-&gt;visitor.policy_skip =3D forward_field_policy_skip;<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.complete =3D forward_field_complete;<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.free =3D forward_field_free;<br>
<br>
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c<br>
index 49136ae88e..b4a81f1757 100644<br>
--- a/qapi/qapi-visit-core.c<br>
+++ b/qapi/qapi-visit-core.c<br>
@@ -139,22 +139,24 @@ bool visit_optional(Visitor *v, const char *name, boo=
l *present)<br>
=C2=A0 =C2=A0 =C2=A0return *present;<br>
=C2=A0}<br>
<br>
-bool visit_deprecated_accept(Visitor *v, const char *name, Error **errp)<b=
r>
+bool visit_policy_reject(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0unsigned special_features, Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 trace_visit_deprecated_accept(v, name);<br>
-=C2=A0 =C2=A0 if (v-&gt;deprecated_accept) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return v-&gt;deprecated_accept(v, name, errp);=
<br>
+=C2=A0 =C2=A0 trace_visit_policy_reject(v, name);<br>
+=C2=A0 =C2=A0 if (v-&gt;policy_reject) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return v-&gt;policy_reject(v, name, special_fe=
atures, errp);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 return false;<br>
=C2=A0}<br>
<br>
-bool visit_deprecated(Visitor *v, const char *name)<br>
+bool visit_policy_skip(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned special_features)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 trace_visit_deprecated(v, name);<br>
-=C2=A0 =C2=A0 if (v-&gt;deprecated) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return v-&gt;deprecated(v, name);<br>
+=C2=A0 =C2=A0 trace_visit_policy_skip(v, name);<br>
+=C2=A0 =C2=A0 if (v-&gt;policy_skip) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return v-&gt;policy_skip(v, name, special_feat=
ures);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 return false;<br>
=C2=A0}<br>
<br>
=C2=A0void visit_set_policy(Visitor *v, CompatPolicy *policy)<br>
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c<br=
>
index 71b24a4429..fda485614b 100644<br>
--- a/qapi/qobject-input-visitor.c<br>
+++ b/qapi/qobject-input-visitor.c<br>
@@ -662,16 +662,21 @@ static void qobject_input_optional(Visitor *v, const =
char *name, bool *present)<br>
=C2=A0 =C2=A0 =C2=A0*present =3D true;<br>
=C2=A0}<br>
<br>
-static bool qobject_input_deprecated_accept(Visitor *v, const char *name,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Error **errp)<br>
+static bool qobject_input_policy_reject(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned=
 special_features,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **=
errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 if (!(special_features &amp;&amp; 1u &lt;&lt; QAPI_DEPRECATE=
D)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0switch (v-&gt;compat_policy.deprecated_input) {<br>
=C2=A0 =C2=A0 =C2=A0case COMPAT_POLICY_INPUT_ACCEPT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
=C2=A0 =C2=A0 =C2=A0case COMPAT_POLICY_INPUT_REJECT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Deprecated paramet=
er &#39;%s&#39; disabled by policy&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
=C2=A0 =C2=A0 =C2=A0case COMPAT_POLICY_INPUT_CRASH:<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>
@@ -712,7 +717,7 @@ static QObjectInputVisitor *qobject_input_visitor_base_=
new(QObject *obj)<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.end_list =3D qobject_input_end_list;<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.start_alternate =3D qobject_input_start_a=
lternate;<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.optional =3D qobject_input_optional;<br>
-=C2=A0 =C2=A0 v-&gt;visitor.deprecated_accept =3D qobject_input_deprecated=
_accept;<br>
+=C2=A0 =C2=A0 v-&gt;visitor.policy_reject =3D qobject_input_policy_reject;=
<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.free =3D qobject_input_free;<br>
<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;root =3D qobject_ref(obj);<br>
diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c<=
br>
index 9b7f510036..b5c6564cbb 100644<br>
--- a/qapi/qobject-output-visitor.c<br>
+++ b/qapi/qobject-output-visitor.c<br>
@@ -13,6 +13,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/compat-policy.h&quot;<br>
=C2=A0#include &quot;qapi/qobject-output-visitor.h&quot;<br>
=C2=A0#include &quot;qapi/visitor-impl.h&quot;<br>
=C2=A0#include &quot;qemu/queue.h&quot;<br>
@@ -208,9 +209,11 @@ static bool qobject_output_type_null(Visitor *v, const=
 char *name,<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
-static bool qobject_output_deprecated(Visitor *v, const char *name)<br>
+static bool qobject_output_policy_skip(Visitor *v, const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
special_features)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return v-&gt;compat_policy.deprecated_output !=3D COMPAT_POL=
ICY_OUTPUT_HIDE;<br>
+=C2=A0 =C2=A0 return !(special_features &amp;&amp; 1u &lt;&lt; QAPI_DEPREC=
ATED)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || v-&gt;compat_policy.deprecated_output =3D=
=3D COMPAT_POLICY_OUTPUT_HIDE;<br>
=C2=A0}<br>
<br>
=C2=A0/* Finish building, and return the root object.<br>
@@ -262,7 +265,7 @@ Visitor *qobject_output_visitor_new(QObject **result)<b=
r>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.type_number =3D qobject_output_type_numbe=
r;<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.type_any =3D qobject_output_type_any;<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.type_null =3D qobject_output_type_null;<b=
r>
-=C2=A0 =C2=A0 v-&gt;visitor.deprecated =3D qobject_output_deprecated;<br>
+=C2=A0 =C2=A0 v-&gt;visitor.policy_skip =3D qobject_output_policy_skip;<br=
>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.complete =3D qobject_output_complete;<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;visitor.free =3D qobject_output_free;<br>
<br>
diff --git a/qapi/trace-events b/qapi/trace-events<br>
index cccafc07e5..ab108c4f0e 100644<br>
--- a/qapi/trace-events<br>
+++ b/qapi/trace-events<br>
@@ -17,8 +17,8 @@ visit_start_alternate(void *v, const char *name, void *ob=
j, size_t size) &quot;v=3D%p n<br>
=C2=A0visit_end_alternate(void *v, void *obj) &quot;v=3D%p obj=3D%p&quot;<b=
r>
<br>
=C2=A0visit_optional(void *v, const char *name, bool *present) &quot;v=3D%p=
 name=3D%s present=3D%p&quot;<br>
-visit_deprecated_accept(void *v, const char *name) &quot;v=3D%p name=3D%s&=
quot;<br>
-visit_deprecated(void *v, const char *name) &quot;v=3D%p name=3D%s&quot;<b=
r>
+visit_policy_reject(void *v, const char *name) &quot;v=3D%p name=3D%s&quot=
;<br>
+visit_policy_skip(void *v, const char *name) &quot;v=3D%p name=3D%s&quot;<=
br>
<br>
=C2=A0visit_type_enum(void *v, const char *name, int *obj) &quot;v=3D%p nam=
e=3D%s obj=3D%p&quot;<br>
=C2=A0visit_type_int(void *v, const char *name, int64_t *obj) &quot;v=3D%p =
name=3D%s obj=3D%p&quot;<br>
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py<br>
index 9d9196a143..e13bbe4292 100644<br>
--- a/scripts/qapi/visit.py<br>
+++ b/scripts/qapi/visit.py<br>
@@ -21,7 +21,7 @@<br>
=C2=A0 =C2=A0 =C2=A0indent,<br>
=C2=A0 =C2=A0 =C2=A0mcgen,<br>
=C2=A0)<br>
-from .gen import QAPISchemaModularCVisitor, ifcontext<br>
+from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontex=
t<br>
=C2=A0from .schema import (<br>
=C2=A0 =C2=A0 =C2=A0QAPISchema,<br>
=C2=A0 =C2=A0 =C2=A0QAPISchemaEnumMember,<br>
@@ -76,7 +76,6 @@ def gen_visit_object_members(name: str,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 c_type=3Dbase.c_name())<br>
<br>
=C2=A0 =C2=A0 =C2=A0for memb in members:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 deprecated =3D &#39;deprecated&#39; in [<a hre=
f=3D"http://f.name" rel=3D"noreferrer" target=3D"_blank">f.name</a> for f i=
n memb.features]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D memb.ifcond.gen_if()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if memb.optional:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#=
39;<br>
@@ -84,14 +83,15 @@ def gen_visit_object_members(name: str,<br>
=C2=A0&#39;&#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 name=3D<a href=3D"http://memb.name" rel=3D"noreferrer" ta=
rget=3D"_blank">memb.name</a>, c_name=3Dc_name(<a href=3D"http://memb.name"=
 rel=3D"noreferrer" target=3D"_blank">memb.name</a>))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indent.increase()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if deprecated:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 special_features =3D gen_special_features(memb=
.features)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if special_features !=3D &#39;0&#39;:<br></blo=
ckquote></div><div><br></div><div>Would it be possible for gen_special_feat=
ures to return something false-y instead of &#39;0&#39;? Do we actually *us=
e* the &#39;0&#39; return anywhere other than to test it to see if we shoul=
d include additional code?</div><div><br></div><div>If you actually use the=
 &#39;0&#39; anywhere: Go ahead and treat this as an ack. If you don&#39;t,=
 can we clean this up?</div><div>(Sorry, I find the mcgen stuff hard to rea=
d in patch form and I am trying to give you a quick review instead of NO re=
view.)<br></div><div><br></div><div>--js<br></div><div class=3D"gmail_quote=
"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#=
39;<br>
-=C2=A0 =C2=A0 if (!visit_deprecated_accept(v, &quot;%(name)s&quot;, errp))=
 {<br>
+=C2=A0 =C2=A0 if (visit_policy_reject(v, &quot;%(name)s&quot;, %(special_f=
eatures)s, errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (visit_deprecated(v, &quot;%(name)s&quot;)) {<br>
+=C2=A0 =C2=A0 if (!visit_policy_skip(v, &quot;%(name)s&quot;, %(special_fe=
atures)s)) {<br>
=C2=A0&#39;&#39;&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0name=3D<a href=3D"http://memb.name" rel=3D"noreferrer" tar=
get=3D"_blank">memb.name</a>)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0name=3D<a href=3D"http://memb.name" rel=3D"noreferrer" tar=
get=3D"_blank">memb.name</a>, special_features=3Dspecial_features)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indent.increase()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0if (!visit_type_%(c_type)s(v, &quot;%(name)s&quot;, &am=
p;obj-&gt;%(c_name)s, errp)) {<br>
@@ -100,7 +100,7 @@ def gen_visit_object_members(name: str,<br>
=C2=A0&#39;&#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 c_type=3Dmemb.type.c_name(), name=3D<a href=3D"http://memb.name" rel=3D=
"noreferrer" target=3D"_blank">memb.name</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 c_name=3Dc_name(<a href=3D"http://memb.name" rel=3D"noreferrer" target=
=3D"_blank">memb.name</a>))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if deprecated:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if special_features !=3D &#39;0&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indent.decrease()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#=
39;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.31.1<br>
<br></blockquote><br><div><br></div></div></div>

--0000000000006e1e2b05cf325dcc--


