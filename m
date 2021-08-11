Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B903B3E8BB5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 10:24:41 +0200 (CEST)
Received: from localhost ([::1]:56602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDjXU-000124-Kj
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 04:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDjWS-00009l-Go
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:23:36 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:49001
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDjWQ-0003Jh-Cm
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:23:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.26])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 0053913B086;
 Wed, 11 Aug 2021 08:23:30 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:23:29 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0013e7db2af-25e0-426d-afac-3c6fd6e0c9d6,
 F37E8DF54766F004E000311A84F7FEB06F086262) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PULL ppc] powernv queue
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210810124403.771769-1-clg@kaod.org>
 <CAFEAcA9aHX53JkEW3hbjWfeK=LL8QKxWopRAx4pcV6V=PKv3QQ@mail.gmail.com>
 <b840d4f3-efca-feaa-3834-375c8e51eb8a@amsat.org>
 <CAFEAcA9Yj=HwZcpg1S0tw7Oydnis2+_KR+5WimH6C43iWapxKA@mail.gmail.com>
 <a673221e-d297-9bfd-21f4-d44c15f61a1c@kaod.org>
 <CAFEAcA_OB8AJVJB_Og2rV5ciO-FgYBMt_je=vuwOu+5DwsCGew@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <298085b0-a39e-e8c2-cdea-58c77c962620@kaod.org>
Date: Wed, 11 Aug 2021 10:23:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_OB8AJVJB_Og2rV5ciO-FgYBMt_je=vuwOu+5DwsCGew@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 034aa415-271e-4a3b-9600-ab7c6c653bef
X-Ovh-Tracer-Id: 9872453333481130790
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrkedugddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedulefffeeigfeflefggeetffejffdttefgiedvleetgeeiuefftdekjeeihfeuudenucffohhmrghinhepqhgvmhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/21 10:15 AM, Peter Maydell wrote:
> On Tue, 10 Aug 2021 at 20:36, Cédric Le Goater <clg@kaod.org> wrote:
>> Yes. I should have added a 'ppc-for-6.2' prefix.
> 
> If this wasn't intended for master, can you make sure the
> cover letter includes the "PULL SUBSYSTEM whatever" subject
> tag and has "not for master" in the body, as noted in
> https://wiki.qemu.org/Contribute/SubmitAPullRequest
> please? That way my email filters will ignore it.

ok. That's what I needed to know. Thanks and sorry again for the
false alarm.

C. 

