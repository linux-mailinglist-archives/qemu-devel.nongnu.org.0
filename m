Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B7832D0F0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:38:19 +0100 (CET)
Received: from localhost ([::1]:43424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlN5-0006tc-2j
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHlM3-0006Ss-I6
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:37:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHlM1-0002Xs-T0
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614854233;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Roq+e5ho9PiYSTbzwlWTn8T6D9zPApFFxhcs7RzPWw=;
 b=F7lZzIaRzoIXWjqHgwHiAnu9hQV4ZN0OlBKi51OfSYNqw4wTX9BSntGbMX9iTAvanpxPnM
 KMoVtDa3eDfIZhhlIl1v7XQE6p0/Wz3E7xjxH3FyIDsUYrgVkrI3M0XZPo7Xmt/vbtLUD2
 DVtl7v3v5GNwjbuEGAgIg4/GsZKr05E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-1YsN3SrHN-CVEJcJIqvI4A-1; Thu, 04 Mar 2021 05:37:08 -0500
X-MC-Unique: 1YsN3SrHN-CVEJcJIqvI4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CF4D108BD13;
 Thu,  4 Mar 2021 10:37:07 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5952319C48;
 Thu,  4 Mar 2021 10:37:06 +0000 (UTC)
Date: Thu, 4 Mar 2021 10:37:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH] meson: Stop if cfi is enabled with system slirp
Message-ID: <YEC4Rk/eAStVIFU7@redhat.com>
References: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 09:59:38PM -0500, Daniele Buono wrote:
> For CFI, we need to compile slirp as a static library together with qemu.
> This is because we register slirp functions as callbacks for QEMU Timers.
> When using a system-wide shared libslirp, the type information for the
> callback is missing and the timer call produces a false positive with CFI.

Is there work being done, or at least an active plan, for fixing this ?

Distros generally won't want to static link slirp to QEMU when there is
a shared slirp available. It increases the security burden to maintain
slirp twice, especially as slirp has a history of CVEs.

IOW, the inability to use shared slirp may well prevent CFI from being
used in distros.

> 
> With this patch, meson will stop if CFI is enabled with system-wide slirp
> 
> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> ---
>  meson.build | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index f3db83e974..e1ec5020ac 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1569,6 +1569,18 @@ if have_system
>    endif
>  endif
>  
> +# For CFI, we need to compile slirp as a static library together with qemu.
> +# This is because we register slirp functions as callbacks for QEMU Timers.
> +# When using a system-wide shared libslirp, the type information for the
> +# callback is missing and the timer call produces a false positive with CFI.
> +#
> +# Now that slirp_opt has been defined, check if the selected slirp is compatible
> +# with control-flow integrity.
> +if get_option('cfi') and slirp_opt == 'system'
> +  error('Control-Flow Integrity is not compatible with system-wide slirp.' \
> +         + ' Please configure with --enable-slirp=git')
> +endif

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


