Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A20689567
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNtC9-0005wm-KL; Fri, 03 Feb 2023 05:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pNtC6-0005va-KM; Fri, 03 Feb 2023 05:21:22 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pNtC4-0003lA-II; Fri, 03 Feb 2023 05:21:22 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4F9C52160B;
 Fri,  3 Feb 2023 10:21:06 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 3 Feb
 2023 11:21:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S0022d24b59d-7a2a-4de4-934d-93823aa82178,
 0A8F703E53742FD77E930052B79815B85B982A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <741a0975-9f7a-b4bc-9651-cf45f03d1787@kaod.org>
Date: Fri, 3 Feb 2023 11:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 9/9] docs/system/devices/igb: Add igb documentation
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Bandan Das
 <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>, <devel@daynix.com>, Yan
 Vugenfirer <yvugenfi@redhat.com>, Yuri Benditovich
 <yuri.benditovich@daynix.com>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Gal Hammer <gal.hammer@sap.com>
References: <20230201042615.34706-1-akihiko.odaki@daynix.com>
 <20230201042615.34706-10-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230201042615.34706-10-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 302ceec2-a61e-4fd4-bb43-e0c600da3a6b
X-Ovh-Tracer-Id: 16145967616579636063
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudegtddgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvgeeileetgedvvdevieejtdefleelgeetuefhveeihefggfdttdfgjeetffefueenucffohhmrghinhepihhnthgvlhdrtghomhdpghhithhhuhgsrdgtohhmpdhmihgtrhhoshhofhhtrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghkihhhihhkohdrohgurghkihesuggrhihnihigrdgtohhmpdihuhhrihdrsggvnhguihhtohhvihgthhesuggrhihnihigrdgtohhmpdihvhhughgvnhhfihesrhgvughhrghtrdgtohhmpdguvghvvghlsegurgihnhhigidrtghomhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuh
 drohhrghdpsfhiuhhhrghordfnihesohhuthhlohhokhdrtghomhdpuggrrhhrvghnrdhkvghnnhihsehorhgrtghlvgdrtghomhdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpsghsugesrhgvughhrghtrdgtohhmpdgrlhignhgurhessghurdgvughupdhsrhhirhgrmhdrhigrghhnrghrrghmrghnsegvshhtrdhtvggthhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdptghrohhsrgesrhgvughhrghtrdgtohhmpdgslhgvrghlsehrvgguhhgrthdrtghomhdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdgrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdhmshhtsehrvgguhhgrthdrtghomhdpughmihhtrhihrdhflhgvhihtmhgrnhesghhmrghilhdrtghomhdpjhgrshhofigrnhhgsehrvgguhhgrthdrtghomhdplhhvihhvihgvrhesrhgvughhrghtrdgtohhmpdhgrghlrdhhrghmmhgvrhesshgrphdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/1/23 05:26, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>



Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   MAINTAINERS                      |  1 +
>   docs/system/device-emulation.rst |  1 +
>   docs/system/devices/igb.rst      | 71 ++++++++++++++++++++++++++++++++
>   3 files changed, 73 insertions(+)
>   create mode 100644 docs/system/devices/igb.rst
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c0831aeb56..e85957e37f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2224,6 +2224,7 @@ F: tests/qtest/libqos/e1000e.*
>   igb
>   M: Akihiko Odaki <akihiko.odaki@daynix.com>
>   S: Maintained
> +F: docs/system/devices/igb.rst
>   F: hw/net/igb*
>   F: tests/avocado/igb.py
>   F: tests/qtest/igb-test.c
> diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
> index 0506006056..c1b1934e3d 100644
> --- a/docs/system/device-emulation.rst
> +++ b/docs/system/device-emulation.rst
> @@ -93,3 +93,4 @@ Emulated Devices
>      devices/virtio-pmem.rst
>      devices/vhost-user-rng.rst
>      devices/canokey.rst
> +   devices/igb.rst
> diff --git a/docs/system/devices/igb.rst b/docs/system/devices/igb.rst
> new file mode 100644
> index 0000000000..70edadd574
> --- /dev/null
> +++ b/docs/system/devices/igb.rst
> @@ -0,0 +1,71 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +.. _igb:
> +
> +igb
> +---
> +
> +igb is a family of Intel's gigabit ethernet controllers. In QEMU, 82576
> +emulation is implemented in particular. Its datasheet is available at [1]_.
> +
> +This implementation is expected to be useful to test SR-IOV networking without
> +requiring physical hardware.
> +
> +Limitations
> +===========
> +
> +This igb implementation was tested with Linux Test Project [2]_ and Windows HLK
> +[3]_ during the initial development. The command used when testing with LTP is:
> +
> +.. code-block:: shell
> +
> +  network.sh -6mta
> +
> +Be aware that this implementation lacks many functionalities available with the
> +actual hardware, and you may experience various failures if you try to use it
> +with a different operating system other than Linux and Windows or if you try
> +functionalities not covered by the tests.
> +
> +Using igb
> +=========
> +
> +Using igb should be nothing different from using another network device. See
> +:ref:`pcsys_005fnetwork` in general.
> +
> +However, you may also need to perform additional steps to activate SR-IOV
> +feature on your guest. For Linux, refer to [4]_.
> +
> +Developing igb
> +==============
> +
> +igb is the successor of e1000e, and e1000e is the successor of e1000 in turn.
> +As these devices are very similar, if you make a change for igb and the same
> +change can be applied to e1000e and e1000, please do so.
> +
> +Please do not forget to run tests before submitting a change. As tests included
> +in QEMU is very minimal, run some application which is likely to be affected by
> +the change to confirm it works in an integrated system.
> +
> +Testing igb
> +===========
> +
> +A qtest of the basic functionality is available. Run the below at the build
> +directory:
> +
> +.. code-block:: shell
> +
> +  meson test qtest-x86_64/qos-test
> +
> +ethtool can test register accesses, interrupts, etc. It is automated as an
> +Avocado test and can be ran with the following command:
> +
> +.. code:: shell
> +
> +  make check-avocado AVOCADO_TESTS=tests/avocado/igb.py
> +
> +References
> +==========
> +
> +.. [1] https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/82576eb-gigabit-ethernet-controller-datasheet.pdf
> +.. [2] https://github.com/linux-test-project/ltp
> +.. [3] https://learn.microsoft.com/en-us/windows-hardware/test/hlk/
> +.. [4] https://docs.kernel.org/PCI/pci-iov-howto.html


