Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC509FCA4F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 16:54:23 +0100 (CET)
Received: from localhost ([::1]:58984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVHRu-0004p6-Uj
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 10:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iVHQu-0004C8-Lu
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 10:53:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iVHQr-0006H6-OM
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 10:53:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38898
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iVHQr-0006FT-Hp
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 10:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573746796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXcsa7ynV2HjSm1rI/mRzdHFZYPedIdlsziTDvul1R0=;
 b=C7vNx86lJSet8sCjYzu2ZSWJaI3lxGW/uZVAxOm0z6d+O+mUkuSGdvI+HzCrckiRQe7wH5
 UCdG008k1b0fdBJaUpPhfT5Bt+jWHAvx1b1m9f8ZtEq26bxvW5M4cNeir/CjQMeoJhYBiK
 IrjsNXy1KQH1+zHzzyWxNdaea8DTJA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-wzHIRW5EMZaE1I8UCXqdNg-1; Thu, 14 Nov 2019 10:53:06 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88649803807;
 Thu, 14 Nov 2019 15:53:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0610181E0B;
 Thu, 14 Nov 2019 15:53:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 84B001138648; Thu, 14 Nov 2019 16:53:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v4 03/14] qapi: Introduce default values for
 struct members
References: <20190624173935.25747-1-mreitz@redhat.com>
 <20190624173935.25747-4-mreitz@redhat.com>
Date: Thu, 14 Nov 2019 16:53:03 +0100
In-Reply-To: <20190624173935.25747-4-mreitz@redhat.com> (Max Reitz's message
 of "Mon, 24 Jun 2019 19:39:23 +0200")
Message-ID: <87a78yjvz4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: wzHIRW5EMZaE1I8UCXqdNg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Less than thorough review, because I expect the necessary rebase will
require a bit of rewriting here and there.

Max Reitz <mreitz@redhat.com> writes:

> With this change, it is possible to give default values for struct
> members, as follows:
>
>   What you had to do so far:
>
>     # @member: Some description, defaults to 42.
>     { 'struct': 'Foo',
>       'data': { '*member': 'int' } }
>
>   What you can do now:
>
>     { 'struct': 'Foo',
>       'data': { '*member': { 'type': 'int', 'default': 42 } }
>
> On the C side, this change would remove Foo.has_member, because
> Foo.member is always valid now.  The input visitor deals with setting
> it.  (Naturally, this means that such defaults are useful only for input
> parameters.)
>
> At least three things are left unimplemented:
>
> First, support for alternate data types.  This is because supporting
> them would mean having to allocate the object in the input visitor, and
> then potentially going through multiple levels of nested types.  In any
> case, it would have been difficult and I do not think there is need for
> such support at this point.

I don't mind restricting the 'default' feature to uses we actually have,
at least initially.

I'm afraid I don't fully understand the difficulties you describe, but I
guess that's okay.

> Second, support for null.  The most important reason for this is that
> introspection already uses "'default': null" for "no default, but this
> field is optional".  The second reason is that without support for
> alternate data types, there is not really a point in supporting null.

Also, commit 9d55380b5a "qapi: Remove null from schema language" :)

> Third, full support for default lists.  This has a similar reason to the
> lack of support for alternate data types: Allocating a default list is
> not trivial -- unless the list is empty, which is exactly what we have
> support for.

Your commit message says "for struct members".  What about union
members?  Cases:

* Flat union 'base' members: 'base' is a a struct, possibly implicit.
  Do defaults work in implicit bases, like BlockdevOption's?

* Flat union branch members: these are always struct types, so there's
  nothing for me to ask.  I think.

* Simple union branch members: these are each wrapped in an implicit
  struct type.  Do defaults work?  I'd be totally fine with "nope, not
  implemented, not going to implement it" here.

> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  qapi/introspect.json       |   9 +-
>  scripts/qapi/commands.py   |   2 +-
>  scripts/qapi/common.py     | 167 +++++++++++++++++++++++++++++++++++--
>  scripts/qapi/doc.py        |  20 ++++-
>  scripts/qapi/introspect.py |   2 +-
>  scripts/qapi/types.py      |   2 +-
>  scripts/qapi/visit.py      |  38 ++++++++-
>  7 files changed, 217 insertions(+), 23 deletions(-)

Missing: docs/devel/qapi-code-gen.txt update.

>
> diff --git a/qapi/introspect.json b/qapi/introspect.json
> index 1843c1cb17..db703135f9 100644
> --- a/qapi/introspect.json
> +++ b/qapi/introspect.json
> @@ -198,11 +198,10 @@
>  #
>  # @default: default when used as command parameter.
>  #           If absent, the parameter is mandatory.
> -#           If present, the value must be null.  The parameter is
> -#           optional, and behavior when it's missing is not specified
> -#           here.
> -#           Future extension: if present and non-null, the parameter
> -#           is optional, and defaults to this value.
> +#           If present and null, the parameter is optional, and
> +#           behavior when it's missing is not specified here.
> +#           If present and non-null, the parameter is optional, and
> +#           defaults to this value.
>  #
>  # Since: 2.5
>  ##
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index b929e07be4..6c407cd4ba 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -35,7 +35,7 @@ def gen_call(name, arg_type, boxed, ret_type):
>      elif arg_type:
>          assert not arg_type.variants
>          for memb in arg_type.members:
> -            if memb.optional:
> +            if memb.optional and memb.default is None:
>                  argstr +=3D 'arg.has_%s, ' % c_name(memb.name)
>              argstr +=3D 'arg.%s, ' % c_name(memb.name)
> =20
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index c6754a5856..8c57d0c67a 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -14,6 +14,7 @@
>  from __future__ import print_function
>  from contextlib import contextmanager
>  import errno
> +import math
>  import os
>  import re
>  import string
> @@ -800,6 +801,136 @@ def check_if(expr, info):
>          check_if_str(ifcond, info)
> =20
> =20
> +def check_value_str(info, value):
> +    return 'g_strdup(%s)' % to_c_string(value) if type(value) is str els=
e False

What's wrong with isinstance(value, str)?

I'm a happy user of ternaries myself, but this one results in a rather
long line.  Easier to read, I think:

       if isinstance(value, str):
           return 'g_strdup(%s)' % to_c_string(value)
       return False

> +
> +def check_value_number(info, value):
> +    if type(value) is not float:
> +        return False
> +    if math.isinf(value):
> +        return 'INFINITY' if value > 0 else '-INFINITY'
> +    elif math.isnan(value):
> +        return 'NAN'
> +    else:
> +        return '%.16e' % value

Why not str(value)?

> +
> +def check_value_bool(info, value):
> +    if type(value) is not bool:
> +        return False
> +    return 'true' if value else 'false'
> +
> +def is_int_type(value):
> +    if type(value) is int:
> +        return True
> +    # 'long' does not exist in Python 3
> +    try:
> +        if type(value) is long:
> +            return True
> +    except NameError:
> +        pass
> +
> +    return False

Python 2 busy-work...

> +
> +def gen_check_value_int(bits):
> +    def check_value_int(info, value):
> +        if not is_int_type(value) or \
> +           value < -(2 ** (bits - 1)) or value >=3D 2 ** (bits - 1):
> +            return False
> +        if bits > 32:
> +            return '%ill' % value
> +        else:
> +            return '%i' % value

Why not str(value) regardless of @bits?

> +
> +    return check_value_int
> +
> +def gen_check_value_uint(bits):
> +    def check_value_uint(info, value):
> +        if not is_int_type(value) or value < 0 or value >=3D 2 ** bits:
> +            return False
> +        if bits > 32:
> +            return '%uull' % value
> +        elif bits > 16:
> +            return '%uu' % value
> +        else:
> +            return '%u' % value

Likewise.

> +
> +    return check_value_uint

Your check_value_FOO(info, value) have a peculiar contract:=20

    If @value is a valid FOO, convert it to str and return that.  Else
    return False.

    @info is unused.

I wouldn't guess that from the name.  What about this: rename to
str_if_FOO(), return @value converted to str if it's a valid FOO, else
None.  Ditch @info unless there's a reason to keep it.

> +
> +# Check whether the given value fits the given QAPI type.
> +# If so, return a C representation of the value (pointers point to
> +# newly allocated objects).
> +# Otherwise, raise an exception.

The parenthesis gave me pause (I figure my body's busy digesting lunch).
The only pointer-valued type is 'str', isn't it?

Type-checking is in schema.py now.  Stuff like @enum_types is gone.  See
commit fa110c6a9e "qapi: Move context-sensitive checking to the proper
place".

> +def check_value(info, qapi_type, value):
> +    builtin_type_checks =3D {
> +        'str':      check_value_str,
> +        'int':      gen_check_value_int(64),
> +        'number':   check_value_number,
> +        'bool':     check_value_bool,
> +        'int8':     gen_check_value_int(8),
> +        'int16':    gen_check_value_int(16),
> +        'int32':    gen_check_value_int(32),
> +        'int64':    gen_check_value_int(64),
> +        'uint8':    gen_check_value_uint(8),
> +        'uint16':   gen_check_value_uint(16),
> +        'uint32':   gen_check_value_uint(32),
> +        'uint64':   gen_check_value_uint(64),
> +        'size':     gen_check_value_uint(64),
> +    }
> +
> +    # Cannot support null because that would require a value of "None"
> +    # (which is reserved for no default)

This is another instance of the class of problems that led to commit
9d55380b5a "qapi: Remove null from schema language".

> +    unsupported_builtin_types =3D ['null', 'any', 'QType']

You give a clue for 'null'.  Should you give one for 'any' and 'QType',
too?

> +
> +    if type(qapi_type) is list:
> +        has_list =3D True
> +        qapi_type =3D qapi_type[0]
> +    elif qapi_type.endswith('List'):
> +        has_list =3D True
> +        qapi_type =3D qapi_type[:-4]
> +    else:
> +        has_list =3D False
> +
> +    if has_list:
> +        if value =3D=3D []:
> +            return 'NULL'
> +        else:
> +            raise QAPISemError(info,
> +                "Support for non-empty lists as default values has not b=
een " \
> +                "implemented yet: '{}'".format(value))
> +
> +    if qapi_type in builtin_type_checks:
> +        c_val =3D builtin_type_checks[qapi_type](info, value)
> +        if not c_val:
> +            raise QAPISemError(info,
> +                "Value '{}' does not match type {}".format(value, qapi_t=
ype))
> +        return c_val
> +
> +    if qapi_type in unsupported_builtin_types:
> +        raise QAPISemError(info,
> +                           "Cannot specify values for type %s" % qapi_ty=
pe)
> +
> +    if qapi_type in enum_types:
> +        if not check_value_str(info, value):
> +            raise QAPISemError(info,
> +                "Enum values must be strings, but '{}' is no string" \
> +                        .format(value))
> +
> +        enum_values =3D enum_types[qapi_type]['data']
> +        for ev in enum_values:
> +            if ev['name'] =3D=3D value:
> +                return c_enum_const(qapi_type, value,
> +                                    enum_types[qapi_type].get('prefix'))
> +
> +        raise QAPISemError(info,
> +            "Value '{}' does not occur in enum {}".format(value, qapi_ty=
pe))
> +
> +    # TODO: Support alternates
> +
> +    raise QAPISemError(info,
> +        "Cannot specify values for type %s (not built-in or an enum)" %
> +        qapi_type)
> +
> +

check_value() furses checking and converting.  Its callers seem to need
either the checking or the converting.  I'm not sure fusing the two is a
good idea.

>  def check_type(info, source, value, allow_array=3DFalse,
>                 allow_dict=3DFalse, allow_optional=3DFalse,
>                 allow_metas=3D[]):
> @@ -842,15 +973,22 @@ def check_type(info, source, value, allow_array=3DF=
alse,
>          if c_name(key, False) =3D=3D 'u' or c_name(key, False).startswit=
h('has_'):
>              raise QAPISemError(info, "Member of %s uses reserved name '%=
s'"
>                                 % (source, key))
> -        # Todo: allow dictionaries to represent default values of
> -        # an optional argument.
> +
>          check_known_keys(info, "member '%s' of %s" % (key, source),
> -                         arg, ['type'], ['if'])
> +                         arg, ['type'], ['if', 'default'])
>          check_type(info, "Member '%s' of %s" % (key, source),
>                     arg['type'], allow_array=3DTrue,
>                     allow_metas=3D['built-in', 'union', 'alternate', 'str=
uct',
>                                  'enum'])
> =20
> +        if 'default' in arg:
> +            if key[0] !=3D '*':
> +                raise QAPISemError(info,
> +                    "'%s' is not optional, so it cannot have a default v=
alue" %
> +                    key)
> +
> +            check_value(info, arg['type'], arg['default'])
> +
> =20
>  def check_command(expr, info):
>      name =3D expr['command']
> @@ -1601,13 +1739,14 @@ class QAPISchemaFeature(QAPISchemaMember):
> =20
> =20
>  class QAPISchemaObjectTypeMember(QAPISchemaMember):
> -    def __init__(self, name, typ, optional, ifcond=3DNone):
> +    def __init__(self, name, typ, optional, ifcond=3DNone, default=3DNon=
e):
>          QAPISchemaMember.__init__(self, name, ifcond)
>          assert isinstance(typ, str)
>          assert isinstance(optional, bool)
>          self._type_name =3D typ
>          self.type =3D None
>          self.optional =3D optional
> +        self.default =3D default
> =20
>      def check(self, schema):
>          assert self.owner
> @@ -1917,7 +2056,7 @@ class QAPISchema(object):
>              name, info, doc, ifcond,
>              self._make_enum_members(data), prefix))
> =20
> -    def _make_member(self, name, typ, ifcond, info):
> +    def _make_member(self, name, typ, ifcond, default, info):
>          optional =3D False
>          if name.startswith('*'):
>              name =3D name[1:]
> @@ -1925,10 +2064,11 @@ class QAPISchema(object):
>          if isinstance(typ, list):
>              assert len(typ) =3D=3D 1
>              typ =3D self._make_array_type(typ[0], info)
> -        return QAPISchemaObjectTypeMember(name, typ, optional, ifcond)
> +        return QAPISchemaObjectTypeMember(name, typ, optional, ifcond, d=
efault)
> =20
>      def _make_members(self, data, info):
> -        return [self._make_member(key, value['type'], value.get('if'), i=
nfo)
> +        return [self._make_member(key, value['type'], value.get('if'),
> +                                  value.get('default'), info)
>                  for (key, value) in data.items()]
> =20
>      def _def_struct_type(self, expr, info, doc):
> @@ -1951,7 +2091,7 @@ class QAPISchema(object):
>              typ =3D self._make_array_type(typ[0], info)
>          typ =3D self._make_implicit_object_type(
>              typ, info, None, self.lookup_type(typ),
> -            'wrapper', [self._make_member('data', typ, None, info)])
> +            'wrapper', [self._make_member('data', typ, None, None, info)=
])
>          return QAPISchemaObjectTypeVariant(case, typ, ifcond)
> =20
>      def _def_union_type(self, expr, info, doc):
> @@ -2234,6 +2374,15 @@ def to_c_string(string):
>      return result
> =20
> =20
> +# Translates a value for the given QAPI type to its C representation.
> +# The caller must have called check_value() during parsing to be sure
> +# that the given value fits the type.
> +def c_value(qapi_type, value):
> +    pseudo_info =3D {'file': '(generator bug)', 'line': 0, 'parent': Non=
e}
> +    # The caller guarantees this does not raise an exception
> +    return check_value(pseudo_info, qapi_type, value)
> +
> +
>  def guardstart(name):
>      return mcgen('''
>  #ifndef %(name)s
> @@ -2356,7 +2505,7 @@ def build_params(arg_type, boxed, extra=3DNone):
>          for memb in arg_type.members:
>              ret +=3D sep
>              sep =3D ', '
> -            if memb.optional:
> +            if memb.optional and memb.default is None:
>                  ret +=3D 'bool has_%s, ' % c_name(memb.name)
>              ret +=3D '%s %s' % (memb.type.c_param_type(),
>                                c_name(memb.name))
> diff --git a/scripts/qapi/doc.py b/scripts/qapi/doc.py
> index 5fc0fc7e06..78a9052738 100755
> --- a/scripts/qapi/doc.py
> +++ b/scripts/qapi/doc.py
> @@ -139,13 +139,29 @@ def texi_enum_value(value, desc, suffix):
>          value.name, desc, texi_if(value.ifcond, prefix=3D'@*'))
> =20
> =20
> +def doc_value(value):
> +    if value is True:
> +        return 'true'
> +    elif value is False:
> +        return 'false'
> +    elif value is None:
> +        return 'null'
> +    else:
> +        return '{}'.format(value)
> +
>  def texi_member(member, desc, suffix):
>      """Format a table of members item for an object type member"""
>      typ =3D member.type.doc_type()
>      membertype =3D ': ' + typ if typ else ''
> +
> +    optional_info =3D ''
> +    if member.default is not None:
> +        optional_info =3D ' (optional, default: %s)' % doc_value(member.=
default)
> +    elif member.optional:
> +        optional_info =3D ' (optional)'
> +
>      return '@item @code{%s%s}%s%s\n%s%s' % (
> -        member.name, membertype,
> -        ' (optional)' if member.optional else '',
> +        member.name, membertype, optional_info,
>          suffix, desc, texi_if(member.ifcond, prefix=3D'@*'))
> =20
> =20
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 572e0b8331..7d73020a42 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -159,7 +159,7 @@ const QLitObject %(c_name)s =3D %(c_string)s;
>      def _gen_member(self, member):
>          ret =3D {'name': member.name, 'type': self._use_type(member.type=
)}
>          if member.optional:
> -            ret['default'] =3D None
> +            ret['default'] =3D member.default
>          if member.ifcond:
>              ret =3D (ret, {'if': member.ifcond})
>          return ret
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index 3edd9374aa..46a6d33379 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -44,7 +44,7 @@ def gen_struct_members(members):
>      ret =3D ''
>      for memb in members:
>          ret +=3D gen_if(memb.ifcond)
> -        if memb.optional:
> +        if memb.optional and memb.default is None:
>              ret +=3D mcgen('''
>      bool has_%(c_name)s;
>  ''',
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 484ebb66ad..0960e25a25 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -40,10 +40,14 @@ def gen_visit_object_members(name, base, members, var=
iants):
>  void visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **=
errp)
>  {
>      Error *err =3D NULL;
> -
>  ''',
>                  c_name=3Dc_name(name))
> =20
> +    if len([m for m in members if m.default is not None]) > 0:
> +        ret +=3D mcgen('''
> +    bool has_optional;
> +''')
> +
>      if base:
>          ret +=3D mcgen('''
>      visit_type_%(c_type)s_members(v, (%(c_type)s *)obj, &err);
> @@ -53,13 +57,28 @@ void visit_type_%(c_name)s_members(Visitor *v, %(c_na=
me)s *obj, Error **errp)
>  ''',
>                       c_type=3Dbase.c_name())
> =20
> +    ret +=3D mcgen('''
> +
> +''')
> +
>      for memb in members:
>          ret +=3D gen_if(memb.ifcond)
>          if memb.optional:
> +            if memb.default is not None:
> +                optional_target =3D 'has_optional'
> +                # Visitors other than the input visitor do not have to i=
mplement
> +                # .optional().  Therefore, we have to initialize has_opt=
ional.

Suggest "Only input visitors must implement .optional()."


> +                # Initialize it to true, because the field's value is al=
ways
> +                # present when using any visitor but the input visitor.
> +                ret +=3D mcgen('''
> +    has_optional =3D true;
> +''')
> +            else:
> +                optional_target =3D 'obj->has_' + c_name(memb.name)
>              ret +=3D mcgen('''
> -    if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
> +    if (visit_optional(v, "%(name)s", &%(opt_target)s)) {
>  ''',
> -                         name=3Dmemb.name, c_name=3Dc_name(memb.name))
> +                         name=3Dmemb.name, opt_target=3Doptional_target)
>              push_indent()
>          ret +=3D mcgen('''
>      visit_type_%(c_type)s(v, "%(name)s", &obj->%(c_name)s, &err);

I've stared at this dumbly for too long.  It can't actually be that
hard.  I'm afraid I've run out of steam for today.  I'll continue when
my steam pressure is back to operational.


> @@ -69,7 +88,16 @@ void visit_type_%(c_name)s_members(Visitor *v, %(c_nam=
e)s *obj, Error **errp)
>  ''',
>                       c_type=3Dmemb.type.c_name(), name=3Dmemb.name,
>                       c_name=3Dc_name(memb.name))
> -        if memb.optional:
> +        if memb.default is not None:
> +            pop_indent()
> +            ret +=3D mcgen('''
> +    } else {
> +        obj->%(c_name)s =3D %(c_value)s;
> +    }
> +''',
> +                         c_name=3Dc_name(memb.name),
> +                         c_value=3Dc_value(memb._type_name, memb.default=
))
> +        elif memb.optional:
>              pop_indent()
>              ret +=3D mcgen('''
>      }
> @@ -287,6 +315,7 @@ class QAPISchemaGenVisitVisitor(QAPISchemaModularCVis=
itor):
>          self._add_system_module(None, ' * Built-in QAPI visitors')
>          self._genc.preamble_add(mcgen('''
>  #include "qemu/osdep.h"
> +#include <math.h>
>  #include "qapi/error.h"
>  #include "qapi/qapi-builtin-visit.h"
>  '''))
> @@ -302,6 +331,7 @@ class QAPISchemaGenVisitVisitor(QAPISchemaModularCVis=
itor):
>          visit =3D self._module_basename('qapi-visit', name)
>          self._genc.preamble_add(mcgen('''
>  #include "qemu/osdep.h"
> +#include <math.h>
>  #include "qapi/error.h"
>  #include "qapi/qmp/qerror.h"
>  #include "%(visit)s.h"


