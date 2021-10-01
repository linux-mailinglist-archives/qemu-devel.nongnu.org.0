Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D441EE51
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 15:16:47 +0200 (CEST)
Received: from localhost ([::1]:38080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWIP8-000534-Fj
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 09:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mWIMc-0003d9-Kp
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:14:11 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:35051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mWIMZ-0001IZ-6J
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:14:10 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.139])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3058B22DEA;
 Fri,  1 Oct 2021 13:14:03 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Oct
 2021 15:14:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0050d6e0214-3973-4d16-b014-46ad590903ea,
 4BD1923EFCE0A2D5FFEE921A78BF2E0F2CE6D79C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <cb8b2ebd-ff24-519d-994e-0b5478ad1c5b@kaod.org>
Date: Fri, 1 Oct 2021 15:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Huth
 <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a0a76dfc-e053-44c4-bc0d-80aad15a789a
X-Ovh-Tracer-Id: 692146970069273415
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudekiedgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekkeefheefvdefhefgjeelveekheeileehudevkeefvdfhleetiedvffdtudeknecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 15:04, Christophe Leroy wrote:
> 
> 
> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>> On 01/10/2021 13.12, Peter Maydell wrote:
>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
>>>> Nevertheless, as long as nobody has a hint where to find that
>>>> ppc405_rom.bin, I think both boards are pretty useless in QEMU (as far as I
>>>> can see, they do not work without the bios at all, so it's also not possible
>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>
>>> It is at least in theory possible to run bare-metal code on
>>> either board, by passing either a pflash or a bios argument.
>>
>> True. I did some more research, and seems like there was once support for those boards in u-boot, but it got removed there a couple of years ago already:
>>
>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>
>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>
>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>
>>> But I agree that there seem to be no signs of anybody actually
>>> successfully using these boards for anything, so we should
>>> deprecate-and-delete them.
>>
>> Yes, let's mark them as deprecated now ... if someone still uses them and speaks up, we can still revert the deprecation again.
>>
> 
> 
> I really would like to be able to use them to validate Linux Kernel changes, hence looking for that missing BIOS.
> 
> If we remove ppc405 from QEMU, we won't be able to do any regression tests of Linux Kernel on those processors.

It's nice to have I agree.

Someone needs to find the right u-boot level and certainly also,
a host old enough to support the compiler options. May be, a RH6
ppc64 VM or an old ppc32 debian image running under QEMU or
some MAC.

Tell me if you need some help to get a system/image.

C.

