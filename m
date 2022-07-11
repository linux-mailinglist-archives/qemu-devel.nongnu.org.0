Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E9D57072E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:35:44 +0200 (CEST)
Received: from localhost ([::1]:56144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAvRn-0002FA-Vx
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oAvJZ-0003YG-Ag
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:27:13 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oAvJW-00050l-K5
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:27:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1EE7328866;
 Mon, 11 Jul 2022 15:27:07 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 11 Jul
 2022 17:27:06 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00135afa195-10e3-420a-9975-453b639884d9,
 B4A626E929F7F6A388BA3F96B07B1F4CEE71A9BF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <789c42e4-b5ce-8a79-eed6-5fa69812a01a@kaod.org>
Date: Mon, 11 Jul 2022 17:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] qemu-options: bring the kernel and image options
 together
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 <qemu-devel@nongnu.org>
References: <20220707151037.397324-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220707151037.397324-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 85b593f1-cb30-413e-8751-35215971bfcf
X-Ovh-Tracer-Id: 4704572760887626650
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvedvhfehkeejvedvkeelleetjeeuieeuveduteehkeeuhfehvefhvedtkeeiiefgnecuffhomhgrihhnpehsthgrtghkohhvvghrfhhlohifrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/22 17:10, Alex Bennée wrote:
> How to control the booting of QEMU is often a source of confusion for
> users. Bring the options that control this together in the manual
> pages and add some verbiage to describe when each option is
> appropriate. This attempts to codify some of the knowledge expressed
> in:
> 
>    https://stackoverflow.com/questions/58420670/qemu-bios-vs-kernel-vs-device-loader-file/58434837#58434837
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Cédric Le Goater <clg@kaod.org>
> Message-Id: <20220622145052.4012981-1-alex.bennee@linaro.org>

LGTM,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> 
> ---
> v2
>    - fix third and last reference for kernel and generic loader
>    - more verbiage following feedback from Peter
>    - mention Peter's write up in the commit message
> ---
>   qemu-options.hx | 90 +++++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 72 insertions(+), 18 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 377d22fbd8..70e7f98882 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1585,13 +1585,6 @@ SRST
>       Use file as SecureDigital card image.
>   ERST
>   
> -DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
> -    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH_ALL)
> -SRST
> -``-pflash file``
> -    Use file as a parallel flash image.
> -ERST
> -
>   DEF("snapshot", 0, QEMU_OPTION_snapshot,
>       "-snapshot       write to temporary files instead of disk image files\n",
>       QEMU_ARCH_ALL)
> @@ -3680,12 +3673,61 @@ DEFHEADING()
>   
>   #endif
>   
> -DEFHEADING(Linux/Multiboot boot specific:)
> +DEFHEADING(Boot Image or Kernel specific:)
> +SRST
> +There are broadly 4 ways you can boot a system with QEMU.
> +
> + - specify a firmware and let it control finding a kernel
> + - specify a firmware and pass a hint to the kernel to boot
> + - direct kernel image boot
> + - manually load files into the guest's address space
> +
> +The third method is useful for quickly testing kernels but as there is
> +no firmware to pass configuration information to the kernel the
> +hardware must either be probable, the kernel built for the exact
> +configuration or passed some configuration data (e.g. a DTB blob)
> +which tells the kernel what drivers it needs. This exact details are
> +often hardware specific.
> +
> +The final method is the most generic way of loading images into the
> +guest address space and used mostly for ``bare metal`` type
> +development where the reset vectors of the processor are taken into
> +account.
> +
> +ERST
> +
> +SRST
> +
> +For x86 machines and some other architectures ``-bios`` will generally
> +do the right thing with whatever it is given. For other machines the
> +more strict ``-pflash`` option needs an image that is sized for the
> +flash device for the given machine type.
> +
> +Please see the :ref:`system-targets-ref` section of the manual for
> +more detailed documentation.
> +
> +ERST
> +
> +DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
> +    "-bios file      set the filename for the BIOS\n", QEMU_ARCH_ALL)
> +SRST
> +``-bios file``
> +    Set the filename for the BIOS.
> +ERST
> +
> +DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
> +    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH_ALL)
>   SRST
> -When using these options, you can use a given Linux or Multiboot kernel
> -without installing it in the disk image. It can be useful for easier
> -testing of various kernels.
> +``-pflash file``
> +    Use file as a parallel flash image.
> +ERST
>   
> +SRST
> +
> +The kernel options were designed to work with Linux kernels although
> +other things (like hypervisors) can be packaged up as a kernel
> +executable image. The exact format of a executable image is usually
> +architecture specific.
>   
>   ERST
>   
> @@ -3725,6 +3767,25 @@ SRST
>       kernel on boot.
>   ERST
>   
> +SRST
> +
> +Finally you can also manually load images directly into the address
> +space of the guest. This is most useful for developers who already
> +know the layout of their guest and take care to ensure something sane
> +will happen when the reset vector executes.
> +
> +The generic loader can be invoked by using the loader device:
> +
> +``-device loader,addr=<addr>,data=<data>,data-len=<data-len>[,data-be=<data-be>][,cpu-num=<cpu-num>]``
> +
> +there is also the guest loader which operates in a similar way but
> +tweaks the DTB so a hypervisor loaded via ``-kernel`` can find where
> +the guest image is:
> +
> +``-device guest-loader,addr=<addr>[,kernel=<path>,[bootargs=<arguments>]][,initrd=<path>]``
> +
> +ERST
> +
>   DEFHEADING()
>   
>   DEFHEADING(Debug/Expert options:)
> @@ -4175,13 +4236,6 @@ SRST
>       To list all the data directories, use ``-L help``.
>   ERST
>   
> -DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
> -    "-bios file      set the filename for the BIOS\n", QEMU_ARCH_ALL)
> -SRST
> -``-bios file``
> -    Set the filename for the BIOS.
> -ERST
> -
>   DEF("enable-kvm", 0, QEMU_OPTION_enable_kvm, \
>       "-enable-kvm     enable KVM full virtualization support\n",
>       QEMU_ARCH_ARM | QEMU_ARCH_I386 | QEMU_ARCH_MIPS | QEMU_ARCH_PPC |


