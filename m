Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D442DB1F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 16:07:19 +0200 (CEST)
Received: from localhost ([::1]:60412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb1OA-0000rA-IO
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 10:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <assad.hashmi@linaro.org>)
 id 1mb0NN-000824-13
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:02:28 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:44606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <assad.hashmi@linaro.org>)
 id 1mb0NG-00011E-8f
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:02:24 -0400
Received: by mail-lf1-x130.google.com with SMTP id y26so26656153lfa.11
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DVv/5E+aGIy7AtFpmIH2uJcBNUgX7AvHJrI1vISAJQ4=;
 b=AawzyBoXwnxZRATY4FZrrBaoUqGl1qAMVsssxpTfh8HJ1JGaN+jbkw7NDhj86xtMfV
 8hOGjP0xdxMV72EYRxibmhGZCNFInNzBBCrovzmlViXlHPygHHvpI3pccHxmPmW0JSi9
 q1p9M67aUZ8SxMJLa5h0aHYP4c7fnPOMCnSXhp3Bd1URiByQAkjihA3TGcJdMb6k6Oex
 0yDfAXHxdh0EHfxQQjRehM9jngy8LT30URRQ/h/GDRxXIMa+Pd3r83GqvdrbByaie1bJ
 Fhd+02AQD6iEw3tMPskaJ9Ryytnpl42bo7rE65yp7jpXbNWvRxaRBfgz2k+rjFQ3DYvl
 KiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DVv/5E+aGIy7AtFpmIH2uJcBNUgX7AvHJrI1vISAJQ4=;
 b=GQ6eVQAxeduBy5giGRu7FiH6RZhcA4zwMgKxfvERLwDcXE7RqNwd+74DJdNy2M3JYI
 B97iNBBzDtfrIJt8H9yy5/n1inI1cn8txrxRI4SXVL6U2UTL1yBBk0YYNFPirergFNqC
 cR2eKqGH947idS1S89sA1M20pNbOQd0yNs8D9hcGY0HMC5XkHUOC1vZGZTTvAU+FlDoV
 Hn1XcYcdQtmx/ah+rpEaxY1WHjVmFch9Va546FseG2oS/aI7kmtJ+3xzEjJ7k63/eHMG
 mI1/8TKUC1w3Sb5BZStTcf/HuBEeIZio3esq5NvKte7jT45AxpWr0Fqpqn5dyx3P7bVa
 7K9Q==
X-Gm-Message-State: AOAM5307tOGyyQpcTj20tQrj8NoIvoDXcDDB42wfw3JPZu12W1Uv7lnc
 Z/8E0yMDYPQ45R7WaHZ+6A+phtcNKXzJJBNTFK3w+Q==
X-Google-Smtp-Source: ABdhPJy8mwveF/2DHNm6VyEjPrUPiH4yoO614RysIeySIGgaNYGVLHoaBKxpiQSHkKjmjfLNF5rExS3OY9D5ENJYp5M=
X-Received: by 2002:ac2:41c8:: with SMTP id d8mr4879121lfi.616.1634216527104; 
 Thu, 14 Oct 2021 06:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <877deoevj8.fsf@linaro.org>
 <CAK8P3a3rKZLq3UuE=w9W5A9G9tfmPvc-ObnWVX=PJKQKrTX5dA@mail.gmail.com>
 <87lf33dc58.fsf@linaro.org>
In-Reply-To: <87lf33dc58.fsf@linaro.org>
From: Assad Hashmi <assad.hashmi@linaro.org>
Date: Thu, 14 Oct 2021 14:01:56 +0100
Message-ID: <CAEVS6HrENq-J4q5H20VMK02zNNsSkQ4M5o2ntv4OHNG83wgAOA@mail.gmail.com>
Subject: Re: Approaches for same-on-same linux-user execve?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=assad.hashmi@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Oct 2021 10:05:01 -0400
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 qemu-arm <qemu-arm@nongnu.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Arnd Bergmann <arnd.bergmann@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> ARM's armie takes a different approach with the trap and emulate of
> SIGILL instructions. This works well for the occasional "new"
> instruction but will be less efficient overall if your instruction
> stream is entirely novel.

To clarify: earlier versions of armie did use the SIGILL trap-and-emulate
method, which was limited. Recent versions, including the latest release ar=
e
based on the DynamoRIO platform which enables full emulation and
instrumentation (https://dynamorio.org). By default, DynamoRIO and by exten=
sion
armie, follow all child processes, see
https://dynamorio.org/page_deploy.html#op_children.

As new Arm architecture features are added to QEMU, e.g. SVE, SVE2, SME etc=
.
there is an expectation in the Arm community that QEMU can run large Arm
user-space applications on Arm hardware, making lack of same-on-same execve=
 a
not insignificant blocker.

AIUI, given the open-source licensing of QEMU and DynamoRIO, there would be=
 no
legal reason for QEMU not to borrow from DynamoRIO.


On Fri, 8 Oct 2021 at 11:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Arnd Bergmann <arnd@arndb.de> writes:
>
> > On Thu, Oct 7, 2021 at 4:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >>
> >> I came across a use-case this week for ARM although this may be also
> >> applicable to architectures where QEMU's emulation is ahead of the
> >> hardware currently widely available - for example if you want to
> >> exercise SVE code on AArch64. When the linux-user architecture is not
> >> the same as the host architecture then binfmt_misc works perfectly fin=
e.
> >>
> >> However in the case you are running same-on-same you can't use
> >> binfmt_misc to redirect execution to using QEMU because any attempt to
> >> trap native binaries will cause your userspace to hang as binfmt_misc
> >> will be invoked to run the QEMU binary needed to run your application
> >> and a deadlock ensues.
> >
> > Can you clarify how the code would run in this case? Does qemu-user
> > still emulate every single instruction, both the compatible and the inc=
ompatible
> > ones, or is the idea here to run as much as possible natively and only
> > emulate the instructions that are not available natively, using either
> > SIGILL or searching through the object code for those instructions?
>
> qemu-user only every does a complete translation. The hope is of course
> our translator is "fairly efficient" so for example integer SVE
> operations should get unrolled into a series of AdvSIMD instructions on
> the backend.
>
> ARM's armie takes a different approach with the trap and emulate of
> SIGILL instructions. This works well for the occasional "new"
> instruction but will be less efficient overall if your instruction
> stream is entirely novel.
>
> >> Trap execve in QEMU linux-user
> >> ------------------------------
> >>
> >> We could add a flag to QEMU so at the point of execve it manually
> >> invokes the new process with QEMU, passing on the flag to persist this
> >> behaviour.
> >
> > This sounds like the obvious approach if you already do a full
> > instruction emulation. You'd still need to run the parent process
> > by calling qemu-user manually, but I suppose you need to do
> > something like this in any case.
> >
> >> Add path mask to binfmt_misc
> >> ----------------------------
> >>
> >> The other option would be to extend binfmt_misc to have a path mask so
> >> it only applies it's alternative execution scheme to binaries in a
> >> particular section of the file-system (or maybe some sort of pattern?)=
.
> >
> > The main downside I see here is that it requires kernel modification, s=
o
> > it would not work for old kernels.
> >
> >> Are there any other approaches you could take? Which do you think has
> >> the most merit?
> >
> > If we modify binfmt_misc in the kernel, it might be helpful to do it
> > by extending it with namespace support, so it could be constrained
> > to a single container without having to do the emulation outside.
> > Unfortunately that does not solve the problem of preventing the
> > qemu-user binary from triggering the binfmt_misc lookup.
>
> I wonder how that would interact with the persistent ("P") mode of
> binfmt_misc. The backend is identified at the start and gets re-used
> rather than looked up each time.
>
> >
> >        Arnd
>
>
> --
> Alex Benn=C3=A9e

