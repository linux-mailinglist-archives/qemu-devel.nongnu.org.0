Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9488333E996
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:24:54 +0100 (CET)
Received: from localhost ([::1]:50518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPbx-0001eI-5E
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPa9-0001Ah-EG
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:23:01 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:42376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPa7-0006Fo-I9
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:23:01 -0400
Received: by mail-yb1-xb31.google.com with SMTP id n195so39376114ybg.9
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w4Cq9I2i2F9e521+5HUaKzhA2hGh6Jjw1BnfO37rm7k=;
 b=Whpb+WCF9p+KciLYDZrM7y4URFbzc0W9ZIcWCGMrnMNgf/yJMMjcsVhpZqjVaLVJZm
 VO29+Mrb+QqT2piXIKS+HiDVOLKc89JszdkvQRec5iPIt2TzLN03lP9v+ixMIrOxRWFa
 GGmUHv8gMKO5w3DM4lIHMRB2XXCiDFl13+AcWaY9MLvaB/Ek7OyAweQHWnfVBmjfhmBi
 YTm2M1ryDiH2fD0yeAWhTxW1w1DP2OiiI5x9uQo3aVItcPo4+lQR8oAsaJzaI48dz146
 ZbaH425edLB3Cezhu8tLZ0yNdgSdE7UfGhL+vMehaDUqowxUmxYQwrdlnuEfiROc1NJr
 pYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w4Cq9I2i2F9e521+5HUaKzhA2hGh6Jjw1BnfO37rm7k=;
 b=AvuLpo29pky5AW1Xl4E/UEdnXI4xR+Ju8DljFu2xShgPs0cEeaxTX2Od3wVy8V8nYV
 foANvcYaMG4ATMh2JseiSVrfhzmG/d56sEBKRpWyiqnibDkScmOH7RvO9AIu1XoiSnJ9
 GSWMTbP5/cPtYvTpUPndK+DnArg5lFE/qOAVqTycoKGMzAdt99yAV98I0Xv+e+rDGxdT
 j92b0QhkKI1ZUlnOIvIvcP+N7QMdPGWrOerYhrXT37wTern0HXMctTCuhG4FtY0s0hoh
 rbhw3JQKCJFagxmBLnIlR4m5j8eY4IKHBs89NZxssJNRf6cojmhyo75A5bveWJz8kjLm
 1G+Q==
X-Gm-Message-State: AOAM532W7/hIMuw/MY+z9eu68NzXDuOBeiam8dWtez7cBIBfGMRP+CST
 cPYH4rDbV3mK7tY/oOMhAiWnqgHSL4dvTOLT4Rw=
X-Google-Smtp-Source: ABdhPJzpBvnENqk6ER6saGDhYri1RfuERfV3zcGXpTKP3KluNi/acyesKsBbBMhb/86NsSi8G8SI6xOD17I6smevap4=
X-Received: by 2002:a25:8712:: with SMTP id a18mr2690632ybl.306.1615962178430; 
 Tue, 16 Mar 2021 23:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
 <20210316120420.19658-2-bmeng.cn@gmail.com>
 <780f9e21-ab2c-e48f-b5ba-53f1c7bb01ea@redhat.com>
In-Reply-To: <780f9e21-ab2c-e48f-b5ba-53f1c7bb01ea@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 17 Mar 2021 14:22:47 +0800
Message-ID: <CAEUhbmXZv6d=L2WZoGzrSsA+TwQ37YiVCg-sSwjFD85RHEt5jQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] net: eth: Add a helper to pad a short Ethernet
 frame
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 11:09 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 3/16/21 1:04 PM, Bin Meng wrote:
> > Add a helper to pad a short Ethernet frame to the minimum required
> > length, which can be used by backend codes.
>
> "backend codes" sounds odd but I'm not native English speaker.
> I'd have used "backends' code" instead...
>

Will update in v5.

> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >
> > ---
> >
> > Changes in v4:
> > - change 'ethernet' to 'Ethernet'
> > - do not inline the helper
> > - check the padded buffer size to avoid buffer overflow
> >
> > Changes in v3:
> > - use 'without' instead of 'sans'
> > - add a helper to pad short frames
> >
> >  include/net/eth.h | 17 +++++++++++++++++
> >  net/eth.c         | 17 +++++++++++++++++
> >  2 files changed, 34 insertions(+)
> >
> > diff --git a/include/net/eth.h b/include/net/eth.h
> > index 0671be6916..6aabbdd0d3 100644
> > --- a/include/net/eth.h
> > +++ b/include/net/eth.h
> > @@ -31,6 +31,7 @@
> >
> >  #define ETH_ALEN 6
> >  #define ETH_HLEN 14
> > +#define ETH_ZLEN 60     /* Min. octets in frame without FCS */
> >
> >  struct eth_header {
> >      uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
> > @@ -422,4 +423,20 @@ bool
> >  eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
> >                     size_t ip6hdr_off, eth_ip6_hdr_info *info);
> >
> > +/**
> > + * eth_pad_short_frame - pad a short frame to the minimum Ethernet fra=
me length
> > + *
> > + * If the Ethernet frame size is shorter than 60 bytes, it will be pad=
ded to
> > + * 60 bytes at the address @padded_pkt.
> > + *
> > + * @padded_pkt: buffer address to hold the padded frame
> > + * @padded_buflen: buffer length of @padded_pkt. If the frame is padde=
d, it is
> > + *                 written to ETH_ZLEN, otherwise it remains unchanged=
.
>
>  @padded_buflen: pointer holding length of @padded_pkt. If the frame is
>                  padded, the length will be updated to the padded one.

Will update in v5.

>
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> (since you describe frames, maybe s/pkt/frame/?)
>

By looking at the existing codes, 'pkt' seems to be a common variable
name representing ethernet frames, hence I will keep this as it is.

Regards,
Bin

