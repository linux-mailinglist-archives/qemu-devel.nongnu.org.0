Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B883A86F3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:55:57 +0200 (CEST)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCM0-0003Yo-Ps
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltCIx-0006Lk-Be
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltCIv-0006HK-DA
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775964;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFLHzohJTs6ntD/1l66rdpZO2FJ3oa4m0kNJ4V2A+/M=;
 b=dugLlp4xlOLE/oQ7cfuT1ZC+UmCNOLfR7gcRl2nbE9cmybYkql9yBFlyFHHLGu1gPvdTCd
 nRg+jn0EjAavda2hJwPnOWiEXpR5sJjtS2rIecWIUrsgj1s3oJ2b2V7aqf0i++BJ3OIea1
 pe2pLyhcFqB0eraCzBcXAJzO83wrRRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-CE69wVTKOlaq4lhutvRNmw-1; Tue, 15 Jun 2021 12:52:43 -0400
X-MC-Unique: CE69wVTKOlaq4lhutvRNmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 588438015D0;
 Tue, 15 Jun 2021 16:52:42 +0000 (UTC)
Received: from redhat.com (ovpn-115-226.ams2.redhat.com [10.36.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D52B15C1C2;
 Tue, 15 Jun 2021 16:52:36 +0000 (UTC)
Date: Tue, 15 Jun 2021 17:52:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 7/7] crypto: Make QCryptoTLSCreds* structures private
Message-ID: <YMja0SjeV06aUA7F@redhat.com>
References: <20210615164751.2192807-1-philmd@redhat.com>
 <20210615164751.2192807-8-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210615164751.2192807-8-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 06:47:51PM +0200, Philippe Mathieu-Daudé wrote:
> Code consuming the "crypto/tlscreds*.h" APIs doesn't need
> to access its internals. Move the structure definitions to
> the implementations in crypto/. The headers still forward
> declare the structures typedef.
> 
> This solves a bug introduced by commit 7de2e856533 which made
> migration/qemu-file-channel.c include "io/channel-tls.h",
> itself sometime depends on GNUTLS, leading to build failure
> on OSX:
> 
>   [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-channel.c.o
>   FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
>   cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/migration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
>   In file included from ../migration/qemu-file-channel.c:29:
>   In file included from include/io/channel-tls.h:26:
>   In file included from include/crypto/tlssession.h:24:
>   include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
>   #include <gnutls/gnutls.h>
>            ^~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
> Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  crypto/tlscredspriv.h         | 15 +++++++++++++++
>  include/crypto/tlscreds.h     | 16 ----------------
>  include/crypto/tlscredsanon.h | 12 ------------
>  include/crypto/tlscredspsk.h  | 12 ------------
>  include/crypto/tlscredsx509.h | 10 ----------
>  crypto/tlscredsanon.c         | 13 +++++++++++++
>  crypto/tlscredspsk.c          | 14 ++++++++++++++
>  crypto/tlscredsx509.c         | 16 +++++++++++++---
>  8 files changed, 55 insertions(+), 53 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


