Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96526453016
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:17:28 +0100 (CET)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwSt-0008Lb-NB
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:17:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmwPf-0004s7-W2
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmwPd-000688-16
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637061241;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/g+6y4Mk5wEAw6pde4LyINaXOao/Dal7vUv8ol+5eM=;
 b=BeZlAtAxT38orI04w/bBaUtDjpbggUnLS9VXeJqY6NqWMXmf96mqyinrPcQteHNMyXuL27
 j5Tw9FQEDvy0fuMGdKC//5arjBx1jxS6tJUXff8iMISRzxQLEt9mqyGa8CfeyL2Ge+yjU+
 UQo68YdOlUXP1uI3XYHkUK0ldVmKa7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-C1xf3LlCNEat1AkQZCSGLA-1; Tue, 16 Nov 2021 06:13:54 -0500
X-MC-Unique: C1xf3LlCNEat1AkQZCSGLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93EBE8042E5;
 Tue, 16 Nov 2021 11:13:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C664E5D6BA;
 Tue, 16 Nov 2021 11:13:52 +0000 (UTC)
Date: Tue, 16 Nov 2021 11:13:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: fix botched compile check conversions
Message-ID: <YZOSboL0YCFKYFh3@redhat.com>
References: <20211116093834.76615-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211116093834.76615-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 10:38:34AM +0100, Paolo Bonzini wrote:
> Fix a bunch of incorrect conversions from configure to Meson, which result
> in different outcomes with --extra-cflags=-Werror.
> 
> pthread_setname_np needs "#define _GNU_SOURCE" on Linux (which I am using
> also for the non-Linux check, so that it correctly fails with an error
> about having too few parameters).
> 
> Fix struct checks to use has_type instead of has_symbol, and "#define
> _GNU_SOURCE" too in the case of struct mmsghdr.

Ok, so relies on fact that passing an incorrect number of arguments
is a fatal error, when function prototypes are available, even
without -Werror being set.

Side note, GCC looks to be trying to make explicit function prototypes
mandatory at last

  https://linuxplumbersconf.org/event/11/contributions/1014/

> Remove an apostrophe that ended up at the end of a #include line.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

And the setname_np stuff, I've tested on Fedora 34 and FreebSD 12.2

Tested-by: Daniel P. Berrangé <berrange@redhat.com>


> ---
>  meson.build | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 2ece4fe088..93a5e50a16 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1547,8 +1547,6 @@ config_host_data.set('CONFIG_INOTIFY',
>                       cc.has_header_symbol('sys/inotify.h', 'inotify_init'))
>  config_host_data.set('CONFIG_INOTIFY1',
>                       cc.has_header_symbol('sys/inotify.h', 'inotify_init1'))
> -config_host_data.set('CONFIG_IOVEC',
> -                     cc.has_header_symbol('sys/uio.h', 'struct iovec'))
>  config_host_data.set('CONFIG_MACHINE_BSWAP_H',
>                       cc.has_header_symbol('machine/bswap.h', 'bswap32',
>                                            prefix: '''#include <sys/endian.h>
> @@ -1561,8 +1559,6 @@ config_host_data.set('CONFIG_SYSMACROS',
>                       cc.has_header_symbol('sys/sysmacros.h', 'makedev'))
>  config_host_data.set('HAVE_OPTRESET',
>                       cc.has_header_symbol('getopt.h', 'optreset'))
> -config_host_data.set('HAVE_UTMPX',
> -                     cc.has_header_symbol('utmpx.h', 'struct utmpx'))
>  config_host_data.set('HAVE_IPPROTO_MPTCP',
>                       cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
>  
> @@ -1574,6 +1570,14 @@ config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
>                       cc.has_member('struct stat', 'st_atim',
>                                     prefix: '#include <sys/stat.h>'))
>  
> +# has_type
> +config_host_data.set('CONFIG_IOVEC',
> +                     cc.has_type('struct iovec',
> +                                 prefix: '#include <sys/uio.h>'))
> +config_host_data.set('HAVE_UTMPX',
> +                     cc.has_type('struct utmpx',
> +                                 prefix: '#include <utmpx.h>'))
> +
>  config_host_data.set('CONFIG_EVENTFD', cc.links('''
>    #include <sys/eventfd.h>
>    int main(void) { return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC); }'''))
> @@ -1615,7 +1619,7 @@ config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
>    #include <stddef.h>
>    int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONTNEED); }'''))
>  
> -config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_W_TID', cc.links('''
> +config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_W_TID', cc.links(gnu_source_prefix + '''
>    #include <pthread.h>
>  
>    static void *f(void *p) { return NULL; }
> @@ -1626,7 +1630,7 @@ config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_W_TID', cc.links('''
>      pthread_setname_np(thread, "QEMU");
>      return 0;
>    }''', dependencies: threads))
> -config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links('''
> +config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links(gnu_source_prefix + '''
>    #include <pthread.h>
>  
>    static void *f(void *p) { pthread_setname_np("QEMU"); return NULL; }
> @@ -1662,8 +1666,10 @@ config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
>  
>  have_l2tpv3 = false
>  if not get_option('l2tpv3').disabled() and have_system
> -  have_l2tpv3 = (cc.has_header_symbol('sys/socket.h', 'struct mmsghdr')
> -                 and cc.has_header('linux/ip.h'))
> +  have_l2tpv3 = cc.has_type('struct mmsghdr',
> +    prefix: gnu_source_prefix + '''
> +      #include <sys/socket.h>
> +      #include <linux/ip.h>''')
>  endif
>  config_host_data.set('CONFIG_L2TPV3', have_l2tpv3)
>  
> @@ -1689,7 +1695,7 @@ config_host_data.set('CONFIG_NETMAP', have_netmap)
>  # xfs headers will not try to redefine structs from linux headers
>  # if this macro is set.
>  config_host_data.set('HAVE_FSXATTR', cc.links('''
> -  #include <linux/fs.h>'
> +  #include <linux/fs.h>
>    struct fsxattr foo;
>    int main(void) {
>      return 0;
> -- 
> 2.33.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


