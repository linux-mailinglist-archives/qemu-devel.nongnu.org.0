Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB37F5B0A42
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 18:39:52 +0200 (CEST)
Received: from localhost ([::1]:49378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVy5f-0001is-PD
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 12:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVy0p-0007ri-2W
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 12:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVy0j-0002Ys-7O
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 12:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662568483;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=r3TWmOzHLP/7BpG/p2aY3Hy86t5e7LTtHPjEzMmp74Q=;
 b=HYL3OF2Ec4AT35VeSZcMlnj9OL6H6XwR+OgO6dAt0revrJqo7glKxnEPjt3Y1cFFb22yER
 3GfaQI/bj1d322TgimBSZrDWs1+LkyxycJcw+jVAm4wc2iUUtd8/5t/GIkdbh0gjDvlc3Z
 uwCnBaLXldxxkyymzA8P1aOBjl3TlSA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-NccKeKIvNT-l4IkKFe2upA-1; Wed, 07 Sep 2022 12:34:40 -0400
X-MC-Unique: NccKeKIvNT-l4IkKFe2upA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED031811E80;
 Wed,  7 Sep 2022 16:34:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 869B61410F38;
 Wed,  7 Sep 2022 16:34:39 +0000 (UTC)
Date: Wed, 7 Sep 2022 17:34:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Patrick Venture <venture@google.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] crypto/block-luks: always set splitkeylen to 0
Message-ID: <YxjH/bIN6OlSWMWK@redhat.com>
References: <20220907162125.3950701-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220907162125.3950701-1-venture@google.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 07, 2022 at 09:21:25AM -0700, Patrick Venture wrote:
> This was caught by a sanitized build, that was perhaps oversensitive.
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  crypto/block-luks.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/crypto/block-luks.c b/crypto/block-luks.c
> index f62be6836b..8633fb7e9f 100644
> --- a/crypto/block-luks.c
> +++ b/crypto/block-luks.c
> @@ -729,7 +729,7 @@ qcrypto_block_luks_store_key(QCryptoBlock *block,
>      QCryptoBlockLUKS *luks = block->opaque;
>      QCryptoBlockLUKSKeySlot *slot;
>      g_autofree uint8_t *splitkey = NULL;
> -    size_t splitkeylen;
> +    size_t splitkeylen = 0;
>      g_autofree uint8_t *slotkey = NULL;
>      g_autoptr(QCryptoCipher) cipher = NULL;
>      g_autoptr(QCryptoIVGen) ivgen = NULL;
> @@ -901,7 +901,7 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
>      QCryptoBlockLUKS *luks = block->opaque;
>      const QCryptoBlockLUKSKeySlot *slot;
>      g_autofree uint8_t *splitkey = NULL;
> -    size_t splitkeylen;
> +    size_t splitkeylen = 0;
>      g_autofree uint8_t *possiblekey = NULL;
>      int rv;
>      g_autoptr(QCryptoCipher) cipher = NULL;
> @@ -1147,7 +1147,7 @@ qcrypto_block_luks_erase_key(QCryptoBlock *block,
>      QCryptoBlockLUKS *luks = block->opaque;
>      QCryptoBlockLUKSKeySlot *slot;
>      g_autofree uint8_t *garbagesplitkey = NULL;
> -    size_t splitkeylen;
> +    size_t splitkeylen = 0;
>      size_t i;
>      Error *local_err = NULL;
>      int ret;

In all three cases, splitkeylen is initialized a few lines later.

In qcrypto_block_luks_store_key there is a 'goto cleanup' before
the initialization. The 'cleanup' code can use 'splitkeylen', but
only if 'splitkey != NULL' & this isn't possible if splitkeylen is
uninitialized.

The other two methods have no code path where splitkeylen can be
used uninitialized.

The tool is reporting non-existant problems AFAICT

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


