Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1536D5BB7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 11:20:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjcpL-0000dP-AU; Tue, 04 Apr 2023 05:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pjcpJ-0000dB-FB; Tue, 04 Apr 2023 05:19:41 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pjcpH-0000jq-Kc; Tue, 04 Apr 2023 05:19:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AB4A72BE61;
 Tue,  4 Apr 2023 09:19:34 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 4 Apr
 2023 11:19:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0029dcf3b05-a962-4e76-b96e-0c999b7dc0df,
 85507D0075A56E5AD4EA03BF56E5282CC2D8C3A6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e86317ad-74d6-937e-5b48-f3ee93171ded@kaod.org>
Date: Tue, 4 Apr 2023 11:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v19 17/21] tests/avocado: s390x cpu topology test
 dedicated CPU
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
 <20230403162905.17703-18-pmorel@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230403162905.17703-18-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 69bda3fc-d316-4ad8-9a3e-e81398be960d
X-Ovh-Tracer-Id: 16980259448577035219
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuuddtteelgeejhfeikeegffekhfelvefgfeejveffjeeiveegfeehgfdtgfeitdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpmhhorhgvlheslhhinhhugidrihgsmhdrtghomhdpnhhsgheslhhinhhugidrihgsmhdrtghomhdpnhhrsgeslhhinhhugidrihgsmhdrtghomhdpshgvihguvghnsehlihhnuhigrdhisghmrdgtohhmpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdgvsghlrghkvgesrhgvughhrghtrdgtohhmpdhmrghrtggvlhdrrghpfhgvlhgsrghumhesghhmrghilhdrtghomhdpvghhrggskhhoshhtsehrvgguhhgrthdrtghomhdpkhhvmhesvhhgvg
 hrrdhkvghrnhgvlhdrohhrghdpfhhrrghnkhhjrgeslhhinhhugidrihgsmhdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdptghohhhutghksehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrseguvgdrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpmhhsthesrhgvughhrghtrdgtohhmpdgsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
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

On 4/3/23 18:29, Pierre Morel wrote:
> A dedicated CPU in vertical polarization can only have
> a high entitlement.
> Let's check this.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   tests/avocado/s390_topology.py | 43 +++++++++++++++++++++++++++++++++-
>   1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/s390_topology.py b/tests/avocado/s390_topology.py
> index f12f0ae148..6a41f08897 100644
> --- a/tests/avocado/s390_topology.py
> +++ b/tests/avocado/s390_topology.py
> @@ -52,6 +52,7 @@ class S390CPUTopology(LinuxKernelTest):
>       The polarization is changed on a request from the guest.
>       """
>       timeout = 90
> +    skip_basis = False
>   

This should come through its own patch.


>       def check_topology(self, c, s, b, d, e, t):
> @@ -116,12 +117,14 @@ def system_init(self):
>           exec_command_and_wait_for_pattern(self,
>                   '/bin/cat /sys/devices/system/cpu/dispatching', '0')
>   
> +    @skipIf(skip_basis, 'skipping basis tests')
>       def test_single(self):
>           self.kernel_init()
>           self.vm.launch()
>           self.wait_for_console_pattern('no job control')
>           self.check_topology(0, 0, 0, 0, 'medium', False)
>   
> +    @skipIf(skip_basis, 'skipping basis tests')
>       def test_default(self):
>           """
>           This test checks the implicite topology.
> @@ -147,6 +150,7 @@ def test_default(self):
>           self.check_topology(11, 2, 1, 0, 'medium', False)
>           self.check_topology(12, 0, 0, 1, 'medium', False)
>   
> +    @skipIf(skip_basis, 'skipping basis tests')
>       def test_move(self):
>           """
>           This test checks the topology modification by moving a CPU
> @@ -167,6 +171,7 @@ def test_move(self):
>           self.assertEqual(res['return'], {})
>           self.check_topology(0, 2, 0, 0, 'low', False)
>   
> +    @skipIf(skip_basis, 'skipping basis tests')
>       def test_hotplug(self):
>           """
>           This test verifies that a CPU defined with '-device' command line
> @@ -184,6 +189,7 @@ def test_hotplug(self):
>   
>           self.check_topology(10, 2, 1, 0, 'medium', False)
>   
> +    @skipIf(skip_basis, 'skipping basis tests')
>       def test_hotplug_full(self):
>           """
>           This test verifies that a hotplugged fully defined with '-device'
> @@ -202,6 +208,7 @@ def test_hotplug_full(self):
>           self.wait_for_console_pattern('no job control')
>           self.check_topology(1, 1, 1, 1, 'medium', False)
>   
> +    @skipIf(skip_basis, 'skipping basis tests')
>       def test_polarisation(self):
>           """
>           This test verifies that QEMU modifies the entitlement change after
> @@ -231,7 +238,7 @@ def test_polarisation(self):
>   
>           self.check_topology(0, 0, 0, 0, 'medium', False)
>   
> -    def test_set_cpu_topology_entitlement(self):
> +    def test_entitlement(self):

May be introduce the correct name in the first patch.


>           """
>           This test verifies that QEMU modifies the polarization
>           after a guest request.
> @@ -286,3 +293,37 @@ def test_set_cpu_topology_entitlement(self):
>           self.check_topology(1, 0, 0, 0, 'medium', False)
>           self.check_topology(2, 1, 0, 0, 'high', False)
>           self.check_topology(3, 1, 0, 0, 'high', False)
> +
> +    def test_dedicated(self):
> +        """
> +        This test verifies that QEMU modifies the entitlement change correctly
> +        for a dedicated CPU after several guest polarization change requests.
> +
> +        :avocado: tags=arch:s390x
> +        :avocado: tags=machine:s390-ccw-virtio
> +        """
> +        self.kernel_init()
> +        self.vm.launch()
> +        self.wait_for_console_pattern('no job control')
> +
> +        self.system_init()
> +
> +        res = self.vm.qmp('set-cpu-topology',
> +                          {'core-id': 0, 'dedicated': True})
> +        self.assertEqual(res['return'], {})
> +
> +        self.check_topology(0, 0, 0, 0, 'high', True)
> +
> +        exec_command(self, 'echo 1 > /sys/devices/system/cpu/dispatching')
> +        time.sleep(0.2)
> +        exec_command_and_wait_for_pattern(self,
> +                '/bin/cat /sys/devices/system/cpu/dispatching', '1')
> +
> +        self.check_topology(0, 0, 0, 0, 'high', True)
> +
> +        exec_command(self, 'echo 0 > /sys/devices/system/cpu/dispatching')
> +        time.sleep(0.2)
> +        exec_command_and_wait_for_pattern(self,
> +                '/bin/cat /sys/devices/system/cpu/dispatching', '0')
> +
> +        self.check_topology(0, 0, 0, 0, 'high', True)


