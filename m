Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832153E940D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 16:56:18 +0200 (CEST)
Received: from localhost ([::1]:36538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDpeT-0000af-3A
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 10:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDpdF-0007nL-Gk
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 10:55:01 -0400
Received: from 10.mo52.mail-out.ovh.net ([87.98.187.244]:47864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDpdD-0000q5-Hc
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 10:55:01 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.197])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 4F11E28EBAE;
 Wed, 11 Aug 2021 16:54:46 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 16:54:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001fb1f9be3-fcab-46b1-9210-1330b8370509,
 F37E8DF54766F004E000311A84F7FEB06F086262) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] tests/acceptance: Test powernv machines
To: Thomas Huth <thuth@redhat.com>, Joel Stanley <joel@jms.id.au>
References: <20210810083346.730652-1-clg@kaod.org>
 <CACPK8Xc5J3tgtv3Z4ZxpR_r3BDaXJvt3mcxSqjyAtTYa+nQA-w@mail.gmail.com>
 <cca773c4-cf08-2fbb-9d9a-26f2fcfa6a34@kaod.org>
 <e14f8f87-8110-4084-94a6-ce09713f3fd2@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <eb30ede4-2779-b2d6-80af-a278fe80697a@kaod.org>
Date: Wed, 11 Aug 2021 16:54:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e14f8f87-8110-4084-94a6-ce09713f3fd2@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: eee6ace1-a338-46d0-aa11-cddff2e6e707
X-Ovh-Tracer-Id: 16480359886823000879
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrkedugdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehuedtheeghfdvhedtueelteegvdefueektdefiefhffffieduuddtudfhgfevtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/11/21 11:07 AM, Thomas Huth wrote:
> On 10/08/2021 11.09, Cédric Le Goater wrote:
>> On 8/10/21 10:36 AM, Joel Stanley wrote:
>>> On Tue, 10 Aug 2021 at 08:34, Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
>>>> with a simple PCI layout.
>>>>
>>>> Cc: Cleber Rosa <crosa@redhat.com>
>>>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>   tests/acceptance/boot_linux_console.py | 42 ++++++++++++++++++++++++++
>>>>   1 file changed, 42 insertions(+)
>>>>
>>>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>>>> index 5248c8097df9..da93a475ca87 100644
>>>> --- a/tests/acceptance/boot_linux_console.py
>>>> +++ b/tests/acceptance/boot_linux_console.py
>>>> @@ -1176,6 +1176,48 @@ def test_ppc64_e500(self):
>>>>           tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
>>>>           self.do_test_advcal_2018('19', tar_hash, 'uImage')
>>>>
>>>> +    def do_test_ppc64_powernv(self, proc):
>>>> +
>>>> +        images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
>>>> +
>>>> +        skiboot_url = images_url + 'skiboot.lid'
>>>> +        skiboot_hash = 'a9ffcddbf238f86cda4b2cae2882d6bd13cff8489109758a4980efaf154f4a29'
>>>> +        skiboot_path = self.fetch_asset(skiboot_url, asset_hash=skiboot_hash,
>>>> +                                       algorithm='sha256')
>>>
>>> What's the thought that led you to using this instead of the one that
>>> gets packaged with qemu?
>>
>> Good question.
>>
>> I considered that the skiboot.lid shipped with QEMU was somewhat a default
>> to make things work. The official released versions are the ones used by
>> the outside world on real systems and were a better target for tests.
>>
>> That said, using the default version might be enough. Maintainers, please
>> advise !
> 
> IMHO:
> 
> - We want to test the things that *we* ship
> 
> - We want to download as few things as possible, since downloads
>   often slow down the tests and break CI runs if the network to
>   the download site is not available
> 
>  ==> I'd prefer to use the internal skiboot.lid unless there is
>      really a compelling reason to use the external one.

OK. I changed the test to use the internal skiboot.lid.

Thanks,

C.





