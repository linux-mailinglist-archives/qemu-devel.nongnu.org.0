Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF163141F1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:36:32 +0100 (CET)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ECt-0004OW-76
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l98jK-00006y-4R
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:45:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l98jG-00028P-QZ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612799133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rpvQiA4/aKDmHvcBYhV5An0KjXtwsnZWQE8giqEomAY=;
 b=B1EMkIKuH7vnPXL9a0vGpwE15/NcXgmAVHkAVZYmXj90wAtEh0RMDklE017cmQJCKIs7Gw
 XY6fsFDZLQO71+rRkm8OQE8wDp/sdR6V7sDqICbgx+4dgykWZB/a+hNUqAS20LHCUfsCmv
 +539SgzInpHuKGINlA59J/1u/koDuBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-6R7lCg29O_WZvRmtNtUdTw-1; Mon, 08 Feb 2021 10:45:32 -0500
X-MC-Unique: 6R7lCg29O_WZvRmtNtUdTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 329893FDE
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 15:45:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00B0162467;
 Mon,  8 Feb 2021 15:45:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8BB02113865F; Mon,  8 Feb 2021 16:45:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 14/15] qapi/introspect.py: Add docstring to
 _tree_to_qlit
References: <20210204003207.2856909-1-jsnow@redhat.com>
 <20210204003207.2856909-15-jsnow@redhat.com>
Date: Mon, 08 Feb 2021 16:45:29 +0100
In-Reply-To: <20210204003207.2856909-15-jsnow@redhat.com> (John Snow's message
 of "Wed, 3 Feb 2021 19:32:06 -0500")
Message-ID: <878s7y36na.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 2a39726f40a..2b338abe2cf 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -97,6 +97,14 @@ def __init__(self, value: _NodeT, ifcond: Iterable[str],
>  def _tree_to_qlit(obj: TreeValue,
>                    level: int = 0,
>                    dict_value: bool = False) -> str:
> +    """
> +    Convert the type tree into a QLIT C string, recursively.
> +
> +    :param obj: The value to convert.
> +    :param level: The indentation level for this particular value.
> +    :param dict_value: True when the value being processed belongs to a
> +                       dict key; which suppresses the output indent.
> +    """
>  
>      def indent(level: int) -> str:
>          return level * 4 * ' '

Might want to mention @obj may not be Annotated when dict_value=True.
Not a demand.


