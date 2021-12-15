Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F41BF475E69
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:18:50 +0100 (CET)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXvW-0004sT-31
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:18:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXWW-0001Vk-4M
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:53:00 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:50221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXWU-0002bc-Cb
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:52:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.206])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B36D2D225EDD;
 Wed, 15 Dec 2021 17:52:54 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:52:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003f1cef08b-9eae-4181-ac42-f2bd8ea41e48,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
Message-ID: <bccc5af2-973c-933b-c365-1964b1715e54@kaod.org>
Date: Wed, 15 Dec 2021 17:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211213133542.2608540-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211213133542.2608540-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8e04fa8c-988e-4eb3-ae69-0399112113ac
X-Ovh-Tracer-Id: 2118380678867094310
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgfeffueegjeejhffgjefhuddvieeugeetiefftedtleelleehleekveduteevffenucffohhmrghinhepghhnuhdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepmhgrrhhioheslhhotggrthhirdhith
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.64,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mario@locati.it, danielhb413@gmail.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 14:35, Fabiano Rosas wrote:
> When Altivec support was added to the e6500 kernel in 2012[1], the
> QEMU code was not changed, so we don't register the VPU/VPUA
> exceptions for the e6500:
> 
>    qemu: fatal: Raised an exception without defined vector 73
> 
> Note that the error message says 73, instead of 32, which is the IVOR
> for VPU. This is because QEMU knows only knows about the VPU interrupt
> for the 7400s. In theory, we should not be raising _that_ VPU
> interrupt, but instead another one specific for the e6500.
> 
> We unfortunately cannot register e6500-specific VPU/VPUA interrupts
> because the SPEU/EFPDI interrupts also use IVOR32/33. These are
> present only in the e500v1/2 versions. From the user manual:
> 
> e500v1, e500v2: only SPEU/EFPDI/EFPRI
> e500mc, e5500:  no SPEU/EFPDI/EFPRI/VPU/VPUA
> e6500:          only VPU/VPUA
> 
> So I'm leaving IVOR32/33 as SPEU/EFPDI, but altering the dispatch code
> to convert the VPU #73 to a #32 when we're in the e6500. Since the
> handling for SPEU and VPU is the same this is the only change that's
> needed. The EFPDI is not implemented and will cause an abort. I don't
> think it worth it changing the error message to take VPUA into
> consideration, so I'm not changing anything there.
> 
> This bug was discussed in the thread:
> https://lists.gnu.org/archive/html/qemu-ppc/2021-06/msg00222.html
> 
> 1- https://git.kernel.org/torvalds/c/cd66cc2ee52
> 
> Reported-by: <mario@locati.it>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Applied to ppc-next.

Thanks,

C.

