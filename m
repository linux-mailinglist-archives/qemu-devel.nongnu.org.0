Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F163250E379
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:42:13 +0200 (CEST)
Received: from localhost ([::1]:47086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizun-0008Gs-2r
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizik-0002Yj-Bb
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:29:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizii-000546-Ma
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:29:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650896984;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zshg/OCVopnMPA6eZ3n/Mx0VJ+8ymEGS4+cSznkK9HA=;
 b=cptRP1RYXryHTlXFFhQ8h0Hbob0BcEoaFYMXq3E7on7BGWLMSeifjq/bUf88Mj0aDdo0jU
 rSknhXJxXKWvCc8+XrL7Vn86AKlM8vQJ5Op4HMIMRLOA63YB+Co0qEQ4f0xAKZ9dOxtiVA
 ucIjvKK/fqXsgAHqBhfCusjAcLmTFMQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-CuGGWqoCPbuqYQ4wYnvQ_Q-1; Mon, 25 Apr 2022 10:29:35 -0400
X-MC-Unique: CuGGWqoCPbuqYQ4wYnvQ_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6442A1C05132;
 Mon, 25 Apr 2022 14:29:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BBB1409B40C;
 Mon, 25 Apr 2022 14:29:34 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:29:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: LABBE Corentin <clabbe@baylibre.com>
Subject: Re: [PATCH] hw/crypto: add Allwinner sun4i-ss crypto device
Message-ID: <YmawTE9AfYxyaZoo@redhat.com>
References: <20220410191238.760733-1-clabbe@baylibre.com>
 <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
 <YmWgn2OGoZ9Uyirh@Red> <YmZ1pCU+0bP/LFPU@redhat.com>
 <YmacD3eroYTnjUdx@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YmacD3eroYTnjUdx@Red>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: b.galvani@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 03:03:11PM +0200, LABBE Corentin wrote:
> diff --git a/crypto/hash-nettle.c b/crypto/hash-nettle.c
> index 1ca1a41062..b9342b4fe1 100644
> --- a/crypto/hash-nettle.c
> +++ b/crypto/hash-nettle.c
> @@ -26,10 +26,22 @@
>  #include <nettle/sha.h>
>  #include <nettle/ripemd160.h>
>  
> +#ifndef nettle_sha256_compress
> +#define nettle_sha256_compress _nettle_sha256_compress
> +void _nettle_sha256_compress(uint32_t *state, const uint8_t *input, const uint32_t *k);
> +#endif
> +
> +#ifndef nettle_sha512_compress
> +#define nettle_sha512_compress _nettle_sha512_compress
> +void _nettle_sha512_compress(uint32_t *state, const uint8_t *input, const uint32_t *k);
> +#endif

The 'nettle_sha256_compress' function doesn't exist in any header file
from nettle that I've looked at.

The '_nettle_sha256_compress' function exists as a symbol in the .so
library, but it is clearly not intended for public usage:

$ nm -a -D /usr/lib64/libnettle.so | grep sha256_compress
0000000000027730 T _nettle_sha256_compress@@NETTLE_INTERNAL_8_4

So this #define magic is definitely not something we can do.

IOW, unless I'm missing something, I don't think we can even
use nettle for your desired goal, which leaves us no impl at
all.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


