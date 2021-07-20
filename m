Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0A3D0132
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:05:57 +0200 (CEST)
Received: from localhost ([::1]:38684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5u7w-0008MN-EM
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5u4s-0002A4-KB
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:02:46 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:18944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5u4n-0007m9-M0
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:02:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 11E827462D3;
 Tue, 20 Jul 2021 20:02:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DE3CC74570B; Tue, 20 Jul 2021 20:02:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DBDF07456B7;
 Tue, 20 Jul 2021 20:02:38 +0200 (CEST)
Date: Tue, 20 Jul 2021 20:02:38 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PULL 13/17] hw/pci-host/Kconfig: Add missing dependency MV64361
 -> I8259
In-Reply-To: <20210720154141.3919817-14-philmd@redhat.com>
Message-ID: <22acbd9-ac8e-ecb8-c8eb-4df1f6136bf3@eik.bme.hu>
References: <20210720154141.3919817-1-philmd@redhat.com>
 <20210720154141.3919817-14-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2131369986-1626804158=:12679"
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
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2131369986-1626804158=:12679
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 20 Jul 2021, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> Looking at the MV64340 model source, there is a dependency on the

Small typo, it's MV64361 but maybe not a big problem if it's too late to 
fix up the commit message. Sorry I did not notice earlier.

Regards,
BALATON Zoltan

> 8259 interrupt controller:
>
>  523     case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
>  524         /* FIXME: Should this be sent via the PCI bus somehow? */
>  525         if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
>  526             ret = pic_read_irq(isa_pic);
>  527         }
>  528         break;
>
> Add it to Kconfig to avoid the following build failure:
>
>  /usr/bin/ld: libcommon.fa.p/hw_pci-host_mv64361.c.o: in function `mv64361_read':
>  hw/pci-host/mv64361.c:526: undefined reference to `isa_pic'
>  /usr/bin/ld: hw/pci-host/mv64361.c:526: undefined reference to `pic_read_irq'
>
> Fixes: dcdf98a9015 ("hw/pci-host: Add emulation of Marvell MV64361 PPC system controller")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Message-Id: <20210515173716.358295-10-philmd@redhat.com>
> ---
> hw/pci-host/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 84494400b86..2b5f7d58cc5 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -76,3 +76,4 @@ config SH_PCI
> config MV64361
>     bool
>     select PCI
> +    select I8259
>
--3866299591-2131369986-1626804158=:12679--

