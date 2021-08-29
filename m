Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5F3FA823
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 03:24:18 +0200 (CEST)
Received: from localhost ([::1]:59548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mK9YX-00012o-KL
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 21:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mK9Xj-0000CA-Bk; Sat, 28 Aug 2021 21:23:27 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:32877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mK9Xh-0001L3-OG; Sat, 28 Aug 2021 21:23:27 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EF0C6320034E;
 Sat, 28 Aug 2021 21:23:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 28 Aug 2021 21:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Rgcnfz
 8RHxskzsFWMU3xiWXPgCvZBXInD3V0TI+kDA4=; b=Ev/mviOSrHorfkEna+pRz2
 v346vRhW7qSvPrmYFiwOuzvvHZg0JfB/aZPIX65xjFu0lwkQ/NPGDwIy0lklra6s
 zwmyL5GoeGrrKnEUhRroQ2gODIjEdvyEAZMcCgu63MOgynGFqUWRbA0eJgT2hPBf
 q4AvnZxeTwuJrjaO7df6Umu81/ENs3HDN+p1cXyfqYMkgJNQhpoXCT9NwNckVn3I
 jvvoz4ZTROMzhG+Eto9ECXMMeadLRIoa8+mBFNcCNUiNHwjsBOCSI71TkFlbTFId
 Sf8ixLeSNrvqwNi5j3/WM/MY2CBRcPk46KVQR3dK5PTwciL/gcYeB93n5tTz6msw
 ==
X-ME-Sender: <xms:iOEqYSGjnREWgyTRmKRHeSNyrnBauNIwX2Pipdj5AaYxLOGCYW5yow>
 <xme:iOEqYTU3EGmSfJ8idC66uniEODFBuCrulx7lNBP397WSFDaArjsCbPN28n_AOwbPm
 FXAMS5GIlU-giR_WJY>
X-ME-Received: <xmr:iOEqYcJ3vR_muSMI5S9azQAm4WAb76t9CGPz3LeHJYPyC0XcmO4huP63o2mU3d7ZXUiTUwpJv_RWQQSmxJFtkx2jBBW4s8lfxyu-mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduiedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeffjeeigfehveehfeevhfetgefgieejieeviefhffffudfgfeekleffhffg
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:iOEqYcG1_6QzP4jqDFFgEuYgwoKwoSSMVaIIXLpPDaoZXctTg9gW5g>
 <xmx:iOEqYYWNWyZj0OOAGQEW5er4yjd16BFotsQdbHEdRGt6yMQjbh6_NA>
 <xmx:iOEqYfNbo-Ng4Z-O_gZ55A4Gxl3NneRu-6B74-3KkGh_KmCn73h_5A>
 <xmx:iuEqYWz7A39Pld2eD82j1nEHFb7MTOzi2xlmzGIcrLXxcL7AOrNswg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Aug 2021 21:23:17 -0400 (EDT)
Date: Sun, 29 Aug 2021 11:23:12 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC 09/10] hw/mos6522: Avoid using discrepant QEMU clock values
In-Reply-To: <771801f0-3645-abed-4f18-18bf91c420ad@amsat.org>
Message-ID: <977bc4d-b84d-9962-d6f8-dc9a319ff6cd@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <21f20ab5a100e4947d840080114f3f0511aade86.1629799776.git.fthain@linux-m68k.org>
 <771801f0-3645-abed-4f18-18bf91c420ad@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463811774-2145123348-1630200192=:3023"
Received-SPF: none client-ip=64.147.123.19; envelope-from=fthain@linux-m68k.org;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-2145123348-1630200192=:3023
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Tue, 24 Aug 2021, Philippe Mathieu-Daud=C3=A9 wrote:

> On 8/24/21 12:09 PM, Finn Thain wrote:
> > mos6522_read() and mos6522_write() may call various functions to determ=
ine
> > timer irq state, timer counter value and QEMUTimer deadline. All called
> > functions must use the same value for the present time.
> >=20
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> >  hw/misc/mos6522.c | 51 +++++++++++++++++++++++++----------------------
> >  1 file changed, 27 insertions(+), 24 deletions(-)
>=20
> > @@ -123,20 +123,19 @@ static int64_t get_next_irq_time(MOS6522State *s,=
 MOS6522Timer *ti,
> >      trace_mos6522_get_next_irq_time(ti->latch, d, next_time - d);
> >      next_time =3D muldiv64(next_time, NANOSECONDS_PER_SECOND, ti->freq=
uency) +
> >                           ti->load_time;
> > -
> > -    if (next_time <=3D current_time) {
> > -        next_time =3D current_time + 1;
> > -    }
>=20
> Maybe extract as an helper?=20

There is a small amount of code duplication here but it gets resolved in=20
patch 10/10.

> Otherwise:
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> >      return next_time;
> >  }
> > =20
> >  static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
> > -                                 int64_t current_time)
> > +                                  int64_t now)
> >  {
> >      if (!ti->timer) {
> >          return;
> >      }
> > -    ti->next_irq_time =3D get_next_irq_time(s, ti, current_time);
> > +    ti->next_irq_time =3D get_next_irq_time(s, ti, now);
> > +    if (ti->next_irq_time <=3D now) {
> > +        ti->next_irq_time =3D now + 1;
> > +    }
> >      if ((s->ier & T1_INT) =3D=3D 0 ||
> >          ((s->acr & T1MODE) =3D=3D T1MODE_ONESHOT && ti->oneshot_fired)=
) {
> >          timer_del(ti->timer);
> > @@ -146,12 +145,15 @@ static void mos6522_timer1_update(MOS6522State *s=
, MOS6522Timer *ti,
> >  }
> > =20
> >  static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
> > -                                 int64_t current_time)
> > +                                  int64_t now)
> >  {
> >      if (!ti->timer) {
> >          return;
> >      }
> > -    ti->next_irq_time =3D get_next_irq_time(s, ti, current_time);
> > +    ti->next_irq_time =3D get_next_irq_time(s, ti, now);
> > +    if (ti->next_irq_time <=3D now) {
> > +        ti->next_irq_time =3D now + 1;
> > +    }
>=20
>=20
---1463811774-2145123348-1630200192=:3023--

