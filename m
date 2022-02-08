Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE12B4AD524
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:41:02 +0100 (CET)
Received: from localhost ([::1]:34818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMzc-00039w-W7
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:41:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nHMuK-00009z-ME
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 04:35:33 -0500
Received: from [2001:738:2001:2001::2001] (port=18337 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nHMuH-0005XH-I5
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 04:35:32 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B9F62746369;
 Tue,  8 Feb 2022 10:35:22 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9FA88746361; Tue,  8 Feb 2022 10:35:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9DA2F74634B;
 Tue,  8 Feb 2022 10:35:22 +0100 (CET)
Date: Tue, 8 Feb 2022 10:35:22 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/5] Misc OHCI clean ups
In-Reply-To: <cover.1643117600.git.balaton@eik.bme.hu>
Message-ID: <1b24997-8dba-d640-1ce6-896fc346ae9@eik.bme.hu>
References: <cover.1643117600.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Jan 2022, BALATON Zoltan wrote:
> v2 - Fixed checkpatch errors
>
> Hello,

Ping?

Regards,
BALATON Zoltan

> I have these patches from last October when we've looked at what
> causes problems with mac99 and USB. We've found the main problem is
> likely not allowing pending packets per endpoint which we did not fix
> but these patches came out of debugging that and trying to improve the
> device model so eventually the real problem could be fixed more
> easily. So these are just clean ups and fixing one potential issue
> with isochronous transfers breaking pending async packet but it does
> not solve all problems OHCI currently has. I'm sending it anyway as I
> don't plan to work further on this so this series could be taken as is
> for now.
>
> Regards,
>
> BALATON Zoltan (5):
>  usb/ohci: Move trace point and log ep number to help debugging
>  usb/ohci: Move cancelling async packet to ohci_stop_endpoints()
>  usb/ohci: Move USBPortOps related functions together
>  usb/ohci: Merge ohci_async_cancel_device() into ohci_child_detach()
>  usb/ohci: Don't use packet from OHCIState for isochronous transfers
>
> hw/usb/hcd-ohci.c   | 297 +++++++++++++++++++++-----------------------
> hw/usb/trace-events |   2 +-
> 2 files changed, 146 insertions(+), 153 deletions(-)
>
>

