Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C459B4737E3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 23:47:49 +0100 (CET)
Received: from localhost ([::1]:59068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwu6m-0003lG-GJ
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 17:47:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mwu5E-0002wD-Us
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 17:46:12 -0500
Received: from [2001:41c9:1:41f::167] (port=42476
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mwu5D-0002PZ-Gx
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 17:46:12 -0500
Received: from [2a00:23c4:8b9f:4900:2b16:6388:bafb:d365]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mwu4s-00035t-SS; Mon, 13 Dec 2021 22:45:51 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211206224528.563588-1-f4bug@amsat.org>
 <20211206224528.563588-4-f4bug@amsat.org>
 <99ebc4fb-f061-1e57-da07-e66035bacf9b@redhat.com>
 <ee3af451-212d-fe82-d63d-e410374ae2d2@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a846f303-9e1a-e438-d339-71c854e9fa74@ilande.co.uk>
Date: Mon, 13 Dec 2021 22:46:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ee3af451-212d-fe82-d63d-e410374ae2d2@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9f:4900:2b16:6388:bafb:d365
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 3/4] hw/display/vga-mmio: QOM'ify vga_mmio_init() as
 TYPE_VGA_MMIO
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.093,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Finn Thain <fthain@telegraphics.com.au>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/12/2021 11:05, Philippe Mathieu-Daudé wrote:

> On 12/13/21 11:48, Thomas Huth wrote:
>> On 06/12/2021 23.45, Philippe Mathieu-Daudé wrote:
>>> Introduce TYPE_VGA_MMIO, a sysbus device.
>>>
>>> While there is no change in the vga_mmio_init()
>>> interface, this is a migration compatibility break
>>> of the MIPS Acer Pica 61 Jazz machine (pica61).
>>
>> It's unfortunate, but as far as I know, it would be pretty difficult or
>> even impossible to get this done without versioned machine types? So
>> IMHO it's ok to break this in this case here.
> 
> Hervé and Zoltan were already Cc'ed, adding Mark and Finn;
> I am not sure who else would be annoyed by that change.

No issues from this end. I've done a few bits and pieces on the 40p machine when 
testing OpenBIOS, but that won't be affected by this change.


ATB,

Mark.

