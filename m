Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE0E3BAABF
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 02:50:05 +0200 (CEST)
Received: from localhost ([::1]:45846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzqKh-0000Ns-Kx
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 20:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1lzqJx-000891-M5
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 20:49:17 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1lzqJv-0003ht-Nl
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 20:49:17 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 417E332007CF;
 Sat,  3 Jul 2021 20:49:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 03 Jul 2021 20:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=96fxp/
 zJLRFxvoOFnrwtEHzNek0kNwdk7k/jr4ENAUg=; b=uuDXsD8a6JiIzWvaw2ZOAj
 /tEMfI5y3g3jw0sMEht7NqUVrmy2Or2Mlb75qTNZEAOX5QKsPsc0Wx2EKiujYns3
 j1tqbkgR3K8tREZroHfff3dgTIWFjAUFEkvy1BJ+V9vEZJwS8lgNpnQjSr0YYSOA
 u5AwMTjq7BXTJmlTgMHDnsEhLRS50Cj7dfS/tPp2YzXP+Qc3rQofOqoBWwb7Yxjs
 9rmA1bYb4CsDPIWc2+LvjGlALuEOEH2Ecu2bTcwSf+XNSWnwWrDeSlIhnqER8i60
 krV5h9ATlk5cDZH0MXMYG0kJffMd9JHx0hxDe6OYFFJCwr7+vgMCl+OTb8USMr8g
 ==
X-ME-Sender: <xms:hgXhYAgKtOyzmchhrQR5xdbzedf1N0h3Zc26Pq-tWAFMH22xFYqAlw>
 <xme:hgXhYJCRAQGRG28_6h3NT2E5YDBbrpoI7xasAY1fBIFQTednqZVmylI5FsmAeZk-S
 v2s8DaMHXP-u8KG4mU>
X-ME-Received: <xmr:hgXhYIGykt492TEL5OtvU8pADh9Z6y59PFAXavEGM1ZRVnLDLFV241DTYfPHgOZ8otS7YA3kXM4G5ZfyVvdVCpBzvRbhkWbns8E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejuddgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeffjeeigfehveehfeevhfetgefgieejieeviefhffffudfgfeekleffhffg
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:hgXhYBRTpUJW7N3Crdd0SzeY1w1EnSK0UviNhyvQbK59VYvAHHfaHA>
 <xmx:hgXhYNwbvBMnrC_5vd-cnETxLF0U_u_7LCzPQY5-XcMIr5lKojenYA>
 <xmx:hgXhYP4g1l-X0JSBt69iCzor98n6aAHBxr_Z4kiZqYe62ZtWhtA-IA>
 <xmx:hwXhYI9IJMiUWsUVedW9YKThXp7qkQdkOsSUHz9OM9U09AwLjDy4Rg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Jul 2021 20:49:08 -0400 (EDT)
Date: Sun, 4 Jul 2021 10:49:01 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 2/3] dp8393x: Do not amend CRC if it is inhibited
 (CRCI bit set)
In-Reply-To: <20210703150219.364582-3-f4bug@amsat.org>
Message-ID: <3b56c4fc-293c-494c-9380-8faf20115396@linux-m68k.org>
References: <20210703150219.364582-1-f4bug@amsat.org>
 <20210703150219.364582-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1498345879-1625359741=:7"
Received-SPF: none client-ip=64.147.123.21; envelope-from=fthain@linux-m68k.org;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1498345879-1625359741=:7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 3 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:

> When the CRCI (CRC INHIBIT) bit is set, the 4-byte FCS field
> is not transmitted.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/net/dp8393x.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 99e179a5e86..dee8236400c 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -472,6 +472,7 @@ static void dp8393x_do_transmit_packets(dp8393xState =
*s)
>               */
>          } else {
>              /* Remove existing FCS */
> +            /* TODO check crc */

I don't understand this comment. Why would you check the CRC when it's=20
meant to be discarded here? (This is the CRCI enabled case.)

>              tx_len -=3D 4;
>              if (tx_len < 0) {
>                  trace_dp8393x_transmit_txlen_error(tx_len);
> @@ -758,7 +759,10 @@ static ssize_t dp8393x_receive(NetClientState *nc, c=
onst uint8_t * buf,
>          return pkt_size;
>      }
> =20
> -    rx_len =3D pkt_size + sizeof(checksum);
> +    rx_len =3D pkt_size;
> +    if (s->regs[SONIC_TCR] & SONIC_TCR_CRCI) {
> +        rx_len +=3D sizeof(checksum);
> +    }
>      if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
>          padded_len =3D ((rx_len - 1) | 3) + 1;
>      } else {

This is in dp8393x_receive(), but CRCI does not apply to the recieve side=
=20
of the chip.

> @@ -801,9 +805,6 @@ static ssize_t dp8393x_receive(NetClientState *nc, co=
nst uint8_t * buf,
>      s->regs[SONIC_TRBA1] =3D s->regs[SONIC_CRBA1];
>      s->regs[SONIC_TRBA0] =3D s->regs[SONIC_CRBA0];
> =20
> -    /* Calculate the ethernet checksum */
> -    checksum =3D crc32(0, buf, pkt_size);
> -
>      /* Put packet into RBA */
>      trace_dp8393x_receive_packet(dp8393x_crba(s));
>      address =3D dp8393x_crba(s);
> @@ -811,10 +812,15 @@ static ssize_t dp8393x_receive(NetClientState *nc, =
const uint8_t * buf,
>                          buf, pkt_size);
>      address +=3D pkt_size;
> =20
> -    /* Put frame checksum into RBA */
> -    address_space_stl_le(&s->as, address, checksum, MEMTXATTRS_UNSPECIFI=
ED,
> -                         NULL);
> -    address +=3D sizeof(checksum);
> +    if (s->regs[SONIC_TCR] & SONIC_TCR_CRCI) {

Same mistake here.

> +        /* Calculate the ethernet checksum */
> +        checksum =3D crc32(0, buf, pkt_size);
> +
> +        /* Put frame checksum into RBA */
> +        address_space_stl_le(&s->as, address, checksum, MEMTXATTRS_UNSPE=
CIFIED,
> +                             NULL);
> +        address +=3D sizeof(checksum);
> +    }
> =20
>      /* Pad short packets to keep pointers aligned */
>      if (rx_len < padded_len) {
>=20

Anyway, I think you are right about the FCS endianness error (which you=20
address in the next patch).
---1463811774-1498345879-1625359741=:7--

