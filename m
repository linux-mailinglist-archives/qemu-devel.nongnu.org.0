Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E122C027A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:48:27 +0100 (CET)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh8SQ-000087-IH
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kh8Ql-0007oB-MH; Mon, 23 Nov 2020 04:46:43 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:35149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kh8Qj-000134-GD; Mon, 23 Nov 2020 04:46:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2AAC06E1F44C;
 Mon, 23 Nov 2020 10:46:39 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 10:46:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00402dfd846-df69-4dd8-9058-c2b2031b0105,
 AF84A700016AED6247F1F5B9AC1D14952D0C96A6) smtp.auth=clg@kaod.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH for-6.0 2/8] spapr/xive: Introduce spapr_xive_nr_ends()
To: Greg Kurz <groug@kaod.org>, <qemu-devel@nongnu.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-3-groug@kaod.org>
Message-ID: <9da660d2-1969-a548-5092-7f645a610e6d@kaod.org>
Date: Mon, 23 Nov 2020 10:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120174646.619395-3-groug@kaod.org>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 557fbe11-d265-42c2-a819-e8236ee241e2
X-Ovh-Tracer-Id: 9583378532918070240
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffuvfhfkffffgggjggtgfhisehtjeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleeuieejgfeileekiedtheefkeffueeggfeiheefuefgfedttddukedtgfeliefhnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
> We're going to kill the "nr_ends" field in a subsequent patch.

why ? it is one of the tables of the controller and its part of 
the main XIVE concepts. Conceptually, we could let the machine 
dimension it with an arbitrary value as OPAL does. The controller
would fail when the table is fully used. 

 
> Prepare ground by using an helper instead of peeking into
> the sPAPR XIVE structure directly.


I am not against the helper though but we should introduce a 
prio_shift value which would let us define the number of 
available priorities. To be linked with "hv-prio"

C.


> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/ppc/spapr_xive.h |  1 +
>  hw/intc/spapr_xive.c        | 23 ++++++++++++++---------
>  hw/intc/spapr_xive_kvm.c    |  4 ++--
>  3 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index 26c8d90d7196..4b967f13c030 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -75,6 +75,7 @@ void spapr_xive_map_mmio(SpaprXive *xive);
>  
>  int spapr_xive_end_to_target(uint8_t end_blk, uint32_t end_idx,
>                               uint32_t *out_server, uint8_t *out_prio);
> +uint32_t spapr_xive_nr_ends(const SpaprXive *xive);
>  
>  /*
>   * KVM XIVE device helpers
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 60e0d5769dcc..f473ad9cba47 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -192,7 +192,7 @@ void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon)
>              uint32_t end_idx = xive_get_field64(EAS_END_INDEX, eas->w);
>              XiveEND *end;
>  
> -            assert(end_idx < xive->nr_ends);
> +            assert(end_idx < spapr_xive_nr_ends(xive));
>              end = &xive->endt[end_idx];
>  
>              if (xive_end_is_valid(end)) {
> @@ -270,7 +270,7 @@ static void spapr_xive_reset(void *dev)
>      }
>  
>      /* Clear all ENDs */
> -    for (i = 0; i < xive->nr_ends; i++) {
> +    for (i = 0; i < spapr_xive_nr_ends(xive); i++) {
>          spapr_xive_end_reset(&xive->endt[i]);
>      }
>  }
> @@ -288,6 +288,11 @@ static void spapr_xive_instance_init(Object *obj)
>      xive->fd = -1;
>  }
>  
> +uint32_t spapr_xive_nr_ends(const SpaprXive *xive)
> +{
> +    return xive->nr_ends;
> +}
> +
>  static void spapr_xive_realize(DeviceState *dev, Error **errp)
>  {
>      SpaprXive *xive = SPAPR_XIVE(dev);
> @@ -336,7 +341,7 @@ static void spapr_xive_realize(DeviceState *dev, Error **errp)
>       * Allocate the routing tables
>       */
>      xive->eat = g_new0(XiveEAS, xive->nr_irqs);
> -    xive->endt = g_new0(XiveEND, xive->nr_ends);
> +    xive->endt = g_new0(XiveEND, spapr_xive_nr_ends(xive));
>  
>      xive->nodename = g_strdup_printf("interrupt-controller@%" PRIx64,
>                             xive->tm_base + XIVE_TM_USER_PAGE * (1 << TM_SHIFT));
> @@ -375,7 +380,7 @@ static int spapr_xive_get_end(XiveRouter *xrtr,
>  {
>      SpaprXive *xive = SPAPR_XIVE(xrtr);
>  
> -    if (end_idx >= xive->nr_ends) {
> +    if (end_idx >= spapr_xive_nr_ends(xive)) {
>          return -1;
>      }
>  
> @@ -389,7 +394,7 @@ static int spapr_xive_write_end(XiveRouter *xrtr, uint8_t end_blk,
>  {
>      SpaprXive *xive = SPAPR_XIVE(xrtr);
>  
> -    if (end_idx >= xive->nr_ends) {
> +    if (end_idx >= spapr_xive_nr_ends(xive)) {
>          return -1;
>      }
>  
> @@ -1138,7 +1143,7 @@ static target_ulong h_int_get_source_config(PowerPCCPU *cpu,
>      /* EAS_END_BLOCK is unused on sPAPR */
>      end_idx = xive_get_field64(EAS_END_INDEX, eas.w);
>  
> -    assert(end_idx < xive->nr_ends);
> +    assert(end_idx < spapr_xive_nr_ends(xive));
>      end = &xive->endt[end_idx];
>  
>      nvt_blk = xive_get_field32(END_W6_NVT_BLOCK, end->w6);
> @@ -1216,7 +1221,7 @@ static target_ulong h_int_get_queue_info(PowerPCCPU *cpu,
>          return H_P2;
>      }
>  
> -    assert(end_idx < xive->nr_ends);
> +    assert(end_idx < spapr_xive_nr_ends(xive));
>      end = &xive->endt[end_idx];
>  
>      args[0] = xive->end_base + (1ull << (end_xsrc->esb_shift + 1)) * end_idx;
> @@ -1304,7 +1309,7 @@ static target_ulong h_int_set_queue_config(PowerPCCPU *cpu,
>          return H_P2;
>      }
>  
> -    assert(end_idx < xive->nr_ends);
> +    assert(end_idx < spapr_xive_nr_ends(xive));
>      memcpy(&end, &xive->endt[end_idx], sizeof(XiveEND));
>  
>      switch (qsize) {
> @@ -1470,7 +1475,7 @@ static target_ulong h_int_get_queue_config(PowerPCCPU *cpu,
>          return H_P2;
>      }
>  
> -    assert(end_idx < xive->nr_ends);
> +    assert(end_idx < spapr_xive_nr_ends(xive));
>      end = &xive->endt[end_idx];
>  
>      args[0] = 0;
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 66bf4c06fe55..1566016f0e28 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -531,7 +531,7 @@ static int kvmppc_xive_get_queues(SpaprXive *xive, Error **errp)
>      int i;
>      int ret;
>  
> -    for (i = 0; i < xive->nr_ends; i++) {
> +    for (i = 0; i < spapr_xive_nr_ends(xive); i++) {
>          if (!xive_end_is_valid(&xive->endt[i])) {
>              continue;
>          }
> @@ -701,7 +701,7 @@ int kvmppc_xive_post_load(SpaprXive *xive, int version_id)
>      assert(xive->fd != -1);
>  
>      /* Restore the ENDT first. The targetting depends on it. */
> -    for (i = 0; i < xive->nr_ends; i++) {
> +    for (i = 0; i < spapr_xive_nr_ends(xive); i++) {
>          if (!xive_end_is_valid(&xive->endt[i])) {
>              continue;
>          }
> 


