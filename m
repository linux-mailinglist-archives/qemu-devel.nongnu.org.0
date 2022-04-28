Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B7E512F3E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:04:45 +0200 (CEST)
Received: from localhost ([::1]:54920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk04q-0005h9-1z
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njzwU-0001Es-U6
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:56:08 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:45361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njzwS-0008Nw-T8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 04:56:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 84C122298A;
 Thu, 28 Apr 2022 08:56:00 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 10:55:59 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004d8dc5c45-9371-4cce-b792-d36e261ebf10,
 964B4B5EE68C69CB799E8147BBEA8F01A3367603) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8ffebcd4-7036-3998-c224-4841f7f2a5b6@kaod.org>
Date: Thu, 28 Apr 2022 10:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] hw/arm: add versioning to sbsa-ref machine DT
Content-Language: en-US
To: Leif Lindholm <quic_llindhol@quicinc.com>, <qemu-devel@nongnu.org>
References: <20220427182934.27075-1-quic_llindhol@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220427182934.27075-1-quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a6f994d2-15e4-4337-8723-61ecb4907804
X-Ovh-Tracer-Id: 6241989083600096163
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhgrugesshgvmhhihhgrlhhfrdgtohhm
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 4/27/22 20:29, Leif Lindholm wrote:
> The sbsa-ref machine is continuously evolving. Some of the changes we
> want to make in the near future, to align with real components (e.g.
> the GIC-700), will break compatibility for existing firmware.
> 
> Introduce two new properties to the DT generated on machine generation:
> - machine-version-major
>    To be incremented when a platform change makes the machine
>    incompatible with existing firmware.
> - machine-version-minor
>    To be incremented when functionality is added to the machine
>    without causing incompatibility with existing firmware.
>    to be reset to 0 when machine-version-major is incremented.
> 
> These properties are both introduced with the value 0.
> (Hence, a machine where the DT is lacking these nodes is equivalent
> to version 0.0.)

This raises a lot of questions. I am talking with my PAPR specs
experience there, which might be off topic for SBSA, but it's a
way to clarify my understanding.


If we need to introduce incompatible changes in the sbsa machine,
that would break existing firmwares, I think we should start versioning
the sbsa machine like the other do : arm/i440fx/m68k/q35/s390x/spapr
and add class attributes describing features being activated or not.
This to make sure that firmware already shipped can always be run.

Regarding the DT changes, we could also expose/advertise the new
platform features by name with property nodes. A version is OK but
literal names are more explicit and we might want to de/activate
features one by one for test purposes or for some other reason.

Also, if some reconfiguration of the platform is needed to activate
a new feature, software (firmware or OS) needs a way (a trap or
something) to negotiate with the platform what should be done.
I might be anticipating a bit too much but pSeries has such needs
for the MMU and interrupt modes.

What about the SBSA specs ? Do they need a change ? It is true that
there are a bit vague regarding the DT, only referencing the Arm
Base Boot Requirements document which references the Device Tree
specs v0.3. I didn't find anything about versioning.

Thanks,

C.


> Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Radoslaw Biernacki <rad@semihalf.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/sbsa-ref.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 2387401963..e05f6056c7 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -190,6 +190,9 @@ static void create_fdt(SBSAMachineState *sms)
>       qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>       qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>   
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 0);
> +
>       if (ms->numa_state->have_numa_distance) {
>           int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
>           uint32_t *matrix = g_malloc0(size);


