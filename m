Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF1A3FE07A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:55:42 +0200 (CEST)
Received: from localhost ([::1]:53888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTWX-0004yq-6M
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLT5W-0001KQ-H5
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:27:46 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:49693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLT5S-0001bf-HF
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:27:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.124])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 627F713B0FD;
 Wed,  1 Sep 2021 16:27:38 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 18:27:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003f0d5f9b7-73f5-4f81-9d5e-fba7b2c2d7af,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] gitlab: Escape git-describe match pattern on Windows hosts
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210901145229.4132606-1-philmd@redhat.com>
 <YS+UylEr3CJyksxt@redhat.com>
 <CAFEAcA_gyZTfUTAAoKvrA-qyv-8dOvGjLSLmq2uaur8XYS6CuQ@mail.gmail.com>
 <YS+aiZep166VuVcH@redhat.com>
 <0901f6da-de5c-f9e6-5f40-e15f4a7c807d@redhat.com>
 <YS+iCgl88cmMepKl@redhat.com>
 <33d1a40b-c242-6472-5aa4-4108668ccc84@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <005033c9-ac86-7af2-203d-0c597cec691c@kaod.org>
Date: Wed, 1 Sep 2021 18:27:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <33d1a40b-c242-6472-5aa4-4108668ccc84@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cb528294-aab6-4a21-878e-a1d8578d1040
X-Ovh-Tracer-Id: 12248102139088767989
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekffdukeeuieehudegudejgeejkeefheduvddvveefieeuvdehgfehhfdvgeeffeenucffohhmrghinhepghhithhlrggsrdgtohhmpdhqvghmuhdrnhgvfienucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehphhhilhhmugesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.029,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 6:24 PM, Philippe Mathieu-Daudé wrote:
> On 9/1/21 5:53 PM, Daniel P. Berrangé wrote:
>> On Wed, Sep 01, 2021 at 05:35:42PM +0200, Philippe Mathieu-Daudé wrote:
>>> On 9/1/21 5:21 PM, Daniel P. Berrangé wrote:
>>>> On Wed, Sep 01, 2021 at 04:17:48PM +0100, Peter Maydell wrote:
>>>>> On Wed, 1 Sept 2021 at 15:59, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>>
>>>>>> On Wed, Sep 01, 2021 at 04:52:29PM +0200, Philippe Mathieu-Daudé wrote:
>>>>>>> Properly escape git-describe 'match' pattern to avoid (MinGW):
>>>>>>>
>>>>>>>   $ if grep -q "EXESUF=.exe" config-host.mak; then make installer;
>>>>>>>     version="$(git describe --match v[0-9]*)";
>>>>>>>     mv -v qemu-setup*.exe qemu-setup-${version}.exe; fi
>>>>>>>   fatal: No names found, cannot describe anything.
>>>>>>>   ERROR: Job failed: exit code 1
>>>>>>>
>>>>>>> Reported-by: Cédric Le Goater <clg@kaod.org>
>>>>>>> Fixes: 8619b5ddb56 ("ci: build & store windows installer")
>>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/591
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>>> ---
>>>>>>>  .gitlab-ci.d/crossbuild-template.yml | 2 +-
>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
>>>>>>> index 10d22dcf6c1..62d33e6661d 100644
>>>>>>> --- a/.gitlab-ci.d/crossbuild-template.yml
>>>>>>> +++ b/.gitlab-ci.d/crossbuild-template.yml
>>>>>>> @@ -14,7 +14,7 @@
>>>>>>>      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>>>>>>>      - if grep -q "EXESUF=.exe" config-host.mak;
>>>>>>>        then make installer;
>>>>>>> -      version="$(git describe --match v[0-9]*)";
>>>>>>> +      version="$(git describe --match 'v[0-9]*')";
>>>>>>
>>>>>> Do you have a pointer to a pipeline showing this fix works ?
>>>
>>> It worked on my fork but I have some versioned tag:
>>> https://gitlab.com/philmd_rh/qemu/-/jobs/1553450025
>>
>> I can reproduce the error msg if I do a shallow clone with no history
>>
>> $ cd qemu
>> $ git describe --match v[0-9]*
>> v6.1.0-171-g5e8c1a0c90
>>
>> $ cd ..
>> $ git clone --depth 1 https://gitlab.com/qemu-project/qemu/ qemu.new
>> $ cd qemu.new/
>> $ git describe --match v[0-9]*
>> fatal: No names found, cannot describe anything.
>>
>> but the odd thing is that I think we should have been hitting the
>> problem frequently if it was related to git depth. This job passes
>> fine in current CI pipelines and my own fork.
> 
> FYI it didn't work out on Cédric fork:
> https://gitlab.com/legoater/qemu/-/jobs/1553492082
> 

Indeed.

Thanks Phil,

C.

