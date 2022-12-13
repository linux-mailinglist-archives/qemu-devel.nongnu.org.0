Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E0464B74C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:25:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p56CJ-0002QT-QF; Tue, 13 Dec 2022 09:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p56CB-0002JT-IS; Tue, 13 Dec 2022 09:23:48 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p56C9-0003aG-HD; Tue, 13 Dec 2022 09:23:47 -0500
Received: by mail-lj1-x22c.google.com with SMTP id a19so3493528ljk.0;
 Tue, 13 Dec 2022 06:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=e5zzLhMCE4m/P0+GnT6JWCNY7dNVF5Jn5ir2faVnvHA=;
 b=C5CIlL6PlBwBjoNhGNPIOzJPBzPa8/yZxWif2z97y+BBpAA5ZZMOnSf9HImTiJ3t7j
 oX8wDwsru81NRdHJjJxmVA7mmzyKSYEu45CrHuLF6PlDZ6W4SivBCMeXRuPpGgIw9Adv
 RzE3iU9kHj9Ph+SxxLfrPLctPgYq5rWs+ptFMhfhVOI0ZB3FnwkzYezeqvXKYa9UFTU8
 5orGV/NrQND88m7cV8PpftyGBGPHL+ImLj744n6Fz8AA9GpnOoLH2wBKuqJ5lXZBFz3w
 5MRx9QWbtkrPWaVaxGVLuJv+5YeJQgJgEc0sDBbSDFsqlOS//y8Wp6Xr7m/GiLvFl/zO
 vFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e5zzLhMCE4m/P0+GnT6JWCNY7dNVF5Jn5ir2faVnvHA=;
 b=az4/ZToffdJn7Qfn8uFoJ9labuervfpy1c14wSpC76qWEhEoy4CZvv1ETEvMsWmfUa
 Qk8+WC96KN0mL4Zzm/kWd0uJMPYG4ZUkQdq+AzQaxTkDVgr4tzFXmIjPzPeTYnte+hJS
 EbZkk0xg8Npg+7yyIpOyDl1Sc2ArXg8IxZC0ijrHuyAUzgMqTDAzG2wf+KV471NJqGiM
 J5YEAcuZmUaeHXAm8b/OFxQ9pm47fHndTqakyoay8zIty4y6/+RAgTCqJEgPGFegpjZW
 pVZBq2J94QmmNA+GbimMoufW92fKFHwVsk/EUFUl5h+YLfSSp3doAx5NWLABr48stH7h
 RCUw==
X-Gm-Message-State: ANoB5plF5USBPfmlJXBfrQpV1FWAKe7MeX1QTGpb4bHaz7bYSQMKztIV
 txzNuMZw/wVLq/mw44qR7MQ=
X-Google-Smtp-Source: AA0mqf6DRawMpdqBftXsHrmtqOkjRPUQyDTzIgj+xswOsw5sa0nA6LGXB/Vr+bKpmBxVVNmqse8y8g==
X-Received: by 2002:a2e:bd87:0:b0:277:23f:4985 with SMTP id
 o7-20020a2ebd87000000b00277023f4985mr4825138ljq.3.1670941422826; 
 Tue, 13 Dec 2022 06:23:42 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a2eb8cd000000b00279f302f652sm278625ljp.111.2022.12.13.06.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 06:23:42 -0800 (PST)
Date: Tue, 13 Dec 2022 15:23:41 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32()
 by be32_to_cpu()
Message-ID: <Y5iK7VFi9B1HwHf/@toto>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-4-philmd@linaro.org>
 <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
 <Y5iEL5YexYliX+cG@toto>
 <CAFEAcA8=fePrpR4LOp6qQznz58kNGgy8ZuiZaEE6Dy43hLvH3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8=fePrpR4LOp6qQznz58kNGgy8ZuiZaEE6Dy43hLvH3g@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, Dec 13, 2022 at 02:18:42PM +0000, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 14:14, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> > On Tue, Dec 13, 2022 at 01:53:15PM +0000, Peter Maydell wrote:
> > > On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > > >
> > > > This partly revert commit d48751ed4f ("xilinx-ethlite:
> > > > Simplify byteswapping to/from brams") which states the
> > > > packet data is stored in big-endian.
> > > >
> > > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > >
> > > > @@ -102,8 +102,8 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
> > > >              D(qemu_log("%s " TARGET_FMT_plx "=%x\n", __func__, addr * 4, r));
> > > >              break;
> > > >
> > > > -        default:
> > > > -            r = tswap32(s->regs[addr]);
> > > > +        default: /* Packet data */
> > > > +            r = be32_to_cpu(s->regs[addr]);
> > > >              break;
> > > >      }
> > > >      return r;
> > > > @@ -160,8 +160,8 @@ eth_write(void *opaque, hwaddr addr,
> > > >              s->regs[addr] = value;
> > > >              break;
> > > >
> > > > -        default:
> > > > -            s->regs[addr] = tswap32(value);
> > > > +        default: /* Packet data */
> > > > +            s->regs[addr] = cpu_to_be32(value);
> > > >              break;
> > > >      }
> > > >  }
> > >
> > > This is a change of behaviour for this device in the
> > > qemu-system-microblazeel petalogix-s3adsp1800 board, because
> > > previously on that system the bytes of the rx buffer would
> > > appear in the registers in little-endian order and now they
> > > will appear in big-endian order.
> > >
> > > Edgar, do you know what the real hardware does here ?
> 
> > Yeah, I think these tx/rx buffers (the default case with tswap32)
> > should be modelled as plain RAM's (they are just RAM's on real HW).
> > Because we're modeling as MMIO regs, I think we get into endianness
> > trouble when the ethernet output logic treats the content as a blob
> > (thus the need for byteswaps). Does that make sense?
> 
> As a concrete question: if I do a 32-bit load from the buffer
> register into a CPU register, do I get a different value
> on the BE microblaze hardware vs LE microblaze ?

Yes, I beleive so.

If the CPU stores the value and reads it back, you get the same. But the representation on the RAM's is different between LE/BE.
But if the Ethernet logic writes Ethernet packet data into the buffer, LE and BE MicroBlazes will read differient values from the buffers. These buffer "registers" are just RAM's I beleive.

Best regards,
Edgar





