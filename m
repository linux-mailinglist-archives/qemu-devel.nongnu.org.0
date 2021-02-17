Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C031D7C5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 12:00:12 +0100 (CET)
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCKZ1-0000qu-FV
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 06:00:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lCKXH-0000G8-LX
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:58:24 -0500
Received: from 3.mo52.mail-out.ovh.net ([178.33.254.192]:40706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lCKXF-00005z-1X
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:58:23 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.72])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 57F1324234C;
 Wed, 17 Feb 2021 11:58:14 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Feb
 2021 11:58:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005383cd9ea-d368-450e-abf0-2b81501fd182,
 B54157520C375C0FC3F4FA78C93877442EBE4A6F) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 91.175.254.3
Date: Wed, 17 Feb 2021 11:58:11 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 3/7] spapr_drc.c: use spapr_drc_release() in
 isolate_physical/set_unusable
Message-ID: <20210217115811.3f5a6ea2@bahia>
In-Reply-To: <20210211225246.17315-4-danielhb413@gmail.com>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-4-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 12a7d465-6ee8-4139-aaaf-6328f239c8d1
X-Ovh-Tracer-Id: 17781900182613498336
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrjedugddugeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=groug@kaod.org;
 helo=3.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 19:52:42 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> When moving a physical DRC to "Available", drc_isolate_physical() will
> move the DRC state to STATE_PHYSICAL_POWERON and, if the DRC is marked
> for unplug, call spapr_drc_detach(). For physical DRCs, drck->empty_state
> is STATE_PHYSICAL_POWERON, meaning that we're sure that spapr_drc_detach()
> will end up calling spapr_drc_release() in the end.
> 
> Likewise, for logical DRCs, drc_set_unusable will move the DRC to "Unusable"
> state, setting drc->state to STATE_LOGICAL_UNUSABLE, which is the
> drck->empty_state for logical DRCs. spapr_drc_detach() will call
> spapr_drc_release() in this case as well.
> 
> In both scenarios, spapr_drc_detach() is being used as a spapr_drc_release(),
> wrapper, where we also set unplug_requested (which is already true, otherwise
> spapr_drc_detach() wouldn't be called in the first place) and check if
> drc->state == drck->empty_state, which we also know it's guaranteed to
> be true because we just set it.
> 
> Just use spapr_drc_release() in these functions to be clear of our intentions
> in both these functions.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_drc.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 84bd3c881f..555a25517d 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -50,6 +50,20 @@ uint32_t spapr_drc_index(SpaprDrc *drc)
>          | (drc->id & DRC_INDEX_ID_MASK);
>  }
>  
> +static void spapr_drc_release(SpaprDrc *drc)
> +{
> +    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> +
> +    drck->release(drc->dev);
> +
> +    drc->unplug_requested = false;
> +    g_free(drc->fdt);
> +    drc->fdt = NULL;
> +    drc->fdt_start_offset = 0;
> +    object_property_del(OBJECT(drc), "device");
> +    drc->dev = NULL;
> +}
> +
>  static uint32_t drc_isolate_physical(SpaprDrc *drc)
>  {
>      switch (drc->state) {
> @@ -68,7 +82,7 @@ static uint32_t drc_isolate_physical(SpaprDrc *drc)
>      if (drc->unplug_requested) {
>          uint32_t drc_index = spapr_drc_index(drc);
>          trace_spapr_drc_set_isolation_state_finalizing(drc_index);
> -        spapr_drc_detach(drc);
> +        spapr_drc_release(drc);
>      }
>  
>      return RTAS_OUT_SUCCESS;
> @@ -209,7 +223,7 @@ static uint32_t drc_set_unusable(SpaprDrc *drc)
>      if (drc->unplug_requested) {
>          uint32_t drc_index = spapr_drc_index(drc);
>          trace_spapr_drc_set_allocation_state_finalizing(drc_index);
> -        spapr_drc_detach(drc);
> +        spapr_drc_release(drc);
>      }
>  
>      return RTAS_OUT_SUCCESS;
> @@ -372,20 +386,6 @@ void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
>                               NULL, 0);
>  }
>  
> -static void spapr_drc_release(SpaprDrc *drc)
> -{
> -    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> -
> -    drck->release(drc->dev);
> -
> -    drc->unplug_requested = false;
> -    g_free(drc->fdt);
> -    drc->fdt = NULL;
> -    drc->fdt_start_offset = 0;
> -    object_property_del(OBJECT(drc), "device");
> -    drc->dev = NULL;
> -}
> -
>  void spapr_drc_detach(SpaprDrc *drc)
>  {
>      SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);


