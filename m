Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114A83BE84C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 14:49:46 +0200 (CEST)
Received: from localhost ([::1]:39222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m16zp-0006B5-4w
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 08:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m16xb-0004oX-6B
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m16xX-0006tH-VI
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625662043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUlZjCkvGoOXeGMfo5mhHUEH12j4GUSxsOSw8ajw6VE=;
 b=TDZAQy5cwBShifhsJh91686IcIM++PdlUZ90CpgFCGcqiZnxC3hXwnDYqJ4cHYok8RLgP9
 3oJzfoIBqIQ7ZLAuz85iDygLxsFySMEBu9/dxGgsi/eYqNeFflBEUiQNQ7kPtNMMAvH9L7
 kfTQFdWNAyDv3XpOtMobhAXn9uoQzlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-kzlGhj7zM6WbMOe0gL3M2g-1; Wed, 07 Jul 2021 08:47:21 -0400
X-MC-Unique: kzlGhj7zM6WbMOe0gL3M2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E305719057A1
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 12:47:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 506045D9F0;
 Wed,  7 Jul 2021 12:47:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DCC051132B52; Wed,  7 Jul 2021 14:47:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 11/18] crypto: rename des-rfb cipher to just des
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-12-berrange@redhat.com>
Date: Wed, 07 Jul 2021 14:47:15 +0200
In-Reply-To: <20210706095924.764117-12-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 6 Jul 2021 10:59:17
 +0100")
Message-ID: <87eecaffzg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

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
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---

[...]

> diff --git a/qapi/crypto.json b/qapi/crypto.json
> index 7116ae9a46..6b3fadabac 100644
> --- a/qapi/crypto.json
> +++ b/qapi/crypto.json
> @@ -66,7 +66,7 @@
>  # @aes-128: AES with 128 bit / 16 byte keys
>  # @aes-192: AES with 192 bit / 24 byte keys
>  # @aes-256: AES with 256 bit / 32 byte keys
> -# @des-rfb: RFB specific variant of single DES. Do not use except in VNC=
.
> +# @des: DES with 56 bit / 8 byte keys. Do not use except in VNC.
>  # @3des: 3DES(EDE) with 192 bit / 24 byte keys (since 2.9)
>  # @cast5-128: Cast5 with 128 bit / 16 byte keys
>  # @serpent-128: Serpent with 128 bit / 16 byte keys
> @@ -80,7 +80,7 @@
>  { 'enum': 'QCryptoCipherAlgorithm',
>    'prefix': 'QCRYPTO_CIPHER_ALG',
>    'data': ['aes-128', 'aes-192', 'aes-256',
> -           'des-rfb', '3des',
> +           'des', '3des',
>             'cast5-128',
>             'serpent-128', 'serpent-192', 'serpent-256',
>             'twofish-128', 'twofish-192', 'twofish-256']}

Is enum value "des-rfb" part of any external interface?

[...]


