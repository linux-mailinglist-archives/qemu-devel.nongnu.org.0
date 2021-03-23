Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9360D34661B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:17:00 +0100 (CET)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkeJ-0004Kz-EI
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lOjgh-0005is-U5
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:15:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lOjgf-0007wa-0a
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616516118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3deOgzVRXIcV0MnI38G1x86ObbNVJ88NVNnWVu2OpU=;
 b=cRcCtZ2hWEl3NNA/EjOnCfUGVJorWecGy6GyUqJRq/FUCe4i4So5VS1Vpfp3xzCFf9Hcd2
 PHyjlLYfgmRnCT2GbsF4FqpTP1PrO93I8JPUBnzoNxmtV7a9cV8WL8GdwtLLFWwp9Ev1CM
 HiAeoxDtDM/LuH777mlJR5BCN9p5TfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-SUl6e_YTNvi3Tx9dddUesw-1; Tue, 23 Mar 2021 12:15:16 -0400
X-MC-Unique: SUl6e_YTNvi3Tx9dddUesw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D58C51007B19;
 Tue, 23 Mar 2021 16:15:15 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-240.ams2.redhat.com
 [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4C3C5FCB3;
 Tue, 23 Mar 2021 16:15:02 +0000 (UTC)
Subject: Re: [RFC PATCH 02/13] blobs: Only install EDK2 license file if EDK2
 blobs are installed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-3-f4bug@amsat.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <4c65f6fa-9269-bd89-8e8a-4d9f7e98e6a9@redhat.com>
Date: Tue, 23 Mar 2021 17:15:01 +0100
MIME-Version: 1.0
In-Reply-To: <20210323155132.238193-3-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/23/21 16:51, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Laszlo Ersek <lersek@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  pc-bios/meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 1c4074bcb0d..d270d8516c9 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -22,6 +22,8 @@
>                    install_dir: qemu_datadir,
>                    command: [ bzip2, '-dc', '@INPUT0@' ])
>    endforeach
> +
> +  blobs_ss.add(files('edk2-licenses.txt'))
>  endif
>  
>  blobs_ss.add(files(
> @@ -76,7 +78,6 @@
>    'u-boot.e500',
>    'u-boot-sam460-20100605.bin',
>    'qemu_vga.ndrv',
> -  'edk2-licenses.txt',
>    'hppa-firmware.img',
>    'opensbi-riscv32-generic-fw_dynamic.bin',
>    'opensbi-riscv64-generic-fw_dynamic.bin',
> 

Acked-by: Laszlo Ersek <lersek@redhat.com>


