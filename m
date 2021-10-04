Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8361A420952
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:28:41 +0200 (CEST)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXLD6-0005xT-4J
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXKte-0006gm-4K
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:08:35 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:45386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXKta-0007tv-Aq
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:08:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A9E8D7462D3;
 Mon,  4 Oct 2021 12:08:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 83EC7745953; Mon,  4 Oct 2021 12:08:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8203A7457EE;
 Mon,  4 Oct 2021 12:08:27 +0200 (CEST)
Date: Mon, 4 Oct 2021 12:08:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: [RFC PATCH 0/4] Misc OHCI patches
In-Reply-To: <CABLmASHcv95aKY+5mJ9rbEFPvXQrT3YOjOcO5QtV0=WR4kqmLw@mail.gmail.com>
Message-ID: <f5991243-dce5-a1c6-e6c4-ccdc61b6a8db@eik.bme.hu>
References: <cover.1633122670.git.balaton@eik.bme.hu>
 <CABLmASG_Coop-fMRdv_PvBorO1fQUrhY3h+-PGts_ixhhkaADA@mail.gmail.com>
 <6c2830fe-70d5-3c1a-ba17-85f3d252d860@eik.bme.hu>
 <CABLmASGkZ3kuGPF=d0jWPyryepcM-Hpd_VcgL=Z4qpmk07E-1A@mail.gmail.com>
 <c541324-ed75-e6d2-d9b8-2742baed30da@eik.bme.hu>
 <CABLmASHZqTrON_MG_tw9D6C_eo++8VZEJduce3WRfPY0u=+9rQ@mail.gmail.com>
 <CABLmASHcv95aKY+5mJ9rbEFPvXQrT3YOjOcO5QtV0=WR4kqmLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Oct 2021, Howard Spoelstra wrote:
> Hi all,
>
> One more observation: When running Mac OS  guests with -mac99,via=pmu, the
> guest is presented with a usb-mouse and usb-kbd, while -mac99 provides cuda
> mouse/kbd.
>
> If I run with via=pmu, the mouse/kbd will not work when passing through the
> usb headset.
> Only when I keep interrupting by pressing a volume button on the headset,
> the mouse moves. So it seems Qemu does not iterate getting interrupts over
> multiple devices.

It the MacOS HID driver works by always keeping a request pending to 
receive any events that become an async packet waiting on your usb headset 
ep 4, this currently blocks all of OHCI and no other packets go through 
until this async packet completes (when you press a button on the HID 
device). So the comment in code not only means that different endpoints 
block each other but one endpoint blocks the whole controller which is 
clearly wrong. I think this confirms the theory that we'd need to fix 
this.

I've tried removing the async_id from OHCIState but I'm lost between all 
these callbacks. Maybe somebody who knows more about QEMU USB and OHCI 
could take a look or are there some docs about what callbacks are called 
when in QEMU when something happens? I'm interested in the child detach, 
detach and async complete callbacks (which handle pending packets in 
hcd-ohci) and if they can be called while ohci_service_td is running 
(which submits packets and also called for handling completed async 
packets). Maybe ohci_service_td should be split into two parts: submitting 
and handling returns, so only the completion part is called from 
ohci_async_complete_packet callback but that needs to find the OHCI struct 
for the packet to put results in so now it just triggers a complete 
processing of all requests and handles completion if it finds the packet. 
I'm lost in the possible interactions between these callbacks so some info 
on that might help.

Regards,
BALATON Zoltan

