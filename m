Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B19FF89F9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 08:53:52 +0100 (CET)
Received: from localhost ([::1]:59906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUQzn-00047p-4u
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 02:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iUQyP-0003Ov-VQ
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 02:52:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iUQyM-0001F6-OU
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 02:52:24 -0500
Received: from 9.mo7.mail-out.ovh.net ([46.105.60.248]:58736)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iUQyM-000193-JB
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 02:52:22 -0500
Received: from player762.ha.ovh.net (unknown [10.109.160.230])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id F0E7313DDFB
 for <qemu-devel@nongnu.org>; Tue, 12 Nov 2019 08:52:18 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id 4A60DBFD8BB1;
 Tue, 12 Nov 2019 07:52:13 +0000 (UTC)
Subject: Re: [PATCH 3/4] watchdog/aspeed: Improve watchdog timeout message
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20191112064058.13275-1-joel@jms.id.au>
 <20191112064058.13275-4-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <036a1f38-6258-fad0-bc45-0e3cfe0a93b7@kaod.org>
Date: Tue, 12 Nov 2019 08:52:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191112064058.13275-4-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7255861952999820096
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvkedgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.60.248
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/2019 07:40, Joel Stanley wrote:
> Users benefit from knowing which watchdog timer has expired. The addres=
s
> of the watchdog's registers unambiguously indicates which has expired,
> so log that.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>


The format below should be using HWADDR_PRIx. No need to resend.=20
I will fix it.=20

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

C.=20

> ---
>  hw/watchdog/wdt_aspeed.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 145be6f99ce2..5697ed83325a 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -219,7 +219,8 @@ static void aspeed_wdt_timer_expired(void *dev)
>          return;
>      }
> =20
> -    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
> +    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer %08lx expired.\n",
> +            s->iomem.addr);
>      watchdog_perform_action();
>      timer_del(s->timer);
>  }
>=20


