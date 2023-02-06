Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876B68BE4D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:33:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1c3-0006dt-5H; Mon, 06 Feb 2023 08:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pP1bw-0006c8-EE
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:32:46 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pP1bu-0004LC-Co
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:32:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.188])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 7CB7D26335;
 Mon,  6 Feb 2023 13:32:38 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 6 Feb
 2023 14:32:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0019c637db1-e1f9-4513-b1d2-0a43395279c5,
 CF69EBA19D99189A5BFA69977647E68A070273F7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c45057dc-7f97-a45d-616a-236bfee21655@kaod.org>
Date: Mon, 6 Feb 2023 14:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 0/8] Introduce igb
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230204043621.13540-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 702d3124-3de1-4ce4-80d7-b0d72bc3e740
X-Ovh-Tracer-Id: 105271642647792479
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudegiedgheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejudfggeekjeejjeekheegteevjeevgfevkeelvdevieelgedtieellefhgeevffenucffohhmrghinhepghhnuhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghkihhhihhkohdrohgurghkihesuggrhihnihigrdgtohhmpdihuhhrihdrsggvnhguihhtohhvihgthhesuggrhihnihigrdgtohhmpdihvhhughgvnhhfihesrhgvughhrghtrdgtohhmpdguvghvvghlsegurgihnhhigidrtghomhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpsfhiuhhhrghordfnihesohhuthhlohhokhdrtghomhdpuggrrhhrvghnrdhkvghnnh
 ihsehorhgrtghlvgdrtghomhdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpsghsugesrhgvughhrghtrdgtohhmpdgrlhignhgurhessghurdgvughupdhsrhhirhgrmhdrhigrghhnrghrrghmrghnsegvshhtrdhtvggthhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdptghrohhsrgesrhgvughhrghtrdgtohhmpdgslhgvrghlsehrvgguhhgrthdrtghomhdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdgrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdhmshhtsehrvgguhhgrthdrtghomhdpughmihhtrhihrdhflhgvhihtmhgrnhesghhmrghilhdrtghomhdpjhgrshhofigrnhhgsehrvgguhhgrthdrtghomhdplhhvihhvihgvrhesrhgvughhrghtrdgtohhmpdhgrghlrdhhrghmmhgvrhesshgrphdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
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

On 2/4/23 05:36, Akihiko Odaki wrote:
> Based-on: <20230201033539.30049-1-akihiko.odaki@daynix.com>
> ([PATCH v5 00/29] e1000x cleanups (preliminary for IGB))

For both series,

Tested-by: Cédric Le Goater <clg@redhat.com>

In a KVM guest with two VFs, one of which being pass-through in a nested KVM.

Thanks,

C.


> igb is a family of Intel's gigabit ethernet controllers. This series implements
> 82576 emulation in particular. You can see the last patch for the documentation.
> 
> Note that there is another effort to bring 82576 emulation. This series was
> developed independently by Sriram Yagnaraman.
> https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html


> 
> V7 -> V8:
> - Removed obsolete patch
>    "hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr" (Cédric Le Goater)
> 
> V6 -> V7:
> - Reordered statements in igb_receive_internal() so that checksum will be
>    calculated only once and it will be more close to e1000e_receive_internal().
> 
> V5 -> V6:
> - Rebased.
> - Renamed "test" to "packet" in tests/qtest/e1000e-test.c.
> - Fixed Rx logic so that a Rx pool without enough space won't prevent other
>    pools from receiving, based on Sriram Yagnaraman's work.
> 
> V4 -> V5:
> - Rebased.
> - Squashed patches to copy from e1000e code and modify it.
> - Listed the implemented features.
> - Added a check for interrupts availablity on PF.
> - Fixed the declaration of igb_receive_internal(). (Sriram Yagnaraman)
> 
> V3 -> V4:
> - Rebased.
> - Corrected PCIDevice specified for DMA.
> 
> V2 -> V3:
> - Rebased.
> - Fixed PCIDevice reference in hw/net/igbvf.c.
> - Fixed TX packet switching when VM loopback is enabled.
> - Fixed VMDq enablement check.
> - Fixed RX descriptor length parser.
> - Fixed the definitions of RQDPC readers.
> - Implemented VLAN VM filter.
> - Implemented VT_CTL.Def_PL.
> - Implemented the combination of VMDq and RSS.
> - Noted that igb is tested with Windows HLK.
> 
> V1 -> V2:
> - Spun off e1000e general improvements to a distinct series.
> - Restored vnet_hdr offload as there seems nothing preventing from that.
> 
> Akihiko Odaki (8):
>    pcie: Introduce pcie_sriov_num_vfs
>    e1000: Split header files
>    Intrdocue igb device emulation
>    tests/qtest/e1000e-test: Fabricate ethernet header
>    tests/qtest/libqos/e1000e: Export macreg functions
>    igb: Introduce qtest for igb device
>    tests/avocado: Add igb test
>    docs/system/devices/igb: Add igb documentation
> 
>   MAINTAINERS                                   |    9 +
>   docs/system/device-emulation.rst              |    1 +
>   docs/system/devices/igb.rst                   |   71 +
>   hw/net/Kconfig                                |    5 +
>   hw/net/e1000.c                                |    1 +
>   hw/net/e1000_common.h                         |  102 +
>   hw/net/e1000_regs.h                           |  927 +---
>   hw/net/e1000e.c                               |    3 +-
>   hw/net/e1000e_core.c                          |    1 +
>   hw/net/e1000x_common.c                        |    1 +
>   hw/net/e1000x_common.h                        |   74 -
>   hw/net/e1000x_regs.h                          |  940 ++++
>   hw/net/igb.c                                  |  612 +++
>   hw/net/igb_common.h                           |  146 +
>   hw/net/igb_core.c                             | 4043 +++++++++++++++++
>   hw/net/igb_core.h                             |  144 +
>   hw/net/igb_regs.h                             |  648 +++
>   hw/net/igbvf.c                                |  327 ++
>   hw/net/meson.build                            |    2 +
>   hw/net/trace-events                           |   32 +
>   hw/pci/pcie_sriov.c                           |    5 +
>   include/hw/pci/pcie_sriov.h                   |    3 +
>   .../org.centos/stream/8/x86_64/test-avocado   |    1 +
>   tests/avocado/igb.py                          |   38 +
>   tests/qtest/e1000e-test.c                     |   25 +-
>   tests/qtest/fuzz/generic_fuzz_configs.h       |    5 +
>   tests/qtest/igb-test.c                        |  243 +
>   tests/qtest/libqos/e1000e.c                   |   12 -
>   tests/qtest/libqos/e1000e.h                   |   14 +
>   tests/qtest/libqos/igb.c                      |  185 +
>   tests/qtest/libqos/meson.build                |    1 +
>   tests/qtest/meson.build                       |    1 +
>   32 files changed, 7600 insertions(+), 1022 deletions(-)
>   create mode 100644 docs/system/devices/igb.rst
>   create mode 100644 hw/net/e1000_common.h
>   create mode 100644 hw/net/e1000x_regs.h
>   create mode 100644 hw/net/igb.c
>   create mode 100644 hw/net/igb_common.h
>   create mode 100644 hw/net/igb_core.c
>   create mode 100644 hw/net/igb_core.h
>   create mode 100644 hw/net/igb_regs.h
>   create mode 100644 hw/net/igbvf.c
>   create mode 100644 tests/avocado/igb.py
>   create mode 100644 tests/qtest/igb-test.c
>   create mode 100644 tests/qtest/libqos/igb.c
> 


