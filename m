Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1247F34714A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 06:56:16 +0100 (CET)
Received: from localhost ([::1]:45286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOwV4-0008Ef-JA
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 01:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOwRr-0007UL-Dt
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 01:52:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOwRo-0005B4-36
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 01:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616565170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mN5S36h5RA5HqOvyxrSzX8JSXsShVoARyt5kWWZJho=;
 b=XWpIa7Pz8jMYdIPFefTVpqaqWld6WVObGd8fQePC5g6+HdxHwTyLWjKRrS39dJT7A5Dk0R
 +JIqN6Wm3ayHXoQInBys2Zg3RRqc463lHbENqd4do++idtrWDtV6ynpiNUc1i7+eFDXDtM
 +m6lCiq7exJcVdITGMReneyTRaPIJXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-p8LX0RUfNIOk20SxkYjneg-1; Wed, 24 Mar 2021 01:52:47 -0400
X-MC-Unique: p8LX0RUfNIOk20SxkYjneg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DA56612A2;
 Wed, 24 Mar 2021 05:52:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E23423805;
 Wed, 24 Mar 2021 05:52:44 +0000 (UTC)
Subject: Re: [RFC PATCH 10/13] blobs: Only install s390x firmwares if s390x
 system target is built
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-11-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <345ac2d0-3e52-3026-d010-52398c8b5896@redhat.com>
Date: Wed, 24 Mar 2021 06:52:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323155132.238193-11-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/2021 16.51, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-s390x@nongnu.org
> ---
>   meson.build         | 2 ++
>   pc-bios/meson.build | 9 +++++++--
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 4b614b30ed9..fccda30ffc7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -99,6 +99,7 @@
>   install_blobs_microblaze = false
>   install_blobs_ppc = false
>   install_blobs_riscv = false
> +install_blobs_s390x = false
>   if get_option('install_blobs')
>     foreach target : target_dirs
>       install_edk2_blobs = install_edk2_blobs or target in edk2_targets
> @@ -108,6 +109,7 @@
>       install_blobs_microblaze = install_blobs_microblaze or target in ['microblaze-softmmu', 'microblazeel-softmmu']
>       install_blobs_ppc = install_blobs_ppc or (target.startswith('ppc') and target.endswith('softmmu'))
>       install_blobs_riscv = install_blobs_riscv or target in ['riscv32-softmmu', 'riscv64-softmmu']
> +    install_blobs_s390x = install_blobs_s390x or target in ['s390x-softmmu']
>     endforeach
>   endif
>   
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 504f03ec925..27c0f316dee 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -64,8 +64,6 @@
>     'linuxboot_dma.bin',
>     'kvmvapic.bin',
>     'pvh.bin',
> -  's390-ccw.img',
> -  's390-netboot.img',
>   ))
>   
>   if host_machine.system() == 'windows'
> @@ -121,6 +119,13 @@
>     ))
>   endif
>   
> +if install_blobs_s390x
> +  blobs_ss.add(files(
> +    's390-ccw.img',
> +    's390-netboot.img',
> +  ))
> +endif
> +
>   blobs_ss = blobs_ss.apply(config_host, strict: false)
>   
>   if get_option('install_blobs')
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


