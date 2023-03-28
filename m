Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4034E6CB71E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 08:27:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph2me-0000Pj-Pe; Tue, 28 Mar 2023 02:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ph2md-0000PZ-6d
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 02:26:15 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ph2mb-0004CO-L6
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 02:26:14 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5FE701FEE9;
 Tue, 28 Mar 2023 06:26:10 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 28 Mar
 2023 08:26:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001a84037ec-2b12-4ebe-8ab9-136c087ea78b,
 5D21C2AA46E1B9891D174392918792ED1A5C90BB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <735e2b64-def2-e7ee-73a1-3711139077d2@kaod.org>
Date: Tue, 28 Mar 2023 08:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 2/3] tpm: Extend common APIs to support TPM TIS I2C
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <joel@jms.id.au>, <andrew@aj.id.au>, <stefanb@linux.ibm.com>
References: <20230327183350.4060507-1-ninad@linux.ibm.com>
 <20230327183350.4060507-3-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230327183350.4060507-3-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 4f26e80e-5cc5-41b2-9d4d-68bf629729ab
X-Ovh-Tracer-Id: 9836424536425401251
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehfedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepnhhinhgrugeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdhsthgvfhgrnhgssehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/27/23 20:33, Ninad Palsule wrote:
> Qemu already supports devices attached to ISA and sysbus. This drop adds
> support for the I2C bus attached TPM devices.
> 
> This commit includes changes for the common code.
> - Added support for the new checksum registers which are required for
>    the I2C support. The checksum calculation is handled in the qemu
>    common code.
> - Added wrapper function for read and write data so that I2C code can
>    call it without MMIO interface.
> 
> The TPM TIS I2C spec describes in the table in section "Interface Locality
> Usage per Register" that the TPM_INT_ENABLE and TPM_INT_STATUS registers
> must be writable for any locality even if the locality is not the active
> locality. Therefore, remove the checks whether the writing locality is the
> active locality for these registers.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


