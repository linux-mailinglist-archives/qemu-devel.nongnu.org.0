Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12D42F6B98
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:57:26 +0100 (CET)
Received: from localhost ([::1]:35274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08kH-00038N-PJ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l08dM-0004Ol-MB
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:50:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l08dL-0003Nn-1R
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610653814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Li1+q5sjzmShAje2A6MvVDmZOi9DnCPXF9UXiMHto1s=;
 b=cYiV6bubZg+t8Qv4bKRPAlKv1YQJTGJHbgd94IL0HntIGxodkT5tza9tqV3WSNsGERbuzi
 s1ohsGLOBzQ0aX74584TL3p+o5v2NtAfhjGzsPlZHF6DD5QSGOC72+KdZEO37k6z3UaxM+
 tUMN1utT0uthK5Qm69uZL3RbemV35rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-Z2f4hWE6OgqQW3w6oaF4iQ-1; Thu, 14 Jan 2021 14:50:12 -0500
X-MC-Unique: Z2f4hWE6OgqQW3w6oaF4iQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD141801FCC
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 19:50:11 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-194.ams2.redhat.com
 [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBDFA12D7E;
 Thu, 14 Jan 2021 19:50:10 +0000 (UTC)
Subject: Re: [PATCH 2/2] meson.build: Detect bzip2 program
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114174509.2944817-1-philmd@redhat.com>
 <20210114174509.2944817-3-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <4372ebb1-3f86-a8e5-e140-13cb37f72e40@redhat.com>
Date: Thu, 14 Jan 2021 20:50:09 +0100
MIME-Version: 1.0
In-Reply-To: <20210114174509.2944817-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/14/21 18:45, Philippe Mathieu-Daudé wrote:
> The --enable-bzip2/--disable-bzip2 configure arguments are
> somehow misleading, they check for the bzip2 library, not
> the bzip2 program.
> 
> We need the bzip2 program to install the EDK2 firmware blobs
> (see commit 623ef637a2e "configure: Check bzip2 is available").
> 
> Check if the bzip2 program in the global meson.build to avoid
> the configuration to succeed, but a later when trying to install
> the firmware blobs:
> 
>     ../pc-bios/meson.build:5:2: ERROR: Program 'bzip2' not found
> 
> Reported-by: John Snow <jsnow@redhat.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Fixes: c8d5450bba3 ("configure: move install_blobs from configure to meson")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  meson.build         | 2 ++
>  pc-bios/meson.build | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index ecc45d04d6a..954152c90fe 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -96,6 +96,8 @@
>    endforeach
>  endif
>  
> +bzip2 = find_program('bzip2', required: install_edk2_blobs)
> +
>  ##################
>  # Compiler flags #
>  ##################
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 6a341b6cea0..af95c5d1f1d 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -1,5 +1,4 @@
>  if install_edk2_blobs
> -  bzip2 = find_program('bzip2', required: true)
>    fds = [
>      'edk2-aarch64-code.fd',
>      'edk2-arm-code.fd',
> 

Right, this looks sensible; still it makes me think patch#1 is only prep
for this. (That's OK, but then patch#1 should say so.)

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks
laszlo


