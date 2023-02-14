Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A792A6966E0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:30:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwJT-0003E5-4y; Tue, 14 Feb 2023 09:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pRwJR-0003DD-Ea
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:29:41 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pRwJP-0003h4-Ge
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:29:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 531052AF17;
 Tue, 14 Feb 2023 14:29:35 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 14 Feb
 2023 15:29:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002be72a856-21a8-410c-a82d-76dea616d1e9,
 D27BB99F68B8EC7888E3647E3ED2C6CF660736DE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a41eaf83-ea64-faad-c001-d53df83452ba@kaod.org>
Date: Tue, 14 Feb 2023 15:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH qemu 1/2] hw/at24c : modify at24c to support 1 byte
 address mode
Content-Language: en-US
To: ~ssinprem <ssinprem@celestica.com>, <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, <srikanth@celestica.com>,
 <kgengan@celestica.com>, Peter Delevoryas <peter@pjd.dev>
References: <167636845806.2107.2382940753543768501-1@git.sr.ht>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <167636845806.2107.2382940753543768501-1@git.sr.ht>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 6e57239d-2472-466c-908e-993f6f204c5b
X-Ovh-Tracer-Id: 11154853330695981862
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeifedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuuddtteelgeejhfeikeegffekhfelvefgfeejveffjeeiveegfeehgfdtgfeitdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshhsihhnphhrvghmsegtvghlvghsthhitggrrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqshhtrggslhgvsehnohhnghhnuhdrohhrghdpshhrihhkrghnthhhsegtvghlvghsthhitggrrdgtohhmpdhkghgvnhhgrghnsegtvghlvghsthhitggrrdgtohhmpdhpvghtvghrsehpjhgurdguvghvpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/10/23 07:20, ~ssinprem wrote:
> From: Sittisak Sinprem <ssinprem@celestca.com>



You will need to add a Signed-off-by tag

Thanks,

C.

> ---
>   hw/nvram/eeprom_at24c.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 2d4d8b952f..693212b661 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -87,7 +87,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
>       EEPROMState *ee = AT24C_EE(s);
>       uint8_t ret;
>   
> -    if (ee->haveaddr == 1) {
> +    if (ee->rsize > 256 && ee->haveaddr == 1) {
>           return 0xff;
>       }
>   
> @@ -104,11 +104,13 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
>   {
>       EEPROMState *ee = AT24C_EE(s);
>   
> -    if (ee->haveaddr < 2) {
> +    if ((ee->rsize > 256 && ee->haveaddr < 2) ||
> +        (ee->rsize <= 256 && ee->haveaddr < 1)) {
>           ee->cur <<= 8;
>           ee->cur |= data;
>           ee->haveaddr++;
> -        if (ee->haveaddr == 2) {
> +        if ((ee->rsize > 256 && ee->haveaddr == 2) ||
> +            (ee->rsize <= 256 && ee->haveaddr == 1)) {
>               ee->cur %= ee->rsize;
>               DPRINTK("Set pointer %04x\n", ee->cur);
>           }


