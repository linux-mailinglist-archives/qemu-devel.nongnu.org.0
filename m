Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E4241CE2B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 23:29:57 +0200 (CEST)
Received: from localhost ([::1]:54786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVh9G-0000ps-3z
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 17:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mVh7j-0008Nb-5E
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 17:28:19 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mVh7h-0008Pe-Dr
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 17:28:18 -0400
Received: by mail-ed1-x534.google.com with SMTP id dn26so13757103edb.13
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 14:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tApL4dO7T3ta68pFUFhW57VhWPj0RpOozrohuooX/XA=;
 b=s6juyrRyTJJJex0KyKwD7wYBeowtuXlC0KxmrVp1DzzMCLr4AgHay6icKE0CLIUEGZ
 RYkm5JVDf9iGUn9JqcyXBy1h2IeTPprM/+e28tLUMJYkDf/ExfV4sQWfRHh89rgX2jLP
 gATMJzx1t310phTa1W1kJsyBTD1SRAd158Wbt78GUmAcu9C7B8EvHwVaTXD2CQ4txehJ
 weRq3hgPZDeoIUyj8cIIUzlLaSzIeVQD++S9GJnY4MUgGZQI2C2Cwn2XZ9rlBlM8s4hd
 cOo+wHJBWshs4ccyyj+BtHh7Mw7QQ+EgrmkbgB0uw43HXOiXyQ+er8LMgj62ST2MyT0R
 ZNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tApL4dO7T3ta68pFUFhW57VhWPj0RpOozrohuooX/XA=;
 b=5rm0jWqS6x3lTiKeFbx0J2/heloo5GNIBhHj+w3KMxB/vR6o9Ho1ch3rSFmQcOfBej
 7eL8kBxgzkOspuEWpXiFLqohTeaQKNxLoVPGGQt6yVNbzZCbqjijBK8mzZS85Mmd6VH5
 lLiA1teLo50NzU24t3nR32zT/2V5XtZRHb/ZskVCUODhr9tB8KVgmRk2Q2hbzoK6Q+eO
 e47V68nyEYiDhdq00MCDO4QNHU/VkQkS1r78vopLXFczMjK4ndbwpg4xhJ4g5W+A2DjG
 2Y4WtWl1po3HMZmnV/igUBLRNDaz2I8TGLDcCxVOvOzX+EY8U/zedtQoSC2MiRIDAPV8
 tEMA==
X-Gm-Message-State: AOAM532pE0F+V63ZAFTkm5mD2ZJox22v0JgEB33192jIM7pTu0RqjhdC
 uLg6loT9Dp8sHhir8rWZbXegA9cpmxzQm8uB2eFTjg==
X-Google-Smtp-Source: ABdhPJzKaXaAEdKJZl/XekHs/OYkC3STVrPmNW6MdPiD9/8LvAdh2vAuYnG+wrsQMTcNPLx6vw8yXmTrKIx5PjNA+Dg=
X-Received: by 2002:a17:907:3e05:: with SMTP id
 hp5mr2287172ejc.527.1632950893752; 
 Wed, 29 Sep 2021 14:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210928223942.244860-1-titusr@google.com>
 <85fb7136-c7b3-8144-d79f-19b5e95e83cb@kaod.org>
In-Reply-To: <85fb7136-c7b3-8144-d79f-19b5e95e83cb@kaod.org>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 29 Sep 2021 14:27:37 -0700
Message-ID: <CAMvPwGqspcxEjzZN8rC5noPpf0G4zK7G8FyLxCPC3j2-4qdnjw@mail.gmail.com>
Subject: Re: [RFC 0/1] hw/ipmi: add an aspeed IPMI iBT device model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 andrew@aj.id.au, wuhaotsh@google.com, minyard@acm.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=titusr@google.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Sept 2021 at 23:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello Titus,
>
> On 9/29/21 00:39, Titus Rwantare wrote:
> > This patch follows the Handing IPMI for emulating BMC patch set by Hao =
Wu.
> > Building on top of the work in [PATCH] hw/misc: Add an iBT device model=
 posted
> > by C=C3=A9dric Le Goater, this iBT model works as a backend to ipmi-hos=
t-extern.
>
> Could you please resend with my patch which is still available here :
>
>   https://github.com/legoater/qemu/commit/c6b679690f32534e8992d96752d90d2=
c4aa48130
>
> or here :
>
>   http://patchwork.ozlabs.org/project/qemu-devel/patch/20210407171637.777=
743-20-clg@kaod.org/
>
> and in another patch, the modifications you made on top of mine. That
> will help understand where the problem could be.
>
> You can modify patches but you need to keep the original author name,
> commit log, signed-off-by to certify its origin. Then list the changes
> you have made and add your signed-off-by.
>
> The patch you sent seems to be mostly mine and I don't see any of the
> above.
>
> Here is some more info in the kernel documentation :
>
>    https://www.kernel.org/doc/html/v4.12/process/submitting-patches.html#=
sign-your-work-the-developer-s-certificate-of-origin
>
> I don't think we have the same kind of documentation in QEMU but it's
> the same process.

Thanks, I'm still learning.

>
> > Needed to run:
> > - [PATCH 4/8] hw/ipmi: Refactor IPMI interface, Hao Wu
> > - [PATCH 5/8] hw/ipmi: Take out common from ipmi_bmc_extern.c, Hao Wu
> > - [PATCH 6/8] hw/ipmi: Move handle_command to IPMICoreClass, Hao Wu
> > - [PATCH 7/8] hw/ipmi: Add an IPMI external host device, Hao Wu
>
> I have no idea what these patches do and where they are. They seem to
> modify the core IPMI framework and it is important to understand the
> overall changes. Please include them in the patchset first since they
> are initial requirements.
>

I've pushed everything here: https://github.com/Rwantare/qemu/tree/aspeed-i=
bt
The other patches are out for review and will likely change before merging

> > Host commandline
> >      -chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,reconne=
ct=3D10 \
> >      -device ipmi-bmc-extern,chardev=3Dipmichr1,id=3Dbmc0 \
> >      -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 -nodefaults
> >
> > BMC commandline
> >      -chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,server=
=3Don,wait=3Doff \
> >      -device "ipmi-host-extern,chardev=3Dipmichr1,responder=3D/machine/=
soc/ibt"
>
> Could we have the full command lines also ?
>

Sure, there's not much else there, one of the bmc firmwares I'm testing wit=
h
is a quanta-q71l-bmc which should build from OpenBMC.

Host:
qemu-system-x86_64 \
-nographic -m 4G \
-kernel arch/x86/boot/bzImage -append "console=3DttyS0 earlyprintk=3DttyS0"=
 \
-serial /dev/tty -monitor /dev/pts/9 -initrd u-root.cpio \
-chardev socket,id=3Dipmichr0,host=3Dlocalhost,port=3D9999,reconnect=3D10 \
-device ipmi-bmc-extern,chardev=3Dipmichr0,id=3Dbmc0 \
-device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 -nodefaults

BMC:
qemu-system-arm \
-machine quanta-q71l-bmc \
-nographic \
-drive file=3Dpath/to/openbmc/image,if=3Dmtd,bus=3D0,unit=3D0,snapshot=3Don=
 \
-chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,server=3Don,wait=
=3Doff \
-device "ipmi-host-extern,chardev=3Dipmichr1,responder=3D/machine/soc/ibt"

>
> > Currently, IRQs are not functional, but it is able to connect.
> > The following printout is from the host:
> >
> > [    6.869742] ipmi_si IPI0001:00: IPMI message handler: Found new BMC =
(man_id:
> >   0x002b79, prod_id: 0x0000, dev_id: 0x00)
> > [   12.393281] ipmi_si IPI0001:00: IPMI bt interface initialized
> >
> > This patch is an RFC because of the missing IRQs and the need for other=
 patches
> > to get merged.
>
> We will need the whole project to start reviewing.
>
> Thanks,
>
> C.

Noted, I think I should be able to send the BT commits from
https://github.com/Rwantare/qemu/tree/aspeed-ibt
after the others are reviewed and merged.
For now, the irq setup is my point of confusion.

Thanks,
-Titus

