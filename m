Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04A9329135
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:24:02 +0100 (CET)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGp5F-00041G-Oc
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@cloud.ionos.com>)
 id 1lGp3o-0003A1-5Q
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:22:32 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:45275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@cloud.ionos.com>)
 id 1lGp3l-0006yd-J7
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:22:31 -0500
Received: by mail-lj1-x233.google.com with SMTP id y12so8134369ljj.12
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 12:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2L34JmDAGubXIyk7ZVWoTpPZYhzfZgp/0m4I9XQZLYE=;
 b=DkIx3oNzkvGw0Zo6mJHRYK5v/2Kdp/PLc/qbhS/IwrKmw3hg5/z7SlN3CULbdSzWJm
 FZZ1pEtoZYa0DzfazYd8XQE6pVpv+s1obxUnz9wV+Zsp4JS41dfT98gKaC42OHliH9LF
 oYjfM1u66MLi31pdeoBgw1JDTUF6mq3UBq0GtQuijZY7bO5rZ5gnRAwyvnJbY4z/pMvt
 2UPlNkb/21WneOU09y+kMRucLPaDJDskoaP7n5hFc6w+fCkNzXwO0Y65td0DAqDWBJSh
 h+cOzgugmwyL8WX76YpAz0oj+7k2i00AwG79U3dUEyX6nP+Cer50SlLy5vl65VKjWlhG
 QHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2L34JmDAGubXIyk7ZVWoTpPZYhzfZgp/0m4I9XQZLYE=;
 b=umFLdfuq2Jndon4wSjazBc166rtH6uGskcWXGZiNbdGCIStH9qk/H2LUczRVxAmMY5
 86eawk9j9v1pZjdjC0Thpg70d9g1jYsBo2vqXxftO5GuZjxb8OFWaBHhNvODeRsh2QOW
 KLHtwdd/VvKFg+yAt4/pb6wohMc6VCxvfCHTGq7B5w4q5dkMYWgHV1bxU53Bzo5ZMhJR
 FePG6RoyhTyTrX7oZ8ELiD16cM7Z3cE9x8RwD+vWXGrx2uDCNMoyFXuLrHkdozg0p0xG
 fGj0cdqdhgW1R5qz4X79Ar27EWQ5ekO9otNOORWOaBUTJMO0KyIhJEI1lbzULFFvw6Vo
 Ga5g==
X-Gm-Message-State: AOAM532tdH5+7KIQorOeCITTtATmzs70OYoCcK2GLdfG3MZHiv29dLKh
 olY/EAOIXhF62pYPcz//b6LVvIZCLEByVvXOEbxnyw==
X-Google-Smtp-Source: ABdhPJx1acp+zUsXlOEHAj1aC8+D5n1MxQKvxBJu6nxGoXtOHH9M2mCDTeb+QbrM9igtUqIU1qSz2ygWgToL7ULyCZA=
X-Received: by 2002:a05:651c:110b:: with SMTP id
 d11mr9723973ljo.334.1614630146737; 
 Mon, 01 Mar 2021 12:22:26 -0800 (PST)
MIME-Version: 1.0
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
 <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
 <d2f234a5-e753-5a4e-97db-21bd0a0a69eb@amd.com>
 <CAM9Jb+hESq1yEbPcMWhJTVWoUK-es168bHoOayQ_N1vh3tdRRQ@mail.gmail.com>
 <cd9a84a3-f151-fa00-0b34-2652824bbbfc@amd.com>
 <CAM9Jb+jWfW5yFMy5b9fGXr9Hk4TUv5roOQGEm5C+BSR89e9C_g@mail.gmail.com>
 <CALzYo33ACktZcsQ2u=Q2=6drtKDvZYhBOhXXRhDDZRoh7WWu3A@mail.gmail.com>
 <fc966654-c04e-a61b-dd08-c28dd04bd316@amd.com>
In-Reply-To: <fc966654-c04e-a61b-dd08-c28dd04bd316@amd.com>
From: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Date: Mon, 1 Mar 2021 21:22:15 +0100
Message-ID: <CALzYo31mMJ_Rf9PAhAHHi6JHzBn_dc6ZhsU636r1UeEj5uuQKQ@mail.gmail.com>
Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Babu Moger <babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=pankaj.gupta@cloud.ionos.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qemu Developers <qemu-devel@nongnu.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > Hi Babu,
> >
> > I tried to test below patch for AMD EPYC Rome CPU and I got below error=
 [1]:
> >
> > Also, I noticed SSBD CPU flag for guest was still available even withou=
t this
> > patch, I noticed that for the guest, AMD_SSBD not got set.
> >
> > Guest:
> > 0x80000008 0x00: eax=3D0x00003028 ebx=3D0x00009205 ecx=3D0x00002003
> > edx=3D0x00000000
> >
> > [1]
> > [    0.008000] unchecked MSR access error: WRMSR to 0x48 (tried to
> > write 0x0000000000000000) at rIP: 0xffffffff9245c9e4
> > (native_write_msr+0x4/0x20)
> > [    0.008000]  [<ffffffff9243a6c5>] ? x86_spec_ctrl_setup_ap+0x35/0x50
> > [    0.008000]  [<ffffffff92439423>] ? identify_secondary_cpu+0x53/0x80
> > [    0.008000]  [<ffffffff9244adfa>] ? start_secondary+0x6a/0x1b0
> >
> > 0.011970] unchecked MSR access error: RDMSR from 0x48 at rIP:
> > 0xffffffff9245c772 (native_read_msr+0x2/0x40)
>
> I did not see any problem with these patches.
> My guest setup.
> # lscpu |grep -o ssbd
> ssbd
> [root@rome-vm ~]# uname -r
> 4.18.0-147.el8.x86_64
> [root@rome-vm ~]# cat /etc/redhat-release
> Red Hat Enterprise Linux release 8.1 (Ootpa)
> # wrmsr 0x48 7
> [root@rome-vm ~]# rdmsr 0x48
> 7
>
>
> My host os.
> # uname -r
> 4.18.0-193.el8.x86_64
> [root@rome images]# cat /etc/redhat-release
> Red Hat Enterprise Linux release 8.2 Beta (Ootpa)
>
> Also, I only see ssbd feature when add this patch(EPYC-Rome-v2).
> Otherwise, I don=E2=80=99t see ssbd feature.

Thanks for checking!
Can you also see the ibrs feature inside guest with this patch?

Thanks,
Pankaj
>
> Thanks
> Babu
>
>
> >
> > Thanks,
> > Pankaj
> >
> > > > It is normally added as v2 for compatibility. Like this.
> > >
> > > o.k. Thanks!
> > > I will test this tomorrow.
> > >
> > > >
> > > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c index
> > > > 24db7ed892..f721d0db78 100644
> > > > --- a/target/i386/cpu.c
> > > > +++ b/target/i386/cpu.c
> > > > @@ -4179,6 +4179,20 @@ static X86CPUDefinition builtin_x86_defs[] =
=3D {
> > > >          .xlevel =3D 0x8000001E,
> > > >          .model_id =3D "AMD EPYC-Rome Processor",
> > > >          .cache_info =3D &epyc_rome_cache_info,
> > > > +        .versions =3D (X86CPUVersionDefinition[]) {
> > > > +            { .version =3D 1 },
> > > > +            {
> > > > +                .version =3D 2,
> > > > +                .props =3D (PropValue[]) {
> > > > +                    { "ibrs", "on" },
> > > > +                    { "amd-ssbd", "on" },
> > > > +                    { "model-id",
> > > > +                      "AMD EPYC-Rome Processor" },
> > > > +                    { /* end of list */ }
> > > > +                }
> > > > +            },
> > > > +            { /* end of list */ }
> > > > +        }
> > > >      },
> > > >      {
> > > >          .name =3D "EPYC-Milan",

