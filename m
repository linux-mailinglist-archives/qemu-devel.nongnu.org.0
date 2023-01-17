Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A8B66E5FD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:30:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqih-0006NQ-Rq; Tue, 17 Jan 2023 13:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqif-0006MT-9q; Tue, 17 Jan 2023 13:30:01 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqid-0006zm-An; Tue, 17 Jan 2023 13:30:01 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id AD1145C006B;
 Tue, 17 Jan 2023 13:29:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 17 Jan 2023 13:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673980196; x=
 1674066596; bh=09Lx6U9sIubtT85gI28RV2hmLaK02zMwZtITYZaDNeI=; b=I
 ScpNVn3tOCoMXwISRBOfB7oxlr5rMj3X97fs7b5r6B+3IPqDC81qlG9h9daWbgD8
 PzM43X6b2bVui82N11nuOz/KTa4D6xwqL/TPooYZiIB+1KLXNzcrEaHMJfpgzlOA
 0RrxKj7xoJymdaejSDf730m762N+ZDHSHO/FsuEk12QThKnUFHt+Z32Tu44MPyRp
 Uwjw+g3WBPXkdKYjjKR6JC+88dAjO5qv0Z7K2SpuF0SfqlitXUVK3RXHsDjAfolo
 blQ05eBlBRFLwq4vEgEbToJJkgFecnFJkdGLWAd9yeaeBccUYvYjDNgcd5JPj7GU
 tR5Jwx4GGSDH9pFvDELKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673980196; x=
 1674066596; bh=09Lx6U9sIubtT85gI28RV2hmLaK02zMwZtITYZaDNeI=; b=E
 +u6P5i+5o6SzR/EW6EFCC2H+Obg3wZFO4Nk98osHLfrW9gZPWKqbdp1eHHqC0u7d
 5d31tyJ4qrIakW/lYQ7zxv81Z27zU6VNCifoa8HmJ5ksbslsSYkYXJeJkCPmwz5W
 Fe6xuSDnfpRsxHev34fWykr874+kJ9WO/woDVbQmdGVVKtg23eHKgEgYG6x06z0T
 VHbdPdUl6sV82ytEUoNpgaokbpOOUmKQzqZOCfX+duImGFfUvcsXvo1ggWme4XWc
 SKFkYRQub8J/epRPASngVAkrGekgQqKnDrbsDSF3ypBGYyJD+HlxCCgSsqcN5L8t
 9mNd2tSGKFvKzAqFOCXoQ==
X-ME-Sender: <xms:JOnGY4cLdfsKODcmmM8C1yyS8x8PD12MnTpUfx_gIKtn52hSMf926g>
 <xme:JOnGY6NOmzMNwjhVRUW7EiottSp_6P-XrSiMAMz-4UcIyj3fzASAXOfb6ZOu5hdnH
 tjnLjFBnESjAPOVNio>
X-ME-Received: <xmr:JOnGY5hFa1E0Ggu5ZIB1aprZNf06bC5QYbPc-7Pysqef9Z4clTKlWf3e-jJB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjse
 htkeertddttddunecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvght
 vghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpefhgeffvedufeevteegkeetie
 ejhffhudeujedvgedvheffheejveethffhffefueenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:JOnGY9-dNkg56OJc-BxaJ5tbP61Obzt4nh1DbMuO5WByMW3c7LHPKQ>
 <xmx:JOnGY0tW7_ilX0Yf-w473-7QcPL8ASsP5roktmHdo55ue_AuTMvvWg>
 <xmx:JOnGY0G8eR0Io6aiK7FwYlWDOOgLeLyw97Ijv7FALVvwMCGx2NTPCQ>
 <xmx:JOnGY4hgaEeqNSE9cRS4AmN1JBIjwoKNJVjqIrwfiLlpijkuOjnmYA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 13:29:54 -0500 (EST)
Date: Tue, 17 Jan 2023 10:29:52 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 5/5] hw/nvram/eeprom_at24c: Make reset behavior more
 like hardware
Message-ID: <Y8bpICXfvTkHMVno@pdel-mbp>
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-6-peter@pjd.dev>
 <356419e3-339d-b45e-c8d2-2e3679e701f4@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <356419e3-339d-b45e-c8d2-2e3679e701f4@kaod.org>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=peter@pjd.dev;
 helo=out3-smtp.messagingengine.com
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

On Tue, Jan 17, 2023 at 08:42:46AM +0100, Cédric Le Goater wrote:
> On 1/17/23 00:56, Peter Delevoryas wrote:
> > EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
> > I would expect the I2C state machine to be reset to default values, but I
> > wouldn't really expect the memory to change at all.
> 
> 
> > 
> > The current implementation of the at24c EEPROM resets its internal memory on
> > reset. This matches the specification in docs/devel/reset.rst:
> > 
> >    Cold reset is supported by every resettable object. In QEMU, it means we reset
> >    to the initial state corresponding to the start of QEMU; this might differ
> >    from what is a real hardware cold reset. It differs from other resets (like
> >    warm or bus resets) which may keep certain parts untouched.
> > 
> > But differs from my intuition. For example, if someone writes some information
> > to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
> > retain that information. It's very useful to be able to test things like this
> > in QEMU as well, to verify software instrumentation like determining the cause
> > of a reboot.
> 
> Yes. should we take into account the "writable" property  ? It is not set to
> false in any model but it could.

We're already using "writable" in at24c_eeprom_send to control writes, do we
need to use it anywhere else? I would assume we shouldn't use it in init/reset,
but maybe you have something specific in mind.

> 
> Thanks,
> 
> C.
> 
> > Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
> >   1 file changed, 10 insertions(+), 12 deletions(-)
> > 
> > diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> > index bb9ee75864fe..6bcded7b496c 100644
> > --- a/hw/nvram/eeprom_at24c.c
> > +++ b/hw/nvram/eeprom_at24c.c
> > @@ -185,18 +185,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
> >       }
> >       ee->mem = g_malloc0(ee->rsize);
> > -
> > -}
> > -
> > -static
> > -void at24c_eeprom_reset(DeviceState *state)
> > -{
> > -    EEPROMState *ee = AT24C_EE(state);
> > -
> > -    ee->changed = false;
> > -    ee->cur = 0;
> > -    ee->haveaddr = 0;
> > -
> >       memset(ee->mem, 0, ee->rsize);
> >       if (ee->blk) {
> > @@ -214,6 +202,16 @@ void at24c_eeprom_reset(DeviceState *state)
> >       }
> >   }
> > +static
> > +void at24c_eeprom_reset(DeviceState *state)
> > +{
> > +    EEPROMState *ee = AT24C_EE(state);
> > +
> > +    ee->changed = false;
> > +    ee->cur = 0;
> > +    ee->haveaddr = 0;
> > +}
> > +
> >   static Property at24c_eeprom_props[] = {
> >       DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
> >       DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
> 

