Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F584A3801
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 19:14:05 +0100 (CET)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEEiC-0007fe-3S
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 13:14:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEEfl-0006ZW-NL; Sun, 30 Jan 2022 13:11:33 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:50415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEEfj-0008Md-IJ; Sun, 30 Jan 2022 13:11:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.159])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 62E85DB0A996;
 Sun, 30 Jan 2022 19:11:27 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 30 Jan
 2022 19:11:26 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0013cdb4285-bf16-492d-997a-173b30be10ae,
 23938959F8FC7A63916C59923A9E07E77CBFBAE2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2e9c7188-d87d-7367-a870-fb4bfbe788aa@kaod.org>
Date: Sun, 30 Jan 2022 19:11:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220127201116.1154733-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220127201116.1154733-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7202e649-38d3-4567-abf1-2722d247492c
X-Ovh-Tracer-Id: 15334475256956554092
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrfeelgdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgfdthedvjeekhfduveekkeffkeelteeffedtkeduleeiudejfedtieekffevgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk,
 Christophe Leroy <christophe.leroy@csgroup.eu>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/22 21:11, Fabiano Rosas wrote:
> Changes from v1:
> 
> - Restored the 'sc 1' support to avoid breaking the pegasos2 machine.
> 
> I tested this version in the G4 with the following OSes:
> 
> - Linux 5.15 (5.16 seems to be broken, even with master)


Have you tried pmac32 defconfig plus these configs :

CONFIG_SERIAL_PMACZILOG=y
CONFIG_SERIAL_PMACZILOG_TTYS=y
CONFIG_SERIAL_PMACZILOG_CONSOLE=y
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y

5.17-rc1 looks fine with your patchset.

Thanks,

C.


> - FreeBSD 13
> - Mac OS 9.2
> - Mac OS Darwin 6.0
> - Mac OS X 10.4
> - MorphOS 3.15 (-M pegasos2 and -M mac99,via=pmu)
> 
> Based on legoater/ppc-7.0
> 
> v1:
> https://lore.kernel.org/r/20220126164200.1048677-1-farosas@linux.ibm.com
> 
> Fabiano Rosas (8):
>    target/ppc: Introduce powerpc_excp_74xx
>    target/ppc: Simplify powerpc_excp_74xx
>    target/ppc: 74xx: Machine Check exception cleanup
>    target/ppc: 74xx: External interrupt cleanup
>    target/ppc: 74xx: Program exception cleanup
>    target/ppc: 74xx: System Call exception cleanup
>    target/ppc: 74xx: System Reset interrupt cleanup
>    target/ppc: 74xx: Set SRRs directly in exception code
> 
>   target/ppc/excp_helper.c | 197 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 197 insertions(+)
> 


