Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA41658277
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 17:37:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAZPZ-0007ZI-V0; Wed, 28 Dec 2022 11:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pAZP2-0007XA-L4
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 11:35:41 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pAZOz-0002V2-Io
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 11:35:40 -0500
Received: by mail-pl1-x62f.google.com with SMTP id d7so16469668pll.9
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 08:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtV3xxzYq4eOVbDDFdjJX63NCt+4+O9c0kGrqzTWutQ=;
 b=kUiNeB9jSoDsWYOilJJsXL64WQxoU+2MwFzndd6psF33agxqokswIAEL0qBZ6duhgg
 B1pm4B8xq/jMTRfh1hUcF0ElpAsMkoAWLsKh0CPf9mohFkusCHyyZiLUFuJeOEOPSJhU
 RbMgVerQrvJ32JKGYLprio7RbGGPKEiGQPpxnXUXavRVeju3CDpGlEYm8ji3wOTwMlFj
 ZKlbV87MfuZ7pufSBquxmyVFgY4p2cfL1c/s7aAlyyDf1c/WynsEmrnMM4mX8DSgqrkb
 z88BaY977bAosdRnqP8qGg6mEiA37U6KvUpH8Xk5nHUtcfA+KPpcccCFyF/fFUn1yAZU
 jjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtV3xxzYq4eOVbDDFdjJX63NCt+4+O9c0kGrqzTWutQ=;
 b=u/ixB+mVo46JVnXIkwOCo8rhSAASsmHJ1VecsUrlGbuUlrfb5+BIytSO2MAjsGQAHK
 O1e6ZMIKN6z2iMaVyqNw+9/KtpxAdKUKKDQppTW4H8f1ef0oHoDWvstR2eDHX9cEZNj0
 G8MilNhoqZtDokKYPmcvEyi9bYHQKXmnmgOwmFFzU81Zq5hN0bCk4RW8iggMDXa3WRlg
 eaIZy6FTtp1cQ6UJACff3QPMRIopIkF3hjGCRa+3vOV9GKkaDwxisx/pymqQlFqaAzHW
 DOmy2xOoDz64wIHdVBhfmWTMLSbkNwoA0llSP/bUVUmXdfz620/gfQoB592AfkarM0hI
 4DyQ==
X-Gm-Message-State: AFqh2kq5WGeJtFLdQLSrn5++sVhQGmkx1vQdSqSGk+Gxkp6xQtyFSem0
 H4xbQwLSa/8mlocA5fDIcnZhlVr9KsgZdpwmF8RoFQ==
X-Google-Smtp-Source: AMrXdXsskV5ffDWNhiyj86HToKNy9GVDd+RetB3MGgeEMTfliHQ6SUmRrVisBPP8uSvz7cC0anCtjLs68+ACeLqnCrE=
X-Received: by 2002:a17:902:ec8c:b0:192:5d9b:5895 with SMTP id
 x12-20020a170902ec8c00b001925d9b5895mr1201725plg.127.1672245334557; Wed, 28
 Dec 2022 08:35:34 -0800 (PST)
MIME-Version: 1.0
References: <20221218143927.597975-1-16567adigashreesh@gmail.com>
 <d7f05d4f-2a56-6663-4a66-e53c3f14a061@linaro.org>
 <Y6HjOqjECShxPfzU@arch.localdomain>
In-Reply-To: <Y6HjOqjECShxPfzU@arch.localdomain>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Wed, 28 Dec 2022 18:19:44 +0200
Message-ID: <CABcq3pGii9c=f6LxNtNppoCky=jZbuqNFYcqKBuj1W2qgww84A@mail.gmail.com>
Subject: Re: [PATCH] ebpf: fix compatibility with libbpf 1.0+
To: Shreesh Adiga <16567adigashreesh@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, jasowang@redhat.com, yuri.benditovich@daynix.com, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=andrew@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi, it's a good idea to update the skeleton generation. Technically
skeleton generation is not a part of Qemu building. The skeleton is
already presented in the Qemu tree, so we skip dependencies from
clang/bpftool.
It's a good idea to have an updated bpf program and simplified
Makefile with Qemu sources. And the skeleton in the Qemu tree should
be identical to what the Makefile.ebpf would generate.
I think having one patch with all changes to eBPF RSS is acceptable.

On Tue, Dec 20, 2022 at 6:30 PM Shreesh Adiga
<16567adigashreesh@gmail.com> wrote:
>
> On Sun, Dec 18, 2022 at 05:15:04PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi,
> >
> > On 18/12/22 15:39, Shreesh Adiga wrote:
> > > The current implementation fails to load on a system with
> > > libbpf 1.0 and reports that legacy map definitions in 'maps'
> > > section are not supported by libbpf v1.0+. This commit updates
> > > the Makefile to add BTF (-g flag) and appropriately updates
> > > the maps in rss.bpf.c and update the skeleton file in repo.
> > >
> > > Signed-off-by: Shreesh Adiga <16567adigashreesh@gmail.com>
> > > ---
> > >   ebpf/rss.bpf.skeleton.h  | 1171 ++++++++++++++++++++++++++++-------=
---
> > >   tools/ebpf/Makefile.ebpf |    8 +-
> > >   tools/ebpf/rss.bpf.c     |   43 +-
> > >   3 files changed, 891 insertions(+), 331 deletions(-)
> >
> >
> > > +static inline const void *rss_bpf__elf_bytes(size_t *sz)
> > > +{
> > > +   *sz =3D 20440;
> > > +   return (const void *)"\
> > >   \x7f\x45\x4c\x46\x02\x01\x01\0\0\0\0\0\0\0\0\0\x01\0\xf7\0\x01\0\0\=
0\0\0\0\0\0\
> > > -\0\0\0\0\0\0\0\0\0\0\0\x18\x1d\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x40=
\0\x0a\0\
> > > -\x01\0\xbf\x18\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x4c\xff\0\0\0=
\0\xbf\xa7\
> > > -\0\0\0\0\0\0\x07\x07\0\0\x4c\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0\0\0=
\0\0\0\0\
> > > +\0\0\0\0\0\0\0\0\0\0\0\x98\x4c\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x40=
\0\x0d\0\
> > > +\x01\0\xbf\x19\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x54\xff\0\0\0=
\0\xbf\xa7\
> > > +\0\0\0\0\0\0\x07\x07\0\0\x54\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0\0\0=
\0\0\0\0\
> > >   \xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x06\0\0\0\0\0\0\x18\x0=
1\0\0\0\0\0\
> > > -\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x07\0=
\0\0\0\0\0\
> > > -\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x66\x02\0\0\0\0\x=
bf\x79\0\0\
> > > -\0\0\0\0\x15\x09\x64\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01\0\0=
\0\0\0\x05\
> > > -\0\x5d\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc0\xff\0\0\0\0\x7b\x=
1a\xb8\xff\
> > > -\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\xa8\xff\0\0\0\0\x7b\x1a\xa0=
\xff\0\0\0\
> > > -\0\x63\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff\0\0\0\0\x7b\x1a\x88\xff\0=
\0\0\0\x7b\
> > > -\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0\0\x7b\x1a\x70\xff\0\0\0\0=
\x7b\x1a\
> > > -\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x7b\x1a\x58\xff\0\0\0\0\x7b=
\x1a\x50\
> > > -\xff\0\0\0\0\x15\x08\x4c\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf\xa3=
\0\0\0\0\0\
> > > -\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x02\0\0\x0c\0=
\0\0\xb7\
> > > +\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x08\0=
\0\0\0\0\0\
> > > +\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x67\x02\0\0\0\0\x=
bf\x87\0\0\
> > > +\0\0\0\0\x15\x07\x65\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01\0\0=
\0\0\0\x05\
> > > +\0\x5e\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc8\xff\0\0\0\0\x7b\x=
1a\xc0\xff\
> > > +\0\0\0\0\x7b\x1a\xb8\xff\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\xa8=
\xff\0\0\0\
> > > +\0\x63\x1a\xa0\xff\0\0\0\0\x7b\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff\0=
\0\0\0\x7b\
> > > +\x1a\x88\xff\0\0\0\0\x7b\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0\0=
\x7b\x1a\
> > > +\x70\xff\0\0\0\0\x7b\x1a\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x7b=
\x1a\x58\
> > > +\xff\0\0\0\0\x15\x09\x4d\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf\xa3=
\0\0\0\0\0\
> > [...]
> >
> > Can we have a build system step which generates this file and compare
> > with what is committed in the repository that we can run in our CI?
> >
> > That would avoid the need of human review of this blob.
> >
> Here are the steps to verify:
> Pull latest archlinux/archlinux docker image and get a bash shell inside
> the container. Install the required toolchain packages.
> pacman -Syu --noconfirm
> pacman -S --noconfirm  bpf libbpf llvm clang make
>
> Confirm the versions:
> clang 14.0.6
> bpftool 7.0.0
> libbpf 1.0.1
>
> After this, ensure that the files Makefile.ebpf and rss.bpf.c from this
> patch exist at /home/shreesh/c/qemu/tools/ebpf/ inside the docker.
> This path seems to be important since BTF info seems to contain the absol=
ute
> path of rss.bpf.c which was compiled by clang and is embedded inside
> the generated ELF object.
>
> Run `make -C /home/shreesh/c/qemu/tools/ebpf -f Makefile.ebpf` and
> verify that `sha256sum /home/shreesh/c/qemu/tools/ebpf/rss.bpf.skeleton.h=
` is
> a54af3d1fb401ddd56c151f00ae20d6557e965c0a1a4d8ed5f8d925457158a0e which
> should be the same as the one submitted as part of this patch.
>
> I'm not familiar with QEMU's CI and am not sure if the above steps can
> be converted into build system steps. However it should be doable by a
> human and verify that the generated skeleton file is correct and not
> tampered with.
>
> Regards,
> Shreesh

