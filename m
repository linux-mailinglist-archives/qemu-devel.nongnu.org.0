Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FB35288EF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:33:59 +0200 (CEST)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcjN-0008Qz-N4
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqc5L-0006Wt-Qh
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:52:36 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:50841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqc3d-0000DY-7C
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:52:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.217])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0AB822438D;
 Mon, 16 May 2022 14:50:31 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 16:50:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00399b1928b-da9b-47c9-ba32-596e12e4b1e4,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3c93e737-538a-aacc-e893-3f9e2c0f4692@kaod.org>
Date: Mon, 16 May 2022 16:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Getting rid of the last bits of QEMU's 'ad-hoc CI' for merges
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
 <b89bb57d-bf00-806c-52e6-9e55c24257a8@kaod.org>
 <CAFEAcA-nA4sKyPyRwc-MZbUt14y_4OJrhT3=momO2Cqi8r_9tA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA-nA4sKyPyRwc-MZbUt14y_4OJrhT3=momO2Cqi8r_9tA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 17f450ee-2759-493f-87b1-cb41fab788fe
X-Ovh-Tracer-Id: 7256987850700917682
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghlvggrlhesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 5/16/22 15:55, Peter Maydell wrote:
> On Mon, 16 May 2022 at 14:51, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 5/16/22 14:43, Peter Maydell wrote:
>>> I think we can get away with just dropping ppc64be -- we have
>>> coverage for it as a cross-compile setup, and hopefully the
>>> s390x CI runner will catch the various "fails tests on big-endian host"
>>> issues. (Alternatively if anybody has a ppc64be machine they'd like
>>> to let us run a gitlab CI runner on, we could do that :-))
>>
>> No recent HW (P8 and above) would run a PPC64 BE distro if LE is
>> supported by HW.
> 
> FWIW, the machine I use for ad-hoc CI is one in the gcc compile
> farm, which is supposedly a "IBM POWER8 8284-22A", running Debian sid.

Since the P8 have been around (~2014), the focus is really on LE.
I think debian is the last distro still providing BE binaries.
But no iso, you have to start with a debian 1O and do the upgrade.

> If BE PPC is fading away then that's another argument for
> living with the loss of CI coverage, I guess.

yes.

It would good to keep a BE host for test coverage. It doesn't have
to be ppc64be if it is too complex to maintain.

I can help on setting up a debian BE sid vm on the above IBM POWER8
8284-22A system if you need to. I have an image ready to use.

Thanks,

C.

