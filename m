Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFCF628EEB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:09:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouip1-0001LQ-P6; Mon, 14 Nov 2022 18:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ouih0-0006Ku-1C
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:16:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ouVII-0005FH-Ng
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 03:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668416296;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Wb4gzoR+yQJ+WSy6QaPw6ExwkymYQYj1gBWGIfWr5dc=;
 b=OlHcR50hH0C3QUfFHxOV8fqtP1TmDrLN975hkw17l60DzbSU9bW6ekdoxqoXhg/8qx8gF4
 sEt5rQ7mvJBNhGAA8X9GdE5BOAMtMXq6KsvHG1YaF14buPerdaa+QAY0qtHb4isV+kRmE7
 lSp7F/FGwuGw7pnxgKs3jlwbuRvIrvg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-E0ESYLwOM2KiK3uZUSjgjQ-1; Mon, 14 Nov 2022 03:58:13 -0500
X-MC-Unique: E0ESYLwOM2KiK3uZUSjgjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A25DA101E14D;
 Mon, 14 Nov 2022 08:58:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEDD61415102;
 Mon, 14 Nov 2022 08:58:11 +0000 (UTC)
Date: Mon, 14 Nov 2022 08:58:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] capstone: use <capstone/capstone.h> instead of
 <capstone.h>
Message-ID: <Y3IDCbr/ZgsSuzkh@redhat.com>
References: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

On Sun, Nov 13, 2022 at 11:09:42PM +0300, Michael Tokarev wrote:
> The upcoming capstone 5.0 drops support for the old way
> of including its header, due to this change:
> https://github.com/capstone-engine/capstone/commit/6656bcb63ab4e87dc6079bd6b6b12cc8dd9b2ad8
> The official way is to use <capstone/capstone.h>
> 
> This change has already been proposed before, see
> https://patchwork.kernel.org/project/qemu-devel/patch/20180215173539.11033-1-f4bug@amsat.org/
> but it didn't find its way into qemu at that time.
> 
> On current systems, using <capstone/capstone.h> works
> now (despite the pkg-config-supplied -I/usr/include/capstone) -
> since on all systems capstone headers are put into capstone/
> subdirectory of a system include dir. So this change is
> compatible with both the obsolete way of including it
> and the only future way.

AFAIR, macOS HomeBrew does not put anything into the system
include dir, and always requires -I flags to be correct.

> diff --git a/meson.build b/meson.build
> index cf3e517e56..6f34c963f7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2680,12 +2680,7 @@ if not get_option('capstone').auto() or have_system or have_user
>    capstone = dependency('capstone', version: '>=3.0.5',
>                          kwargs: static_kwargs, method: 'pkg-config',
>                          required: get_option('capstone'))
> -
> -  # Some versions of capstone have broken pkg-config file
> -  # that reports a wrong -I path, causing the #include to
> -  # fail later. If the system has such a broken version
> -  # do not use it.
> -  if capstone.found() and not cc.compiles('#include <capstone.h>',
> +  if capstone.found() and not cc.compiles('#include <capstone/capstone.h>',
>                                            dependencies: [capstone])

To retain back compat this could probe for both ways

    if capstone.found()
        if cc.compiles('#include <capstone/capstone.h>',
	               dependencies: [capstone])
           ...
        else if cc.compiles('#include <capstone.h>',
	                    dependencies: [capstone])
           ...
        
then, the source file can try the correct #include based on what
we detect works here.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


