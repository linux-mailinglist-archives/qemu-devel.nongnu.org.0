Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB56866E6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:30:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pND89-0001Nn-4t; Wed, 01 Feb 2023 08:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pND7h-0000zI-QB; Wed, 01 Feb 2023 08:26:03 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pND7e-00055j-OT; Wed, 01 Feb 2023 08:26:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B16A674635C;
 Wed,  1 Feb 2023 14:23:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3A070746324; Wed,  1 Feb 2023 14:23:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 38ADE74634B;
 Wed,  1 Feb 2023 14:23:19 +0100 (CET)
Date: Wed, 1 Feb 2023 14:23:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/usb/hcd-ohci: Fix typo
In-Reply-To: <20230201121515.23016-1-philmd@linaro.org>
Message-ID: <ba60ff0f-3d4a-4f68-d876-f11c22b31cf7@eik.bme.hu>
References: <20230201121515.23016-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-498155394-1675257799=:46388"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-498155394-1675257799=:46388
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 1 Feb 2023, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I've submitted a series to clean this device up a bit which changed these 
comments to remove the extre space from the end. Maybe this patch should 
be rebased on that series so I don't have to rebase ir as this one is a 
simple search/replace so could come after that series too. Hope Gerd is 
getting these and can eventually pick these up. I'm starting to get lost 
between branches and outstanding patches in my tree.

Regards,
BALATON Zoltan

> ---
> hw/usb/hcd-ohci.c | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index 9d68036d23..bd8b9d50e5 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -58,7 +58,7 @@ struct ohci_hcca {
> #define ED_WBACK_OFFSET offsetof(struct ohci_ed, head)
> #define ED_WBACK_SIZE   4
>
> -/* Bitfields for the first word of an Endpoint Desciptor.  */
> +/* Bitfields for the first word of an Endpoint Descriptor.  */
> #define OHCI_ED_FA_SHIFT  0
> #define OHCI_ED_FA_MASK   (0x7f<<OHCI_ED_FA_SHIFT)
> #define OHCI_ED_EN_SHIFT  7
> @@ -71,11 +71,11 @@ struct ohci_hcca {
> #define OHCI_ED_MPS_SHIFT 16
> #define OHCI_ED_MPS_MASK  (0x7ff<<OHCI_ED_MPS_SHIFT)
>
> -/* Flags in the head field of an Endpoint Desciptor.  */
> +/* Flags in the head field of an Endpoint Descriptor.  */
> #define OHCI_ED_H         1
> #define OHCI_ED_C         2
>
> -/* Bitfields for the first word of a Transfer Desciptor.  */
> +/* Bitfields for the first word of a Transfer Descriptor.  */
> #define OHCI_TD_R         (1<<18)
> #define OHCI_TD_DP_SHIFT  19
> #define OHCI_TD_DP_MASK   (3<<OHCI_TD_DP_SHIFT)
> @@ -88,14 +88,14 @@ struct ohci_hcca {
> #define OHCI_TD_CC_SHIFT  28
> #define OHCI_TD_CC_MASK   (0xf<<OHCI_TD_CC_SHIFT)
>
> -/* Bitfields for the first word of an Isochronous Transfer Desciptor.  */
> -/* CC & DI - same as in the General Transfer Desciptor */
> +/* Bitfields for the first word of an Isochronous Transfer Descriptor.  */
> +/* CC & DI - same as in the General Transfer Descriptor */
> #define OHCI_TD_SF_SHIFT  0
> #define OHCI_TD_SF_MASK   (0xffff<<OHCI_TD_SF_SHIFT)
> #define OHCI_TD_FC_SHIFT  24
> #define OHCI_TD_FC_MASK   (7<<OHCI_TD_FC_SHIFT)
>
> -/* Isochronous Transfer Desciptor - Offset / PacketStatusWord */
> +/* Isochronous Transfer Descriptor - Offset / PacketStatusWord */
> #define OHCI_TD_PSW_CC_SHIFT 12
> #define OHCI_TD_PSW_CC_MASK  (0xf<<OHCI_TD_PSW_CC_SHIFT)
> #define OHCI_TD_PSW_SIZE_SHIFT 0
>
--3866299591-498155394-1675257799=:46388--

