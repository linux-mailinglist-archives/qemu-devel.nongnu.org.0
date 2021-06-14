Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942883A5E7A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:39:30 +0200 (CEST)
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsi81-00038b-JT
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lshzY-0003Z2-Rg
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lshzW-0006Tn-IG
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623659441;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZwIlYZWXOp5Rd/yX/OtVQ9Ot0plMM0zOAOaGzF8R9c=;
 b=d40zX1YNpKqLkJ6LqATta/wVaN6pHP9NzzJ5tJ001Fk9J9yveip0qZ1eeDTzxNxI/TQvNW
 Rjg0hpIxJhP/HesChlIirqwmZyUBy6ZeHd0S30wnyt6+nftaaLDw+nWRszUwP6g3T6Jv9O
 h6UObjALZ23Yhb8LfQaJqBSZG/HTp6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-acE7d2EWP7KCw7VbwiI9cg-1; Mon, 14 Jun 2021 04:30:38 -0400
X-MC-Unique: acE7d2EWP7KCw7VbwiI9cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90428EC1A7;
 Mon, 14 Jun 2021 08:30:36 +0000 (UTC)
Received: from redhat.com (ovpn-115-55.ams2.redhat.com [10.36.115.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15EE360C4A;
 Mon, 14 Jun 2021 08:30:30 +0000 (UTC)
Date: Mon, 14 Jun 2021 09:30:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH] migration: Add missing dependency on GNUTLS
Message-ID: <YMcTpO2SlVSc/HCR@redhat.com>
References: <20210614052623.1657103-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210614052623.1657103-1-f4bug@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14, 2021 at 07:26:23AM +0200, Philippe Mathieu-Daudé wrote:
> Commit 7de2e856533 made migration/qemu-file-channel.c include
> "io/channel-tls.h" but forgot to add the new GNUTLS dependency
> on Meson, leading to build failure on OSX:
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
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
> Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC: Not tested on OSX. Stefan, do you know why this isn't covered
>      on Cirrus-CI?  https://cirrus-ci.com/build/4876003651616768
> ---
>  migration/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


