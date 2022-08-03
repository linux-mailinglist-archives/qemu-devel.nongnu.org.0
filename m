Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DFF588833
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 09:47:26 +0200 (CEST)
Received: from localhost ([::1]:42130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ96C-0004IN-SI
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 03:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oJ925-0001uX-Bd; Wed, 03 Aug 2022 03:43:10 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oJ921-0002DQ-9c; Wed, 03 Aug 2022 03:43:08 -0400
Received: by mail-lf1-x12a.google.com with SMTP id y11so25188395lfs.6;
 Wed, 03 Aug 2022 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sT7Xhfbbsrk6QAs9gn7b7CgMPdpy0sId55mPcCn2hTQ=;
 b=EL0aLKI2UOHJitw0uuLc0nJm1jiCAvxSfvO6jfKGvfg49BAF+ma7bgJEj1VkZ9UAIr
 FLbym2yLI7vCKflGGULE4ycbtPCzcatkCfIzLD1DM89oih4R6Gk4yxC7Aqa0Eg44GaZs
 Jz9vHWanJRm8IFFGKF0V86d0gunc6TKekUOn7e/Z+XYBSRWyG7vsDEyj9L3JjrX53yBI
 +gRR1cnwzw/gdtGqZc8y5+W5L0qVLLPwiMtHkSg+6D+ua4TtvpwKQ3TEqAUPCH2J7IzC
 gZug71TEeX//5aw3JxnfFEmyuC+nYpGvJsTR0DJc1oJcrHEU9fCTwJLqKFYyP0aB5AHr
 Q4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sT7Xhfbbsrk6QAs9gn7b7CgMPdpy0sId55mPcCn2hTQ=;
 b=Ica5AtVYxXfYXL41nl9WIwy2QXlNa5kiTbuVXYWf5VeHdbJ/4TkJNVJiF4Ef4PfRoF
 Z5VhpdPdZSedxTagBE8v9HHRQYCaZMHpphXwd/HgrAKMkmMgs9pB2sLPWDM8EGvK9YWZ
 krPO906MJR8Qrq6G9zp/ugnhh4KmnU9l5t8EoaYdBiClWOyPdYehFeaR1s8CyLzmaUEp
 5qdozXM+jwgq5qYeSN2jBbRgaAehAYosEQaolY32P3daN/1hwK8KLtgSV3mD601MCoex
 omKiNCg8Ux+r6NsS3GhvrhRQe5DxVsatsiFJl6LKGE13Wz5HJLy/QcMo8nqam445eLO9
 zBfg==
X-Gm-Message-State: ACgBeo0ITUH4NOPn3HwxizGe/dSmGGfhXF2pL1eVAkjwtZzDxM6dowJ5
 0XsPUzDwCqHBj+22ntN5c8fddwgVUVhT8OqYy60=
X-Google-Smtp-Source: AA6agR4F3ThFSOwXKp50tk4xvNKRXFqmcJ4Nxc02iKhZHPH9H2d7j6TgQa+gWQuWzkFsHPfzTZloF6YAQoikKZKTAL8=
X-Received: by 2002:a05:6512:10c4:b0:48a:f17d:65cc with SMTP id
 k4-20020a05651210c400b0048af17d65ccmr5587579lfg.94.1659512579676; Wed, 03 Aug
 2022 00:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-9-marcandre.lureau@redhat.com>
 <87fsjyqf2w.fsf@pond.sub.org>
 <CAMxuvaz5A1oh4kPVWVwCBvfQjX23EGvfrSukj3Zo+OQGHhmNVQ@mail.gmail.com>
 <87o7x2srm8.fsf@pond.sub.org>
In-Reply-To: <87o7x2srm8.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 3 Aug 2022 11:42:47 +0400
Message-ID: <CAJ+F1CLK_zLqcGiWgy_KAMoxAwHPDi8OetXtEk6CoYFH-ke3kw@mail.gmail.com>
Subject: Re: [PATCH 8/9] scripts/qapi-gen: add -i option
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, 
 Kyle Evans <kevans@freebsd.org>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block <qemu-block@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000cfe02c05e55161de"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
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

--000000000000cfe02c05e55161de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 2, 2022 at 5:28 PM Markus Armbruster <armbru@redhat.com> wrote:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>
> > Hi
> >
> >
> > On Tue, Jun 21, 2022 at 6:14 PM Markus Armbruster <armbru@redhat.com>
> wrote:
> >>
> >> marcandre.lureau@redhat.com writes:
> >>
> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > Replace hard-coded "qemu/osdep.h" include with a qapi-gen option to
> >> > specify the headers to include. This will allow to substitute QEMU
> >> > osdep.h with glib.h for example, for projects with different
> >> > global headers.
> >> >
> >> > For historical reasons, we can keep the default as "qemu/osdep.h".
> >> >
> >> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> I wish we'd all agree on "config.h" (conventional with autoconf).  But
> >> we don't.
> >>
> >> Precedence for tweaking generated code with command line options: -p.
> >>
> >> I suspect that we'll always specify the same -p and -i for a given
> >> schema.  To me, that suggests they should both go into the schema
> >> instead.  Observation, not demand.
> >>
> >> > ---
> >> >  scripts/qapi/commands.py   | 15 ++++++++++-----
> >> >  scripts/qapi/events.py     | 17 +++++++++++------
> >> >  scripts/qapi/gen.py        | 17 +++++++++++++++++
> >> >  scripts/qapi/introspect.py | 11 +++++++----
> >> >  scripts/qapi/main.py       | 17 +++++++++++------
> >> >  scripts/qapi/types.py      | 17 +++++++++++------
> >> >  scripts/qapi/visit.py      | 17 +++++++++++------
> >> >  7 files changed, 78 insertions(+), 33 deletions(-)
> >> >
> >> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> >> > index 38ca38a7b9dd..781491b6390d 100644
> >> > --- a/scripts/qapi/commands.py
> >> > +++ b/scripts/qapi/commands.py
> >> > @@ -294,9 +294,9 @@ def gen_register_command(name: str,
> >> >
> >> >
> >> >  class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
> >> > -    def __init__(self, prefix: str, gen_tracing: bool):
> >> > +    def __init__(self, prefix: str, include: List[str], gen_tracing=
:
> bool):
> >>
> >> Ignorant question: why ist this List[str], not str?  Do multiple optio=
ns
> >> accumulate into a list?
> >>
> >> Alright, I'm back from further down: looks like they do.
> >>
> >> >          super().__init__(
> >> > -            prefix, 'qapi-commands',
> >> > +            prefix, include, 'qapi-commands',
> >> >              ' * Schema-defined QAPI/QMP commands', None, __doc__,
> >> >              gen_tracing=3Dgen_tracing)
> >> >          self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]=
]
> =3D {}
> >> > @@ -308,7 +308,8 @@ def _begin_user_module(self, name: str) -> None:
> >> >          types =3D self._module_basename('qapi-types', name)
> >> >          visit =3D self._module_basename('qapi-visit', name)
> >> >          self._genc.add(mcgen('''
> >> > -#include "qemu/osdep.h"
> >> > +%(include)s
> >> > +
> >> >  #include "qapi/compat-policy.h"
> >> >  #include "qapi/visitor.h"
> >> >  #include "qapi/qmp/qdict.h"
> >> > @@ -318,6 +319,7 @@ def _begin_user_module(self, name: str) -> None:
> >> >  #include "%(commands)s.h"
> >> >
> >> >  ''',
> >> > +                             include=3Dself.genc_include(),
> >> >                               commands=3Dcommands, visit=3Dvisit))
> >> >
> >> >          if self._gen_tracing and commands !=3D 'qapi-commands':
> >> > @@ -344,7 +346,8 @@ def visit_begin(self, schema: QAPISchema) -> Non=
e:
> >> >  ''',
> >> >                               c_prefix=3Dc_name(self._prefix,
> protect=3DFalse)))
> >> >          self._genc.add(mcgen('''
> >> > -#include "qemu/osdep.h"
> >> > +%(include)s
> >> > +
> >> >  #include "%(prefix)sqapi-commands.h"
> >> >  #include "%(prefix)sqapi-init-commands.h"
> >> >
> >> > @@ -353,6 +356,7 @@ def visit_begin(self, schema: QAPISchema) -> Non=
e:
> >> >      QTAILQ_INIT(cmds);
> >> >
> >> >  ''',
> >> > +                             include=3Dself.genc_include(),
> >> >                               prefix=3Dself._prefix,
> >> >                               c_prefix=3Dc_name(self._prefix,
> protect=3DFalse)))
> >> >
> >> > @@ -404,7 +408,8 @@ def visit_command(self,
> >> >  def gen_commands(schema: QAPISchema,
> >> >                   output_dir: str,
> >> >                   prefix: str,
> >> > +                 include: List[str],
> >> >                   gen_tracing: bool) -> None:
> >> > -    vis =3D QAPISchemaGenCommandVisitor(prefix, gen_tracing)
> >> > +    vis =3D QAPISchemaGenCommandVisitor(prefix, include, gen_tracin=
g)
> >> >      schema.visit(vis)
> >> >      vis.write(output_dir)
> >> > diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> >> > index 27b44c49f5e9..6e677d11d2e0 100644
> >> > --- a/scripts/qapi/events.py
> >> > +++ b/scripts/qapi/events.py
> >> > @@ -175,9 +175,9 @@ def gen_event_send(name: str,
> >> >
> >> >  class QAPISchemaGenEventVisitor(QAPISchemaModularCVisitor):
> >> >
> >> > -    def __init__(self, prefix: str):
> >> > +    def __init__(self, prefix: str, include: List[str]):
> >> >          super().__init__(
> >> > -            prefix, 'qapi-events',
> >> > +            prefix, include, 'qapi-events',
> >> >              ' * Schema-defined QAPI/QMP events', None, __doc__)
> >> >          self._event_enum_name =3D c_name(prefix + 'QAPIEvent',
> protect=3DFalse)
> >> >          self._event_enum_members: List[QAPISchemaEnumMember] =3D []
> >> > @@ -188,7 +188,8 @@ def _begin_user_module(self, name: str) -> None:
> >> >          types =3D self._module_basename('qapi-types', name)
> >> >          visit =3D self._module_basename('qapi-visit', name)
> >> >          self._genc.add(mcgen('''
> >> > -#include "qemu/osdep.h"
> >> > +%(include)s
> >> > +
> >> >  #include "%(prefix)sqapi-emit-events.h"
> >> >  #include "%(events)s.h"
> >> >  #include "%(visit)s.h"
> >> > @@ -198,6 +199,7 @@ def _begin_user_module(self, name: str) -> None:
> >> >  #include "qapi/qmp-event.h"
> >> >
> >> >  ''',
> >> > +                             include=3Dself.genc_include(),
> >> >                               events=3Devents, visit=3Dvisit,
> >> >                               prefix=3Dself._prefix))
> >> >          self._genh.add(mcgen('''
> >> > @@ -209,9 +211,11 @@ def _begin_user_module(self, name: str) -> None=
:
> >> >      def visit_end(self) -> None:
> >> >          self._add_module('./emit', ' * QAPI Events emission')
> >> >          self._genc.preamble_add(mcgen('''
> >> > -#include "qemu/osdep.h"
> >> > +%(include)s
> >> > +
> >> >  #include "%(prefix)sqapi-emit-events.h"
> >> >  ''',
> >> > +                                      include=3Dself.genc_include()=
,
> >> >                                        prefix=3Dself._prefix))
> >> >          self._genh.preamble_add(mcgen('''
> >> >  #include "qapi/util.h"
> >> > @@ -246,7 +250,8 @@ def visit_event(self,
> >> >
> >> >  def gen_events(schema: QAPISchema,
> >> >                 output_dir: str,
> >> > -               prefix: str) -> None:
> >> > -    vis =3D QAPISchemaGenEventVisitor(prefix)
> >> > +               prefix: str,
> >> > +               include: List[str]) -> None:
> >> > +    vis =3D QAPISchemaGenEventVisitor(prefix, include)
> >> >      schema.visit(vis)
> >> >      vis.write(output_dir)
> >> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> >> > index 113b49134de4..54a70a5ff516 100644
> >> > --- a/scripts/qapi/gen.py
> >> > +++ b/scripts/qapi/gen.py
> >> > @@ -17,6 +17,7 @@
> >> >  from typing import (
> >> >      Dict,
> >> >      Iterator,
> >> > +    List,
> >> >      Optional,
> >> >      Sequence,
> >> >      Tuple,
> >> > @@ -45,6 +46,12 @@ def gen_special_features(features:
> Sequence[QAPISchemaFeature]) -> str:
> >> >      return ' | '.join(special_features) or '0'
> >> >
> >> >
> >> > +def genc_include(include: List[str]) -> str:
> >> > +    return '\n'.join(['#include ' +
> >> > +                      (f'"{inc}"' if inc[0] not in ('<', '"') else
> inc)
> >> > +                      for inc in include])
> >>
> >> This maps a list of file names / #include arguments to C code includin=
g
> >> them, mapping file names to #include arguments by enclosing them in ""=
.
> >>
> >> Option arguments of the form <foo.h> and "foo.h" need to be quoted in
> >> the shell.  The latter can be done without quoting as foo.h.
> >>
> >> Somewhat funky wedding of generality with convenience.
> >>
> >> > +
> >> > +
> >> >  class QAPIGen:
> >> >      def __init__(self, fname: str):
> >> >          self.fname =3D fname
> >> > @@ -228,16 +235,21 @@ def ifcontext(ifcond: QAPISchemaIfCond, *args:
> QAPIGenCCode) -> Iterator[None]:
> >> >  class QAPISchemaMonolithicCVisitor(QAPISchemaVisitor):
> >> >      def __init__(self,
> >> >                   prefix: str,
> >> > +                 include: List[str],
> >> >                   what: str,
> >> >                   blurb: str,
> >> >                   pydoc: str):
> >> >          self._prefix =3D prefix
> >> > +        self._include =3D include
> >> >          self._what =3D what
> >> >          self._genc =3D QAPIGenC(self._prefix + self._what + '.c',
> >> >                                blurb, pydoc)
> >> >          self._genh =3D QAPIGenH(self._prefix + self._what + '.h',
> >> >                                blurb, pydoc)
> >> >
> >> > +    def genc_include(self) -> str:
> >> > +        return genc_include(self._include)
> >> > +
> >> >      def write(self, output_dir: str) -> None:
> >> >          self._genc.write(output_dir)
> >> >          self._genh.write(output_dir)
> >> > @@ -246,12 +258,14 @@ def write(self, output_dir: str) -> None:
> >> >  class QAPISchemaModularCVisitor(QAPISchemaVisitor):
> >> >      def __init__(self,
> >> >                   prefix: str,
> >> > +                 include: List[str],
> >> >                   what: str,
> >> >                   user_blurb: str,
> >> >                   builtin_blurb: Optional[str],
> >> >                   pydoc: str,
> >> >                   gen_tracing: bool =3D False):
> >> >          self._prefix =3D prefix
> >> > +        self._include =3D include
> >> >          self._what =3D what
> >> >          self._user_blurb =3D user_blurb
> >> >          self._builtin_blurb =3D builtin_blurb
> >> > @@ -262,6 +276,9 @@ def __init__(self,
> >> >          self._main_module: Optional[str] =3D None
> >> >          self._gen_tracing =3D gen_tracing
> >> >
> >> > +    def genc_include(self) -> str:
> >> > +        return genc_include(self._include)
> >> > +
> >> >      @property
> >> >      def _genc(self) -> QAPIGenC:
> >> >          assert self._current_module is not None
> >> > diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> >> > index 67c7d89aae00..d965d1769447 100644
> >> > --- a/scripts/qapi/introspect.py
> >> > +++ b/scripts/qapi/introspect.py
> >> > @@ -170,9 +170,9 @@ def to_c_string(string: str) -> str:
> >> >
> >> >  class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithicCVisitor):
> >> >
> >> > -    def __init__(self, prefix: str, unmask: bool):
> >> > +    def __init__(self, prefix: str, include: List[str], unmask:
> bool):
> >> >          super().__init__(
> >> > -            prefix, 'qapi-introspect',
> >> > +            prefix, include, 'qapi-introspect',
> >> >              ' * QAPI/QMP schema introspection', __doc__)
> >> >          self._unmask =3D unmask
> >> >          self._schema: Optional[QAPISchema] =3D None
> >> > @@ -180,10 +180,12 @@ def __init__(self, prefix: str, unmask: bool):
> >> >          self._used_types: List[QAPISchemaType] =3D []
> >> >          self._name_map: Dict[str, str] =3D {}
> >> >          self._genc.add(mcgen('''
> >> > -#include "qemu/osdep.h"
> >> > +%(include)s
> >> > +
> >> >  #include "%(prefix)sqapi-introspect.h"
> >> >
> >> >  ''',
> >> > +                             include=3Dself.genc_include(),
> >> >                               prefix=3Dprefix))
> >> >
> >> >      def visit_begin(self, schema: QAPISchema) -> None:
> >> > @@ -384,7 +386,8 @@ def visit_event(self, name: str, info:
> Optional[QAPISourceInfo],
> >> >
> >> >
> >> >  def gen_introspect(schema: QAPISchema, output_dir: str, prefix: str=
,
> >> > +                   include: List[str],
> >> >                     opt_unmask: bool) -> None:
> >> > -    vis =3D QAPISchemaGenIntrospectVisitor(prefix, opt_unmask)
> >> > +    vis =3D QAPISchemaGenIntrospectVisitor(prefix, include, opt_unm=
ask)
> >> >      schema.visit(vis)
> >> >      vis.write(output_dir)
> >> > diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
> >> > index fc216a53d32a..eba98cb9ace2 100644
> >> > --- a/scripts/qapi/main.py
> >> > +++ b/scripts/qapi/main.py
> >> > @@ -9,7 +9,7 @@
> >> >
> >> >  import argparse
> >> >  import sys
> >> > -from typing import Optional
> >> > +from typing import List, Optional
> >> >
> >> >  from .commands import gen_commands
> >> >  from .common import must_match
> >> > @@ -31,6 +31,7 @@ def invalid_prefix_char(prefix: str) ->
> Optional[str]:
> >> >  def generate(schema_file: str,
> >> >               output_dir: str,
> >> >               prefix: str,
> >> > +             include: List[str],
> >> >               unmask: bool =3D False,
> >> >               builtins: bool =3D False,
> >> >               gen_tracing: bool =3D False) -> None:
> >> > @@ -48,11 +49,11 @@ def generate(schema_file: str,
> >> >      assert invalid_prefix_char(prefix) is None
> >> >
> >> >      schema =3D QAPISchema(schema_file)
> >> > -    gen_types(schema, output_dir, prefix, builtins)
> >> > -    gen_visit(schema, output_dir, prefix, builtins)
> >> > -    gen_commands(schema, output_dir, prefix, gen_tracing)
> >> > -    gen_events(schema, output_dir, prefix)
> >> > -    gen_introspect(schema, output_dir, prefix, unmask)
> >> > +    gen_types(schema, output_dir, prefix, include, builtins)
> >> > +    gen_visit(schema, output_dir, prefix, include, builtins)
> >> > +    gen_commands(schema, output_dir, prefix, include, gen_tracing)
> >> > +    gen_events(schema, output_dir, prefix, include)
> >> > +    gen_introspect(schema, output_dir, prefix, include, unmask)
> >> >
> >> >
> >> >  def main() -> int:
> >> > @@ -75,6 +76,9 @@ def main() -> int:
> >> >      parser.add_argument('-u', '--unmask-non-abi-names',
> action=3D'store_true',
> >> >                          dest=3D'unmask',
> >> >                          help=3D"expose non-ABI names in introspecti=
on")
> >> > +    parser.add_argument('-i', '--include', nargs=3D'*',
> >> > +                        default=3D['qemu/osdep.h'],
> >> > +                        help=3D"top-level include headers")
> >>
> >> The option name --include doesn't really tell me what it is about.  Is
> >> it an include path for schema files?  Or is it about including somethi=
ng
> >> in generated C?  Where in generated C?
> >>
> >> The help text provides clues: "headers" suggests .h, and "top-level"
> >> suggests somewhere top-like.
> >>
> >> In fact, it's about inserting C code at the beginning of generated .c
> >> files.  For the uses we have in mind, the C code is a single #include.
> >> The patch implements any number of #includes.
> >>
> >> More general and arguably less funky: a way to insert arbitrary C code=
.
> >>
> >> Except arbitrary C code on the command line is unwieldy.  Better kept =
it
> >> in the schema.  Pragma?
> >>
> >> Thoughts?
> >
> > Pragmas are global currently. This doesn't scale well, as we would
> > like to split the schemas. I have a following patch that will allow me
> > to split/merge the pragmas. This is not optimal either, I would rather
> > remove/replace them (using annotations).
>
> Now I'm curious.  Can you sketch what you have in mind?
>

I simply made the pragma lists additive:

https://gitlab.com/marcandre.lureau/qemu/-/commit/1861964a317c2e74bea2d1f86=
944625e00df777f


I didn't think much about replacing pragmas with extra annotations. But it
could be for ex moving some pragmas to the declarations.

From:

{ 'pragma': {
    # Command names containing '_'
    'command-name-exceptions': [
        'add_client',
...

{ 'command': 'add_client',
  'data': { ... } }

To:

{ 'command': {
    'name': 'add_client',
    # Command name containing '_'
    'name-exception': true },
  'data': { ... } }

Or eventually to the comment:

# @add_client: (name-exception):



> > Imho, global tweaking of compilation is better done from the command
> line.
>
> The command line is fine for straightforward configuration.  It's not
> suitable for injecting code.
>
> Fine: cc -c, which tells the compiler to work in a certain way.
>
> Still fine: cc -DFOO, which effectively prepends '#define FOO 1" to the
> .c.
>
> No longer fine: a hypothetical option to prepend arbitrary C code.  Even
> if it was occasionally useful.
>
> Now watch this:
>
>     $ python qapi-gen.py -o t qapi/qapi-schema.json -i '"abc.h"
>     #define FOO'
>
>     $ head -n 16 t/qapi-types.c
>     /* AUTOMATICALLY GENERATED, DO NOT MODIFY */
>
>     /*
>      * Schema-defined QAPI types
>      *
>      * Copyright IBM, Corp. 2011
>      * Copyright (c) 2013-2018 Red Hat Inc.
>      *
>      * This work is licensed under the terms of the GNU LGPL, version 2.1
> or later.
>      * See the COPYING.LIB file in the top-level directory.
>      */
>
>     #include "abc.h"
>     #define FOO
>
>     #include "qapi/dealloc-visitor.h"
>
> Sure, nobody of sane mind would ever do this.  The fact remains that
> we're doing something on the command line that should not be done there.
>
> Your -i enables code injection because it takes either a file name or a
> #include argument.  Can we dumb it down to just file name?
>
>
I think that can work too. Users can include a header that itself includes
extra headers in different ways, if needed.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cfe02c05e55161de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 2, 2022 at 5:28 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Mar=
c-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" targ=
et=3D"_blank">marcandre.lureau@redhat.com</a>&gt; writes:<br>
<br>
&gt; Hi<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Jun 21, 2022 at 6:14 PM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">m=
arcandre.lureau@redhat.com</a> writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Replace hard-coded &quot;qemu/osdep.h&quot; include with a qa=
pi-gen option to<br>
&gt;&gt; &gt; specify the headers to include. This will allow to substitute=
 QEMU<br>
&gt;&gt; &gt; osdep.h with glib.h for example, for projects with different<=
br>
&gt;&gt; &gt; global headers.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; For historical reasons, we can keep the default as &quot;qemu=
/osdep.h&quot;.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</=
a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; I wish we&#39;d all agree on &quot;config.h&quot; (conventional wi=
th autoconf).=C2=A0 But<br>
&gt;&gt; we don&#39;t.<br>
&gt;&gt;<br>
&gt;&gt; Precedence for tweaking generated code with command line options: =
-p.<br>
&gt;&gt;<br>
&gt;&gt; I suspect that we&#39;ll always specify the same -p and -i for a g=
iven<br>
&gt;&gt; schema.=C2=A0 To me, that suggests they should both go into the sc=
hema<br>
&gt;&gt; instead.=C2=A0 Observation, not demand.<br>
&gt;&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 scripts/qapi/commands.py=C2=A0 =C2=A0| 15 ++++++++++---=
--<br>
&gt;&gt; &gt;=C2=A0 scripts/qapi/events.py=C2=A0 =C2=A0 =C2=A0| 17 ++++++++=
+++------<br>
&gt;&gt; &gt;=C2=A0 scripts/qapi/gen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 +++=
++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 scripts/qapi/introspect.py | 11 +++++++----<br>
&gt;&gt; &gt;=C2=A0 scripts/qapi/main.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++=
++++++++------<br>
&gt;&gt; &gt;=C2=A0 scripts/qapi/types.py=C2=A0 =C2=A0 =C2=A0 | 17 ++++++++=
+++------<br>
&gt;&gt; &gt;=C2=A0 scripts/qapi/visit.py=C2=A0 =C2=A0 =C2=A0 | 17 ++++++++=
+++------<br>
&gt;&gt; &gt;=C2=A0 7 files changed, 78 insertions(+), 33 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands=
.py<br>
&gt;&gt; &gt; index 38ca38a7b9dd..781491b6390d 100644<br>
&gt;&gt; &gt; --- a/scripts/qapi/commands.py<br>
&gt;&gt; &gt; +++ b/scripts/qapi/commands.py<br>
&gt;&gt; &gt; @@ -294,9 +294,9 @@ def gen_register_command(name: str,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 class QAPISchemaGenCommandVisitor(QAPISchemaModularCVis=
itor):<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 def __init__(self, prefix: str, gen_tracing: b=
ool):<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 def __init__(self, prefix: str, include: List[=
str], gen_tracing: bool):<br>
&gt;&gt;<br>
&gt;&gt; Ignorant question: why ist this List[str], not str?=C2=A0 Do multi=
ple options<br>
&gt;&gt; accumulate into a list?<br>
&gt;&gt;<br>
&gt;&gt; Alright, I&#39;m back from further down: looks like they do.<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix, &#39;qapi-=
commands&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix, include, &=
#39;qapi-commands&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; * Schem=
a-defined QAPI/QMP commands&#39;, None, __doc__,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_tracing=
=3Dgen_tracing)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._visited_ret_types: Di=
ct[QAPIGenC, Set[QAPISchemaType]] =3D {}<br>
&gt;&gt; &gt; @@ -308,7 +308,8 @@ def _begin_user_module(self, name: str) -=
&gt; None:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 types =3D self._module_base=
name(&#39;qapi-types&#39;, name)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 visit =3D self._module_base=
name(&#39;qapi-visit&#39;, name)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genc.add(mcgen(&#39;&=
#39;&#39;<br>
&gt;&gt; &gt; -#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +%(include)s<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 #include &quot;qapi/compat-policy.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;qapi/visitor.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;qapi/qmp/qdict.h&quot;<br>
&gt;&gt; &gt; @@ -318,6 +319,7 @@ def _begin_user_module(self, name: str) -=
&gt; None:<br>
&gt;&gt; &gt;=C2=A0 #include &quot;%(commands)s.h&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include=3Dself.genc_include(),=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0commands=3Dcommands, visit=
=3Dvisit))<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._gen_tracing and co=
mmands !=3D &#39;qapi-commands&#39;:<br>
&gt;&gt; &gt; @@ -344,7 +346,8 @@ def visit_begin(self, schema: QAPISchema)=
 -&gt; None:<br>
&gt;&gt; &gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_prefix=3Dc_name(self._pr=
efix, protect=3DFalse)))<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genc.add(mcgen(&#39;&=
#39;&#39;<br>
&gt;&gt; &gt; -#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +%(include)s<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 #include &quot;%(prefix)sqapi-commands.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;%(prefix)sqapi-init-commands.h&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -353,6 +356,7 @@ def visit_begin(self, schema: QAPISchema)=
 -&gt; None:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 QTAILQ_INIT(cmds);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include=3Dself.genc_include(),=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix=3Dself._prefix,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_prefix=3Dc_name(self._pr=
efix, protect=3DFalse)))<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -404,7 +408,8 @@ def visit_command(self,<br>
&gt;&gt; &gt;=C2=A0 def gen_commands(schema: QAPISchema,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0output_dir: str,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0prefix: str,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0include: List[str],<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gen_tracing: bool) -&gt; None:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 vis =3D QAPISchemaGenCommandVisitor(prefix, ge=
n_tracing)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vis =3D QAPISchemaGenCommandVisitor(prefix, in=
clude, gen_tracing)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 schema.visit(vis)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 vis.write(output_dir)<br>
&gt;&gt; &gt; diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py<=
br>
&gt;&gt; &gt; index 27b44c49f5e9..6e677d11d2e0 100644<br>
&gt;&gt; &gt; --- a/scripts/qapi/events.py<br>
&gt;&gt; &gt; +++ b/scripts/qapi/events.py<br>
&gt;&gt; &gt; @@ -175,9 +175,9 @@ def gen_event_send(name: str,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 class QAPISchemaGenEventVisitor(QAPISchemaModularCVisit=
or):<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 def __init__(self, prefix: str):<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 def __init__(self, prefix: str, include: List[=
str]):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix, &#39;qapi-=
events&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix, include, &=
#39;qapi-events&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; * Schem=
a-defined QAPI/QMP events&#39;, None, __doc__)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._event_enum_name =3D c=
_name(prefix + &#39;QAPIEvent&#39;, protect=3DFalse)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._event_enum_members: L=
ist[QAPISchemaEnumMember] =3D []<br>
&gt;&gt; &gt; @@ -188,7 +188,8 @@ def _begin_user_module(self, name: str) -=
&gt; None:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 types =3D self._module_base=
name(&#39;qapi-types&#39;, name)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 visit =3D self._module_base=
name(&#39;qapi-visit&#39;, name)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genc.add(mcgen(&#39;&=
#39;&#39;<br>
&gt;&gt; &gt; -#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +%(include)s<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 #include &quot;%(prefix)sqapi-emit-events.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;%(events)s.h&quot;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;%(visit)s.h&quot;<br>
&gt;&gt; &gt; @@ -198,6 +199,7 @@ def _begin_user_module(self, name: str) -=
&gt; None:<br>
&gt;&gt; &gt;=C2=A0 #include &quot;qapi/qmp-event.h&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include=3Dself.genc_include(),=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0events=3Devents, visit=3Dv=
isit,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix=3Dself._prefix))<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genh.add(mcgen(&#39;&=
#39;&#39;<br>
&gt;&gt; &gt; @@ -209,9 +211,11 @@ def _begin_user_module(self, name: str) =
-&gt; None:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def visit_end(self) -&gt; None:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._add_module(&#39;./emi=
t&#39;, &#39; * QAPI Events emission&#39;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genc.preamble_add(mcg=
en(&#39;&#39;&#39;<br>
&gt;&gt; &gt; -#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +%(include)s<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 #include &quot;%(prefix)sqapi-emit-events.h&quot;<br>
&gt;&gt; &gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nclude=3Dself.genc_include(),<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 prefix=3Dself._prefix))<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genh.preamble_add(mcg=
en(&#39;&#39;&#39;<br>
&gt;&gt; &gt;=C2=A0 #include &quot;qapi/util.h&quot;<br>
&gt;&gt; &gt; @@ -246,7 +250,8 @@ def visit_event(self,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 def gen_events(schema: QAPISchema,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
output_dir: str,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefi=
x: str) -&gt; None:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 vis =3D QAPISchemaGenEventVisitor(prefix)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefi=
x: str,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inclu=
de: List[str]) -&gt; None:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vis =3D QAPISchemaGenEventVisitor(prefix, incl=
ude)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 schema.visit(vis)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 vis.write(output_dir)<br>
&gt;&gt; &gt; diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py<br>
&gt;&gt; &gt; index 113b49134de4..54a70a5ff516 100644<br>
&gt;&gt; &gt; --- a/scripts/qapi/gen.py<br>
&gt;&gt; &gt; +++ b/scripts/qapi/gen.py<br>
&gt;&gt; &gt; @@ -17,6 +17,7 @@<br>
&gt;&gt; &gt;=C2=A0 from typing import (<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Iterator,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 List,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Sequence,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Tuple,<br>
&gt;&gt; &gt; @@ -45,6 +46,12 @@ def gen_special_features(features: Sequenc=
e[QAPISchemaFeature]) -&gt; str:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return &#39; | &#39;.join(special_feature=
s) or &#39;0&#39;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +def genc_include(include: List[str]) -&gt; str:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return &#39;\n&#39;.join([&#39;#include &#39; =
+<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (f&#39;&quot;{inc}&quot;&#39; if inc[0] not in (&#39;&lt;=
&#39;, &#39;&quot;&#39;) else inc)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 for inc in include])<br>
&gt;&gt;<br>
&gt;&gt; This maps a list of file names / #include arguments to C code incl=
uding<br>
&gt;&gt; them, mapping file names to #include arguments by enclosing them i=
n &quot;&quot;.<br>
&gt;&gt;<br>
&gt;&gt; Option arguments of the form &lt;foo.h&gt; and &quot;foo.h&quot; n=
eed to be quoted in<br>
&gt;&gt; the shell.=C2=A0 The latter can be done without quoting as foo.h.<=
br>
&gt;&gt;<br>
&gt;&gt; Somewhat funky wedding of generality with convenience.<br>
&gt;&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 class QAPIGen:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self, fname: str):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fname =3D fname<br>
&gt;&gt; &gt; @@ -228,16 +235,21 @@ def ifcontext(ifcond: QAPISchemaIfCond,=
 *args: QAPIGenCCode) -&gt; Iterator[None]:<br>
&gt;&gt; &gt;=C2=A0 class QAPISchemaMonolithicCVisitor(QAPISchemaVisitor):<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0prefix: str,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0include: List[str],<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0what: str,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0blurb: str,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pydoc: str):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._prefix =3D prefix<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._include =3D include<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._what =3D what<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genc =3D QAPIGenC(sel=
f._prefix + self._what + &#39;.c&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blurb, pydoc)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genh =3D QAPIGenH(sel=
f._prefix + self._what + &#39;.h&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blurb, pydoc)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 def genc_include(self) -&gt; str:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return genc_include(self._includ=
e)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def write(self, output_dir: str) -&gt; No=
ne:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genc.write(output_dir=
)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genh.write(output_dir=
)<br>
&gt;&gt; &gt; @@ -246,12 +258,14 @@ def write(self, output_dir: str) -&gt; =
None:<br>
&gt;&gt; &gt;=C2=A0 class QAPISchemaModularCVisitor(QAPISchemaVisitor):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def __init__(self,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0prefix: str,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0include: List[str],<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0what: str,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0user_blurb: str,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0builtin_blurb: Optional[str],<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pydoc: str,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gen_tracing: bool =3D False):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._prefix =3D prefix<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._include =3D include<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._what =3D what<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._user_blurb =3D user_b=
lurb<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._builtin_blurb =3D bui=
ltin_blurb<br>
&gt;&gt; &gt; @@ -262,6 +276,9 @@ def __init__(self,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._main_module: Optional=
[str] =3D None<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._gen_tracing =3D gen_t=
racing<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 def genc_include(self) -&gt; str:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return genc_include(self._includ=
e)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 @property<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def _genc(self) -&gt; QAPIGenC:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self._current_module=
 is not None<br>
&gt;&gt; &gt; diff --git a/scripts/qapi/introspect.py b/scripts/qapi/intros=
pect.py<br>
&gt;&gt; &gt; index 67c7d89aae00..d965d1769447 100644<br>
&gt;&gt; &gt; --- a/scripts/qapi/introspect.py<br>
&gt;&gt; &gt; +++ b/scripts/qapi/introspect.py<br>
&gt;&gt; &gt; @@ -170,9 +170,9 @@ def to_c_string(string: str) -&gt; str:<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolith=
icCVisitor):<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 def __init__(self, prefix: str, unmask: bool):=
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 def __init__(self, prefix: str, include: List[=
str], unmask: bool):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix, &#39;qapi-=
introspect&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix, include, &=
#39;qapi-introspect&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; * QAPI/=
QMP schema introspection&#39;, __doc__)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._unmask =3D unmask<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._schema: Optional[QAPI=
Schema] =3D None<br>
&gt;&gt; &gt; @@ -180,10 +180,12 @@ def __init__(self, prefix: str, unmask:=
 bool):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._used_types: List[QAPI=
SchemaType] =3D []<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._name_map: Dict[str, s=
tr] =3D {}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._genc.add(mcgen(&#39;&=
#39;&#39;<br>
&gt;&gt; &gt; -#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +%(include)s<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 #include &quot;%(prefix)sqapi-introspect.h&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include=3Dself.genc_include(),=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix=3Dprefix))<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def visit_begin(self, schema: QAPISchema)=
 -&gt; None:<br>
&gt;&gt; &gt; @@ -384,7 +386,8 @@ def visit_event(self, name: str, info: Op=
tional[QAPISourceInfo],<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 def gen_introspect(schema: QAPISchema, output_dir: str,=
 prefix: str,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0include: List[str],<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0opt_unmask: bool) -&gt; None:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 vis =3D QAPISchemaGenIntrospectVisitor(prefix,=
 opt_unmask)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vis =3D QAPISchemaGenIntrospectVisitor(prefix,=
 include, opt_unmask)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 schema.visit(vis)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 vis.write(output_dir)<br>
&gt;&gt; &gt; diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py<br>
&gt;&gt; &gt; index fc216a53d32a..eba98cb9ace2 100644<br>
&gt;&gt; &gt; --- a/scripts/qapi/main.py<br>
&gt;&gt; &gt; +++ b/scripts/qapi/main.py<br>
&gt;&gt; &gt; @@ -9,7 +9,7 @@<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 import argparse<br>
&gt;&gt; &gt;=C2=A0 import sys<br>
&gt;&gt; &gt; -from typing import Optional<br>
&gt;&gt; &gt; +from typing import List, Optional<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 from .commands import gen_commands<br>
&gt;&gt; &gt;=C2=A0 from .common import must_match<br>
&gt;&gt; &gt; @@ -31,6 +31,7 @@ def invalid_prefix_char(prefix: str) -&gt; =
Optional[str]:<br>
&gt;&gt; &gt;=C2=A0 def generate(schema_file: str,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output_=
dir: str,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix:=
 str,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include: Lis=
t[str],<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unmask:=
 bool =3D False,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0builtin=
s: bool =3D False,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_tra=
cing: bool =3D False) -&gt; None:<br>
&gt;&gt; &gt; @@ -48,11 +49,11 @@ def generate(schema_file: str,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 assert invalid_prefix_char(prefix) is Non=
e<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 schema =3D QAPISchema(schema_file)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 gen_types(schema, output_dir, prefix, builtins=
)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 gen_visit(schema, output_dir, prefix, builtins=
)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 gen_commands(schema, output_dir, prefix, gen_t=
racing)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 gen_events(schema, output_dir, prefix)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 gen_introspect(schema, output_dir, prefix, unm=
ask)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 gen_types(schema, output_dir, prefix, include,=
 builtins)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 gen_visit(schema, output_dir, prefix, include,=
 builtins)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 gen_commands(schema, output_dir, prefix, inclu=
de, gen_tracing)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 gen_events(schema, output_dir, prefix, include=
)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 gen_introspect(schema, output_dir, prefix, inc=
lude, unmask)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 def main() -&gt; int:<br>
&gt;&gt; &gt; @@ -75,6 +76,9 @@ def main() -&gt; int:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser.add_argument(&#39;-u&#39;, &#39;--=
unmask-non-abi-names&#39;, action=3D&#39;store_true&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dest=3D&#39;unmask&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;expose non-ABI names in introspec=
tion&quot;)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 parser.add_argument(&#39;-i&#39;, &#39;--inclu=
de&#39;, nargs=3D&#39;*&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 default=3D[&#39;qemu/osdep.h&#39;],<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;top-level include headers&quot;)<br>
&gt;&gt;<br>
&gt;&gt; The option name --include doesn&#39;t really tell me what it is ab=
out.=C2=A0 Is<br>
&gt;&gt; it an include path for schema files?=C2=A0 Or is it about includin=
g something<br>
&gt;&gt; in generated C?=C2=A0 Where in generated C?<br>
&gt;&gt;<br>
&gt;&gt; The help text provides clues: &quot;headers&quot; suggests .h, and=
 &quot;top-level&quot;<br>
&gt;&gt; suggests somewhere top-like.<br>
&gt;&gt;<br>
&gt;&gt; In fact, it&#39;s about inserting C code at the beginning of gener=
ated .c<br>
&gt;&gt; files.=C2=A0 For the uses we have in mind, the C code is a single =
#include.<br>
&gt;&gt; The patch implements any number of #includes.<br>
&gt;&gt;<br>
&gt;&gt; More general and arguably less funky: a way to insert arbitrary C =
code.<br>
&gt;&gt;<br>
&gt;&gt; Except arbitrary C code on the command line is unwieldy.=C2=A0 Bet=
ter kept it<br>
&gt;&gt; in the schema.=C2=A0 Pragma?<br>
&gt;&gt;<br>
&gt;&gt; Thoughts?<br>
&gt;<br>
&gt; Pragmas are global currently. This doesn&#39;t scale well, as we would=
<br>
&gt; like to split the schemas. I have a following patch that will allow me=
<br>
&gt; to split/merge the pragmas. This is not optimal either, I would rather=
<br>
&gt; remove/replace them (using annotations).<br>
<br>
Now I&#39;m curious.=C2=A0 Can you sketch what you have in mind?<br></block=
quote><div><br></div><div>I simply made the pragma lists additive:<br></div=
><div>=C2=A0<a href=3D"https://gitlab.com/marcandre.lureau/qemu/-/commit/18=
61964a317c2e74bea2d1f86944625e00df777f">https://gitlab.com/marcandre.lureau=
/qemu/-/commit/1861964a317c2e74bea2d1f86944625e00df777f</a></div><div><br><=
/div><div><br></div><div>I didn&#39;t think much about replacing pragmas wi=
th extra annotations. But it could be for ex moving some pragmas to the dec=
larations.</div><div><br></div><div>From:</div><div><br></div><div>{ &#39;p=
ragma&#39;: {<br>=C2=A0 =C2=A0 # Command names containing &#39;_&#39;<br>=
=C2=A0 =C2=A0 &#39;command-name-exceptions&#39;: [<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;add_client&#39;,</div><div>...</div><div><br></div><div>{ &#39;=
command&#39;: &#39;add_client&#39;,<br>=C2=A0 &#39;data&#39;: { ... } }</di=
v><div><br></div><div>To:</div><div><br></div><div><div>{ &#39;command&#39;=
: { <br></div><div>=C2=A0=C2=A0=C2=A0 &#39;name&#39;: &#39;add_client&#39;,=
</div><div>=C2=A0=C2=A0=C2=A0 # Command name containing &#39;_&#39;<br></di=
v><div>=C2=A0=C2=A0=C2=A0 &#39;name-exception&#39;: true },</div><div>=C2=
=A0 &#39;data&#39;: { ... } }</div><div><br></div><div>Or eventually to the=
 comment:</div><div><br></div><div># <a class=3D"gmail_plusreply" id=3D"plu=
sReplyChip-0">@add_client: (name-exception):</a><br></div></div><div><br></=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Imho, global tweaking of compilation is better done from the command l=
ine.<br>
<br>
The command line is fine for straightforward configuration.=C2=A0 It&#39;s =
not<br>
suitable for injecting code.<br>
<br>
Fine: cc -c, which tells the compiler to work in a certain way.<br>
<br>
Still fine: cc -DFOO, which effectively prepends &#39;#define FOO 1&quot; t=
o the<br>
.c.<br>
<br>
No longer fine: a hypothetical option to prepend arbitrary C code.=C2=A0 Ev=
en<br>
if it was occasionally useful.<br>
<br>
Now watch this:<br>
<br>
=C2=A0 =C2=A0 $ python qapi-gen.py -o t qapi/qapi-schema.json -i &#39;&quot=
;abc.h&quot;<br>
=C2=A0 =C2=A0 #define FOO&#39;<br>
<br>
=C2=A0 =C2=A0 $ head -n 16 t/qapi-types.c<br>
=C2=A0 =C2=A0 /* AUTOMATICALLY GENERATED, DO NOT MODIFY */<br>
<br>
=C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0* Schema-defined QAPI types<br>
=C2=A0 =C2=A0 =C2=A0*<br>
=C2=A0 =C2=A0 =C2=A0* Copyright IBM, Corp. 2011<br>
=C2=A0 =C2=A0 =C2=A0* Copyright (c) 2013-2018 Red Hat Inc.<br>
=C2=A0 =C2=A0 =C2=A0*<br>
=C2=A0 =C2=A0 =C2=A0* This work is licensed under the terms of the GNU LGPL=
, version 2.1 or later.<br>
=C2=A0 =C2=A0 =C2=A0* See the COPYING.LIB file in the top-level directory.<=
br>
=C2=A0 =C2=A0 =C2=A0*/<br>
<br>
=C2=A0 =C2=A0 #include &quot;abc.h&quot;<br>
=C2=A0 =C2=A0 #define FOO<br>
<br>
=C2=A0 =C2=A0 #include &quot;qapi/dealloc-visitor.h&quot;<br>
<br>
Sure, nobody of sane mind would ever do this.=C2=A0 The fact remains that<b=
r>
we&#39;re doing something on the command line that should not be done there=
.<br>
<br>
Your -i enables code injection because it takes either a file name or a<br>
#include argument.=C2=A0 Can we dumb it down to just file name?<br>
<br></blockquote><div><br></div><div>I think that can work too. Users can i=
nclude a header that itself includes extra headers in different ways, if ne=
eded. <br></div></div><div><br></div><div>thanks<br></div><br>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cfe02c05e55161de--

