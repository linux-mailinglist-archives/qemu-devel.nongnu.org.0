Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8AF45DC5A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 15:31:09 +0100 (CET)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqFmF-0002Br-Ue
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 09:31:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqFk5-0008SF-Q5
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 09:28:53 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqFk3-0001Bm-4c
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 09:28:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0652720E4C;
 Thu, 25 Nov 2021 14:28:47 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 25 Nov
 2021 15:28:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0030bc3a447-f4d8-4c6b-b9f7-616ca2817789,
 AF2EA5E2EB7DD02CCE15CE75BB525ABEFFBF2660) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.17
Message-ID: <0ec26d41-fd1a-7edb-809d-128140b43248@kaod.org>
Date: Thu, 25 Nov 2021 15:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the G4
 family
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
 <68bd9d8a-b46b-b2a9-f48b-54a962e173a7@kaod.org>
 <f5406c8-97b2-b75f-57c9-755ee26fcb9c@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <f5406c8-97b2-b75f-57c9-755ee26fcb9c@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fc0527cb-aa41-4e68-a467-0114a15cc092
X-Ovh-Tracer-Id: 11357796789279296361
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedtgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhgefgtdejfedvueetfeehjeekjeeutddvgfeuudffieegfffhjeduueeitdfhveenucffohhmrghinheprhgvrgguthhhvgguohgtshdrihhonecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, openbios@openbios.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>  https://qemu.readthedocs.io/en/latest/system/target-ppc.html
> 
> Yes, I thought about that but haven't got to it yet. I'm also not sure what should I put in that doc so if you have time feel free to copy from the above URLs what you think is better to have in the docs. Otherwise I'll do it sometimes in the future.

ok. We don't have to copy all of the contents. We can reference
external URLs for more complete information.

Thanks,

C.

