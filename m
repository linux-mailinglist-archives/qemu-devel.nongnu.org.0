Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834653FB161
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:48:44 +0200 (CEST)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb63-0003ie-IQ
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mKakO-0007Oq-HA
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:26:20 -0400
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:50655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mKakM-0008Sb-Cm
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:26:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 62848293C2C;
 Mon, 30 Aug 2021 08:26:05 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 30 Aug
 2021 08:26:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005851b2489-13fd-4744-9cb1-e346517d0995,
 A410DCCBFF6448DFF799E1C977766415213BDB3F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: QEMU-KVM offers OPAL firmware interface? OpenBSD guest support?
To: Joseph <joseph.mayer@protonmail.com>, Mark Kettenis
 <mark.kettenis@xs4all.nl>, Greg Kurz <groug@kaod.org>, "ppc@openbsd.org"
 <ppc@openbsd.org>
References: <7r8MLHEKQicVkfT4tQLsiRXQmt_800XbV1s0mM_QJTgOY7XadpiRcD4HizmXByPaZRsMQV2WbNKDfKU-PdVo3ZO9JC6fJ0MF5LM_j5a2fgA=@protonmail.com>
 <20210827170113.5f4ed260@bahia.lan>
 <HgtFZEnabNjIrsVI3x8MYs2QYSCG4IFStP0MR3qwPWBmXW9kDmQmIwQEWHMVdJbUCu-XvHdMpZGe3pr-B91s1D7y6cn9SVzhxEYms5c3p0o=@protonmail.com>
 <20210827180259.3720d58d@bahia.lan>
 <56141ff67838992a@bloch.sibelius.xs4all.nl>
 <20210827190053.6c68def5@bahia.lan>
 <25bfa81c-9498-4e82-a848-1fbb1c188ff1@kaod.org>
 <561422a20e4f9ae2@bloch.sibelius.xs4all.nl>
 <51bff28d-4779-b023-fee6-b3e9196b7ec5@kaod.org>
 <3QoYEEZauH3xXwC2NcJFnrHe4IaWwu2fqEvtR6tR3RHsY_b0bsyz0oQdcI0b1zdwnXbXhl6bCtaUiyWQjbYgnx5U-Ov_Lm3tMGdMkTwZC88=@protonmail.com>
 <rsXZBagdw5FfhNG03S3YOPy0gXevBIpZ2ugg1vO381FSYZPj2Cxjtn-SBmEfa1Z2R4lQLB_Qwt3kI7C_-amLCSy1fBxTbkAQckqjYHAhWcs=@protonmail.com>
Message-ID: <6c7067e2-b9e7-62a3-9074-2de85c28b1b3@kaod.org>
Date: Mon, 30 Aug 2021 08:26:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <rsXZBagdw5FfhNG03S3YOPy0gXevBIpZ2ugg1vO381FSYZPj2Cxjtn-SBmEfa1Z2R4lQLB_Qwt3kI7C_-amLCSy1fBxTbkAQckqjYHAhWcs=@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 62fce9bc-fa63-4979-9dbf-d71d51bd2078
X-Ovh-Tracer-Id: 8790182047845616632
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddukedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhuffvfhfkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtudeludehgfefhedugfduteeftefftedvfeelvdefuedufeeivdfgffeijeeiheenucffohhmrghinhepohhpvghnphhofigvrhhfohhunhgurghtihhonhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.58,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pjp@centroid.eu, gardask@gmail.com, rgcinjp@disroot.org, daniel@pocock.pro,
 kite@centroid.eu, QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/29/21 6:20 AM, Joseph wrote:
>> runs Linux powernv bare metal on Power9 hardware. Each VM is a
>> KVM-QEMU instance.
> 
>>>> If you want to also run OpenBSD inside a VM, then OpenBSD must
>>>> implement proper support to be able to run in the paravirtualized
>>>> PAPR environment provided by KVM-QEMU on POWER. The OpenBSD statement
>>>> seem to indicate this is missing. Nothing special "should" be needed
>>>> on the KVM-QEMU side.
> 
> Terminology, what is PAPR an abbreviation of

Power Architecture Platform Reference

https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200611.pdf

> is pseries (hardware interface) equivalent with PAPR?

pseries was the name of IBM powerpc servers. It is the name of the Linux 
platform supporting PAPR and also the name of the QEMU machine implementing 
PAPR.

> Also all discussed above is supported by Raptor Talos/Blackbird
> hardware right - the Raptor machine exports PowerNV to the host system
> that runs on bare metal, and the host system (= Linux QEMU-KVM for
> now) will export a virtualized pseries/papr Power9 machine to the VM
> guest, which runs at close to full bare metal speed?

yes. There is a slight overhead depending on how much the hypervisor needs
to be involved.  
 
C.

