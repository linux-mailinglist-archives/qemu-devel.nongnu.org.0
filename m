Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C50657D389
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 20:43:45 +0200 (CEST)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEb9D-0005NT-MV
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 14:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oEb6f-0003Hq-Kp; Thu, 21 Jul 2022 14:41:05 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:42504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oEb6d-0002uL-Sh; Thu, 21 Jul 2022 14:41:05 -0400
Received: by mail-yb1-xb34.google.com with SMTP id c131so4225922ybf.9;
 Thu, 21 Jul 2022 11:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XGtsZv55+SUxCljDxqgcW+wvDHGClRhMxvFLQ4HsyEU=;
 b=Cr14nbaPeTmy/BAHa3MwpAwUroLWjcaD3A/ExE+3xj48yzxwkqoc86rdJA/8QeZWBU
 JTSGLPh9Ugf++uXzmk2OkTgw27gZWKr+Nglk0l2haZ16M8Dwf5mn1p4e8NjykiIG0saf
 GH2dJphsK75kzSk1OP9cjNfLx9qDHQgimdsmg14eQztyLU/x0e816m5GzXi0tVDiNR0+
 5FHbzu73n67NXw3wtsqZQJgegQpPf0bsoG6hNWbYnOLiOn7l4a0wZvffCC2nNAC8tEoc
 g2nV1tJ4kStdQA/vZqnfpVZEs03pWTlJvhhrv92OAmMEYfK7XD6I2fIWggocSA5q1i/B
 JqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XGtsZv55+SUxCljDxqgcW+wvDHGClRhMxvFLQ4HsyEU=;
 b=bElAiYDyFQrYWEKGoA1yO0f4q0gXwvqaOmf/MvPqEJFTBW/i+oCJTUtorr4yb/5cWl
 K2plA0cS60HHJfU1WjkJYXSbqnhpVp/x/OOlsTZPMHVRgtoT8OMU4pxL6gtxUF9jr3CU
 DtSyAuwluKFMKx6VwpWv0KNSgyu/aBs9wIZp0p0EJ72LzC03VdEX0VF63AXN6xwcJ0SW
 cAunpkjOu7naz4Ed8l3NuTBx+ToEjGgPowxsf/RSRJYaaPXWCQuGo0i2EAeZ7ywrRvuk
 Ro6nSmXFImwQkUiALX+OJfpq87Y6HSsxC7g8OHrOVm3Tr8OdGNw+osZ8yYn7Lr9FG7+f
 mdOA==
X-Gm-Message-State: AJIora8hVw2BfOcFAoIhQ06gnj5rVe7ZJQnnkuB1c2uwe99iozJ6a2uB
 A072T99NpXn9FOYIYpKMhVYmYiMYhPGGb2yeQdM=
X-Google-Smtp-Source: AGRyM1tndNevpYpdqypDhNM0J6MYDmR0PGLYB65nlim3JsltltoKlhheqCV4jrs1TgZCToNfz9Z1afL7nMjyPcDcrLc=
X-Received: by 2002:a25:30c4:0:b0:670:9351:324f with SMTP id
 w187-20020a2530c4000000b006709351324fmr9544519ybw.537.1658428862493; Thu, 21
 Jul 2022 11:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220719075930.315237-1-aik@ozlabs.ru>
 <99d48009-8403-c868-9f04-c14ca8311369@gmail.com>
 <c76cf69e-8f6f-333f-e3fb-72c5f1649705@ozlabs.ru>
 <CAFEAcA8Kma2vGYwS_AwvqvDRiNoeLoS43x2GHtHkAV3QiUJvJQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8Kma2vGYwS_AwvqvDRiNoeLoS43x2GHtHkAV3QiUJvJQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 21 Jul 2022 14:40:50 -0400
Message-ID: <CAJSP0QWoeyXrzTTrJZu6OPp1DiuyvrecRMSFdLYLvNufxGwwBQ@mail.gmail.com>
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel <qemu-devel@nongnu.org>, 
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 21 Jul 2022 at 04:49, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 21 Jul 2022 at 09:19, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> > On 21/07/2022 02:08, Daniel Henrique Barboza wrote:
> > > Hey,
> > >
> > > On 7/19/22 04:59, Alexey Kardashevskiy wrote:
> > >> Alexey Kardashevskiy (1):
> > >>        pseries: Update SLOF firmware image
> > >>
> > >>   docs/system/ppc/pseries.rst |   2 +-
> > >>   pc-bios/README              |   2 +-
> > >>   pc-bios/slof.bin            | Bin 992384 -> 995176 bytes
> > >>   roms/SLOF                   |   2 +-
> > >>   4 files changed, 3 insertions(+), 3 deletions(-)
> > >>
> > >>
> > >> *** Note: this is not for master, this is for pseries
> > >> *** Note2: this has not sync'd to git.qemu.org but softfreeze is
> > >> too soon so I am posting it anyway.
> > >
> > > I forgot to send a reply yesterday, sorry.
> > >
> > > Don't worry about rushing this SLOF pull. Given that this build doesn't
> > > have bug fixes we can wait to pull it in 7.2. You'll have the time to
> > > sync it up with git.qemu.org and so on.
> >
> >
> > Well, the git.qemu.org is still not updated, and I have no control over
> > this process anyway, who manages it?
>
> Syncing of those git repos is supposed to be automatic, but
> occasionally something falls over. Stefan, who looks after
> the sync process ?

I can help out with GitLab repo syncing. It should work for existing
qemu-project group repos. We currently cannot set up syncing for new
repos because qemu-project is in the GitLab Free tier.

The SLOF repo was last synced automatically 6 days ago. I'm unable to
start a new sync operation and maybe the current one is stuck (the web
interface claims the sync is currently updating...).

Peter: are you able to fetch https://github.com/aik/SLOF and push to
https://gitlab.com/qemu-project/SLOF to manually sync the repo?

I currently don't have easy access to my ssh key but let me know if
you can't and I'll see what I can do. Tomorrow I should have access
again.

Thanks,
Stefan


Stefan

