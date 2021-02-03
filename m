Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDDA30DDE8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:17:51 +0100 (CET)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Jug-0003G3-M8
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7JsE-00026G-SL
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:15:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7JsC-0007Hr-IV
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612365313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8lREfScbLNSOI5X4/rvja53C3nTMPZmkKM+1oOrHQfk=;
 b=LUiOtAI0W9zVkGEt5aWFnWTjTE0Q5DFDX92ROMBaag/0DdtwrNs+h3aUcZmoFQFoVINFqP
 pzXhhueJNU7WK+9xcBs+gAS9DOnc9kRnDJWV1v0auzfsaXR9sfDK/BMMmsScXpl19Y7Vq/
 Z58NcYWfaweG+JqQdVTZu4MYQ2JbUYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-N3z-WwxkN-qYQ3f1BONYFg-1; Wed, 03 Feb 2021 10:15:10 -0500
X-MC-Unique: N3z-WwxkN-qYQ3f1BONYFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6AE880402E;
 Wed,  3 Feb 2021 15:15:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF3D1709AE;
 Wed,  3 Feb 2021 15:15:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 73793113865F; Wed,  3 Feb 2021 16:15:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 11/14] qapi/introspect.py: add type hint annotations
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-12-jsnow@redhat.com>
Date: Wed, 03 Feb 2021 16:15:05 +0100
In-Reply-To: <20210202174651.2274166-12-jsnow@redhat.com> (John Snow's message
 of "Tue, 2 Feb 2021 12:46:48 -0500")
Message-ID: <87r1lxqj2e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 115 ++++++++++++++++++++++++++-----------
>  scripts/qapi/mypy.ini      |   5 --
>  scripts/qapi/schema.py     |   2 +-
>  3 files changed, 82 insertions(+), 40 deletions(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 60ec326d2c7..b7f2a6cf260 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -30,10 +30,19 @@
>  )
>  from .gen import QAPISchemaMonolithicCVisitor
>  from .schema import (
> +    QAPISchema,
>      QAPISchemaArrayType,
>      QAPISchemaBuiltinType,
> +    QAPISchemaEntity,
> +    QAPISchemaEnumMember,
> +    QAPISchemaFeature,
> +    QAPISchemaObjectType,
> +    QAPISchemaObjectTypeMember,
>      QAPISchemaType,
> +    QAPISchemaVariant,
> +    QAPISchemaVariants,
>  )
> +from .source import QAPISourceInfo
>  
>  
>  # This module constructs a tree data structure that is used to
> @@ -57,6 +66,8 @@
   # generate the introspection information for QEMU. It behaves similarly
   # to a JSON value.
   #
   # A complexity over JSON is that our values may or may not be annotated.
   #
   # Un-annotated values may be:
   #     Scalar: str, bool, None.
   #     Non-scalar: List, Dict
   # _value = Union[str, bool, None, Dict[str, TreeValue], List[TreeValue]]
   #
   # With optional annotations, the type of all values is:
   # TreeValue = Union[_value, Annotated[_value]]
   #
   # Sadly, mypy does not support recursive types, so we must approximate this.
   _stub = Any
   _scalar = Union[str, bool, None]
   _nonscalar = Union[Dict[str, _stub], List[_stub]]
>  _value = Union[_scalar, _nonscalar]
>  TreeValue = Union[_value, 'Annotated[_value]']
>  
> +# This is a (strict) alias for an arbitrary object non-scalar, as above:
> +_DObject = Dict[str, object]

Sounds greek :)

It's almost the Dict part of _nonscalar, but not quite: object vs. Any.

I naively expect something closer to

   _scalar = ...
   _object = Dict[str, _stub]
   _nonscalar = Union[_object, List[_stub]

and (still naively) expect _object to be good enough to serve as type
annotation for dicts representing JSON objects.

[...]


