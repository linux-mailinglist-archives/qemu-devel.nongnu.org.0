Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB9166E5D7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:18:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqXE-0006NY-SO; Tue, 17 Jan 2023 13:18:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1pHqXC-0006Ka-59
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:18:10 -0500
Received: from mailgw.felk.cvut.cz ([147.32.82.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1pHqX5-0004lC-80
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:18:09 -0500
Received: from mailgw.felk.cvut.cz (localhost.localdomain [127.0.0.1])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTP id 0EBC130B294A;
 Tue, 17 Jan 2023 19:16:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 cmp.felk.cvut.cz; h=cc:cc:content-transfer-encoding:content-type
 :content-type:date:from:from:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=felkmail; bh=uMVsz
 h5AYXnqM9o7/FsUn0z3ok2gP3xmiLpZqZ+g42g=; b=KjRBqlHxdSOFeO6FeQHjc
 T8TBRu09Xvd9sg7H2hMX16vFtDuwgN3Q4KTHO33iRAE/S8jMd96ZjLeTE6+jLTJz
 P1tiBAY2LWKpRyumnDht9hF0kt0InEC4QbjlQNOa5YLm3BAMybf8IpPEyQ1hMOXK
 4aJj9rptzgMRm+LE30ZK20Z/VTywW5049ad8T308DyWT88x5ChsELAeILVrX9R14
 KmH4yHLTBOdOHGJ/r2tktgWq7cNVfe/w/kqjHkmyjPbqmwSPZacUbbaLACAwGl35
 RSEmBNR04WCobX4J/hkWgdxPfyX1fY9zgMABf8JoupKArv44SxBT45EX6qk78GOC
 Q==
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTPS id D9EA330B2948;
 Tue, 17 Jan 2023 19:16:53 +0100 (CET)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 30HIGrZv012322; Tue, 17 Jan 2023 19:16:53 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 30HIGrDt012321;
 Tue, 17 Jan 2023 19:16:53 +0100
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] hw/net/can: Add mcp25625 model
Date: Tue, 17 Jan 2023 19:16:35 +0100
User-Agent: KMail/1.9.10
Cc: jasowang@redhat.com, fnu.vikram@xilinx.com, qemu-devel@nongnu.org,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Frank Chang <frank.chang@sifive.com>
References: <20230104122220.110412-1-ben.dooks@codethink.co.uk>
 <c29fe486-d510-2c0e-ed38-9f05c0f4679f@codethink.co.uk>
In-Reply-To: <c29fe486-d510-2c0e-ed38-9f05c0f4679f@codethink.co.uk>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202301171916.35965.pisa@cmp.felk.cvut.cz>
Received-SPF: none client-ip=147.32.82.15; envelope-from=pisa@cmp.felk.cvut.cz;
 helo=mailgw.felk.cvut.cz
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-0.097, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Dear Ben,

sorry for longer response times...

On Tuesday 17 of January 2023 14:32:29 Ben Dooks wrote:
> On 04/01/2023 12:22, Ben Dooks wrote:
> > From: Ben Dooks <ben.dooks@sifive.com>
> >
> > Add support for Microchip MCP25625 SPI based CAN controller which is
> > very similar to the MCP2515 (and covered by the same Linux driver).
...
> Has anyone had chance to review this, it would be great to get
> this moving along.

Generally, I am happy that you consider use and extend our work.

I have looked at the code. But even that implementation of CAN
subsystem in QEMU was my idea and I led studnets working on
it and sometimes heavily rewritten code to be acceptable,
I am not QEMU expert and I have not studied its SSI subsystem
so for comment from QEMU code requiremts I would be happy
for some other to step in. 

I would like to test the peripheral. Please, can you try to elaborate
and prepare description how to config QEMU for RPi emulation with
mcp2515 overlay?

  https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts/overlays/mcp2515-can0-overlay.dts

I have RPi images and I have experience with this hardware.
Even that I consider mcp2515 as really unfortunate solution
and we have spent lot of time to help colleagues to enhance a little
latencies of this solution when they chose that HW for serious
wok instead of some NXP, TI, Xilinx or other sane SoC with CAN.

  https://dspace.cvut.cz/bitstream/handle/10467/68605/F3-DP-2017-Prudek-Martin-Dp_2017_prudek_martin.pdf

But yes, people are using this chip a lot so it would worth to have
emulation in QEMU. If the SPI connection is required then mcp251xfd
seems to have chance for lower SPI transfer count overhead nd performance.
But real SoC bus connected controllers are much better for serious
project, if you design chip there are more cores available M-CAN,
GRCAN and even our own CTU CAN FD which has already emulation in QEMU.

Back to MCP25x1x. I have gone through code and try to understand
the function. There is lot of connected to the locations in the
registers maps in the chip

>   s->ssi_addr = 0x31;

I have took manual but I think that it would help to add there comments
with registers names or even use defines for these. But may it be,
that for the easy ampping in the table and increment logic numbers
are reasonable option... But comments with register symbolic names
would help.

The code does define only single property ("canbus") to select CAN
bus to connect controller to. Mapping to the SPI peripheral is
provided by device tree on QEMU side or by some other machine specific
glue code? Please, can you provide more information for intended
target use and RPi option to use for testing?

As for the code, I have read it the first time and for full check
I would need to spent more time with it. But I expect that
functionality check with the respect to mcp25x1x datasheet has been
done mainly by you so the full check bit by bit is not necessary.
If there is some omitted case it would be (hopefully) found during
code use. As for generic code style and redability, I see no problem.
I expect that you have checked for QEMU style and if there has been
some problem you have propably received QEMU CI and static analysis
feedback.

> +static void mcp25625_rx_into_buf(MCP25625State *s,
> +                                 const qemu_can_frame *frame,
> +                                 unsigned buffnr, int filthit)
> +{
> +    struct rxbuff *rxbuff = &s->rxbuffs[buffnr];
> +    qemu_canid_t e_id, sidl, id, q_id = frame->can_id;
> +    unsigned len = frame->can_dlc;
> +

I would suggest to check for can_dlc > 8 in this function or in
its caller (mcp25625_can_receive), to ensure that QEMU cannot be
attacked by some malformed CAN message from the host kernel
or other VM...

> +static ssize_t mcp25625_can_receive(CanBusClientState *client,
> +                                    const qemu_can_frame *buf,
> +                                    size_t frames_cnt)
> +{
> +    MCP25625State *s = client_to_mcp(client);
> +    int ret;
> +
> +    /* support receiving only one frame at a time */
> +    if (frames_cnt != 1) {
> +        return -1;
> +    }
> +
> +    /* we don't support error frames or buf->flags */
> +    if (buf->can_id & QEMU_CAN_ERR_FLAG || buf->flags != 0) {
> +        return -1;
> +    }

I see as next step that you provide description/patch etc
for some target that I can test the code with CAN tools on my
side. I would prefer connection to some ARM Cortex-A target
where I have some images t run ready. RISC-V is really interesting
for me too, so if there is some option to run something
small, I can try that too. I prefer minimal setup with
self compilled bysybox in initramfs and the mapping of some
development directories through virtfs into system.

If you plan to visit FOSDEM 2023, we can meet there in person
at RISC-V devroom and I want to take tour for automotive and other
areas. Another chance is Embedded World where we plan to show
CAN latency tester demo with CTU CAN FD and some MCUs... 

Best wishes,

                Pavel
-- 
                Pavel Pisa
    phone:      +420 603531357
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://control.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/
    RISC-V education: https://comparch.edu.cvut.cz/
    Open Technologies Research Education and Exchange Services
    https://gitlab.fel.cvut.cz/otrees/org/-/wikis/home




