Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1437567973
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 23:42:50 +0200 (CEST)
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8qJl-0005iJ-Km
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 17:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8qHi-00045z-F3; Tue, 05 Jul 2022 17:40:42 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:54345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8qHg-0005ck-Cc; Tue, 05 Jul 2022 17:40:42 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 56DB558026F;
 Tue,  5 Jul 2022 17:40:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 05 Jul 2022 17:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1657057235; x=1657060835; bh=NjR/aen/ig
 s1bLr9UqKEIizfe1aZB4/04uwLBEmDpfM=; b=g/8dFm2o5Cu6BxZx+hGu8OsdC2
 fAvqV+cCwfT4sPIBho3zgjoRtmjHjU+loAOD/lMxH1cX89b8h5ShyN3ynkRnetbD
 0SQjsh1Tw+barrz6RZoPZPU0FuXA3xHK3jBl07RJbfz5LhVOweVGYwkYmnMlDp2K
 HA0x8TrWizzVPuRqFV2OGIoSZLSpJrznfLCpxzTEdYwvIt04rYE4C50D4bEo2rbb
 rytOT/0LdVpxuyi15/ExxcQUGjF4frjasCbIo6mFFuLxtKRZyJg4CSs1Z9bv4XMW
 Dr+t/kT8H7xyaVPoNLeLRMI16mwq8oFJgU4x22RJzeGxxVqVGoqrHqGQPAUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 i9e814621.fm2; t=1657057235; x=1657060835; bh=NjR/aen/igs1bLr9Uq
 KEIizfe1aZB4/04uwLBEmDpfM=; b=Gq62DLPpFLPKlnJEeVvBrtC0YDXd890Bon
 HeYXibsMZ5WiJOt06857lBJ0N1AfVMrS30RcjvL75N/ZU5WHRYmxKyfmq+J66+/V
 OExna2Vg70DApEDWkm+hJzlD1wCDnvnESTBlNe4XqMGiRrKCoCZHbKVlrZj3Qk5s
 yOSM7dJ2h8iNt/N1eSVNxZcV3rp8c9oyBYmlSWAGwTKTEk97UlxbKIzHBG6svVnD
 lC6LMGemSd3RG/PBtAIC4SB+9YTk89OVtYwvBQzfTR3DY+IWWauaMNSRZD7FBqTH
 Ut4SxaAAy3D3mEU0YA9Zbiy7N9GvjpbvH1O6ROLibA8q2YyXyP7A==
X-ME-Sender: <xms:0q_EYu3S74m3MIZ-fDQdN3OpBMnOK9FU_RDdmmDWzQm0pwYnVOiTfw>
 <xme:0q_EYhHZD3Paimr4FIlxzS1_6FLz5Zeb_vsLd4ViPVeY8zhWhhCboDd4C_RS-PfkG
 jqiiimYMUfxje61qBY>
X-ME-Received: <xmr:0q_EYm4K0QthKjn2BP2yZD_A77Uua2PluDdCG5-ysJu4M7ftXeR_3DnHECvLd4JrOm91LPRlRZrU21Y9btg0vEly>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudeilecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeevgfehgedvvdekveeifeekjeduueetieegvdeitedvffdvgffhjeekveek
 tdehfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:0q_EYv2wqx1RNUQaWOE4uz_8wa8JbZQW8yQZfgyshYIWiBhgHaGxew>
 <xmx:0q_EYhFuna7wYIOHmuNHpNwci4OhXgTtCKP13zRQrnfKvQ2SiuzdxA>
 <xmx:0q_EYo-_fYAFzuwuFma89borHJMETIFsLdWgABQ-HIPfbRI-LwMiRw>
 <xmx:06_EYm7NWwS5BbEFdBD3SRpIfS7FpJ5ULRUIO2-tub2_hoi5HD6ZLg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 17:40:33 -0400 (EDT)
Date: Tue, 5 Jul 2022 14:40:32 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Corey Minyard <minyard@acm.org>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Patrick Venture <venture@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/9] hw/i2c/pca954x: Add method to get channels
Message-ID: <YsSv0NU8WfU6APoN@pdel-mbp.dhcp.thefacebook.com>
References: <20220705191400.41632-1-peter@pjd.dev>
 <20220705191400.41632-2-peter@pjd.dev>
 <20220705200624.GK908082@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705200624.GK908082@minyard.net>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, Jul 05, 2022 at 03:06:24PM -0500, Corey Minyard wrote:
> On Tue, Jul 05, 2022 at 12:13:52PM -0700, Peter Delevoryas wrote:
> > I added this helper in the Aspeed machine file a while ago to help
> > initialize fuji-bmc i2c devices. This moves it to the official pca954x
> > file so that other files can use it.
> > 
> > This does something very similar to pca954x_i2c_get_bus, but I think
> > this is useful when you have a very complicated dts with a lot of
> > switches, like the fuji dts.
> > 
> > This convenience method lets you write code that produces a flat array
> > of I2C buses that matches the naming in the dts. After that you can just
> > add individual sensors using the flat array of I2C buses.
> 
> This is an improvment, I think.  But it really needs to be two patches,
> one with the I2C portion, and one with the aspeed portion.
> 
> Also, the name is a little misleading, you might want to name it 
> pca954x_i2c_create_get_channels

You're right: Cedric, you can just ignore the pca954x patch then if you'd like,
I can resubmit it with the future I2C series that uses it. I probably shouldn't
have submitted it quite yet.

I can also resubmit the series with that patch removed, not sure if that's
necessary or not.

> 
> -corey
> 
> > 
> > See fuji_bmc_i2c_init to understand this point further.
> > 
> > The fuji dts is here for reference:
> > 
> > https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >  hw/arm/aspeed.c                  | 29 +++++++++--------------------
> >  hw/i2c/i2c_mux_pca954x.c         | 10 ++++++++++
> >  include/hw/i2c/i2c_mux_pca954x.h | 13 +++++++++++++
> >  3 files changed, 32 insertions(+), 20 deletions(-)
> > 
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 6fe9b13548..bee8a748ec 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -793,15 +793,6 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
> >      create_pca9552(soc, 15, 0x60);
> >  }
> >  
> > -static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
> > -                                 I2CBus **channels)
> > -{
> > -    I2CSlave *mux = i2c_slave_create_simple(bus, "pca9548", mux_addr);
> > -    for (int i = 0; i < 8; i++) {
> > -        channels[i] = pca954x_i2c_get_bus(mux, i);
> > -    }
> > -}
> > -
> >  #define TYPE_LM75 TYPE_TMP105
> >  #define TYPE_TMP75 TYPE_TMP105
> >  #define TYPE_TMP422 "tmp422"
> > @@ -814,20 +805,18 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
> >      for (int i = 0; i < 16; i++) {
> >          i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> >      }
> > -    I2CBus *i2c180 = i2c[2];
> > -    I2CBus *i2c480 = i2c[8];
> > -    I2CBus *i2c600 = i2c[11];
> >  
> > -    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
> > -    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
> > +    pca954x_i2c_get_channels(i2c[2], 0x70, "pca9548", &i2c[16]);
> > +    pca954x_i2c_get_channels(i2c[8], 0x70, "pca9548", &i2c[24]);
> >      /* NOTE: The device tree skips [32, 40) in the alias numbering */
> > -    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
> > -    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
> > -    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
> > -    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
> > -    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
> > +    pca954x_i2c_get_channels(i2c[11], 0x77, "pca9548", &i2c[40]);
> > +    pca954x_i2c_get_channels(i2c[24], 0x71, "pca9548", &i2c[48]);
> > +    pca954x_i2c_get_channels(i2c[25], 0x72, "pca9548", &i2c[56]);
> > +    pca954x_i2c_get_channels(i2c[26], 0x76, "pca9548", &i2c[64]);
> > +    pca954x_i2c_get_channels(i2c[27], 0x76, "pca9548", &i2c[72]);
> >      for (int i = 0; i < 8; i++) {
> > -        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
> > +        pca954x_i2c_get_channels(i2c[40 + i], 0x76, "pca9548",
> > +                                 &i2c[80 + i * 8]);
> >      }
> >  
> >      i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
> > diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> > index 3945de795c..6b07804546 100644
> > --- a/hw/i2c/i2c_mux_pca954x.c
> > +++ b/hw/i2c/i2c_mux_pca954x.c
> > @@ -169,6 +169,16 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
> >      return pca954x->bus[channel];
> >  }
> >  
> > +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
> > +                              const char *type_name, I2CBus **channels)
> > +{
> > +    I2CSlave *mux = i2c_slave_create_simple(bus, type_name, address);
> > +    Pca954xClass *pc = PCA954X_GET_CLASS(mux);
> > +    Pca954xState *pca954x = PCA954X(mux);
> > +
> > +    memcpy(channels, pca954x->bus, pc->nchans * sizeof(channels[0]));
> > +}
> > +
> >  static void pca9546_class_init(ObjectClass *klass, void *data)
> >  {
> >      Pca954xClass *s = PCA954X_CLASS(klass);
> > diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
> > index 3dd25ec983..3a676a30a9 100644
> > --- a/include/hw/i2c/i2c_mux_pca954x.h
> > +++ b/include/hw/i2c/i2c_mux_pca954x.h
> > @@ -16,4 +16,17 @@
> >   */
> >  I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel);
> >  
> > +/**
> > + * Creates an i2c mux and retrieves all of the channels associated with it.
> > + *
> > + * @bus: the i2c bus where the i2c mux resides.
> > + * @address: the address of the i2c mux on the aforementioned i2c bus.
> > + * @type_name: name of the i2c mux type to create.
> > + * @channels: an output parameter specifying where to return the channels.
> > + *
> > + * Returns: None
> > + */
> > +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
> > +                              const char *type_name, I2CBus **channels);
> > +
> >  #endif
> > -- 
> > 2.37.0
> > 
> > 

