Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA3D3E2C03
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 15:55:32 +0200 (CEST)
Received: from localhost ([::1]:39256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0Jv-0004Ar-Kg
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 09:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mC0JA-0003Tx-9r
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 09:54:44 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:36536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mC0J8-0005PF-Su
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 09:54:44 -0400
Received: by mail-yb1-xb32.google.com with SMTP id j77so15326106ybj.3
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YleHCygYuqZj0K7i/g+PAHWSysssTnnpuKcTaRJhAjU=;
 b=F8DlXtMYbtPRVjisQCTgKIg+Cr1iAmc2ZqUTRZp5tXYKi1PHxE7etfscbsBR2/DmmO
 PQbp2pmDHMupVA8wPvqmXoVpI8aukPSDRmnOxjafHL1E/btor+gyMufe78OoCjQJNMyS
 LAccJAcO1MXsY8924XfIzu1kj23K2A0fd2ISLRcJpO/cMOGGzC/l6Qf27Wmg4WGut8jg
 kXLrnUFYPh4G2ZsK0XKuh2KNJCXVWSsfL4wXZMoYNHaGf6ojrpcsn9UD4JgzO2igEecT
 SVmiILxiVF4bpUQLMM8sTFDTWbD4GQApqSJgHf+Sr/O2mdyS/EaT+zMRU9dR0UV438bE
 8PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YleHCygYuqZj0K7i/g+PAHWSysssTnnpuKcTaRJhAjU=;
 b=WnUUoi+6qxaOa92oqZRyrduj5GcA4FMP19pRu4L3paVpYOuTb6fwGfoJqsV2WGvbAT
 tzWZuPqOS+4cYyEzGnZ7TWcogS1V/x/lVLzdnCbs0uWdHHVNwr0aD+kGAFBE32MR6sGY
 11O20izTySLfxT9trDNESjzS5uZWeK+MzL3jCjoGUZ9MBXhahmJKyVi1OPS23BFamOOY
 NtA6czu/0eVePFcjb3jQlJCkvRC/HzJxJPKLfzzJm9Rxrf/5uBCo9Rok3A+S0GzxgaC0
 0/m0H31VhURApnK1Ul/nTcfExapRp+IM14MC0OSij+ZLE9EsWY8fMVltfe+ZwTMTdr0z
 mPpA==
X-Gm-Message-State: AOAM533jAVIUuDcH20JcHaTQ+QOm4sg6/ZKDc+OrQjh3azX2H8eZ0kpr
 egPq+wsr8GNfzg2Phz0JwPP2oz+BDJN5eaFA0NM=
X-Google-Smtp-Source: ABdhPJw/+tfKHY/GXZQ8GFTwZkrHqZ0USZ9JFOJVl6PSZUOG61Kg2YIe7tW6a8atRcVUVtRWSNTXNbk79Qa2PCckXLY=
X-Received: by 2002:a5b:304:: with SMTP id j4mr13025174ybp.314.1628258082083; 
 Fri, 06 Aug 2021 06:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <775EB0C4-04FF-4D76-8248-D5B16D238B3B@jrtc27.com>
In-Reply-To: <775EB0C4-04FF-4D76-8248-D5B16D238B3B@jrtc27.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Aug 2021 21:54:31 +0800
Message-ID: <CAEUhbmXjC_RaN0rMZO0-FFAP8Cce-Kpxy=ZORpi1k=0Nv7OLiw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/4] Add options to config/meson files for custom
 CSR
To: Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
Cc: "Ruinland Chuan-Tzu Tsa\(\(\(\(\(\(\(\(\(\(\)" <ruinland@andestech.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 6, 2021 at 8:58 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> > On Fri, Aug 6, 2021 at 10:39 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Fri, Aug 6, 2021 at 1:57 AM Ruinland Chuan-Tzu Tsai
> > > <ruinland@andestech.com> wrote:
> > > >
> > > > From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > > >
> > > > Adding option `riscv_custom` to configure script, meson.build and
> > > > meson_options.txt so as to toggle custom CSR and will-be-upstreamed=
 custom
> > > > instructions handling logic.
> > > >
> > > > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > > > ---
> > > >  configure         | 6 ++++++
> > > >  meson.build       | 2 ++
> > > >  meson_options.txt | 2 ++
> > > >  3 files changed, 10 insertions(+)
> > > >
> > >
> > > This sounds like unnecessary to bring such a config option to the mes=
on level.
> > >
> > > I believe a Kconfig option should just be fine.
> >
> > +Alistair
>
> I don=E2=80=99t see why this is even a config option. If you request a ve=
ndor=E2=80=99s
> CPU you should get any custom CSRs defined for that vendor=E2=80=99s CPU.=
 If
> you don=E2=80=99t you don=E2=80=99t. This should be purely a run-time thi=
ng, no?

In a generic use case where we build all RISC-V machines into one
qemu-system-riscv{32,64} executable this makes no difference. The
Kconfig option will be turned on if any one of the machines requires
it. It only gets benefits when we build a QEMU executable on a
per-machine basis.

Regards,
Bin

