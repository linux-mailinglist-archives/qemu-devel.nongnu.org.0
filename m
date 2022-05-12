Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF84E524A32
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:23:24 +0200 (CEST)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np5yd-0004At-MY
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1np5bg-0000Qj-Fe
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:59:40 -0400
Received: from mail-yb1-f176.google.com ([209.85.219.176]:35684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1np5ba-0003gl-SS
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:59:37 -0400
Received: by mail-yb1-f176.google.com with SMTP id w187so8803534ybe.2
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 02:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iyH5VRjciXSqTghLdqQ+s+tLamMfaXcI2dOcSvLzOwM=;
 b=yKzFBRK1tHZ1AvnYsre0G9kXbC3zp0qKAdAkFHrUVwIv3SccuPwJCK0GSYYOox1GsD
 7n1l4orKyMs+/2UO/IFeElMm8ziApXsSchXyHBekDetZhG43e+fwjiHcSRiK/K6qgo11
 irLs6zHh2hJjQ82hdW8KIT8238zE+8LcJLuiKizbi1GBkiqicl274jab0sGBtaHWDAt3
 a4zeKKknLWj6GYAjbv0m0Tep9IYX86CfVPWdlYFuQPGymql2IJDndCsHlQHioBYkBZ3o
 TcG0yvBS3sTslQFgDx5QZ1BXxeYQ3vZj3yZoU39BlXdtO+CVGiuy8m/D9pQN7mLS9myN
 oH7g==
X-Gm-Message-State: AOAM532umHcJj0vafkTfidx/cjTRbQ1JADIMQxq8i0eplkOPNbj+7KCp
 Csjy+SLbNttxEI06JNycJBtsvoCA0Ck7s3cYWH4=
X-Google-Smtp-Source: ABdhPJyAG8oqrZh35GfpuqRA3iL/ADaZXeJB6civOY//SutHwAtetVfLh8QmtQa63nYo0SuKX8ZzNddbgejN/+4ZEas=
X-Received: by 2002:a25:b7d3:0:b0:64a:f307:fd91 with SMTP id
 u19-20020a25b7d3000000b0064af307fd91mr16016595ybj.177.1652349573384; Thu, 12
 May 2022 02:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220510195612.677494-1-thuth@redhat.com>
 <YnuCEPOj70J+1NXx@redhat.com>
 <CAAdtpL45Bn0wrDX6nQzkzQW=eqxrja4zOFcfG_gTz84LExSpoA@mail.gmail.com>
 <f40ceb7b-8412-8da2-7c16-2590debecaed@redhat.com>
 <CAAdtpL4oGW28-r0ZuMV9nBoZGDR5L9PYM2jsKw0Fmuwx68MWdw@mail.gmail.com>
 <c0fb8289-1b56-6e7f-e053-b19dffcfc87b@redhat.com>
 <CAAdtpL5JxRgJ75eqQT6MZPvd7DvgN2ND44O+MKd1Fr_SzEwmAA@mail.gmail.com>
 <YnzRf6aRQBHfx3zC@redhat.com>
In-Reply-To: <YnzRf6aRQBHfx3zC@redhat.com>
Date: Thu, 12 May 2022 11:59:21 +0200
Message-ID: <CAAdtpL48v5Un8osCRr8LrsCAx4P3hcx2qb+WKLE6ADZT1QYwuw@mail.gmail.com>
Subject: Re: [PATCH] Remove Ubuntu 18.04 support from the repository
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Robert Foley <robert.foley@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.176;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Thu, May 12, 2022 at 11:21 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> On Thu, May 12, 2022 at 11:14:45AM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On Wed, May 11, 2022 at 1:15 PM Thomas Huth <thuth@redhat.com> wrote:
> > > On 11/05/2022 13.13, Philippe Mathieu-Daud=C3=A9 wrote:
> > > > On Wed, May 11, 2022 at 1:03 PM Thomas Huth <thuth@redhat.com> wrot=
e:
> > > >> On 11/05/2022 12.46, Philippe Mathieu-Daud=C3=A9 wrote:
> > > >>>    On Wed, May 11, 2022 at 11:30 AM Daniel P. Berrang=C3=A9
> > > >>> <berrange@redhat.com> wrote:
> > > >>>> On Tue, May 10, 2022 at 09:56:12PM +0200, Thomas Huth wrote:
> > > >>>>> According to our "Supported build platforms" policy, we now do =
not support
> > > >>>>> Ubuntu 18.04 anymore. Remove the related files and entries from=
 our CI.
> > > >>>>>
> > > >>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > >>>>> ---
> > > >>>>>    Seems like nobody touched the 18.04-based tests/vm/ubuntu* f=
iles in a
> > > >>>>>    very long time, so I assume these are not used anymore and c=
an completely
> > > >>>>>    be removed now.
> > > >>>>
> > > >>>> Or it could mean that they are working fine and so haven't neede=
d
> > > >>>> changes...
> > > >>>
> > > >>> Yes :)
> > > >>
> > > >> At least for me "make vm-build-ubuntu.aarch64" is only failing wit=
h ssh
> > > >> timeouts (on my x86 laptop) ... is this really supposed to work wi=
th TCG, or
> > > >> is this KVM (on arm hosts) only?
> > > >
> > > > Yes this timeout code is not working. I suppose it is tied to the T=
CG host perf.
> > > > I suggested a pair of patches to increase it but back then Fam didn=
't accepted
> > > > them because IIRC these VMs were used by patchew (previous to Gitla=
b).
> > > > Today we have better framework for testing, so I wouldn't use this =
script on
> > > > CI, but it is still valuable for manual testing.
> > > >
> > > > Robert's email doesn't work anymore. Since I don't have x86 worksta=
tion
> > > > anymore, I'll probably use these tests/vm for testing. So let me ad=
d a
> > > > "upgrade tests/vm/ubuntu to 22.04" to my TODO list. If I fail and n=
obody
> > > > miss them, then I won't object to remove them.
> >
> > So, 18.04 is the latest LTS release for 32-bit x86 (i386).
> >
> > IIRC we used this 32-bit VM to reproduce bugs only triggered on 32-bit =
hosts
> > (while it seems obvious, what is not obvious is that very few developer=
s run
> > on 32-bit hosts, so I'm not sure how long we are interested in avoiding=
 bugs
> > there). See i.e.:
> > https://lore.kernel.org/qemu-devel/07a865e0-d535-9a19-cf29-f90984bcd510=
@amsat.org/
>
> At some point we'll need to just admit 32-bit host is dead, and that
> point is getting ever closer. For now though, if we need a VM for
> 32-bit testing, the easiest answer is probably to tweak the VM config to
> be Debian based, as that's functionally closest to what Ubuntu provides
> and so likely not too much work.

Thanks for the tip, great idea!

