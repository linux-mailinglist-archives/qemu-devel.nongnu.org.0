Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997973D2F60
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 23:55:06 +0200 (CEST)
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6gen-0001s7-Ln
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 17:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m6gdN-0001Bd-PC
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 17:53:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m6gdL-0003NC-U0
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 17:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626990815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8pqxt3ulhKC+WBA4K3tvuOmJCkVdMCHjHdlOzP8MIC8=;
 b=akHUUMM4mxmBA/wGhRS5f2Ppd6TvspqNz+MLElx30y2X8jGKIR7JRo1JVgVRAlDuqTEuEm
 GHxzdxKrUXBdret5I3iDHaqftzNyiU3gZa0H2yxEkPf0cTH8JzF1PdVz6PcQrkWBELYOHy
 kV/Ychc2sVnb1ghFIgajlq/JGAlaINI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-fSOc1YXVOaudCRpopdAGrg-1; Thu, 22 Jul 2021 17:53:34 -0400
X-MC-Unique: fSOc1YXVOaudCRpopdAGrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8040802575;
 Thu, 22 Jul 2021 21:53:32 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A53F19D7C;
 Thu, 22 Jul 2021 21:53:25 +0000 (UTC)
References: <20210722192016.24915-1-peter.maydell@linaro.org>
 <20210722192016.24915-3-peter.maydell@linaro.org>
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.1 2/2] docs: Move licence/copyright from HTML
 output to rST comments
In-reply-to: <20210722192016.24915-3-peter.maydell@linaro.org>
Date: Thu, 22 Jul 2021 17:53:24 -0400
Message-ID: <87im1210dn.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Markus Armbruster <armbru@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell writes:

> Our built HTML documentation now has a standard footer which
> gives the license for QEMU (and its documentation as a whole).
> In almost all pages, we either don't bother to state the
> copyright/license for the individual rST sources, or we put
> it in an rST comment. There are just three pages which render
> copyright or license information into the user-visible HTML.
>
> Quoting a specific (different) license for an individual HTML
> page within the manual is confusing. Downgrade the license
> and copyright info to a comment within the rST source, bringing
> these pages in line with the rest of our documents.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/interop/vhost-user-gpu.rst |  7 ++++---
>  docs/interop/vhost-user.rst     | 12 +++++++-----
>  docs/system/generic-loader.rst  |  4 ++--
>  3 files changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Cleber Rosa <crosa@redhat.com>


