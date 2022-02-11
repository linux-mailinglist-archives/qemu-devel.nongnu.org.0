Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA75B4B2D2E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:57:37 +0100 (CET)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIb6u-0000vR-BG
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:57:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nIamK-0006lu-Lx
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 13:36:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nIamH-0004ao-01
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 13:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644604575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FUn2nuOXzIeUa5KeIxtC4kdAscdCAZcYPT587NSiJYM=;
 b=ZDr8osQOS3qL4UpA7moK8ZlV2pfb5npEgY2Y7DlYXsGzT6rYBTTWFZ0QpjUv5Eqv/uU463
 J6gxXdp3bJtgvZIGbc00KTdGS1YsG7z7Ytj0W5v9wKLoM96JlJA6RmLr6EdUH6B+udvqWy
 nITSOhXNV3rND5c3L20PN++VCpGcGEg=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-8Fjtq7tcNn6OZI_R4Tm2HQ-1; Fri, 11 Feb 2022 13:36:13 -0500
X-MC-Unique: 8Fjtq7tcNn6OZI_R4Tm2HQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 r189-20020a1f2bc6000000b0031f6aa22a0eso1204122vkr.9
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 10:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FUn2nuOXzIeUa5KeIxtC4kdAscdCAZcYPT587NSiJYM=;
 b=DocD3qXdiHV2zn70J+rqfqyEtGdrLz1JRS3lQomvjsOE0fepWAybh1U+/Sx7jZ3d3Z
 vFWX8ssyA5yMmTNVTpUq9gYmgWUy0M41B6Biu1wWOhg6b5GecAoZItThy+vdylg0B696
 VoCU+gYBCaksoGDInHGDKOjhuGGrj0qLVEtyZjMb0sMMJ9W9mC9qAcnVzV/j2F2+2IAx
 X0P7mo/GSTGOSHE+BskiR6opA+gijgkq/wHTujTwzgEL49TgOfH1iAAlt43ffGlExB6f
 xRvkt0VA72eqneAovDpx9QPCQhFrwnZcMcKuT+1adHOq6M3+QwQpeSy+8mnYCY6SET9z
 teKw==
X-Gm-Message-State: AOAM5314+7mW/i0QhngV63H7d36pehx9+Y9lNaiexk0XzJQ7AP9cRmGM
 BK8SOFypATxGLyDzNpLGwu4S7/8aT/MfUagmr/y43LZAVvvm9xPF0E05gkzY/ivfkQ802n8EWLt
 B8OFpnRbBbiI4+PSLfv2+hmkUqkPqfpE=
X-Received: by 2002:a67:f754:: with SMTP id w20mr893228vso.11.1644604573260;
 Fri, 11 Feb 2022 10:36:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL+antBBDQOzRLts/wFhPzXyjtzS8mziK3S9sVxTIK9p3rUWcLAxv6OTptX1/GX4C0eHhvX4llokm1GSHoKkk=
X-Received: by 2002:a67:f754:: with SMTP id w20mr893219vso.11.1644604572871;
 Fri, 11 Feb 2022 10:36:12 -0800 (PST)
MIME-Version: 1.0
References: <20220204225230.2114135-1-jsnow@redhat.com>
 <87leyibtqz.fsf@pond.sub.org>
 <CAFn=p-YSAe7Q+usWEv4b7UciYjm5iso9LH-pd-VbDoV196PfvQ@mail.gmail.com>
 <87o83d8vij.fsf@pond.sub.org>
 <CAFn=p-ZcCjx5eeVcZm0fnc_bzFoffx_GGnCAgQKngGcOXrFLBw@mail.gmail.com>
In-Reply-To: <CAFn=p-ZcCjx5eeVcZm0fnc_bzFoffx_GGnCAgQKngGcOXrFLBw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 11 Feb 2022 13:36:02 -0500
Message-ID: <CAFn=p-ZVqhGF=6SEYtD4F=p0iyyWK+6oNvc_w-7ctkmEmpOP9w@mail.gmail.com>
Subject: Re: [PATCH] scripts/qapi: minor delinting
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 11, 2022 at 12:11 PM John Snow <jsnow@redhat.com> wrote:
>
> On Fri, Feb 11, 2022 at 6:58 AM Markus Armbruster <armbru@redhat.com> wrote:
> >
> > John Snow <jsnow@redhat.com> writes:
> >
> > > On Thu, Feb 10, 2022 at 10:56 AM Markus Armbruster <armbru@redhat.com> wrote:
> > >>
> > >> John Snow <jsnow@redhat.com> writes:
> > >>
> > >> > Just cleaning up some cobwebs.
> > >> >
> > >> > Signed-off-by: John Snow <jsnow@redhat.com>
> > >> > ---
> > >> >  scripts/qapi/commands.py | 2 +-
> > >> >  scripts/qapi/events.py   | 6 +++---
> > >> >  scripts/qapi/types.py    | 6 +++++-
> > >> >  scripts/qapi/visit.py    | 6 +++++-
> > >> >  4 files changed, 14 insertions(+), 6 deletions(-)
> > >> >
> > >> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> > >> > index 869d799ed2..38ca38a7b9 100644
> > >> > --- a/scripts/qapi/commands.py
> > >> > +++ b/scripts/qapi/commands.py
> > >> > @@ -25,8 +25,8 @@
> > >> >      QAPIGenC,
> > >> >      QAPISchemaModularCVisitor,
> > >> >      build_params,
> > >> > -    ifcontext,
> > >> >      gen_special_features,
> > >> > +    ifcontext,
> > >> >  )
> > >> >  from .schema import (
> > >> >      QAPISchema,
> > >> > diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> > >> > index 27b44c49f5..8edf43d8da 100644
> > >> > --- a/scripts/qapi/events.py
> > >> > +++ b/scripts/qapi/events.py
> > >> > @@ -109,15 +109,15 @@ def gen_event_send(name: str,
> > >> >          if not boxed:
> > >> >              ret += gen_param_var(arg_type)
> > >> >
> > >> > -    for f in features:
> > >> > -        if f.is_special():
> > >> > +    for feat in features:
> > >> > +        if feat.is_special():
> > >> >              ret += mcgen('''
> > >> >
> > >> >      if (compat_policy.%(feat)s_output == COMPAT_POLICY_OUTPUT_HIDE) {
> > >> >          return;
> > >> >      }
> > >> >  ''',
> > >> > -                         feat=f.name)
> > >> > +                         feat=feat.name)
> > >> >
> > >> >      ret += mcgen('''
> > >> >
> > >>
> > >> Meh.  Expressive variable names are good when there's something useful
> > >> to express.  But what's the added value in such a simple, obvious loop?
> > >>
> > >> Besides:
> > >>
> > >>     $ git-grep 'for . in' scripts/qapi | wc -l
> > >>     42
> > >>     $ git-grep -E 'for [A-Za-z0-9]{2,} in' scripts/qapi | wc -l
> > >>     31
> > >>
> > >> > diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> > >> > index 3013329c24..477d027001 100644
> > >> > --- a/scripts/qapi/types.py
> > >> > +++ b/scripts/qapi/types.py
> > >> > @@ -16,7 +16,11 @@
> > >> >  from typing import List, Optional
> > >> >
> > >> >  from .common import c_enum_const, c_name, mcgen
> > >> > -from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
> > >> > +from .gen import (
> > >> > +    QAPISchemaModularCVisitor,
> > >> > +    gen_special_features,
> > >> > +    ifcontext,
> > >> > +)
> > >> >  from .schema import (
> > >> >      QAPISchema,
> > >> >      QAPISchemaEnumMember,
> > >> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> > >> > index e13bbe4292..380fa197f5 100644
> > >> > --- a/scripts/qapi/visit.py
> > >> > +++ b/scripts/qapi/visit.py
> > >> > @@ -21,7 +21,11 @@
> > >> >      indent,
> > >> >      mcgen,
> > >> >  )
> > >> > -from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
> > >> > +from .gen import (
> > >> > +    QAPISchemaModularCVisitor,
> > >> > +    gen_special_features,
> > >> > +    ifcontext,
> > >> > +)
> > >> >  from .schema import (
> > >> >      QAPISchema,
> > >> >      QAPISchemaEnumMember,
> > >>
> > >> Everything else, gladly
> > >> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> > >
> > > The problem with whitelisting single-letter variable names is that
> > > it's done on a per-name basis, like allowing "x, y, z" or "i, j, k". I
> > > could whitelist "f", "m", etc but there's no way to whitelist "for f
> > > in features" or "for m im members" ... So admittedly, I just stuck
> > > with the default, even though it's a little annoying. It's what I use
> > > for python/, and I had previously used it for ./scripts/qapi/, so I
> > > was just carrying on.
> >
> > There are only 26 single-letter variable names.  Whitelist them all?
> >
> > > In general: I like the idea of forbidding single-letter variable names
> > > because I prefer things to be more verbose than terse as a habit. In
> > > practice: yeah, it's hard to strictly defend any one change as
> > > obviously superior. I preferred "for feature in features", which you
> > > did not like because the plural wasn't distinct enough (fair!), so I
> > > started using "for feat in features" as a compromise.
> >
> > @feat is a perfectly adequate name.  So is @f as long as the loop is
> > small.  What annoys me here is the churn.
> >
> > Sadly, pylint's invalid-name mixes up two things: PEP-8 conventions like
> > "use CamelCase for class names", and its own style rules like "names
> > should be least three characters long".  The former is easy to decide,
> > and welcome help.  The latter is actually a proxy for "use sensible
> > names to make the code easier to read", because pylint isn't smart
> > enough to judge "easy to read".  Fine, leave it to reviewers then!
> >
> > > If on third thought you don't like any of this, we can change course,
> > > but then maybe we should also undo the other changes we already
> > > checked in. (At this point, I feel like it's maybe less churn to
> > > continue on the path I have been, but... you're the boss here.)
> >
> > I don't think we need to undo.
> >
> > Several of the names in scripts/qapi/pylintrc's good-names don't
> > actually occur in the code.
> >
> > Could I persuade you to replace it with something like
> >
> >     good-names-rgxs=^[_a-z][_a-z0-9]?$
> >
> > and call it a day?
> >
>
> I've been growing that good-names list out from python/, so they
> probably appear over in there somewhere. And uh, eh. In the interest
> of just moving on to something more interesting, sure. (I reserve the
> right to change my mind when I attempt to get the CI system protecting
> the type safety of qapi-gen, when we'll need a single configuration
> for everything. We can fight about it then.)

(Oh, and some of the names are the default allow list, actually.
Setting the variable overwrites the default configuration instead of
amending it, so that's where some of those come from, too. My goal is
generally to stick to as close to the default configuration as I can
bear, in the hopes of preventing the fostering of a coding style that
is too specialized to just qemu.git.)


