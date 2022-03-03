Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC64CC298
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:25:09 +0100 (CET)
Received: from localhost ([::1]:51198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoGK-0006SG-VO
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:25:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPo01-0005de-2c; Thu, 03 Mar 2022 11:08:17 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:47375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPnzy-0007zJ-Vd; Thu, 03 Mar 2022 11:08:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 74E9820C58;
 Thu,  3 Mar 2022 16:08:03 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 17:08:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003e6cb9bdd-d54d-4302-b8e1-73884e531173,
 A0610A17E77809494FE20D2F959CCE2A9331EACD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.1.230.64
Message-ID: <c2e3731d-c472-99ab-3973-62c8b02c1e56@kaod.org>
Date: Thu, 3 Mar 2022 17:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] avocado/boot_linux_console.py: check for tcg in
 test_ppc_powernv8/9
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220303153517.168943-1-danielhb413@gmail.com>
 <20220303153517.168943-4-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220303153517.168943-4-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e9925223-5175-4893-aa13-24d0f2cc15d1
X-Ovh-Tracer-Id: 16709199045610015526
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtiedgkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevledvjeetgeetfeeiveeftefffedvvdeikeetveelfeeglefgueetvdefvdefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhhuhhthhesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thuth@redhat.com, crosa@redhat.com, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 16:35, Daniel Henrique Barboza wrote:
> The PowerNV8/9 machines does not work with KVM acceleration, meaning
> that boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8/9 tests
> will always fail when QEMU is compiled with --disable-tcg:
> 
> ERROR 1-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8
> -> VMLaunchFailure: ConnectError: Failed to establish session:
> [Errno 104] Connection reset by peer
>          Exit code: 1
>          Command: ./qemu-system-ppc64 -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_no19zg0m/qemu-1936936-7fffa77cff98-monitor.sock -mon chardev=mon,mode=control -machine powernv8 -chardev socket,id=console,path=/var/tmp/avo_qemu_sock_no19zg0m/qemu-1936936-7fffa77cff98-console.sock,server=on,wait=off -serial chardev:console -kernel /home/danielhb/avocado/data/cache/by_location/4514304e2c4ee84c5f0b5c8bacedda783891df68/zImage.epapr -append console=tty0 console=hvc0 -device pcie-pci-bridge,id=bridge1,bus=pcie.1,addr=0x0 -device nvme,bus=pcie.2,addr=0x0,serial=1234 -device e1000e,bus=bridge1,addr=0x3 -device nec-usb-xhci,bus=bridge1,addr=0x2
>          Output: qemu-system-ppc64: The powernv machine does not work with KVM acceleration
> 
> Let's add the TCG accel requirement in both tests to skip them if we
> don't have TCG support available.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   tests/avocado/boot_linux_console.py | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 9c618d4809..d7d9130329 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -1170,6 +1170,7 @@ def test_ppc64_e500(self):
>           self.do_test_advcal_2018('19', tar_hash, 'uImage')
>   
>       def do_test_ppc64_powernv(self, proc):
> +        self.require_accelerator("tcg")
>           images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
>   
>           kernel_url = images_url + 'zImage.epapr'
> @@ -1194,6 +1195,7 @@ def test_ppc_powernv8(self):
>           """
>           :avocado: tags=arch:ppc64
>           :avocado: tags=machine:powernv8
> +        :avocado: tags=accel:tcg
>           """
>           self.do_test_ppc64_powernv('P8')
>   
> @@ -1201,6 +1203,7 @@ def test_ppc_powernv9(self):
>           """
>           :avocado: tags=arch:ppc64
>           :avocado: tags=machine:powernv9
> +        :avocado: tags=accel:tcg
>           """
>           self.do_test_ppc64_powernv('P9')
>   


