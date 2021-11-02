Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D564442B61
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 11:08:54 +0100 (CET)
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqir-0007nZ-Gj
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 06:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>) id 1mhqhJ-0006Gb-DC
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:07:19 -0400
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2]:49633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>) id 1mhqhG-0000i2-SQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:07:17 -0400
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BD8E52222E;
 Tue,  2 Nov 2021 11:07:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1635847628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsVP6E1MSmS9FaF8CK6Ihh9PQr9Adyu8zGkRTCWOLLY=;
 b=iFxGPDCW9XQj0EJVLxnVhriAO8SAIkLL/vwEhnI7T3G6rRVoUW8SSX4/EGsDg97QX/59A1
 kBDKIrTzofFCMvuNYAvEn0vLXTvJ44j+5WjY3F3fr1XLPjQJQifOqFI69HUawo9m9hg8p9
 64WTXJ/8EDWPWSD6YS0hXYVdYwDI0ZM=
From: Michael Walle <michael@walle.cc>
To: ilias.apalodimas@linaro.org
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Date: Tue,  2 Nov 2021 11:06:59 +0100
Message-Id: <20211102100659.2397019-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAC_iWjLDieo9d9uOVGpxEqEMYn+O=GEzdMwPEYmT2kswMVPi_g@mail.gmail.com>
References: <CAC_iWjLDieo9d9uOVGpxEqEMYn+O=GEzdMwPEYmT2kswMVPi_g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:151:8464::1:2;
 envelope-from=michael@walle.cc; helo=ssl.serverraum.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: liviu.dudau@foss.arm.com, narmstrong@baylibre.com, rick@andestech.com,
 vladimir.oltean@nxp.com, linus.walleij@linaro.org, fitzsim@fitzsim.org,
 kever.yang@rock-chips.com, seanga2@gmail.com, atish.patra@wdc.com,
 zong.li@sifive.com, sr@denx.de, festevam@gmail.com,
 rainer.boschung@hitachi-powergrids.com, francois.ozog@linaro.org,
 swarren@nvidia.com, oleksandr_andrushchenko@epam.com, xypron.glpk@gmx.de,
 lusus@denx.de, michal.simek@xilinx.com, marek.behun@nic.cz,
 vanbaren@cideas.com, rfried.dev@gmail.com, jagan@amarulasolutions.com,
 valentin.longchamp@hitachi-powergrids.com, hs@denx.de, pbrobinson@gmail.com,
 sinan@writeme.com, bin.meng@windriver.com, wd@denx.de, swarren@wwwdotorg.org,
 andre.przywara@arm.com, tharvey@gateworks.com, ashok.reddy.soma@xilinx.com,
 qemu-devel@nongnu.org, agraf@csgraf.de, green.wan@sifive.com,
 t.karthik.reddy@xilinx.com, anastasiia_lukianenko@epam.com,
 albert.u.boot@aribaud.net, monstr@monstr.eu, mbrugger@suse.com,
 ycliang@andestech.com, kristo@kernel.org, u-boot@lists.denx.de,
 david.abdurachmanov@sifive.com, priyanka.jain@nxp.com, sjg@chromium.org,
 christianshewitt@gmail.com, awilliams@marvell.com, tuomas.tynkkynen@iki.fi,
 heinrich.schuchardt@canonical.com, tianrui-wei@outlook.com, bmeng.cn@gmail.com,
 pali@kernel.org, trini@konsulko.com, dimitri.ledkov@canonical.com,
 padmarao.begari@microchip.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

> On Thu, 28 Oct 2021 at 05:51, Simon Glass <sjg@chromium.org> wrote:
> > On Tue, 26 Oct 2021 at 00:46, Ilias Apalodimas
> > <ilias.apalodimas@linaro.org> wrote:

..

> > Linux actually doesn't care if the U-Boot properties are in the tree,
> > so long as we have proper bindings. My point here is we only need
> > either:
> >
> > a. one devicetree, shared with Linux and U-Boot (and TF-A?)
> > b. two devicetrees, one for use in firmware and one for passing to Linux
> >
> > We don't need to separate out the U-Boot properties into a second (or
> > third) devicetree. There just isn't any point.
> 
> Again if we are talking about bindings that are upstream in the spec,
> then we agree.  Depending on the SRAM limitation we can even do (a).
> If the vendor messes up the DT backwards compatibility then we can do
> (b).  If you expect TF-A and FIP to go pick up the special bindings
> U-Boot needs, then we disagree.

*puts developer at board vendor hat on* Sometimes (personally I'd say
usually) it isn't possible to have a backwards compatible tree. Also,
like it or not, in the device tree there *are* configuration options
which are not hardware dependent (eg. internal ethernet connection on
the ls1028a). So a vendor doesn't necessarily need to "mess things up"
to need (b). And as you know, my point is, that this device tree has
to come from the distribution, it must not be compiled in into the
firmware.

I feel like I've repeated this far too many times. Therefore, this
will be my last comment about it and I would really like to see that
this - very real - scenario is treated as a valid use case and will be
supported in your systemready vision.

-michael

