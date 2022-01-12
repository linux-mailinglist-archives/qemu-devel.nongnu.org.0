Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FEA48BBEF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:34:45 +0100 (CET)
Received: from localhost ([::1]:49214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7RbA-0007zv-C5
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7RZe-0006zg-Eo
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:33:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7RZb-00054I-Is
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641947585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CHwKGrq0/OSYog55MinIi6+B8J+ZeV8/pngx+z16KgE=;
 b=I09yiioLGL2dpJzda1331XmjAGMaosgbjT9guwqTzPSfCcyQAI2HMEaswY4gsQnN8WGWDg
 HA/Oq1d2nBOayhIzzDZIccGZuNnpqknUBd2KxBdwW0BJO09ads8dFbIJHokmiWsNB+daKO
 ic29vRHs865krJtJVfG9DsEM7hEd11Q=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-Bpef21l-PlO7IKsgYvf5fg-1; Tue, 11 Jan 2022 19:33:04 -0500
X-MC-Unique: Bpef21l-PlO7IKsgYvf5fg-1
Received: by mail-ua1-f71.google.com with SMTP id
 w14-20020ab055ce000000b002fedc60272fso554624uaa.21
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 16:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CHwKGrq0/OSYog55MinIi6+B8J+ZeV8/pngx+z16KgE=;
 b=FkEZGpv6Jncne8bAe3J9xQlto+exkdxgabYQ1+1wyl+vGbScGTemW4UP2So+uGU1Gl
 x6AqrcAGliehtHl4ijpnprAH+CmLYatDKIArZqXdVVii1xqH5Jdi13rD34daTL8lRHLo
 MGawNK8RaAlirU+414Mqrw9vGCnEhDEHFidPq6YD7/tqPEk9tEz2OQL8GHehlVvgbJA7
 YNU0xIEiLxFhIxBBJaeQ8Gp6wsYwQo/jjJe7aqODw9snys/CgJSlQmo7wvWIR3Aw+0S0
 2wvB7gll0OmaFQ102uUJ6hs4yHXjn8o5cAGlxBG8bToXkdoBvGqAoC96QwXEKkFkvKQ5
 Fc/A==
X-Gm-Message-State: AOAM5313nFMY0auP6kEoixqqT0MC5ZZb4UTod6irRd7ceYHRr8SpuiBQ
 GmNX8tkCIntXMcQaz+SYPvSOQuZcvbV8vWdKGBvgscGBqo3KRg/rG9xUcEEYgzuvgcyQaNbL0i/
 gyPWxLwpLuW8kaZkzWnxx3ck2XYg7M+o=
X-Received: by 2002:a05:6102:390b:: with SMTP id
 e11mr3187817vsu.35.1641947583893; 
 Tue, 11 Jan 2022 16:33:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHP8UT1fZ1dwUOZZXj8Yx7MeIPbSSgFV5BZ8s9D+AO0Zz3GyJDiAfzjJaidNheL9xGtnfcvr9Fzd8shDPxPmo=
X-Received: by 2002:a05:6102:390b:: with SMTP id
 e11mr3187806vsu.35.1641947583573; 
 Tue, 11 Jan 2022 16:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-3-vsementsov@virtuozzo.com>
 <CAFn=p-ZxtMggvUoGOviWQAt9XpBUSUQX9nOo=MRWyH4k-fpv=Q@mail.gmail.com>
In-Reply-To: <CAFn=p-ZxtMggvUoGOviWQAt9XpBUSUQX9nOo=MRWyH4k-fpv=Q@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 11 Jan 2022 19:32:52 -0500
Message-ID: <CAFn=p-bnoCP2HcXvaokrspOOFG-AqiVD18t54F1=yjzNQn1OmA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] scripts/qapi/commands: gen_commands(): add
 add_trace_points argument
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 6:53 PM John Snow <jsnow@redhat.com> wrote:
>
> On Thu, Dec 23, 2021 at 6:08 AM Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
> >
> > Add possibility to generate trace points for each qmp command.
> >
> > We should generate both trace points and trace-events file, for further
> > trace point code generation.
> >
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > ---
> >  scripts/qapi/commands.py | 84 ++++++++++++++++++++++++++++++++++------
> >  1 file changed, 73 insertions(+), 11 deletions(-)
> >
> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> > index 21001bbd6b..9691c11f96 100644
> > --- a/scripts/qapi/commands.py
> > +++ b/scripts/qapi/commands.py
> > @@ -53,7 +53,8 @@ def gen_command_decl(name: str,
> >  def gen_call(name: str,
> >               arg_type: Optional[QAPISchemaObjectType],
> >               boxed: bool,
> > -             ret_type: Optional[QAPISchemaType]) -> str:
> > +             ret_type: Optional[QAPISchemaType],
> > +             add_trace_points: bool) -> str:
> >      ret = ''
> >
> >      argstr = ''
> > @@ -71,21 +72,65 @@ def gen_call(name: str,
> >      if ret_type:
> >          lhs = 'retval = '
> >
> > -    ret = mcgen('''
> > +    qmp_name = f'qmp_{c_name(name)}'
> > +    upper = qmp_name.upper()
> > +
> > +    if add_trace_points:
> > +        ret += mcgen('''
> > +
> > +    if (trace_event_get_state_backends(TRACE_%(upper)s)) {
> > +        g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
> > +        trace_%(qmp_name)s("", req_json->str);
> > +    }
> > +    ''',
> > +                     upper=upper, qmp_name=qmp_name)
> > +
> > +    ret += mcgen('''
> >
> >      %(lhs)sqmp_%(c_name)s(%(args)s&err);
> > -    error_propagate(errp, err);
> >  ''',
> >                  c_name=c_name(name), args=argstr, lhs=lhs)
> > -    if ret_type:
> > -        ret += mcgen('''
> > +
> > +    ret += mcgen('''
> >      if (err) {
> > +''')
> > +
> > +    if add_trace_points:
> > +        ret += mcgen('''
> > +        trace_%(qmp_name)s("FAIL: ", error_get_pretty(err));
> > +''',
> > +                     qmp_name=qmp_name)
> > +
> > +    ret += mcgen('''
> > +        error_propagate(errp, err);
> >          goto out;
> >      }
> > +''')
> > +
> > +    if ret_type:
> > +        ret += mcgen('''
> >
> >      qmp_marshal_output_%(c_name)s(retval, ret, errp);
> >  ''',
> >                       c_name=ret_type.c_name())
> > +
> > +    if add_trace_points:
> > +        if ret_type:
> > +            ret += mcgen('''
> > +
> > +    if (trace_event_get_state_backends(TRACE_%(upper)s)) {
> > +        g_autoptr(GString) ret_json = qobject_to_json(*ret);
> > +        trace_%(qmp_name)s("RET:", ret_json->str);
> > +    }
> > +    ''',
> > +                     upper=upper, qmp_name=qmp_name)
> > +        else:
> > +            ret += mcgen('''
> > +
> > +    trace_%(qmp_name)s("SUCCESS", "");
> > +    ''',
> > +                         qmp_name=qmp_name)
> > +
> >      return ret
> >
> >
> > @@ -122,10 +167,14 @@ def gen_marshal_decl(name: str) -> str:
> >                   proto=build_marshal_proto(name))
> >
> >
> > +def gen_trace(name: str) -> str:
> > +    return f'qmp_{c_name(name)}(const char *tag, const char *json) "%s%s"\n'
> > +
> >  def gen_marshal(name: str,
> >                  arg_type: Optional[QAPISchemaObjectType],
> >                  boxed: bool,
> > -                ret_type: Optional[QAPISchemaType]) -> str:
> > +                ret_type: Optional[QAPISchemaType],
> > +                add_trace_points: bool) -> str:
> >      have_args = boxed or (arg_type and not arg_type.is_empty())
> >      if have_args:
> >          assert arg_type is not None
> > @@ -180,7 +229,7 @@ def gen_marshal(name: str,
> >      }
> >  ''')
> >
> > -    ret += gen_call(name, arg_type, boxed, ret_type)
> > +    ret += gen_call(name, arg_type, boxed, ret_type, add_trace_points)
> >
> >      ret += mcgen('''
> >
> > @@ -238,11 +287,12 @@ def gen_register_command(name: str,
> >
> >
> >  class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
> > -    def __init__(self, prefix: str):
> > +    def __init__(self, prefix: str, add_trace_points: bool):
> >          super().__init__(
> >              prefix, 'qapi-commands',
> >              ' * Schema-defined QAPI/QMP commands', None, __doc__)
> >          self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
> > +        self.add_trace_points = add_trace_points
> >
> >      def _begin_user_module(self, name: str) -> None:
> >          self._visited_ret_types[self._genc] = set()
> > @@ -261,6 +311,15 @@ def _begin_user_module(self, name: str) -> None:
> >
> >  ''',
> >                               commands=commands, visit=visit))
> > +
> > +        if self.add_trace_points and c_name(commands) != 'qapi_commands':
> > +            self._genc.add(mcgen('''
> > +#include "trace/trace-qapi.h"
> > +#include "qapi/qmp/qjson.h"
> > +#include "trace/trace-%(nm)s_trace_events.h"
> > +''',
> > +                                 nm=c_name(commands)))
> > +
> >          self._genh.add(mcgen('''
> >  #include "%(types)s.h"
> >
> > @@ -322,7 +381,9 @@ def visit_command(self,
> >          with ifcontext(ifcond, self._genh, self._genc):
> >              self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
> >              self._genh.add(gen_marshal_decl(name))
> > -            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type))
> > +            self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
> > +                                       self.add_trace_points))
> > +            self._gent.add(gen_trace(name))
> >          with self._temp_module('./init'):
> >              with ifcontext(ifcond, self._genh, self._genc):
> >                  self._genc.add(gen_register_command(
> > @@ -332,7 +393,8 @@ def visit_command(self,
> >
> >  def gen_commands(schema: QAPISchema,
> >                   output_dir: str,
> > -                 prefix: str) -> None:
> > -    vis = QAPISchemaGenCommandVisitor(prefix)
> > +                 prefix: str,
> > +                 add_trace_points: bool) -> None:
> > +    vis = QAPISchemaGenCommandVisitor(prefix, add_trace_points)
> >      schema.visit(vis)
> >      vis.write(output_dir)
> > --
> > 2.31.1
> >
>
> I looked at Stefan's feedback and I want to second his recommendation
> to use _enter and _exit tracepoints, this closely resembles a lot of
> temporary debugging code I've written for jobs/bitmaps over the years
> and find the technique helpful.
>
> --js
>
> (as a tangent ...
>
> I wish I had a much nicer way of doing C generation from Python, this
> is so ugly. It's not your fault, of course. I'm just wondering if the
> mailing list has any smarter ideas for future improvements to the
> mcgen interface, because I find this type of code really hard to
> review.)

Come to think of it, we could use a framework that was originally
designed for HTML templating, but for C instead. Wait! Don't close the
email yet, I have some funny things to write still!!

Downsides:
- New template language
- Complex

Pros:
- Easier to read
- Easier to review
- Avoids reinventing the wheel
- Doesn't even technically add a dependency, since Sphinx already
relies on Jinja ...
- *Extremely* funny

As an example, let's say we had a file
"scripts/qapi/templates/qmp_marshal_output.c" that looked like this:
```
static void qmp_marshal_output_{{c_name}}(
    {{c_type}} ret_in,
    QObject **ret_out,
    Error **errp
) {
    Visitor *v;

    v = qobject_output_visitor_new_qmp(ret_out);
    if (visit_type_{{c_name}}(v, "unused", &ret_in, errp)) {
        visit_complete(v, ret_out);
    }
    visit_free(v);
    v = qapi_dealloc_visitor_new();
    visit_type_{{c_name}}(v, "unused", &ret_in, NULL);
    visit_free(v);
}
```

We could use Jinja to process it from Python like this:

```
import os
from jinja2 import PackageLoader, Environment, FileSystemLoader

env = Environment(loader = FileSystemLoader('./templates/'))
template = env.get_template("qmp_marshal_output.c")
rendered = cgen(template.render(
    c_name = "foo",
    c_type = "int",
))

print(rendered)
```

You'd get output like this:

```
static void qmp_marshal_output_foo(
    int ret_in,
    QObject **ret_out,
    Error **errp
) {
    Visitor *v;

    v = qobject_output_visitor_new_qmp(ret_out);
    if (visit_type_foo(v, "unused", &ret_in, errp)) {
        visit_complete(v, ret_out);
    }
    visit_free(v);
    v = qapi_dealloc_visitor_new();
    visit_type_foo(v, "unused", &ret_in, NULL);
    visit_free(v);
```

Jinja also supports conditionals and some other logic constructs, so
it'd *probably* apply to most templates we'd want to write, though
admittedly I haven't thought through if it'd actually work everywhere
we'd need it, and I am mostly having a laugh.

...OK, back to work!

--js


