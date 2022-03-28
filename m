Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18144E99CD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:35:53 +0200 (CEST)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqTI-0004cW-P4
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:35:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nYqE6-00085U-JZ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:20:10 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:60873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nYqE4-0007su-D9
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:20:10 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.121])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6D37FF081018;
 Mon, 28 Mar 2022 16:20:04 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 16:20:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003c323555a-22b1-404b-974c-152a9f247df8,
 CFE7A3AAE61928554BF17059C30BCFB3D76DD066) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6e3fd836-6aa9-61bd-e84a-8ce5a4b8a693@kaod.org>
Date: Mon, 28 Mar 2022 16:20:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 9/9] test/avocado/machine_aspeed.py: Add ast1030 test
 case
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
 <20220322025154.3989-10-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220322025154.3989-10-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6170a3af-310b-449e-aa9f-688770599e7e
X-Ovh-Tracer-Id: 14128917931981573051
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevledvjeetgeetfeeiveeftefffedvvdeikeetveelfeeglefgueetvdefvdefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 03:51, Jamin Lin wrote:
> Add test case to test "ast1030-evb" machine with zephyr os
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


Thanks,

C.

> ---
>   tests/avocado/machine_aspeed.py | 36 +++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 tests/avocado/machine_aspeed.py
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> new file mode 100644
> index 0000000000..33090af199
> --- /dev/null
> +++ b/tests/avocado/machine_aspeed.py
> @@ -0,0 +1,36 @@
> +# Functional test that boots the ASPEED SoCs with firmware
> +#
> +# Copyright (C) 2022 ASPEED Technology Inc
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import wait_for_console_pattern
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +from avocado.utils import archive
> +
> +
> +class AST1030Machine(QemuSystemTest):
> +    """Boots the zephyr os and checks that the console is operational"""
> +
> +    timeout = 10
> +
> +    def test_ast1030_zephyros(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:ast1030-evb
> +        """
> +        tar_url = ('https://github.com/AspeedTech-BMC'
> +                   '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip')
> +        tar_hash = '4c6a8ce3a8ba76ef1a65dae419ae3409343c4b20'
> +        tar_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
> +        archive.extract(tar_path, self.workdir)
> +        kernel_file = self.workdir + "/ast1030-evb-demo/zephyr.elf"
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_file,
> +                         '-nographic')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, "Booting Zephyr OS")
> +        exec_command_and_wait_for_pattern(self, "help",
> +                                          "Available commands")


