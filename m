Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABFE6B9042
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 11:37:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc215-0002cf-TX; Tue, 14 Mar 2023 06:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>) id 1pc213-0002cX-Mw
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:36:25 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3] helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>) id 1pc211-00007S-6L
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:36:25 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1pc20n-0004Gl-UY; Tue, 14 Mar 2023 10:36:10 +0000
Date: Tue, 14 Mar 2023 10:36:09 +0000
From: Ben Dooks <qemu@ben.fluff.org>
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, jasowang@redhat.com,
 fnu.vikram@xilinx.com, qemu-devel@nongnu.org,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Frank Chang <frank.chang@sifive.com>, paul.walmsley@sifive.com
Subject: Re: [PATCH] hw/net/can: Add mcp25625 model
Message-ID: <20230314103609.kpf5o7eq7gdce2kh@hetzy.fluff.org>
References: <20230104122220.110412-1-ben.dooks@codethink.co.uk>
 <c29fe486-d510-2c0e-ed38-9f05c0f4679f@codethink.co.uk>
 <202301171916.35965.pisa@cmp.felk.cvut.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301171916.35965.pisa@cmp.felk.cvut.cz>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
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

On Tue, Jan 17, 2023 at 07:16:35PM +0100, Pavel Pisa wrote:
> Dear Ben,
> 
> sorry for longer response times...

I think we've both dropped the ball on this one, just got reminded about
this set and found it got deleted from work email.

We've done review upates and will try and get some branches out today and
maybe a new patch out for inclusion.

> On Tuesday 17 of January 2023 14:32:29 Ben Dooks wrote:
> > On 04/01/2023 12:22, Ben Dooks wrote:
> > > From: Ben Dooks <ben.dooks@sifive.com>
> > >
> > > Add support for Microchip MCP25625 SPI based CAN controller which is
> > > very similar to the MCP2515 (and covered by the same Linux driver).
> ...
> > Has anyone had chance to review this, it would be great to get
> > this moving along.
> 
> Generally, I am happy that you consider use and extend our work.
> 
> I have looked at the code. But even that implementation of CAN
> subsystem in QEMU was my idea and I led studnets working on
> it and sometimes heavily rewritten code to be acceptable,
> I am not QEMU expert and I have not studied its SSI subsystem
> so for comment from QEMU code requiremts I would be happy
> for some other to step in. 
> 
> I would like to test the peripheral. Please, can you try to elaborate
> and prepare description how to config QEMU for RPi emulation with
> mcp2515 overlay?
> 
>   https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts/overlays/mcp2515-can0-overlay.dts
> 
> I have RPi images and I have experience with this hardware.
> Even that I consider mcp2515 as really unfortunate solution
> and we have spent lot of time to help colleagues to enhance a little
> latencies of this solution when they chose that HW for serious
> wok instead of some NXP, TI, Xilinx or other sane SoC with CAN.

I had a quick look at setting an pi3b emulation but it does not currently
have an SSI port available by default. I will try and post the branch I
used with the SiFive Unmatched board later.


>   https://dspace.cvut.cz/bitstream/handle/10467/68605/F3-DP-2017-Prudek-Martin-Dp_2017_prudek_martin.pdf
> 
> But yes, people are using this chip a lot so it would worth to have
> emulation in QEMU. If the SPI connection is required then mcp251xfd
> seems to have chance for lower SPI transfer count overhead nd performance.
> But real SoC bus connected controllers are much better for serious
> project, if you design chip there are more cores available M-CAN,
> GRCAN and even our own CTU CAN FD which has already emulation in QEMU.
> 
> Back to MCP25x1x. I have gone through code and try to understand
> the function. There is lot of connected to the locations in the
> registers maps in the chip
> 
> >   s->ssi_addr = 0x31;

A lot of these where basically used in one place and we map the regs
into internal data structs. Nazar and I have been through and tried
to tidy some of this up and make it more explicit what is being done.

> I have took manual but I think that it would help to add there comments
> with registers names or even use defines for these. But may it be,
> that for the easy ampping in the table and increment logic numbers
> are reasonable option... But comments with register symbolic names
> would help.
> 
> The code does define only single property ("canbus") to select CAN
> bus to connect controller to. Mapping to the SPI peripheral is
> provided by device tree on QEMU side or by some other machine specific
> glue code? Please, can you provide more information for intended
> target use and RPi option to use for testing?

Yes, at the moment it seems that command-line mapping of SSI is not
easy, or well documented? Currently, other than the CS line that is
generally done with the controller, the only ouput needed is the IRQ
line. We do have the RXB0 and RXB1 outputs but they're not really needed
and only there for people to try if they want.

> As for the code, I have read it the first time and for full check
> I would need to spent more time with it. But I expect that
> functionality check with the respect to mcp25x1x datasheet has been
> done mainly by you so the full check bit by bit is not necessary.
> If there is some omitted case it would be (hopefully) found during
> code use. As for generic code style and redability, I see no problem.
> I expect that you have checked for QEMU style and if there has been
> some problem you have propably received QEMU CI and static analysis
> feedback.
> 
> > +static void mcp25625_rx_into_buf(MCP25625State *s,
> > +                                 const qemu_can_frame *frame,
> > +                                 unsigned buffnr, int filthit)
> > +{
> > +    struct rxbuff *rxbuff = &s->rxbuffs[buffnr];
> > +    qemu_canid_t e_id, sidl, id, q_id = frame->can_id;
> > +    unsigned len = frame->can_dlc;
> > +
> 
> I would suggest to check for can_dlc > 8 in this function or in
> its caller (mcp25625_can_receive), to ensure that QEMU cannot be
> attacked by some malformed CAN message from the host kernel
> or other VM...

Ok, added.

> > +static ssize_t mcp25625_can_receive(CanBusClientState *client,
> > +                                    const qemu_can_frame *buf,
> > +                                    size_t frames_cnt)
> > +{
> > +    MCP25625State *s = client_to_mcp(client);
> > +    int ret;
> > +
> > +    /* support receiving only one frame at a time */
> > +    if (frames_cnt != 1) {
> > +        return -1;
> > +    }
> > +
> > +    /* we don't support error frames or buf->flags */
> > +    if (buf->can_id & QEMU_CAN_ERR_FLAG || buf->flags != 0) {
> > +        return -1;
> > +    }
> 
> I see as next step that you provide description/patch etc
> for some target that I can test the code with CAN tools on my
> side. I would prefer connection to some ARM Cortex-A target
> where I have some images t run ready. RISC-V is really interesting
> for me too, so if there is some option to run something
> small, I can try that too. I prefer minimal setup with
> self compilled bysybox in initramfs and the mapping of some
> development directories through virtfs into system.

We did this with a riscv buildroot initramfs with sifive-u machine.

I can see if we can share this and a branch.

> If you plan to visit FOSDEM 2023, we can meet there in person
> at RISC-V devroom and I want to take tour for automotive and other
> areas. Another chance is Embedded World where we plan to show
> CAN latency tester demo with CTU CAN FD and some MCUs... 

Maybe next year.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.


