Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2882FE738
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:12:55 +0100 (CET)
Received: from localhost ([::1]:44028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2WxS-0001zb-Ld
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2WwO-0000YI-4y
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:11:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2WwG-0005jt-0R
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611223898;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IgocPnGVnFD0n6L3nJxzIyRvai30BmsFLUB7kU3IX0M=;
 b=XmvjQ2HDc78mRcWlB9s8cKvF3yRAANDtLrGeFLXZ16dPMdq30KnFveeiB596mXMRSv31wN
 HrQ1aHrlc1kGx9nai9UZAEAc8SFCH3Kts+CMI1R7FICfFS9tBYYBopS8wfYu7YOfk9kxSu
 P1oHsygNCiK5AlGWfhY+hhe+P6mIFUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-mPERydzpN-ihnmftp1J-lQ-1; Thu, 21 Jan 2021 05:11:33 -0500
X-MC-Unique: mPERydzpN-ihnmftp1J-lQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7988810054FF
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 10:11:32 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 615FC6268F;
 Thu, 21 Jan 2021 10:11:31 +0000 (UTC)
Date: Thu, 21 Jan 2021 10:11:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 7/8] meson: Display cryto-related information altogether
Message-ID: <20210121101127.GF3125227@redhat.com>
References: <20210121095616.1471869-1-philmd@redhat.com>
 <20210121095616.1471869-8-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121095616.1471869-8-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 10:56:15AM +0100, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Daniel P. Berrange <berrange@redhat.com>
> ---
>  meson.build | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index e372b69f163..9274775a81a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2453,19 +2453,8 @@
>  endif
>  summary(summary_info, bool_yn: true, section: 'Block layer support')
>  
> +# Crypto

Rather than a comment why not introduce grouping in the output
so it is visible when reading the summary.

This can be done in meson by calling summary() multiple times
giving "section: 'Crypto'"  arg.

>  summary_info = {}
> -summary_info += {'sparse enabled':    sparse.found()}
> -if targetos == 'darwin'
> -  summary_info += {'Cocoa support':   cocoa.found()}
> -endif
> -# TODO: add back version
> -summary_info += {'SDL support':       sdl.found()}
> -summary_info += {'SDL image support': sdl_image.found()}
> -# TODO: add back version
> -summary_info += {'GTK support':       gtk.found()}
> -summary_info += {'pixman':            pixman.found()}
> -# TODO: add back version
> -summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
>  summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
>  summary_info += {'GNUTLS support':    config_host.has_key('CONFIG_GNUTLS')}
>  # TODO: add back version
> @@ -2479,6 +2468,24 @@
>  if config_host.has_key('CONFIG_NETTLE')
>     summary_info += {'  XTS':             not config_host.has_key('CONFIG_QEMU_PRIVATE_XTS')}
>  endif
> +summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
> +summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
> +summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
> +summary(summary_info, bool_yn: true, section: 'Crypto')
> +
> +summary_info = {}
> +summary_info += {'sparse enabled':    sparse.found()}
> +if targetos == 'darwin'
> +  summary_info += {'Cocoa support':   cocoa.found()}
> +endif
> +# TODO: add back version
> +summary_info += {'SDL support':       sdl.found()}
> +summary_info += {'SDL image support': sdl_image.found()}
> +# TODO: add back version
> +summary_info += {'GTK support':       gtk.found()}
> +summary_info += {'pixman':            pixman.found()}
> +# TODO: add back version
> +summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
>  summary_info += {'libtasn1':          config_host.has_key('CONFIG_TASN1')}
>  summary_info += {'PAM':               config_host.has_key('CONFIG_AUTH_PAM')}
>  summary_info += {'iconv support':     iconv.found()}
> @@ -2531,7 +2538,6 @@
>    summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
>  endif
>  summary_info += {'seccomp support':   seccomp.found()}
> -summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
>  summary_info += {'GlusterFS support': glusterfs.found()}
>  summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
>  summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
> @@ -2547,8 +2553,6 @@
>  summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
>  summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
>  summary_info += {'libudev':           libudev.found()}
> -summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
> -summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
>  summary(summary_info, bool_yn: true, section: 'Misc')
>  
>  if not supported_cpus.contains(cpu)
> -- 
> 2.26.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


