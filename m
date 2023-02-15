Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA049697A79
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:14:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFjC-0005NL-6q; Wed, 15 Feb 2023 06:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSFj9-0005N8-Ux
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSFj8-0004lV-Em
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676459609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=su8iceknaUOtT76bUSx6KnPGW6mm9i4i4lRlmz53fdI=;
 b=IYu1uULy7oFNaUwPMn51g9eIll5g/cxe+wEqyvIcxaRv2M9YSB8EtzCuaE8uNnw/kt9O/v
 556ZybHmRyE/1hRFI1g/A00oS5bVBSAPkTz7IX0BWSoVFHmtCr9Rs8XWSLkEMM+GFqKiHw
 jaLxVIeOjp2c3qK3feOnIrd5ZEu604c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-sIAaEU2jON2eBR0c4Q3gBg-1; Wed, 15 Feb 2023 06:13:26 -0500
X-MC-Unique: sIAaEU2jON2eBR0c4Q3gBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1FB31C07547;
 Wed, 15 Feb 2023 11:13:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E2B140EBF4;
 Wed, 15 Feb 2023 11:13:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8CABF21E6A1F; Wed, 15 Feb 2023 12:13:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v4 6/6] qapi: remove JSON value FIXME
References: <20230215000011.1725012-1-jsnow@redhat.com>
 <20230215000011.1725012-7-jsnow@redhat.com>
Date: Wed, 15 Feb 2023 12:13:24 +0100
In-Reply-To: <20230215000011.1725012-7-jsnow@redhat.com> (John Snow's message
 of "Tue, 14 Feb 2023 19:00:11 -0500")
Message-ID: <87zg9fb2qz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
> introspection data, remove this FIXME as no longer an action item.
>
> A third JSON-y data type, _ExprValue, is not meant to represent JSON in
> the abstract but rather only the possible legal return values from a
> single function, get_expr(). It isn't appropriate to attempt to merge it
> with either of the above two types.
>
> In theory, it may be possible to define a completely agnostic
> one-size-fits-all JSON type hierarchy that any other user could borrow -
> in practice, it's tough to wrangle the differences between invariant,
> covariant and contravariant types: input and output parameters demand
> different properties of such a structure.
>
> However, QAPIExpression serves to authoritatively type user input to the
> QAPI parser, while JSONValue serves to authoritatively type qapi
> generator *output* to be served back to client users at runtime via
> QMP. The AST for these two types are different and cannot be wholly
> merged into a unified syntax.
>
> They could, in theory, share some JSON primitive definitions. In
> practice, this is currently more trouble than it's worth with mypy's
> current expressive power. As such, declare this "done enough for now".
>
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


