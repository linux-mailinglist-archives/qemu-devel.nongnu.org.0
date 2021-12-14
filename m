Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D61474391
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:35:14 +0100 (CET)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7xZ-0002Ko-9R
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:35:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx7fm-0002aN-Bx
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:16:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx7fi-0001fT-SV
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639487806;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=unxZaWDM2rRqRdhasV7af5VjEAahS6xBHsDc9cj9Gcc=;
 b=b9SEVEvJAD++pyjUCr3ARsmAJkLtCRMyUQITXmpMM1zMhlVT3ZYn9fDgy2nvOuolc+4Mq7
 kdz2uyK0IPTtY5BkU1Q8DYTDe95mxFvICkVnFFdLVNODXK5uJ5ycHQ3xIAg7D5xLwuytYS
 qLIUf+frD6uT1Qee824+i9ceroHRKDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-A_Ap2lRwO3eA4gBBtp2swQ-1; Tue, 14 Dec 2021 08:16:41 -0500
X-MC-Unique: A_Ap2lRwO3eA4gBBtp2swQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AB588042E1;
 Tue, 14 Dec 2021 13:16:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71671100EBAD;
 Tue, 14 Dec 2021 13:16:39 +0000 (UTC)
Date: Tue, 14 Dec 2021 13:16:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Henry Kleynhans <henry.kleynhans@gmail.com>
Subject: Re: [PATCH] Relax X509 CA cert sanity checking
Message-ID: <YbiZNMxfHFRZFjFS@redhat.com>
References: <20211214113930.9205-1-henry.kleynhans@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211214113930.9205-1-henry.kleynhans@gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: Henry Kleynhans <hkleynhans@fb.com>, qemu-devel@nongnu.org,
 henry.kleynhans@fb.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 11:39:30AM +0000, Henry Kleynhans wrote:
> From: Henry Kleynhans <hkleynhans@fb.com>
> 
> The sanity checking function attempts to validate all the certificates
> in the provided CA file.  These checks are performed on certificates
> which may or may not be part of the signing chain and duplicates checks
> that should be performed by the TLS library.
> 
> In real life this causes a problem if the certificate chain I want to
> use is valid, but there exist another expired certificate in the CA
> file.
> 
> This patch relaxes the sanity checks to only ensure we have at least one
> valid certificate in the CA certificate file and leave the actual
> validation to the TLS library.

IIUC your scenario is that you have something like

   Root CA -> Sub CA1 ---> Server Cert
      \                \-> Client Cert
       \---> Sub CA2

And the ca-cert.pem file given to QEMU contains all of 'Root CA',
'Sub CA1' and 'Sub CA2', despite 'Sub CA2' being irrelevant
from POV of QEMU's needs for the chain of trust.

Now 'Sub CA2' is expired so QEMU is rejecting the entire
'ca-cert.pem' at startup.

Your suggested change makes it so that we only validate that
one of these three certs is OK, so if 'Sub CA2' is expired
it dosn't block startup.

The trouble is that this equally ignores problems if 'Sub CA1'
is expired (or otherwise invalid), which is exactly the
scenario that we're aiming to detect.


TLS certificate config mistakes are an incredibly common
problem and the error reporting when this happens at time
of TLS session handshake is terrible. This leads to a 
stream of support requests from users wondering why their
TLS sessions won't establish, which are very hard for us
to debug as maintainers. The validation made a significant
difference to this by giving users clearer error reports
upfront instead of letting QEMU startup with a broken
TLS cert setup.

Thus I'm loathe to relax the validation in the way proposed
here.

Is there a reason you aren't able to just set the
property  'validate=off' on the tls-creds-x509 object
to skip the validation in the case where you know your
CA bundle is valid overall, but contains broken certs ?


> 
> Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
> ---
>  crypto/tlscredsx509.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
> index 32948a6bdc..fb056f96a2 100644
> --- a/crypto/tlscredsx509.c
> +++ b/crypto/tlscredsx509.c
> @@ -473,6 +473,7 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
>      gnutls_x509_crt_t cert = NULL;
>      gnutls_x509_crt_t cacerts[MAX_CERTS];
>      size_t ncacerts = 0;
> +    size_t nvalidca = 0;
>      size_t i;
>      int ret = -1;
>  
> @@ -505,11 +506,15 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
>      for (i = 0; i < ncacerts; i++) {
>          if (qcrypto_tls_creds_check_cert(creds,
>                                           cacerts[i], cacertFile,
> -                                         isServer, true, errp) < 0) {
> -            goto cleanup;
> +                                         isServer, true, errp) == 0) {
> +            ++nvalidca;
>          }
>      }
>  
> +    if (nvalidca == 0) {
> +        goto cleanup;
> +    }
> +
>      if (cert && ncacerts &&
>          qcrypto_tls_creds_check_cert_pair(cert, certFile, cacerts,
>                                            ncacerts, cacertFile,
> -- 
> 2.34.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


