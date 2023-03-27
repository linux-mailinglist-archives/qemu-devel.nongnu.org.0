Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7586C9F4C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 11:25:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgj6U-000780-PJ; Mon, 27 Mar 2023 05:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgj6R-000732-BL
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:25:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgj6P-0000nq-8c
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:25:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679909120;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IOCwidOc7PV8bVbaKzt+rUZ5i7+dDPWGPHdWqYBRui0=;
 b=G7E6l22mrVU9RCv8it/XqBYqtyEwUAAg8SHr1dNDA8gzAVLhryAfGkZd0GcLcixoW4AW2F
 eI8KQMxRGWMHl8IzcdKloWOV/sqQzPrRdEZKaLGHq3EOdqfgMkVB5NXHyVYi7eh37xNuZR
 yRizAB+buE7WIBfHvLvIzfubUKJC6dA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-jF_FG6zSMbK9NEj9GjmzMQ-1; Mon, 27 Mar 2023 05:25:16 -0400
X-MC-Unique: jF_FG6zSMbK9NEj9GjmzMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 780D585A588
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 09:25:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5E0B4020C82;
 Mon, 27 Mar 2023 09:25:15 +0000 (UTC)
Date: Mon, 27 Mar 2023 10:25:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: casantos@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH V2] meson: install keyboard maps only if necessary
Message-ID: <ZCFg+cjoVPZEUdkT@redhat.com>
References: <20230326211700.68254-1-casantos@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230326211700.68254-1-casantos@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On Sun, Mar 26, 2023 at 06:17:00PM -0300, casantos@redhat.com wrote:
> From: Carlos Santos <casantos@redhat.com>
> 
> They are required only for system emulation (i.e. have_system is true).
> 
> Signed-off-by: Carlos Santos <casantos@redhat.com>
> ---
>  pc-bios/keymaps/meson.build   | 6 ++++--
>  tests/fp/berkeley-testfloat-3 | 2 +-
>  ui/keycodemapdb               | 2 +-

This still has the accidental git submodule updates included

>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> index 158a3b410c..bff3083313 100644
> --- a/pc-bios/keymaps/meson.build
> +++ b/pc-bios/keymaps/meson.build
> @@ -47,7 +47,7 @@ if native_qemu_keymap.found()
>                         build_by_default: true,
>                         output: km,
>                         command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
> -                       install: true,
> +                       install: have_system,
>                         install_dir: qemu_datadir / 'keymaps')
>    endforeach
>  
> @@ -56,4 +56,6 @@ else
>    install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
>  endif
>  
> -install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> +if have_system
> +  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> +endif
> diff --git a/tests/fp/berkeley-testfloat-3 b/tests/fp/berkeley-testfloat-3
> index 40619cbb3b..5a59dcec19 160000
> --- a/tests/fp/berkeley-testfloat-3
> +++ b/tests/fp/berkeley-testfloat-3
> @@ -1 +1 @@
> -Subproject commit 40619cbb3bf32872df8c53cc457039229428a263
> +Subproject commit 5a59dcec19327396a011a17fd924aed4fec416b3
> diff --git a/ui/keycodemapdb b/ui/keycodemapdb
> index f5772a62ec..d21009b1c9 160000
> --- a/ui/keycodemapdb
> +++ b/ui/keycodemapdb
> @@ -1 +1 @@
> -Subproject commit f5772a62ec52591ff6870b7e8ef32482371f22c6
> +Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
> -- 
> 2.31.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


