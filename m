Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445C93B7583
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:31:28 +0200 (CEST)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFhs-0003zz-3n
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyFgG-0002vc-CE
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:29:44 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyFgE-0006PW-5A
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:29:43 -0400
Received: by mail-ej1-x636.google.com with SMTP id bg14so37020535ejb.9
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MdfKbITDCX6m8sRlWNWLycTq5IZIdSqG13zXlc0UuMQ=;
 b=KTUNQ7N4PZAX0ipo861fgx64MDG8Em0/7aoPKA5CeOEfElhNkK7CyhcR1Ku+WxUlPY
 uNVuRFh5H+MKZdX0HR6aE3AGOLSWaA40Ruk98lxfXTil9ZqL8JrlcMXBR7B7VNbjzABl
 SMK7h0AOdGjPBFAThmx/ZG5e0gQ8ezPJvaTJ0+5npePywEYhGw7usw/7w/x12x+8cTQg
 POn3VPhF4qdOM5KYbjylEW5d/5f8d+RNCFpdoYZvHMnPDAfHJ9hat8OLCyvnFgzNYy7l
 AUDdUC+CpYLhrZve/cGI69M1Np3Hz5xZx90wnQbnHyaiFQOphDx4jMOnVAVdSII0Y7dS
 ZuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MdfKbITDCX6m8sRlWNWLycTq5IZIdSqG13zXlc0UuMQ=;
 b=kJano6W48wvONXtVTOL4fN62WHsNvGsiGaj7B7mayM4qYMoLLqKfpYJo5HVtaCyjTr
 zrYXbonNq/mT1zM2XVRz3O6+UvtHah1Omte18eFRjPan5twtowkrSvwolCK8OxmfSxHK
 yjUEnT63vg4tzN/L/U3K28YRWHvK62KuQO20uQx9q7Dgtq7vdDC5Yn9i5HfraRePn2PX
 m4Z6m0Ax5xg6gDVVzB8MBrEe7+YUPIFNN0RAcSt/FdfVAaEXgXfm4nBQxpihE2hrBDCX
 iE01npALuoLfGpwtZsdvzGM4wUVLC6roxU8H2q/Px/5VPxSPgyarQmVZFr62dqWqqKzt
 dDTw==
X-Gm-Message-State: AOAM53282k97CIF6mIvtIELdWemlWigaqR4YBIgERJ2bhmiLOLxumnfE
 SqE/O+Lpbc1E7KPmaqj+6zHTcv6GqgJMwi0v8QsNTA==
X-Google-Smtp-Source: ABdhPJyfTecbAVGR1EukarMjVr7k5LeicCoI0gIP+5pUCyTULlxTUei6Ls6l3OdWkL3MFW+WLBoAblOBQNKkzHPSMr4=
X-Received: by 2002:a17:906:4759:: with SMTP id
 j25mr30298496ejs.4.1624980580400; 
 Tue, 29 Jun 2021 08:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210625111842.3790-1-maxim.uvarov@linaro.org>
 <20210625111842.3790-3-maxim.uvarov@linaro.org>
 <CAFEAcA9K642UHLF5D5wzS0sN8fVurcs4-TN0x6EaT=xBRB0Fkg@mail.gmail.com>
In-Reply-To: <CAFEAcA9K642UHLF5D5wzS0sN8fVurcs4-TN0x6EaT=xBRB0Fkg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 16:29:03 +0100
Message-ID: <CAFEAcA9oxUu13yHT0yzsAg57uOWH4opNUzhg7EwGJcb=_sicQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio_pwr: use shutdown function for reboot
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 at 12:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 25 Jun 2021 at 12:18, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > qemu has 2 type of functions: shutdown and reboot. Shutdown
> > function has to be used for machine shutdown.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  hw/gpio/gpio_pwr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
> > index 7714fa0dc4..dbaf1c70c8 100644
> > --- a/hw/gpio/gpio_pwr.c
> > +++ b/hw/gpio/gpio_pwr.c
> > @@ -43,7 +43,7 @@ static void gpio_pwr_reset(void *opaque, int n, int level)
> >  static void gpio_pwr_shutdown(void *opaque, int n, int level)
> >  {
> >      if (level) {
> > -        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> > +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> >      }
> >  }
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

There are clearly more problems with this GPIO setup that we need
to get to the bottom of. But in the meantime this patch 2 is an
obvious bug fix, so I'm going to to apply it to target-arm.next.

thanks
-- PMM

