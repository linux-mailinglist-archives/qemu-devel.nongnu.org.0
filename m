Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A833E83D2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 21:37:17 +0200 (CEST)
Received: from localhost ([::1]:36050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDXYq-0004iy-If
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 15:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mDXY0-0003sh-OJ; Tue, 10 Aug 2021 15:36:24 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:33345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mDXXy-0001AQ-4G; Tue, 10 Aug 2021 15:36:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1C422B904BE7;
 Tue, 10 Aug 2021 21:36:17 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 10 Aug
 2021 21:36:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0014c7bf7ac-a052-42c5-97ad-60fdbf571c58,
 8F36BE46FB8773C29BD4C9A30C998E4B5B7B2B54) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PULL ppc] powernv queue
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210810124403.771769-1-clg@kaod.org>
 <CAFEAcA9aHX53JkEW3hbjWfeK=LL8QKxWopRAx4pcV6V=PKv3QQ@mail.gmail.com>
 <b840d4f3-efca-feaa-3834-375c8e51eb8a@amsat.org>
 <CAFEAcA9Yj=HwZcpg1S0tw7Oydnis2+_KR+5WimH6C43iWapxKA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a673221e-d297-9bfd-21f4-d44c15f61a1c@kaod.org>
Date: Tue, 10 Aug 2021 21:36:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Yj=HwZcpg1S0tw7Oydnis2+_KR+5WimH6C43iWapxKA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 22df767d-83d0-402d-84c0-df2620e6fbc5
X-Ovh-Tracer-Id: 15362059805371501350
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgddugeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepudegtdfftefguddvkedutdeujeehfeejhfekueehfeeggeehledvvddtgfduteegnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpmhgrihhlqdgrrhgthhhivhgvrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 5:33 PM, Peter Maydell wrote:
> On Tue, 10 Aug 2021 at 16:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 8/10/21 5:17 PM, Peter Maydell wrote:
>>> On Tue, 10 Aug 2021 at 13:46, Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> The following changes since commit bccabb3a5d60182645c7749e89f21a9ff307a9eb:
>>>>
>>>>   Update version for v6.1.0-rc2 release (2021-08-04 16:56:14 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://github.com/legoater/qemu/ tags/pull-powernv-20210810
>>>>
>>>> for you to fetch changes up to 91a6b62df830d51f2b6b2ea00b3c92231d0ba9dc:
>>>>
>>>>   ppc/pnv: update skiboot to commit 820d43c0a775. (2021-08-10 14:18:51 +0200)
>>>>
>>>> ----------------------------------------------------------------
>>>> ppc/pnv: update skiboot image
>>>>
>>>> ----------------------------------------------------------------
>>>> Cédric Le Goater (1):
>>>>       ppc/pnv: update skiboot to commit 820d43c0a775.
>>>
>>> That skiboot changelog lists a massive set of changes, which
>>> is correspondingly a larger risk that something in there turns
>>> out to be a must-fix-for-release regression.
>>
>> There might be a misunderstanding here, per
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg828857.html
>> I understand this pull request is targetting David PPC tree,
>> not the mainstream one. David first queued this patch for 6.2,
>> and later confirmed by Cédric:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg829160.html
> 
> Mmm. Also as Dan pointed out on irc firmware updates ought to
> be honouring the usual softfreeze rules. So I'm going to err
> on the safe side and won't be applying this.

Yes. I should have added a 'ppc-for-6.2' prefix. 

Sorry about that. 

C. 

