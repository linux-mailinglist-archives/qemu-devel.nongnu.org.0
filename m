Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B87431D710
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 10:41:59 +0100 (CET)
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCJLI-0003if-60
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 04:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCJIz-000224-O8
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 04:39:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCJIx-0003EW-ED
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 04:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613554769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QkwfR3ajntAC9Gb12vz98nltDgVZpC3dBeti4FkE3i8=;
 b=FRCvxI8iE/3qybTAjWecpAo0kxcYI72V4tkXv5TzdaOcz20dkLByBJVE9n16PGuJi54Ag5
 V4nKzy37hg1glkftTwQTvWo621iD/XAcYFauiyihdPyKI/G/C8HMjDl3puD591qZaN9Hdn
 Zh70vqhUw/65+xdVsbp1PbnRTRzBeTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-OtEYVjGtNDusTv5lYUaUFQ-1; Wed, 17 Feb 2021 04:39:27 -0500
X-MC-Unique: OtEYVjGtNDusTv5lYUaUFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 852A4100CC93;
 Wed, 17 Feb 2021 09:39:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EA9777701;
 Wed, 17 Feb 2021 09:39:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A10EA113860F; Wed, 17 Feb 2021 10:39:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 15/19] qapi/introspect.py: Add docstrings to
 _gen_tree and _tree_to_qlit
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-16-jsnow@redhat.com>
Date: Wed, 17 Feb 2021 10:39:24 +0100
In-Reply-To: <20210216021809.134886-16-jsnow@redhat.com> (John Snow's message
 of "Mon, 15 Feb 2021 21:18:05 -0500")
Message-ID: <875z2r6njn.fsf@dusky.pond.sub.org>
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

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 45284af1330..5d4f5e23f7e 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -99,6 +99,15 @@ def __init__(self, value: _ValueT, ifcond: Iterable[str],
>  def _tree_to_qlit(obj: JSONValue,
>                    level: int = 0,
>                    dict_value: bool = False) -> str:
> +    """
> +    Convert the type tree into a QLIT C string, recursively.
> +
> +    :param obj: The value to convert.
> +                This value may not be Annotated when dict_value is True.
> +    :param level: The indentation level for this particular value.
> +    :param dict_value: True when the value being processed belongs to a
> +                       dict key; which suppresses the output indent.
> +    """
>  
>      def indent(level: int) -> str:
>          return level * 4 * ' '
> @@ -244,6 +253,15 @@ def _gen_features(features: List[QAPISchemaFeature]
>      def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
>                    ifcond: Sequence[str],
>                    features: Optional[List[QAPISchemaFeature]]) -> None:
> +        """
> +        Build and append a SchemaInfo object to self._trees.
> +
> +        :param name: The entity's name.
> +        :param mtype: The entity's meta-type.
> +        :param obj: Additional entity fields, as appropriate for the meta-type.

"Additional members", since we're talking about a JSON object.

> +        :param ifcond: Sequence of conditionals that apply to this entity.
> +        :param features: Optional features field for SchemaInfo.

Likewise.

Sure we want to restate parts of the type ("Sequence of", "Optional") in
the doc string?

> +        """
>          comment: Optional[str] = None
>          if mtype not in ('command', 'event', 'builtin', 'array'):
>              if not self._unmask:

Also: more line-wrapping for PEP 8.


