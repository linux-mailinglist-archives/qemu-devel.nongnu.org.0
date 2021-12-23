Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11C47E61D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 16:59:13 +0100 (CET)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0QUp-0003el-Hi
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 10:59:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@klauskiwi.com>)
 id 1n0QTi-0002xk-M9
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 10:58:02 -0500
Received: from [2607:f8b0:4864:20::d31] (port=35750
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <klaus@klauskiwi.com>)
 id 1n0QTg-0003tt-Iw
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 10:58:02 -0500
Received: by mail-io1-xd31.google.com with SMTP id y70so7692519iof.2
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 07:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=klauskiwi-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8p9MLaCKz/fqR+Dj6FewUhKVZsrPCzwWYzzcA88mmmo=;
 b=s/WkxmIkQNxJs9nzOxQNdHF2GCUot5uUEtWLzW6p+IxvjG4zIZ2+zZw46zrm0Fgj87
 IMpXGmfDaGMThN0nwzEZa56ASVQakieOzoORenlhzx298HBh4evCWONJq6SrwPrTZERu
 Rv+pV+UkHOGgPOmeYa1fA/LtTtRC/k2cIveALEQMVko1bejJ4+Cpt/gspg+m70xzJFS6
 BhEzdlQeHSVV1FFx+UUA+rjxrzTBNfgtn4NHSqkoUXhFpXSP6KyC+G77K+oqdf8VegP8
 7U0iWhGulV+hX5Gtt9+5I1rLbiRir6eCFOimKZXYZ7wyggPMS4zUvsJ0Qsca5BgBIuUM
 LTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8p9MLaCKz/fqR+Dj6FewUhKVZsrPCzwWYzzcA88mmmo=;
 b=zM6fXr26+zlpgZpydPcTAZEbNU+/4Z2D8BfpZEfrS9AxO09gKKeZHHw7RdPW22JyH5
 bNtAU/UYsKPQrwpgmY0JILJDGOnpBhXeC91XL+uk5eSuQI4NcqaMSQ/G8yve9sS/4WTy
 xsYXTM8t8ju3BuzkRAF/QYcfvAhE9VHr1CHy9J5clonwlPGAgehio/fLTwhc7hLrCE8E
 wRrCSB8jUqZhGRzJ1Ej0KQ14kJ0CnE0McUD98PCF8l+NlrLR5hOokfEzO2Pu+leZUjfV
 +da2dMG1K94GyXy3FIvPkOhYjVsZKj0aQKSbS9j3heYrvCDTjusG7PqQLW5e6EhuTFhF
 JjvA==
X-Gm-Message-State: AOAM531K5q4w1T2nrRxa3fA/vpfJq37WgGzd1b41ntDKphv/Cuqkgkc2
 ALzJsH0l7ptXrvjdSfAQ525Go9cOk3Q1vfbOp+EIiA==
X-Google-Smtp-Source: ABdhPJxA04tmo1S8zykjfguBGWHQrIFanhj/zZGCnfmkTTuabE3mzT8UH18OndkHJU/K44X/T/9zNpcp62D4QBEvQNY=
X-Received: by 2002:a05:6638:3815:: with SMTP id
 i21mr1656512jav.192.1640275078835; 
 Thu, 23 Dec 2021 07:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20211222022231.231575-1-troy_lee@aspeedtech.com>
 <8df385c9-b25c-80bb-fb27-88f774eb44c6@kaod.org>
In-Reply-To: <8df385c9-b25c-80bb-fb27-88f774eb44c6@kaod.org>
From: Klaus Heinrich Kiwi <klaus@klauskiwi.com>
Date: Thu, 23 Dec 2021 12:57:47 -0300
Message-ID: <CAJOFXWgEqYTAL59Z2CPzQTedYqN9pWuyiEt7jbG1ENZinNj=2w@mail.gmail.com>
Subject: Re: [PATCH] Supporting AST2600 HACE engine accumulative mode
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=klaus@klauskiwi.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Em qui., 23 de dez. de 2021 =C3=A0s 09:54, C=C3=A9dric Le Goater <clg@kaod.=
org> escreveu:
>
> [ Adding Klaus ]

Thanks Cedric. It's been a while since I've looked at this but I'll do my b=
est..

>
> On 12/22/21 03:22, Troy Lee wrote:
> > Accumulative mode will supply a initial state and append padding bit at
> > the end of hash stream.  However, the crypto library will padding those
> > bit automatically, so ripped it off from iov array.
> >
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> > ---
> >   hw/misc/aspeed_hace.c         | 30 ++++++++++++++++++++++++++++--
> >   include/hw/misc/aspeed_hace.h |  1 +
> >   2 files changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> > index 10f00e65f4..7c1794d6d0 100644
> > --- a/hw/misc/aspeed_hace.c
> > +++ b/hw/misc/aspeed_hace.c
> > @@ -27,6 +27,7 @@
> >
> >   #define R_HASH_SRC      (0x20 / 4)
> >   #define R_HASH_DEST     (0x24 / 4)
> > +#define R_HASH_KEY_BUFF (0x28 / 4)
> >   #define R_HASH_SRC_LEN  (0x2c / 4)
> >
> >   #define R_HASH_CMD      (0x30 / 4)
> > @@ -94,7 +95,10 @@ static int hash_algo_lookup(uint32_t reg)
> >       return -1;
> >   }
> >
> > -static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mo=
de)
> > +static void do_hash_operation(AspeedHACEState *s,
> > +                              int algo,
> > +                              bool sg_mode,
> > +                              bool acc_mode)
> >   {
> >       struct iovec iov[ASPEED_HACE_MAX_SG];
> >       g_autofree uint8_t *digest_buf;
> > @@ -103,6 +107,7 @@ static void do_hash_operation(AspeedHACEState *s, i=
nt algo, bool sg_mode)
> >
> >       if (sg_mode) {
> >           uint32_t len =3D 0;
> > +        uint32_t total_len =3D 0;
> >
> >           for (i =3D 0; !(len & SG_LIST_LEN_LAST); i++) {
> >               uint32_t addr, src;
> > @@ -127,6 +132,21 @@ static void do_hash_operation(AspeedHACEState *s, =
int algo, bool sg_mode)
> >               plen =3D iov[i].iov_len;
> >               iov[i].iov_base =3D address_space_map(&s->dram_as, addr, =
&plen, false,
> >                                                   MEMTXATTRS_UNSPECIFIE=
D);
> > +
> > +            total_len +=3D plen;
> > +            if (acc_mode && len & SG_LIST_LEN_LAST) {
I think we should make the precedence here explicit (with the use of
()) instead of implicit. Also, isn't (len * SGL_LIST_LEN_LAST) always
true inside this for loop?

> > +                /*
> > +                 * Read the message length in bit from last 64/128 bit=
s
> > +                 * and tear the padding bits from iov
> > +                 */
> > +                uint64_t stream_len;
> > +
> > +                memcpy(&stream_len, iov[i].iov_base + iov[i].iov_len -=
 8, 8);
> > +                stream_len =3D __bswap_64(stream_len) / 8;
> > +

I no longer have access to the aspeed workbook I guess, but what is
the actual specification here? is the message length 64 or 128 bits?
and bswap seems arch-dependent - you probably want to be explicit if
this is big or little-endian and use the appropriate conversion
function.

> > +                if (total_len > stream_len)
> > +                    iov[i].iov_len -=3D total_len - stream_len;
> > +            }

I guess you're not using total_len except for this comparison? Feels
like there's a better way to first compare and then assign the value,
other than assign, compare, re-assign etc.

The rest of it looks fine apparently. Are you planning on adding to
the testcases are well?

Thanks,

 -Klaus

 /*
 <klaus@klauskiwi.com> - http://blog.klauskiwi.com
 */

> >           }
> >       } else {
> >           hwaddr len =3D s->regs[R_HASH_SRC_LEN];
> > @@ -210,6 +230,9 @@ static void aspeed_hace_write(void *opaque, hwaddr =
addr, uint64_t data,
> >       case R_HASH_DEST:
> >           data &=3D ahc->dest_mask;
> >           break;
> > +    case R_HASH_KEY_BUFF:
> > +        data &=3D ahc->key_mask;
> > +        break;
> >       case R_HASH_SRC_LEN:
> >           data &=3D 0x0FFFFFFF;
> >           break;
> > @@ -234,7 +257,7 @@ static void aspeed_hace_write(void *opaque, hwaddr =
addr, uint64_t data,
> >                           __func__, data & ahc->hash_mask);
> >                   break;
> >           }
> > -        do_hash_operation(s, algo, data & HASH_SG_EN);
> > +        do_hash_operation(s, algo, data & HASH_SG_EN, data & HASH_DIGE=
ST_ACCUM);
> >
> >           if (data & HASH_IRQ_EN) {
> >               qemu_irq_raise(s->irq);
> > @@ -333,6 +356,7 @@ static void aspeed_ast2400_hace_class_init(ObjectCl=
ass *klass, void *data)
> >
> >       ahc->src_mask =3D 0x0FFFFFFF;
> >       ahc->dest_mask =3D 0x0FFFFFF8;
> > +    ahc->key_mask =3D 0x0FFFFFC0;
> >       ahc->hash_mask =3D 0x000003ff; /* No SG or SHA512 modes */
> >   }
> >
> > @@ -351,6 +375,7 @@ static void aspeed_ast2500_hace_class_init(ObjectCl=
ass *klass, void *data)
> >
> >       ahc->src_mask =3D 0x3fffffff;
> >       ahc->dest_mask =3D 0x3ffffff8;
> > +    ahc->key_mask =3D 0x3FFFFFC0;
> >       ahc->hash_mask =3D 0x000003ff; /* No SG or SHA512 modes */
> >   }
> >
> > @@ -369,6 +394,7 @@ static void aspeed_ast2600_hace_class_init(ObjectCl=
ass *klass, void *data)
> >
> >       ahc->src_mask =3D 0x7FFFFFFF;
> >       ahc->dest_mask =3D 0x7FFFFFF8;
> > +    ahc->key_mask =3D 0x7FFFFFF8;
> >       ahc->hash_mask =3D 0x00147FFF;
> >   }
> >
> > diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hac=
e.h
> > index 94d5ada95f..2242945eb4 100644
> > --- a/include/hw/misc/aspeed_hace.h
> > +++ b/include/hw/misc/aspeed_hace.h
> > @@ -37,6 +37,7 @@ struct AspeedHACEClass {
> >
> >       uint32_t src_mask;
> >       uint32_t dest_mask;
> > +    uint32_t key_mask;
> >       uint32_t hash_mask;
> >   };
> >
> >
>

