Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD636EBF2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:05:37 +0200 (CEST)
Received: from localhost ([::1]:60122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc7IO-00067Z-Ct
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lc7Gr-00053C-S2
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:04:01 -0400
Received: from 7.mo51.mail-out.ovh.net ([46.105.33.25]:45548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lc7Go-00071G-3a
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:04:01 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id DD41A285FF2;
 Thu, 29 Apr 2021 16:03:45 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 29 Apr
 2021 16:03:44 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0016c8b2eef-31f8-4f98-95ae-10d72cd6f142,
 79FD99B9F35441B55338C578C1C3445AC83C88D3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/2] spapr.h: increase FDT_MAX_SIZE
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20210408204049.221802-1-danielhb413@gmail.com>
 <20210408204049.221802-3-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e1820a74-ba04-8e49-35fd-ca50e75ae611@kaod.org>
Date: Thu, 29 Apr 2021 16:03:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210408204049.221802-3-danielhb413@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 944e304e-9ea7-498c-8f8b-135bbc2a4c2e
X-Ovh-Tracer-Id: 13601152353892404131
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgedgjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 10:40 PM, Daniel Henrique Barboza wrote:
> Certain SMP topologies stress, e.g. 1 thread/core, 2048 cores and
> 1 socket, stress the current maximum size of the pSeries FDT:
> 
> Calling ibm,client-architecture-support...qemu-system-ppc64: error
> creating device tree: (fdt_setprop(fdt, offset,
> "ibm,processor-segment-sizes", segs, sizeof(segs))): FDT_ERR_NOSPACE
> 
> 2048 is the default NR_CPUS value for the pSeries kernel. It's expected
> that users will want QEMU to be able to handle this kind of
> configuration.
> 
> Bumping FDT_MAX_SIZE to 2MB is enough for these setups to be created.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  include/hw/ppc/spapr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index bf7cab7a2c..3deb382678 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -95,7 +95,7 @@ typedef enum {
>  #define SPAPR_CAP_FIXED_CCD             0x03
>  #define SPAPR_CAP_FIXED_NA              0x10 /* Lets leave a bit of a gap... */
>  
> -#define FDT_MAX_SIZE                    0x100000
> +#define FDT_MAX_SIZE                    0x200000
>  
>  /*
>   * NUMA related macros. MAX_DISTANCE_REF_POINTS was taken
> 

FYI,

On a very large system, I also had to bump the FDT_MAX_SIZE value in 
softmmu/device-tree.c because QEMU is parsing the host DT. 

Thanks,

C.

