Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2D4700715
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:45:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxRCZ-00076i-BR; Fri, 12 May 2023 07:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pxRCX-00076Z-6w
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:44:45 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pxRCU-00075m-V9
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:44:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CB2D2213E3;
 Fri, 12 May 2023 11:44:36 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 12 May
 2023 13:44:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0010cee0740-ad89-4992-86fd-7ce1dc2fc2f8,
 4B091FD28FA57C32BD8EB216DEE262B02F305603) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <526023cc-1469-4d3b-fec9-71ad127c400a@kaod.org>
Date: Fri, 12 May 2023 13:44:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] tests/avocado: Add LoongArch machine start test
To: Song Gao <gaosong@loongson.cn>, <thuth@redhat.com>, <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>, <peter.maydell@linaro.org>,
 <philmd@linaro.org>, <pbonzini@redhat.com>, <alex.bennee@linaro.org>,
 <maobibo@loongson.cn>, <yangxiaojuan@loongson.cn>, <lvivier@redhat.com>,
 <atar4qemu@gmail.com>, <edgar.iglesias@gmail.com>, <wainersm@redhat.com>,
 <quic_llindhol@quicinc.com>, <kraxel@redhat.com>, <deller@gmx.de>,
 <stefanha@redhat.com>, <crosa@redhat.com>, <eduardo@habkost.net>,
 <quintela@redhat.com>, <jsnow@redhat.com>, <ysato@users.sourceforge.jp>,
 <iii@linux.ibm.com>, <pavel.dovgaluk@ispras.ru>, <andrew@aj.id.au>,
 <kbastian@mail.uni-paderborn.de>, <bleal@redhat.com>, <jcmvbkbc@gmail.com>,
 <marcandre.lureau@redhat.com>, <mark.cave-ayland@ilande.co.uk>,
 <rad@semihalf.com>, <aurelien@aurel32.net>, <david@redhat.com>,
 <armbru@redhat.com>, <joel@jms.id.au>, <berrange@redhat.com>
References: <20230512063305.1629046-1-gaosong@loongson.cn>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230512063305.1629046-1-gaosong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 0a2d7e79-135d-4f83-af15-77409fad9cdf
X-Ovh-Tracer-Id: 2784350473824275203
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehtddggeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeffffgleevgfduveefjeehheetgfefveeluedvjeekieelleettdeivdekleeiveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeliedpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghgrohhsohhngheslhhoohhnghhsohhnrdgtnhdpqhhuihhnthgvlhgrsehrvgguhhgrthdrtghomhdpjhhsnhhofiesrhgvughhrghtrdgtohhmpdihshgrthhosehushgvrhhsrdhsohhurhgtvghfohhrghgvrdhjphdpihhiiheslhhinhhugidrihgsmhdrtghomhdpphgrvhgvlhdrughovhhgrghluhhksehishhprhgrshdrrhhupdgrnhgurhgvfiesrghjrdhiugdrrghupdhksggrshhtih
 grnhesmhgrihhlrdhunhhiqdhprgguvghrsghorhhnrdguvgdpsghlvggrlhesrhgvughhrghtrdgtohhmpdhjtghmvhgskhgstgesghhmrghilhdrtghomhdpmhgrrhgtrghnughrvgdrlhhurhgvrghusehrvgguhhgrthdrtghomhdpmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdprhgrugesshgvmhhihhgrlhhfrdgtohhmpdgruhhrvghlihgvnhesrghurhgvlhefvddrnhgvthdpuggrvhhiugesrhgvughhrghtrdgtohhmpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdgvughurghrughosehhrggskhhoshhtrdhnvghtpdhjohgvlhesjhhmshdrihgurdgruhdptghrohhsrgesrhgvughhrghtrdgtohhmpdguvghllhgvrhesghhmgidruggvpdhthhhuthhhsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdhmrghosghisghosehlohhonhhgshhonhdrtghnpdihrghnghigihgrohhjuhgrnheslhhoohhnghhsohhnrdgtnhdplhhvihhvihgvrhesrhgvughhrghtrdgtohhmpdgrthgrrhegqhgvmhhusehgmhgrihhlrdgtohhmpdgvugh
 grghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdpqhhuihgtpghllhhinhguhhholhesqhhuihgtihhntgdrtghomhdpkhhrrgigvghlsehrvgguhhgrthdrtghomhdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.845,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

On 5/12/23 08:33, Song Gao wrote:
> Add a new test in tests/avocado to check LoongArch virt machine start.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   MAINTAINERS                        |  1 +
>   tests/avocado/machine_loongarch.py | 68 ++++++++++++++++++++++++++++++
>   2 files changed, 69 insertions(+)
>   create mode 100644 tests/avocado/machine_loongarch.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f757369373..4c0d37a1aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -245,6 +245,7 @@ M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>   S: Maintained
>   F: target/loongarch/
>   F: tests/tcg/loongarch64/
> +F: tests/avocado/machine_loongarch.py
>   
>   M68K TCG CPUs
>   M: Laurent Vivier <laurent@vivier.eu>
> diff --git a/tests/avocado/machine_loongarch.py b/tests/avocado/machine_loongarch.py
> new file mode 100644
> index 0000000000..e8fcb578d7
> --- /dev/null
> +++ b/tests/avocado/machine_loongarch.py
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# LoongArch virt test.
> +#
> +# Copyright (c) 2023 Loongson Technology Corporation Limited
> +#
> +
> +import os
> +import tempfile
> +
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +from avocado_qemu import wait_for_console_pattern
> +
> +class LoongArchMachine(QemuSystemTest):
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> +
> +    timeout = 120
> +
> +    def wait_for_console_pattern(self, success_message, vm=None):
> +        wait_for_console_pattern(self, success_message,
> +                                 failure_message='Kernel panic - not syncing',
> +                                 vm=vm)
> +
> +    dmesg_clear_count = 1
> +    def clear_guest_dmesg(self):
> +        exec_command_and_wait_for_pattern(self, 'dmesg -c > /dev/null; '
> +                    'echo dm_clear\ ' + str(self.dmesg_clear_count),
> +                    'dm_clear ' + str(self.dmesg_clear_count))
> +        self.dmesg_clear_count += 1

Routine clear_guest_dmesg() doesn't seem to be used anywhere.

Thanks,

C.

> +
> +    def test_loongarch64_devices(self):
> +
> +        """
> +        :avocado: tags=arch:loongarch64
> +        :avocado: tags=machine:virt
> +        """
> +
> +        kernel_url = ('https://github.com/yangxiaojuan-loongson/qemu-binary/'
> +                      'releases/download/binary-files/vmlinuz.efi')
> +        kernel_hash = '951b485b16e3788b6db03a3e1793c067009e31a2'
> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +
> +        initrd_url = ('https://github.com/yangxiaojuan-loongson/qemu-binary/'
> +                      'releases/download/binary-files/ramdisk')
> +        initrd_hash = 'c67658d9b2a447ce7db2f73ba3d373c9b2b90ab2'
> +        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> +
> +        bios_url = ('https://github.com/yangxiaojuan-loongson/qemu-binary/'
> +                    'releases/download/binary-files/QEMU_EFI.fd')
> +        bios_hash = ('dfc1bfba4853cd763b9d392d0031827e8addbca8')
> +        bios_path = self.fetch_asset(bios_url, asset_hash=bios_hash)
> +
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'root=/dev/ram rdinit=/sbin/init console=ttyS0,115200')
> +        self.vm.add_args('-nographic',
> +                         '-smp', '4',
> +                         '-m', '1024',
> +                         '-cpu', 'la464',
> +                         '-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-bios', bios_path,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Run /sbin/init as init process')
> +        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> +                                          'processor		: 3')


