Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C48562B8D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 08:27:19 +0200 (CEST)
Received: from localhost ([::1]:44896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7A7a-00043A-LK
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 02:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7A1N-0001pl-2A
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 02:20:53 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:35335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7A1K-0005G6-F2
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 02:20:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 7CB5524AFD;
 Fri,  1 Jul 2022 06:20:46 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 1 Jul 2022
 08:20:45 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00151574818-6aaa-4ad9-985f-184099077d1f,
 4AFA7A5FE9B5479AF1021A557A7101AB3AA64E21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3f11c32a-407f-8a1a-0411-a8fe325514f0@kaod.org>
Date: Fri, 1 Jul 2022 08:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 09/13] hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
Content-Language: en-US
To: Patrick Venture <venture@google.com>, Peter Delevoryas <pdel@fb.com>
CC: Titus Rwantare <titusr@google.com>, Peter Delevoryas
 <peterdelevoryas@gmail.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "joel@jms.id.au" <joel@jms.id.au>, "cminyard@mvista.com"
 <cminyard@mvista.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Dan Zhang <zhdaniel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-10-pdel@fb.com>
 <CAMvPwGqmU+bsDb1fHraiTzdg14An5QiKUazSweyzVvbwHeCM=g@mail.gmail.com>
 <59308513-C87E-4DF9-8191-5F2664E90B85@fb.com>
 <CAO=notxbi2wroXK281X0Q4QUF2ONas2xHq=ZYDPsnKRaP4u2wg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAO=notxbi2wroXK281X0Q4QUF2ONas2xHq=ZYDPsnKRaP4u2wg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: eb87ffd8-241f-4758-b39d-b933657b7af0
X-Ovh-Tracer-Id: 10537860179791678453
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepiihhuggrnhhivghlsehfsgdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

>      > Thanks for the new device. It helps me see where to expand on PMBus.
> 
>     Thanks for adding the whole pmbus infrastructure! It’s really useful.
>     And thanks for the review.
> 
>     Off-topic, but I’ve been meaning to reach out to you guys (Google
>     engineers working on QEMU for OpenBMC) about your Nuvoton NPCM845R
>     series, my team is interested in using it. I was just curious about
>     the status of it and if there’s any features missing and what plans
>     you have for the future, maybe we can collaborate.
> 
> 
> Peter, feel free to reach out to me, or Titus, and we can sync up.  I used to work with Patrick who's now at Fb on OpenBMC stuff.  We sent a bunch of the Nuvoton patches up for review recently, and we're actively adding more devices, etc.
> 
> We also have quite a few patches downstream we're looking to upstream, including PECI, and sensors, etc, etc that we've seen on BMC servers.

So a simple PECI model is now merged. Sensors are always welcome,
it's nice to have properties to change values. On my wish-list
are PCIe and a working USB gadget network device.

Thanks,

C.

