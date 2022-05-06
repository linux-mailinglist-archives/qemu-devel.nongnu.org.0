Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB1151CFF0
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:03:35 +0200 (CEST)
Received: from localhost ([::1]:58002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmpBm-0001CU-53
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nmp9s-00005b-FY
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:01:36 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nmp9p-000566-SH
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:01:35 -0400
Received: by mail-wr1-x431.google.com with SMTP id b19so8366948wrh.11
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 21:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+5Ot20dMZN3uAXz34xMPBwOYU9E02eZZOK440nsDlGw=;
 b=6eljkoa3VSVaNvxeeksuPo2ALILasP8ZeiwQpF0HlC5m4zqNZidUn45VVecpSbAfPj
 aKt0Q1F2T65iajiC68+HM67fOnBHwyxEmGfI5SxjebtovDfDCjl19p6kOYhbfV7u/4sz
 MY9ard4+bfOUHnzxOJZIUFy3R7fICkMbksRr/2J7X8779LZiexRbKf12PsBYlqS35KDd
 HOTJgZiFYv/384cEANsO6Z25URqQJ/C1vpZf7o2PSrs1pbra5EDMfX+Rq/jb2UjR5da8
 ArQjVk2GNB6Adca2rGmWJIFy2nzLHB59tXvZ7qbiVfnPkALhU80fAQOTs26dk68XrCyA
 GuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+5Ot20dMZN3uAXz34xMPBwOYU9E02eZZOK440nsDlGw=;
 b=5yC+vo2Hm28Zqzp4REyGUc2IkUxOEC7OqreQL+vRGkVx7WDWJbbu8plloeDV6Dim1i
 NeTd6JvBxmsjdtt8XtsQMkWX7+svTMWVdgfKP5GayidNdWQBADHYuzwdUdJYoHW55Vwo
 VGvKOSgGcWmvl68P7CLzDsSh9oS4DARxGesjef33poJf4sN1uaHk7/D29PMP/3GLKR4d
 Z/wctFaaSHo/pSaYWo28J36qvPqBaJGRmRWZ88rxGMJPHOKE+2KdbrXhA+NwQ/yfI65S
 Vh5dLQvFJT0ox/XaDvt+rX/bqfNRm5KA1nnFfZtEL4CWV1pcF2qcS+MIhANlXKUp1nra
 o3Cg==
X-Gm-Message-State: AOAM533L2F6FdKgNnh7WNjMyIwgMqiTxuTddifHGGTGqvQREUjia+mNc
 wQQ5wxRRT8Z0KLsxRbTagay2WJ3/V7RyUoGsYW1tXQ==
X-Google-Smtp-Source: ABdhPJwCOkboBkK3j3HFmAnpZOdz0sTV9pxx0v1sZ6i97pfHRgOIdodSvquQvPuCGpcX+TORXLvI81SMk32lf9H4fk0=
X-Received: by 2002:a5d:6d0d:0:b0:20c:530c:1681 with SMTP id
 e13-20020a5d6d0d000000b0020c530c1681mr960883wrq.214.1651809691734; Thu, 05
 May 2022 21:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220412021009.582424-1-atishp@rivosinc.com>
 <Yl7oiF7kUrIQ0qk5@redhat.com>
 <CAOnJCUJWX5wPXVNbgNirNgBhi-w39RgqFZMJgvZKTMGhrdLtFw@mail.gmail.com>
 <CAOnJCUK9_qzOLr3GVdFTP95rs3avNE=7E2R27dADkMMsOhnGEQ@mail.gmail.com>
 <CAKmqyKPy=abr_m_YSA2v-rVN8TdnsFX8uzUOpp0BpJkGj9yXMQ@mail.gmail.com>
 <YnOhHZGJphk30SmJ@redhat.com>
In-Reply-To: <YnOhHZGJphk30SmJ@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 May 2022 09:31:19 +0530
Message-ID: <CAAhSdy2z7fEuh+MMgvy2r9EoRAaxnbosuA_gFSQn_g6_u5Zdaw@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce a new Qemu machine for RISC-V
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Atish Patra <atishp@rivosinc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::431;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, May 5, 2022 at 4:24 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, May 05, 2022 at 07:36:51PM +1000, Alistair Francis wrote:
> > On Tue, May 3, 2022 at 5:57 PM Atish Patra <atishp@atishpatra.org> wrot=
e:
> > >
> > > On Tue, Apr 19, 2022 at 5:26 PM Atish Patra <atishp@atishpatra.org> w=
rote:
> > > >
> > > > On Tue, Apr 19, 2022 at 9:51 AM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
> > > > >
> > > > > On Mon, Apr 11, 2022 at 07:10:06PM -0700, Atish Patra wrote:
> > > > > >
> > > > > > The RISC-V virt machine has helped RISC-V software eco system t=
o evolve at a
> > > > > > rapid pace even in absense of the real hardware. It is definite=
ly commendable.
> > > > > > However, the number of devices & commandline options keeps grow=
ing as a result
> > > > > > of that as well. That adds flexibility but will also become bit=
 difficult
> > > > > > to manage in the future as more extension support will be added=
. As it is the
> > > > > > most commonly used qemu machine, it needs to support all kinds =
of device and
> > > > > > interrupts as well. Moreover, virt machine has limitations on t=
he maximum
> > > > > > number of harts it can support because of all the MMIO devices =
it has to support.
> > > > > >
> > > > > > The RISC-V IMSIC specification allows to develop machines compl=
etely relying
> > > > > > on MSI and don't care about the wired interrupts at all. It jus=
t requires
> > > > > > all the devices to be present behind a PCI bus or present thems=
elves as platform
> > > > > > MSI device. The former is a more common scenario in x86 world w=
here most
> > > > > > of the devices are behind PCI bus. As there is very limited MMI=
O device
> > > > > > support, it can also scale to very large number of harts.
> > > > > >
> > > > > > That's why, this patch series introduces a minimalistic yet ver=
y extensible
> > > > > > forward looking machine called as "RISC-V Mini Computer" or "mi=
nic". The
> > > > > > idea is to build PC or server like systems with this machine. T=
he machine can
> > > > > > work with or without virtio framework. The current implementati=
on only
> > > > > > supports RV64. I am not sure if building a RV32 machine would b=
e of interest
> > > > > > for such machines. The only mmio device it requires is clint to=
 emulate
> > > > > > the mtimecmp.
> > > > >
> > >
> > > Any other thoughts ?
> >
> > I don't *love* this idea. I think the virt machine is useful, but I'm
> > not convinced we need a second one.
> >
> > This feels a little bit more like a "none" machine, as it contains
> > just the bare minimum to work.
> >
> > >
> > > > > I would ask what you see as the long term future usage for 'virt'=
 vs
> > > > > 'minic' machine types ? Would you expect all existing users of 'v=
irt'
> > > > > to ultimately switch to 'minic', or are there distinct non-overla=
pping
> > > > > use cases for 'virt' vs 'minic' such that both end up widely used=
 ?
> > > > >
> > > >
> > > > Nope. I don't expect existing 'virt' users to switch to 'minic' as
> > > > they aim to cater to different users.
> > > >
> > > > Here are the major differences
> > > > 1. virt machine supports MMIO devices & wired interrupts. Minic doe=
sn't
> >
> > This seems like the main difference
> >
> > > > 2. virt machine doesn't support the MSI only option yet (can be add=
ed
> > > > though[1]). Minic does.
> >
> > This could be fixed
> >
> > > > 3. Number of cpu supported by virt machine are limited because of t=
he
> > > > MMIO devices. Minic can scale to very
> > > > large numbers of cpu.
> >
> > Similar to 1
> >
> > > > 4. 'Minic' only supports PCI based MSI capable devices. Thus, MSI i=
s a
> > > > mandatory requirement for 'minic' while
> > > > it is optional for 'virt'.
> >
> > I'm not fully convinced we need this, but it also doesn't seem to cost
> > us a lot in terms of maintenance. It would be beneficial if we could
> > share a bit more of the code. Can we share the socket creation code as
> > well?
> >
> > I don't like the name minic though. What about something like
> > `virt-hpc`, `virt-pcie-minimal` or something like that? That way we
> > indicate it's still a virt board
>
> We're not versioning the 'virt' machine type right so. IOW, we've not
> made any promises about its long term featureset.
>
> If the virt machine type isn't the perfect match right now, should
> we change it, in a potentially incompatible way, to give us the right
> solution long term, rather than introducing a brand new machine type
> with significant overlap.

Versioning of "virt" machine has been a long pending item for enterprise
class Guest/VM migration.

Since "virt" machine is QEMU RISC-V specific, we can do the following:
1) Detailed documentation of "virt" machine layout along with versioning
    in the QEMU documentation
2) Re-structure "virt" machine implementation to support future changes
    "virt" machine.

Regards,
Anup

>
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
>

