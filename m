Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546E3696E8F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 21:28:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS1tj-0005wu-LY; Tue, 14 Feb 2023 15:27:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pS1tg-0005wQ-Us
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 15:27:29 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pS1te-0003LM-To
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 15:27:28 -0500
Received: by mail-pf1-x430.google.com with SMTP id bd35so6081142pfb.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 12:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cp8xKKZjz9e7rqhde1R2IXlUZjEysSXK+RzO4kyYu7A=;
 b=FvWBJ/jkPJ1dmzJxprsMaVrGQyM7DLCJteSZk3FBh/lhVFByo/L8MlU0rLm0cygor8
 xYrG7q2hjP6XWGcVdc/a0ZjeokoxT+mrZ82VAzRB63MEnTf8yxQql49d4WzL+12+dZLg
 WKvAfQZDwHB+JaonGLHvesK7fvGy4lKpzmT/SSb8wc3Sdach1LySjSfT676Wkl8TUg/l
 nrs4SRFqjJbQaxasg+2T8+0CRdxVhI8Vfm+TIzbubKc0s/p1pw0rpEU9wUTW/5xhxoS3
 HJ6rRXEnun2nOl58sVX8dsNfqwrBnSOWPSHQ3vh3UT/Cwk5F5UG17bJkQkC8sRMx1rlY
 XoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cp8xKKZjz9e7rqhde1R2IXlUZjEysSXK+RzO4kyYu7A=;
 b=efDGsLsXI1ZKjfsb8SN5KAM4HN2o6VOUioGfVWLKrBQm6y9QHHa7lTiOjUuzfv575b
 aeEyMNqqmVFOuWLvYxZG7EAqWeH9MxQkY+wRaSbQvm/0x4Rp9hhM819f5d5uwA9RsWpP
 5C22U6C1xN5jBUk7o54+ckvu5KglPEPId0FMSPyeTSIBD6kHpfZaBwtg+XTkuNSNB/KR
 eOSwEWt2C8SDCsAMGGv/o0HUeKMeIbcUd1R/ibF37A8FXqLaV75KNC1roBp1377U7Xxj
 a6RWM3YY7J1ZzpwS7B9PUzl8bFFtvTpFToBFkfgZTOXviBn96cG9L7l9sml+5qwMOwNR
 QfcQ==
X-Gm-Message-State: AO0yUKXsdE3zWDKU6Bb0yKy4Hgcx6na9OVGGh/AMy21MIn6sMn+TRLSS
 d82t++libaqTDVkysVpx1HXwrElu/ukd114ReJTk1g==
X-Google-Smtp-Source: AK7set89HHdtmDDlb9fWKQysIHcvGCvoNCH9rRMcHICK6ChYI5G/5XgD9ywTWht4lO8gahrqZi94+/NDlEt5yJYnASI=
X-Received: by 2002:a63:9dc8:0:b0:4fb:d2a9:6ff2 with SMTP id
 i191-20020a639dc8000000b004fbd2a96ff2mr109184pgd.7.1676406443996; Tue, 14 Feb
 2023 12:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20221218143927.597975-1-16567adigashreesh@gmail.com>
 <d7f05d4f-2a56-6663-4a66-e53c3f14a061@linaro.org>
 <Y6HjOqjECShxPfzU@arch.localdomain>
 <CABcq3pGii9c=f6LxNtNppoCky=jZbuqNFYcqKBuj1W2qgww84A@mail.gmail.com>
In-Reply-To: <CABcq3pGii9c=f6LxNtNppoCky=jZbuqNFYcqKBuj1W2qgww84A@mail.gmail.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Tue, 14 Feb 2023 22:10:32 +0200
Message-ID: <CABcq3pFaYy1EHb9KvC3KhJ7TAiAm1ii1VCLNK6u=YQvXz2MA+Q@mail.gmail.com>
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
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=andrew@daynix.com; helo=mail-pf1-x430.google.com
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

Hi, all.
In the future, there would be eBPF RSS + the helper for Libvirt interaction=
.
And those patches are required for future work. Technically they are
required for the current builds with linked libbpf 1.01.
Can we apply this patch?


On Wed, Dec 28, 2022 at 6:19 PM Andrew Melnichenko <andrew@daynix.com> wrot=
e:
>
> Hi, it's a good idea to update the skeleton generation. Technically
> skeleton generation is not a part of Qemu building. The skeleton is
> already presented in the Qemu tree, so we skip dependencies from
> clang/bpftool.
> It's a good idea to have an updated bpf program and simplified
> Makefile with Qemu sources. And the skeleton in the Qemu tree should
> be identical to what the Makefile.ebpf would generate.
> I think having one patch with all changes to eBPF RSS is acceptable.
>
> On Tue, Dec 20, 2022 at 6:30 PM Shreesh Adiga
> <16567adigashreesh@gmail.com> wrote:
> >
> > On Sun, Dec 18, 2022 at 05:15:04PM +0100, Philippe Mathieu-Daud=C3=A9 w=
rote:
> > > Hi,
> > >
> > > On 18/12/22 15:39, Shreesh Adiga wrote:
> > > > The current implementation fails to load on a system with
> > > > libbpf 1.0 and reports that legacy map definitions in 'maps'
> > > > section are not supported by libbpf v1.0+. This commit updates
> > > > the Makefile to add BTF (-g flag) and appropriately updates
> > > > the maps in rss.bpf.c and update the skeleton file in repo.
> > > >
> > > > Signed-off-by: Shreesh Adiga <16567adigashreesh@gmail.com>
> > > > ---
> > > >   ebpf/rss.bpf.skeleton.h  | 1171 ++++++++++++++++++++++++++++-----=
-----
> > > >   tools/ebpf/Makefile.ebpf |    8 +-
> > > >   tools/ebpf/rss.bpf.c     |   43 +-
> > > >   3 files changed, 891 insertions(+), 331 deletions(-)
> > >
> > >
> > > > +static inline const void *rss_bpf__elf_bytes(size_t *sz)
> > > > +{
> > > > +   *sz =3D 20440;
> > > > +   return (const void *)"\
> > > >   \x7f\x45\x4c\x46\x02\x01\x01\0\0\0\0\0\0\0\0\0\x01\0\xf7\0\x01\0\=
0\0\0\0\0\0\0\
> > > > -\0\0\0\0\0\0\0\0\0\0\0\x18\x1d\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x=
40\0\x0a\0\
> > > > -\x01\0\xbf\x18\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x4c\xff\0\0=
\0\0\xbf\xa7\
> > > > -\0\0\0\0\0\0\x07\x07\0\0\x4c\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0\0=
\0\0\0\0\0\
> > > > +\0\0\0\0\0\0\0\0\0\0\0\x98\x4c\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x=
40\0\x0d\0\
> > > > +\x01\0\xbf\x19\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x54\xff\0\0=
\0\0\xbf\xa7\
> > > > +\0\0\0\0\0\0\x07\x07\0\0\x54\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0\0=
\0\0\0\0\0\
> > > >   \xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x06\0\0\0\0\0\0\x18\=
x01\0\0\0\0\0\
> > > > -\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x07=
\0\0\0\0\0\0\
> > > > -\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x66\x02\0\0\0\0=
\xbf\x79\0\0\
> > > > -\0\0\0\0\x15\x09\x64\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01\0=
\0\0\0\0\x05\
> > > > -\0\x5d\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc0\xff\0\0\0\0\x7b=
\x1a\xb8\xff\
> > > > -\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\xa8\xff\0\0\0\0\x7b\x1a\x=
a0\xff\0\0\0\
> > > > -\0\x63\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff\0\0\0\0\x7b\x1a\x88\xff=
\0\0\0\0\x7b\
> > > > -\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0\0\x7b\x1a\x70\xff\0\0\0=
\0\x7b\x1a\
> > > > -\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x7b\x1a\x58\xff\0\0\0\0\x=
7b\x1a\x50\
> > > > -\xff\0\0\0\0\x15\x08\x4c\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf\x=
a3\0\0\0\0\0\
> > > > -\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x02\0\0\x0c=
\0\0\0\xb7\
> > > > +\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x08=
\0\0\0\0\0\0\
> > > > +\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x67\x02\0\0\0\0=
\xbf\x87\0\0\
> > > > +\0\0\0\0\x15\x07\x65\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01\0=
\0\0\0\0\x05\
> > > > +\0\x5e\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc8\xff\0\0\0\0\x7b=
\x1a\xc0\xff\
> > > > +\0\0\0\0\x7b\x1a\xb8\xff\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\x=
a8\xff\0\0\0\
> > > > +\0\x63\x1a\xa0\xff\0\0\0\0\x7b\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff=
\0\0\0\0\x7b\
> > > > +\x1a\x88\xff\0\0\0\0\x7b\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0=
\0\x7b\x1a\
> > > > +\x70\xff\0\0\0\0\x7b\x1a\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x=
7b\x1a\x58\
> > > > +\xff\0\0\0\0\x15\x09\x4d\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf\x=
a3\0\0\0\0\0\
> > > [...]
> > >
> > > Can we have a build system step which generates this file and compare
> > > with what is committed in the repository that we can run in our CI?
> > >
> > > That would avoid the need of human review of this blob.
> > >
> > Here are the steps to verify:
> > Pull latest archlinux/archlinux docker image and get a bash shell insid=
e
> > the container. Install the required toolchain packages.
> > pacman -Syu --noconfirm
> > pacman -S --noconfirm  bpf libbpf llvm clang make
> >
> > Confirm the versions:
> > clang 14.0.6
> > bpftool 7.0.0
> > libbpf 1.0.1
> >
> > After this, ensure that the files Makefile.ebpf and rss.bpf.c from this
> > patch exist at /home/shreesh/c/qemu/tools/ebpf/ inside the docker.
> > This path seems to be important since BTF info seems to contain the abs=
olute
> > path of rss.bpf.c which was compiled by clang and is embedded inside
> > the generated ELF object.
> >
> > Run `make -C /home/shreesh/c/qemu/tools/ebpf -f Makefile.ebpf` and
> > verify that `sha256sum /home/shreesh/c/qemu/tools/ebpf/rss.bpf.skeleton=
.h` is
> > a54af3d1fb401ddd56c151f00ae20d6557e965c0a1a4d8ed5f8d925457158a0e which
> > should be the same as the one submitted as part of this patch.
> >
> > I'm not familiar with QEMU's CI and am not sure if the above steps can
> > be converted into build system steps. However it should be doable by a
> > human and verify that the generated skeleton file is correct and not
> > tampered with.
> >
> > Regards,
> > Shreesh

