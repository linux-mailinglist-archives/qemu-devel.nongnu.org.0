Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A3123401
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 18:57:24 +0100 (CET)
Received: from localhost ([::1]:44664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihH63-0000WA-BJ
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 12:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihH4g-00080v-9A
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 12:56:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihH4f-0002Eq-1T
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 12:55:58 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39373
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihH4e-0002Cd-UL
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 12:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576605356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=XonMyJTSYe6axvH2XhPYMlGqglKHeb2J0yyugOm/J1I=;
 b=CPzS9o6klYqRavTeoQ/+ici5sjuyN6tscaMlJCWotBghTJqC+THeKP5TmU6mVVFAETdYEk
 eGPBxM7VF56U7L/rkxMYq9UWPaaZsMsKNcCyljeiABv3aIHguYS/l/w3O4eJUWeWy0JKHB
 INTZPoczuOLCQX64SXFUjtZKU/8NVjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-94uUp8tSNAyWNMdnECtJXQ-1; Tue, 17 Dec 2019 12:55:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88ED1107ACCA;
 Tue, 17 Dec 2019 17:55:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-149.ams2.redhat.com [10.36.116.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 881E960BE0;
 Tue, 17 Dec 2019 17:55:49 +0000 (UTC)
Subject: Re: [PATCH 3/6] hw/net/imx_fec: Rewrite fall through comments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2fc74b64-0a0b-c437-e925-4c16d3907da7@redhat.com>
Date: Tue, 17 Dec 2019 18:55:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217173425.5082-4-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 94uUp8tSNAyWNMdnECtJXQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/2019 18.34, Philippe Mathieu-Daud=C3=A9 wrote:
> GCC9 is confused by this comment when building with CFLAG
> -Wimplicit-fallthrough=3D2:
>=20
>   hw/net/imx_fec.c: In function =E2=80=98imx_eth_write=E2=80=99:
>   hw/net/imx_fec.c:906:12: error: this statement may fall through [-Werro=
r=3Dimplicit-fallthrough=3D]
>     906 |         if (unlikely(single_tx_ring)) {
>         |            ^
>   hw/net/imx_fec.c:912:5: note: here
>     912 |     case ENET_TDAR:     /* FALLTHROUGH */
>         |     ^~~~
>   cc1: all warnings being treated as errors
>=20
> Rewrite the comments in the correct place,  using 'fall through'
> which is recognized by GCC and static analyzers.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/net/imx_fec.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index bd99236864..30cc07753d 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -901,15 +901,17 @@ static void imx_eth_write(void *opaque, hwaddr offs=
et, uint64_t value,
>              s->regs[index] =3D 0;
>          }
>          break;
> -    case ENET_TDAR1:    /* FALLTHROUGH */
> -    case ENET_TDAR2:    /* FALLTHROUGH */
> +        /* fall through */

Wrong location. And I think you don't need any comment here at all, GCC
should stay silent without it?

> +    case ENET_TDAR1:
> +    case ENET_TDAR2:
>          if (unlikely(single_tx_ring)) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "[%s]%s: trying to access TDAR2 or TDAR1\n",
>                            TYPE_IMX_FEC, __func__);
>              return;
>          }
> -    case ENET_TDAR:     /* FALLTHROUGH */
> +        /* fall through */

I'd suggest to simply remove it, too.

> +    case ENET_TDAR:
>          if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
>              s->regs[index] =3D ENET_TDAR_TDAR;
>              imx_eth_do_tx(s, index);
>=20

 Thomas


