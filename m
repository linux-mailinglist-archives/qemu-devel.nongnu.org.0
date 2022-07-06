Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A88F5680A3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:59:30 +0200 (CEST)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8zwV-0004Bh-Jb
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8zri-0000ws-8J; Wed, 06 Jul 2022 03:54:30 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:37113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8zrf-0000lx-2k; Wed, 06 Jul 2022 03:54:28 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id F02B0580390;
 Wed,  6 Jul 2022 03:54:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 06 Jul 2022 03:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657094064; x=
 1657097664; bh=wwccHhIdKJ7Xo3BI/vgjJh2BXuIkho9XF53TmGUoZv0=; b=a
 myFcEyvoEtyfN6a2rVHDCF9LM+vhQQT0A3whiLMS2UK8b+0WnwImg76jBz4q7SIf
 YOsmMVJEnMtBsgMIV7cukR4Phj2pBkMzrkKueEHZtThf+PboR+RhiGgWDURMRyS/
 1sl7z1nTiQuMFRJqN/u2Up++B5ammkIBihoF4+QgieEUZEO7EQb+16wKCzR7R9bK
 xohBmFaQ7MPWaluookB4ibjoCe2qYwpzepW6MUohB3K/kbcQhu0pxIS6nZ2Akrif
 dlkrfeFI/79eZ2SuahjlbVGNCyIXrDeqIQDzozWhipc9WvwcHe2ynp8O9N+TV+Xn
 bHFWS/EGX4V3v7MM10CvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657094064; x=
 1657097664; bh=wwccHhIdKJ7Xo3BI/vgjJh2BXuIkho9XF53TmGUoZv0=; b=C
 cwE58xRYwagNvcWNz1hkMVYxFbRwL3KcPqYCPhUG/fs/21H/Ey4K52OY3kECwGQ5
 ea+5qEGrY+uL6Q/kUv7NPk0QpvaWxk3Haj370eFcP7bmN+HpQ8teq3c2Snd8QakK
 LPHczlxkVxUClZAzCmvS1r6IPofDXhM3S8e1zcstbQ/hjYid8/jAFSycOiVVvlOP
 r7qxbTXdZoz6eMFFk9oTanCEyz+SqbXpUwLnD+J39u8hC3U9PbXS2+mW84oazVWx
 rElBE5Mz5daWacWsivWNsclCqjMlPM0dbJr/FSjqHGiHd9qhtqzaIkAAVCexUfkq
 cCWbTi9a33U3ShBWTmn4g==
X-ME-Sender: <xms:sD_FYpU6DaUpW-LAyQlJf8Qb3uceV-acrt54kqvrsB-Ic5rY-x39wQ>
 <xme:sD_FYpnrlahLG1FFJAsdvl4yeig8JZGFAcoiAZcJ91a-gTCecZ3O9e_7dkdnDE72a
 XSaQZaZSi_-9O5B344>
X-ME-Received: <xmr:sD_FYlYe7U_JhV09tQcujo1VtepOXusUuWvRT-tIudwnNxE4L_-uTgIlDl2udYgSHPs5gua_vvJWVUk2jXulzBt6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeivddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfettddtvdehfffggfejffduvedvudejhfduvddthfetheefhfdtvdei
 ffekveeinecuffhomhgrihhnpehophgvnhgtohhmphhuthgvrdhorhhgpdhgihhthhhusg
 drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:sD_FYsWaYuGzs6J1AEESB2j9RM1xajVdyY0Gxt9gI9_Bcgnm8tNajQ>
 <xmx:sD_FYjmo6E3FcCRc5P7ZWcQs7lrpWpnyBTSXs7H7qfXMvrQwR3UnYA>
 <xmx:sD_FYpdypTaYn3lyWggAP9rhbinfvaLQwKMHOzZ8rBwMOemnBql4DA>
 <xmx:sD_FYsAd2z8VOJlmvvzVUqEbdmBneh5yp91U9lugvRtuddVogxf7oA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 03:54:23 -0400 (EDT)
Date: Wed, 6 Jul 2022 00:54:20 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 9/9] docs: aspeed: Add fby35 multi-SoC machine section
Message-ID: <YsU/rDGHHrwl5E4t@r37>
References: <20220705191400.41632-1-peter@pjd.dev>
 <20220705191400.41632-10-peter@pjd.dev>
 <6dc63502-11ae-633a-a9a0-90f0fe32e808@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dc63502-11ae-633a-a9a0-90f0fe32e808@kaod.org>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 06, 2022 at 07:58:44AM +0200, Cédric Le Goater wrote:
> On 7/5/22 21:14, Peter Delevoryas wrote:
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> I fixed inline the URL links and moved the section at the end of the file.
> 
> Thanks,
> 
> C.

Thanks for that!

> 
> > ---
> >   docs/system/arm/aspeed.rst | 48 ++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 48 insertions(+)
> > 
> > diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> > index 5d0a7865d3..b233191b67 100644
> > --- a/docs/system/arm/aspeed.rst
> > +++ b/docs/system/arm/aspeed.rst
> > @@ -136,6 +136,54 @@ AST1030 SoC based machines :
> >   - ``ast1030-evb``          Aspeed AST1030 Evaluation board (Cortex-M4F)
> > +Facebook Yosemite v3.5 Platform and CraterLake Server (``fby35``)
> > +==================================================================
> > +
> > +Facebook has a series of multi-node compute server designs named
> > +Yosemite. The most recent version released was
> > +`Yosemite v3 <https://www.opencompute.org/documents/ocp-yosemite-v3-platform-design-specification-1v16-pdf>`.
> > +
> > +Yosemite v3.5 is an iteration on this design, and is very similar: there's a
> > +baseboard with a BMC, and 4 server slots. The new server board design termed
> > +"CraterLake" includes a Bridge IC (BIC), with room for expansion boards to
> > +include various compute accelerators (video, inferencing, etc). At the moment,
> > +only the first server slot's BIC is included.
> > +
> > +Yosemite v3.5 is itself a sled which fits into a 40U chassis, and 3 sleds
> > +can be fit into a chassis. See `here <https://www.opencompute.org/products/423/wiwynn-yosemite-v3-server>`
> > +for an example.
> > +
> > +In this generation, the BMC is an AST2600 and each BIC is an AST1030. The BMC
> > +runs `OpenBMC <https://github.com/facebook/openbmc>`, and the BIC runs
> > +`OpenBIC <https://github.com/facebook/openbic>`.
> > +
> > +Firmware images can be retrieved from the Github releases or built from the
> > +source code, see the README's for instructions on that. This image uses the
> > +"fby35" machine recipe from OpenBMC, and the "yv35-cl" target from OpenBIC.
> > +Some reference images can also be found here:
> > +
> > +.. code-block:: bash
> > +
> > +    $ wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
> > +    $ wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
> > +
> > +Since this machine has multiple SoC's, each with their own serial console, the
> > +recommended way to run it is to allocate a pseudoterminal for each serial
> > +console and let the monitor use stdio. Also, starting in a paused state is
> > +useful because it allows you to attach to the pseudoterminals before the boot
> > +process starts.
> > +
> > +.. code-block:: bash
> > +
> > +    $ qemu-system-arm -machine fby35 \
> > +        -drive file=fby35.mtd,format=raw,if=mtd \
> > +        -device loader,file=Y35BCL.elf,addr=0,cpu-num=2 \
> > +        -serial pty -serial pty -serial mon:stdio \
> > +        -display none -S
> > +    $ screen /dev/tty0 # In a separate TMUX pane, terminal window, etc.
> > +    $ screen /dev/tty1
> > +    $ (qemu) c		   # Start the boot process once screen is setup.
> > +
> >   Supported devices
> >   -----------------
> 

