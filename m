Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37374583B18
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:20:15 +0200 (CEST)
Received: from localhost ([::1]:50592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGzgj-00023G-3j
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGz9q-0000PL-9G
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 04:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGz9l-0004Ya-48
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 04:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658997966;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWxCiUrvCNX0vBZiosye2LSBYn1do827hDQqw/vk9QM=;
 b=fInSYrUajDSAlA+LSM9DVL9p/jGKKb4pjrXffPCnJadanEbzbau/SpR3ou7reDOrmB3arD
 vuRDPeYzQZ0sfQpYjRwpwKyrXnYzhOwFo9jJxeeqQnhsS+bEoTb3SJJ7Kk/mLi58LPjXTD
 SDZEblUKBlSSPBnzYZMwwKHKU6cdYXw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-LSHHj3dbMZuxbyeIrQJOFA-1; Thu, 28 Jul 2022 04:46:04 -0400
X-MC-Unique: LSHHj3dbMZuxbyeIrQJOFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F03F7101A588
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 08:46:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E73C2026D64;
 Thu, 28 Jul 2022 08:46:03 +0000 (UTC)
Date: Thu, 28 Jul 2022 09:46:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: Re: [PATCH] ui: dbus-display requires CONFIG_GBM
Message-ID: <YuJMyFvP0bi/ZUsk@redhat.com>
References: <20220728064143.209559-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220728064143.209559-1-pbonzini@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Thu, Jul 28, 2022 at 08:41:43AM +0200, Paolo Bonzini wrote:
> Without CONFIG_GBM, compiling dbus-display fails with
> 
> ../ui/dbus.c: In function ‘dbus_create_context’:
> ../ui/dbus.c:47:20: error: ‘qemu_egl_rn_ctx’ undeclared (first use in this function); did you mean ‘qemu_egl_init_ctx’?
>    47 |                    qemu_egl_rn_ctx);
>       |                    ^~~~~~~~~~~~~~~
>       |                    qemu_egl_init_ctx
> ../ui/dbus.c:47:20: note: each undeclared identifier is reported only once for each function it appears in
> 
> and many other similar errors, because include/ui/egl-helpers.h only has
> these declaration if gbm is found on the system.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build    | 4 ++--
>  ui/meson.build | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 9b67db0d67..38403d2892 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1697,8 +1697,8 @@ dbus_display = get_option('dbus_display') \
>             error_message: '-display dbus requires glib>=2.64') \
>    .require(gdbus_codegen.found(),
>             error_message: '-display dbus requires gdbus-codegen') \
> -  .require(opengl.found(),
> -           error_message: '-display dbus requires epoxy/egl') \
> +  .require(opengl.found() and gbm.found(),
> +           error_message: '-display dbus requires epoxy/egl and gbm') \
>    .allowed()
>  
>  have_virtfs = get_option('virtfs') \
> diff --git a/ui/meson.build b/ui/meson.build
> index e9f48c5315..ec13949776 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -81,7 +81,7 @@ if dbus_display
>                                            '--interface-prefix', 'org.qemu.',
>                                            '--c-namespace', 'QemuDBus',
>                                            '--generate-c-code', '@BASENAME@'])
> -  dbus_ss.add(when: [gio, pixman, opengl],
> +  dbus_ss.add(when: [gio, pixman, opengl, gbm],
>                if_true: [files(
>                  'dbus-chardev.c',
>                  'dbus-clipboard.c',

Another fix was already posted a few days ago:

  https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg04420.html


but your patch looks slightly more correct, as it also adds the
gbm lib to dbus_ss.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


