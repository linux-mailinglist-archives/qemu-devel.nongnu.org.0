Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938332AA52
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:25:44 +0100 (CET)
Received: from localhost ([::1]:53290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAeN-0003gp-C3
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@cloud.ionos.com>)
 id 1lH9v9-0003MQ-QD
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:38:59 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:34654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@cloud.ionos.com>)
 id 1lH9v7-0005Ch-4n
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:38:59 -0500
Received: by mail-lf1-x134.google.com with SMTP id v9so15092777lfa.1
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 10:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FK/zBjJzjtVDqlhSwAy/BibxYUGNW7h1EjsZ5YoLPY4=;
 b=Jr1vNfbZlCI+zrtKs52oNhC9V2X1JKDOZ7v45QARKBwvzAC/ZwAUWn6OOgn5jiYJqa
 PyhNPcfCKPPf5bl35Y88D5gdqGz+H0Z8M/jl7VrkEXL+5AFD8sklzb5rh7ZTeENoGvNC
 GEnI35zPAF7SWEV9qdoJ848F0xoAE7h8P+CDuYLksNvb6lLK6FGNOmDbbvXIAfNoRkrN
 1gcpMOK0GoFKmN1Qlr0xAg10kLnCp2IvnAQdrL/jGY3xFHojwqDy/eS8dR6uI2q5cMXY
 zqVG+kseB33oRA/KVUzxCu08pipp46kh9eNXrM6OasX81DEIqj5sD9oBTZ5njvKc5m+8
 HUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FK/zBjJzjtVDqlhSwAy/BibxYUGNW7h1EjsZ5YoLPY4=;
 b=jC1PcYd3zbpcNgzKfPfjlM66SJjxoaqyYTHb2VlXDNy4389McyEBhI6X9g7UZvHlQ1
 sEm+nEibsELn+dSE0/XGbSxZnjdwcFZ42n4L0KAKZe82JB0mZTElvV4czZgtpgKU4Oq1
 B1f/3J0iCahmiXI5AXClIh49typ4v7FYLLqiQGGIX14rVMEfKMnsXAwYdqa3q7STGBTk
 wJznhjdNgY50f3LviSZ/e5gpnGFUQa4O5ZDM72YvQ5zN9xWSUzg6muV5yO/OZWXOSH0/
 zhCmJ2MblEkaCigRBIwl8dnrzYNIRpg28lyfmdibF11p03pllaYkOdsGqs5AXbdiUFhb
 DSlQ==
X-Gm-Message-State: AOAM530g1+eTz9KK0alO+U+yv6JUxdLlELpGeSgP47XdswUJZB2dDLzA
 gQruE7syYYdqktfKBfALu9vjh+3py5oV70lbgicwyw==
X-Google-Smtp-Source: ABdhPJw1TyGO3j1WHLcl+GrLcjCv3zxYI3eAWS+ZFxIIh65msDGkwJNFCbgKnkPiPgFLsOo+bUSCZ1Ei62YArntp3Wk=
X-Received: by 2002:ac2:5e2f:: with SMTP id o15mr9222812lfg.190.1614710334313; 
 Tue, 02 Mar 2021 10:38:54 -0800 (PST)
MIME-Version: 1.0
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
 <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
 <d2f234a5-e753-5a4e-97db-21bd0a0a69eb@amd.com>
 <CAM9Jb+hESq1yEbPcMWhJTVWoUK-es168bHoOayQ_N1vh3tdRRQ@mail.gmail.com>
 <cd9a84a3-f151-fa00-0b34-2652824bbbfc@amd.com>
 <CAM9Jb+jWfW5yFMy5b9fGXr9Hk4TUv5roOQGEm5C+BSR89e9C_g@mail.gmail.com>
 <CALzYo33ACktZcsQ2u=Q2=6drtKDvZYhBOhXXRhDDZRoh7WWu3A@mail.gmail.com>
 <fc966654-c04e-a61b-dd08-c28dd04bd316@amd.com>
 <CALzYo31mMJ_Rf9PAhAHHi6JHzBn_dc6ZhsU636r1UeEj5uuQKQ@mail.gmail.com>
 <d35d495c-a3e7-5a91-d936-99efd45b15b2@amd.com>
In-Reply-To: <d35d495c-a3e7-5a91-d936-99efd45b15b2@amd.com>
From: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Date: Tue, 2 Mar 2021 19:38:43 +0100
Message-ID: <CALzYo33OfA8yJ4d7LN0kowdqG4_Ty-XZycV50WTrXtq0Ka+WSA@mail.gmail.com>
Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Babu Moger <babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=pankaj.gupta@cloud.ionos.com; helo=mail-lf1-x134.google.com
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

Hi Babu,

I confirm I can see both the ssbd & irbs features in guest with the
below patch. There was some issue at my end, Sorry! for the confusion.
Can you please post the official patch for inclusion.

Best regards,
Pankaj

On Mon, Mar 1, 2021 at 9:38 PM Babu Moger <babu.moger@amd.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> > Sent: Monday, March 1, 2021 2:22 PM
> > To: Moger, Babu <Babu.Moger@amd.com>
> > Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>; Paolo Bonzini
> > <pbonzini@redhat.com>; richard.henderson@linaro.org; Eduardo Habkost
> > <ehabkost@redhat.com>; Qemu Developers <qemu-devel@nongnu.org>
> > Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generati=
on
> > processors
> >
> > > > Hi Babu,
> > > >
> > > > I tried to test below patch for AMD EPYC Rome CPU and I got below e=
rror
> > [1]:
> > > >
> > > > Also, I noticed SSBD CPU flag for guest was still available even
> > > > without this patch, I noticed that for the guest, AMD_SSBD not got =
set.
> > > >
> > > > Guest:
> > > > 0x80000008 0x00: eax=3D0x00003028 ebx=3D0x00009205 ecx=3D0x00002003
> > > > edx=3D0x00000000
> > > >
> > > > [1]
> > > > [    0.008000] unchecked MSR access error: WRMSR to 0x48 (tried to
> > > > write 0x0000000000000000) at rIP: 0xffffffff9245c9e4
> > > > (native_write_msr+0x4/0x20)
> > > > [    0.008000]  [<ffffffff9243a6c5>] ? x86_spec_ctrl_setup_ap+0x35/=
0x50
> > > > [    0.008000]  [<ffffffff92439423>] ? identify_secondary_cpu+0x53/=
0x80
> > > > [    0.008000]  [<ffffffff9244adfa>] ? start_secondary+0x6a/0x1b0
> > > >
> > > > 0.011970] unchecked MSR access error: RDMSR from 0x48 at rIP:
> > > > 0xffffffff9245c772 (native_read_msr+0x2/0x40)
> > >
> > > I did not see any problem with these patches.
> > > My guest setup.
> > > # lscpu |grep -o ssbd
> > > ssbd
> > > [root@rome-vm ~]# uname -r
> > > 4.18.0-147.el8.x86_64
> > > [root@rome-vm ~]# cat /etc/redhat-release Red Hat Enterprise Linux
> > > release 8.1 (Ootpa) # wrmsr 0x48 7 [root@rome-vm ~]# rdmsr 0x48
> > > 7
> > >
> > >
> > > My host os.
> > > # uname -r
> > > 4.18.0-193.el8.x86_64
> > > [root@rome images]# cat /etc/redhat-release Red Hat Enterprise Linux
> > > release 8.2 Beta (Ootpa)
> > >
> > > Also, I only see ssbd feature when add this patch(EPYC-Rome-v2).
> > > Otherwise, I don=E2=80=99t see ssbd feature.
> >
> > Thanks for checking!
> > Can you also see the ibrs feature inside guest with this patch?
>
> Yes, The feature is available with this patch. Otherwise it is not availa=
ble.
> [root@rome-vm ~]# lscpu |grep -o ibrs
> ibrs
>
> >
> > Thanks,
> > Pankaj
> > >
> > > Thanks
> > > Babu
> > >
> > >
> > > >
> > > > Thanks,
> > > > Pankaj
> > > >
> > > > > > It is normally added as v2 for compatibility. Like this.
> > > > >
> > > > > o.k. Thanks!
> > > > > I will test this tomorrow.
> > > > >
> > > > > >
> > > > > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c index
> > > > > > 24db7ed892..f721d0db78 100644
> > > > > > --- a/target/i386/cpu.c
> > > > > > +++ b/target/i386/cpu.c
> > > > > > @@ -4179,6 +4179,20 @@ static X86CPUDefinition builtin_x86_defs=
[] =3D
> > {
> > > > > >          .xlevel =3D 0x8000001E,
> > > > > >          .model_id =3D "AMD EPYC-Rome Processor",
> > > > > >          .cache_info =3D &epyc_rome_cache_info,
> > > > > > +        .versions =3D (X86CPUVersionDefinition[]) {
> > > > > > +            { .version =3D 1 },
> > > > > > +            {
> > > > > > +                .version =3D 2,
> > > > > > +                .props =3D (PropValue[]) {
> > > > > > +                    { "ibrs", "on" },
> > > > > > +                    { "amd-ssbd", "on" },
> > > > > > +                    { "model-id",
> > > > > > +                      "AMD EPYC-Rome Processor" },
> > > > > > +                    { /* end of list */ }
> > > > > > +                }
> > > > > > +            },
> > > > > > +            { /* end of list */ }
> > > > > > +        }
> > > > > >      },
> > > > > >      {
> > > > > >          .name =3D "EPYC-Milan",

