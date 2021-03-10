Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED1633460C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:59:43 +0100 (CET)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK37W-0007qt-2j
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lK2gG-00076p-15; Wed, 10 Mar 2021 12:31:33 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:54397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lK2gC-0006lt-78; Wed, 10 Mar 2021 12:31:30 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id CD3793148;
 Wed, 10 Mar 2021 12:31:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 10 Mar 2021 12:31:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=TghbB7aJpNrfYlH3Vr+G8g4Cm4ZnyNWM4SsT402BA
 Gc=; b=fY4py6GJDSinQ0jDPUoto18Dns/ZJDGjAWWvFAm88zAl3BOHGv4OLtscA
 QIBn0Qd2omgew7zqQX15MjXKsnWpMvHVxwLXyXUaR6eO6YGElDU06bOu25BSHWgu
 WEeEjsoiVhjWgwPnTjiM6hZ16o09r2ka7NmnqWlqC0wNt1VB1W6oeogbqlSSrOT2
 WNfulIoC5bwFFkoiS5PzA1oh7wvS1B6Z9H1S7QJrFvGj5iVItL0z2wKJDfED95kF
 5yGD1qnkLDXv1s2YU/5K8UaE8jhy90cs/dbDqOVP3FA8tDZMIJ7ljoGc2oP9ulA7
 ISbqE9wnZ/XiZ5SNa3lwvq/XlR6cQ==
X-ME-Sender: <xms:bQJJYNVfpoTe0r_UA1WYZg7q6fEDavPCh2jOt7x1tVgab-xsi7uNww>
 <xme:bQJJYNlHQksHmSJ2LVoGJB7yZ7WMOBceZHiRTTP2TNWJYiqVsO4IwljTcI_Chst4H
 Ls2camT-nWQJ6t_-zo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefvufgjfhfhfffkgggtgfesthhqredttddtjeenucfhrhhomhepffgrvhhi
 ugcugfgumhhonhgushhonhcuoegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvg
 drtghomheqnecuggftrfgrthhtvghrnhepkeeivddtgfeutddtfffhiefhfeeftddtkeek
 tdeludehjefggefhudejleevudfhnecukfhppeekuddrudekjedrvdeirddvfeeknecuve
 hluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepuggrvhhiugdr
 vggumhhonhgushhonhesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:bQJJYJblMfkH9Jueo48_DSdRdPQ6frqKNQbhQ1VJ2k4f0mMac2Z_lQ>
 <xmx:bQJJYAXxru0Lfc-2g0y0AvqlYs7G5Z2pxL2TBGpuIuRxCZg85khqhg>
 <xmx:bQJJYHnh5iK1I0bsaOBztHPOq3eSYtaoQcsnxWkMIqZhjHLE9dklFw>
 <xmx:bQJJYK9nW5bpLOmQTxYi5-1mpGcgZ6gOuxZRmSyLs4Ja7IrAZN7bjg>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4ED13240054;
 Wed, 10 Mar 2021 12:31:24 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 7024988c;
 Wed, 10 Mar 2021 17:31:23 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/12] hw/block/pflash_cfi02: Factor out
 pflash_reset_state_machine()
In-Reply-To: <20210310170528.1184868-8-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
 <20210310170528.1184868-8-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 10 Mar 2021 17:31:23 +0000
Message-ID: <m21rcmgbkk.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=64.147.123.25;
 envelope-from=david.edmondson@oracle.com; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_SOFTFAIL=0.665,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-03-10 at 18:05:23 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> There is multiple places resetting the internal state machine.
> Factor the code out in a new pflash_reset_state_machine() method.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/block/pflash_cfi02.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 2ba77a0171b..aea47a99c61 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -184,11 +184,17 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
>      pfl->rom_mode =3D true;
>  }
>=20=20
> +static void pflash_reset_state_machine(PFlashCFI02 *pfl)
> +{
> +    trace_pflash_reset();
> +    pfl->cmd =3D 0x00;
> +    pfl->wcycle =3D 0;
> +}
> +
>  static void pflash_mode_read_array(PFlashCFI02 *pfl)
>  {
>      trace_pflash_mode_read_array();
> -    pfl->cmd =3D 0x00;
> -    pfl->wcycle =3D 0;
> +    pflash_reset_state_machine(pfl);
>      pfl->rom_mode =3D true;
>      memory_region_rom_device_set_romd(&pfl->orig_mem, true);
>  }
> @@ -330,8 +336,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offs=
et, unsigned int width)
>      default:
>          /* This should never happen : reset state & treat it as a read*/
>          DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
> -        pfl->wcycle =3D 0;
> -        pfl->cmd =3D 0;
> +        pflash_reset_state_machine(pfl);
>          /* fall through to the read code */
>      case 0x80: /* Erase (unlock) */
>          /* We accept reads during second unlock sequence... */
> @@ -669,8 +674,7 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
>                  }
>                  reset_dq3(pfl);
>                  timer_del(&pfl->timer);
> -                pfl->wcycle =3D 0;
> -                pfl->cmd =3D 0;
> +                pflash_reset_state_machine(pfl);
>                  return;
>              }
>              /*
> @@ -710,10 +714,8 @@ static void pflash_write(void *opaque, hwaddr offset=
, uint64_t value,
>=20=20
>      /* Reset flash */
>   reset_flash:
> -    trace_pflash_reset();
>      pfl->bypass =3D 0;
> -    pfl->wcycle =3D 0;
> -    pfl->cmd =3D 0;
> +    pflash_reset_state_machine(pfl);
>      return;
>=20=20
>   do_bypass:
> --=20
> 2.26.2

dme.
--=20
"Can I take you out to the pictures, Joan?"

