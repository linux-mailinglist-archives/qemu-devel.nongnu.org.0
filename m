Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220C76D5FFC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:18:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjfbF-0003pt-Fj; Tue, 04 Apr 2023 08:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pjfbB-0003nQ-7z
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:17:17 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pjfb6-0002Ua-Rm
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:17:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1E53022056;
 Tue,  4 Apr 2023 12:17:03 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 4 Apr
 2023 14:17:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00271947050-032d-42f3-bbac-fe0ddad42753,
 85507D0075A56E5AD4EA03BF56E5282CC2D8C3A6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c24550f7-4468-a56e-17b0-642df650700c@kaod.org>
Date: Tue, 4 Apr 2023 14:17:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v19 14/21] tests/avocado: s390x cpu topology core
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Pierre Morel <pmorel@linux.ibm.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, <borntraeger@de.ibm.com>, <pasic@linux.ibm.com>, 
 <richard.henderson@linaro.org>, <david@redhat.com>, <thuth@redhat.com>,
 <cohuck@redhat.com>, <mst@redhat.com>, <pbonzini@redhat.com>,
 <kvm@vger.kernel.org>, <ehabkost@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <seiden@linux.ibm.com>,
 <nrb@linux.ibm.com>, <nsg@linux.ibm.com>, <frankja@linux.ibm.com>,
 <berrange@redhat.com>
References: <20230403162905.17703-1-pmorel@linux.ibm.com>
 <20230403162905.17703-15-pmorel@linux.ibm.com>
 <2b678e7d-488d-0072-2b27-cd54a43a77b2@kaod.org>
In-Reply-To: <2b678e7d-488d-0072-2b27-cd54a43a77b2@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 14b8fda1-0778-48eb-85ca-62282ac2068c
X-Ovh-Tracer-Id: 1530942398634429395
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledghedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffhvfevfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegveegudfffeeigfdvteeukeefleetgeekgfefudekuedvjeduleeftdeihfdtffenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpmhhorhgvlheslhhinhhugidrihgsmhdrtghomhdpnhhsgheslhhinhhugidrihgsmhdrtghomhdpnhhrsgeslhhinhhugidrihgsmhdrtghomhdpshgvihguvghnsehlihhnuhigrdhisghmrdgtohhmpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdgvsghlrghkvgesrhgvughhrghtrdgtohhmpdhmrghrtggvlhdrrghpfhgvlhgsrghumhesghhmrghilhdrtghomhdpvghhrggskhhoshhtsehrvgguhhgrthdrtghomhdpkhhvmhesvhhgvg
 hrrdhkvghrnhgvlhdrohhrghdpfhhrrghnkhhjrgeslhhinhhugidrihgsmhdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdptghohhhutghksehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrseguvgdrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpmhhsthesrhgvughhrghtrdgtohhmpdgsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.925,
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

On 4/4/23 11:21, Cédric Le Goater wrote:
> On 4/3/23 18:28, Pierre Morel wrote:
>> Introduction of the s390x cpu topology core functions and
>> basic tests.
>>
>> We test the corelation between the command line and
>> the QMP results in query-cpus-fast for various CPU topology.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> 
> I gave the tests a run on a z LPAR. Nice job !

I forgot to add some timing output :

$ build/tests/venv/bin/avocado --show=app run   build/tests/avocado/s390_topology.py
  (01/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_single: PASS (4.78 s)
  (02/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_default: PASS (3.90 s)
  (03/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_move: PASS (3.82 s)
  (04/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_hotplug: PASS (3.84 s)
  (05/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_hotplug_full: PASS (3.94 s)
  (06/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_polarisation: PASS (4.59 s)
  (07/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_entitlement: PASS (4.65 s)
  (08/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_dedicated: PASS (4.65 s)
  (09/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_socket_full: PASS (4.25 s)
  (10/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_dedicated_error: PASS (4.46 s)
  (11/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_move_error: PASS (4.22 s)
  (12/12) build/tests/avocado/s390_topology.py:S390CPUTopology.test_query_polarization: PASS (4.63 s)


C.

