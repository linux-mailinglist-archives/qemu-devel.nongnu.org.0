Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A4B43BBDE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:52:45 +0200 (CEST)
Received: from localhost ([::1]:49446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTR6-0007UK-ML
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTNj-0005ij-Py
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTNg-00045a-UI
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635281352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VLLBSzdNmPkmQmoRW5F4NrF0esJlIkWpfSVqTFvR5CE=;
 b=RxNfwV9PhKIeZZzv6uq1BDAe6iSFQVhuWYZls39cLX39NKIH1SnDO67Rj8D8M70c13bEbl
 /COyK6ohWZdVaPgQ/LPf9WNwuaFD5D+IMMcV3W5W6p5rKR9aIG+k66Y8lMKO6/wgX6m3FR
 py+HY8TuXAfpRltg8o8+UgbSshzU7Pg=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-G03zlmMqMVesdd-NZ_9tWQ-1; Tue, 26 Oct 2021 16:49:08 -0400
X-MC-Unique: G03zlmMqMVesdd-NZ_9tWQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 o4-20020ab05944000000b002c9c4d839d1so210678uad.13
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VLLBSzdNmPkmQmoRW5F4NrF0esJlIkWpfSVqTFvR5CE=;
 b=59uG6VUjr+iMnkpaVo8OsAmVygMwYOdoGCR4WFDUyhdhUHyCDPXnQLJO33y9dkryfg
 nncLuapNReoz0tPvvCOWkjCXU7DGHH1YRYlePLBluOt//Erpifmx2ATOWQT2RmoGyhso
 CMaO8z7UiwOw8YtRgHpg8+AkMFjXrq9zE8X3nK9RiYCM1sNBkUD8cFwgWNfRrmuQGDCO
 RFXmFyDUPIC4av4Dn8f6FSuzG2Mcmutv+SV61fH0Lw0MF7fFtlsgQKhncRJA8PdCLvoy
 GxZB1CqmJhGQHNQR9sqMBjhRWeGx0nQcCCD4bH1gwYvet6I/oGBh4s9vwkO9wC7v+Jm5
 Fi6Q==
X-Gm-Message-State: AOAM531VLzbuHLE/3RpRizq/le1BevIzk+POXBuFcpK/vCjNohx87+Ey
 JZSnhq4JmS859R1O8Z5ab+YaAa7OYIrYlNXKG0J/1yoQz5ZILFroCeumvYr/Z4393aLJMTAkseH
 /OYAKsuwvaBosjX6uKvP5gc+hBwsHBhw=
X-Received: by 2002:ab0:4e14:: with SMTP id g20mr25364226uah.50.1635281347372; 
 Tue, 26 Oct 2021 13:49:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNhezJJ6tsml2XCQqbqxPLY2xccimzLyInuwaj6WCo1rYM7DD9qM4b8WinTc8vYw6cO1lX2Y2SxcPemWa2C+w=
X-Received: by 2002:ab0:4e14:: with SMTP id g20mr25364191uah.50.1635281347118; 
 Tue, 26 Oct 2021 13:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211025042405.3762351-1-armbru@redhat.com>
 <20211025042405.3762351-3-armbru@redhat.com>
In-Reply-To: <20211025042405.3762351-3-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 16:48:56 -0400
Message-ID: <CAFn=p-YM02SdLMDDoMgLaYSzfWvaBRwZee7998aQyV4n+JudRw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] qapi: Add feature flags to enum members
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000cda2c705cf479b75"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, libvir-list@redhat.com,
 qemu-devel <qemu-devel@nongnu.org>, mdroth@linux.vnet.ibm.com,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cda2c705cf479b75
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 12:24 AM Markus Armbruster <armbru@redhat.com>
wrote:

> This is quite similar to commit 84ab008687 "qapi: Add feature flags to
> struct members", only for enums instead of structs.
>
> Special feature flag 'deprecated' is silently ignored there.  This is
> okay only because it will be implemented shortly.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>

Reviewed-by: John Snow <jsnow@redhat.com>


> ---
>  docs/devel/qapi-code-gen.rst                  | 16 +++++++++-----
>  qapi/compat.json                              |  2 ++
>  qapi/introspect.json                          |  5 ++++-
>  scripts/qapi/expr.py                          |  3 ++-
>  scripts/qapi/introspect.py                    |  5 +++--
>  scripts/qapi/schema.py                        | 22 +++++++++++++++++--
>  tests/qapi-schema/doc-good.json               |  5 ++++-
>  tests/qapi-schema/doc-good.out                |  3 +++
>  tests/qapi-schema/doc-good.txt                |  3 +++
>  .../qapi-schema/enum-dict-member-unknown.err  |  2 +-
>  tests/qapi-schema/qapi-schema-test.json       |  3 ++-
>  tests/qapi-schema/qapi-schema-test.out        |  1 +
>  tests/qapi-schema/test-qapi.py                |  1 +
>  13 files changed, 57 insertions(+), 14 deletions(-)
>
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index d267889d2c..4071c9074a 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -200,7 +200,9 @@ Syntax::
>               '*if': COND,
>               '*features': FEATURES }
>      ENUM-VALUE = STRING
> -               | { 'name': STRING, '*if': COND }
> +               | { 'name': STRING,
> +                   '*if': COND,
> +                   '*features': FEATURES }
>
>  Member 'enum' names the enum type.
>
> @@ -706,8 +708,10 @@ QEMU shows a certain behaviour.
>  Special features
>  ~~~~~~~~~~~~~~~~
>
> -Feature "deprecated" marks a command, event, or struct member as
> -deprecated.  It is not supported elsewhere so far.
> +Feature "deprecated" marks a command, event, enum value, or struct
> +member as deprecated.  It is not supported elsewhere so far.
> +Interfaces so marked may be withdrawn in future releases in accordance
> +with QEMU's deprecation policy.
>
>
>  Naming rules and reserved names
> @@ -1157,7 +1161,8 @@ and "variants".
>
>  "members" is a JSON array describing the object's common members, if
>  any.  Each element is a JSON object with members "name" (the member's
> -name), "type" (the name of its type), and optionally "default".  The
> +name), "type" (the name of its type), "features" (a JSON array of
> +feature strings), and "default".  The latter two are optional.  The
>  member is optional if "default" is present.  Currently, "default" can
>  only have value null.  Other values are reserved for future
>  extensions.  The "members" array is in no particular order; clients
> @@ -1234,7 +1239,8 @@ The SchemaInfo for an enumeration type has meta-type
> "enum" and
>  variant member "members".
>
>  "members" is a JSON array describing the enumeration values.  Each
> -element is a JSON object with member "name" (the member's name).  The
> +element is a JSON object with member "name" (the member's name), and
> +optionally "features" (a JSON array of feature strings).  The
>  "members" array is in no particular order; clients must search the
>  entire array when learning whether a particular value is supported.
>
> diff --git a/qapi/compat.json b/qapi/compat.json
> index ae3afc22df..1d2b76f00c 100644
> --- a/qapi/compat.json
> +++ b/qapi/compat.json
> @@ -42,6 +42,8 @@
>  # with feature 'deprecated'.  We may want to extend it to cover
>  # semantic aspects, CLI, and experimental features.
>  #
> +# Limitation: not implemented for deprecated enumeration values.
> +#
>  # @deprecated-input: how to handle deprecated input (default 'accept')
>  # @deprecated-output: how to handle deprecated output (default 'accept')
>  #
> diff --git a/qapi/introspect.json b/qapi/introspect.json
> index 9683e884f8..183148b2e9 100644
> --- a/qapi/introspect.json
> +++ b/qapi/introspect.json
> @@ -167,10 +167,13 @@
>  #
>  # @name: the member's name, as defined in the QAPI schema.
>  #
> +# @features: names of features associated with the member, in no
> +#            particular order.
> +#
>  # Since: 6.2
>  ##
>  { 'struct': 'SchemaInfoEnumMember',
> -  'data': { 'name': 'str' } }
> +  'data': { 'name': 'str', '*features': [ 'str' ] } }
>
>  ##
>  # @SchemaInfoArray:
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 819ea6ad97..3cb389e875 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -472,7 +472,7 @@ def check_enum(expr: _JSONObject, info:
> QAPISourceInfo) -> None:
>                    for m in members]
>      for member in members:
>          source = "'data' member"
> -        check_keys(member, info, source, ['name'], ['if'])
> +        check_keys(member, info, source, ['name'], ['if', 'features'])
>          member_name = member['name']
>          check_name_is_str(member_name, info, source)
>          source = "%s '%s'" % (source, member_name)
> @@ -483,6 +483,7 @@ def check_enum(expr: _JSONObject, info:
> QAPISourceInfo) -> None:
>                           permit_upper=permissive,
>                           permit_underscore=permissive)
>          check_if(member, info, source)
> +        check_features(member.get('features'), info)
>
>
>  def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 6334546363..67c7d89aae 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -275,12 +275,13 @@ def _gen_tree(self, name: str, mtype: str, obj:
> Dict[str, object],
>              obj['features'] = self._gen_features(features)
>          self._trees.append(Annotated(obj, ifcond, comment))
>
> -    @staticmethod
> -    def _gen_enum_member(member: QAPISchemaEnumMember
> +    def _gen_enum_member(self, member: QAPISchemaEnumMember
>                           ) -> Annotated[SchemaInfoEnumMember]:
>          obj: SchemaInfoEnumMember = {
>              'name': member.name,
>          }
> +        if member.features:
> +            obj['features'] = self._gen_features(member.features)
>          return Annotated(obj, member.ifcond)
>
>      def _gen_object_member(self, member: QAPISchemaObjectTypeMember
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 004d7095ff..6d5f46509a 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -708,6 +708,19 @@ def describe(self, info):
>  class QAPISchemaEnumMember(QAPISchemaMember):
>      role = 'value'
>
> +    def __init__(self, name, info, ifcond=None, features=None):
> +        super().__init__(name, info, ifcond)
> +        for f in features or []:
> +            assert isinstance(f, QAPISchemaFeature)
> +            f.set_defined_in(name)
> +        self.features = features or []
> +
> +    def connect_doc(self, doc):
> +        super().connect_doc(doc)
> +        if doc:
> +            for f in self.features:
> +                doc.connect_feature(f)
> +
>
>  class QAPISchemaFeature(QAPISchemaMember):
>      role = 'feature'
> @@ -980,9 +993,14 @@ def _make_features(self, features, info):
>                                    QAPISchemaIfCond(f.get('if')))
>                  for f in features]
>
> +    def _make_enum_member(self, name, ifcond, features, info):
> +        return QAPISchemaEnumMember(name, info,
> +                                    QAPISchemaIfCond(ifcond),
> +                                    self._make_features(features, info))
> +
>      def _make_enum_members(self, values, info):
> -        return [QAPISchemaEnumMember(v['name'], info,
> -                                     QAPISchemaIfCond(v.get('if')))
> +        return [self._make_enum_member(v['name'], v.get('if'),
> +                                       v.get('features'), info)
>                  for v in values]
>
>      def _make_array_type(self, element_type, info):
> diff --git a/tests/qapi-schema/doc-good.json
> b/tests/qapi-schema/doc-good.json
> index 86dc25d2bd..74745fb405 100644
> --- a/tests/qapi-schema/doc-good.json
> +++ b/tests/qapi-schema/doc-good.json
> @@ -58,11 +58,14 @@
>  #
>  # Features:
>  # @enum-feat: Also _one_ {and only}
> +# @enum-member-feat: a member feature
>  #
>  # @two is undocumented
>  ##
>  { 'enum': 'Enum',
> -  'data': [ { 'name': 'one', 'if': 'IFONE' }, 'two' ],
> +  'data': [ { 'name': 'one', 'if': 'IFONE',
> +              'features': [ 'enum-member-feat' ] },
> +            'two' ],
>    'features': [ 'enum-feat' ],
>    'if': 'IFCOND' }
>
> diff --git a/tests/qapi-schema/doc-good.out
> b/tests/qapi-schema/doc-good.out
> index 5a324e2627..9dd65b9d92 100644
> --- a/tests/qapi-schema/doc-good.out
> +++ b/tests/qapi-schema/doc-good.out
> @@ -13,6 +13,7 @@ module doc-good.json
>  enum Enum
>      member one
>          if IFONE
> +        feature enum-member-feat
>      member two
>      if IFCOND
>      feature enum-feat
> @@ -108,6 +109,8 @@ The _one_ {and only}
>
>      feature=enum-feat
>  Also _one_ {and only}
> +    feature=enum-member-feat
> +a member feature
>      section=None
>  @two is undocumented
>  doc symbol=Base
> diff --git a/tests/qapi-schema/doc-good.txt
> b/tests/qapi-schema/doc-good.txt
> index 701402ee5e..b3b76bd43f 100644
> --- a/tests/qapi-schema/doc-good.txt
> +++ b/tests/qapi-schema/doc-good.txt
> @@ -56,6 +56,9 @@ Features
>  "enum-feat"
>     Also _one_ {and only}
>
> +"enum-member-feat"
> +   a member feature
> +
>  "two" is undocumented
>
>
> diff --git a/tests/qapi-schema/enum-dict-member-unknown.err
> b/tests/qapi-schema/enum-dict-member-unknown.err
> index f8617ea179..235cde0c49 100644
> --- a/tests/qapi-schema/enum-dict-member-unknown.err
> +++ b/tests/qapi-schema/enum-dict-member-unknown.err
> @@ -1,3 +1,3 @@
>  enum-dict-member-unknown.json: In enum 'MyEnum':
>  enum-dict-member-unknown.json:2: 'data' member has unknown key 'bad-key'
> -Valid keys are 'if', 'name'.
> +Valid keys are 'features', 'if', 'name'.
> diff --git a/tests/qapi-schema/qapi-schema-test.json
> b/tests/qapi-schema/qapi-schema-test.json
> index 2ec50109cb..b677ab861d 100644
> --- a/tests/qapi-schema/qapi-schema-test.json
> +++ b/tests/qapi-schema/qapi-schema-test.json
> @@ -301,7 +301,8 @@
>                                   'TEST_IF_COND_2'] } } ] }
>
>  { 'enum': 'FeatureEnum1',
> -  'data': [ 'eins', 'zwei', 'drei' ],
> +  'data': [ 'eins', 'zwei',
> +            { 'name': 'drei', 'features': [ 'deprecated' ] } ],
>    'features': [ 'feature1' ] }
>
>  { 'union': 'FeatureUnion1',
> diff --git a/tests/qapi-schema/qapi-schema-test.out
> b/tests/qapi-schema/qapi-schema-test.out
> index 9337adc9ea..16846dbeb8 100644
> --- a/tests/qapi-schema/qapi-schema-test.out
> +++ b/tests/qapi-schema/qapi-schema-test.out
> @@ -341,6 +341,7 @@ enum FeatureEnum1
>      member eins
>      member zwei
>      member drei
> +        feature deprecated
>      feature feature1
>  object q_obj_FeatureUnion1-base
>      member tag: FeatureEnum1 optional=False
> diff --git a/tests/qapi-schema/test-qapi.py
> b/tests/qapi-schema/test-qapi.py
> index c717a7a90b..2160cef082 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -37,6 +37,7 @@ def visit_enum_type(self, name, info, ifcond, features,
> members, prefix):
>          for m in members:
>              print('    member %s' % m.name)
>              self._print_if(m.ifcond, indent=8)
> +            self._print_features(m.features, indent=8)
>          self._print_if(ifcond)
>          self._print_features(features)
>
> --
> 2.31.1
>
>

--000000000000cda2c705cf479b75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 12:24 AM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thi=
s is quite similar to commit 84ab008687 &quot;qapi: Add feature flags to<br=
>
struct members&quot;, only for enums instead of structs.<br>
<br>
Special feature flag &#39;deprecated&#39; is silently ignored there.=C2=A0 =
This is<br>
okay only because it will be implemented shortly.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"=
_blank">eblake@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Revie=
wed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com<=
/a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0docs/devel/qapi-code-gen.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 16 +++++++++-----<br>
=C2=A0qapi/compat.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0qapi/introspect.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++-<br>
=C2=A0scripts/qapi/expr.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0scripts/qapi/introspect.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++--<br>
=C2=A0scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 22 +++++++++++++++++--<br>
=C2=A0tests/qapi-schema/doc-good.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 5 ++++-<br>
=C2=A0tests/qapi-schema/doc-good.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
=C2=A0tests/qapi-schema/doc-good.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
=C2=A0.../qapi-schema/enum-dict-member-unknown.err=C2=A0 |=C2=A0 2 +-<br>
=C2=A0tests/qapi-schema/qapi-schema-test.json=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 ++-<br>
=C2=A0tests/qapi-schema/qapi-schema-test.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0tests/qapi-schema/test-qapi.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A013 files changed, 57 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst<br=
>
index d267889d2c..4071c9074a 100644<br>
--- a/docs/devel/qapi-code-gen.rst<br>
+++ b/docs/devel/qapi-code-gen.rst<br>
@@ -200,7 +200,9 @@ Syntax::<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*if&#39;: COND,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*features&#39;: FEATU=
RES }<br>
=C2=A0 =C2=A0 =C2=A0ENUM-VALUE =3D STRING<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| { &#39;name&#39;:=
 STRING, &#39;*if&#39;: COND }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| { &#39;name&#39;:=
 STRING,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
*if&#39;: COND,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
*features&#39;: FEATURES }<br>
<br>
=C2=A0Member &#39;enum&#39; names the enum type.<br>
<br>
@@ -706,8 +708,10 @@ QEMU shows a certain behaviour.<br>
=C2=A0Special features<br>
=C2=A0~~~~~~~~~~~~~~~~<br>
<br>
-Feature &quot;deprecated&quot; marks a command, event, or struct member as=
<br>
-deprecated.=C2=A0 It is not supported elsewhere so far.<br>
+Feature &quot;deprecated&quot; marks a command, event, enum value, or stru=
ct<br>
+member as deprecated.=C2=A0 It is not supported elsewhere so far.<br>
+Interfaces so marked may be withdrawn in future releases in accordance<br>
+with QEMU&#39;s deprecation policy.<br>
<br>
<br>
=C2=A0Naming rules and reserved names<br>
@@ -1157,7 +1161,8 @@ and &quot;variants&quot;.<br>
<br>
=C2=A0&quot;members&quot; is a JSON array describing the object&#39;s commo=
n members, if<br>
=C2=A0any.=C2=A0 Each element is a JSON object with members &quot;name&quot=
; (the member&#39;s<br>
-name), &quot;type&quot; (the name of its type), and optionally &quot;defau=
lt&quot;.=C2=A0 The<br>
+name), &quot;type&quot; (the name of its type), &quot;features&quot; (a JS=
ON array of<br>
+feature strings), and &quot;default&quot;.=C2=A0 The latter two are option=
al.=C2=A0 The<br>
=C2=A0member is optional if &quot;default&quot; is present.=C2=A0 Currently=
, &quot;default&quot; can<br>
=C2=A0only have value null.=C2=A0 Other values are reserved for future<br>
=C2=A0extensions.=C2=A0 The &quot;members&quot; array is in no particular o=
rder; clients<br>
@@ -1234,7 +1239,8 @@ The SchemaInfo for an enumeration type has meta-type =
&quot;enum&quot; and<br>
=C2=A0variant member &quot;members&quot;.<br>
<br>
=C2=A0&quot;members&quot; is a JSON array describing the enumeration values=
.=C2=A0 Each<br>
-element is a JSON object with member &quot;name&quot; (the member&#39;s na=
me).=C2=A0 The<br>
+element is a JSON object with member &quot;name&quot; (the member&#39;s na=
me), and<br>
+optionally &quot;features&quot; (a JSON array of feature strings).=C2=A0 T=
he<br>
=C2=A0&quot;members&quot; array is in no particular order; clients must sea=
rch the<br>
=C2=A0entire array when learning whether a particular value is supported.<b=
r>
<br>
diff --git a/qapi/compat.json b/qapi/compat.json<br>
index ae3afc22df..1d2b76f00c 100644<br>
--- a/qapi/compat.json<br>
+++ b/qapi/compat.json<br>
@@ -42,6 +42,8 @@<br>
=C2=A0# with feature &#39;deprecated&#39;.=C2=A0 We may want to extend it t=
o cover<br>
=C2=A0# semantic aspects, CLI, and experimental features.<br>
=C2=A0#<br>
+# Limitation: not implemented for deprecated enumeration values.<br>
+#<br>
=C2=A0# @deprecated-input: how to handle deprecated input (default &#39;acc=
ept&#39;)<br>
=C2=A0# @deprecated-output: how to handle deprecated output (default &#39;a=
ccept&#39;)<br>
=C2=A0#<br>
diff --git a/qapi/introspect.json b/qapi/introspect.json<br>
index 9683e884f8..183148b2e9 100644<br>
--- a/qapi/introspect.json<br>
+++ b/qapi/introspect.json<br>
@@ -167,10 +167,13 @@<br>
=C2=A0#<br>
=C2=A0# @name: the member&#39;s name, as defined in the QAPI schema.<br>
=C2=A0#<br>
+# @features: names of features associated with the member, in no<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 particular order.<br>
+#<br>
=C2=A0# Since: 6.2<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;SchemaInfoEnumMember&#39;,<br>
-=C2=A0 &#39;data&#39;: { &#39;name&#39;: &#39;str&#39; } }<br>
+=C2=A0 &#39;data&#39;: { &#39;name&#39;: &#39;str&#39;, &#39;*features&#39=
;: [ &#39;str&#39; ] } }<br>
<br>
=C2=A0##<br>
=C2=A0# @SchemaInfoArray:<br>
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
index 819ea6ad97..3cb389e875 100644<br>
--- a/scripts/qapi/expr.py<br>
+++ b/scripts/qapi/expr.py<br>
@@ -472,7 +472,7 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo)=
 -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for m =
in members]<br>
=C2=A0 =C2=A0 =C2=A0for member in members:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source =3D &quot;&#39;data&#39; member&qu=
ot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_keys(member, info, source, [&#39;name&#3=
9;], [&#39;if&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_keys(member, info, source, [&#39;name&#3=
9;], [&#39;if&#39;, &#39;features&#39;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0member_name =3D member[&#39;name&#39;]<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_name_is_str(member_name, info, sour=
ce)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source =3D &quot;%s &#39;%s&#39;&quot; % =
(source, member_name)<br>
@@ -483,6 +483,7 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo)=
 -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 permit_upper=3Dpermissive,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 permit_underscore=3Dpermissive)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_if(member, info, source)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_features(member.get(&#39;features&#39;),=
 info)<br>
<br>
<br>
=C2=A0def check_struct(expr: _JSONObject, info: QAPISourceInfo) -&gt; None:=
<br>
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py<br>
index 6334546363..67c7d89aae 100644<br>
--- a/scripts/qapi/introspect.py<br>
+++ b/scripts/qapi/introspect.py<br>
@@ -275,12 +275,13 @@ def _gen_tree(self, name: str, mtype: str, obj: Dict[=
str, object],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0obj[&#39;features&#39;] =3D=
 self._gen_features(features)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._trees.append(Annotated(obj, ifcond,=
 comment))<br>
<br>
-=C2=A0 =C2=A0 @staticmethod<br>
-=C2=A0 =C2=A0 def _gen_enum_member(member: QAPISchemaEnumMember<br>
+=C2=A0 =C2=A0 def _gen_enum_member(self, member: QAPISchemaEnumMember<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ) -&gt; Annotated[SchemaInfoEnumMember]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0obj: SchemaInfoEnumMember =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;name&#39;: <a href=3D"=
http://member.name" rel=3D"noreferrer" target=3D"_blank">member.name</a>,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if member.features:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 obj[&#39;features&#39;] =3D self=
._gen_features(member.features)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return Annotated(obj, member.ifcond)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _gen_object_member(self, member: QAPISchemaObjectTy=
peMember<br>
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
index 004d7095ff..6d5f46509a 100644<br>
--- a/scripts/qapi/schema.py<br>
+++ b/scripts/qapi/schema.py<br>
@@ -708,6 +708,19 @@ def describe(self, info):<br>
=C2=A0class QAPISchemaEnumMember(QAPISchemaMember):<br>
=C2=A0 =C2=A0 =C2=A0role =3D &#39;value&#39;<br>
<br>
+=C2=A0 =C2=A0 def __init__(self, name, info, ifcond=3DNone, features=3DNon=
e):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(name, info, ifcond)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in features or []:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert isinstance(f, QAPISchemaF=
eature)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.set_defined_in(name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.features =3D features or []<br>
+<br>
+=C2=A0 =C2=A0 def connect_doc(self, doc):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().connect_doc(doc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if doc:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in self.features:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 doc.connect_featur=
e(f)<br>
+<br>
<br>
=C2=A0class QAPISchemaFeature(QAPISchemaMember):<br>
=C2=A0 =C2=A0 =C2=A0role =3D &#39;feature&#39;<br>
@@ -980,9 +993,14 @@ def _make_features(self, features, info):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIfCond(f.get(=
&#39;if&#39;)))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for f in feat=
ures]<br>
<br>
+=C2=A0 =C2=A0 def _make_enum_member(self, name, ifcond, features, info):<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return QAPISchemaEnumMember(name, info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPISchemaIfCond(ifcon=
d),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._make_features(fe=
atures, info))<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def _make_enum_members(self, values, info):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [QAPISchemaEnumMember(v[&#39;name&#39;]=
, info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPISchemaIfCond=
(v.get(&#39;if&#39;)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [self._make_enum_member(v[&#39;name&#39=
;], v.get(&#39;if&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v.get(&#3=
9;features&#39;), info)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for v in valu=
es]<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _make_array_type(self, element_type, info):<br>
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.j=
son<br>
index 86dc25d2bd..74745fb405 100644<br>
--- a/tests/qapi-schema/doc-good.json<br>
+++ b/tests/qapi-schema/doc-good.json<br>
@@ -58,11 +58,14 @@<br>
=C2=A0#<br>
=C2=A0# Features:<br>
=C2=A0# @enum-feat: Also _one_ {and only}<br>
+# @enum-member-feat: a member feature<br>
=C2=A0#<br>
=C2=A0# @two is undocumented<br>
=C2=A0##<br>
=C2=A0{ &#39;enum&#39;: &#39;Enum&#39;,<br>
-=C2=A0 &#39;data&#39;: [ { &#39;name&#39;: &#39;one&#39;, &#39;if&#39;: &#=
39;IFONE&#39; }, &#39;two&#39; ],<br>
+=C2=A0 &#39;data&#39;: [ { &#39;name&#39;: &#39;one&#39;, &#39;if&#39;: &#=
39;IFONE&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;features&#39;: [ &#3=
9;enum-member-feat&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;two&#39; ],<br>
=C2=A0 =C2=A0&#39;features&#39;: [ &#39;enum-feat&#39; ],<br>
=C2=A0 =C2=A0&#39;if&#39;: &#39;IFCOND&#39; }<br>
<br>
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.ou=
t<br>
index 5a324e2627..9dd65b9d92 100644<br>
--- a/tests/qapi-schema/doc-good.out<br>
+++ b/tests/qapi-schema/doc-good.out<br>
@@ -13,6 +13,7 @@ module doc-good.json<br>
=C2=A0enum Enum<br>
=C2=A0 =C2=A0 =C2=A0member one<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if IFONE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 feature enum-member-feat<br>
=C2=A0 =C2=A0 =C2=A0member two<br>
=C2=A0 =C2=A0 =C2=A0if IFCOND<br>
=C2=A0 =C2=A0 =C2=A0feature enum-feat<br>
@@ -108,6 +109,8 @@ The _one_ {and only}<br>
<br>
=C2=A0 =C2=A0 =C2=A0feature=3Denum-feat<br>
=C2=A0Also _one_ {and only}<br>
+=C2=A0 =C2=A0 feature=3Denum-member-feat<br>
+a member feature<br>
=C2=A0 =C2=A0 =C2=A0section=3DNone<br>
=C2=A0@two is undocumented<br>
=C2=A0doc symbol=3DBase<br>
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.tx=
t<br>
index 701402ee5e..b3b76bd43f 100644<br>
--- a/tests/qapi-schema/doc-good.txt<br>
+++ b/tests/qapi-schema/doc-good.txt<br>
@@ -56,6 +56,9 @@ Features<br>
=C2=A0&quot;enum-feat&quot;<br>
=C2=A0 =C2=A0 Also _one_ {and only}<br>
<br>
+&quot;enum-member-feat&quot;<br>
+=C2=A0 =C2=A0a member feature<br>
+<br>
=C2=A0&quot;two&quot; is undocumented<br>
<br>
<br>
diff --git a/tests/qapi-schema/enum-dict-member-unknown.err b/tests/qapi-sc=
hema/enum-dict-member-unknown.err<br>
index f8617ea179..235cde0c49 100644<br>
--- a/tests/qapi-schema/enum-dict-member-unknown.err<br>
+++ b/tests/qapi-schema/enum-dict-member-unknown.err<br>
@@ -1,3 +1,3 @@<br>
=C2=A0enum-dict-member-unknown.json: In enum &#39;MyEnum&#39;:<br>
=C2=A0enum-dict-member-unknown.json:2: &#39;data&#39; member has unknown ke=
y &#39;bad-key&#39;<br>
-Valid keys are &#39;if&#39;, &#39;name&#39;.<br>
+Valid keys are &#39;features&#39;, &#39;if&#39;, &#39;name&#39;.<br>
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qa=
pi-schema-test.json<br>
index 2ec50109cb..b677ab861d 100644<br>
--- a/tests/qapi-schema/qapi-schema-test.json<br>
+++ b/tests/qapi-schema/qapi-schema-test.json<br>
@@ -301,7 +301,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;TEST_IF_COND_2&#39;] } }=
 ] }<br>
<br>
=C2=A0{ &#39;enum&#39;: &#39;FeatureEnum1&#39;,<br>
-=C2=A0 &#39;data&#39;: [ &#39;eins&#39;, &#39;zwei&#39;, &#39;drei&#39; ],=
<br>
+=C2=A0 &#39;data&#39;: [ &#39;eins&#39;, &#39;zwei&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;drei&#39;=
, &#39;features&#39;: [ &#39;deprecated&#39; ] } ],<br>
=C2=A0 =C2=A0&#39;features&#39;: [ &#39;feature1&#39; ] }<br>
<br>
=C2=A0{ &#39;union&#39;: &#39;FeatureUnion1&#39;,<br>
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qap=
i-schema-test.out<br>
index 9337adc9ea..16846dbeb8 100644<br>
--- a/tests/qapi-schema/qapi-schema-test.out<br>
+++ b/tests/qapi-schema/qapi-schema-test.out<br>
@@ -341,6 +341,7 @@ enum FeatureEnum1<br>
=C2=A0 =C2=A0 =C2=A0member eins<br>
=C2=A0 =C2=A0 =C2=A0member zwei<br>
=C2=A0 =C2=A0 =C2=A0member drei<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 feature deprecated<br>
=C2=A0 =C2=A0 =C2=A0feature feature1<br>
=C2=A0object q_obj_FeatureUnion1-base<br>
=C2=A0 =C2=A0 =C2=A0member tag: FeatureEnum1 optional=3DFalse<br>
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.p=
y<br>
index c717a7a90b..2160cef082 100755<br>
--- a/tests/qapi-schema/test-qapi.py<br>
+++ b/tests/qapi-schema/test-qapi.py<br>
@@ -37,6 +37,7 @@ def visit_enum_type(self, name, info, ifcond, features, m=
embers, prefix):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for m in members:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;=C2=A0 =C2=A0 me=
mber %s&#39; % <a href=3D"http://m.name" rel=3D"noreferrer" target=3D"_blan=
k">m.name</a>)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._print_if(m.ifcond, in=
dent=3D8)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._print_features(m.features,=
 indent=3D8)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._print_if(ifcond)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._print_features(features)<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000cda2c705cf479b75--


