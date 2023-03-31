Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0906D1EE6
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 13:20:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piCn2-0000X3-8y; Fri, 31 Mar 2023 07:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1piCmz-0000Vv-LC
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 07:19:25 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1piCmx-00073H-25
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 07:19:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.239])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C152F22C57;
 Fri, 31 Mar 2023 11:19:19 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 31 Mar
 2023 13:19:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00346480125-3ff2-4314-96a6-d30ef8daf62a,
 888EB69131AACBF8F71B134F454D75158024DA69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <795a376f-efb9-1c2b-e0b3-d50def600a48@kaod.org>
Date: Fri, 31 Mar 2023 13:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] tests/avocado/boot_linux.py: re-enable test-case for
 ppc64
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, Cleber
 Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, <qemu-devel@nongnu.org>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>
References: <20230327115030.3418323-1-kconsul@linux.vnet.ibm.com>
 <20230327115030.3418323-3-kconsul@linux.vnet.ibm.com>
 <87r0tarx7u.fsf@linaro.org>
 <ZCLOi5RKIMGfjWRj@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ZCLOi5RKIMGfjWRj@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a2ab230b-10d2-4753-8be6-4c6488392a34
X-Ovh-Tracer-Id: 13958625572784671733
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefgfekteekgeelheeujeeghfetkeetleeiudeuffektefgkeehueffheevveekjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdelpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehktghonhhsuhhlsehlihhnuhigrdhvnhgvthdrihgsmhdrtghomhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdhjshhnohifsehrvgguhhgrthdrtghomhdptghrohhsrgesrhgvughhrghtrdgtohhmpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgslhgvrghlse
 hrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hello,

[ Copying qemu-ppc@ and Daniel ]

On 3/28/23 13:24, Kautuk Consul wrote:
> On 2023-03-27 17:07:30, Alex Bennée wrote:
>>
>> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
>>
>>> Fixes c0c8687ef0("tests/avocado: disable BootLinuxPPC64 test in CI").
>>>
>>> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the test-case
>>> for PPC64. On investigation, this turns out to be an issue with the
>>> time taken for downloading the Fedora 31 qcow2 image being included
>>> within the test-case timeout.
>>> Re-enable this test-case by setting the timeout to 360 seconds just
>>> before launching the downloaded VM image.
>>>
>>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>> Reported-by: Alex Bennée <alex.bennee@linaro.org>
>>> Tested-by: Hariharan T S hariharan.ts@linux.vnet.ibm.com
>>
>> It doesn't really address the principle problem that the
>> boot_linux.py:BootLinuxPPC64.test_pseries_tcg is super heavyweight for
>> only 2% extra coverage of the executed lines.
> By re-enabling this test-case we will ensure that PPC64 part of qemu
> works okay in terms of basic linux boot. Without this we will have
> a regression in the sense that there won't be any way to test out
> basic linux boot for PPC64.

There are ways and pseries is not only PPC64 machine. There is more
to it. See :

   https://github.com/legoater/qemu-ppc-boot/tree/main/buildroot
   https://github.com/legoater/buildroot/tree/qemu-ppc/board/qemu

QEMU PPC maintainers have external tools for regressions which are
run regularly, at least before sending a PR for upstream.

Thanks,

C.

>>
>> What we really need is a script so we can compare the output between the
>> two jsons:
>>
>>    gcovr --json --exclude-unreachable-branches --print-summary -o coverage.json --root ../../ . *.p
>>
>> because I suspect we could make up that missing few % noodling the
>> baseline test a bit more.
> Can you tell me how you check code coverage with and without this
> test-case ? I am kind of new to qemu so it would be nice to know how you
> do this. And I am trying to increase the code coverage by improving
> the baseline test by including more devices in the qemu-system-ppc64
> command line so I would appreciate any tips on how to do that also.
>>
>>> ---
>>>   tests/avocado/boot_linux.py | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
>>> index be30dcbd58..c3869a987c 100644
>>> --- a/tests/avocado/boot_linux.py
>>> +++ b/tests/avocado/boot_linux.py
>>> @@ -91,9 +91,9 @@ class BootLinuxPPC64(LinuxTest):
>>>       :avocado: tags=arch:ppc64
>>>       """
>>>   
>>> +    # timeout for downloading new VM image.
>>>       timeout = 360
>>>   
>>> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>>>       def test_pseries_tcg(self):
>>>           """
>>>           :avocado: tags=machine:pseries
>>> @@ -101,6 +101,10 @@ def test_pseries_tcg(self):
>>>           """
>>>           self.require_accelerator("tcg")
>>>           self.vm.add_args("-accel", "tcg")
>>> +
>>> +        # timeout for actual Linux PPC boot test
>>> +        self.timeout = 360
>>> +
>>>           self.launch_and_wait(set_up_ssh_connection=False)
>>
>>
>> -- 
>> Alex Bennée
>> Virtualisation Tech Lead @ Linaro
>>
> 


