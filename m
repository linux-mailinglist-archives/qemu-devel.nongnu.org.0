Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3FD30D705
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:07:45 +0100 (CET)
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7F4a-0001Dz-9e
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7F2f-0000ht-Tb
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:05:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7F2R-0006aJ-Ag
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612346728;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKrZX0F1AXPMZ2mhGvNttihs1p7BySOSFM/ZDZi0vig=;
 b=Ym0rYDDlCRb8f1C0g9kr9O8ZTmbnDMyWQZ1W0zjrsbK60F3eb2s7rMw0ZQw6pe54Pnvn8K
 /7JUxBGZEkfE59fn/fUaF5bmQP5zEa4hwtNKdMApdoQPtGcYb7dvqmhv3HTYKAdkbfOOXg
 ZO7uXYOlAfuy2w3zOAtgUKSr6SqlMFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-Ajpcyl_dOW6KFj9JPRfL2w-1; Wed, 03 Feb 2021 05:05:24 -0500
X-MC-Unique: Ajpcyl_dOW6KFj9JPRfL2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 414141015ED6;
 Wed,  3 Feb 2021 10:05:23 +0000 (UTC)
Received: from redhat.com (ovpn-115-117.ams2.redhat.com [10.36.115.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00C1960CA4;
 Wed,  3 Feb 2021 10:04:46 +0000 (UTC)
Date: Wed, 3 Feb 2021 10:04:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 01/12] ui: Replace the word 'whitelist'
Message-ID: <20210203100443.GC300990@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202205824.1085853-2-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Feb 02, 2021 at 09:58:13PM +0100, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "whitelist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  ui/console.c       | 2 +-
>  ui/vnc-auth-sasl.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/ui/console.c b/ui/console.c
> index d80ce7037c3..9e13bf9020f 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1661,7 +1661,7 @@ bool dpy_gfx_check_format(QemuConsole *con,
>                  return false;
>              }
>          } else {
> -            /* default is to whitelist native 32 bpp only */
> +            /* default is to allow native 32 bpp only */
>              if (format != qemu_default_pixman_format(32, true)) {
>                  return false;
>              }
> diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
> index f67111a3662..dde4b8d4144 100644
> --- a/ui/vnc-auth-sasl.c
> +++ b/ui/vnc-auth-sasl.c
> @@ -288,7 +288,7 @@ static int protocol_client_auth_sasl_step(VncState *vs, uint8_t *data, size_t le
>              goto authreject;
>          }
>  
> -        /* Check username whitelist ACL */
> +        /* Check username allowlist ACL */

ACL expands to "access control list" so this original comment
was already redundant, and so is the replacement. Using
acronyms is bad practice, so I'd suggest we go for

  "Check the username access control list"

>          if (vnc_auth_sasl_check_access(vs) < 0) {
>              goto authreject;
>          }
> @@ -409,7 +409,7 @@ static int protocol_client_auth_sasl_start(VncState *vs, uint8_t *data, size_t l
>              goto authreject;
>          }
>  
> -        /* Check username whitelist ACL */
> +        /* Check username allowlist ACL */

Likewise

>          if (vnc_auth_sasl_check_access(vs) < 0) {
>              goto authreject;
>          }

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


