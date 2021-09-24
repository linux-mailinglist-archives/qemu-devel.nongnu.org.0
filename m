Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF2417095
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:04:45 +0200 (CEST)
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTj0W-0003Yn-2k
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTixb-0000qn-Mc
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:01:43 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:53491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTixY-0001Nu-OO
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:01:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5A25423344;
 Fri, 24 Sep 2021 11:01:35 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 24 Sep
 2021 13:01:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00577b9a9a7-4e95-456d-b744-54815db1a330,
 EA4874C54EC1FB151381C7D8681494D1EB26EF60) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d6ab4a24-7c99-61e1-efc2-ea30e0261ef7@kaod.org>
Date: Fri, 24 Sep 2021 13:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/5] MAINTAINERS: Orphan obscure ppc platforms
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
 <20210924095536.441849-2-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210924095536.441849-2-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1f6540d0-1465-475a-a54f-ebe33d001393
X-Ovh-Tracer-Id: 12686358677276298162
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> There are a nunber of old embedded ppc machine types which have been little
> changed and in "Odd Fixes" state for a long time.  With both myself and
> Greg Kurz moving toward other areas, we no longer have the capacity to
> keep reviewing and maintaining even the rare patches that come in for those
> platforms.
> 
> Therefore, remove our names as reviewers and mark these platforms as
> orphaned.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Greg Kurz <groug@kaod.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>   MAINTAINERS | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d7915ec128..3408618f2a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1236,24 +1236,18 @@ F: hw/openrisc/openrisc_sim.c
>   PowerPC Machines
>   ----------------
>   405
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> -S: Odd Fixes
> +S: Orphan
>   F: hw/ppc/ppc405_boards.c
>   
>   Bamboo
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> -S: Odd Fixes
> +S: Orphan
>   F: hw/ppc/ppc440_bamboo.c
>   
>   e500
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> -S: Odd Fixes
> +S: Orphan
>   F: hw/ppc/e500*
>   F: hw/gpio/mpc8xxx.c
>   F: hw/i2c/mpc_i2c.c
> @@ -1264,10 +1258,8 @@ F: include/hw/pci-host/ppce500.h
>   F: pc-bios/u-boot.e500
>   
>   mpc8544ds
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> -S: Odd Fixes
> +S: Orphan
>   F: hw/ppc/mpc8544ds.c
>   F: hw/ppc/mpc8544_guts.c
>   
> @@ -1783,9 +1775,8 @@ F: include/hw/acpi/ghes.h
>   F: docs/specs/acpi_hest_ghes.rst
>   
>   ppc4xx
> -M: David Gibson <david@gibson.dropbear.id.au>
>   L: qemu-ppc@nongnu.org
> -S: Odd Fixes
> +S: Orphan
>   F: hw/ppc/ppc4*.c
>   F: hw/i2c/ppc4xx_i2c.c
>   F: include/hw/ppc/ppc4xx.h
> 


