Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D164ED26
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:53:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6C5T-00088Y-Nj; Fri, 16 Dec 2022 09:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6C5Q-000835-S3
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:53:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6C5P-0000qU-8R
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671202398;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=d4vvKVgd9OCAs0eqKpBXU4kRV6Lw50Serk1bUVGRYbU=;
 b=JFNpafe6h5grnAk0sSSa3WPTMBK4gYEDVBJHheZ3psmNZ7MW9j5XzSa1avrAgs6sjEqk/P
 uBgjPynPQS6TlbT8ECoH106686E99ymFYl1TkOfYFz5O36slrghJ3Bcsdnk66WvQAhMkLg
 huLtTaObqnmu9f0xCfrelmrWo/142OA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-kRTAAVHZPdCSr2TB8sxF7A-1; Fri, 16 Dec 2022 09:53:17 -0500
X-MC-Unique: kRTAAVHZPdCSr2TB8sxF7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31CDB811E9C
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:53:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C21E51EF;
 Fri, 16 Dec 2022 14:53:16 +0000 (UTC)
Date: Fri, 16 Dec 2022 14:53:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 07/30] meson: support meson 0.64 -Doptimization=plain
Message-ID: <Y5yGWU1zXv/VRsQc@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-8-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221209112409.184703-8-pbonzini@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Fri, Dec 09, 2022 at 12:23:46PM +0100, Paolo Bonzini wrote:
> In Meson 0.64, the optimization built-in option now accepts the "plain" value,
> which will not set any optimization flags.  While QEMU does not check the
> contents of the option and therefore does not suffer any ill effect
> from the new value, it uses get_option to print the optimization flags
> in the summary.  Clean the code up to remove duplication, and check for
> -Doptimization=plain at the same time.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index d61c7a82f112..dbd0b5563446 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3752,18 +3752,16 @@ endif
>  if targetos == 'darwin'
>    summary_info += {'Objective-C compiler': ' '.join(meson.get_compiler('objc').cmd_array())}
>  endif
> -summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
> -                                               + ['-O' + get_option('optimization')]
> -                                               + (get_option('debug') ? ['-g'] : []))}
> +option_cflags = (get_option('debug') ? ['-g'] : [])
> +if get_option('optimization') != 'plain'
> +  option_cflags += ['-O' + get_option('optimization')]
> +endif

Instead of trying to secondguess what these flags will be turned into
by Meson, why not just log them directly

  summary_info += {'optimization': get_option('optimization')}
  summary_info += {'debug': get_option('debug')}

> +summary_info += {'CFLAGS':            ' '.join(get_option('c_args') + option_cflags)}
>  if link_language == 'cpp'
> -  summary_info += {'CXXFLAGS':        ' '.join(get_option('cpp_args')
> -                                               + ['-O' + get_option('optimization')]
> -                                               + (get_option('debug') ? ['-g'] : []))}
> +  summary_info += {'CXXFLAGS':        ' '.join(get_option('cpp_args') + option_cflags)}
>  endif
>  if targetos == 'darwin'
> -  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args')
> -                                               + ['-O' + get_option('optimization')]
> -                                               + (get_option('debug') ? ['-g'] : []))}
> +  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args') + option_cflags)}
>  endif
>  link_args = get_option(link_language + '_link_args')
>  if link_args.length() > 0
> -- 
> 2.38.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


