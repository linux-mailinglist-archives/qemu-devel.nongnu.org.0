Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A3A510C91
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:21:37 +0200 (CEST)
Received: from localhost ([::1]:43466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUUz-0002FW-4g
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njUTF-0000a2-G7
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:19:49 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:42736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njUTF-0001od-6S; Tue, 26 Apr 2022 19:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=6ReqNfvQzCi9d1K4kyrLX1LossDtMCei30gdj5L2FQg=; b=IG9vgkpl/On41odrSxPr
 IZGMI0/tgnoq/cWAFp0fkgYXVViWMXEbCpG2UBp5FkDVChA9vWCXhAw6XbuBghHqawbHajiTUlgQw
 X9vrzKmlBhZO/Rbw6qN+nZarYDGXrwr/9qZBxv25B8ULmUlFG0s/z1GQ/O39QpOUChsuEooDH68Vb
 siXQYaScLM4D1Ou2J/9XC+AvtOVA3QuGvuRVyDmS7jqghY3lxuVGAXgawR79G2ALxpy+xJ+gefqDQ
 ZJ7yMLQjXRaYpTpoQJBJEcZJfPbijF5p9UcO1m1AvOYefp5c6KoYuiUrlXDWmy/dBKSolkpVatJhU
 ej+LWgjmKLUxNQ==;
Received: from [2a01:cb19:956:1b00:de41:a9ff:fe47:ec49] (port=47982 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1njUTE-0007UT-Vl; Tue, 26 Apr 2022 19:19:49 -0400
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@gnu.org>) id 1njUTD-002B61-AL;
 Wed, 27 Apr 2022 01:19:47 +0200
Date: Wed, 27 Apr 2022 01:19:47 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 4/4] net: slirp: allow CFI with libslirp >= 4.7
Message-ID: <20220426231947.xcm3dwvygypyu2as@begin>
References: <20220412121337.207203-1-pbonzini@redhat.com>
 <20220412121337.207203-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220412121337.207203-5-pbonzini@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, dbuono@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini, le mar. 12 avril 2022 14:13:37 +0200, a ecrit:
> slirp 4.7 introduces a new CFI-friendly timer callback that does
> not pass function pointers within libslirp as callbacks for timers.
> Check the version number and, if it is new enough, allow using CFI
> even with a system libslirp.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  meson.build | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 861de93c4f..92a83580a3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2485,21 +2485,21 @@ if have_system
>      slirp = declare_dependency(link_with: libslirp,
>                                 dependencies: slirp_deps,
>                                 include_directories: slirp_inc)
> +  else
> +    # slirp <4.7 is incompatible with CFI support in QEMU.  This is because
> +    # it passes function pointers within libslirp as callbacks for timers.
> +    # When using a system-wide shared libslirp, the type information for the
> +    # callback is missing and the timer call produces a false positive with CFI.
> +    #
> +    # Now that slirp_opt has been defined, check if the selected slirp is compatible
> +    # with control-flow integrity.
> +    if get_option('cfi') and slirp.found() and slirp.version().version_compare('<4.7')
> +      error('Control-Flow Integrity is not compatible with system-wide slirp.' \
> +             + ' Please configure with --enable-slirp=git or upgrade to libslirp 4.7')
> +    endif
>    endif
>  endif
>  
> -# For CFI, we need to compile slirp as a static library together with qemu.
> -# This is because we register slirp functions as callbacks for QEMU Timers.
> -# When using a system-wide shared libslirp, the type information for the
> -# callback is missing and the timer call produces a false positive with CFI.
> -#
> -# Now that slirp_opt has been defined, check if the selected slirp is compatible
> -# with control-flow integrity.
> -if get_option('cfi') and slirp_opt == 'system'
> -  error('Control-Flow Integrity is not compatible with system-wide slirp.' \
> -         + ' Please configure with --enable-slirp=git')
> -endif
> -
>  fdt = not_found
>  if have_system
>    fdt_opt = get_option('fdt')
> -- 
> 2.35.1
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

