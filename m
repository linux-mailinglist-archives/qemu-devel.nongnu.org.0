Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD7205007
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 13:08:17 +0200 (CEST)
Received: from localhost ([::1]:41668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jngmm-0006Mm-6K
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 07:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jngla-0005Gh-M4; Tue, 23 Jun 2020 07:07:02 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:57018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jnglY-0007rN-2A; Tue, 23 Jun 2020 07:07:02 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D785E748DCC;
 Tue, 23 Jun 2020 13:06:56 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B56E17482D3; Tue, 23 Jun 2020 13:06:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B3F337482CE;
 Tue, 23 Jun 2020 13:06:56 +0200 (CEST)
Date: Tue, 23 Jun 2020 13:06:56 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v2 3/3] hw/misc/auxbus: Fix MOT/classic I2C mode
In-Reply-To: <20200623063123.20776-4-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2006231304300.23200@zero.eik.bme.hu>
References: <20200623063123.20776-1-f4bug@amsat.org>
 <20200623063123.20776-4-f4bug@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-38403794-1592910416=:23200"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 07:06:57
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Frederic Konrad <konrad@adacore.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-38403794-1592910416=:23200
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 23 Jun 2020, Philippe Mathieu-Daudé wrote:
> Since its introduction in commit 6fc7f77fd2 i2c_start_transfer()
> uses incorrectly the direction of the transfer. Fix it now.
>
> Fixes: 6fc7f77fd2 ("introduce aux-bus")
> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>

One of the above is probably enough, maybe Reported-by because I wasn't 
sure what's the solution. I'm also happy with your changes to the whole 
series, thanks for fixing it.

Regards,
BALATON Zoltan

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC because untested (probably never was anyway)
> Cc: Frederic Konrad <konrad@adacore.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
> hw/misc/auxbus.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index cef0d0d6d0..dc4a5dd10d 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -141,7 +141,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>             i2c_end_transfer(i2c_bus);
>         }
>
> -        if (i2c_start_transfer(i2c_bus, address, is_write)) {
> +        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
>             ret = AUX_I2C_NACK;
>             break;
>         }
> @@ -172,7 +172,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>             /*
>              * No transactions started..
>              */
> -            if (i2c_start_transfer(i2c_bus, address, is_write)) {
> +            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
>                 break;
>             }
>         } else if ((address != bus->last_i2c_address) ||
> @@ -181,7 +181,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>              * Transaction started but we need to restart..
>              */
>             i2c_end_transfer(i2c_bus);
> -            if (i2c_start_transfer(i2c_bus, address, is_write)) {
> +            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
>                 break;
>             }
>         }
>
--3866299591-38403794-1592910416=:23200--

