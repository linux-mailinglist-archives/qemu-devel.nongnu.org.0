Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBF536B01F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:01:04 +0200 (CEST)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lax70-0005la-N8
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lax3N-0004Bk-EO
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 04:57:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lax3D-0004Mp-Rk
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 04:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619427425;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yoEbv16D2f2wZ+qjL95guJdV0U9H2EAaVC6PG6Q2hTs=;
 b=QbtLyQrleP/jKVohBoD1RhVGXe4g3BGFdC5pBcKC1ARhGFYKfdYqGnFKDJ+8o8Bdla2cMB
 pPUMo9qgYrx+TC/t4bL5uaS6yiVYoBa67QC3CRMA/TCGZOvhlYca0m8hRTvsFc4Ki8lqfL
 0VDaA4FoWYc+Ug1UVyENeRXwuRDJA54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-tnqfYE_TOZW_MrMHHHKzxA-1; Mon, 26 Apr 2021 04:56:59 -0400
X-MC-Unique: tnqfYE_TOZW_MrMHHHKzxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D60C31922036;
 Mon, 26 Apr 2021 08:56:57 +0000 (UTC)
Received: from redhat.com (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A445A29AAA;
 Mon, 26 Apr 2021 08:56:56 +0000 (UTC)
Date: Mon, 26 Apr 2021 09:56:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: imp@bsdimp.com
Subject: Re: [PULL 15/24] bsd-user: Fix commentary issues
Message-ID: <YIaAVTahNvQ0+hKc@redhat.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-6-imp@bsdimp.com>
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-6-imp@bsdimp.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 02:39:50PM -0600, imp@bsdimp.com wrote:
> From: Warner Losh <imp@bsdimp.com>
> 
> Lines > 80 or 90 characters
> C++ comments
> BSD /*- block comment convention removed.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/bsd-mman.h | 42 ++++++++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/bsd-user/bsd-mman.h b/bsd-user/bsd-mman.h
> index 910e8c1921..5a64d0d425 100644
> --- a/bsd-user/bsd-mman.h
> +++ b/bsd-user/bsd-mman.h
> @@ -1,4 +1,4 @@
> -/*-
> +/*
>   * Copyright (c) 1982, 1986, 1993
>   *      The Regents of the University of California.  All rights reserved.
>   *
> @@ -30,16 +30,20 @@
>   * $FreeBSD: src/sys/sys/mman.h,v 1.42 2008/03/28 04:29:27 ps Exp $
>   */
>  
> -#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080  /* previously misimplemented MAP_INHERIT */
> -#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100  /* previously unimplemented MAP_NOEXTEND */
> -#define TARGET_FREEBSD_MAP_STACK        0x0400  /* region grows down, like a stack */
> -#define TARGET_FREEBSD_MAP_NOSYNC       0x0800  /* page to but do not sync underlying file */
> +#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080
> +                                 /* previously misimplemented MAP_INHERIT */
> +#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100
> +                                 /* previously unimplemented MAP_NOEXTEND */
> +#define TARGET_FREEBSD_MAP_STACK        0x0400
> +                                 /* region grows down, like a stack */
> +#define TARGET_FREEBSD_MAP_NOSYNC       0x0800
> +                                 /* page to but do not sync underlying file */

I find this indented following comment style more ambiguous as to
what constant the comment applies to. IMHO would be clearer as

 /* previously misimplemented MAP_INHERIT */
 #define TARGET_FREEBSD_MAP_RESERVED0080 0x0080

 /* previously unimplemented MAP_NOEXTEND */
 #define TARGET_FREEBSD_MAP_RESERVED0100 0x0100

 /* region grows down, like a stack */
 #define TARGET_FREEBSD_MAP_STACK        0x0400

 /* page to but do not sync underlying file */
 #define TARGET_FREEBSD_MAP_NOSYNC       0x0800

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


