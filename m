Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28794ED0FB
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:42:33 +0200 (CEST)
Received: from localhost ([::1]:43688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZitU-0004rn-PP
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:42:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZiPp-00012r-LM
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:11:53 -0400
Received: from [2607:f8b0:4864:20::129] (port=41718
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZiPo-0007Ab-1C
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:11:53 -0400
Received: by mail-il1-x129.google.com with SMTP id b9so15635381ila.8
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 17:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J7nzB3PR2EnX1npUm3rzgRIvP6+VETb+14whaRFj50U=;
 b=EpAmNIrmep6AnqVdvx2sBXZD7nu5okWCIqQ09FxYzbxcKLiGaZhh3/SLcUVaV3rb/K
 DkPDUWZ+PzacsmyqP9UaES36w7cFMsYeaL1eQD5QknIbVNHAASwJVeblQ7BkVi51F8y2
 QHXfJyI3sX1dfN9m1BbArwhgIppz1NkIzzohearA+hx005aG6RtF1Qo+UjBm1ezS0dLv
 MIPxMTNo4LwI4A7UK0AU0NEviWM3l9rqLshXBPLzPB5QmajtWDbYlRUQIWKlgoLOVhBp
 fYwcsB4e0ZHveJdQkY171S8SAbN4tvIAw4t/gV84wF+1xRTW3dLf5IsEkXEU6sdfxdC6
 eS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J7nzB3PR2EnX1npUm3rzgRIvP6+VETb+14whaRFj50U=;
 b=H7jQ5MBUHbuAFsxUTNfkwDaDki9zqtlaR/+iG1kzWZSFwXLhLEPt+aHVo/8Elsnbat
 atZOLieXvHCtPih5l++08wikzjxJuIB5zL1AA6scRQJSm+Rb1ymFTz48TKtn8Cy0SkGr
 cafQXTKIL9EHp7Bg/WGmGFa/WpxfLx9890gufhFo+4WDxQ5Nps+JyDQk/LfvRXFyo9sa
 ggY3RjIREeksgMOnCn5A8eDNYEiEudHsMiSPTZekjESQW0XifyyRhqiNYlySUWR15zt+
 Thw2en9dHAjXN8fc8SPxa3bRDR6eks2p4WyGTbMSCbnaNsTDxSjT7RejoAmJP3ZmrnK/
 1y5A==
X-Gm-Message-State: AOAM5337jBGUlW9OPNKJ8XdE8KNGeN1anCc3Ax9rVpy+Fv/PKcPvRQDY
 HY2Czb1bo7q8vpV94yrQXXhL5NqIlk7yW/RbOkM=
X-Google-Smtp-Source: ABdhPJw3iTGnRtHOz7xcTsuoLBRMvob74nKvMY6MMzQ2y9v+Gz3GI2lpmv2PU0CYZYKBZa+tgfJs+hW/GwYLefJWSrU=
X-Received: by 2002:a92:d94d:0:b0:2c8:45a5:926b with SMTP id
 l13-20020a92d94d000000b002c845a5926bmr12640587ilq.310.1648685510873; Wed, 30
 Mar 2022 17:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220323171346.792572-1-ralf.ramsauer@oth-regensburg.de>
 <Yjw1At8ig+UzFKXn@redhat.com>
In-Reply-To: <Yjw1At8ig+UzFKXn@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Mar 2022 10:11:24 +1000
Message-ID: <CAKmqyKMaRuw552K9zU+maKgHpfVC42j00pD++vdw1hg8posRgw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Warn the user if -bios is provided when
 using KVM
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Anup Patel <anup@brainfault.org>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 Jiangyifei <jiangyifei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 7:08 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Mar 23, 2022 at 06:13:46PM +0100, Ralf Ramsauer wrote:
> > The -bios option is silently ignored if used in combination with -enabl=
e-kvm.
> > The reason is that the machine starts in S-Mode, and the bios typically=
 runs in
> > M-Mode.
> >
> > Warn the user that the bios won't be loaded.
> >
> > Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> > ---
> >  hw/riscv/virt.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 4496a15346..a4d13114ee 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -1312,6 +1312,9 @@ static void virt_machine_init(MachineState *machi=
ne)
> >       * when KVM is enabled.
> >       */
> >      if (kvm_enabled()) {
> > +        if (machine->firmware && strcmp(machine->firmware, "none"))
> > +            warn_report("BIOS is not supported in combination with KVM=
. "
> > +                        "Ignoring BIOS.");
>
> If the usage scenario isn't supportable, then ultimately we should be
> raising an error and immediately exiting.
>
> If you know of common usage that is already mistakenly passing -bios,
> then we could start with a warning and list it as deprecated, then
> change to an error_report 2 releases later. If we don't thing people
> are often mistakenly passing -bios, then go straight for error_report
> and exit.

That's a good point. The original thinking was that we did support
-bios and so we should warn the user that it's unlikely they want to
use it. This would still allow S mode UEFI loaders to be used (they
don't exist today).

Considering we are currently just ignoring the option I agree it's
better to report an error.

Do you mind sending a v2 Ralf?

Alistair

>
> >          g_free(machine->firmware);
> >          machine->firmware =3D g_strdup("none");
> >      }
> > --
> > 2.32.0
> >
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

