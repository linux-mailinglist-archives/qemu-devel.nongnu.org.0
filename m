Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D5C5F2F4B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 13:08:35 +0200 (CEST)
Received: from localhost ([::1]:48038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofJJI-0003yN-Oc
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 07:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org>)
 id 1ofJCP-0008Ut-CY
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:01:29 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:56310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org>)
 id 1ofJCL-00061M-OJ
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:01:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55728B8105D;
 Mon,  3 Oct 2022 11:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE00C43141;
 Mon,  3 Oct 2022 11:01:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="g7Pz5w32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664794875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EyZqE4kZzK1B3EQpjmPP5SV6n215i9BCsiMlfzZTN7Y=;
 b=g7Pz5w32RsNf3nxXrYWRsrlBvFvvvn4DVvTFOS/DpbIi80b4ZaLc+8puuAyHWpsw6OsyQp
 0hPx+hbUu1A6iwQAZRUZRKhaVw5Q15tda5YDXMBmRyWfZN09xGELVSXeh2nInX/UCR2fbQ
 Y+Z6a0CULcSYCWBhS7R9+bo5AOcfHLE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ddba5930
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 3 Oct 2022 11:01:15 +0000 (UTC)
Date: Mon, 3 Oct 2022 13:01:13 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, marcandre.lureau@redhat.com
Subject: Re: [PATCH] meson: -display dbus and CFI are incompatible
Message-ID: <YzrA+bybdokCN6nX@zx2c4.com>
References: <20220930075324.13550-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220930075324.13550-1-pbonzini@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=zLWo=2E=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 09:53:24AM +0200, Paolo Bonzini wrote:
> The generated skeletons for DBus call the finalize method of the parent
> type using code like
> 
>     G_OBJECT_CLASS (qemu_dbus_display1_chardev_skeleton_parent_class)->finalize (object);
> 
> However, the finalize method is defined in a shared library that is not
> compiled with CFI.  Do not enable anything that uses gdbus-codegen if
> --enable-cfi was specified.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index f6962834a3..6106daf267 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -515,6 +515,7 @@ meson.override_dependency('glib-2.0', glib)
>  
>  gio = not_found
>  gdbus_codegen = not_found
> +gdbus_codegen_error = '@0@ requires gdbus-codegen, please install libgio'
>  if not get_option('gio').auto() or have_system
>    gio = dependency('gio-2.0', required: get_option('gio'),
>                     method: 'pkg-config', kwargs: static_kwargs)
> @@ -539,6 +540,10 @@ if not get_option('gio').auto() or have_system
>                               version: gio.version())
>    endif
>  endif
> +if gdbus_codegen.found() and get_option('cfi')
> +  gdbus_codegen = not_found
> +  gdbus_codegen_error = '@0@ uses gdbus-codegen, which does not support control flow integrity')

FYI, you've got a trailing paren here that will break.

Jason

