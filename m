Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7987332B68A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:25:09 +0100 (CET)
Received: from localhost ([::1]:59696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOgm-0005SY-JG
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHOfv-0004xg-G3
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:24:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHOft-0003tL-Ne
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:24:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614767052;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c5Fgk8icGmcvSFf+MHOuh49LYZXsJtryg2ysquFOlhM=;
 b=aqh5cbg88yfnYaQqKeZwYCjV36OgsuE0hWpSGlj54d2c/5MXmhCtl1pRBamaZxl/Hhg4vi
 F5jmzaxoCgQKKRTQCSJ6Dt9iHbUzLKRZnCDSo9iVqQ0YDDXZ3A/7tMewKd8p/Z51H3WbXM
 AtaltmjY70oo5qNl/W7gdz7X/y40Alc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-WG_LHAGJORqV2BAbhAB4Rw-1; Wed, 03 Mar 2021 05:24:09 -0500
X-MC-Unique: WG_LHAGJORqV2BAbhAB4Rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0461801965;
 Wed,  3 Mar 2021 10:24:07 +0000 (UTC)
Received: from redhat.com (ovpn-115-145.ams2.redhat.com [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98CDB60BFA;
 Wed,  3 Mar 2021 10:23:45 +0000 (UTC)
Date: Wed, 3 Mar 2021 10:23:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 6/8] qemu-options: Replace the word 'blacklist'
Message-ID: <YD9jrt77JTzDl9T4@redhat.com>
References: <20210205171817.2108907-1-philmd@redhat.com>
 <20210205171817.2108907-7-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205171817.2108907-7-philmd@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 06:18:15PM +0100, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "blacklist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Reword (danpb)
> ---
>  qemu-options.hx | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index c09c4646e28..5f86cd2fbbf 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4274,12 +4274,12 @@ DEF("sandbox", HAS_ARG, QEMU_OPTION_sandbox, \
>      "                use 'obsolete' to allow obsolete system calls that are provided\n" \
>      "                    by the kernel, but typically no longer used by modern\n" \
>      "                    C library implementations.\n" \
> -    "                use 'elevateprivileges' to allow or deny QEMU process to elevate\n" \
> -    "                    its privileges by blacklisting all set*uid|gid system calls.\n" \
> +    "                use 'elevateprivileges' to allow or deny the QEMU process ability\n" \
> +    "                    to elevate privileges using set*uid|gid system calls.\n" \
>      "                    The value 'children' will deny set*uid|gid system calls for\n" \
>      "                    main QEMU process but will allow forks and execves to run unprivileged\n" \
>      "                use 'spawn' to avoid QEMU to spawn new threads or processes by\n" \
> -    "                     blacklisting *fork and execve\n" \
> +    "                     blocking *fork and execve\n" \
>      "                use 'resourcecontrol' to disable process affinity and schedular priority\n",
>      QEMU_ARCH_ALL)
>  SRST

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


