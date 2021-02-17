Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5428231D7CA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 12:02:58 +0100 (CET)
Received: from localhost ([::1]:54416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCKbh-0002UV-BV
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 06:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lCKZz-0001X5-Dg; Wed, 17 Feb 2021 06:01:11 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:35033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lCKZx-0000zz-98; Wed, 17 Feb 2021 06:01:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id C65EF8DB2EA8;
 Wed, 17 Feb 2021 12:01:05 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Feb
 2021 12:01:04 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005e084f078-e608-446e-92ef-aab0bf4605ce,
 B54157520C375C0FC3F4FA78C93877442EBE4A6F) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 91.175.254.3
Date: Wed, 17 Feb 2021 12:01:00 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 4/7] spapr: rename spapr_drc_detach() to
 spapr_drc_unplug_request()
Message-ID: <20210217120100.0e04e005@bahia>
In-Reply-To: <20210211225246.17315-5-danielhb413@gmail.com>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-5-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 269efaba-712b-4a94-9bd4-0d039a2ec9af
X-Ovh-Tracer-Id: 17830032402192374240
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrjedugddugeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 19:52:43 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> spapr_drc_detach() is not the best name for what the function does.
> The function does not detach the DRC, it makes an uncommited attempt
> to do it. It'll mark the DRC as pending unplug, via the 'unplug_request'
> flag, and only if the DRC state is drck->empty_state it will detach the
> DRC, via spapr_drc_release().
> 
> This is a contrast with its pair spapr_drc_attach(), where the function is
> indeed creating the DRC QOM object. If you know what spapr_drc_attach()
> does, you can be misled into thinking that spapr_drc_detach() is removing
> the DRC from QEMU internal state, which isn't true.
> 
> The current role of this function is better described as a request for
> detach, since there's no guarantee that we're going to detach the DRC in
> the end. Rename the function to spapr_drc_unplug_request to reflect what is is
> doing.
> 
> The initial idea was to change the name to spapr_drc_detach_request(), and
> later on change the unplug_request flag to detach_request. However,
> unplug_request is a migratable boolean for a long time now and renaming it
> is not worth the trouble. spapr_drc_unplug_request() setting drc->unplug_request
> is more natural than spapr_drc_detach_request setting drc->unplug_request.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c             | 6 +++---
>  hw/ppc/spapr_drc.c         | 4 ++--
>  hw/ppc/spapr_pci.c         | 2 +-
>  hw/ppc/trace-events        | 2 +-
>  include/hw/ppc/spapr_drc.h | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 85fe65f894..b066df68cb 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3654,7 +3654,7 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
>                                addr / SPAPR_MEMORY_BLOCK_SIZE);
>          g_assert(drc);
>  
> -        spapr_drc_detach(drc);
> +        spapr_drc_unplug_request(drc);
>          addr += SPAPR_MEMORY_BLOCK_SIZE;
>      }
>  
> @@ -3722,7 +3722,7 @@ void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
>      g_assert(drc);
>  
>      if (!spapr_drc_unplug_requested(drc)) {
> -        spapr_drc_detach(drc);
> +        spapr_drc_unplug_request(drc);
>          spapr_hotplug_req_remove_by_index(drc);
>      }
>  }
> @@ -3985,7 +3985,7 @@ static void spapr_phb_unplug_request(HotplugHandler *hotplug_dev,
>      assert(drc);
>  
>      if (!spapr_drc_unplug_requested(drc)) {
> -        spapr_drc_detach(drc);
> +        spapr_drc_unplug_request(drc);
>          spapr_hotplug_req_remove_by_index(drc);
>      }
>  }
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 555a25517d..67041fb212 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -386,11 +386,11 @@ void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
>                               NULL, 0);
>  }
>  
> -void spapr_drc_detach(SpaprDrc *drc)
> +void spapr_drc_unplug_request(SpaprDrc *drc)
>  {
>      SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
>  
> -    trace_spapr_drc_detach(spapr_drc_index(drc));
> +    trace_spapr_drc_unplug_request(spapr_drc_index(drc));
>  
>      g_assert(drc->dev);
>  
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 1791d98a49..9334ba5dbb 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1726,7 +1726,7 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
>              if (state == SPAPR_DR_ENTITY_SENSE_PRESENT) {
>                  /* Mark the DRC as requested unplug if needed. */
>                  if (!spapr_drc_unplug_requested(func_drc)) {
> -                    spapr_drc_detach(func_drc);
> +                    spapr_drc_unplug_request(func_drc);
>                  }
>                  spapr_hotplug_req_remove_by_index(func_drc);
>              }
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index 1e91984526..b4bbfbb013 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -50,7 +50,7 @@ spapr_drc_set_allocation_state(uint32_t index, int state) "drc: 0x%"PRIx32", sta
>  spapr_drc_set_allocation_state_finalizing(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_set_configured(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_attach(uint32_t index) "drc: 0x%"PRIx32
> -spapr_drc_detach(uint32_t index) "drc: 0x%"PRIx32
> +spapr_drc_unplug_request(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_awaiting_quiesce(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_reset(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_realize(uint32_t index) "drc: 0x%"PRIx32
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index 8982927d5c..02a63b3666 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -243,7 +243,7 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask);
>   * beforehand (eg. check drc->dev at pre-plug).
>   */
>  void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
> -void spapr_drc_detach(SpaprDrc *drc);
> +void spapr_drc_unplug_request(SpaprDrc *drc);
>  
>  /*
>   * Reset all DRCs, causing pending hot-plug/unplug requests to complete.


