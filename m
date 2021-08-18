Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C83F002F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 11:17:13 +0200 (CEST)
Received: from localhost ([::1]:40198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHhA-0007Ff-2A
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 05:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHft-0006VM-W7
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 05:15:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38626
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHfs-0000Ey-92
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 05:15:53 -0400
Received: from host86-179-247-14.range86-179.btcentralplus.com
 ([86.179.247.14] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHfY-000CUh-F4; Wed, 18 Aug 2021 10:15:32 +0100
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210810140653.3969823-1-berrange@redhat.com>
 <20210810140653.3969823-2-berrange@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <11174538-e2fb-cd99-de92-3153fa56d017@ilande.co.uk>
Date: Wed, 18 Aug 2021 10:15:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210810140653.3969823-2-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.247.14
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/2] gitlab: exclude sparc-softmmu and riscv32-softmmu
 from cross builds
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.961,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/2021 15:06, Daniel P. Berrangé wrote:

> We need to cut down compile time by excluding more targets. Both these
> targets still have their 64-bit variant enabled, so the loss of coverage
> is mitigated to some degree.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/crossbuild-template.yml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> index 7d3ad00a1e..cfb576b54c 100644
> --- a/.gitlab-ci.d/crossbuild-template.yml
> +++ b/.gitlab-ci.d/crossbuild-template.yml
> @@ -9,7 +9,8 @@
>         ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
>           --disable-user --target-list-exclude="arm-softmmu cris-softmmu
>             i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
> -          mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
> +          mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
> +          sparc-softmmu xtensa-softmmu"
>       - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>       - if grep -q "EXESUF=.exe" config-host.mak;
>         then make installer;

I'd prefer to keep sparc-softmmu if possible, simply because my everyday platform is 
Linux and so having a cross-build for Windows will catch things that I may miss on a 
day-to-day basis. Is sparc-softmmu currently enabled as part of the native MINGW64 build?

If I go to my Gitlab QEMU fork Settings -> CI/CD -> Variables there is an option to 
set variables that can be used in job scripts. Perhaps this could be used so that I 
can configure my personal QEMU fork to always run sparc-softmmu builds when preparing 
PRs even if they aren't enabled for everyone by default? At least this would then 
allow me to spot any breakage before sending a final PR to Peter.


ATB,

Mark.

