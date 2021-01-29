Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A03087AA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 11:07:56 +0100 (CET)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Qh1-0000tl-KB
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 05:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Qfi-0000Pe-Rc
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:06:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Qfg-0000aS-N1
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:06:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611914791;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6lt0sTRlk3I2lOlUSJICg/rt/wl6wklz9Ok26HJJ3fo=;
 b=UM8udqFQxB0vNUCFaeQUNvy4+m/sBIK8mrpxDicMFsRaLKrwDHDDk8L6QIDNsvmVzth1TP
 uKPy5QQ1PTgvFsSixEyUa83mF6T30PNZ/YKMp/mF2k/UPmT6ruoV/Zv58K1K+3bSn+N7yf
 Pfh7w0/v4gsB9WTYwpvsXwwK4Ksz/OQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-ibPsXEC-PwapfQH9XB-uiQ-1; Fri, 29 Jan 2021 05:06:29 -0500
X-MC-Unique: ibPsXEC-PwapfQH9XB-uiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2C711842141;
 Fri, 29 Jan 2021 10:06:28 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A373E5D9C0;
 Fri, 29 Jan 2021 10:06:27 +0000 (UTC)
Date: Fri, 29 Jan 2021 10:06:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] tests: Replace deprecated ASN1 code
Message-ID: <20210129100624.GE4001740@redhat.com>
References: <20210128171523.45921-1-sw@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <20210128171523.45921-1-sw@weilnetz.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 06:15:23PM +0100, Stefan Weil wrote:
> This fixes several compiler warnings on MacOS with Homebrew.

Could you give an example of the warnings seen as I'm wondering
why we won't have seen them already on other platforms ? 

> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  tests/crypto-tls-x509-helpers.c | 10 +++++-----
>  tests/crypto-tls-x509-helpers.h |  2 +-
>  tests/pkix_asn1_tab.c           |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/crypto-tls-x509-helpers.c b/tests/crypto-tls-x509-helpers.c
> index 01b3daf358..97658592a2 100644
> --- a/tests/crypto-tls-x509-helpers.c
> +++ b/tests/crypto-tls-x509-helpers.c
> @@ -30,7 +30,7 @@
>   * This stores some static data that is needed when
>   * encoding extensions in the x509 certs
>   */
> -ASN1_TYPE pkix_asn1;
> +asn1_node pkix_asn1;
>  
>  /*
>   * To avoid consuming random entropy to generate keys,
> @@ -139,7 +139,7 @@ void test_tls_cleanup(const char *keyfile)
>  /*
>   * Turns an ASN1 object into a DER encoded byte array
>   */
> -static void test_tls_der_encode(ASN1_TYPE src,
> +static void test_tls_der_encode(asn1_node src,
>                                  const char *src_name,
>                                  gnutls_datum_t *res)
>  {
> @@ -317,7 +317,7 @@ test_tls_generate_cert(QCryptoTLSTestCertReq *req,
>       * the 'critical' field which we want control over
>       */
>      if (req->basicConstraintsEnable) {
> -        ASN1_TYPE ext = ASN1_TYPE_EMPTY;
> +        asn1_node ext = NULL;
>  
>          asn1_create_element(pkix_asn1, "PKIX1.BasicConstraints", &ext);
>          asn1_write_value(ext, "cA",
> @@ -344,7 +344,7 @@ test_tls_generate_cert(QCryptoTLSTestCertReq *req,
>       * to be 'critical'
>       */
>      if (req->keyUsageEnable) {
> -        ASN1_TYPE ext = ASN1_TYPE_EMPTY;
> +        asn1_node ext = NULL;
>          char str[2];
>  
>          str[0] = req->keyUsageValue & 0xff;
> @@ -374,7 +374,7 @@ test_tls_generate_cert(QCryptoTLSTestCertReq *req,
>       * set this the hard way building up ASN1 data ourselves
>       */
>      if (req->keyPurposeEnable) {
> -        ASN1_TYPE ext = ASN1_TYPE_EMPTY;
> +        asn1_node ext = NULL;
>  
>          asn1_create_element(pkix_asn1, "PKIX1.ExtKeyUsageSyntax", &ext);
>          if (req->keyPurposeOID1) {
> diff --git a/tests/crypto-tls-x509-helpers.h b/tests/crypto-tls-x509-helpers.h
> index 08efba4e19..8fcd7785ab 100644
> --- a/tests/crypto-tls-x509-helpers.h
> +++ b/tests/crypto-tls-x509-helpers.h
> @@ -125,7 +125,7 @@ void test_tls_cleanup(const char *keyfile);
>      };                                                                  \
>      test_tls_generate_cert(&varname, NULL)
>  
> -extern const ASN1_ARRAY_TYPE pkix_asn1_tab[];
> +extern const asn1_static_node pkix_asn1_tab[];
>  
>  #endif /* QCRYPTO_HAVE_TLS_TEST_SUPPORT */
>  
> diff --git a/tests/pkix_asn1_tab.c b/tests/pkix_asn1_tab.c
> index f15fc515cb..4aaf736d3f 100644
> --- a/tests/pkix_asn1_tab.c
> +++ b/tests/pkix_asn1_tab.c
> @@ -8,7 +8,7 @@
>  
>  #ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
>  
> -const ASN1_ARRAY_TYPE pkix_asn1_tab[] = {
> +const asn1_static_node pkix_asn1_tab[] = {
>    {"PKIX1", 536875024, 0},
>    {0, 1073741836, 0},
>    {"id-ce", 1879048204, 0},
> -- 
> 2.24.3 (Apple Git-128)
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


