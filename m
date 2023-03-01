Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8746A6937
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 09:55:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIDa-0001yF-KK; Wed, 01 Mar 2023 03:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXIDY-0001xl-DE
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 03:53:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXIDW-0001Ao-OP
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 03:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677660821;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cTp3T271T+9et1C8KQBysGCGuOTvcKljs2VpBWuyak0=;
 b=hE470DwL+vtRRI/QFrx0I3zTq1kQAti1E6yo8IOPfkPDNDjKNscA0hYJcYP3JCJhm1xvE9
 usRBbKo3RrzJViE1Xm3JxiDzxovUy2grl9yL78r8yWlIOZXM0HK6fqshoNUaAV/Y0XoJd9
 kb5Nvt+P47vOyQj+ir+PlAFj7c/W/o4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-A2n2aJu7M2apqp6RzTE0Bg-1; Wed, 01 Mar 2023 03:53:38 -0500
X-MC-Unique: A2n2aJu7M2apqp6RzTE0Bg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D85A87A9E1;
 Wed,  1 Mar 2023 08:53:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7EBA40CF8EC;
 Wed,  1 Mar 2023 08:53:37 +0000 (UTC)
Date: Wed, 1 Mar 2023 08:53:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/4] crypto/luks: Initialize stack variable to silence
 warning
Message-ID: <Y/8Sj18rm+VvbEP2@redhat.com>
References: <cover.1677617035.git.dxu@dxuuu.xyz>
 <7d55ac8f0d021d39809298cac2f13f3826c284c8.1677617035.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d55ac8f0d021d39809298cac2f13f3826c284c8.1677617035.git.dxu@dxuuu.xyz>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 01:48:01PM -0700, Daniel Xu wrote:
> With `../configure --enable-sanitizers`, I was getting the following
> build error:
> 
>         In file included from /usr/include/string.h:535,
>                          from /home/dxu/dev/qemu/include/qemu/osdep.h:99,
>                          from ../crypto/block-luks.c:21:
>         In function ‘memset’,
>             inlined from ‘qcrypto_block_luks_store_key’ at ../crypto/block-luks.c:843:9:
>         /usr/include/bits/string_fortified.h:59:10: error: ‘splitkeylen’ may be used
>         uninitialized [-Werror=maybe-uninitialized]
>            59 |   return __builtin___memset_chk (__dest, __ch, __len,
>               |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>            60 |                                  __glibc_objsize0 (__dest));
>               |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
>         ../crypto/block-luks.c: In function ‘qcrypto_block_luks_store_key’:
>         ../crypto/block-luks.c:699:12: note: ‘splitkeylen’ was declared here
>           699 |     size_t splitkeylen;
>               |            ^~~~~~~~~~~
>         cc1: all warnings being treated as errors
> 
> The function is actually correct -- in the cleanup branch `splitkeylen`
> usage is guarded by checking `splitkey` nullness. But the compiler is
> not smart enough to realize that.
> 
> Fix warning by initializing the variable.
> 
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---
>  crypto/block-luks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


