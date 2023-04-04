Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8500A6D5BC2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 11:23:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjcsD-0001av-PM; Tue, 04 Apr 2023 05:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pjcs6-0001aT-UT
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 05:22:35 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pjcs5-0003J8-4F
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 05:22:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5CEC62BFCA;
 Tue,  4 Apr 2023 09:22:29 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 4 Apr
 2023 11:22:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0054cd988ad-d4e0-4a68-815e-4da39195e32a,
 85507D0075A56E5AD4EA03BF56E5282CC2D8C3A6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0a5daba1-16df-cd01-f0fb-c6b9cccb04d3@kaod.org>
Date: Tue, 4 Apr 2023 11:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v19 15/21] tests/avocado: s390x cpu topology polarisation
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, <borntraeger@de.ibm.com>, <pasic@linux.ibm.com>, 
 <richard.henderson@linaro.org>, <david@redhat.com>, <thuth@redhat.com>,
 <cohuck@redhat.com>, <mst@redhat.com>, <pbonzini@redhat.com>,
 <kvm@vger.kernel.org>, <ehabkost@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <seiden@linux.ibm.com>,
 <nrb@linux.ibm.com>, <nsg@linux.ibm.com>, <frankja@linux.ibm.com>,
 <berrange@redhat.com>
References: <20230403162905.17703-1-pmorel@linux.ibm.com>
 <20230403162905.17703-16-pmorel@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230403162905.17703-16-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 00c44b89-e119-4cc6-a75b-6aa42af93303
X-Ovh-Tracer-Id: 17029517567254367187
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetgeetfffgvefhgfdviefgtdevffettedvueelueejieetveejveeiueelhefhfeenucffohhmrghinheplhhoghdrihhnfhhonecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpmhhorhgvlheslhhinhhugidrihgsmhdrtghomhdpnhhsgheslhhinhhugidrihgsmhdrtghomhdpnhhrsgeslhhinhhugidrihgsmhdrtghomhdpshgvihguvghnsehlihhnuhigrdhisghmrdgtohhmpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdgvsghlrghkvgesrhgvughhrghtrdgtohhmpdhmrghrtggvlhdrrghpfhgvlhgsrghumhesghhmrghilhdrtghomhdpvghhrggskhhoshhtse
 hrvgguhhgrthdrtghomhdpkhhvmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpfhhrrghnkhhjrgeslhhinhhugidrihgsmhdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdptghohhhutghksehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrseguvgdrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpmhhsthesrhgvughhrghtrdgtohhmpdgsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.349,
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

On 4/3/23 18:28, Pierre Morel wrote:
> Polarization is changed on a request from the guest.
> Let's verify the polarization is accordingly set by QEMU.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   tests/avocado/s390_topology.py | 38 +++++++++++++++++++++++++++++++++-
>   1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/s390_topology.py b/tests/avocado/s390_topology.py
> index 38e9cc4f16..a4bbbc2cb6 100644
> --- a/tests/avocado/s390_topology.py
> +++ b/tests/avocado/s390_topology.py
> @@ -107,6 +107,15 @@ def kernel_init(self):
>                            '-initrd', initrd_path,
>                            '-append', kernel_command_line)
>   
> +    def system_init(self):
> +        self.log.info("System init")
> +        exec_command(self, 'mount proc -t proc /proc')
> +        time.sleep(0.2)
> +        exec_command(self, 'mount sys -t sysfs /sys')
> +        time.sleep(0.2)
> +        exec_command_and_wait_for_pattern(self,
> +                '/bin/cat /sys/devices/system/cpu/dispatching', '0')
> +
>       def test_single(self):
>           self.kernel_init()
>           self.vm.launch()
> @@ -116,7 +125,6 @@ def test_single(self):
>       def test_default(self):
>           """
>           This test checks the implicite topology.
> -

unwanted change I guess ?


>           :avocado: tags=arch:s390x
>           :avocado: tags=machine:s390-ccw-virtio
>           """
> @@ -194,3 +202,31 @@ def test_hotplug_full(self):
>           self.wait_for_console_pattern('no job control')
>           self.check_topology(1, 1, 1, 1, 'medium', False)
>   
> +    def test_polarisation(self):
> +        """
> +        This test verifies that QEMU modifies the entitlement change after
> +        several guest polarization change requests.
> +
> +        :avocado: tags=arch:s390x
> +        :avocado: tags=machine:s390-ccw-virtio
> +        """
> +        self.kernel_init()
> +        self.vm.launch()
> +        self.wait_for_console_pattern('no job control')
> +
> +        self.system_init()
> +        self.check_topology(0, 0, 0, 0, 'medium', False)
> +
> +        exec_command(self, 'echo 1 > /sys/devices/system/cpu/dispatching')
> +        time.sleep(0.2)
> +        exec_command_and_wait_for_pattern(self,
> +                '/bin/cat /sys/devices/system/cpu/dispatching', '1')
> +
> +        self.check_topology(0, 0, 0, 0, 'medium', False)
> +
> +        exec_command(self, 'echo 0 > /sys/devices/system/cpu/dispatching')
> +        time.sleep(0.2)
> +        exec_command_and_wait_for_pattern(self,
> +                '/bin/cat /sys/devices/system/cpu/dispatching', '0')
> +
> +        self.check_topology(0, 0, 0, 0, 'medium', False)


