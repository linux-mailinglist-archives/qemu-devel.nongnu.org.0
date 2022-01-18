Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B38492068
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 08:36:35 +0100 (CET)
Received: from localhost ([::1]:56172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9j2f-0008KB-6C
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 02:36:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9ih2-0003ot-Im
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 02:14:13 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:48055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9igt-0000hH-W3
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 02:14:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.132])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B3A9520EC9;
 Tue, 18 Jan 2022 07:13:54 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 08:13:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0057367d3e6-8fed-4f6f-b502-fb172caf5e03,
 78124C4340FA50D00486B2609A05927D7A7C6ABE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ce079f54-d7be-5b22-da6f-59c8c3639320@kaod.org>
Date: Tue, 18 Jan 2022 08:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH RESEND] tests/avocado: ppc: Add smoke tests for MPC7400
 and MPC7450 families
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Fabiano Rosas
 <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220117144757.782441-1-farosas@linux.ibm.com>
 <e83875f1-70bd-2a5b-ba4e-39baa4cc3c6e@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e83875f1-70bd-2a5b-ba4e-39baa4cc3c6e@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ff4dba50-3dea-4735-baa4-7c64c79d296b
X-Ovh-Tracer-Id: 7544092327815056291
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukh
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/22 21:08, Daniel Henrique Barboza wrote:
> 
> 
> On 1/17/22 11:47, Fabiano Rosas wrote:
>> These tests ensure that our emulation for these cpus is not completely
>> broken and we can at least run OpenBIOS on them.
>>
>> $ make check-avocado AVOCADO_TESTS=../tests/avocado/ppc_74xx.py
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>> ---
>> ---
>>   tests/avocado/ppc_74xx.py | 123 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>   create mode 100644 tests/avocado/ppc_74xx.py
>>
>> diff --git a/tests/avocado/ppc_74xx.py b/tests/avocado/ppc_74xx.py
>> new file mode 100644
>> index 0000000000..556a9a7da9
>> --- /dev/null
>> +++ b/tests/avocado/ppc_74xx.py
>> @@ -0,0 +1,123 @@
>> +# Smoke tests for 74xx cpus (aka G4).
>> +#
>> +# Copyright (c) 2021, IBM Corp.
> 
> 
> Not sure if the copyright year must be changed to 2022 (the year that this is going to
> be published) or 2021 (the year that it was developed). GNU docs isn't clear about
> it. Our COPYING file is also not clear about whether we should put the code creation
> or code publishing year in this header.
> 
> I don't mind leaving it as 2021. I'm just curious about what is the semantics involved
> here.

Here is a brief summary of the IBM rules :

    Copyright IBM Corp. Year 1, Year 2

Year 1 is the year of first external delivery.

Year 2 is the year of the first external distribution of the latest
substantial changes (Only added when changes have been made).

I think we are fine with the above Copyright statement.

Thanks,

C.
  
> 
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +from avocado_qemu import QemuSystemTest
>> +from avocado_qemu import wait_for_console_pattern
>> +
>> +class ppc74xxCpu(QemuSystemTest):
>> +    """
>> +    :avocado: tags=arch:ppc
>> +    """
>> +    timeout = 5
>> +
>> +    def test_ppc_7400(self):
>> +        """
>> +        :avocado: tags=cpu:7400
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
>> +
>> +    def test_ppc_7410(self):
>> +        """
>> +        :avocado: tags=cpu:7410
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,74xx')
>> +
>> +    def test_ppc_7441(self):
>> +        """
>> +        :avocado: tags=cpu:7441
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
>> +
>> +    def test_ppc_7445(self):
>> +        """
>> +        :avocado: tags=cpu:7445
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
>> +
>> +    def test_ppc_7447(self):
>> +        """
>> +        :avocado: tags=cpu:7447
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
>> +
>> +    def test_ppc_7447a(self):
>> +        """
>> +        :avocado: tags=cpu:7447a
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
>> +
>> +    def test_ppc_7448(self):
>> +        """
>> +        :avocado: tags=cpu:7448
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,MPC86xx')
>> +
>> +    def test_ppc_7450(self):
>> +        """
>> +        :avocado: tags=cpu:7450
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
>> +
>> +    def test_ppc_7451(self):
>> +        """
>> +        :avocado: tags=cpu:7451
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
>> +
>> +    def test_ppc_7455(self):
>> +        """
>> +        :avocado: tags=cpu:7455
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
>> +
>> +    def test_ppc_7457(self):
>> +        """
>> +        :avocado: tags=cpu:7457
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
>> +
>> +    def test_ppc_7457a(self):
>> +        """
>> +        :avocado: tags=cpu:7457a
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, '>> OpenBIOS')
>> +        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')


