Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37AB30D76C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:27:19 +0100 (CET)
Received: from localhost ([::1]:33834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FNW-0007aF-OS
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7FMj-000778-L2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:26:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7FMe-0007Mw-Kg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612347983;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPvJ0ehrf+poclc2Q+fBzL82zuQf+b3FADT5zZMlDgg=;
 b=L6kUqwLdqtBHKJ4WUW7YI3m5xPPxNJF4l1Nz/M4Vv9uhfYkhLSwzAYS6GK04TiO5TIXlID
 Dcv2pdbzV8qkMAooIfWqnEwJ7bGbQVdhQ4TXhPIHaWisaPTmCPvDHsmd/NnoLw06RZf0PW
 pWQheuH/4WBUxl+vFjd6oOnpwjrRGxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-EAOOs2jmMRe9YN9AYtTJeg-1; Wed, 03 Feb 2021 05:26:21 -0500
X-MC-Unique: EAOOs2jmMRe9YN9AYtTJeg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CF2A874983;
 Wed,  3 Feb 2021 10:26:20 +0000 (UTC)
Received: from redhat.com (ovpn-115-117.ams2.redhat.com [10.36.115.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2560957;
 Wed,  3 Feb 2021 10:26:00 +0000 (UTC)
Date: Wed, 3 Feb 2021 10:25:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 09/12] qemu-options: Replace the word 'blacklist'
Message-ID: <20210203102558.GK300990@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-10-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202205824.1085853-10-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 09:58:21PM +0100, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "blacklist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qemu-options.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index d0410f05125..75997ee2ea6 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4275,11 +4275,11 @@ DEF("sandbox", HAS_ARG, QEMU_OPTION_sandbox, \
>      "                    by the kernel, but typically no longer used by modern\n" \
>      "                    C library implementations.\n" \
>      "                use 'elevateprivileges' to allow or deny QEMU process to elevate\n" \
> -    "                    its privileges by blacklisting all set*uid|gid system calls.\n" \
> +    "                    its privileges by denylisting all set*uid|gid system calls.\n" \

The original description is a bit wierd in how it reads/explains it, so
I think it needs bigger changes:

    "                use 'elevateprivileges' to allow or deny the QEMU process ability
    "                to elevate privileges using set*uid|gid system calls.\n" \

>      "                    The value 'children' will deny set*uid|gid system calls for\n" \
>      "                    main QEMU process but will allow forks and execves to run unprivileged\n" \
>      "                use 'spawn' to avoid QEMU to spawn new threads or processes by\n" \
> -    "                     blacklisting *fork and execve\n" \
> +    "                     denylisting *fork and execve\n" \

denylisting is a very strange term to use - its not really a word IMHO.
Better as

    "                     preventing *fork and execve\n" \

or

    "                     blocking *fork and execve\n" \



>      "                use 'resourcecontrol' to disable process affinity and schedular priority\n",
>      QEMU_ARCH_ALL)
>  SRST

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


