Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908B931413F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:06:44 +0100 (CET)
Received: from localhost ([::1]:45836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Dk3-0007d8-Ak
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l98hj-0007XD-Ix
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:43:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l98hd-0001O7-Nr
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:43:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612799033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MkuSG80/9qXY+jIKePksbW68QVeNYyHpdem3YSEdxwY=;
 b=Ea0CtnA+6LGB7rDaLOIBowxyNNL4PbWzELp1fJYRRNdpxvHBz1ofVQRDyZNFJm+01Z2aQB
 w8Lke4lnq0gzq8MeyrOThA9F7w5Y85xzGx4BTAn9Q/k5wIe+g6dwEleT5Mg+oyQf7IIxdk
 x5j1C2Yl5/UzLuyYbe+m/23nzGvYUEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-zcopPFfuPm2mzVhdW1IVQg-1; Mon, 08 Feb 2021 10:43:48 -0500
X-MC-Unique: zcopPFfuPm2mzVhdW1IVQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B29651966323
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 15:43:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DF2D6085D;
 Mon,  8 Feb 2021 15:43:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E9767113865F; Mon,  8 Feb 2021 16:43:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 13/15] qapi/introspect.py: add introspect.json dummy
 types
References: <20210204003207.2856909-1-jsnow@redhat.com>
 <20210204003207.2856909-14-jsnow@redhat.com>
Date: Mon, 08 Feb 2021 16:43:45 +0100
In-Reply-To: <20210204003207.2856909-14-jsnow@redhat.com> (John Snow's message
 of "Wed, 3 Feb 2021 19:32:05 -0500")
Message-ID: <87czxa36q6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Add some aliases that declare intent for some of the "dictly-typed"
> objects we pass around in introspect.py.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> This patch is optional, it can be dropped if desired. If it's taken,
> it's probably best to squash it with the prior patch.  It is purely for
> the sake of demonstrating what the _DObject was meant to convey: a
> Python Dict that represents some JSON Object. It does not add any type
> safety in and of itself, but does have some (light) annotational
> benefit. In this case, it's usually a specific data structure from the
> QAPI Schema we are referencing, but do not have "compile-time" access to
> in Python.
>
> These are loosely typed and don't bother reproducing the exact structure
> of the real types. Python 3.6 does not have support for TypedDict
> structures, so this is as good as we can do without involving a
> third-party library (e.g. Pydantic), in which we might be able to say:
>
>
> class SchemaMetaType(str, enum.Enum):
>     BUILTIN = "builtin"
>     ENUM = "enum"
>     ARRAY = "array"
>     OBJECT = "object"
>     ALTERNATE = "alternate"
>     COMMAND = "command"
>     EVENT = "event"
>
>
> class SchemaInfo(pydantic.BaseModel):
>     name: str
>     meta-type: SchemaMetaType
>     features: Optional[List[str]]
>     data: Union[SchemaInfoBuiltin, SchemaInfoEnum, SchemaInfoArray,
>                 SchemaInfoObject, SchemaInfoAlternate, SchemaInfoCommand,
>                 SchemaInfoEvent]
>
>
> However, the cost of reproducing and keeping these structure definitions
> in-sync between the user-defined portion of the schema and the code
> generator is likely not worth doing any such thing. However, it does
> illustrate an interesting dependency the generator has on the
> user-defined schema itself in terms of types.
>
> So, I settled on using some light types that suggest the form of the
> object instead of enforcing the form.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 51 +++++++++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 20 deletions(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 3afcdda7446..2a39726f40a 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -66,10 +66,15 @@
>  _value = Union[_scalar, _nonscalar]
>  TreeValue = Union[_value, 'Annotated[_value]']
>  
> -# This is an alias for an arbitrary JSON object, represented here as a Dict.
> -# It is stricter on the value type than the recursive definition above.
> -# It is used to represent SchemaInfo-related structures exclusively.
> -_DObject = Dict[str, object]
> +# These types are based on structures defined in QEMU's schema, so we lack
> +# precise types for them here. Python 3.6 does not offer TypedDict constructs,
> +# so they are broadly typed here as simple Python Dicts.
> +SchemaInfo = Dict[str, object]
> +SchemaInfoObject = Dict[str, object]
> +SchemaInfoObjectVariant = Dict[str, object]
> +SchemaInfoObjectMember = Dict[str, object]
> +SchemaInfoCommand = Dict[str, object]
> +
>  
>  _NodeT = TypeVar('_NodeT', bound=_value)
>  
> @@ -162,7 +167,7 @@ def __init__(self, prefix: str, unmask: bool):
>              ' * QAPI/QMP schema introspection', __doc__)
>          self._unmask = unmask
>          self._schema: Optional[QAPISchema] = None
> -        self._trees: List[Annotated[_DObject]] = []
> +        self._trees: List[Annotated[SchemaInfo]] = []
>          self._used_types: List[QAPISchemaType] = []
>          self._name_map: Dict[str, str] = {}
>          self._genc.add(mcgen('''
> @@ -234,9 +239,18 @@ def _gen_features(features: List[QAPISchemaFeature]
>                        ) -> List[Annotated[str]]:
>          return [Annotated(f.name, f.ifcond) for f in features]
>  
> -    def _gen_tree(self, name: str, mtype: str, obj: _DObject,
> +    def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
>                    ifcond: List[str],
>                    features: Optional[List[QAPISchemaFeature]]) -> None:
> +        """
> +        Build and append a SchemaInfo object to self._trees.
> +
> +        :param name: The entity's name.
> +        :param mtype: The entity's meta-type.
> +        :param obj: Additional entity fields, as appropriate for the meta-type.
> +        :param ifcond: List of conditionals that apply to this entire entity.
> +        :param features: Optional features field for SchemaInfo.
> +        """
>          comment: Optional[str] = None
>          if mtype not in ('command', 'event', 'builtin', 'array'):
>              if not self._unmask:
> @@ -251,8 +265,8 @@ def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>          self._trees.append(Annotated(obj, ifcond, comment))
>  
>      def _gen_member(self, member: QAPISchemaObjectTypeMember
> -                    ) -> Annotated[_DObject]:
> -        obj: _DObject = {
> +                    ) -> Annotated[SchemaInfoObjectMember]:
> +        obj: SchemaInfoObjectMember = {
>              'name': member.name,
>              'type': self._use_type(member.type)
>          }
> @@ -262,13 +276,9 @@ def _gen_member(self, member: QAPISchemaObjectTypeMember
>              obj['features'] = self._gen_features(member.features)
>          return Annotated(obj, member.ifcond)
>  
> -    def _gen_variants(self, tag_name: str,
> -                      variants: List[QAPISchemaVariant]) -> _DObject:
> -        return {'tag': tag_name,
> -                'variants': [self._gen_variant(v) for v in variants]}
> -
> -    def _gen_variant(self, variant: QAPISchemaVariant) -> Annotated[_DObject]:
> -        obj: _DObject = {
> +    def _gen_variant(self, variant: QAPISchemaVariant
> +                     ) -> Annotated[SchemaInfoObjectVariant]:
> +        obj: SchemaInfoObjectVariant = {
>              'case': variant.name,
>              'type': self._use_type(variant.type)
>          }
> @@ -300,11 +310,12 @@ def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
>                                 features: List[QAPISchemaFeature],
>                                 members: List[QAPISchemaObjectTypeMember],
>                                 variants: Optional[QAPISchemaVariants]) -> None:
> -        obj: _DObject = {'members': [self._gen_member(m) for m in members]}
> +        obj: SchemaInfoObject = {
> +            'members': [self._gen_member(m) for m in members]
> +        }
>          if variants:
> -            obj.update(self._gen_variants(variants.tag_member.name,
> -                                          variants.variants))
> -
> +            obj['tag'] = variants.tag_member.name
> +            obj['variants'] = [self._gen_variant(v) for v in variants.variants]
>          self._gen_tree(name, 'object', obj, ifcond, features)
>  
>      def visit_alternate_type(self, name: str, info: Optional[QAPISourceInfo],
> @@ -329,7 +340,7 @@ def visit_command(self, name: str, info: Optional[QAPISourceInfo],
>  
>          arg_type = arg_type or self._schema.the_empty_object_type
>          ret_type = ret_type or self._schema.the_empty_object_type
> -        obj: _DObject = {
> +        obj: SchemaInfoCommand = {
>              'arg-type': self._use_type(arg_type),
>              'ret-type': self._use_type(ret_type)
>          }

I see what you mean by "some (light) annotational benefit".

I figure some of is simply due to going from _DObject, a name that tells
me nothing, to SchemaInfo, which makes me go aha!

The remainder is having the subtypes of SchemaInfo, too. albeit without
actual type checking.  Worthwhile?

I agree it should be squashed if we want it, or parts of it.


