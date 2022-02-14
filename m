Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF4B4B546F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:19:12 +0100 (CET)
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJd8A-0001MH-Rr
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:19:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nJbm1-0004D7-HO
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:52:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nJblz-0000km-3I
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644846730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w2fk+GeY3EqxJ2Pzt1S00aVR0RcOy8yQ02RH42j/80k=;
 b=hAFASGdKL1WF3VIIZZvFQrBiSmDLj3dckGcZ3t2eUBaTRoowgiEWVu5zBR/z+skr8oAjEm
 FO/qxN0AdcDsaSach3I/+CTACFqe6ILrMaR6P5/hOckP7i3J4cuGRETv56VnBoOhtMdkL1
 /e/mR1gllvoFVlaItm3SlwPtCGvL6xM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-iMG53Bz8Or6y4A21PpwuuA-1; Mon, 14 Feb 2022 08:52:09 -0500
X-MC-Unique: iMG53Bz8Or6y4A21PpwuuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 826551091DA2;
 Mon, 14 Feb 2022 13:52:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8021091ED0;
 Mon, 14 Feb 2022 13:52:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 30B8C21E65E6; Mon, 14 Feb 2022 14:52:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2] scripts/qapi: minor delinting
References: <20220211183650.2946895-1-jsnow@redhat.com>
Date: Mon, 14 Feb 2022 14:52:01 +0100
In-Reply-To: <20220211183650.2946895-1-jsnow@redhat.com> (John Snow's message
 of "Fri, 11 Feb 2022 13:36:50 -0500")
Message-ID: <87r185imim.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Get isort and pylint tools passing again.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/commands.py |  2 +-
>  scripts/qapi/pylintrc    | 15 +++++----------
>  scripts/qapi/types.py    |  6 +++++-
>  scripts/qapi/visit.py    |  6 +++++-
>  4 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 869d799ed22..38ca38a7b9d 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -25,8 +25,8 @@
>      QAPIGenC,
>      QAPISchemaModularCVisitor,
>      build_params,
> -    ifcontext,
>      gen_special_features,
> +    ifcontext,
>  )
>  from .schema import (
>      QAPISchema,
> diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
> index b259531a726..1fed2e69620 100644
> --- a/scripts/qapi/pylintrc
> +++ b/scripts/qapi/pylintrc
> @@ -34,16 +34,11 @@ disable=fixme,
>  
>  [BASIC]
>  
> -# Good variable names which should always be accepted, separated by a comma.
> -good-names=i,
> -           j,
> -           k,
> -           ex,
> -           Run,
> -           _,
> -           fp,  # fp = open(...)
> -           fd,  # fd = os.open(...)
> -           ch,
> +# Good variable names regexes, separated by a comma. If names match any regex,
> +# they will always be accepted
> +
> +# Allow just about anything, as per Markus's preference.

Does it still flag PEP-8 violations like all lower case class names?

If yes, "just about any length" is more precise.

> +good-names-rgxs=^[_a-z][_a-z0-9]?$
>  
>  [VARIABLES]
>  
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index 3013329c248..477d0270013 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -16,7 +16,11 @@
>  from typing import List, Optional
>  
>  from .common import c_enum_const, c_name, mcgen
> -from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
> +from .gen import (
> +    QAPISchemaModularCVisitor,
> +    gen_special_features,
> +    ifcontext,
> +)
>  from .schema import (
>      QAPISchema,
>      QAPISchemaEnumMember,
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index e13bbe42925..380fa197f58 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -21,7 +21,11 @@
>      indent,
>      mcgen,
>  )
> -from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
> +from .gen import (
> +    QAPISchemaModularCVisitor,
> +    gen_special_features,
> +    ifcontext,
> +)
>  from .schema import (
>      QAPISchema,
>      QAPISchemaEnumMember,


