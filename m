Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C58567E23
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 08:02:07 +0200 (CEST)
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8y6w-000315-70
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 02:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8y45-0001v3-Kg
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 01:59:09 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:36983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8y3m-0001gj-1K
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 01:59:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.162])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0506B234A8;
 Wed,  6 Jul 2022 05:58:45 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 6 Jul 2022
 07:58:45 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002da33ccb0-7408-4333-aa06-7135485256bd,
 6D332DB375924522570C93BFC406BEE3A96BD498) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6dc63502-11ae-633a-a9a0-90f0fe32e808@kaod.org>
Date: Wed, 6 Jul 2022 07:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 9/9] docs: aspeed: Add fby35 multi-SoC machine section
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220705191400.41632-1-peter@pjd.dev>
 <20220705191400.41632-10-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220705191400.41632-10-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b1747a8c-8f45-4bbe-a6ea-5a4b87794e66
X-Ovh-Tracer-Id: 2636013157695392550
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeivddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvleetheeivddtveduleekhedvhfdvffeiuefgudffjefhuedttdfgleeugeelgfenucffohhmrghinhepohhpvghntghomhhpuhhtvgdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/5/22 21:14, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

I fixed inline the URL links and moved the section at the end of the file.

Thanks,

C.


> ---
>   docs/system/arm/aspeed.rst | 48 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 5d0a7865d3..b233191b67 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -136,6 +136,54 @@ AST1030 SoC based machines :
>   
>   - ``ast1030-evb``          Aspeed AST1030 Evaluation board (Cortex-M4F)
>   
> +Facebook Yosemite v3.5 Platform and CraterLake Server (``fby35``)
> +==================================================================
> +
> +Facebook has a series of multi-node compute server designs named
> +Yosemite. The most recent version released was
> +`Yosemite v3 <https://www.opencompute.org/documents/ocp-yosemite-v3-platform-design-specification-1v16-pdf>`.
> +
> +Yosemite v3.5 is an iteration on this design, and is very similar: there's a
> +baseboard with a BMC, and 4 server slots. The new server board design termed
> +"CraterLake" includes a Bridge IC (BIC), with room for expansion boards to
> +include various compute accelerators (video, inferencing, etc). At the moment,
> +only the first server slot's BIC is included.
> +
> +Yosemite v3.5 is itself a sled which fits into a 40U chassis, and 3 sleds
> +can be fit into a chassis. See `here <https://www.opencompute.org/products/423/wiwynn-yosemite-v3-server>`
> +for an example.
> +
> +In this generation, the BMC is an AST2600 and each BIC is an AST1030. The BMC
> +runs `OpenBMC <https://github.com/facebook/openbmc>`, and the BIC runs
> +`OpenBIC <https://github.com/facebook/openbic>`.
> +
> +Firmware images can be retrieved from the Github releases or built from the
> +source code, see the README's for instructions on that. This image uses the
> +"fby35" machine recipe from OpenBMC, and the "yv35-cl" target from OpenBIC.
> +Some reference images can also be found here:
> +
> +.. code-block:: bash
> +
> +    $ wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
> +    $ wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
> +
> +Since this machine has multiple SoC's, each with their own serial console, the
> +recommended way to run it is to allocate a pseudoterminal for each serial
> +console and let the monitor use stdio. Also, starting in a paused state is
> +useful because it allows you to attach to the pseudoterminals before the boot
> +process starts.
> +
> +.. code-block:: bash
> +
> +    $ qemu-system-arm -machine fby35 \
> +        -drive file=fby35.mtd,format=raw,if=mtd \
> +        -device loader,file=Y35BCL.elf,addr=0,cpu-num=2 \
> +        -serial pty -serial pty -serial mon:stdio \
> +        -display none -S
> +    $ screen /dev/tty0 # In a separate TMUX pane, terminal window, etc.
> +    $ screen /dev/tty1
> +    $ (qemu) c		   # Start the boot process once screen is setup.
> +
>   Supported devices
>   -----------------
>   


