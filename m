Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8594D3E566D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 11:12:18 +0200 (CEST)
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNo1-0004HY-Jt
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 05:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDNl1-00021a-Ap
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 05:09:11 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:53241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDNkz-0008EY-1E
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 05:09:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0BE26201CE;
 Tue, 10 Aug 2021 09:09:06 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 10 Aug
 2021 11:09:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006bbc12c1f-6d2b-48c7-948c-06459a5084a5,
 8F36BE46FB8773C29BD4C9A30C998E4B5B7B2B54) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] tests/acceptance: Test powernv machines
To: Joel Stanley <joel@jms.id.au>
References: <20210810083346.730652-1-clg@kaod.org>
 <CACPK8Xc5J3tgtv3Z4ZxpR_r3BDaXJvt3mcxSqjyAtTYa+nQA-w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <cca773c4-cf08-2fbb-9d9a-26f2fcfa6a34@kaod.org>
Date: Tue, 10 Aug 2021 11:09:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xc5J3tgtv3Z4ZxpR_r3BDaXJvt3mcxSqjyAtTYa+nQA-w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 56119a15-ace4-4f2d-869c-f4d12f506532
X-Ovh-Tracer-Id: 4769593480374815596
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehuedtheeghfdvhedtueelteegvdefueektdefiefhffffieduuddtudfhgfevtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 10:36 AM, Joel Stanley wrote:
> On Tue, 10 Aug 2021 at 08:34, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
>> with a simple PCI layout.
>>
>> Cc: Cleber Rosa <crosa@redhat.com>
>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  tests/acceptance/boot_linux_console.py | 42 ++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>> index 5248c8097df9..da93a475ca87 100644
>> --- a/tests/acceptance/boot_linux_console.py
>> +++ b/tests/acceptance/boot_linux_console.py
>> @@ -1176,6 +1176,48 @@ def test_ppc64_e500(self):
>>          tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
>>          self.do_test_advcal_2018('19', tar_hash, 'uImage')
>>
>> +    def do_test_ppc64_powernv(self, proc):
>> +
>> +        images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
>> +
>> +        skiboot_url = images_url + 'skiboot.lid'
>> +        skiboot_hash = 'a9ffcddbf238f86cda4b2cae2882d6bd13cff8489109758a4980efaf154f4a29'
>> +        skiboot_path = self.fetch_asset(skiboot_url, asset_hash=skiboot_hash,
>> +                                       algorithm='sha256')
> 
> What's the thought that led you to using this instead of the one that
> gets packaged with qemu?

Good question.

I considered that the skiboot.lid shipped with QEMU was somewhat a default
to make things work. The official released versions are the ones used by 
the outside world on real systems and were a better target for tests.

That said, using the default version might be enough. Maintainers, please 
advise ! 

>> +
>> +        kernel_url = images_url + 'zImage.epapr'
>> +        kernel_hash = '0ab237df661727e5392cee97460e8674057a883c5f74381a128fa772588d45cd'
>> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash,
>> +                                       algorithm='sha256')
>> +        self.vm.set_console()
>> +        self.vm.add_args('-bios', skiboot_path,
>> +                         '-kernel', kernel_path,
>> +                         '-append', 'console=tty0 console=hvc0',
>> +                         '-device', 'pcie-pci-bridge,id=bridge1,bus=pcie.1,addr=0x0',
>> +                         '-device', 'nvme,bus=pcie.2,addr=0x0,serial=1234',
>> +                         '-device', 'e1000e,bus=bridge1,addr=0x3',
>> +                         '-device', 'nec-usb-xhci,bus=bridge1,addr=0x2')
>> +        self.vm.launch()
>> +
>> +        self.wait_for_console_pattern("CPU: " + proc + " generation processor")
>> +        self.wait_for_console_pattern("zImage starting: loaded")
>> +        self.wait_for_console_pattern("Run /init as init process")
>> +        self.wait_for_console_pattern("Creating 1 MTD partitions")
> 
> This is great.
> 
> Is there any value in checking for some of the devices that come up,
> like USB or ethernet?

or nvme. Yes. That's a good idea.
 
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks,

C. 

> 
>> +
>> +    def test_ppc_powernv8(self):
>> +        """
>> +        :avocado: tags=arch:ppc64
>> +        :avocado: tags=machine:powernv8
>> +        """
>> +        self.do_test_ppc64_powernv('P8')
>> +
>> +    def test_ppc_powernv9(self):
>> +        """
>> +        :avocado: tags=arch:ppc64
>> +        :avocado: tags=machine:powernv9
>> +        """
>> +        self.do_test_ppc64_powernv('P9')
>> +
>>      def test_ppc_g3beige(self):
>>          """
>>          :avocado: tags=arch:ppc
>> --
>> 2.31.1
>>


