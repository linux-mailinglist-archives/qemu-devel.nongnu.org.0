Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECCB41708F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:04:08 +0200 (CEST)
Received: from localhost ([::1]:39898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTizv-0002em-9o
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTix1-00008U-2q
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:01:07 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:37375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTiwz-0000wx-38
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:01:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 11319BFDEBC0;
 Fri, 24 Sep 2021 13:01:03 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 24 Sep
 2021 13:01:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0014a241446-cecf-4d2e-aa36-5ba56388b607,
 EA4874C54EC1FB151381C7D8681494D1EB26EF60) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dc35be13-7554-d5a5-ce8b-9211da13017a@kaod.org>
Date: Fri, 24 Sep 2021 13:01:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 3/5] MAINTAINERS: Remove David & Greg as
 reviewers/co-maintainers of powernv
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
 <20210924095536.441849-4-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210924095536.441849-4-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8390f1fa-426b-4fa9-8d42-1721047e1edf
X-Ovh-Tracer-Id: 12677070003329862578
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevledvjeetgeetfeeiveeftefffedvvdeikeetveelfeeglefgueetvdefvdefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, hpussin@reactos.org,
 aik@ozlabs.ru, mark.cave-ayland@ilande.co.uk, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 11:55, David Gibson wrote:
> With our interests moving to other areas, Greg and myself no longer have
> capacity to be regular reviewers of code for the powernv machine type, let
> alone co-maintainers.  Additionally, not being IBM employees, we don't have
> easy access to the hardware information we'd need for good review.
> 
> Therefore, remove our names as reviewers and/or co-maintainers of the
> powernv machine type, and the related XIVE interrupt controller.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Greg Kurz <groug@kaod.org>

Acked-by: Cédric Le Goater <clg@kaod.org>

> ---
>   MAINTAINERS | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 20436be86f..c82a634a70 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1329,8 +1329,6 @@ F: tests/qtest/libqos/rtas*
>   
>   PowerNV (Non-Virtualized)
>   M: Cédric Le Goater <clg@kaod.org>
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
>   F: hw/ppc/pnv*
> @@ -2222,8 +2220,6 @@ T: git https://github.com/philmd/qemu.git fw_cfg-next
>   
>   XIVE
>   M: Cédric Le Goater <clg@kaod.org>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Supported
>   F: hw/*/*xive*
> 


