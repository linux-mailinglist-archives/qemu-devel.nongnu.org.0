Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B833C1A62
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:09:52 +0200 (CEST)
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aLH-00058D-V5
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1a2y-0003CL-P8
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:50:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1a2v-00009b-7B
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625773851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4Ob2mQSlUGFSEujxsUFaT92b+qZ/8rURZ+kGJHtBZc=;
 b=PsrPUnP7qLLEbQL5XMkM+KQ9g972DmC+y65LO+KgiMZuHgyIU3swAceL9mix/31M37bai9
 FJU4nBJnv6vUqQJhBN4klxrqoBTnQjTKnJZl31VdgC1zC2Pg5OFyxIWnajB6oj+QBGis1W
 KJ05HK4jiR+sNWXwcDH4Hab+kfnii/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-JvhI6e7zNdOx50qMZRcSwQ-1; Thu, 08 Jul 2021 15:50:50 -0400
X-MC-Unique: JvhI6e7zNdOx50qMZRcSwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F10F9106B7D6
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 19:50:49 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8BE5D6B1;
 Thu,  8 Jul 2021 19:50:46 +0000 (UTC)
Date: Thu, 8 Jul 2021 14:50:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 11/18] crypto: rename des-rfb cipher to just des
Message-ID: <20210708195044.rbod3lyzh4lklobx@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-12-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210706095924.764117-12-berrange@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 06, 2021 at 10:59:17AM +0100, Daniel P. Berrangé wrote:
> Currently the crypto layer exposes support for a 'des-rfb'
> algorithm which is just normal single-DES, with the bits
> in each key byte reversed. This special key munging is
> required by the RFB protocol password authentication
> mechanism.
> 
> Since the crypto layer is generic shared code, it makes
> more sense to do the key byte munging in the VNC server
> code, and expose normal single-DES support.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

I agree with Markus' suggestion to enhance the commit message.

> +++ b/tests/unit/test-crypto-cipher.c
> @@ -155,28 +155,28 @@ static QCryptoCipherTestData test_data[] = {
>           * in single AES block, and gives identical
>           * ciphertext in ECB and CBC modes
>           */
> -        .path = "/crypto/cipher/des-rfb-ecb-56-one-block",
> -        .alg = QCRYPTO_CIPHER_ALG_DES_RFB,
> +        .path = "/crypto/cipher/des-ecb-56-one-block",
> +        .alg = QCRYPTO_CIPHER_ALG_DES,
>          .mode = QCRYPTO_CIPHER_MODE_ECB,
> -        .key = "0123456789abcdef",
> +        .key = "80c4a2e691d5b3f7",
>          .plaintext = "70617373776f7264",
>          .ciphertext = "73fa80b66134e403",
>      },

This is a rather cute way to avoid recomputing the canonical
.ciphertext due to the change in bit ordering.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


