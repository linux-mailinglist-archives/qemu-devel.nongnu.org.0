Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF014D8805
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:25:19 +0100 (CET)
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmZQ-0007yt-F8
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:25:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nTmWs-0004Wg-E2; Mon, 14 Mar 2022 11:22:38 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:57267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nTmWq-0003q6-Ko; Mon, 14 Mar 2022 11:22:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C6AE521B8B;
 Mon, 14 Mar 2022 15:22:33 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 14 Mar
 2022 16:22:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001970e6096-880d-4a83-a823-3d1c9ec1e334,
 00B622A560025FB732B9BA5E5C4E2A2293E53F9D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <47a83e44-5c4b-107d-b913-273c957bd029@kaod.org>
Date: Mon, 14 Mar 2022 16:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 0/5] --disable-tcg qtest/avocado fixes for ppc64
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220303153517.168943-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220303153517.168943-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 322a4ad0-a9b5-434c-be87-11140805abfb
X-Ovh-Tracer-Id: 6753429118727457574
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvkedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehthhhuthhhsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> Hi,
> 
> 'make check' and 'make check-avocado' in a ppc64 host, using a QEMU
> built with --disable-tcg, fails in a handful of tests/files due to the
> lack of TCG support not being accounted for. The tests usually fall back
> to KVM acceleration, and when running in an IBM POWER server this accel
> type isn't able to run any other machine but 'pseries'.
> 
> This series aims to fix it by checking for CONFIG_TCG in
> qtest/meson.build, and using require_accelerator('tcg') in avocado
> tests. I avoided changing the behavior when running the tests in other
> host architectures because I can't assert about how KVM behaves in x86 and
> aarch64. Patches 1, 2 and 4 were limited to ppc/ppc64 tests only because
> of that.
> 
> Patch 5 is something that I am fairly confident that affects all archs
> so the change is made in the common code for everyone.
> 
> 
> Daniel Henrique Barboza (5):
>    qtest/meson.build: check CONFIG_TCG for prom-env-test in qtests_ppc
>    qtest/meson.build: check CONFIG_TCG for boot-serial-test in qtests_ppc
>    avocado/boot_linux_console.py: check for tcg in test_ppc_powernv8/9
>    avocado/boot_linux_console.py: check tcg accel in test_ppc64_e500
>    avocado/replay_kernel.py: make tcg-icount check in run_vm()
> 
>   tests/avocado/boot_linux_console.py | 5 +++++
>   tests/avocado/replay_kernel.py      | 4 ++++
>   tests/qtest/meson.build             | 4 +++-
>   3 files changed, 12 insertions(+), 1 deletion(-)
> 


Queued for 7.0

Thanks,

C.

