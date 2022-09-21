Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641675E547F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 22:30:33 +0200 (CEST)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob6Ma-0001Yl-Gu
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 16:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ob6K8-0008BJ-03
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 16:28:00 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:44764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ob6K4-0007c1-NN
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 16:27:59 -0400
Received: by mail-lj1-x22e.google.com with SMTP id q17so8412841lji.11
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 13:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=chC5djbqwK5wQimRFHo3Ip8jc60RNJot6GGNTy48oIo=;
 b=d9y06fo+4cX/58hRA9zTZ25Ww1bX231jFKK00llUzPWM79Oki2n1V7QqtrRd7Eiju8
 /jKXgCp0Hpgu1iZau/TPI4xOXqJ5Lxw5o/yUIY1PJEs3HWnj6rHHGngiubV/x3UKL4gW
 iXrrEDfRLTr16Qfy5guTaq27CNkRkoeAX8bdVQL1ODtYxHbs19AE3If7IuEVs4CpB09Q
 NaaGshIF3h3FUNzkseDxo+XWkJPVvOG4j1ApvAaVbSnJjgxLRcaMya61bVAAw27+EGjv
 JDymeDRLXyoCaQZA8eySeyNYI9ceRyJClSdGxH+1fhmSfQuxtiRI/G1KiY8X6lNMHGHz
 yJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=chC5djbqwK5wQimRFHo3Ip8jc60RNJot6GGNTy48oIo=;
 b=CP6UsAruu+A+v0hyhYUK4QqFt+EjTwbYGK8DEOONVLC30U4007d3t619ERa9I/XRXv
 456vR9pBqzVL39JGi/rmUJAtOKusbdmwX+qJwlShlsK0W0v4F2v8q3AFU/+ai+pmf83o
 I6KQ3oZE9ZhYkNcFfB6VA4IPd1ORwZ13i68Isrj4sErpvEEMFOwLF+cGA4TZluKzsqwq
 IpZDReMcuCPH0H4NZ6V+cLK3r4k9e720t+Z8Iz7yaVPC2RYaJpQ3ErO6woZmbxvGjvM0
 /tyJ1ndVpZy+615YgK4QI1lfgu/zVmvlV6khdNhcodIpVBJczA5g55BpbjT7/KDC1+IP
 Uepw==
X-Gm-Message-State: ACrzQf1pEsCKhoEficgP/UQqziZjjfZwy7vFx2qohENyrsEdAQQRYgtN
 hq/tOGWgjEx2jD4Ugojw6qE=
X-Google-Smtp-Source: AMsMyM48KLUAFmmy+pkntucr4aJ15LzaEg1obD0ZAhnRQnaLKB9UxE6v3fBGnH+9Vuyq3olGX5hVOw==
X-Received: by 2002:a05:651c:1141:b0:261:6ea9:ac97 with SMTP id
 h1-20020a05651c114100b002616ea9ac97mr9819507ljo.434.1663792074856; 
 Wed, 21 Sep 2022 13:27:54 -0700 (PDT)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 s12-20020ac25fac000000b00498c07c6ddasm569309lfe.288.2022.09.21.13.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 13:27:54 -0700 (PDT)
Date: Wed, 21 Sep 2022 22:27:54 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH RESEND] hw/microblaze: pass random seed to fdt
Message-ID: <20220921202754.GB1309842@toto>
References: <CAJy5ezp-x2R=4yg=S6Tq2U67N8J2mkXNJ=wkv1oqB3r37hiunQ@mail.gmail.com>
 <20220908094030.189665-1-Jason@zx2c4.com>
 <CAHmME9rQWr5CTePKBT5nRi8OZXaBaRWQYDyNeSiSPwdzqBx2Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9rQWr5CTePKBT5nRi8OZXaBaRWQYDyNeSiSPwdzqBx2Hw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 21, 2022 at 12:32:37PM +0200, Jason A. Donenfeld wrote:
> On Thu, Sep 8, 2022 at 11:40 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> > initialize early. Set this using the usual guest random number
> > generation function. This FDT node is part of the DT specification.
> >
> > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> >  hw/microblaze/boot.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> > index 8b92a9801a..25ad54754e 100644
> > --- a/hw/microblaze/boot.c
> > +++ b/hw/microblaze/boot.c
> > @@ -30,6 +30,7 @@
> >  #include "qemu/option.h"
> >  #include "qemu/config-file.h"
> >  #include "qemu/error-report.h"
> > +#include "qemu/guest-random.h"
> >  #include "sysemu/device_tree.h"
> >  #include "sysemu/reset.h"
> >  #include "hw/boards.h"
> > @@ -75,6 +76,7 @@ static int microblaze_load_dtb(hwaddr addr,
> >      int fdt_size;
> >      void *fdt = NULL;
> >      int r;
> > +    uint8_t rng_seed[32];
> >
> >      if (dtb_filename) {
> >          fdt = load_device_tree(dtb_filename, &fdt_size);
> > @@ -83,6 +85,9 @@ static int microblaze_load_dtb(hwaddr addr,
> >          return 0;
> >      }
> >
> > +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> > +    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
> > +
> >      if (kernel_cmdline) {
> >          r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
> >                                      kernel_cmdline);
> > --
> > 2.37.3
> >
> 
> Bumping this patch. Could somebody queue this up?

Hi Jason,

I've just sent a pull-request with this patch.

Thanks,
Edgar

