Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D558A327CC9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:05:33 +0100 (CET)
Received: from localhost ([::1]:53464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgMm-0004EV-Te
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lGgM3-0003jd-2j
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:04:47 -0500
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:45711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lGgM0-0002nX-W3
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:04:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.27])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 4C17524653D;
 Mon,  1 Mar 2021 12:04:42 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 12:04:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0059775fed1-31ca-467b-89d7-95dc5d11684d,
 79E354DF6B7F793720F6EA4F82BCB5A412373A8E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 04/21] sd: emmc: update OCR fields for eMMC
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Markus Armbruster
 <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>, Vincent
 Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Alistair
 Francis <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, Paolo
 Bonzini <pbonzini@redhat.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1614540807-30686-5-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <29253e47-cd42-5346-6855-80664fa62831@kaod.org>
Date: Mon, 1 Mar 2021 12:04:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1614540807-30686-5-git-send-email-sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 988670f0-5f1e-49e8-abbf-5bbd603ce974
X-Ovh-Tracer-Id: 14576463145750661901
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepshgrihdrphgrvhgrnhdrsghougguuhesgihilhhinhigrdgtohhm
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 8:33 PM, Sai Pavan Boddu wrote:
> From: Vincent Palatin <vpalatin@chromium.org>
> 
> eMMC OCR register doesn't has UHS-II field and voltage fields are
> different.
> 
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/sd/sd.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 6de414b..bc9d913 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -287,6 +287,15 @@ FIELD(OCR, UHS_II_CARD,                29,  1) /* Only UHS-II */
>  FIELD(OCR, CARD_CAPACITY,              30,  1) /* 0:SDSC, 1:SDHC/SDXC */
>  FIELD(OCR, CARD_POWER_UP,              31,  1)
>  
> +/*
> + * eMMC OCR register
> + */
> +FIELD(EMMC_OCR, VDD_WINDOW_0,  7, 1)
> +FIELD(EMMC_OCR, VDD_WINDOW_1,  8, 7)
> +FIELD(EMMC_OCR, VDD_WINDOW_2, 15, 9)
> +FIELD(EMMC_OCR, ACCESS_MODE,  29, 2)
> +FIELD(EMMC_OCR, POWER_UP,     31, 1)
> +
>  #define ACMD41_ENQUIRY_MASK     0x00ffffff
>  #define ACMD41_R3_MASK          (R_OCR_VDD_VOLTAGE_WIN_HI_MASK \
>                                 | R_OCR_ACCEPT_SWITCH_1V8_MASK \
> @@ -296,8 +305,16 @@ FIELD(OCR, CARD_POWER_UP,              31,  1)
>  
>  static void sd_set_ocr(SDState *sd)
>  {
> -    /* All voltages OK */
> -    sd->ocr = R_OCR_VDD_VOLTAGE_WIN_HI_MASK;
> +    if (sd->emmc) {
> +        /*
> +         * Dual Voltage eMMC card
> +         */
> +        sd->ocr = R_EMMC_OCR_VDD_WINDOW_0_MASK |
> +                  R_EMMC_OCR_VDD_WINDOW_2_MASK;
> +    } else {
> +        /* All voltages OK */
> +        sd->ocr = R_OCR_VDD_VOLTAGE_WIN_HI_MASK;

'ocr' is a constant that could be in SDCardClass 

> +    }
>  }
>  
>  static void sd_ocr_powerup(void *opaque)
> @@ -525,7 +542,11 @@ static void sd_response_r1_make(SDState *sd, uint8_t *response)
>  
>  static void sd_response_r3_make(SDState *sd, uint8_t *response)
>  {
> -    stl_be_p(response, sd->ocr & ACMD41_R3_MASK);
> +    if (sd->emmc) {
> +        stl_be_p(response, sd->ocr);
> +    } else {
> +        stl_be_p(response, sd->ocr & ACMD41_R3_MASK);
> +    }
>  }
>  
>  static void sd_response_r6_make(SDState *sd, uint8_t *response)
> 


