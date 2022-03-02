Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AFF4CB2BA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 00:19:25 +0100 (CET)
Received: from localhost ([::1]:57178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPYFf-0007N3-Qb
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 18:19:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1nPYEo-0006hF-8c
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 18:18:30 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83]:37794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1nPYEl-0004Mh-Pk
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 18:18:29 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id AD3EBA0114; Thu,  3 Mar 2022 00:11:10 +0100 (CET)
Date: Thu, 3 Mar 2022 00:11:10 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/5] Misc OHCI clean ups
In-Reply-To: <41fdb23c-8d12-1ffa-f08-601f15ffc7d6@eik.bme.hu>
Message-ID: <alpine.LMD.2.03.2203030010350.22863@eik.bme.hu>
References: <cover.1643117600.git.balaton@eik.bme.hu>
 <1b24997-8dba-d640-1ce6-896fc346ae9@eik.bme.hu>
 <228c70c7-11bf-8d94-607b-4eacdcaddd93@eik.bme.hu>
 <41fdb23c-8d12-1ffa-f08-601f15ffc7d6@eik.bme.hu>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 25 Feb 2022, BALATON Zoltan wrote:
> On Wed, 16 Feb 2022, BALATON Zoltan wrote:
>> On Tue, 8 Feb 2022, BALATON Zoltan wrote:
>>> On Tue, 25 Jan 2022, BALATON Zoltan wrote:
>>>> v2 - Fixed checkpatch errors
>>>> 
>>>> Hello,
>>> 
>>> Ping?
>> 
>> Ping^2
>
> Ping^3

Ping^4 Why is this getting ignored?

>> https://patchew.org/QEMU/cover.1643117600.git.balaton@eik.bme.hu/
>> 
>> Regards,
>> BALATON Zoltan
>> 
>>>> I have these patches from last October when we've looked at what
>>>> causes problems with mac99 and USB. We've found the main problem is
>>>> likely not allowing pending packets per endpoint which we did not fix
>>>> but these patches came out of debugging that and trying to improve the
>>>> device model so eventually the real problem could be fixed more
>>>> easily. So these are just clean ups and fixing one potential issue
>>>> with isochronous transfers breaking pending async packet but it does
>>>> not solve all problems OHCI currently has. I'm sending it anyway as I
>>>> don't plan to work further on this so this series could be taken as is
>>>> for now.
>>>> 
>>>> Regards,
>>>> 
>>>> BALATON Zoltan (5):
>>>>  usb/ohci: Move trace point and log ep number to help debugging
>>>>  usb/ohci: Move cancelling async packet to ohci_stop_endpoints()
>>>>  usb/ohci: Move USBPortOps related functions together
>>>>  usb/ohci: Merge ohci_async_cancel_device() into ohci_child_detach()
>>>>  usb/ohci: Don't use packet from OHCIState for isochronous transfers
>>>> 
>>>> hw/usb/hcd-ohci.c   | 297 +++++++++++++++++++++-----------------------
>>>> hw/usb/trace-events |   2 +-
>>>> 2 files changed, 146 insertions(+), 153 deletions(-)
>>>> 
>>>> 
>>> 
>> 
>> 
>
>

