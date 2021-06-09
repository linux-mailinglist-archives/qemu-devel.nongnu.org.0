Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E233A14D6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:48:02 +0200 (CEST)
Received: from localhost ([::1]:45342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxcn-0003n3-D0
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqxae-0002on-VV
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:45:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqxac-00022b-Mp
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623242746;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2flDw4K7oHzq8KUrwZLDNUaCtXn8PlTYLJOju89Sxkk=;
 b=ioA+O9Tz34bAEhlOfyh6RnZEKjJR0jeyqshh4arOsKbONhR6XIyZ/loL5vv/eM0BgXkrxR
 E9EeN1BT49NLdVJ5TgKuLOR1TV7DVBgkyg8l644nmyGsHlxX0LTa7Rj8p/Q/g8vipa7Vrr
 4DTIiiMbcB9WKqRevZKk8+3Kjpl7fGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-bgR4xQtPMRyfEc4f7oUvTw-1; Wed, 09 Jun 2021 08:45:42 -0400
X-MC-Unique: bgR4xQtPMRyfEc4f7oUvTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06D6B801B12;
 Wed,  9 Jun 2021 12:45:41 +0000 (UTC)
Received: from redhat.com (ovpn-115-127.ams2.redhat.com [10.36.115.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E29BC5D9C6;
 Wed,  9 Jun 2021 12:45:39 +0000 (UTC)
Date: Wed, 9 Jun 2021 13:45:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Michael <fedora.dm0@gmail.com>
Subject: Re: [PATCH] configure: map x32 to cpu_family x86_64 for meson
Message-ID: <YMC38baIdFTL/q+f@redhat.com>
References: <878s3jrzm0.fsf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <878s3jrzm0.fsf@gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 08:28:39AM -0400, David Michael wrote:
> The meson.build file defines supported_cpus which does not contain
> x32, and x32 is not one of meson's stable built-in values:
> https://mesonbuild.com/Reference-tables.html#cpu-families
> 
> Signed-off-by: David Michael <fedora.dm0@gmail.com>
> ---
> 
> Hi,
> 
> QEMU fails to build for x32 due to that cpu_family not being defined in
> supported_cpus.  Can something like this be applied?
> 
> Alternatively, maybe it could be added to supported_cpus and accepted
> everywhere that matches x86 in meson.build, but upstream meson does not
> define a CPU type for x32.

"supported_cpus" serves two distinct purposes in meson.build

 - Identifies whether TCG supports the target
 - Identifies whether QEMU maintainers consider the target supported

The change proposed below makes x32 be treated the same as x86_64.

Maybe that's right for the question of TCG support, but I'm less
sure it is right from POV of QEMU maintainers expectations around
the x32 target status. AFAIK, we don't have any CI for x32 and
IIUC no maintainers are actively testing it manually, so it ought
to be in the unsupported category.


>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 8dcb9965b2..4478f3889a 100755
> --- a/configure
> +++ b/configure
> @@ -6384,7 +6384,7 @@ if test "$skip_meson" = no; then
>          i386)
>              echo "cpu_family = 'x86'" >> $cross
>              ;;
> -        x86_64)
> +        x86_64|x32)
>              echo "cpu_family = 'x86_64'" >> $cross
>              ;;
>          ppc64le)




Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


