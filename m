Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1497401DB7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:42:17 +0200 (CEST)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGlD-0008Rn-KA
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNGjw-000726-HN
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:40:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNGju-0000qg-OQ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630942854;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TpFlgFwpdXC/PtgRmZpMphCHPbZXbEsO/0JEcc9hHY=;
 b=e4CzcbDTYPffZ0TV3MOdcgDzDcnxmEVeQcRtH2oYvmxvvK4yNftnzpF4mq5g6/rl7vUtF2
 loWi7XpJzga4PHBEbyodgHlGElZgopilY6kov0LcS2EXwhihMsE4hDV9zoePHY7MGArlg8
 tUK4oQDw1JjMDXUehDN4boGaytshH/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-kwi31h7LN_2ofozFv0mC6w-1; Mon, 06 Sep 2021 11:40:48 -0400
X-MC-Unique: kwi31h7LN_2ofozFv0mC6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 211FB80196C
 for <qemu-devel@nongnu.org>; Mon,  6 Sep 2021 15:40:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED39110016F2;
 Mon,  6 Sep 2021 15:40:43 +0000 (UTC)
Date: Mon, 6 Sep 2021 16:40:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] meson.build: Do not look for VNC-related libraries if
 have_system is not set
Message-ID: <YTY2ecFEeLx067D4@redhat.com>
References: <20210906153939.165567-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210906153939.165567-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06, 2021 at 05:39:39PM +0200, Thomas Huth wrote:
> When running "./configure --static --disable-system" there is currently
> a warning if the static version of libpng is missing:
> 
>  WARNING: Static library 'png16' not found for dependency 'libpng', may not
>  be statically linked
> 
> Since it does not make sense to look for the VNC-related libraries at all
> when we're building without system emulator binaries, let's add a check
> for have_system here to silence this warning.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 7e58e6279b..f07236d947 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -931,7 +931,7 @@ vnc = not_found
>  png = not_found
>  jpeg = not_found
>  sasl = not_found
> -if not get_option('vnc').disabled()
> +if have_system and not get_option('vnc').disabled()
>    vnc = declare_dependency() # dummy dependency
>    png = dependency('libpng', required: get_option('vnc_png'),
>                     method: 'pkg-config', kwargs: static_kwargs)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


