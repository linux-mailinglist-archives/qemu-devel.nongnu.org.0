Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250783BB4F2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 03:38:04 +0200 (CEST)
Received: from localhost ([::1]:56568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0DYh-0004PU-7v
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 21:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0DXg-0003W4-11
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 21:37:00 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0DXY-0003Gp-Ho
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 21:36:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 57C4A5C00BD;
 Sun,  4 Jul 2021 21:36:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 04 Jul 2021 21:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-id:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=hfLEFYVC05H8unRGvRfq+mJj1GDfZzuW9bOV+4fZA/s=; b=UB385I0M
 kSXg0GDc5SpUzqfnRIvjger64+wDf5TgTVrG4i4xulDiGuIGzoHHNUpG3MeaZ43D
 HG+UkveI3pHSaMULJSCfJI4A6RBAgWeAykE1YmdyciJTK3yEg1tMy2uuDfommwDw
 6+MkES3jOdf5OoB5m9NqrJRwEou1SwErHTdbQ0JkrwArVNa5MX9RQQ5LAv9eAFyY
 AaxiyUNUBqdN7cqY03E4xwZMiyU6D6Kcn5bb2T9MZ+utzYgmub2EZxUymTnftheu
 /bkVPYNDvjzhgwI7slSKEkM0ZfPWYWpxcGBtXjudZ7I9/Ycup7UsYNXGIZ0/caw9
 zcmOopiFHD5ijg==
X-ME-Sender: <xms:MWLiYGQWldSM7o-xnwXkXkeAScHRxe6HZBMSkYICuz36Pw-64lIv-g>
 <xme:MWLiYLx8vhlxVjb12FEy_8GRRVVE3iylhZcJ5Fq7_soEZzKQ2LaHXjR7wsVeAqIE7
 _4I3IsrjcBX0R6p2OE>
X-ME-Received: <xmr:MWLiYD1c3BYGZgGr6KOA6OPYN_v-IyBEx7KmOY-_ozyGyaga1nxIKtdo8cRsJ-q4CInwth8p_SH1PLQqSsP96fV6fojq3-dsDkc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejfedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeffjeeigfehveehfeevhfetgefgieejieeviefhffffudfgfeekleffhffg
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:MWLiYCCA0elQ6Cn1njV5pu51Z3kCYQltoPIHjk6zSGx1dTunmtawtA>
 <xmx:MWLiYPgRFOHsJXKIVWhFexgPdZjVBvnmKQScsyMgXjd9ApiBxXzqLw>
 <xmx:MWLiYOoSN__WZvuYPQsvwrtxFrzem5Cx69SA100YZO45enDfAlArsg>
 <xmx:MmLiYCtmYth_6mCiEIs1LmBAXZAt_LMrJXfNN8saEYJzd3nmBAY6Lw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Jul 2021 21:36:46 -0400 (EDT)
Date: Mon, 5 Jul 2021 11:36:42 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC PATCH 6/6] dp8393x: Rewrite dp8393x_get() / dp8393x_put()
In-Reply-To: <d95b2ae6-c849-1b79-36f0-25c5133cca7a@ilande.co.uk>
Message-ID: <b2cbdfbf-398-3530-b37b-5416aa612af9@linux-m68k.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-7-f4bug@amsat.org>
 <d95b2ae6-c849-1b79-36f0-25c5133cca7a@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-153874918-1625448667=:14"
Content-ID: <88e3a944-1dcb-44d-517a-3a833644f524@nippy.intranet>
Received-SPF: none client-ip=66.111.4.26; envelope-from=fthain@linux-m68k.org;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-153874918-1625448667=:14
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <4f457913-4fbf-45a2-dafc-7845ff64f488@nippy.intranet>

On Sun, 4 Jul 2021, Mark Cave-Ayland wrote:

> On 03/07/2021 15:19, Philippe Mathieu-Daud=C3=A9 wrote:
>=20
> > Instead of accessing N registers via a single address_space API
> > call using a temporary buffer (stored in the device state) and
> > updating each register, move the address_space call in the
> > register put/get. The load/store and word size checks are moved
> > to put/get too. This simplifies a bit, making the code easier
> > to read.
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >   hw/net/dp8393x.c | 157 ++++++++++++++++++----------------------------=
-
> >   1 file changed, 60 insertions(+), 97 deletions(-)
> >=20
> > diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> > index bbe241ef9db..db9cfd786f5 100644
> > --- a/hw/net/dp8393x.c
> > +++ b/hw/net/dp8393x.c
> > @@ -162,7 +162,6 @@ struct dp8393xState {
> >         /* Temporaries */
> >       uint8_t tx_buffer[0x10000];
> > -    uint16_t data[12];
> >       int loopback_packet;
> >         /* Memory access */
> > @@ -219,34 +218,48 @@ static uint32_t dp8393x_wt(dp8393xState *s)
> >       return s->regs[SONIC_WT1] << 16 | s->regs[SONIC_WT0];
> >   }
> >   -static uint16_t dp8393x_get(dp8393xState *s, int width, int offset)
> > +static uint16_t dp8393x_get(dp8393xState *s, hwaddr addr, unsigned ofs=
16)
> >   {
> > +    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> >       uint16_t val;
> >   -    if (s->big_endian) {
> > -        val =3D be16_to_cpu(s->data[offset * width + width - 1]);
> > +    if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
> > +        addr +=3D 2 * ofs16;
> > +        if (s->big_endian) {
> > +            val =3D address_space_ldl_be(&s->as, addr, attrs, NULL);
> > +        } else {
> > +            val =3D address_space_ldl_le(&s->as, addr, attrs, NULL);
> > +        }
> >       } else {
> > -        val =3D le16_to_cpu(s->data[offset * width]);
> > +        addr +=3D 1 * ofs16;
> > +        if (s->big_endian) {
> > +            val =3D address_space_lduw_be(&s->as, addr, attrs, NULL);
> > +        } else {
> > +            val =3D address_space_lduw_le(&s->as, addr, attrs, NULL);
> > +        }
> >       }
> > +
> >       return val;
> >   }
> >   -static void dp8393x_put(dp8393xState *s, int width, int offset,
> > -                        uint16_t val)
> > +static void dp8393x_put(dp8393xState *s,
> > +                        hwaddr addr, unsigned ofs16, uint16_t val)
> >   {
> > -    if (s->big_endian) {
> > -        if (width =3D=3D 2) {
> > -            s->data[offset * 2] =3D 0;
> > -            s->data[offset * 2 + 1] =3D cpu_to_be16(val);
> > +    const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> > +
> > +    if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
> > +        addr +=3D 2 * ofs16;
> > +        if (s->big_endian) {
> > +            address_space_stl_be(&s->as, addr, val, attrs, NULL);
> >           } else {
> > -            s->data[offset] =3D cpu_to_be16(val);
> > +            address_space_stl_le(&s->as, addr, val, attrs, NULL);
> >           }
> >       } else {
> > -        if (width =3D=3D 2) {
> > -            s->data[offset * 2] =3D cpu_to_le16(val);
> > -            s->data[offset * 2 + 1] =3D 0;
> > +        addr +=3D 1 * ofs16;
> > +        if (s->big_endian) {
> > +            address_space_stw_be(&s->as, addr, val, attrs, NULL);
> >           } else {
> > -            s->data[offset] =3D cpu_to_le16(val);
> > +            address_space_stw_le(&s->as, addr, val, attrs, NULL);
> >           }
> >       }
> >   }
> > @@ -277,12 +290,10 @@ static void dp8393x_do_load_cam(dp8393xState *s)
> >         while (s->regs[SONIC_CDC] & 0x1f) {
> >           /* Fill current entry */
> > -        address_space_read(&s->as, dp8393x_cdp(s),
> > -                           MEMTXATTRS_UNSPECIFIED, s->data, size);
> > -        index =3D dp8393x_get(s, width, 0) & 0xf;
> > -        s->cam[index][0] =3D dp8393x_get(s, width, 1);
> > -        s->cam[index][1] =3D dp8393x_get(s, width, 2);
> > -        s->cam[index][2] =3D dp8393x_get(s, width, 3);
> > +        index =3D dp8393x_get(s, dp8393x_cdp(s), 0) & 0xf;
> > +        s->cam[index][0] =3D dp8393x_get(s, dp8393x_cdp(s), 1);
> > +        s->cam[index][1] =3D dp8393x_get(s, dp8393x_cdp(s), 2);
> > +        s->cam[index][2] =3D dp8393x_get(s, dp8393x_cdp(s), 3);
> >           trace_dp8393x_load_cam(index,
> >                                  s->cam[index][0] >> 8, s->cam[index][0=
] &
> > 0xff,
> >                                  s->cam[index][1] >> 8, s->cam[index][1=
] &
> > 0xff,
> > @@ -293,9 +304,7 @@ static void dp8393x_do_load_cam(dp8393xState *s)
> >       }
> >         /* Read CAM enable */
> > -    address_space_read(&s->as, dp8393x_cdp(s),
> > -                       MEMTXATTRS_UNSPECIFIED, s->data, size);
> > -    s->regs[SONIC_CE] =3D dp8393x_get(s, width, 0);
> > +    s->regs[SONIC_CE] =3D dp8393x_get(s, dp8393x_cdp(s), 0);
> >       trace_dp8393x_load_cam_done(s->regs[SONIC_CE]);
> >         /* Done */
> > @@ -311,14 +320,12 @@ static void dp8393x_do_read_rra(dp8393xState *s)
> >       /* Read memory */
> >       width =3D (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
> >       size =3D sizeof(uint16_t) * 4 * width;
> > -    address_space_read(&s->as, dp8393x_rrp(s),
> > -                       MEMTXATTRS_UNSPECIFIED, s->data, size);
> >         /* Update SONIC registers */
> > -    s->regs[SONIC_CRBA0] =3D dp8393x_get(s, width, 0);
> > -    s->regs[SONIC_CRBA1] =3D dp8393x_get(s, width, 1);
> > -    s->regs[SONIC_RBWC0] =3D dp8393x_get(s, width, 2);
> > -    s->regs[SONIC_RBWC1] =3D dp8393x_get(s, width, 3);
> > +    s->regs[SONIC_CRBA0] =3D dp8393x_get(s, dp8393x_rrp(s), 0);
> > +    s->regs[SONIC_CRBA1] =3D dp8393x_get(s, dp8393x_rrp(s), 1);
> > +    s->regs[SONIC_RBWC0] =3D dp8393x_get(s, dp8393x_rrp(s), 2);
> > +    s->regs[SONIC_RBWC1] =3D dp8393x_get(s, dp8393x_rrp(s), 3);
> >       trace_dp8393x_read_rra_regs(s->regs[SONIC_CRBA0],
> > s->regs[SONIC_CRBA1],
> >                                   s->regs[SONIC_RBWC0],
> > s->regs[SONIC_RBWC1]);
> >   @@ -414,28 +421,22 @@ static void dp8393x_do_receiver_disable(dp8393x=
State
> > *s)
> >   static void dp8393x_do_transmit_packets(dp8393xState *s)
> >   {
> >       NetClientState *nc =3D qemu_get_queue(s->nic);
> > -    int width, size;
> >       int tx_len, len;
> >       uint16_t i;
> >   -    width =3D (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
> > -
> >       while (1) {
> >           /* Read memory */
> > -        size =3D sizeof(uint16_t) * 6 * width;
> >           s->regs[SONIC_TTDA] =3D s->regs[SONIC_CTDA];
> >           trace_dp8393x_transmit_packet(dp8393x_ttda(s));
> > -        address_space_read(&s->as, dp8393x_ttda(s) + sizeof(uint16_t) =
*
> > width,
> > -                           MEMTXATTRS_UNSPECIFIED, s->data, size);
> >           tx_len =3D 0;
> >             /* Update registers */
> > -        s->regs[SONIC_TCR] =3D dp8393x_get(s, width, 0) & 0xf000;
> > -        s->regs[SONIC_TPS] =3D dp8393x_get(s, width, 1);
> > -        s->regs[SONIC_TFC] =3D dp8393x_get(s, width, 2);
> > -        s->regs[SONIC_TSA0] =3D dp8393x_get(s, width, 3);
> > -        s->regs[SONIC_TSA1] =3D dp8393x_get(s, width, 4);
> > -        s->regs[SONIC_TFS] =3D dp8393x_get(s, width, 5);
> > +        s->regs[SONIC_TCR] =3D dp8393x_get(s, dp8393x_ttda(s), 0) & 0x=
f000;
> > +        s->regs[SONIC_TPS] =3D dp8393x_get(s, dp8393x_ttda(s), 1);
> > +        s->regs[SONIC_TFC] =3D dp8393x_get(s, dp8393x_ttda(s), 2);
> > +        s->regs[SONIC_TSA0] =3D dp8393x_get(s, dp8393x_ttda(s), 3);
> > +        s->regs[SONIC_TSA1] =3D dp8393x_get(s, dp8393x_ttda(s), 4);
> > +        s->regs[SONIC_TFS] =3D dp8393x_get(s, dp8393x_ttda(s), 5);
> >             /* Handle programmable interrupt */
> >           if (s->regs[SONIC_TCR] & SONIC_TCR_PINT) {
> > @@ -457,15 +458,9 @@ static void dp8393x_do_transmit_packets(dp8393xSta=
te
> > *s)
> >               i++;
> >               if (i !=3D s->regs[SONIC_TFC]) {
> >                   /* Read next fragment details */
> > -                size =3D sizeof(uint16_t) * 3 * width;
> > -                address_space_read(&s->as,
> > -                                   dp8393x_ttda(s)
> > -                                   + sizeof(uint16_t) * width * (4 + 3=
 *
> > i),
> > -                                   MEMTXATTRS_UNSPECIFIED, s->data,
> > -                                   size);
> > -                s->regs[SONIC_TSA0] =3D dp8393x_get(s, width, 0);
> > -                s->regs[SONIC_TSA1] =3D dp8393x_get(s, width, 1);
> > -                s->regs[SONIC_TFS] =3D dp8393x_get(s, width, 2);
> > +                s->regs[SONIC_TSA0] =3D dp8393x_get(s, dp8393x_ttda(s)=
, 0);
> > +                s->regs[SONIC_TSA1] =3D dp8393x_get(s, dp8393x_ttda(s)=
, 1);
> > +                s->regs[SONIC_TFS] =3D dp8393x_get(s, dp8393x_ttda(s),=
 2);
> >               }
> >           }
> >   @@ -498,22 +493,12 @@ static void dp8393x_do_transmit_packets(dp8393x=
State
> > *s)
> >           s->regs[SONIC_TCR] |=3D SONIC_TCR_PTX;
> >             /* Write status */
> > -        dp8393x_put(s, width, 0,
> > -                    s->regs[SONIC_TCR] & 0x0fff); /* status */
> > -        size =3D sizeof(uint16_t) * width;
> > -        address_space_write(&s->as, dp8393x_ttda(s),
> > -                            MEMTXATTRS_UNSPECIFIED, s->data, size);
> > +        dp8393x_put(s, dp8393x_ttda(s), 0, s->regs[SONIC_TCR] & 0x0fff=
);
> >             if (!(s->regs[SONIC_CR] & SONIC_CR_HTX)) {
> >               /* Read footer of packet */
> > -            size =3D sizeof(uint16_t) * width;
> > -            address_space_read(&s->as,
> > -                               dp8393x_ttda(s)
> > -                               + sizeof(uint16_t) * width
> > -                                 * (4 + 3 * s->regs[SONIC_TFC]),
> > -                               MEMTXATTRS_UNSPECIFIED, s->data,
> > -                               size);
> > -            s->regs[SONIC_CTDA] =3D dp8393x_get(s, width, 0);
> > +            s->regs[SONIC_CTDA] =3D dp8393x_get(s, dp8393x_ttda(s),
> > +                                              4 + 3 * s->regs[SONIC_TF=
C]);
> >               if (s->regs[SONIC_CTDA] & SONIC_DESC_EOL) {
> >                   /* EOL detected */
> >                   break;
> > @@ -762,7 +747,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, =
const
> > uint8_t * buf,
> >       dp8393xState *s =3D qemu_get_nic_opaque(nc);
> >       int packet_type;
> >       uint32_t available, address;
> > -    int width, rx_len, padded_len;
> > +    int rx_len, padded_len;
> >       uint32_t checksum;
> >       int size;
> >   @@ -775,10 +760,8 @@ static ssize_t dp8393x_receive(NetClientState *n=
c,
> > const uint8_t * buf,
> >         rx_len =3D pkt_size + sizeof(checksum);
> >       if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
> > -        width =3D 2;
> >           padded_len =3D ((rx_len - 1) | 3) + 1;
> >       } else {
> > -        width =3D 1;
> >           padded_len =3D ((rx_len - 1) | 1) + 1;
> >       }
> >   @@ -799,11 +782,7 @@ static ssize_t dp8393x_receive(NetClientState *n=
c,
> > const uint8_t * buf,
> >       /* Check for EOL */
> >       if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
> >           /* Are we still in resource exhaustion? */
> > -        size =3D sizeof(uint16_t) * 1 * width;
> > -        address =3D dp8393x_crda(s) + sizeof(uint16_t) * 5 * width;
> > -        address_space_read(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> > -                           s->data, size);
> > -        s->regs[SONIC_LLFA] =3D dp8393x_get(s, width, 0);
> > +        s->regs[SONIC_LLFA] =3D dp8393x_get(s, dp8393x_crda(s), 5);
> >           if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
> >               /* Still EOL ; stop reception */
> >               return -1;
> > @@ -811,11 +790,7 @@ static ssize_t dp8393x_receive(NetClientState *nc,
> > const uint8_t * buf,
> >           /* Link has been updated by host */
> >             /* Clear in_use */
> > -        size =3D sizeof(uint16_t) * width;
> > -        address =3D dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
> > -        dp8393x_put(s, width, 0, 0);
> > -        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> > -                            (uint8_t *)s->data, size);
> > +        dp8393x_put(s, dp8393x_crda(s), 6, 0x0000);
> >             /* Move to next descriptor */
> >           s->regs[SONIC_CRDA] =3D s->regs[SONIC_LLFA];
> > @@ -869,32 +844,20 @@ static ssize_t dp8393x_receive(NetClientState *nc=
,
> > const uint8_t * buf,
> >         /* Write status to memory */
> >       trace_dp8393x_receive_write_status(dp8393x_crda(s));
> > -    dp8393x_put(s, width, 0, s->regs[SONIC_RCR]); /* status */
> > -    dp8393x_put(s, width, 1, rx_len); /* byte count */
> > -    dp8393x_put(s, width, 2, s->regs[SONIC_TRBA0]); /* pkt_ptr0 */
> > -    dp8393x_put(s, width, 3, s->regs[SONIC_TRBA1]); /* pkt_ptr1 */
> > -    dp8393x_put(s, width, 4, s->regs[SONIC_RSC]); /* seq_no */
> > -    size =3D sizeof(uint16_t) * 5 * width;
> > -    address_space_write(&s->as, dp8393x_crda(s),
> > -                        MEMTXATTRS_UNSPECIFIED,
> > -                        s->data, size);
> > +    dp8393x_put(s, dp8393x_crda(s), 0, s->regs[SONIC_RCR]); /* status =
*/
> > +    dp8393x_put(s, dp8393x_crda(s), 1, rx_len); /* byte count */
> > +    dp8393x_put(s, dp8393x_crda(s), 2, s->regs[SONIC_TRBA0]); /* pkt_p=
tr0
> > */
> > +    dp8393x_put(s, dp8393x_crda(s), 3, s->regs[SONIC_TRBA1]); /* pkt_p=
tr1
> > */
> > +    dp8393x_put(s, dp8393x_crda(s), 4, s->regs[SONIC_RSC]); /* seq_no =
*/
> >         /* Check link field */
> > -    size =3D sizeof(uint16_t) * width;
> > -    address_space_read(&s->as,
> > -                       dp8393x_crda(s) + sizeof(uint16_t) * 5 * width,
> > -                       MEMTXATTRS_UNSPECIFIED, s->data, size);
> > -    s->regs[SONIC_LLFA] =3D dp8393x_get(s, width, 0);
> > +    s->regs[SONIC_LLFA] =3D dp8393x_get(s, dp8393x_crda(s), 5);
> >       if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
> >           /* EOL detected */
> >           s->regs[SONIC_ISR] |=3D SONIC_ISR_RDE;
> >       } else {
> >           /* Clear in_use */
> > -        size =3D sizeof(uint16_t) * width;
> > -        address =3D dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
> > -        dp8393x_put(s, width, 0, 0);
> > -        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
> > -                            s->data, size);
> > +        dp8393x_put(s, dp8393x_crda(s), 6, 0x0000);
> >             /* Move to next descriptor */
> >           s->regs[SONIC_CRDA] =3D s->regs[SONIC_LLFA];
>=20
> This patch breaks networking in its current form, but I was able to make =
it
> work by applying the following diff:
>=20
>=20
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index db9cfd786f..b08843172b 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -218,20 +218,20 @@ static uint32_t dp8393x_wt(dp8393xState *s)
>      return s->regs[SONIC_WT1] << 16 | s->regs[SONIC_WT0];
>  }
>=20
> -static uint16_t dp8393x_get(dp8393xState *s, hwaddr addr, unsigned ofs16=
)
> +static uint16_t dp8393x_get(dp8393xState *s, hwaddr addr, int offset)
>  {
>      const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
>      uint16_t val;
>=20
>      if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
> -        addr +=3D 2 * ofs16;
> +        addr +=3D offset << 2;
>          if (s->big_endian) {
>              val =3D address_space_ldl_be(&s->as, addr, attrs, NULL);
>          } else {
>              val =3D address_space_ldl_le(&s->as, addr, attrs, NULL);
>          }
>      } else {
> -        addr +=3D 1 * ofs16;
> +        addr +=3D offset << 1;
>          if (s->big_endian) {
>              val =3D address_space_lduw_be(&s->as, addr, attrs, NULL);
>          } else {
> @@ -243,19 +243,19 @@ static uint16_t dp8393x_get(dp8393xState *s, hwaddr
> addr, unsigned ofs16)
>  }
>=20
>  static void dp8393x_put(dp8393xState *s,
> -                        hwaddr addr, unsigned ofs16, uint16_t val)
> +                        hwaddr addr, int offset, uint16_t val)
>  {
>      const MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
>=20
>      if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
> -        addr +=3D 2 * ofs16;
> +        addr +=3D offset << 2;
>          if (s->big_endian) {
>              address_space_stl_be(&s->as, addr, val, attrs, NULL);
>          } else {
>              address_space_stl_le(&s->as, addr, val, attrs, NULL);
>          }
>      } else {
> -        addr +=3D 1 * ofs16;
> +        addr +=3D offset << 1;
>          if (s->big_endian) {
>              address_space_stw_be(&s->as, addr, val, attrs, NULL);
>          } else {
> @@ -431,12 +431,12 @@ static void dp8393x_do_transmit_packets(dp8393xStat=
e *s)
>          tx_len =3D 0;
>=20
>          /* Update registers */
> -        s->regs[SONIC_TCR] =3D dp8393x_get(s, dp8393x_ttda(s), 0) & 0xf0=
00;
> -        s->regs[SONIC_TPS] =3D dp8393x_get(s, dp8393x_ttda(s), 1);
> -        s->regs[SONIC_TFC] =3D dp8393x_get(s, dp8393x_ttda(s), 2);
> -        s->regs[SONIC_TSA0] =3D dp8393x_get(s, dp8393x_ttda(s), 3);
> -        s->regs[SONIC_TSA1] =3D dp8393x_get(s, dp8393x_ttda(s), 4);
> -        s->regs[SONIC_TFS] =3D dp8393x_get(s, dp8393x_ttda(s), 5);
> +        s->regs[SONIC_TCR] =3D dp8393x_get(s, dp8393x_ttda(s), 1) & 0xf0=
00;
> +        s->regs[SONIC_TPS] =3D dp8393x_get(s, dp8393x_ttda(s), 2);
> +        s->regs[SONIC_TFC] =3D dp8393x_get(s, dp8393x_ttda(s), 3);
> +        s->regs[SONIC_TSA0] =3D dp8393x_get(s, dp8393x_ttda(s), 4);
> +        s->regs[SONIC_TSA1] =3D dp8393x_get(s, dp8393x_ttda(s), 5);
> +        s->regs[SONIC_TFS] =3D dp8393x_get(s, dp8393x_ttda(s), 6);
>=20
>          /* Handle programmable interrupt */
>          if (s->regs[SONIC_TCR] & SONIC_TCR_PINT) {
> @@ -458,9 +458,9 @@ static void dp8393x_do_transmit_packets(dp8393xState =
*s)
>              i++;
>              if (i !=3D s->regs[SONIC_TFC]) {
>                  /* Read next fragment details */
> -                s->regs[SONIC_TSA0] =3D dp8393x_get(s, dp8393x_ttda(s), =
0);
> -                s->regs[SONIC_TSA1] =3D dp8393x_get(s, dp8393x_ttda(s), =
1);
> -                s->regs[SONIC_TFS] =3D dp8393x_get(s, dp8393x_ttda(s), 2=
);
> +                s->regs[SONIC_TSA0] =3D dp8393x_get(s, dp8393x_ttda(s), =
4 + 3 *
> i);
> +                s->regs[SONIC_TSA1] =3D dp8393x_get(s, dp8393x_ttda(s), =
5 + 3 *
> i);
> +                s->regs[SONIC_TFS] =3D dp8393x_get(s, dp8393x_ttda(s), 6=
 + 3 *
> i);
>              }
>          }
>=20
>=20
> The main change is that the offset argument for dp8393x_get() and
> dp8393x_put() is actually an entry number and not a count of 16 bit words=
=2E
> Other than that there were a couple of offset calculations that needed
> adjustment to get things working again.
>=20
> Taking git master and applying your outstanding PR + this series without =
patch
> 3 + this diff gave me working networking on Linux/m68k, MacOS 8.0 and
> NetBSD/arc.
>=20

Nice job getting MacOS 8.0 to run! That functionality could be very useful=
=20
for working on the Linux bootloaders (Penguin and EMILE) as they don't=20
work under MESS/MAME or Mini VMac etc.

> Unfortunately I don't have a test mips64el image available to see if this
> combination works for Linux. Phil, do you have a suitable test kernel and
> rootfs image available to allow this to be tested?
>=20

You can build and boot a mipsel vmlinux by following the steps I described=
=20
previously. In the kernel messages you'll see the jazzsonic driver attempt=
=20
to probe the device. When it succeeds, you'll see the MAC address=20
reported. You can also observe the regression I reported with regards to=20
patch 2/6, "dp8393x: don't force 32-bit register access".

>=20
> ATB,
>=20
> Mark.
>=20
---1463811774-153874918-1625448667=:14--

