Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4AA5248B2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 11:15:57 +0200 (CEST)
Received: from localhost ([::1]:40538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np4vM-0000TK-EA
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 05:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np4Kj-0004lg-6l
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:38:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np4Kg-0007DU-4b
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652344681;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEF8Gmwps9WJ6dI8yhzIv0LCDe1CM5c2CSdQwyMyxhU=;
 b=CkOsLb+IoIjQ0bpavCdwSdYLbelO+xfsWpw8wVmfzT15pS3ddQWS3aart6hytBtGsS7Bc1
 SPYdfcl09k2zi/CsE1cCuas64hwwiA7AvvbX9DuwCi5IQSLK+D23AuDrP6httBI+he7e3z
 RWCAWsPn6j4FFdjuzPz62Fgl7G9KmNE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-3xu01QkLMwO9127mORNu0Q-1; Thu, 12 May 2022 04:38:00 -0400
X-MC-Unique: 3xu01QkLMwO9127mORNu0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F57785A5BC;
 Thu, 12 May 2022 08:38:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01C0140CF8F4;
 Thu, 12 May 2022 08:37:58 +0000 (UTC)
Date: Thu, 12 May 2022 09:37:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: Re: [PATCH v2] docs/about: Update the support statement for Windows
Message-ID: <YnzHY9qppyhu+fx2@redhat.com>
References: <20220512073929.988220-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220512073929.988220-1-thuth@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Thu, May 12, 2022 at 09:39:29AM +0200, Thomas Huth wrote:
> Our support statement for Windows currently talks about "Vista / Server
> 2008" - which is related to the API of Windows, and this is not easy
> to understand for the non-technical users. Additionally, glib sets the
> _WIN32_WINNT macro to 0x0601 already, which indicates the Windows 7 API,
> so QEMU effectively depends on the Windows 7 API, too.
> 
> Thus let's bump the _WIN32_WINNT setting in QEMU to the same level as
> glib uses and adjust our support statement in the documentation to
> something similar that we're using for Linux and the *BSD systems
> (i.e. only the two most recent versions), which should hopefully be
> easier to understand for the users now.
> 
> And since we're nowadays also compile-testing QEMU with MSYS2 on Windows
> itself, I think we could mention this build environment here, too.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/880
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Rephrase and update the _WIN32_WINNT macro, too
> 
>  docs/about/build-platforms.rst | 14 +++++++++-----
>  include/qemu/osdep.h           |  2 +-
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index e9163ba556..1958edb430 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -86,11 +86,15 @@ similar versions.
>  Windows
>  -------
>  
> -The project supports building with current versions of the MinGW toolchain,
> -hosted on Linux (Debian/Fedora).
> -
> -The version of the Windows API that's currently targeted is Vista / Server
> -2008.
> +The project aims to support the two most recent versions of Windows that are
> +still supported by the vendor. The minimum Windows API that is currently
> +targeted is "Windows 7", so theoretically the QEMU binaries can still be run
> +on older versions of Windows, too. However, such old versions of Windows are
> +not tested anymore, so it is recommended to use one of the latest versions of
> +Windows instead.
> +
> +The project supports building QEMU with current versions of the MinGW
> +toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.
>  
>  .. _Homebrew: https://brew.sh/
>  .. _MacPorts: https://www.macports.org/
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 1c1e7eca98..e2f88597b6 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -75,7 +75,7 @@ QEMU_EXTERN_C int daemon(int, int);
>  #ifdef _WIN32
>  /* as defined in sdkddkver.h */
>  #ifndef _WIN32_WINNT
> -#define _WIN32_WINNT 0x0600 /* Vista */
> +#define _WIN32_WINNT 0x0601 /* Windows 7 API */
>  #endif
>  /* reduces the number of implicitly included headers */
>  #ifndef WIN32_LEAN_AND_MEAN

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

but how about also adding a comment before 'glib_req_ver' in
configure reminding us to bump _WIN32_WINNT, and adding a
comment here reminding us to set this to match the _WIN32_WINNT
in our min glib ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


