Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC07E3DA032
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 11:23:24 +0200 (CEST)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92GB-0006KD-ST
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 05:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1m92Du-0005Xw-UI
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:21:02 -0400
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:52797)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1m92Ds-0004ga-KU
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:21:02 -0400
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 16T9K1xI082935;
 Thu, 29 Jul 2021 11:20:01 +0200 (CEST)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 16T9K0TM026496; Thu, 29 Jul 2021 11:20:00 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 16T9K0Nn026495;
 Thu, 29 Jul 2021 11:20:00 +0200
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Qiang Ning <ningqiang1@huawei.com>
Subject: Re: [PATCH] hw/net/can: sja1000 fix buff2frame_bas for dlc out of std
 CAN 8 bytes
Date: Thu, 29 Jul 2021 11:19:22 +0200
User-Agent: KMail/1.9.10
References: <20210726162458.26197-1-pisa@cmp.felk.cvut.cz>
In-Reply-To: <20210726162458.26197-1-pisa@cmp.felk.cvut.cz>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4049665.77Mnhh6tjp";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <202107291119.33951.pisa@cmp.felk.cvut.cz>
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 16T9K1xI082935
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.536, required 6, autolearn=not spam, BAYES_00 -0.50,
 KHOP_HELO_FCRDNS 0.40, NICE_REPLY_A -0.44, SPF_HELO_NONE 0.00,
 SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1628155202.40245@98hmWxHfBAKY+9732DqJAQ
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.277,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nextPart4049665.77Mnhh6tjp
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello everybody,

please, can somebody accept the fix for master?
It should be ideally applied even to stable
branches.

Or should I send request through some other form
then on the list?

Thanks,

Pavel

On Monday 26 of July 2021 18:24:58 Pavel Pisa wrote:
> Problem reported by openEuler fuzz-sig group.
>
> The buff2frame_bas function (hw\net\can\can_sja1000.c)
> infoleak(qemu5.x~qemu6.x) or stack-overflow(qemu 4.x).
>
> Reported-by: Qiang Ning <ningqiang1@huawei.com>
> Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> ---
>  hw/net/can/can_sja1000.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
> index 42d2f99dfb..64e81bff58 100644
> --- a/hw/net/can/can_sja1000.c
> +++ b/hw/net/can/can_sja1000.c
> @@ -311,6 +311,10 @@ static void buff2frame_bas(const uint8_t *buff,
> qemu_can_frame *frame) }
>      frame->can_dlc = buff[1] & 0x0f;
>
> +    if (frame->can_dlc > 8) {
> +        frame->can_dlc = 8;
> +    }
> +
>      for (i = 0; i < frame->can_dlc; i++) {
>          frame->data[i] = buff[2 + i];
>      }

--nextPart4049665.77Mnhh6tjp
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEjCxuwn2n4X+hUpSChoQQ/ytHCcsFAmECcpoACgkQhoQQ/ytH
Ccudbw//bqRery27UPl+aXe8lr9VE8iOtjOa/NINyXyf9nVdc9OtwODiE53MV2c7
DEtKdkCFolBEKp0mFZ0PwplsV/y2+q6ef8KP4jKxfApav/T/lEzVSOzKWXdMROLP
QeLFd0eNHLHoyKfpw+7GqZl3p8gi7AmwzMwsZApirM3oESR61GGOnV7yk6yjhGnU
bl+pYfoPAinapgDXNQHKOJQR0frWJc73x7wEIAHZ9XsSGqkYdX6hBcf0I2jRj8bu
g2QHvL3NWl3FE7l+bJ9qN+hhJHFkNesdPyufo84RW3OUDn5g4G7lPH4M+K3+Eofx
WRbC8FkeOn8lfLtAsCb1ExLirh/hBw5X8vdKteZiJT45ziGhdOQrSSBbfQoSV/Dc
EjNerKMiaQgsOCk2f83i+ebm9M5kTVFMxZi1r9wAUQTuUr23yL+cpQ0ixMbu+ofX
A2+mPy1CO6f4AsWQ40+VcWHvVsqXeYU3i0RO+y+Q/MPS0ATGLkyGr+4cL636xSk5
fNgwQYostAsRJWgVH+wtVw+yhkMEBXQkxGu+4mgH27wy2RFExcjOcYhGI1v02hYy
NbsdQkMmZOes9ylucrCA44KQKReWycLWaNXBVkHo43k11t2ul93tdt6sJtzQlMaF
nKRbnJ5NwrhSv/oY7pymYB5zjixb6SSvgvkzC1ug6ejBurEoTvQ=
=m3Pt
-----END PGP SIGNATURE-----

--nextPart4049665.77Mnhh6tjp--

