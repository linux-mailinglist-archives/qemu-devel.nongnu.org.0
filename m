Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC4D2B4B4B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:35:40 +0100 (CET)
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehTf-0001Kv-BL
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kehPJ-0006To-SJ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:31:09 -0500
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:48212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kehPH-0006sV-FK
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:31:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 2A77C1FF1D2;
 Mon, 16 Nov 2020 17:31:03 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 16 Nov
 2020 17:31:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0061a9f6199-64b8-477b-8d22-09043fec57cc,
 4C8231DAC7BA0B5668AD0293EB9EBEB96F7691F2) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 1/2] hw/misc/tmp105: reset the T_low and T_High registers
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20201110150023.25533-1-peter.maydell@linaro.org>
 <20201110150023.25533-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b888c94a-eb24-36a6-ee76-a572cf6f71f9@kaod.org>
Date: Mon, 16 Nov 2020 17:31:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110150023.25533-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 57f98b56-6103-4b0f-83a2-5c261a26a2a9
X-Ovh-Tracer-Id: 12197718118993988573
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudefuddgleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeduvdetleefffevieejtedvjeejjeevhfegvddtleejffefvdfftdduteetleevnecuffhomhgrihhnpehtihdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo52.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 11:31:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 4:00 PM, Peter Maydell wrote:
> The TMP105 datasheet (https://www.ti.com/lit/gpn/tmp105) says that the
> power-up reset values for the T_low and T_high registers are 80 degrees C
> and 75 degrees C, which are 0x500 and 0x4B0 hex according to table 5.  These
> values are then shifted right by four bits to give the register reset
> values, since both registers store the 12 bits of temperature data in bits
> [15..4] of a 16 bit register.
> 
> We were resetting these registers to zero, which is problematic for Linux
> guests which enable the alert interrupt and then immediately take an
> unexpected overtemperature alert because the current temperature is above
> freezing...
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>



> ---
>  hw/misc/tmp105.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/misc/tmp105.c b/hw/misc/tmp105.c
> index b47120492a..0a4aad4854 100644
> --- a/hw/misc/tmp105.c
> +++ b/hw/misc/tmp105.c
> @@ -225,6 +225,9 @@ static void tmp105_reset(I2CSlave *i2c)
>      s->faults = tmp105_faultq[(s->config >> 3) & 3];
>      s->alarm = 0;
> 
> +    s->limit[0] = 0x4b00; /* T_LOW, 75 degrees C */
> +    s->limit[1] = 0x5000; /* T_HIGH, 80 degrees C */
> +
>      tmp105_interrupt_update(s);
>  }
> 


