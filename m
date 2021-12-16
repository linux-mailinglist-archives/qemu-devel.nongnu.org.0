Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38CD477B17
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:53:01 +0100 (CET)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxuw8-0008C0-Na
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:53:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxuuy-0006rS-6k
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:51:48 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:53583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxuus-0006ll-DB
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:51:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.179])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C1522202C6;
 Thu, 16 Dec 2021 17:51:39 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 16 Dec
 2021 18:51:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a92e98b8-072e-4047-8c06-f8c29123efde,
 C4E9F14F77021FCD78381261BFC7BBA46F2BB44E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <77cde36a-d770-5176-b28d-2db7a157e45e@kaod.org>
Date: Thu, 16 Dec 2021 18:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 000/102] ppc queue
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <2ef5a85e-8955-2028-026d-7cb3ad13d718@linaro.org>
 <2f7401a9-a466-2e5b-df8b-6544fc7b16ba@kaod.org>
 <56e6beae-1c4f-2723-6174-f239f1a38c94@kaod.org>
 <c794cd0d-fb49-467b-dc2b-01f2ea86a4c2@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c794cd0d-fb49-467b-dc2b-01f2ea86a4c2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c23dece3-bec2-4fa5-84af-235b64db2eb9
X-Ovh-Tracer-Id: 8983273882970000291
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrleeggddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekkeefheefvdefhefgjeelveekheeileehudevkeefvdfhleetiedvffdtudeknecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlrghgrghrtghirgeslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?= <lagarcia@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 13:21, Richard Henderson wrote:
> On 12/15/21 11:02 PM, Cédric Le Goater wrote:
>>>> Fails testing:
>>>>
>>>> /home/gitlab-runner/builds/yKcZqVC9/0/qemu-project/qemu/docs/specs/ppc-spapr-hcalls.rst:101:Block quote ends without a blank line; unexpected unindent.
>>>
>>> I didn't see it under  :
>>>
>>>   https://gitlab.com/legoater/qemu/-/pipelines/429852244
>>>
>>> Is the job being run by default ?
>>
>> It's certainly due to
>>
>>    [PULL 017/102] docs: rSTify ppc-spapr-hcalls.txt
>>
>> However, it does not reproduce on f34 and 21.10 systems using python-sphinx
>> 3.4.3-2 and 3.5.4-2
> 
> Correct, it's a system running 18.04.5 LTS, python3-sphinx 1.6.7.
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1890700682
> 
> Is our s390x ci host really the only one left running 18.04?
> That seems like a mistake...

ok. Tell me if you want a resend.

Thanks,

C.

