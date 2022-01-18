Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE74492570
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:09:19 +0100 (CET)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nIb-00016O-Ns
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:09:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9nAv-0005ei-AI
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:01:23 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:37643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9nAe-0005RU-I0
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:01:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B660D21D5C;
 Tue, 18 Jan 2022 12:01:01 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 13:01:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00594a83139-2471-4755-bd7a-ed8f77069871,
 78124C4340FA50D00486B2609A05927D7A7C6ABE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c8e030c4-fef8-8825-2f99-7ddded8e37ef@kaod.org>
Date: Tue, 18 Jan 2022 13:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH RESEND] tests/avocado: ppc: Add smoke tests for MPC7400
 and MPC7450 families
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220117144757.782441-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220117144757.782441-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f7351ff9-d62f-4704-bcc2-ac966cf552fd
X-Ovh-Tracer-Id: 12393061749726022563
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgdefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmrghrkhdrtggrvhgvqdgrhihlrghnugesihhlrghnuggvrdgtohdruhhk
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, danielhb413@gmail.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/22 15:47, Fabiano Rosas wrote:
> These tests ensure that our emulation for these cpus is not completely
> broken and we can at least run OpenBIOS on them.
> 
> $ make check-avocado AVOCADO_TESTS=../tests/avocado/ppc_74xx.py
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>


Applied to ppc-7.0

Thanks,

C.


> ---
> ---
>   tests/avocado/ppc_74xx.py | 123 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 123 insertions(+)
>   create mode 100644 tests/avocado/ppc_74xx.py
> 
> diff --git a/tests/avocado/ppc_74xx.py b/tests/avocado/ppc_74xx.py
> new file mode 100644
> index 0000000000..556a9a7da9
> --- /dev/null
> +++ b/tests/avocado/ppc_74xx.py
> @@ -0,0 +1,123 @@
> +# Smoke tests for 74xx cpus (aka G4).
> +#
> +# Copyright (c) 2021, IBM Corp.
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import wait_for_console_pattern
> +
> +class ppc74xxCpu(QemuSystemTest):
> +    """
> +    :avocado: tags=arch:ppc
> +    """
> +    timeout = 5
> +
> +    def test_ppc_7400(self):
> +        """
> +        :avocado: tags=cpu:7400
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7410(self):
> +        """
> +        :avocado: tags=cpu:7410
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,74xx')
> +
> +    def test_ppc_7441(self):
> +        """
> +        :avocado: tags=cpu:7441
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7445(self):
> +        """
> +        :avocado: tags=cpu:7445
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7447(self):
> +        """
> +        :avocado: tags=cpu:7447
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7447a(self):
> +        """
> +        :avocado: tags=cpu:7447a
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7448(self):
> +        """
> +        :avocado: tags=cpu:7448
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,MPC86xx')
> +
> +    def test_ppc_7450(self):
> +        """
> +        :avocado: tags=cpu:7450
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7451(self):
> +        """
> +        :avocado: tags=cpu:7451
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7455(self):
> +        """
> +        :avocado: tags=cpu:7455
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7457(self):
> +        """
> +        :avocado: tags=cpu:7457
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> +
> +    def test_ppc_7457a(self):
> +        """
> +        :avocado: tags=cpu:7457a
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, '>> OpenBIOS')
> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
> 


