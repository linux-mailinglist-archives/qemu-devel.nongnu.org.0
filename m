Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0720B377FAD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:42:54 +0200 (CEST)
Received: from localhost ([::1]:56316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2RA-0004Y6-Rq
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg2Ph-0003fh-Ds
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg2Pe-00051I-7B
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620639676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NCipegUD05WQO6aTwTM2EOUtuWQxr97XKGV64eQ6V+8=;
 b=ZgsDrgzwZVbbK6xM+A7IqKgbXu2x/HKNyEmfpvQ9tRG/TpAMuoYGIR9mGM2q6V/qURN8Wg
 nCjptsDNxGmnYR7UKDi/uqyy9JcpbwVUe5rcqbBzgwkFdxV6e4i0lz8TzTVjfEkHXvoqnw
 lSDpoLAaEbPyzjyUlnQjOKnCQPFOUUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-5Kbbx24ZOgy2xjz55GfZwQ-1; Mon, 10 May 2021 05:41:14 -0400
X-MC-Unique: 5Kbbx24ZOgy2xjz55GfZwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05A456D586;
 Mon, 10 May 2021 09:41:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE9575F9A6;
 Mon, 10 May 2021 09:41:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A4D7918000B9; Mon, 10 May 2021 11:41:09 +0200 (CEST)
Date: Mon, 10 May 2021 11:41:09 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH trivial] vnc: spelling fix (enable->enabled)
Message-ID: <20210510094109.bjyu4dnmsqeaix4s@sirius.home.kraxel.org>
References: <20210508092558.351102-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <20210508092558.351102-1-mjt@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 08, 2021 at 12:25:58PM +0300, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 456db47d71..2bea46b2b3 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -598,3 +598,3 @@ bool vnc_display_reload_certs(const char *id, Error **errp)
>      if (!vd->tlscreds) {
> -        error_setg(errp, "vnc tls is not enable");
> +        error_setg(errp, "vnc tls is not enabled");

Added to ui queue.

thanks,
  Gerd


