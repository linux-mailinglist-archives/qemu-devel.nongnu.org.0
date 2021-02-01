Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4078830AFBE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 19:47:46 +0100 (CET)
Received: from localhost ([::1]:33824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6eEi-0004Es-OH
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 13:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6eD6-0003a1-VC
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 13:46:06 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:65104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6eD0-0007B4-UL
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 13:46:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EB5FC7462E1;
 Mon,  1 Feb 2021 19:45:52 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B80EF7462E0; Mon,  1 Feb 2021 19:45:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B69527462D6;
 Mon,  1 Feb 2021 19:45:52 +0100 (CET)
Date: Mon, 1 Feb 2021 19:45:52 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: vnc clipboard support
In-Reply-To: <20210201174018.GP4131462@redhat.com>
Message-ID: <8456ae54-b737-fa7d-cac8-75cd701f9ef5@eik.bme.hu>
References: <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
 <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
 <20210129110814.GF4001740@redhat.com>
 <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
 <20210129143252.GE4008275@redhat.com>
 <05C58667-D9BA-49E2-897D-2286B243E802@redhat.com>
 <20210201155116.GL4131462@redhat.com>
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
 <20210201174018.GP4131462@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-189619529-1612205152=:24026"
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
Cc: qemu-devel@nongnu.org, Christophe de Dinechin <cdupontd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-189619529-1612205152=:24026
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 1 Feb 2021, Daniel P. Berrangé wrote:
> IMHO keyboard injection is only barely better than no clipboard
> at all, and I don't think we should settle for that as a solution.

From this discussion it looks like doing keyboard injection is not a good 
solution as it has more problems than what it can solve so we can conclude 
to drop that idea which then means there needs to be some kind of guest 
agent.

> My preferred solution is to have QEMU leverage the existing SPICE
> guest agent if at all possible, because that's already widely
> available in existing guest OS.

I think spice is not as widely available as VNC (or even Synergy) so the 
idea to strip one of those down to just a guest clipboard agent would help 
to get support to the most guests. QEMU already knows about VNC so might 
be the simplest way and you could reuse all kinds of VNC client and server 
code for the guest agent and also make it easy for others to add support 
for their guests. Using spice may not be that easi as it's less widespread 
so probably only works on the guests that already have support for it. And 
then why not just use spice instead of VNC on those guests and then you 
don't have the clipboard problem either.

>> What is the use case for single-directional text-only clipboard?
>
> It is better no clipboard at all.... but only just.

I think the use case Gerd mentioned as a first target: paste a link to the 
guest browser to download your data. But that's very limited and not that 
much useful so I agree more complete support should be targeted than that.

>> Well, to me, the trick is that you got a VNC server in qemu that
>> receives VNC clipboard data. The question is how you transfer
>> that to the guest. Indeed, the protocol is simplistic, but you still
>> need a new data path, e.g. a character device that your in-guest
>> agent listens to, a bit like the SPICE agent. So the picture becomes:
>>
>> Normal VNC
>> Client --> (guest network) --> In-guest VNC server
>>
>> QEMU VNC:
>> Client --> (host network) --> qemu-VNC server --> char device --> in-guest VNC clipboard server
>>
>> Only the data path changes, but the protocol can remain
>> essentially the same.
>
> We should not be relying on the guest OS using VNC at all. On Windows
> it is much more common to use RDP and GNOME looks to be going the same
> way for Linux. We none the less want to be able to still use VNC from
> the host side.
>
> We need something to be running in the guest, and that should be
> agnostic of whatever other software the guest chooses to use for
> remote desktop, and should not assume the guest even has remote
> desktop setup.

As I understood, the idea is not to run a full VNC server on the guest OS 
but to make it easy to write the guest agent that you'll need to run is to 
reuse parts of a VNC server which is already available on almost all 
platforms. So basing the guest agent protocol on that allows you to not 
needing to write a guest agent but just extract the code from an already 
available VNC server that hopefully already solves the guest OS 
integration problems which is the most problematic part. At least where 
open source versions are available but for most platforms there's probably 
a few. This just avoids writing a guest agent for all kinds of guests from 
scratch or pulling in too much unneeded dependencies just to make 
clipboard work (as a full spice guest agent may be overkill for this).

Regards,
BALATON Zoltan
--3866299591-189619529-1612205152=:24026--

