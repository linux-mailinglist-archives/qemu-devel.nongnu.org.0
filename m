Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA08B3ABFB9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 01:46:58 +0200 (CEST)
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu1ir-0003uU-N3
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 19:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lu1hh-0002q9-1T
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 19:45:46 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:54764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lu1hf-0003Dw-8L
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 19:45:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9FF827457E5;
 Fri, 18 Jun 2021 01:45:41 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7E9A07456E3; Fri, 18 Jun 2021 01:45:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7CE537456B4;
 Fri, 18 Jun 2021 01:45:41 +0200 (CEST)
Date: Fri, 18 Jun 2021 01:45:41 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 06/15] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
In-Reply-To: <20210617115334.2761573-7-f4bug@amsat.org>
Message-ID: <bff52bb-31e5-d814-777-a2b3060ebde@eik.bme.hu>
References: <20210617115334.2761573-1-f4bug@amsat.org>
 <20210617115334.2761573-7-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-21373367-1623973541=:59666"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-21373367-1623973541=:59666
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 17 Jun 2021, Philippe Mathieu-Daudé wrote:
> Instead of using the confuse i2c_send_recv(), rewrite to directly
> call i2c_recv() & i2c_send(), resulting in code easier to review.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
> 1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
> index f4c5bc12d36..75d50f15158 100644
> --- a/hw/i2c/ppc4xx_i2c.c
> +++ b/hw/i2c/ppc4xx_i2c.c
> @@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque, hwaddr addr, uint64_t value,
>                         i2c->sts &= ~IIC_STS_ERR;
>                     }
>                 }
> -                if (!(i2c->sts & IIC_STS_ERR) &&
> -                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
> -                    i2c->sts |= IIC_STS_ERR;
> -                    i2c->extsts |= IIC_EXTSTS_XFRA;
> -                    break;
> +                if (!(i2c->sts & IIC_STS_ERR)) {
> +                    if (recv) {
> +                        i2c->mdata[i] = i2c_recv(i2c->bus);
> +                    } else if (i2c_send(i2c->bus, i2c->mdata[i]) < 0) {
> +                        i2c->sts |= IIC_STS_ERR;
> +                        i2c->extsts |= IIC_EXTSTS_XFRA;
> +                        break;
> +                    }
>                 }
>                 if (value & IIC_CNTL_RPST || !(value & IIC_CNTL_CHT)) {
>                     i2c_end_transfer(i2c->bus);
>
--3866299591-21373367-1623973541=:59666--

