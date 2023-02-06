Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54CB68BE1F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:29:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1YU-0004J0-02; Mon, 06 Feb 2023 08:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pP1YR-0004Ii-Jp; Mon, 06 Feb 2023 08:29:07 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pP1YP-0003Qh-HK; Mon, 06 Feb 2023 08:29:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.27])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 295722A5FE;
 Mon,  6 Feb 2023 13:28:59 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 6 Feb
 2023 14:28:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0012dd424aa-d101-4885-afb5-84c5a9d6594f,
 CF69EBA19D99189A5BFA69977647E68A070273F7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e29628f2-5547-9cd9-e61e-1b3f900f11a0@kaod.org>
Date: Mon, 6 Feb 2023 14:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 8/8] docs/system/devices/igb: Add igb documentation
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
References: <20230204043621.13540-1-akihiko.odaki@daynix.com>
 <20230204043621.13540-9-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230204043621.13540-9-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b8199428-51fc-4e15-b1ec-7c914d901b09
X-Ovh-Tracer-Id: 43347149289196383
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudegiedghedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvgeeileetgedvvdevieejtdefleelgeetuefhveeihefggfdttdfgjeetffefueenucffohhmrghinhepihhnthgvlhdrtghomhdpghhithhhuhgsrdgtohhmpdhmihgtrhhoshhofhhtrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrkhhihhhikhhordhouggrkhhisegurgihnhhigidrtghomhdphihurhhirdgsvghnughithhovhhitghhsegurgihnhhigidrtghomhdphihvuhhgvghnfhhisehrvgguhhgrthdrtghomhdpuggvvhgvlhesuggrhihnihigrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurd
 horhhgpdfsihhuhhgrohdrnfhisehouhhtlhhoohhkrdgtohhmpdgurghrrhgvnhdrkhgvnhhnhiesohhrrggtlhgvrdgtohhmpdhsthgvfhgrnhhhrgesrhgvughhrghtrdgtohhmpdgsshgusehrvgguhhgrthdrtghomhdprghlgihnughrsegsuhdrvgguuhdpshhrihhrrghmrdihrghgnhgrrhgrmhgrnhesvghsthdrthgvtghhpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpsghlvggrlhesrhgvughhrghtrdgtohhmpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpphhhihhlmhgusehlihhnrghrohdrohhrghdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdhmrghrtggvlhdrrghpfhgvlhgsrghumhesghhmrghilhdrtghomhdpmhhsthesrhgvughhrghtrdgtohhmpdgumhhithhrhidrfhhlvgihthhmrghnsehgmhgrihhlrdgtohhmpdhjrghsohifrghnghesrhgvughhrghtrdgtohhmpdhlvhhivhhivghrsehrvgguhhgrthdrtghomhdpghgrlhdrhhgrmhhmvghrsehsrghprdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2/4/23 05:36, Akihiko Odaki wrote:
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


