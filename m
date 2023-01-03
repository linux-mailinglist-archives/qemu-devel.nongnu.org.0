Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E315A65C305
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 16:33:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCjGb-0002Ti-FG; Tue, 03 Jan 2023 10:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pCjGY-0002T8-MY; Tue, 03 Jan 2023 10:31:50 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pCjGW-0002Hp-Gz; Tue, 03 Jan 2023 10:31:50 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 06DDB3200906;
 Tue,  3 Jan 2023 10:31:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 03 Jan 2023 10:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1672759904; x=
 1672846304; bh=6R2nIJpW3gdD/b6WbcvikoTabmrLMmnlDW2fdfIv0J8=; b=d
 BF696sPycwf3Hbma1dz41JOD9aUSdUZ4f8a8WvSW1o5eEjiik0E3dROp1aJH22hZ
 pLCiSyGmcMVCmh+6vO93gmpAQQzSXwEmNTJlz036dgDyigIMC+gGlZhGQBp5q60Z
 7Rlg/xHQksDrzzc9mAq+YiBSnvLMecacYumw6jT05UVv2fifeEr4yJJ1vusUrBdl
 y2pJn37ASnQSYKQPi3F5EsHs2KqtTG96KAFBJ0t634k4djqyid/vwb+ISe24+0bg
 cyRgIadI5326G4GW8ifnToiuv6fhougQ7JxOVf2JDgShv3uvqSIKPDh+k4XNZtGT
 TbX9kVp56sRvml6uzco+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672759904; x=
 1672846304; bh=6R2nIJpW3gdD/b6WbcvikoTabmrLMmnlDW2fdfIv0J8=; b=J
 2u7j2bVwr8lGAg1uP8ZtVWxn96MGwiY2pYc1CFr5amcqh5Jnv5JXXdQHJe1Ll33C
 aNTvBR28Dqj4lILTjS+CUsAA+WytBGKHj07tTfPGhtTlVtZuXIrqQucLgJAmWuj9
 FpudHzigpgDAl7MDvPQukisy4zBdQOHIiPAMXqQg2nVqjsJ1sjJGBhqpWAQB0qc3
 OyClYZr3nrdKc54EolkjHXFL8xOrMDXTdKjoSOa4Wj9S7aZI8AP2ooj0Y4bVQyL+
 kBT7Sd94fOiGRCSGEIuSmn1oy6Of1umNnyoIxQz/OR7Gp38hr303BYhsKQXOLPiP
 HrQDwfJS6d4oCto6q2LMA==
X-ME-Sender: <xms:X0q0Y9nL_HUd6lWjtGzG_752BZr2RY_wm_0CvBEJxAp7klxOb_ocyQ>
 <xme:X0q0Y43dyb0I1tkLVwMVKsS8a5frXUiTaAREM3cakw02iXU2et1AyKSTBxwR_KWe4
 -Zt76hSHsD8N64-DDM>
X-ME-Received: <xmr:X0q0YzpbXKdXyvVWkcaxmMXBgY-0lDwIsWlEuk-INdc2tGoz4DxLPsHzgTC0jNpmRmTzzaAGCOnIXKxD-gR7LA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggdejiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepgfeukefftdeutefgheetffeltdeuhefgheegleefudejfefhffetkedvtdef
 teetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:X0q0Y9lfpOa_FV1ZcC2Z_seTBqEG5H_NC6TS08cfLHutwTf3dB9ahQ>
 <xmx:X0q0Y72Jaag8WCDk_kT3H75AWVcCNG_bc6-k21UDOwjL6E54Jdol4g>
 <xmx:X0q0Y8sP0uc7C9R3QEseuACwu3SQgQysnm36FCWqAtpR6zYeQdGM0w>
 <xmx:YEq0Yy0p8uEGMx9RPbQ1UUGSY5q3qG5aDQK7n_GO8crt-K1fofdqYg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 10:31:41 -0500 (EST)
Date: Tue, 3 Jan 2023 07:31:39 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: "Dong, Eddie" <eddie.dong@intel.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Delevoryas <pdel@fb.com>, Peter Delevoryas <pdel@meta.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 02/11] hw/watchdog/wdt_aspeed: Extend MMIO range to
 cover more registers
Message-ID: <Y7RKWym8vuDKvUIr@pdel-mbp.dhcp.thefacebook.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-3-philmd@linaro.org>
 <BL0PR11MB30427F00C5A2058197E9B6488AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
 <19cb9a03-c98e-cdff-1474-2db0c55ae971@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19cb9a03-c98e-cdff-1474-2db0c55ae971@kaod.org>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=peter@pjd.dev;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

On Mon, Jan 02, 2023 at 02:31:31PM +0100, Cédric Le Goater wrote:
> On 12/31/22 23:52, Dong, Eddie wrote:
> > > When booting the Zephyr demo in [1] we get:
> > > 
> > >    aspeed.io: unimplemented device write (size 4, offset 0x185128, value
> > > 0x030f1ff1) <--
> > >    aspeed.io: unimplemented device write (size 4, offset 0x18512c, value
> > > 0x03fffff1)
> > > 
> > > This corresponds to this Zephyr code [2]:
> > > 
> > >    static int aspeed_wdt_init(const struct device *dev)
> > >    {
> > >      const struct aspeed_wdt_config *config = dev->config;
> > >      struct aspeed_wdt_data *const data = dev->data;
> > >      uint32_t reg_val;
> > > 
> > >      /* disable WDT by default */
> > >      reg_val = sys_read32(config->ctrl_base + WDT_CTRL_REG);
> > >      reg_val &= ~WDT_CTRL_ENABLE;
> > >      sys_write32(reg_val, config->ctrl_base + WDT_CTRL_REG);
> > > 
> > >      sys_write32(data->rst_mask1,
> > >                  config->ctrl_base + WDT_SW_RESET_MASK1_REG);   <------
> > >      sys_write32(data->rst_mask2,
> > >                  config->ctrl_base + WDT_SW_RESET_MASK2_REG);
> > > 
> > >      return 0;
> > >    }
> > > 
> > > The register definitions are [3]:
> > > 
> > >    #define WDT_RELOAD_VAL_REG          0x0004
> > >    #define WDT_RESTART_REG             0x0008
> > >    #define WDT_CTRL_REG                0x000C
> > >    #define WDT_TIMEOUT_STATUS_REG      0x0010
> > >    #define WDT_TIMEOUT_STATUS_CLR_REG  0x0014
> > >    #define WDT_RESET_MASK1_REG         0x001C
> > >    #define WDT_RESET_MASK2_REG         0x0020
> > >    #define WDT_SW_RESET_MASK1_REG      0x0028   <------
> > >    #define WDT_SW_RESET_MASK2_REG      0x002C
> > >    #define WDT_SW_RESET_CTRL_REG       0x0024
> > > 
> > > Currently QEMU only cover a MMIO region of size 0x20:
> > > 
> > >    #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
> > > 
> > > Change to map the whole 'iosize' which might be bigger, covering the other
> > 
> > The root cause is that ASPEED_WDT_REGS_MAX is too small, right?
> > Probably the Qemu is emulating an old version of the hardware.
> > 
> > Given the meaning of ASPEED_WDT_REGS_MAX, it should be larger than iosize, not?
> > Probably ASPEED_WDT_REGS_MAX should be per device type (aspeed_2400/2500),
> 
> yes. We would need a new class attribute for it. Please use these values, they
> should be correct.
> 
>            #regs    iosize
> 
> AST2400   0x18/4      0x20
> AST2500   0x20/4      0x20

I think only one additional register was added in the AST2500, bringing it to 0x1C.

> AST2600   0x30/4      0x40
> AST1030   0x4C/4      0x80

I know the Zephyr driver for the AST1030 directly from Aspeed is claiming that
the iosize is 0x80, but the datasheet I have says it's only 0x40. And, that the
#regs would still just be 0x30/4. Afaik the AST2600 and AST1030 should have the
exact same peripheral.

Peter

> 
> 
> AFAICT, the WDT logic was changed in a compatible way with the previous generation.
> 
> Thanks
> 
> C.
> 
> > while iosize is for all devices, and its initial value comes from the per device type REGS_MAX.
> > 
> > > registers. The MemoryRegionOps read/write handlers will report the accesses
> > > as out-of-bounds guest-errors, but the next commit will report them as
> > > unimplemented.
> > > 
> > > [1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
> > > [2] https://github.com/AspeedTech-BMC/zephyr/commit/2e99f10ac27b
> > > [3] https://github.com/AspeedTech-
> > > BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31
> > > 
> > > Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > ---
> > >   hw/watchdog/wdt_aspeed.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c index
> > > 958725a1b5..eefca31ae4 100644
> > > --- a/hw/watchdog/wdt_aspeed.c
> > > +++ b/hw/watchdog/wdt_aspeed.c
> > > @@ -260,6 +260,7 @@ static void aspeed_wdt_realize(DeviceState *dev,
> > > Error **errp)  {
> > >       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> > >       AspeedWDTState *s = ASPEED_WDT(dev);
> > > +    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(dev);
> > > 
> > >       assert(s->scu);
> > > 
> > > @@ -271,7 +272,7 @@ static void aspeed_wdt_realize(DeviceState *dev,
> > > Error **errp)
> > >       s->pclk_freq = PCLK_HZ;
> > > 
> > >       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
> > > -                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
> > > +                          TYPE_ASPEED_WDT, awc->iosize);
> > >       sysbus_init_mmio(sbd, &s->iomem);
> > >   }
> > > 
> > > --
> > > 2.38.1
> > > 
> > 
> 

