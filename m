Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0123B2F6AA6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:16:06 +0100 (CET)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l086G-000812-Eh
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l080l-0006hg-0d
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:10:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l080Z-0006pM-Oc
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:10:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610651407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=falRLVhFKMNpEK5nUyCs5+Mi7Gx5iQ0rSo4KRxNZM04=;
 b=Np8/UdnErjtZ5TtYmOGQHDrrD58wb1EtalaKxGJADYhi7s2sKK2lxHKzM3oM8CLHkMtcNY
 PGviThQY7hMdZKLRoyFI3oDy3LVIPF9093YTlq72VeEuobTUA2zzArzu0dAFc5jyJKVQVU
 uiBWHqP7ikii8aol9sWTpaFRgd4p7ZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-Irfq8mWQOSqtmQ1flbJqPQ-1; Thu, 14 Jan 2021 14:10:04 -0500
X-MC-Unique: Irfq8mWQOSqtmQ1flbJqPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B31B8107AD5A
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 19:10:03 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38E681992D;
 Thu, 14 Jan 2021 19:10:03 +0000 (UTC)
Subject: Re: [PATCH 2/2] meson.build: Detect bzip2 program
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114174509.2944817-1-philmd@redhat.com>
 <20210114174509.2944817-3-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <d2f359d4-727b-aa20-341c-140991253f90@redhat.com>
Date: Thu, 14 Jan 2021 14:10:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114174509.2944817-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 12:45 PM, Philippe Mathieu-Daudé wrote:
> The --enable-bzip2/--disable-bzip2 configure arguments are
> somehow misleading, they check for the bzip2 library, not
> the bzip2 program.
> 

Well. I was mislead, but they're fine, really.

> We need the bzip2 program to install the EDK2 firmware blobs
> (see commit 623ef637a2e "configure: Check bzip2 is available").
> 
> Check if the bzip2 program in the global meson.build to avoid
> the configuration to succeed, but a later when trying to install
> the firmware blobs:
> 
>      ../pc-bios/meson.build:5:2: ERROR: Program 'bzip2' not found
> 
> Reported-by: John Snow <jsnow@redhat.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Fixes: c8d5450bba3 ("configure: move install_blobs from configure to meson")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   meson.build         | 2 ++
>   pc-bios/meson.build | 1 -
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index ecc45d04d6a..954152c90fe 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -96,6 +96,8 @@
>     endforeach
>   endif
>   
> +bzip2 = find_program('bzip2', required: install_edk2_blobs)
> +

Seems good though :)

>   ##################
>   # Compiler flags #
>   ##################
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 6a341b6cea0..af95c5d1f1d 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -1,5 +1,4 @@
>   if install_edk2_blobs
> -  bzip2 = find_program('bzip2', required: true)
>     fds = [
>       'edk2-aarch64-code.fd',
>       'edk2-arm-code.fd',
> 


