Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473202C012D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 09:13:24 +0100 (CET)
Received: from localhost ([::1]:45410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh6yQ-0001eo-LZ
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 03:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kh6uu-0005zF-07; Mon, 23 Nov 2020 03:09:44 -0500
Received: from 5.mo51.mail-out.ovh.net ([188.165.49.213]:53525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kh6uq-0006uX-R2; Mon, 23 Nov 2020 03:09:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 46FE1237FCB;
 Mon, 23 Nov 2020 09:09:03 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 09:09:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0052fc40d9f-06ba-4c42-85bd-6e1644df460d,
 AF84A700016AED6247F1F5B9AC1D14952D0C96A6) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-6.0 1/8] spapr/xive: Turn some sanity checks into
 assertions
To: Greg Kurz <groug@kaod.org>, <qemu-devel@nongnu.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-2-groug@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1d0e378e-6213-e5b4-3ee8-991abaa25e8c@kaod.org>
Date: Mon, 23 Nov 2020 09:09:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120174646.619395-2-groug@kaod.org>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a8f8db9f-7429-427c-b092-624090e11e56
X-Ovh-Tracer-Id: 7934498121796717536
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeghedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefheenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeglefgjeevheeifeffudeuhedvveeftdeliedukeejgeeviefgieefhfdtffeftdenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo51.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 6:46 PM, Greg Kurz wrote:
> The sPAPR XIVE device is created by the machine in spapr_irq_init().
> The latter overrides any value provided by the user with -global for
> the "nr-irqs" and "nr-ends" properties with strictly positive values.
> 
> It seems reasonable to assume these properties should never be 0,
> which wouldn't make much sense by the way.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/intc/spapr_xive.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 1fa09f287ac0..60e0d5769dcc 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -296,22 +296,16 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
>      XiveENDSource *end_xsrc = &xive->end_source;
>      Error *local_err = NULL;
>  
> +    /* Set by spapr_irq_init() */
> +    g_assert(xive->nr_irqs);
> +    g_assert(xive->nr_ends);
> +
>      sxc->parent_realize(dev, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
>      }
>  
> -    if (!xive->nr_irqs) {
> -        error_setg(errp, "Number of interrupt needs to be greater 0");
> -        return;
> -    }
> -
> -    if (!xive->nr_ends) {
> -        error_setg(errp, "Number of interrupt needs to be greater 0");
> -        return;
> -    }
> -
>      /*
>       * Initialize the internal sources, for IPIs and virtual devices.
>       */
> 


