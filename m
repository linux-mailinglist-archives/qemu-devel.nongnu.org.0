Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D357564B729
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:19:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p567b-00081Y-KK; Tue, 13 Dec 2022 09:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p567X-0007y1-ST
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:19:00 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p567W-0002NI-6K
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:18:59 -0500
Received: by mail-pl1-x631.google.com with SMTP id w23so15746638ply.12
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 06:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+m6ZKAICPn9j3w/htDAK7QNQLYXiFdOWEL40MP21xhA=;
 b=WPRyl7t+ywhcpnp/UEHC1DaWN7KsyMuiKOARM9g9NpqewayvRUDHdB7aOCNtBgcASD
 s/SNi2s/HE49WwFvXIiWA97auvqv/oKasO2S12/64Ua7NNroGFrsiYkDSc1dSI2P+Yqj
 ALXOf1FJMEpUkQ/+wxdTlRBqb8WJVN6Cp0rSW5L098vlfpXZhByMe5slgIDRF6rHgWnZ
 NwrPjmEyb+NYqhlKsj2Ho4pUt+jEihASKbwM9cpCPBu3cDMOX9yFEVbX10vLNiJt4xox
 Q4NCH4E8RosYYSPNDm1RDKd+y2njzTM7svt+rjy2bG1EJijmQshjWTGZveyHivndqE79
 dYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+m6ZKAICPn9j3w/htDAK7QNQLYXiFdOWEL40MP21xhA=;
 b=YUFMt5LqCwjXTggVlm5Om+jeqJZ/cNNIXo8P85pz1xr2NV7g2Dbyv3eXE9TLj2jmZD
 QqAV2OkKyIQjcJCnmB0+0FCZYkPrdTujQwQ/l9IS+dFFMZ2nhwFSHXE6tIklDO6ivGsI
 OfmjMWicNG5GsuBxU9ezhUDQg3Q3u4n1VpuXyl+y0YqegAdGk/zkQGFxQtGSvlgn2aVF
 4LxqbPjtXo1cAEYb9nNGlIZnWWEyu24R4bb13KESC0Fb4/gYdMsUnMd0LSjIXvdnVfe0
 2vJCBa0P+R9T6+BA9EoCVKR7X8YUG3uqvl9DN56XUhujUQebmbyyTOj5wgcPR7/VYt4n
 LQEw==
X-Gm-Message-State: ANoB5pnjNy6ZTfYu02CuCv30bwyUUCKq1Dw7cip8L1y4PBgdIM5/sbVB
 +vaBB7QOVOx6VExZRC0UCorneJ3P5mJRVaSNv400jw==
X-Google-Smtp-Source: AA0mqf7e7VLetqtGNv2LtFG+EuaowCmUrdbYDZVMJPdl/9rnLnDLXB2yktoYvnXe9r8OpzSozvvE6Wi4xoUbggRKqEc=
X-Received: by 2002:a17:90b:3c05:b0:219:e2f1:81ad with SMTP id
 pb5-20020a17090b3c0500b00219e2f181admr350081pjb.19.1670941134469; Tue, 13 Dec
 2022 06:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-4-philmd@linaro.org>
 <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
 <Y5iEL5YexYliX+cG@toto>
In-Reply-To: <Y5iEL5YexYliX+cG@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 14:18:42 +0000
Message-ID: <CAFEAcA8=fePrpR4LOp6qQznz58kNGgy8ZuiZaEE6Dy43hLvH3g@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32()
 by be32_to_cpu()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 13 Dec 2022 at 14:14, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Tue, Dec 13, 2022 at 01:53:15PM +0000, Peter Maydell wrote:
> > On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> > >
> > > This partly revert commit d48751ed4f ("xilinx-ethlite:
> > > Simplify byteswapping to/from brams") which states the
> > > packet data is stored in big-endian.
> > >
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >
> > > @@ -102,8 +102,8 @@ eth_read(void *opaque, hwaddr addr, unsigned int =
size)
> > >              D(qemu_log("%s " TARGET_FMT_plx "=3D%x\n", __func__, add=
r * 4, r));
> > >              break;
> > >
> > > -        default:
> > > -            r =3D tswap32(s->regs[addr]);
> > > +        default: /* Packet data */
> > > +            r =3D be32_to_cpu(s->regs[addr]);
> > >              break;
> > >      }
> > >      return r;
> > > @@ -160,8 +160,8 @@ eth_write(void *opaque, hwaddr addr,
> > >              s->regs[addr] =3D value;
> > >              break;
> > >
> > > -        default:
> > > -            s->regs[addr] =3D tswap32(value);
> > > +        default: /* Packet data */
> > > +            s->regs[addr] =3D cpu_to_be32(value);
> > >              break;
> > >      }
> > >  }
> >
> > This is a change of behaviour for this device in the
> > qemu-system-microblazeel petalogix-s3adsp1800 board, because
> > previously on that system the bytes of the rx buffer would
> > appear in the registers in little-endian order and now they
> > will appear in big-endian order.
> >
> > Edgar, do you know what the real hardware does here ?

> Yeah, I think these tx/rx buffers (the default case with tswap32)
> should be modelled as plain RAM's (they are just RAM's on real HW).
> Because we're modeling as MMIO regs, I think we get into endianness
> trouble when the ethernet output logic treats the content as a blob
> (thus the need for byteswaps). Does that make sense?

As a concrete question: if I do a 32-bit load from the buffer
register into a CPU register, do I get a different value
on the BE microblaze hardware vs LE microblaze ?

thanks
-- PMM

