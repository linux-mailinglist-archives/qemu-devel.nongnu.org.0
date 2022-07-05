Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9EF567378
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:52:32 +0200 (CEST)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kql-000480-HD
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8knF-0005zT-1h
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:48:53 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:56511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8knA-00018U-Gp
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:48:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 257BC1149BF11;
 Tue,  5 Jul 2022 17:48:45 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 5 Jul 2022
 17:48:44 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004a8c5c92e-f548-4c26-bd07-8ced9822f92c,
 4FF77D4A254985FC0BE9A952312E42D6E34C6CC4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <31f9fa84-fa64-e08f-9dc9-68a11cc4c0c9@kaod.org>
Date: Tue, 5 Jul 2022 17:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc/cpu-models: Remove the "default" CPU alias
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 <qemu-ppc@nongnu.org>
References: <20220705151030.662140-1-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220705151030.662140-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c5a9cac0-dee8-4970-b26b-0c770c8e9373
X-Ovh-Tracer-Id: 6727533422088391462
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/5/22 17:10, Thomas Huth wrote:
> QEMU emulates a *lot* of PowerPC-based machines - having a CPU
> that is named "default" and cannot be used with most of those
> machines sounds just wrong. Thus let's remove this old and confusing
> alias now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/ppc/cpu-models.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index 976be5e0d1..2667440f73 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -918,6 +918,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>   #endif
>       { "ppc32", "604" },
>       { "ppc", "604" },
> -    { "default", "604" },
> +
>       { NULL, NULL }
>   };

A default CPU introduced in 1994. Time to change !

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

