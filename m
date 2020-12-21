Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE56B2E0204
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 22:20:34 +0100 (CET)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krSba-0000KT-1x
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 16:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1krSZD-0007rW-6Q
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:18:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1krSZ9-0001Ap-Se
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608585482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO5HjRQZTUN0tfg8FiDjOPofngmo+rIv5IuHxb0FO6Y=;
 b=ej3HTYboJv3tHgtJUN/kSUI/l3HeuAySzAOlRp+KmvzzzNkt/H/mhWFK0nriWvX/v+HZnt
 SNuZl97JHYUrBjahyDRPuNDxLeJQHsn+nJD6m5BQ9cLy6iyFBPbcE22i+zXFHd175rsFuS
 5OVuOv+/r58dC5Di2xK/eg1eeEvltNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-XoHZGxyCPA2wBjjDcrZvHA-1; Mon, 21 Dec 2020 16:18:00 -0500
X-MC-Unique: XoHZGxyCPA2wBjjDcrZvHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB5ED1927824;
 Mon, 21 Dec 2020 21:17:27 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97B5010016FA;
 Mon, 21 Dec 2020 21:17:25 +0000 (UTC)
Subject: Re: [PATCH v2 8/8] tests/acceptance: Test boot_linux_console for
 fuloong2e
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219072326.40157-2-jiaxun.yang@flygoat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <7c56e077-1b9b-31dd-ae6c-4ce7b7ec9641@redhat.com>
Date: Mon, 21 Dec 2020 18:17:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201219072326.40157-2-jiaxun.yang@flygoat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/19/20 4:23 AM, Jiaxun Yang wrote:
> The kernel comes from debian archive so it's trusted.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   tests/acceptance/boot_linux_console.py | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)

Phillipe has already tested it, so I only reviewed the code.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index cc6ec0f8c1..fb41bb7144 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -170,6 +170,27 @@ class BootLinuxConsole(LinuxKernelTest):
>           console_pattern = 'Kernel command line: %s' % kernel_command_line
>           self.wait_for_console_pattern(console_pattern)
>   
> +    def test_mips64el_fuloong2e(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=machine:fuloong2e
> +        :avocado: tags=endian:little
> +        """
> +        deb_url = ('http://archive.debian.org/debian/pool/main/l/linux/'
> +                   'linux-image-3.16.0-6-loongson-2e_3.16.56-1+deb8u1_mipsel.deb')
> +        deb_hash = 'd04d446045deecf7b755ef576551de0c4184dd44'
> +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> +        kernel_path = self.extract_from_deb(deb_path,
> +                                            '/boot/vmlinux-3.16.0-6-loongson-2e')
> +
> +        self.vm.set_console()
> +        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +        console_pattern = 'Kernel command line: %s' % kernel_command_line
> +        self.wait_for_console_pattern(console_pattern)
> +
>       def test_mips_malta_cpio(self):
>           """
>           :avocado: tags=arch:mips


