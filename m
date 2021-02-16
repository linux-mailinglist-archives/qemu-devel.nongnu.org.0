Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0885231C801
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 10:25:32 +0100 (CET)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBwbr-0008EQ-5K
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 04:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBwb6-0007k7-DL
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:24:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBwb4-00033G-3c
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613467481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nnlaa1JeC60VINlR2716p26AKOLjdVWXudY86zzTQ3c=;
 b=ecJUtxs9pDiJihyPpq/J2IvybOBhdicYnzGiIqUQ7TFT+9pNkiK2LByPGQoLx7c3bsMByI
 FzXUPwqb2dB9j0I5Xuo5/sLc7/a7cB0wXWvqx2+l4fm5By6gEaAlUyQebf5lujLTUNV3uR
 7eED45k6aGrNCUUb71xVXrV4DdjJH+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-dLysOgQ4OZOySGF6C6GsZw-1; Tue, 16 Feb 2021 04:24:39 -0500
X-MC-Unique: dLysOgQ4OZOySGF6C6GsZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AF9D107ACE3;
 Tue, 16 Feb 2021 09:24:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3636360C61;
 Tue, 16 Feb 2021 09:24:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BD049113865F; Tue, 16 Feb 2021 10:24:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 19/19] qapi/introspect.py: add SchemaMetaType enum
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-20-jsnow@redhat.com>
Date: Tue, 16 Feb 2021 10:24:36 +0100
In-Reply-To: <20210216021809.134886-20-jsnow@redhat.com> (John Snow's message
 of "Mon, 15 Feb 2021 21:18:09 -0500")
Message-ID: <87pn10nz57.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Follows the qapi/introspect.py definition of the same; this adds a more
> precise typing to _gen_tree's mtype parameter.
>
> NB: print(SchemaMetaType.BUILTIN) would produce the string
> "SchemaMetaType.BUILTIN", but when using format strings (.format or f-strings),
> it relies on the __format__ method defined in the Enum class, which uses the
> "value" of the enum instead, producing the string "builtin".
>
> For consistency with old-style format strings (which simply call the
> __str__ method of an object), a __str__ dunder is added, though it is
> not actually used here in this code.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 38 +++++++++++++++++++++++++++++---------
>  1 file changed, 29 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index c6f5cf8d874..008a21f5c4c 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -11,6 +11,7 @@
>  See the COPYING file in the top-level directory.
>  """
>  
> +from enum import Enum
>  from typing import (
>      Any,
>      Dict,
> @@ -79,6 +80,23 @@
>  SchemaInfoCommand = Dict[str, object]
>  
>  
> +class SchemaMetaType(str, Enum):
> +    """
> +    Mimics the SchemaMetaType enum from qapi/introspect.json.
> +    """
> +    BUILTIN = 'builtin'
> +    ENUM = 'enum'
> +    ARRAY = 'array'
> +    OBJECT = 'object'
> +    ALTERNATE = 'alternate'
> +    COMMAND = 'command'
> +    EVENT = 'event'
> +
> +    def __str__(self) -> str:
> +        # Needed for intuitive behavior with old-style format strings.
> +        return str(self.value)
> +
> +

The fanciness compared to plain Enum('SchemaMetaType', 'BUILTIN ...')
avoids extra code to map the enum values to the strings with need.

>  _ValueT = TypeVar('_ValueT', bound=_Value)
>  
>  
> @@ -251,7 +269,8 @@ def _gen_features(features: Sequence[QAPISchemaFeature]
>                        ) -> List[Annotated[str]]:
>          return [Annotated(f.name, f.ifcond) for f in features]
>  
> -    def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
> +    def _gen_tree(self, name: str, mtype: SchemaMetaType,
> +                  obj: Dict[str, object],
>                    ifcond: Sequence[str] = (),
>                    features: Sequence[QAPISchemaFeature] = ()) -> None:
>          """
> @@ -299,7 +318,7 @@ def _gen_variant(self, variant: QAPISchemaVariant
>  
>      def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
>                             json_type: str) -> None:
> -        self._gen_tree(name, 'builtin', {'json-type': json_type})
> +        self._gen_tree(name, SchemaMetaType.BUILTIN, {'json-type': json_type})
>  
>      def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
>                          ifcond: Sequence[str],
> @@ -307,7 +326,7 @@ def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
>                          members: List[QAPISchemaEnumMember],
>                          prefix: Optional[str]) -> None:
>          self._gen_tree(
> -            name, 'enum',
> +            name, SchemaMetaType.ENUM,
>              {'values': [Annotated(m.name, m.ifcond) for m in members]},
>              ifcond, features
>          )
> @@ -316,8 +335,8 @@ def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
>                           ifcond: Sequence[str],
>                           element_type: QAPISchemaType) -> None:
>          element = self._use_type(element_type)
> -        self._gen_tree('[' + element + ']', 'array', {'element-type': element},
> -                       ifcond)
> +        self._gen_tree('[' + element + ']', SchemaMetaType.ARRAY,
> +                       {'element-type': element}, ifcond)
>  
>      def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
>                                 ifcond: Sequence[str],
> @@ -330,14 +349,14 @@ def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
>          if variants:
>              obj['tag'] = variants.tag_member.name
>              obj['variants'] = [self._gen_variant(v) for v in variants.variants]
> -        self._gen_tree(name, 'object', obj, ifcond, features)
> +        self._gen_tree(name, SchemaMetaType.OBJECT, obj, ifcond, features)
>  
>      def visit_alternate_type(self, name: str, info: Optional[QAPISourceInfo],
>                               ifcond: Sequence[str],
>                               features: List[QAPISchemaFeature],
>                               variants: QAPISchemaVariants) -> None:
>          self._gen_tree(
> -            name, 'alternate',
> +            name, SchemaMetaType.ALTERNATE,
>              {'members': [Annotated({'type': self._use_type(m.type)},
>                                     m.ifcond)
>                           for m in variants.variants]},
> @@ -361,7 +380,7 @@ def visit_command(self, name: str, info: Optional[QAPISourceInfo],
>          }
>          if allow_oob:
>              obj['allow-oob'] = allow_oob
> -        self._gen_tree(name, 'command', obj, ifcond, features)
> +        self._gen_tree(name, SchemaMetaType.COMMAND, obj, ifcond, features)
>  
>      def visit_event(self, name: str, info: Optional[QAPISourceInfo],
>                      ifcond: Sequence[str], features: List[QAPISchemaFeature],
> @@ -370,7 +389,8 @@ def visit_event(self, name: str, info: Optional[QAPISourceInfo],
>          assert self._schema is not None
>  
>          arg_type = arg_type or self._schema.the_empty_object_type
> -        self._gen_tree(name, 'event', {'arg-type': self._use_type(arg_type)},
> +        self._gen_tree(name, SchemaMetaType.EVENT,
> +                       {'arg-type': self._use_type(arg_type)},
>                         ifcond, features)

Gain: _gen_tree()'s second argument's type now serves as documentation,
and passing crap to it becomes harder.

Gut feeling: too much notational overhead for too little gain.

Opinions?


