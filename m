Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4040C692EE3
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 07:43:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQjar-0006q2-Js; Sat, 11 Feb 2023 01:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQjag-0006oZ-GC
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 01:42:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQjae-0002kW-FQ
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 01:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676097747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nWfOV2VxReqM+tw8V12dOJBWZGOoT5SU6M8niNKNcO8=;
 b=L3mA9Po/CN7an93N8KwcAXQhEOPtc6OM8cqTNLH6r8aumj+494PBoc0QDKZMAdyggWPksH
 CPbJN+UqXZmp0gUg2fjWBWKJg6NaeGcNOaBaXlqKYrrMdIoRH/pZEyiwMq6koz2UuYpul9
 vB9Y7bb+QpkwPZcGt5/JBeLn/b5ukJA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-vk_2dfJvOhmmpGIuV53p5Q-1; Sat, 11 Feb 2023 01:42:23 -0500
X-MC-Unique: vk_2dfJvOhmmpGIuV53p5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7760A101A52E;
 Sat, 11 Feb 2023 06:42:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF4C18EC6;
 Sat, 11 Feb 2023 06:42:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A71C21E6A1F; Sat, 11 Feb 2023 07:42:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Markus
 Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 7/7] qapi: remove JSON value FIXME
References: <20230209184758.1017863-1-jsnow@redhat.com>
 <20230209184758.1017863-8-jsnow@redhat.com>
Date: Sat, 11 Feb 2023 07:42:22 +0100
In-Reply-To: <20230209184758.1017863-8-jsnow@redhat.com> (John Snow's message
 of "Thu, 9 Feb 2023 13:47:58 -0500")
Message-ID: <87pmag4sa9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

John Snow <jsnow@redhat.com> writes:

> With the two major JSON-ish type hierarchies clarified for distinct
> purposes; QAPIExpression for parsed expressions and JSONValue for

The comment you remove talks about _ExprValue, not QAPIExpression.

> introspection data, remove this FIXME as no longer an action item.
>
> In theory, it may be possible to define a completely agnostic
> one-size-fits-all JSON type hierarchy that any other user could borrow -
> in practice, it's tough to wrangle the differences between invariant,
> covariant and contravariant types: input and output parameters demand
> different properties of such a structure. As such, it's simply more
> trouble than it's worth.

I think there's a weightier counter-argument struggling to get out.

As I explained under v2's cover letter, the two types represent things
that are only superficially similar.

_ExprValue is the obvious stupid abstract syntax tree for the QAPI
schema language, with str and bool leaves (QAPI doesn't support
floating-point numbers), OrderedDict and list inner nodes.  It is used
for parser output.

QAPIExpression augments _ExprValue, adding a QAPISourceInfo (identifying
the expression's source) and a QAPIDoc (the expressions documentation).
It is used to represent QAPI top-level expressions.

JSONValue is an annotated JSON abstract syntax tree.  QAPIExpression and
_ExprValue are related to it only insofar as the QAPI schema language is
(rather loosely) patterned after JSON.

Moreover, the two ASTs serve different purposes.  QAPIExpression and
_ExprValue represent *input*: they are produced by a parser and consumed
by a semantic analyzer.  JSONValue represents *output*: it is produced
within a backend so we can separate the JSON text formatting aspect.

Consolidating these two ASTs makes no sense.

Suggest to work this argument into your commit message.

> So, declare this "done enough for now".

Agree.

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index c165bd3912c..b5afdd703e7 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -42,10 +42,6 @@
>  _ExprValue = Union[List[object], Dict[str, object], str, bool]
>  
>  
> -# FIXME: Consolidate and centralize definitions for _ExprValue and
> -# JSONValue; currently scattered across several modules.
> -
> -
>  # 3.6 workaround: can be removed when Python 3.7+ is our required version.
>  if TYPE_CHECKING:
>      _UserDict = UserDict[str, object]


