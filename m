Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25877538C7E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:05:00 +0200 (CEST)
Received: from localhost ([::1]:39184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvws7-0003JB-94
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvwon-0001Bx-8C
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:01:33 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:57247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvwol-0002vQ-0Y
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:01:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 83B51105BCA13;
 Tue, 31 May 2022 10:01:26 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 31 May
 2022 10:01:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003b7035c53-0da3-4f8f-8e15-54b66267723d,
 3316B4EBA022AA703420095FA15BAC10F99B744A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2b13de23-5a03-2dfc-20c7-2db4ad93429f@kaod.org>
Date: Tue, 31 May 2022 10:01:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 03/25] hw/sd: When card is in wrong state, log which
 spec version is used
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, <qemu-devel@nongnu.org>
CC: Bin Meng <bin.meng@windriver.com>, <qemu-block@nongnu.org>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
 <20220530193816.45841-4-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220530193816.45841-4-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cf2de227-959e-4877-ac9c-aaa2bc0d8a47
X-Ovh-Tracer-Id: 14651898439367363433
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeejgdduvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehsrghirdhprghvrghnrdgsohguughuseigihhlihhngidrtghomh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/22 21:37, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Add the sd_version_str() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>   hw/sd/sd.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index b0e7a7e6d0..b3e61b9f84 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -145,6 +145,19 @@ struct SDState {
>   
>   static void sd_realize(DeviceState *dev, Error **errp);
>   
> +static const char *sd_version_str(enum SDPhySpecificationVersion version)
> +{
> +    static const char *sdphy_version[] = {
> +        [SD_PHY_SPECv1_10_VERS]     = "v1.10",
> +        [SD_PHY_SPECv2_00_VERS]     = "v2.00",
> +        [SD_PHY_SPECv3_01_VERS]     = "v3.01",
> +    };
> +    if (version >= ARRAY_SIZE(sdphy_version)) {
> +        return "unsupported version";
> +    }
> +    return sdphy_version[version];
> +}
> +
>   static const char *sd_state_name(enum SDCardStates state)
>   {
>       static const char *state_name[] = {
> @@ -968,8 +981,9 @@ static bool address_in_range(SDState *sd, const char *desc,
>   
>   static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
>   {
> -    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
> -                  req.cmd, sd_state_name(sd->state));
> +    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s (spec %s)\n",
> +                  req.cmd, sd_state_name(sd->state),
> +                  sd_version_str(sd->spec_version));
>   
>       return sd_illegal;
>   }


