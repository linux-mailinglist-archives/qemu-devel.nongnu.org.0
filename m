Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF3C65B2DD
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 14:46:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCL8l-00052V-MU; Mon, 02 Jan 2023 08:46:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL8V-0004x7-7d
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:45:59 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL8T-0007nA-A0
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:45:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.179])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F2CD915056AEF;
 Mon,  2 Jan 2023 14:45:50 +0100 (CET)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 14:45:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004971a7d3d-b5d8-4508-8e8c-4615a0151ee7,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7f99bb94-8b27-23fd-5cb6-5ea22ca194fc@kaod.org>
Date: Mon, 2 Jan 2023 14:45:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 10/11] hw/arm/aspeed_ast10x0: Add TODO comment to use
 Cortex-M4F
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-11-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221230113504.37032-11-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e0ff19db-0779-4fa2-9570-309c9c079c85
X-Ovh-Tracer-Id: 16144841715911854980
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdpthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdpsghlvggrlhesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdprghnughrvgifsegrjhdrihgurdgruhdptghhihhnqdhtihhnghgpkhhuohesrghsphgvvgguthgvtghhrd
 gtohhmpdhpvghtvghrsehpjhgurdguvghvpdhsthgvvhgvnhgplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdpphguvghlsehfsgdrtghomhdpphguvghlsehmvghtrgdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdptghrohhsrgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/30/22 12:35, Philippe Mathieu-Daudé wrote:
> This SoC uses a Cortex-M4F. QEMU only implements a M4,
> which is good enough. Add a TODO note in case the M4F
> is added.

How complex would it be to add the FPU version of the M4 ? I suppose we have
all the instructions already implemented ?
  
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/arm/aspeed_ast10x0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 7a7443a95b..a3bcbef24a 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -421,7 +421,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>       dc->realize = aspeed_soc_ast1030_realize;
>   
>       sc->name = "ast1030-a1";
> -    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
> +    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4"); /* TODO cortex-m4f */
>       sc->silicon_rev = AST1030_A1_SILICON_REV;
>       sc->sram_size = 768 * KiB;
>       sc->secsram_size = 9 * KiB;


