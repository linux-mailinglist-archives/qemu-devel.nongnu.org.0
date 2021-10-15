Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D542E90E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 08:32:23 +0200 (CEST)
Received: from localhost ([::1]:41728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbGlS-0004vn-Hr
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 02:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbGkJ-0004F7-Rb
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:31:11 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:60897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbGkI-0001gJ-5E
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:31:11 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N32y5-1miscr0V1p-013QqE; Fri, 15 Oct 2021 08:31:08 +0200
Subject: Re: [PATCH 3/8] q800: use GLUE IRQ numbers instead of IRQ level for
 GLUE IRQs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <76216e92-8a9b-4275-b009-00997f86fba2@vivier.eu>
Date: Fri, 15 Oct 2021 08:31:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013212132.31519-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2az0VmSuVmv/QkhjvKANWuC4f7Yd8Di9zO7GLPeX51xqlQcellt
 lkT4heTRwJM5baa3XxwI/rCJczyvB4oQ4XIuQqIUmB78H3OQfkGzWBGCPbBqPKFT4i/rkJG
 uYbHghO9/Ry1Fg/u75JcWgH6l5GA9tBzei2a3a91M3lyRkFfEdw9JWNUhjQHszTnsfWDbXA
 14xjSDMrRwZPWrvaa84Mg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IPM8GDYtBLc=:xs5VuJWuXyjgy5bCDEM17n
 vAwa1hwVe2ZdJi/Mnw4fnqIaEmf1fHs3EWR7T5EC0s9jnA03prgsUZ5Zhpq/Vuk/EUEyzbHHX
 4sA/wYPProqxKuTGVRNrzIdAGjb9nqLRZaLwJ7DBzU07k/DtWXzmpe+bxYr7JjfIyWnoYp687
 Sc8nxarWpr/GKis23i9ZxEzG9asEuId0aW7J2+fPwzWqr0ELEPnu+Ov86yW86CheJ60NHKn4z
 A/9K4iMPkUvly840UR9usQ/yAEUTwHYkc1w6cp1lvfM/DbuD9ou/5xGXqf4yD34CLAAnImmih
 0T9Yy2L4gqZNiKQqvB8taYluHCWIFb0eB0Mg7PNLf1Sh+s0Qgk96sTSlgHbKUKGkA/EKUtGp3
 HfE1N7jvCUfvYZWkYqtMWp5axgn+2CwskLMM9cx4ORmtFmEDervAGeCZ7hPHupioHSrnTXE+v
 I2eJgwFwT247x2RDT7vHwZDww0Fim/QcIOgiRvhR5yEMA3pbXXbB2rtuu/per4Qcasvx2fsaD
 ElYTuj0xLxfZDD6pr5fplH02o04O0AD1kCy4DwyHwuX6VXgkO8+WvVeo9thi3qM9h5tguwM6o
 XN95XBDYGbRngQqiwbWy/Lp8XRNyHVpOkcbS0zAXnNDYET6j6qMSq4U41qQzHlpwllg9HTmKU
 Az26aGSsFlVFL2jxxuyVChn+yCLJHKO804JAePUjuv4SrZ1wQVf2J//8Dte9YRL81YNiIiJ6a
 zscMpiQQ21pr/M8qHiQ9A6Xsy20wUexOmrnSuQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
> In order to allow dynamic routing of IRQs to different IRQ levels on the CPU
> depending upon port B bit 6, use GLUE IRQ numbers and map them to the the
> corresponding CPU IRQ level accordingly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 15f3067811..81c335bf16 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -102,11 +102,34 @@ struct GLUEState {
>      uint8_t ipr;
>  };
>  
> +#define GLUE_IRQ_IN_VIA1       0
> +#define GLUE_IRQ_IN_VIA2       1
> +#define GLUE_IRQ_IN_SONIC      2
> +#define GLUE_IRQ_IN_ESCC       3
> +
>  static void GLUE_set_irq(void *opaque, int irq, int level)
>  {
>      GLUEState *s = opaque;
>      int i;
>  
> +    switch (irq) {
> +    case GLUE_IRQ_IN_VIA1:
> +        irq = 5;
> +        break;

Perhaps you can move this patch before patch 2 to help to understand why GLUE_IRQ_IN_VIA1 (0) is
mapped to irq 5 (before patch 2 it would be to 0).

> +
> +    case GLUE_IRQ_IN_VIA2:
> +        irq = 1;
> +        break;
> +
> +    case GLUE_IRQ_IN_SONIC:
> +        irq = 2;
> +        break;
> +
> +    case GLUE_IRQ_IN_ESCC:
> +        irq = 3;
> +        break;
> +    }
> +
>      if (level) {
>          s->ipr |= 1 << irq;

perhaps you can rename here "irq" to "shift"?

Thanks,
Laurent

