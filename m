Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153163A8772
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:22:48 +0200 (CEST)
Received: from localhost ([::1]:57710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCly-00020N-3q
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltCl4-0001C0-0m
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:21:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltCl1-0007oQ-CC
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623777706;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bINDTnj1wL+zALOOng+g29hNC05+h5ZHJsVFCN9R/0=;
 b=dh6jL+Z0upLw0T9p2UZnnyWUO400xFUtle8orTLo+G40dylLXCrZKJwbU4Ncr9TDpEJuXT
 myKmkAqnxGSqMe4D5jw0Be2p0LOkusRalSg3pdmGfGQW5400tjoJai6dsjICAGsuaGGpQO
 JBWN4JSXfXK2LW9WSxCyi9gH99lmfxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-4xbKmbFVMpWV5bOTK-XGFg-1; Tue, 15 Jun 2021 13:21:45 -0400
X-MC-Unique: 4xbKmbFVMpWV5bOTK-XGFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD019801B1A;
 Tue, 15 Jun 2021 17:21:43 +0000 (UTC)
Received: from redhat.com (ovpn-115-226.ams2.redhat.com [10.36.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84D7B1971B;
 Tue, 15 Jun 2021 17:21:38 +0000 (UTC)
Date: Tue, 15 Jun 2021 18:21:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 7/7] crypto: Make QCryptoTLSCreds* structures private
Message-ID: <YMjhny52SrKrOkE8@redhat.com>
References: <20210615164751.2192807-1-philmd@redhat.com>
 <20210615164751.2192807-8-philmd@redhat.com>
 <YMja0SjeV06aUA7F@redhat.com>
 <33a34588-a878-74c4-6d84-833ceeb45c52@redhat.com>
MIME-Version: 1.0
In-Reply-To: <33a34588-a878-74c4-6d84-833ceeb45c52@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jun 15, 2021 at 07:16:17PM +0200, Philippe Mathieu-Daudé wrote:
> On 6/15/21 6:52 PM, Daniel P. Berrangé wrote:
> > On Tue, Jun 15, 2021 at 06:47:51PM +0200, Philippe Mathieu-Daudé wrote:
> >> Code consuming the "crypto/tlscreds*.h" APIs doesn't need
> >> to access its internals. Move the structure definitions to
> >> the implementations in crypto/. The headers still forward
> >> declare the structures typedef.
> >>
> >> This solves a bug introduced by commit 7de2e856533 which made
> >> migration/qemu-file-channel.c include "io/channel-tls.h",
> >> itself sometime depends on GNUTLS, leading to build failure
> >> on OSX:
> >>
> >>   [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-channel.c.o
> >>   FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
> >>   cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/migration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
> >>   In file included from ../migration/qemu-file-channel.c:29:
> >>   In file included from include/io/channel-tls.h:26:
> >>   In file included from include/crypto/tlssession.h:24:
> >>   include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
> >>   #include <gnutls/gnutls.h>
> >>            ^~~~~~~~~~~~~~~~~
> >>   1 error generated.
> >>
> >> Reported-by: Stefan Weil <sw@weilnetz.de>
> >> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
> >> Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>  crypto/tlscredspriv.h         | 15 +++++++++++++++
> >>  include/crypto/tlscreds.h     | 16 ----------------
> >>  include/crypto/tlscredsanon.h | 12 ------------
> >>  include/crypto/tlscredspsk.h  | 12 ------------
> >>  include/crypto/tlscredsx509.h | 10 ----------
> >>  crypto/tlscredsanon.c         | 13 +++++++++++++
> >>  crypto/tlscredspsk.c          | 14 ++++++++++++++
> >>  crypto/tlscredsx509.c         | 16 +++++++++++++---
> >>  8 files changed, 55 insertions(+), 53 deletions(-)
> > 
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Thanks, however I missed something:
> 
> crypto/tlssession.c: In function ‘qcrypto_tls_session_new’:
> crypto/tlssession.c:163:48: error: invalid use of incomplete typedef
> ‘QCryptoTLSCredsAnon’
>   163 |                                          acreds->data.server);
>       |                                                ^~
> crypto/tlssession.c:167:48: error: invalid use of incomplete typedef
> ‘QCryptoTLSCredsAnon’
>   167 |                                          acreds->data.client);
>       |                                                ^~
> crypto/tlssession.c:201:48: error: invalid use of incomplete typedef
> ‘QCryptoTLSCredsPSK’
>   201 |                                          pcreds->data.server);
>       |                                                ^~
> crypto/tlssession.c:205:48: error: invalid use of incomplete typedef
> ‘QCryptoTLSCredsPSK’
>   205 |                                          pcreds->data.client);
>       |                                                ^~
> crypto/tlssession.c:228:44: error: invalid use of incomplete typedef
> ‘QCryptoTLSCredsX509’
>   228 |                                      tcreds->data);
>       |                                            ^~

Ah, yes, the tls session code needs to peer at the tlscred data.

We could have a 'crypto/tlscredspriv.h' header that declares
some accessors for getting this data from tls session.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


