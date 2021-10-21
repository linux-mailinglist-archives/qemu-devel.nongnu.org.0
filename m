Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4E6435874
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 03:51:01 +0200 (CEST)
Received: from localhost ([::1]:55692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdNES-0000d4-5L
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 21:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mdNCV-0008Lt-9H
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 21:48:59 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mdNCT-0007KY-Em
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 21:48:59 -0400
Received: by mail-ed1-x533.google.com with SMTP id i20so1212670edj.10
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 18:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8mYA79TuhJjM29gTtjyIXU7vI8pMvvHqKwk/KOD0wt4=;
 b=TJhlOHPpfEMZbUT286Mhshc6znhgxtIcTcQykx2DZXETDX5AUI+K7N2oG4PCcrVOr6
 U8hBGs12seOW7ovqrVxM2gCvM24UHza7TQVaExJVrUFpYY4rbyzBSvcnjGQkZYdzF3Yg
 5CTdxaHRebUp2tjgNfwfTyhk2tq8tfCN8dT5ZKkXMh6MBoEYBDU0qMgaelewuLm9cv7S
 GmkdHbuLNRFH448ubuxBmOLR4eX49BtHpyk1Ng3ZR2HCP7Iujq1Rzq7MqdvbUXW4aBjr
 H+Da68QFPL0JyCtC+Npm2q2az/10RgNqBdNMMzHKJVC0XUP0/PtQIgSsVvSGm20e7PUt
 Wy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8mYA79TuhJjM29gTtjyIXU7vI8pMvvHqKwk/KOD0wt4=;
 b=THANtlh5D/nuD6Druz8ehPZRKr5QffK9qhn9Q8Y/dVeEzNAlOCxhB9bcf+Zgo8LLEA
 JOQ7rmweMQVClv3+7kC7PJkoDxlKAzqmqRNyts5MzlsRl+QPFUvUdeC4me/1XtU2oBjB
 yfmvp/DJGPKF1CZSU/bmXZk40bjoML+zER1cdeRX6g8mpesqlrqa9qGEshqekecJduOS
 duZgBJ++kBvMt23+Jp4lWDvJtlvHVxfOL1/axXRn+u+ycADxFdqqWvyh8JYw0XagX+GM
 ll5WQUnkDx5C3q2Mno8VOxh5kQ1VI2jMjI+CYa3GMme4MYme6ze2dArIHcpXu21WwlAb
 Q+/g==
X-Gm-Message-State: AOAM531t9J7LVnOprs2XqyMNvqDffgS2dX1OCP4qqnz6GquC4PcXsw1o
 V+Hg2kV3iUUHMFgMOsInrijluHgAdU00an7a0VDutg==
X-Google-Smtp-Source: ABdhPJycwpaNcRygJ31eoOCKdSFsyOIuZxwg6+Czt4LoKNsNqrkmediI84SDHBd3vX5SSZto7IBhgEwOGdTOe/T2u44=
X-Received: by 2002:a50:e009:: with SMTP id e9mr3579654edl.254.1634780934620; 
 Wed, 20 Oct 2021 18:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211007135750.1277213-1-ani@anisinha.ca>
 <20211020043845-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211020043845-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 21 Oct 2021 07:18:43 +0530
Message-ID: <CAARzgwxh6g=p7UNsKnwPw9EKf+5kAv4Z0s2Bw8qvmX1Lc38wxQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e4d9f805ced31874"
Received-SPF: none client-ip=2a00:1450:4864:20::533;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e4d9f805ced31874
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 20, 2021 at 2:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Thu, Oct 07, 2021 at 07:27:47PM +0530, Ani Sinha wrote:
> > changelist:
> > v3: removed "nodefaults" from the command line and rebased the patchset.
> > v2: incorporated some of the feedbacks from Igor.
> > v1 : initial RFC patch.
>
> This seems to break on s390 hosts for people. Likely an
> endian-ness bug somewhere. Dropped for now - care tracking that down
> and fixing so I can pick up the test again?
>
> Thanks!


So I take it this patch wasn't causing the issue since this has been merged
to master now?


>
> > This patchset adds a unit test to exercize acpi hotplug support for
> multifunction
> > bridges on q35 machines. This support was added with the commit:
> >
> > d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction
> bridges")
> >
> > Ani Sinha (3):
> >   tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT
> >     table blob
> >   tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges
> >     for q35
> >   tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge
> >     test
> >
> >  tests/data/acpi/q35/DSDT.multi-bridge | Bin 0 -> 8583 bytes
> >  tests/qtest/bios-tables-test.c        |  18 ++++++++++++++++++
> >  2 files changed, 18 insertions(+)
> >  create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
> >
> > --
> > 2.25.1
>
>

--000000000000e4d9f805ced31874
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 20, 2021 at 2:09 PM Michael S. Tsirkin &lt;<a h=
ref=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">On Thu, Oct 07, 2021 at 07:27:47PM +0530, Ani Sinha wrote:<br>
&gt; changelist:<br>
&gt; v3: removed &quot;nodefaults&quot; from the command line and rebased t=
he patchset.<br>
&gt; v2: incorporated some of the feedbacks from Igor.<br>
&gt; v1 : initial RFC patch.<br>
<br>
This seems to break on s390 hosts for people. Likely an<br>
endian-ness bug somewhere. Dropped for now - care tracking that down<br>
and fixing so I can pick up the test again?<br>
<br>
Thanks!</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">So I take=
 it this patch wasn&#39;t causing the issue since this has been merged to m=
aster now?</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><=
br>
<br>
&gt; This patchset adds a unit test to exercize acpi hotplug support for mu=
ltifunction<br>
&gt; bridges on q35 machines. This support was added with the commit:<br>
&gt; <br>
&gt; d7346e614f4ec (&quot;acpi: x86: pcihp: add support hotplug on multifun=
ction bridges&quot;)<br>
&gt; <br>
&gt; Ani Sinha (3):<br>
&gt;=C2=A0 =C2=A0tests/acpi/bios-tables-test: add and allow changes to a ne=
w q35 DSDT<br>
&gt;=C2=A0 =C2=A0 =C2=A0table blob<br>
&gt;=C2=A0 =C2=A0tests/acpi/pcihp: add unit tests for hotplug on multifunct=
ion bridges<br>
&gt;=C2=A0 =C2=A0 =C2=A0for q35<br>
&gt;=C2=A0 =C2=A0tests/acpi/bios-tables-test: update DSDT blob for multifun=
ction bridge<br>
&gt;=C2=A0 =C2=A0 =C2=A0test<br>
&gt; <br>
&gt;=C2=A0 tests/data/acpi/q35/DSDT.multi-bridge | Bin 0 -&gt; 8583 bytes<b=
r>
&gt;=C2=A0 tests/qtest/bios-tables-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 18 ++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 18 insertions(+)<br>
&gt;=C2=A0 create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge<br>
&gt; <br>
&gt; -- <br>
&gt; 2.25.1<br>
<br>
</blockquote></div></div>

--000000000000e4d9f805ced31874--

