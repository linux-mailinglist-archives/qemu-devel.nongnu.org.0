Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9769B4133FB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 15:23:06 +0200 (CEST)
Received: from localhost ([::1]:39324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSfjl-0004zk-7I
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 09:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSfib-00046n-Ns
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:21:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSfiZ-0003OY-F8
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:21:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q26so39076193wrc.7
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LVent6tBEZOYvocvaNsg2R0U+fsvZwB/53sqr23aNrM=;
 b=tSXP4ze3HfDwYlPZOz5CI/XDgmiNJTJm/kEeAyX5Z8BXCcnqvAyF1nSzTHHnMk8oRA
 K9jHs1ImLG0GrAlXDFQuRttWdXq1fa7xnbaFot1kh+Q3pfrpaucN7vd9DoGB7Buni6n8
 83+6+IoYADnBCoh6lgk3+dQnCd8lG0jzpcerhfXMtK/H4vSBh0mBUTvrLSWshfbxniwz
 zCB6j2Wkl5Z206Qn3y73FSKWJzkLlxBnodDPfG6qVskIYsDIrgPMQRQprVaWPDvFevM7
 4Ci2gDbZAQnyWzDNWl5uKEHQ6t59SDDZrJpJJGezEuYAx+3q719uCpTY/PpockA2TkSI
 jezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LVent6tBEZOYvocvaNsg2R0U+fsvZwB/53sqr23aNrM=;
 b=EDB82ihpVBfOr28RJ6J1SoYHJEN1ifJN+hDTEXF+8a3Brr50Q0UYNXvgaYSs/zSuOg
 I4fl1IkYP7dPQAzChvsB++q3omZqjRp/aPJ9OMt62g1oKNSTXbV2YhojGQRH9CchYG9B
 9kXKtdjsSBpV48lVhbpUyD14AV2KisHUl7bxXnMXqXnlbPVVqcUMUgHc/2g4QWIY+MrR
 tENVAGXb8Gjdk+9Icbrwxl0hQkcYrU+lw+keWPb+uRYpqIMQFMU95CWZzCmz6M5tOHR1
 D6GEkgm1fWUUdpOvSp9ixchJZWwHbV2ZNAyxQhz0pU3SeGuY/PIFqg52b3xhmonHqGsr
 194g==
X-Gm-Message-State: AOAM5333VyLfr48fLrjGC4FxNq84smFGvVfopGNT731i4H4RpF+d2EVp
 Az3b4BTDpuR0zDYMvdxJiLVLHTNxD+0Y11huDlvFLQ==
X-Google-Smtp-Source: ABdhPJyJSqKWYJ1N+eL7ZdW67HvcFn77Er7rirjyEjSGeHxjpizrzdfD1dr/nRUPPc4qcDGMOorimZbxhNTOqRVbvdM=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr34419577wrq.263.1632230509362; 
 Tue, 21 Sep 2021 06:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
 <87czq0l2mn.fsf@dusky.pond.sub.org>
 <CAFEAcA-1cGjt54XDEmKiDctySW4zdQptoc2taGp0XxMOtKvGCw@mail.gmail.com>
 <87mtoe4g40.fsf@dusky.pond.sub.org>
In-Reply-To: <87mtoe4g40.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 14:20:57 +0100
Message-ID: <CAFEAcA_ExFiv3AurBAtTan10yuXRnsHMQS0yHa-vJpwB9u4HoA@mail.gmail.com>
Subject: Re: ensuring a machine's buses have unique names
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 05:28, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I'm not sure how best to sort this tangle out. We could:
> >  * make controller devices pass in NULL as bus name; this
> >    means that some bus names will change, which is an annoying
> >    breakage but for these minor bus types we can probably
> >    get away with it. This brings these buses into line with
> >    how we've been handling uniqueness for ide and scsi.
>
> To gauge the breakage, we need a list of the affected bus names.

Looking through, there are a few single-use or special
purpose buses I'm going to ignore for now (eg vmbus, or
the s390 ones). The four big bus types where controllers
often specify a bus name and override the 'autogenerate
unique name' handling are pci, ssi, sd, and i2c. (pci mostly
gets away with it I expect by machines only having one pci
bus.) Of those, I've gone through i2c. These are all the
places where we create a specifically-named i2c bus (via
i2c_init_bus()), together with the affected boards:

   hw/arm/pxa2xx.c
    - the PXA SoC code creates both the intended-for-use
      i2c buses (which get auto-names) and also several i2c
      buses intended for internal board-code use only which
      are all given the same name "dummy".
      Boards: connex, verdex, tosa, mainstone, akita, spitz,
      borzoi, terrier, z2
   hw/arm/stellaris.c
    - The i2c controller names its bus "i2c". There is only one i2c
      controller on these boards, so no name conflicts.
      Boards: lm3s811evb, lm3s6965evb
   hw/display/ati.c
    - The ATI VGA device has an on-board i2c controller which it
      connects the DDC that holds the EDID information. The bus is
      always named "ati-vga.ddc", so if you have multiple of this
      PCI device in the system the buses have the same names.
   hw/display/sm501.c
    - Same as ATI, but the bus name is "sm501.i2c"
   hw/i2c/aspeed_i2c.c
    - This I2C controller has either 14 or 16 (!) different i2c
      buses, and it assigns them names "aspeed.i2c.N" for N = 0,1,2,...
      The board code mostly seems to use these to wire up various
      on-board i2c devices.
      Boards: palmetto-bmc, supermicrox11-bmc, ast2500-evb, romulus-bmc,
      swift-bmc, sonorapass-bmc, witherspoon-bmc, ast2600-evb,
      tacoma-bmc, g220a-bmc, quanta-q71l-bmc, rainier-bmc
   hw/i2c/bitbang_i2c.c
    - the "GPIO to I2C bridge" device always names its bus "i2c".
      Used only on musicpal, which only creates one of these buses.
      Boards: musicpal
   hw/i2c/exynos4210_i2c.c
    - This i2c controller always names its bus "i2c". There are 9
      of these controllers on the board, so they all have clashing
      names.
      Boards: nuri, smdkc210
   hw/i2c/i2c_mux_pca954x.c
    - This is an i2c multiplexer. All the child buses are named
      "i2c-bus". The multiplexer is used by the aspeed and npcm7xx
      boards. (There's a programmable way to get at individual
      downstream i2c buses despite the name clash; none of the boards
      using this multiplexer actually connect any devices downstream of
      it yet.)
      Boards: palmetto-bmc, supermicrox11-bmc, ast2500-evb, romulus-bmc,
      swift-bmc, sonorapass-bmc, witherspoon-bmc, ast2600-evb,
      tacoma-bmc, g220a-bmc, quanta-q71l-bmc, rainier-bmc,
      npcm750-evb, quanta-gsj, quanta-gbs-bmc, kudo-bmc
   hw/i2c/mpc_i2c.c
    - This controller always names its bus "i2c". There is only one
      of these controllers in the machine.
      Boards: ppce500, mpc8544ds
   hw/i2c/npcm7xx_smbus.c
    - This controller always names its bus "i2c-bus". There are multiple
      controllers on the boards. The name also clashes with the one used
      by the pca954x muxes on these boards (see above).
      Boards: npcm750-evb, quanta-gsj, quanta-gbs-bmc, kudo-bmc
   hw/i2c/pm_smbus.c
    - This is the PC SMBUS implementation (it is not a QOM device...)
      The bus is always called "i2c".
      Boards: haven't worked through; at least all the x86 PC-like
      boards, I guess
   hw/i2c/ppc4xx_i2c.c
    - This controller always names its bus "i2c". The taihu and
      ref405ep have only one controller, but sam460ex has two which
      will have non-unique names.
      Boards: taihu, ref405ep, sam460ex
   hw/i2c/versatile_i2c.c
    - This controller always names its bus "i2c". The MPS boards all
      have multiples of this controller with clashing names; the others
      have only one controller.
      Boards: mps2-an385, mps2-an386, mps2-an500, mps2-an511,
      mps2-an505, mps2-an521, mps3-an524, mps3-an547,
      realview-eb, realview-eb-mpcore, realview-pb-a8, realview-pbx-a9,
      versatileab, versatilepb, vexpress-a9, vexpress-a15

In a lot of these cases I suspect the i2c controllers are
provided either to allow connection of various internal-to-the-board
devices, or simply so that guest OS bootup code that initializes
the i2c controller doesn't fall over. However since there's
nothing stopping users from creating i2c devices themselves
on the commandline, some people might be doing that.

In some of these cases (eg the i2c bus on the ATI VGA driver)
I suspect the desired behaviour is "unique bus name based on
a standard template, eg 'ati-vga.ddc.0/1/...'. It sounds like
we can't do that, though. (Also they probably don't want to
permit users to command-line plug i2c devices into it...)

thanks
-- PMM

