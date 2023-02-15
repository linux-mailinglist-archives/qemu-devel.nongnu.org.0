Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9C0697738
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 08:15:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSC0e-0001bC-Jq; Wed, 15 Feb 2023 02:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSC0W-0001Zd-AL
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:15:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSC0T-00078U-8t
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676445306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7nxUtAZf1XFJXqjzcLaPLpETzbdkmjZV0V1x7ao7t20=;
 b=Wjc9frTvpBRcYOcggM5tH3TE6MBmERow6qlLsXXU/jTuukXXGWlOf4IPKvS2gPdVjTeuo6
 X/wARJ0aaUKFTDg+b4SwHeYNdpKTNLCHAEYGkrPozBPwsaR+QC0SmgtR2Kjb1VZitM4JuD
 C/iPnZQhbe0O9pFkSO6HN+noqP8KEQw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-zXAZXWReOGqkh2VmbYmwsA-1; Wed, 15 Feb 2023 02:15:03 -0500
X-MC-Unique: zXAZXWReOGqkh2VmbYmwsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A782085C70F;
 Wed, 15 Feb 2023 07:15:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B6FF18EC2;
 Wed, 15 Feb 2023 07:15:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6BC8421E6A1F; Wed, 15 Feb 2023 08:15:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v4 3/6] qapi: Add minor typing workaround for 3.6
References: <20230215000011.1725012-1-jsnow@redhat.com>
 <20230215000011.1725012-4-jsnow@redhat.com>
Date: Wed, 15 Feb 2023 08:15:01 +0100
In-Reply-To: <20230215000011.1725012-4-jsnow@redhat.com> (John Snow's message
 of "Tue, 14 Feb 2023 19:00:08 -0500")
Message-ID: <87a61fe6x6.fsf@pond.sub.org>
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

> Pylint under 3.6 does not believe that Collection is subscriptable at
> runtime. It is, making this a Pylint
> bug. https://github.com/PyCQA/pylint/issues/2377
>
> They closed it as fixed, but that doesn't seem to be true as of Pylint
> 2.13.9, the latest version you can install under Python 3.6. 2.13.9 was
> released 2022-05-13, about seven months after the bug was closed.
>
> The least-annoying fix here is to just use the more specific type
> Sequence, only because it seems to work in 3.6.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 5a1782b57ea..8701351fdfc 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -33,11 +33,11 @@
>  
>  import re
>  from typing import (
> -    Collection,
>      Dict,
>      Iterable,
>      List,
>      Optional,
> +    Sequence,
>      Union,
>      cast,
>  )
> @@ -195,8 +195,8 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
>  def check_keys(value: _JSONObject,
>                 info: QAPISourceInfo,
>                 source: str,
> -               required: Collection[str],
> -               optional: Collection[str]) -> None:
> +               required: Sequence[str],
> +               optional: Sequence[str]) -> None:
>      """
>      Ensure that a dict has a specific set of keys.

The actual arguments are always List[str].  You actually used that until
v3 of the patch, and switched to the maximally general Collection[str]
in v4, with rationale that ended up in commit 538cd41065a:

    qapi/expr.py: Modify check_keys to accept any Collection
    
    This is a minor adjustment that lets parameters @required and
    @optional take tuple arguments, in particular ().  Later patches will
    make use of that.

No later patch ever did.

I'd prefer maximally stupid List[str], but it's no big deal either way.


