Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362714083C4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 07:21:50 +0200 (CEST)
Received: from localhost ([::1]:46802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPePc-0007Nt-MR
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 01:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPeOT-0006cx-Iz
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 01:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPeOQ-0003gd-6T
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 01:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631510432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bnSpPcAqiTnRvlorRLog+NoEyE56+oRjwvrbqSSnCOY=;
 b=DDkqT9XqIKc2mK1xI6k6aiAegTjFYLeCgcbkRMJAr/hmedKvio18ByYBVl4xvFtoRQ9sky
 PItgJPdWRAiigPcYFwSnnApGObvUU/Dd7NXemJtWtmrK5GfjgHtL+AaNbj2FSba1gYoReO
 pIwc8zvxFv6Ycnp+56Ys+QZwqFTH7Qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-GZq1QqcyMmKC1TgWWq7QfA-1; Mon, 13 Sep 2021 01:20:28 -0400
X-MC-Unique: GZq1QqcyMmKC1TgWWq7QfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9BBC1084697
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:20:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79D0210013C1;
 Mon, 13 Sep 2021 05:20:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E0A06113865F; Mon, 13 Sep 2021 07:20:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] docs: link to archived Fedora code of conduct
References: <20210912124825.502929-1-pbonzini@redhat.com>
Date: Mon, 13 Sep 2021 07:20:25 +0200
In-Reply-To: <20210912124825.502929-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Sun, 12 Sep 2021 14:48:25 +0200")
Message-ID: <87mtoh59wm.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Fedora has switched to a different CoC.  QEMU's own code of conduct
> is based on the previous version and cites it as a source.  Replace
> the link with one to the Wayback Machine.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/devel/code-of-conduct.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/devel/code-of-conduct.rst b/docs/devel/code-of-conduct.rst
> index 277b5250d1..195444d1b4 100644
> --- a/docs/devel/code-of-conduct.rst
> +++ b/docs/devel/code-of-conduct.rst
> @@ -55,6 +55,6 @@ Sources
>  -------
>  
>  This document is based on the `Fedora Code of Conduct
> -<https://fedoraproject.org/code-of-conduct>`__ and the
> -`Contributor Covenant version 1.3.0
> +<http://web.archive.org/web/20210429132536/https://docs.fedoraproject.org/en-US/project/code-of-conduct/>`__
> +(as of April 2021) and the `Contributor Covenant version 1.3.0
>  <https://www.contributor-covenant.org/version/1/3/0/code-of-conduct/>`__.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


