Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05E83AB0D2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:02:11 +0200 (CEST)
Received: from localhost ([::1]:44618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoqg-000807-Gv
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltoRT-0003b0-K0
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltoRR-0000rU-HI
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623922564;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJXf47sghUPROKHEKrt4zFRRrPSGi7W7pbcfeJ07Mrk=;
 b=cy7BMS9Q9H7JA5g74kmUrmJxo5GvsHWr8pVTSaShATsa0mzDipwjzYevrtRx+Q7gdQdHCg
 gF6LIgcG+6KoA2bmuWUUaJW7xz7huOmKUnyysrWg7wIEInJ7ffCCkczstO+RwozYMIKaI3
 VCD5Qc8r58l7acrBYUiAQFyNzaMmBus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-piP0MGI5OgKJn0DKSpzn2w-1; Thu, 17 Jun 2021 05:36:03 -0400
X-MC-Unique: piP0MGI5OgKJn0DKSpzn2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 063CC18A0728;
 Thu, 17 Jun 2021 09:36:02 +0000 (UTC)
Received: from redhat.com (ovpn-114-220.ams2.redhat.com [10.36.114.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED2C460FC2;
 Thu, 17 Jun 2021 09:36:00 +0000 (UTC)
Date: Thu, 17 Jun 2021 10:35:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 7/7] crypto: Make QCryptoTLSCreds* structures private
Message-ID: <YMsXfo+XQepqjXoQ@redhat.com>
References: <20210616162225.2517463-1-philmd@redhat.com>
 <20210616162225.2517463-8-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210616162225.2517463-8-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 06:22:25PM +0200, Philippe Mathieu-Daudé wrote:
> Code consuming the "crypto/tlscreds*.h" APIs doesn't need
> to access its internals. Move the structure definitions to
> the "tlscredspriv.h" private header (only accessible by
> implementations). The public headers (in include/) still
> forward-declare the structures typedef.
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
>  crypto/tlscredspriv.h              | 45 ++++++++++++++++++++++++++++++
>  include/crypto/tls-cipher-suites.h |  6 ----
>  include/crypto/tlscreds.h          | 16 -----------
>  include/crypto/tlscredsanon.h      | 12 --------
>  include/crypto/tlscredspsk.h       | 12 --------
>  include/crypto/tlscredsx509.h      | 10 -------
>  crypto/tls-cipher-suites.c         |  7 +++++
>  crypto/tlscredsanon.c              |  2 ++
>  crypto/tlscredspsk.c               |  2 ++
>  crypto/tlscredsx509.c              |  1 +
>  crypto/tlssession.c                |  1 +
>  11 files changed, 58 insertions(+), 56 deletions(-)
> 


> diff --git a/crypto/tlscredsanon.c b/crypto/tlscredsanon.c
> index bea5f76c55d..6fb83639ecd 100644
> --- a/crypto/tlscredsanon.c
> +++ b/crypto/tlscredsanon.c
> @@ -29,6 +29,8 @@
>  
>  #ifdef CONFIG_GNUTLS
>  
> +#include <gnutls/gnutls.h>
> +
>  
>  static int
>  qcrypto_tls_creds_anon_load(QCryptoTLSCredsAnon *creds,
> diff --git a/crypto/tlscredspsk.c b/crypto/tlscredspsk.c
> index f5a31108d15..752f2d92bee 100644
> --- a/crypto/tlscredspsk.c
> +++ b/crypto/tlscredspsk.c
> @@ -29,6 +29,8 @@
>  
>  #ifdef CONFIG_GNUTLS
>  
> +#include <gnutls/gnutls.h>
> +
>  static int
>  lookup_key(const char *pskfile, const char *username, gnutls_datum_t *key,
>             Error **errp)
> diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
> index d9d6f4421e5..32948a6bdc4 100644
> --- a/crypto/tlscredsx509.c
> +++ b/crypto/tlscredsx509.c
> @@ -30,6 +30,7 @@
>  
>  #ifdef CONFIG_GNUTLS
>  
> +#include <gnutls/gnutls.h>
>  #include <gnutls/x509.h>
>  
>

I was expecting all these files, and tlscreds.c to include
tlscredspriv.h, otherwise how do they see the struct
definition they need ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


