Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE1C2C0316
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 11:18:36 +0100 (CET)
Received: from localhost ([::1]:44166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh8vb-0006ge-Ql
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 05:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kh8st-0005Tv-6P; Mon, 23 Nov 2020 05:15:47 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:37947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kh8sr-0003co-Gr; Mon, 23 Nov 2020 05:15:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.193])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 94FD06E21B0B;
 Mon, 23 Nov 2020 11:15:42 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 11:15:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0045b4e2d9c-3441-423b-afdf-f012948dd2e5,
 AF84A700016AED6247F1F5B9AC1D14952D0C96A6) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-6.0 5/8] spapr/xics: Drop unused argument to
 xics_kvm_has_broken_disconnect()
To: Greg Kurz <groug@kaod.org>, <qemu-devel@nongnu.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-6-groug@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8d40357a-1518-1b7a-5670-fb28ec7368e9@kaod.org>
Date: Mon, 23 Nov 2020 11:15:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120174646.619395-6-groug@kaod.org>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 287f9243-d04a-47e5-a020-622f323a3d04
X-Ovh-Tracer-Id: 10073989420131453920
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeelgfejveehieefffduueehvdevfedtleeiudekjeegveeigfeifefhtdfffedtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
> Never used from the start.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>



> ---
>  include/hw/ppc/xics_spapr.h | 2 +-
>  hw/intc/xics_kvm.c          | 2 +-
>  hw/ppc/spapr_irq.c          | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
> index 0b8182e40b33..de752c0d2c7e 100644
> --- a/include/hw/ppc/xics_spapr.h
> +++ b/include/hw/ppc/xics_spapr.h
> @@ -38,6 +38,6 @@ DECLARE_INSTANCE_CHECKER(ICSState, ICS_SPAPR,
>  int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
>                       Error **errp);
>  void xics_kvm_disconnect(SpaprInterruptController *intc);
> -bool xics_kvm_has_broken_disconnect(SpaprMachineState *spapr);
> +bool xics_kvm_has_broken_disconnect(void);
>  
>  #endif /* XICS_SPAPR_H */
> diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
> index 68bb1914b9bb..570d635bcc08 100644
> --- a/hw/intc/xics_kvm.c
> +++ b/hw/intc/xics_kvm.c
> @@ -484,7 +484,7 @@ void xics_kvm_disconnect(SpaprInterruptController *intc)
>   * support destruction of a KVM XICS device while the VM is running.
>   * Required to start a spapr machine with ic-mode=dual,kernel-irqchip=on.
>   */
> -bool xics_kvm_has_broken_disconnect(SpaprMachineState *spapr)
> +bool xics_kvm_has_broken_disconnect(void)
>  {
>      int rc;
>  
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index a0fc474ecb06..2dacbecfd5fd 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -186,7 +186,7 @@ static int spapr_irq_check(SpaprMachineState *spapr, Error **errp)
>      if (kvm_enabled() &&
>          spapr->irq == &spapr_irq_dual &&
>          kvm_kernel_irqchip_required() &&
> -        xics_kvm_has_broken_disconnect(spapr)) {
> +        xics_kvm_has_broken_disconnect()) {
>          error_setg(errp,
>              "KVM is incompatible with ic-mode=dual,kernel-irqchip=on");
>          error_append_hint(errp,
> 


