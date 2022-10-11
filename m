Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45EB5FAE39
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 10:15:20 +0200 (CEST)
Received: from localhost ([::1]:60212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiAQ3-0002wt-7J
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 04:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oi9gq-0000Vf-7H
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 03:28:36 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:36333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oi9gm-0002Rh-Bg
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 03:28:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.149])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 678A92565A;
 Tue, 11 Oct 2022 07:28:20 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 11 Oct
 2022 09:28:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00444200b5b-e075-49ba-b716-5c6790d0e890,
 D76C732790D2D2C2DE3D1CB86A566AEA08299A57) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <496e0c8b-17fe-9c9b-fbb3-7abb9ba61db4@kaod.org>
Date: Tue, 11 Oct 2022 09:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v9 01/10] s390x/cpus: Make absence of multithreading clear
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, Nico Boehr <nrb@linux.ibm.com>,
 <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, <borntraeger@de.ibm.com>, <pasic@linux.ibm.com>, 
 <richard.henderson@linaro.org>, <david@redhat.com>, <thuth@redhat.com>,
 <cohuck@redhat.com>, <mst@redhat.com>, <pbonzini@redhat.com>,
 <kvm@vger.kernel.org>, <ehabkost@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <seiden@linux.ibm.com>,
 <frankja@linux.ibm.com>, <berrange@redhat.com>
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-2-pmorel@linux.ibm.com>
 <166237756810.5995.16085197397341513582@t14-nrb>
 <c394823e-edd5-a722-486f-438e5fba2c9d@linux.ibm.com>
 <0d3fd34e-d060-c72e-ee19-e9054e06832a@kaod.org>
 <724d962a-c11b-c18d-f67f-9010eb2f32e2@linux.ibm.com>
 <dff1744f-3242-af11-6b4b-02037a7e2af5@linux.ibm.com>
 <3becce0a-1b7a-385a-4180-f68cf192595a@kaod.org>
 <e48d20de-11a4-9e2b-77a1-0a6014f7e0ea@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e48d20de-11a4-9e2b-77a1-0a6014f7e0ea@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: dfe08c96-21f1-44ad-8d43-b07fd2991925
X-Ovh-Tracer-Id: 1951184539371670288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejhedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.007,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/22 09:21, Pierre Morel wrote:
> 
> 
> On 9/28/22 18:28, Cédric Le Goater wrote:
>> On 9/28/22 18:16, Pierre Morel wrote:
>>> More thinking about this I will drop this patch for backward compatibility and in topology masks treat CPUs as being cores*threads
>>
>> yes. You never know, people might have set threads=2 in their
>> domain file (like me). You could give the user a warning though,
>> with warn_report().
> 
> More thinking, I come back to the first idea after Daniel comment and protect the change with a new machine type version.

yes. That would be another machine class attribute to set in the new machine,
may be 'max_threads' to compare with the user provided value.

C.

> 
> 
>>
>> Thanks,
>>
>> C.
>>
>>
>>>
> 


