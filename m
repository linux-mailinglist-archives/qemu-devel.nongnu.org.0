Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DC6417090
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:04:28 +0200 (CEST)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTj0F-0003OV-Db
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTiyN-00016Y-Az
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:02:31 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:40783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTiyL-00023o-C6
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:02:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A9C87BFDECD8;
 Fri, 24 Sep 2021 13:02:25 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 24 Sep
 2021 13:02:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004242f04e4-aeea-41e4-86d8-e22cccb8d8a4,
 EA4874C54EC1FB151381C7D8681494D1EB26EF60) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9ff00382-ff1a-e74e-3bd8-d37a4d051a43@kaod.org>
Date: Fri, 24 Sep 2021 13:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 4/5] MAINTAINERS: Add information for OpenPIC
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
 <20210924095536.441849-5-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210924095536.441849-5-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0c15df02-00d7-43f2-9bd8-63f782cfc585
X-Ovh-Tracer-Id: 12700432425719270322
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, hpussin@reactos.org,
 aik@ozlabs.ru, mark.cave-ayland@ilande.co.uk, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 11:55, David Gibson wrote:
> The OpenPIC interrupt controller was once the de facto standard on ppc
> machines.  In qemu it's now only used on some Macintosh and the
> Freescale e500 machine.  It has no listed maintainer, and as far as I
> know, no-one who's really familiar with it any more.
> 
> Since I'm moving away from the area, I no longer have capacity to do even
> minimal maintenance of it under the auspices of the ppc targets in general.
> 
> Therefore, this patch lists the main part of openpic, and marks it as
> "Odd Fixes" to be looked after by Mark Cave-Ayland who handles the
> Macintosh targets.  The openpic_kvm variant is only used on e500, so
> add it to the files for that machine type (itself already Orphaned).
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c82a634a70..937c191c8d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1256,6 +1256,8 @@ F: hw/pci-host/ppce500.c
>   F: include/hw/ppc/ppc_e500.h
>   F: include/hw/pci-host/ppce500.h
>   F: pc-bios/u-boot.e500
> +F: hw/intc/openpic_kvm.h
> +F: include/hw/ppc/openpic_kvm.h
>   
>   mpc8544ds
>   L: qemu-ppc@nongnu.org
> @@ -2255,6 +2257,12 @@ F: net/can/*
>   F: hw/net/can/*
>   F: include/net/can_*.h
>   
> +OpenPIC interrupt controller
> +M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> +S: Odd Fixes
> +F: hw/intc/openpic.c
> +F: include/hw/ppc/openpic.h
> +
>   Subsystems
>   ----------
>   Overall Audio backends
> 


