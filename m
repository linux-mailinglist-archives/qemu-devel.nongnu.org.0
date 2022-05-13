Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5DC52659D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:06:18 +0200 (CEST)
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWrx-0005vS-UM
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npWpc-0002TN-L8
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:03:53 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:46739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npWpa-0001BH-BH
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:03:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.120])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3FBCD2581A;
 Fri, 13 May 2022 15:03:46 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 13 May
 2022 17:03:44 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S0039175db26-ae51-4bfb-a646-5e08de6a5917,
 97912ADCF8BE5A44427C4FE81E404CB8FAC57E21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c26c0c3e-9eba-050c-9feb-3a2ffd72e266@kaod.org>
Date: Fri, 13 May 2022 17:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] hw: m25p80: allow write_enable latch get/set
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>
References: <irischenlj@gmail.com> <20220513055022.951759-1-irischenlj@fb.com>
 <bfbffeef-e7d1-8003-24ca-4cafc90e60a4@kaod.org>
 <4613a814-c858-1cac-3750-789b388cba8d@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <4613a814-c858-1cac-3750-789b388cba8d@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f705113b-57c7-48f9-bdb3-1f80c939042f
X-Ovh-Tracer-Id: 8309422791764380545
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeelgdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/13/22 16:37, Thomas Huth wrote:
> On 13/05/2022 15.54, Cédric Le Goater wrote:
>> Thomas, and others,
>>
>> Are you ok with the qtest extension proposed by Iris ?
>>
>> If so, I can take them through an aspeed PR.
> 
> Fine for me!
> 
>> On 5/13/22 07:50, Iris Chen via wrote:
>>> The write_enable latch property is not currently exposed.
>>> This commit makes it a modifiable property.
>>>
>>> Signed-off-by: Iris Chen <irischenlj@fb.com>
>>> ---
>>> v3: Addressed comments by Peter and Cedric.
>>> v2: Ran ./scripts/checkpatch.pl on the patch and added a description. Fixed comments regarding DEFINE_PROP_BOOL.
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> 

Thanks Thomas,


Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.

