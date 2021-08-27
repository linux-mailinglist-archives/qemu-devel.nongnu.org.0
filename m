Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA33F9855
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 13:05:49 +0200 (CEST)
Received: from localhost ([::1]:53084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJZgC-00027Z-8G
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 07:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJZeN-0001H2-VT
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 07:03:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50766
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJZeM-0008Kl-45
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 07:03:55 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJZds-00034T-3v; Fri, 27 Aug 2021 12:03:29 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210826200720.2196827-1-philmd@redhat.com>
 <20210826200720.2196827-4-philmd@redhat.com>
 <b8842325-cf0c-31f6-a4ba-68890eea4e49@ilande.co.uk>
 <CAFEAcA-fn4L9mSqvq+fQ9FhNnvAYv5gJmRMGYbQJNdJ15h81Lg@mail.gmail.com>
 <44d7475b-0d4a-58e0-59e1-bba24cb1ca7e@ilande.co.uk>
 <CAFEAcA82o8v6zJoYsv0hg9O-rUcUQL8EL2G-o76dwMg9k=bONA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2d1bb979-9bea-73b0-e6a2-f80ba4b85e1d@ilande.co.uk>
Date: Fri, 27 Aug 2021 12:03:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82o8v6zJoYsv0hg9O-rUcUQL8EL2G-o76dwMg9k=bONA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 3/3] hw/usb/xhci: Always expect 'dma' link property to
 be set
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/08/2021 11:14, Peter Maydell wrote:

> On Fri, 27 Aug 2021 at 10:14, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>> Ah so the plan moving forward is to always have an explicit MR passed in for DMA use.
>> Sorry if I missed that in earlier versions of the patchset, I'm still getting back up
>> to speed on QEMU hacking.
>>
>> Was there a decision as to what the property name should be? I see "dma_mr" used
>> quite a bit, and if there will be more patches to remove the system_memory default
>> from other devices then it would be nice to try and use the same name everywhere.
> 
> No, I don't think we have a convention; it might be nice to add one.
> Currently a quick git grep for DEFINE_PROP_LINK and eyeballing of
> the results shows that we have:
> 
>   "memory" x 7
>   "dram" x 4
>   "downstream" x 3
>   "dma-memory" x 3
>   "dma" x 2
>   "source-memory"
>   "dram-mr"
>   "ddr"
>   "ddr-ram"
>   "gic"
>   "cpc"
>   "port[N]"
>   "dma_mr"
>   "ahb-bus"
>   "system-memory"
>   "main-bus"
> 
> This list includes all our TYPE_MEMORY_REGION link properties; a few of these
> are special-purpose, and reasonably have specialized names. 2 out of 3 users
> of "downstream" are devices which pass on (or filter out) memory transactions
> from the CPU (tz-msc, tz-mpc), and I think that name makes sense there.
> (The 3rd is pl080.c, which is a plain old DMA controller, and the naming
> there is not so well-suited.)
> 
> "memory" is mostly SoC and CPU objects taking a link to whatever they should
> have as the CPU's view of memory.
> 
> I don't have a strong view on what we ought to try to standardize on,
> except that I don't like the "_mr" or "-mr" suffix -- I don't think we
> need to try to encode the type of the link property in the property name.
> 
> It is probably reasonable to have different naming conventions for:
>   * SoC and CPU objects, which take a link to the MR which represents
>     the CPU/SoC's view of the outside world
>   * Endpoint devices which can be DMA masters and take a link giving
>     them their view of what they can DMA to
>   * filtering/control devices which take incoming transactions from
>     an upstream port, filter some and pass the rest through to a
>     downstream port
> 
> In pretty much all cases, these link properties are used only internally
> to QEMU, so if we decide on a naming convention we can fairly easily
> rename existing properties to match.

I quite like "cpu-memory" for SoC/CPU objects and "dma-memory" for endpoint devices 
that can be DMA masters. Perhaps the last case is specialised enough that a 
convention there doesn't make sense?


ATB,

Mark.

