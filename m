Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B32DBCAC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 09:28:00 +0100 (CET)
Received: from localhost ([::1]:53206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSAB-0008Od-PN
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 03:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpS8i-0007I9-Ty
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:26:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpS8e-0000qM-Li
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608107183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F+3b44Hlneg7HDUNCM3QOvh7QF1AIzt4x9YSBCjtJuY=;
 b=BhpjHCrt+jBAZeBH4UHGJMR3tFblZK1+i0VpK+EfS4zcvXVecCc5kpttnFaf/FhfO8wl1G
 7dJn2Vxk9H17JIH8BWD2Yw2t5+4bgQAARGK3sR646zVYzf/7G4QfqZzRDCy6OxjkZVXsF4
 gJeTYVKy+Bja/ijtKgmKRhXPdLBkTi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-OiJGvkv3NBqJwAhChVjPeA-1; Wed, 16 Dec 2020 03:26:21 -0500
X-MC-Unique: OiJGvkv3NBqJwAhChVjPeA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFF0B107ACFA
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:26:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3511B10023B6;
 Wed, 16 Dec 2020 08:26:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9DA9F11329A5; Wed, 16 Dec 2020 09:26:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 04/12] qapi/gen: assert that _start_if is not None in
 _wrap_ifcond
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-5-jsnow@redhat.com>
Date: Wed, 16 Dec 2020 09:26:15 +0100
In-Reply-To: <20201214235327.1007124-5-jsnow@redhat.com> (John Snow's message
 of "Mon, 14 Dec 2020 18:53:19 -0500")
Message-ID: <87a6uetavs.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> We already assert this in end_if, but that's opaque to mypy. Do it in
> _wrap_ifcond instead. Same effect at runtime, but mypy can now infer
> the type in _wrap_ifcond's body.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/gen.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index b40f18eee3cd..a6dc991b1d03 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -130,11 +130,11 @@ def start_if(self, ifcond: List[str]) -> None:
>          self._start_if = (ifcond, self._body, self._preamble)
>  
>      def end_if(self) -> None:
> -        assert self._start_if
>          self._wrap_ifcond()
>          self._start_if = None
>  
>      def _wrap_ifcond(self) -> None:
> +        assert self._start_if
>          self._body = _wrap_ifcond(self._start_if[0],
>                                    self._start_if[1], self._body)
>          self._preamble = _wrap_ifcond(self._start_if[0],

Drawback: the public method's precondition is now more opaque.  Do we
care?


