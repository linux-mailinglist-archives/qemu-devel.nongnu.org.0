Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBABA54DE23
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 11:26:43 +0200 (CEST)
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lly-0004az-OR
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 05:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1l7l-0001ZC-9K
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1l7f-0007wI-W4
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655369102;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Pdt5f39BgTSvWoHfOfZ4sFcFCfyTyyY65RwdESZlA5Y=;
 b=JAtTjzxl4efltdfQL5XxM9gF3Mf1FIxdP7Epwm4lGdnxjjrScdGxakMjLwt5rgJSPHfd64
 /XrDyM+x475dyhkY6JOxQQNKKWT2v667X0h1+9OjAN7xAgvjaEZ8XYsg3jIrq8vULjTBwI
 WygnrnxIOmYykmYp2AVU72IWvGxgEog=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-zCOA0ca4MTikao-hOy-jYA-1; Thu, 16 Jun 2022 04:45:01 -0400
X-MC-Unique: zCOA0ca4MTikao-hOy-jYA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17B0485A581;
 Thu, 16 Jun 2022 08:45:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E60DC40334E;
 Thu, 16 Jun 2022 08:44:59 +0000 (UTC)
Date: Thu, 16 Jun 2022 09:44:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, akihiko.odaki@gmail.com
Subject: Re: [PATCH] tests/vm: do not specify -bios option
Message-ID: <YqrtiL18Z2jWCHM3@redhat.com>
References: <20220616083025.116902-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616083025.116902-1-pbonzini@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Thu, Jun 16, 2022 at 10:30:25AM +0200, Paolo Bonzini wrote:
> When running from the build tree, the executable is able to find
> the BIOS on its own; when running from the source tree, a firmware
> blob should already be installed and there is no guarantee that
> the one in the source tree works with the QEMU that is being used for
> the installation.

I think there is interaction with

  --firmwarepath=/usr/share/qemu-firmware:/usr/share/ipxe/qemu:/usr/share/seavgabios:/usr/share/seabios:/usr/share/sgabios

as the firmware path listed there will be searched before the local
build tree.

I agree with your desire to remove the -bios option, but I'm not
sure it is entirely safe unless logic in qemu_find_file is fixed
to ignore the global search path when running from the build
tree.

> Just remove the -bios option, since it is unnecessary and in fact
> there are other x86 VM tests that do not bother specifying it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/vm/fedora  | 1 -
>  tests/vm/freebsd | 1 -
>  tests/vm/netbsd  | 1 -
>  tests/vm/openbsd | 1 -
>  4 files changed, 4 deletions(-)
> 
> diff --git a/tests/vm/fedora b/tests/vm/fedora
> index 92b78d6e2c..12eca919a0 100755
> --- a/tests/vm/fedora
> +++ b/tests/vm/fedora
> @@ -79,7 +79,6 @@ class FedoraVM(basevm.BaseVM):
>          self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
>          self.print_step("Booting installer")
>          self.boot(img_tmp, extra_args = [
> -            "-bios", "pc-bios/bios-256k.bin",
>              "-machine", "graphics=off",
>              "-device", "VGA",
>              "-cdrom", iso
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 805db759d6..cd1fabde52 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -95,7 +95,6 @@ class FreeBSDVM(basevm.BaseVM):
>  
>          self.print_step("Booting installer")
>          self.boot(img_tmp, extra_args = [
> -            "-bios", "pc-bios/bios-256k.bin",
>              "-machine", "graphics=off",
>              "-device", "VGA",
>              "-cdrom", iso
> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
> index 45aa9a7fda..aa883ec23c 100755
> --- a/tests/vm/netbsd
> +++ b/tests/vm/netbsd
> @@ -86,7 +86,6 @@ class NetBSDVM(basevm.BaseVM):
>  
>          self.print_step("Booting installer")
>          self.boot(img_tmp, extra_args = [
> -            "-bios", "pc-bios/bios-256k.bin",
>              "-machine", "graphics=off",
>              "-cdrom", iso
>          ])
> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> index 13c8254214..6f1b6f5b98 100755
> --- a/tests/vm/openbsd
> +++ b/tests/vm/openbsd
> @@ -82,7 +82,6 @@ class OpenBSDVM(basevm.BaseVM):
>  
>          self.print_step("Booting installer")
>          self.boot(img_tmp, extra_args = [
> -            "-bios", "pc-bios/bios-256k.bin",
>              "-machine", "graphics=off",
>              "-device", "VGA",
>              "-cdrom", iso
> -- 
> 2.36.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


