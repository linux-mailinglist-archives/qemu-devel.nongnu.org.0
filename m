Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2015327F8E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:34:28 +0100 (CET)
Received: from localhost ([::1]:46574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGigt-0006NQ-RC
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lGidu-0004Na-90
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:31:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lGids-0007za-DZ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614605479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBPK6rfpDqnVIy/jf6bCe/SKoPuvSp7/VXyoDnF9As4=;
 b=Tz4CiSCHpcPdYs6FcuP0SXOKe87mWl8oEbfQ5dolggI3bMYoTEDwNqNz7hEtFvhuRjXCYA
 hCaOd/0akDcYNYVNJreIdq6gXcz7XZNS3IG0fntB25mORnH5v730VSZvSa3vyGJbN64TLE
 OFJZ65rBoFLq2yHs5eVHJE3N74isuzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-xMMC-UswPXeYQcqMUquHJA-1; Mon, 01 Mar 2021 08:31:05 -0500
X-MC-Unique: xMMC-UswPXeYQcqMUquHJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F789107ACC7;
 Mon,  1 Mar 2021 13:31:04 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA6AC19C45;
 Mon,  1 Mar 2021 13:31:00 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Use imgtec.com URL for Fedora 22
 artifacts
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210228224343.310677-1-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <c11afdea-2faf-b445-cb35-05fed0c99a35@redhat.com>
Date: Mon, 1 Mar 2021 10:30:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210228224343.310677-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/28/21 7:43 PM, Philippe Mathieu-Daudé wrote:
> Having artifacts stored in personal namespace is not ideal,
> as these might get closed and disappear. Use the original URL
> where these artifacts could be found.
>
> For more references:
> https://fedoraproject.org/wiki/Architectures/MIPS/2015Bootstrap/mips64el
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/acceptance/boot_linux_console.py | 4 ++--
>   tests/acceptance/replay_kernel.py      | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index eb012867997..138bd8cb7d3 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -239,8 +239,8 @@ def test_mips64el_malta_5KEc_cpio(self):
>           :avocado: tags=machine:malta
>           :avocado: tags=endian:little
>           """
> -        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
> -                      'raw/9ad2df38/mips/malta/mips64el/'
> +        kernel_url = ('http://mipsfedora.imgtec.com/development/22/'
> +                      'mips64el/images/20150601/'
>                         'vmlinux-3.19.3.mtoman.20150408')

http://mipsfedora.imgtec.com/development/22/mips64el/images/20150601/vmlinux-3.19.3.mtoman.20150408 
did not get resolve here. Could you please double-check the url is correct?

Thanks!

Wainer

>           kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
>           kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
> index c1cb8624683..efdd4233bc2 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -397,8 +397,8 @@ def test_mips64el_malta_5KEc_cpio(self):
>           :avocado: tags=endian:little
>           :avocado: tags=slowness:high
>           """
> -        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
> -                      'raw/9ad2df38/mips/malta/mips64el/'
> +        kernel_url = ('http://mipsfedora.imgtec.com/development/22/'
> +                      'mips64el/images/20150601/'
>                         'vmlinux-3.19.3.mtoman.20150408')
>           kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
>           kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)


