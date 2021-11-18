Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEA3455760
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 09:53:02 +0100 (CET)
Received: from localhost ([::1]:33834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mndAD-0001KO-Bd
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 03:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnd95-0000Ot-7O
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 03:51:51 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:56917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnd93-0006qM-JU
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 03:51:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8B58ECC4A621;
 Thu, 18 Nov 2021 09:51:46 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 18 Nov
 2021 09:51:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00491808efa-6fca-420e-87b5-2b859a9dd9b0,
 4A6ABDF66DC85A3D00A6C17CB73E494911F6EB6E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.55.24.82
Message-ID: <b1af85e3-f21e-dd4d-9e65-d7f0e483da05@kaod.org>
Date: Thu, 18 Nov 2021 09:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] docs: Introducing pseries documentation.
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, <lagarcia@linux.ibm.com>
References: <26442e7dd425bb4feca0adb54d3787fd135fffb7.1637180039.git.lagarcia@br.ibm.com>
 <YZWQr7QqZoGXDWjZ@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YZWQr7QqZoGXDWjZ@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5dab57b9-835b-4b4d-a565-9f888871196d
X-Ovh-Tracer-Id: 1450722034210081644
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeehgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.084,
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
Cc: Kardashevskiy <aik@ozlabs.ru>, danielhb413@gmail.com, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, Leonardo Garcia <lagarcia@br.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> + * Multi processor support for many Power processors generations: POWER5+,
>> +   POWER7, POWER7+, POWER8, POWER8NVL, Power9, and Power10 (there is no support
>> +   for POWER6 processors).
> 
> I wouldn't trust the POWER5+ cpu emulation with pseries; only POWER7
> and later has been tested at all.  Actually.. I wouldn't trust the
> POWER5+ CPU emulation much at all, if it's been tested, it's not for a
> long, long time.

SLOF starts and gets a machine check but it's alive.

Thanks,

C.


