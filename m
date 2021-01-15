Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435DC2F8803
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:59:02 +0100 (CET)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0X7V-0004pu-Ax
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0X5Y-0004Ko-M7
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:57:00 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:35249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0X5X-00056b-3K
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:57:00 -0500
Received: by mail-io1-xd36.google.com with SMTP id y19so21060318iov.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1YAWgprq/Anf0kXoEBBOWxTnNjOXAb+Frn/NqdYczpQ=;
 b=a44TD7v1xOnedeKHr0PLHasFRR//qfcLDFn7DqyLhrZGBXWJLHHIRlOCEhC1G++9UB
 pOsJPmgWgyIrLSKLiR6reo0NJy0ah/rpjegpYbs4EtGZcQfPLLRHmrOXA/wSbDXIGdSJ
 DZTNLimUOvyYdQk8f/XCcA+lkZKV6Mmor5rRkAEW66/cZdx4OepQhtgi4Bq8/TIKQ6rQ
 jkBIJ2vKJfGWxQ7KxlvixF9/CwM7Lw1XodkQxjVTS+zIlNKYvEKOQsN3DrEy47+o0xFb
 beKz46YjfThPfUxHbeOihF32WE+QzVDqaUaQgsWurW0xj6kIIgw1h98wgT6yqtfmAqIA
 LzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1YAWgprq/Anf0kXoEBBOWxTnNjOXAb+Frn/NqdYczpQ=;
 b=lTr8rGcoZp2SDF7rQK5s3apPKJJcTw4vZv6mCNJQIn72v0g9mGsMnK3GUGpDyQdauk
 Q7CQsLsdgPQU9hBFCn4bLWnGKueunOc2zA7+AtTsMJssoxy6P0DdELv3uhEQwysQT5lv
 +f+MKN2tyy6hkEL2iYcSxp4TxXWS59jIW142P6oamzcZXiG2a0WUlM1jG4RrmkizouWd
 r8mBvvN/2xn6iUhwBB6OrgeNTcYC5MENaddxqXsJVmLbHySodq/l61Qq4eJoOG9v7k0F
 R7RF/CI2vRsh5KrM8UY7gQna3b8OV2UIJw8c4GLPbnKXMTz5YAE9+Y5vh8FgyLMv1LgO
 Yo0w==
X-Gm-Message-State: AOAM531PbNawolTjf+SD3CfvbNdmfgKNnR9DPt2IMQGeDm8PLXuXtrbi
 HukMyUmj+lW/M7UMnxe4XEvDATlt0oB6G3WG3z4=
X-Google-Smtp-Source: ABdhPJzSEaOXZUFmo3qEsz+TCEdxxzDBLfem3V3OU1bObw01VeoRNUyFLToXvfKsc9CYGsprPXcy5k1squNLBdgYUuY=
X-Received: by 2002:a5e:850b:: with SMTP id i11mr9978796ioj.42.1610747818045; 
 Fri, 15 Jan 2021 13:56:58 -0800 (PST)
MIME-Version: 1.0
References: <20201104092900.21214-1-green.wan@sifive.com>
 <CAFEAcA_EykbnmTQuz4RT3qGMt-Atf=EAdaHd-QqBvJCPvwemqA@mail.gmail.com>
In-Reply-To: <CAFEAcA_EykbnmTQuz4RT3qGMt-Atf=EAdaHd-QqBvJCPvwemqA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 13:56:31 -0800
Message-ID: <CAKmqyKNpf5vpgo8+9nH0sjzE+bXGxz+pQQKAcYwB-R-EovUPLA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/sifive_u_otp: handling the fails of blk_pread and
 blk_pwrite
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Green Wan <green.wan@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 3:50 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Ping! This patch was trying to fix a Coverity issue (CID 1435959,
> 1435960, 1435961) -- is anybody planning to review it?
>
> (I'm not entirely sure 'guest error' is the right warning category,
> but I don't know the specifics of this device.)

Thanks for the ping, this feel through the cracks somehow.

Applied to riscv-to-apply.next

Alistair

>
> thanks
> -- PMM
>
> On Wed, 4 Nov 2020 at 09:29, Green Wan <green.wan@sifive.com> wrote:
> >
> > Fix code coverage issues by checking return value and handling fail case
> > of blk_pread() and blk_pwrite(). Return default value 0xff if read fails.
> >
> > Signed-off-by: Green Wan <green.wan@sifive.com>
> > ---
> >  hw/misc/sifive_u_otp.c | 31 +++++++++++++++++++++++--------
> >  1 file changed, 23 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> > index 60066375ab..4314727d0d 100644
> > --- a/hw/misc/sifive_u_otp.c
> > +++ b/hw/misc/sifive_u_otp.c
> > @@ -62,8 +62,13 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
> >              if (s->blk) {
> >                  int32_t buf;
> >
> > -                blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
> > -                          SIFIVE_U_OTP_FUSE_WORD);
> > +                if (blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
> > +                              SIFIVE_U_OTP_FUSE_WORD) < 0) {
> > +                    qemu_log_mask(LOG_GUEST_ERROR,
> > +                                  "read error index<%d>\n", s->pa);
> > +                    return 0xff;
> > +                }
> > +
> >                  return buf;
> >              }
> >
> > @@ -160,8 +165,12 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
> >
> >              /* write to backend */
> >              if (s->blk) {
> > -                blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
> > -                           &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD, 0);
> > +                if (blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
> > +                               &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD,
> > +                               0) < 0) {
> > +                    qemu_log_mask(LOG_GUEST_ERROR,
> > +                                  "write error index<%d>\n", s->pa);
> > +                }
> >              }
> >
> >              /* update written bit */
> > @@ -248,12 +257,18 @@ static void sifive_u_otp_reset(DeviceState *dev)
> >          int index = SIFIVE_U_OTP_SERIAL_ADDR;
> >
> >          serial_data = s->serial;
> > -        blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
> > -                   &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0);
> > +        if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
> > +                       &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "write error index<%d>\n", index);
> > +        }
> >
> >          serial_data = ~(s->serial);
> > -        blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
> > -                   &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0);
> > +        if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
> > +                       &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "write error index<%d>\n", index + 1);
> > +        }
> >      }
> >
> >      /* Initialize write-once map */
> > --
> > 2.17.1

