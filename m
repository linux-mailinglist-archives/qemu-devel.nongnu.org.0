Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3222B35F9BB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 19:25:59 +0200 (CEST)
Received: from localhost ([::1]:48470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWjH4-0006Do-73
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 13:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lWiz1-00057M-2V
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:07:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lWiyv-00013l-GR
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618420030;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5fVZs6aseVpXyGqW9EovGgMH+pAX2bB75I2ix6ALIw=;
 b=Z0XuIvsUhCqXRILDcT4r/IWSW/R77Fpq7tSYs5eUC2wzi9cbbIObCHs2iZi4LK2FCWlxcj
 pLXBZSa2Jy9rZ6PHr+xBo7qRzZmFzkw7l7LeaVpidZfA1HeJPj6+b6Rh3dkpGCSncFbSNB
 6CbgWDpbtQOtF8rVxQY2sp+a8dDmjYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-8_VYFxh_PkmSbbC_6hvj5A-1; Wed, 14 Apr 2021 13:07:05 -0400
X-MC-Unique: 8_VYFxh_PkmSbbC_6hvj5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 232CA84B9A0
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 17:07:05 +0000 (UTC)
Received: from redhat.com (ovpn-114-26.ams2.redhat.com [10.36.114.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2117510023AC;
 Wed, 14 Apr 2021 17:07:03 +0000 (UTC)
Date: Wed, 14 Apr 2021 18:07:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL v2 2/3] osdep: protect qemu/osdep.h with extern "C"
Message-ID: <YHchNfXnhyzZBTg5@redhat.com>
References: <20210413160850.240064-1-pbonzini@redhat.com>
 <20210413160850.240064-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210413160850.240064-3-pbonzini@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 06:08:49PM +0200, Paolo Bonzini wrote:
> System headers may include templates if compiled with a C++ compiler,
> which cause the compiler to complain if qemu/osdep.h is included
> within a C++ source file's 'extern "C"' block.  Add
> an 'extern "C"' block directly to qemu/osdep.h, so that
> system headers can be kept out of it.
> 
> There is a stray declaration early in qemu/osdep.h, which needs
> to be special cased.  Add a definition in qemu/compiler.h to
> make it look nice.
> 
> config-host.h, CONFIG_TARGET, exec/poison.h and qemu/compiler.h
> are included outside the 'extern "C"' block; that is not
> an issue because they consist entirely of preprocessor directives.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  disas/nanomips.cpp      |  2 +-
>  include/qemu/compiler.h |  6 ++++++
>  include/qemu/osdep.h    | 10 +++++++++-
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 2b09655271..8ddef897f0 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -27,8 +27,8 @@
>   *      Reference Manual", Revision 01.01, April 27, 2018
>   */
>  
> -extern "C" {
>  #include "qemu/osdep.h"
> +extern "C" {
>  #include "disas/dis-asm.h"
>  }

disas/arm-a64.c  also has an 'extern "C"' block around
an include of qemu/osdep.h.   Do we need a similar
fix for that file, or are we no longer using that
bit of code ?

>  
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index cf28bb2bcd..091c45248b 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -11,6 +11,12 @@
>  #define QEMU_STATIC_ANALYSIS 1
>  #endif
>  
> +#ifdef __cplusplus
> +#define QEMU_EXTERN_C extern "C"
> +#else
> +#define QEMU_EXTERN_C extern
> +#endif
> +
>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
>  
>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b67b0a1e8c..3f8785a471 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -57,7 +57,7 @@
>  #define daemon qemu_fake_daemon_function
>  #include <stdlib.h>
>  #undef daemon
> -extern int daemon(int, int);
> +QEMU_EXTERN_C int daemon(int, int);
>  #endif
>  
>  #ifdef _WIN32
> @@ -113,6 +113,10 @@ extern int daemon(int, int);
>  
>  #include "glib-compat.h"
>  
> +#ifdef __cplusplus
> +extern "C" {
> +#endif
> +
>  #ifdef _WIN32
>  #include "sysemu/os-win32.h"

This and os-posix.h both include other system headers. We don't currently
have problem, so this is ok as the minimal fix for 6.0, but long term we
need more work on this header to further narrow the extern {} block.

So assuming my question about disas/arm-a64.c is a non-issue, then


Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


