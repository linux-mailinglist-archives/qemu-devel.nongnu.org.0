Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361F63EFDAE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 09:19:09 +0200 (CEST)
Received: from localhost ([::1]:48974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGFqu-0000dS-9W
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 03:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mGFpj-0008Nk-8R
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:17:55 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:44169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mGFpg-0007WO-Tx
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:17:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 15FF813FAFB;
 Wed, 18 Aug 2021 07:17:46 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 18 Aug
 2021 09:17:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003d7442448-7733-4972-9cbd-f72b4839a885,
 438B77FCB4B6B4A29F77406FD4EC67CD8F0AE401) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH v2] tests/acceptance: Test powernv machines
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>
References: <20210817093036.1288791-1-clg@kaod.org>
 <3ad06368-59af-8782-d321-9c01675b88e8@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b935ee47-3040-658c-991f-cddc01dadca4@kaod.org>
Date: Wed, 18 Aug 2021 09:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3ad06368-59af-8782-d321-9c01675b88e8@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 02cddc13-3737-45f1-80b2-278566642dc9
X-Ovh-Tracer-Id: 12977685276835285865
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrleeggdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepthhhuhhthhesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.961,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 8:27 AM, Thomas Huth wrote:
> On 17/08/2021 11.30, Cédric Le Goater wrote:
>> Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
>> with a simple PCI layout.
>>
>> Cc: Cleber Rosa <crosa@redhat.com>
>> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>   Since v2:
>>
>>   - Change the skiboot.lid file to use the one shipped with QEMU
>>     tests/acceptance/boot_linux_console.py | 35 ++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>> index 5248c8097df9..59c9309c4d0b 100644
>> --- a/tests/acceptance/boot_linux_console.py
>> +++ b/tests/acceptance/boot_linux_console.py
>> @@ -1176,6 +1176,41 @@ def test_ppc64_e500(self):
>>           tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
>>           self.do_test_advcal_2018('19', tar_hash, 'uImage')
>>   +    def do_test_ppc64_powernv(self, proc):
>> +        images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
>> +
>> +        kernel_url = images_url + 'zImage.epapr'
>> +        kernel_hash = '0ab237df661727e5392cee97460e8674057a883c5f74381a128fa772588d45cd'
>> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash,
>> +                                       algorithm='sha256')
>> +        self.vm.set_console()
>> +        self.vm.add_args('-kernel', kernel_path,
>> +                         '-append', 'console=tty0 console=hvc0',
>> +                         '-device', 'pcie-pci-bridge,id=bridge1,bus=pcie.1,addr=0x0',
>> +                         '-device', 'nvme,bus=pcie.2,addr=0x0,serial=1234',
>> +                         '-device', 'e1000e,bus=bridge1,addr=0x3',
>> +                         '-device', 'nec-usb-xhci,bus=bridge1,addr=0x2')
>> +        self.vm.launch()
>> +
>> +        self.wait_for_console_pattern("CPU: " + proc + " generation processor")
>> +        self.wait_for_console_pattern("zImage starting: loaded")
>> +        self.wait_for_console_pattern("Run /init as init process")
>> +        self.wait_for_console_pattern("Creating 1 MTD partitions")
> 
> IMHO it might be sufficient to wait for the last console entry and drop the "zImage starting" and "Run /init" lines

OK. I might replace them with lines catching the driver log messages as Joel
suggested.  

wait_for_console_pattern() doesn't seem to be able to catch output from the 
petitboot loader which would be even better. Here is the final output :



 Petitboot (v1.12)                   IBM PowerNV (emulated by qemu) unavailable
 ──────────────────────────────────────────────────────────────────────────────

  System information
  System configuration
  System status log
  Language
  Rescan devices
  Retrieve config from URL
  Plugins (0)
 *Exit to shell           










 ──────────────────────────────────────────────────────────────────────────────
 Enter=accept, e=edit, n=new, x=exit, l=language, g=log, h=help
 [enP1p2s3] Configuring with DHCP



> (but I'd keep the "CPU:" line since it checks for the right processor type).

yes

> Anyway:
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks,

C.
 


