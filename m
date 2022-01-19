Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F9493F75
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 19:00:05 +0100 (CET)
Received: from localhost ([::1]:55368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFFc-0001k3-Nr
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 13:00:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAEvB-0004BS-3o
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:38:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAEv8-0004vE-GY
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642613933;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/JWX3In9pN3S8MZpLIfFUalbpdlgaxjHkajTJhrO4cY=;
 b=Dt2H5lUmMYqBC/f0wkuFR5WDAjQ6B6c/GxYQD2bB1hH0zst8yxg2XFRZz+Lld/tyVFA76V
 Rgv98yMjiNMnE9r65ZSvetVdTUrTzaNkCvKFngqsdfJrbGjwbNUhC0ZcjljgB5nqxCjanG
 NNE8wuRUhEN3WxLWZWIdzbrocGQ1YZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-gJGwUyAYOz-SX21JxdtVKA-1; Wed, 19 Jan 2022 12:38:46 -0500
X-MC-Unique: gJGwUyAYOz-SX21JxdtVKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D76C085EE70;
 Wed, 19 Jan 2022 17:38:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DC252BCC5;
 Wed, 19 Jan 2022 17:38:42 +0000 (UTC)
Date: Wed, 19 Jan 2022 17:38:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] meson: Don't pass 'method' to dependency()
Message-ID: <YehMnmZp3z+Cr0Od@redhat.com>
References: <20220119171800.491703-1-abologna@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119171800.491703-1-abologna@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 06:17:57PM +0100, Andrea Bolognani wrote:
> See [1] for recent discussion about libgcrypt specifically, which the
> first patch is about.
> 
> After writing that one, I realized that there is no point in
> explicitly passing 'method' to dependency() because Meson will do the
> right thing by default - hence the next two patches.

This whole series is effectively reverting

  commit 1a94933fcc3d641bda9988244cde61769baae2e5
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Mon Aug 31 06:27:00 2020 -0400

    meson: use pkg-config method to find dependencies
    
    We do not need to ask cmake for the dependencies, so just use the
    pkg-config mechanism.  Keep "auto" for SDL so that it tries using
    sdl-config too.
    
    The documentation is adjusted to use SDL2_image as the example,
    rather than SDL which does not use the "pkg-config" method.
    
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

which IIRC was done to get rid of mesons' confusing/misleading
attempts to probe for things via cmake when the pkg-config file
is not present.

> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg01224.html
> 
> Andrea Bolognani (3):
>   meson: Don't force use of libgcrypt-config
>   meson: Don't pass 'method' to dependency()
>   docs: Don't recommend passing 'method' to dependency()
> 
>  docs/devel/build-system.rst |  1 -
>  meson.build                 | 75 +++++++++++++++----------------------
>  tcg/meson.build             |  2 +-
>  3 files changed, 31 insertions(+), 47 deletions(-)
> 
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


