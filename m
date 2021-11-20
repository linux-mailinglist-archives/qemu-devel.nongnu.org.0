Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C764580FA
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 00:40:04 +0100 (CET)
Received: from localhost ([::1]:48460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moZxj-0003j0-3S
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 18:40:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1moZwm-0002nO-Mu; Sat, 20 Nov 2021 18:39:04 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:40651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1moZwk-0005ND-5M; Sat, 20 Nov 2021 18:39:04 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4054A320091B;
 Sat, 20 Nov 2021 18:38:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 20 Nov 2021 18:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ny25jd
 zcivLuTIqn4a0R9QkKjd8ZVxKCwB8GTbwgPrM=; b=Q4VUY28N/yZFApXOO7o4UE
 /elRl89eFFVzOoBOPnPZiKVktjPhpyEw1h272x8Akyvyycc8LJMKaldQ3o+ZJEFy
 Wzbw6M1pmMCxuaoYB589TBbyYzta2rxsa7dwGsBosgUPaxYXczXDQlLDZMI41yG0
 xX7wHRFMGSW/8g8G1jYNx968D5cjLwUV123hR/t0uveVI7KaaPHWLtSkCttfSvcp
 ELLSPyi11dt9OmbgsZQWFNC7u3Ri22hP766XozW+N0hSn8DaXav2oZUbGYOTJ6P4
 va1AoZ4klcwZcmybLEByjliUKwhQRulpiFEPzZE1qqf1hERQn4M+UvamxaNI6ahQ
 ==
X-ME-Sender: <xms:D4eZYd9xKBXs7uGVTOufFQikGzaefBxWFGRBZLFJnlZ634RMFPZJYA>
 <xme:D4eZYRvyEPwls8I_CyPpRRXjasqSTq-k_IVwPii-i1yX-sCI0-vEZy19jxms3nhKl
 obVR3iJn7JpMc-dQZk>
X-ME-Received: <xmr:D4eZYbCv_x68DUffXiqmMjRoAtyo0O5T8_jODl6olJCn7rqaeioceX0RrO7KC6UHW4VVFd5RJIEJy3xo3O8IeWcXwVGIybLAXOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgedugddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpefhkeevueeivddtffetvedtgfehudekffettdegudfgleethfefudefffffvdfh
 teenucffohhmrghinhepghhnuhdrohhrghdpghhithhlrggsrdgtohhmnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhn
 uhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:D4eZYRda2cX2JbCsMWeaQQBB12HIJ1X9cEhVoQRT7V0_YXcX-6WKAg>
 <xmx:D4eZYSPK878Vhchz90wCX7Rbqfv9pTAUO_ppyXfJmcizHVZ5UWBZfA>
 <xmx:D4eZYTkfk_W8lx6s_AgLFb2pVI2AFO25gUmwzSN6SQLKFh3aE-wD7w>
 <xmx:D4eZYfrSQNhjKSwbefN6Ay6Y1tVvJsSjJ91hCFcWJekxrGqPWQQiZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Nov 2021 18:38:54 -0500 (EST)
Date: Sun, 21 Nov 2021 10:38:50 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Laurent Vivier <laurent@vivier.eu>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 0/9] hw/mos6522: VIA timer emulation fixes and
 improvements
In-Reply-To: <74d1f17a-d414-8cda-6720-a62617613215@ilande.co.uk>
Message-ID: <8b1022bd-f4ae-d0bd-3f22-425da56ef753@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
 <e0411348-abd7-3db9-b5bd-8f1d52c1226f@linux-m68k.org>
 <2fb3d9f8-0f20-082d-d9f1-ab2984356866@ilande.co.uk>
 <ad537ce9-ec40-b5e4-bb32-5f53e42db29@linux-m68k.org>
 <74d1f17a-d414-8cda-6720-a62617613215@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=64.147.123.21; envelope-from=fthain@linux-m68k.org;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Nov 2021, Mark Cave-Ayland wrote:

> On 19/11/2021 08:39, Finn Thain wrote:
> 
> > On Thu, 18 Nov 2021, Mark Cave-Ayland wrote:
> > 
> >>
> >> Hi Finn,
> >>
> >> I've not forgotten about this series - we're now in 6.2 freeze, but it's
> >> on my TODO list to revisit in the next development cycle this along with
> >> the ESP stress-ng changes which I've also been looking at. As mentioned
> >> in my previous reviews the patch will need some further analysis:
> >> particularly the logic in mos6522_read() that can generate a spurious
> >> interrupt on a register read needs to be removed,
> > 
> > If mos6522 fails to raise its IRQ then the counter value observed by the
> > guest will not make sense. This relationship was explained in the
> > description of patch 8. If you have a problem with that patch, please
> > reply there so that your misapprehension can be placed in context.
> 
> It is the existing code in mos6522_read() which is doing the wrong thing here,
> which I mentioned in
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02883.html.
> 

How disingenous. I responded to that message 2 months ago and you 
completely ignored my response.

Basically, you found a bug in your own modified version of mainline code, 
and you claimed that this is somehow relevant to this patch series. 
(Apparently you failed to find that bug in my code.)

Once again, if you have an objection to existing code in mainline QEMU, 
please take it up with the author of that code (commit cd8843ff25) which 
is Laurent.

This patch series is a separate issue. It doesn't add anything 
objectionable (commit cd8843ff25 was not objected to), it fixes bugs, 
improves emulation fidelity, improves performance and reduces guest 
malfunctions.

> 
> That is true, but as per the link above there is an existing bug in the 
> mos6522 device, and the patchset builds on this in its current form, 
> including adding a state field which shouldn't be required.
> 

The state enum is required for the oneshot feature (patch 9). It is also 
needed to produce the correct relationship between irq and counter (patch 
8), and between interrupt flag set and clear operations. Finally, it is 
also useful for debugging purposes.

> From looking at mac_read_clk() presumably the problem here is that the 
> timer IRQ fires on 0 rather than on 0xffff when it overflows? 

Guests depend on the correct relationship between timer irq flag and timer 
counter value. If QEMU can't get that right, the Linux clocksource can't 
work without race conditions. This problem is almost certain to affect 
other guests too.

You are being foolish to insist that this is somehow a Linux quirk.

> If so, this should be a very small and simple patch. Once these 2 fixes 
> are in place, it will be much easier to test the remaining changes.
> 
> >> I realized that I could easily cross-compile a 5.14 kernel to test 
> >> this theory with the test root image and .config you supplied at 
> >> https://gitlab.com/qemu-project/qemu/-/issues/611 using the QEMU 
> >> docker-m68k-cross image to avoid having to build a complete toolchain 
> >> by hand. The kernel builds successfully using this method, but during 
> >> boot it hangs sending the first SCSI CDB to the ESP device, failing 
> >> to send the last byte using PDMA.
> >>
> >> Are there known issues cross-compiling an m68k kernel on an x86 host?
> > 
> > Not that I'm aware of.
> > 
> >> Or are your current kernels being built from a separate branch 
> >> outside of mainline Linux git?
> >>
> > I use mainline Linux when testing QEMU. I provided a mainline build, 
> > attached to the same bug report, so you don't have to build it.
> 
> The problem here is that I have no way to reproduce your results and 
> test any patches other than to try and build a kernel with your extra 
> warning and run it.

Nonsense. Any programmer can easily observe the gettimeofday problem. Just 
run it in a loop. (How else would you establish monotonicity?)

Similarly, anyone who can understand mos6522.c and can read patches could 
easily add assertions to establish any of the deficiencies claimed in 
these patches.

The problem isn't that you "have no way to reproduce results". The problem 
is that you are unwilling or unable to understand the datasheet and the 
patches.

> Even then I don't know how long to wait for the clock to jump, how much 
> it jumps by, or if there is anything else that needs to be done to 
> trigger the warning.
> 
> Any help with being able to build a working cross-m68k kernel to test 
> this would be gratefully received, otherwise I don't feel I have enough 
> knowledge of the m68k kernel to be able to validate the fixes and review 
> the changes in order to merge them.
> 

I've already helped you by supplying a mainline vmlinux binary. But you 
don't even need that. If you don't believe what I've said about mos6522.c 
behaviour, just install Debian/m68k.

Anyway, thanks for taking the time to write. A competent reviewer has to 
do much more than that, but I'm not paying for competence so I suppose I'm 
asking too much.

The absence of constructive review over the last few months is partly the 
result of get_maintainer.pl directing this submission to the wrong inbox. 
Phillippe, Laurent, please consider the following patch as well.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c1..f2e0ca8bbd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1285,11 +1285,9 @@ F: hw/ppc/mac_newworld.c
 F: hw/pci-host/uninorth.c
 F: hw/pci-bridge/dec.[hc]
 F: hw/misc/macio/
-F: hw/misc/mos6522.c
 F: hw/nvram/mac_nvram.c
 F: hw/input/adb*
 F: include/hw/misc/macio/
-F: include/hw/misc/mos6522.h
 F: include/hw/ppc/mac_dbdma.h
 F: include/hw/pci-host/uninorth.h
 F: include/hw/input/adb*

