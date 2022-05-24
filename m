Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CC6532CC7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:02:59 +0200 (CEST)
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntW3m-0003nS-Pf
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1ntW02-0001nU-3G
 for qemu-devel@nongnu.org; Tue, 24 May 2022 10:59:06 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1ntVzz-00068L-9N
 for qemu-devel@nongnu.org; Tue, 24 May 2022 10:59:05 -0400
Received: by mail-ej1-x62e.google.com with SMTP id f21so22236577ejh.11
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 07:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9g1GBLFSvkceIRjwhmF+rcmytfyWW1ZjhP3J8tRgF00=;
 b=FiW6igk4e++7nnkUy0t9+peKDYJJY0ADWbH6/6TQLKXhauHTQbJCU5hNjUcK6OThQS
 DbakkekU77iqJhEQ9lHgFYQEsmNZg8BMfl9cmD3NrX83or+6f55rkG0DpzKviPjbd8zE
 BHpIoNE6G20leluWK+GqkVxS4KLxGmJuP7LdzRoL/7pRLSohqb5YHUXlvMYIBBykK6i1
 U+hOOwqjjUk+CSlb7rp7Ncm6kkogJyyEp3aTu+DdprFDtxdL51H/ZAEadgP49LF0mzyD
 zsXQFh2ckxSc4THJtcLCl8mKfOctYQPyx1nXiNGF1+nNaA8o2hloznRHRT+szjwR5dzU
 zijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9g1GBLFSvkceIRjwhmF+rcmytfyWW1ZjhP3J8tRgF00=;
 b=IOWs7pizDz5YbLI9v+xYfv5FzSnwbVwiDgKp0sTE7t8IwmbG4gbDkpIbcuGx7F1mqA
 3FimmQgci+lmYlhmxfPytxGwgxHvlg/r5slGj/TmJqx0XiCHy7hZ7KQYKJH7WaPcE08x
 j+Mpu5x32gSII6E/mgVPRHSgGdUY3iHTfr+sLNSrbIYXk2o8QgBx0r5O/IqOR3k83Qbc
 V7lu7vyOIYsYZfiSAfqKffBBhr8bFPLWl7RP4Ydo+Uc0JujzBf9MLJA4Wkb79gI3wiIf
 lvXSxVg19A0fhIjkLnZbkr2fU2xrgawd7GOiztWM84QOppXZK19dDASiBD1lX2X1aNTm
 V3vA==
X-Gm-Message-State: AOAM532idHwk80SVLfotMmC8W0qJCBJ9uCQcfrtcF3+nMNSU76Js/X21
 u0H9b/ZrQStPMFwr0PIe5WigVKwWwWfJbAXqAfE=
X-Google-Smtp-Source: ABdhPJw2Xxe56wYaoZCa/uvQGw0K5I7+rwxtcerlcX2E1FseEIgncIDIccXUgpxBaEy42jM6r5mckDnq2S49iXaC1QI=
X-Received: by 2002:a17:907:6d14:b0:6fe:d86e:7e1a with SMTP id
 sa20-20020a1709076d1400b006fed86e7e1amr10430452ejc.615.1653404341531; Tue, 24
 May 2022 07:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <165331848622.286860.14764979875661796662.stgit@localhost.localdomain>
 <DCDE6AB9-D52A-42B4-9507-328A5D16193E@oracle.com>
In-Reply-To: <DCDE6AB9-D52A-42B4-9507-328A5D16193E@oracle.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Tue, 24 May 2022 07:58:50 -0700
Message-ID: <CAKgT0UeVhUmbbQyEpwMrmC5xcnPHxFPV4Fdgc=jwq7HuRL_juQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mpqemu: Remove unlock/lock of iothread in mpqemu-link
 send and recv functions
To: Jag Raman <jag.raman@oracle.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Johnson <john.g.johnson@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alexander.duyck@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 23, 2022 at 3:56 PM Jag Raman <jag.raman@oracle.com> wrote:
>
>
>
> > On May 23, 2022, at 11:09 AM, Alexander Duyck <alexander.duyck@gmail.co=
m> wrote:
> >
> > From: Alexander Duyck <alexanderduyck@fb.com>
> >
> > When I run Multi-process QEMU with an e1000 as the remote device and SM=
P
> > enabled I see the combination lock up and become unresponsive. The QEMU=
 build
> > is a fairly standard x86_64-softmmu setup. After doing some digging I t=
racked
> > the lockup down to the what appears to be a race with the mpqemu-link m=
sg_send
> > and msg_receive functions and the reacquisition of the lock.
> >
> > I am assuming the issue is some sort of lock inversion though I haven't
> > identified exactly what the other lock involved is yet. For now removin=
g
> > the logic to unlock the iothread and then reacquire the lock seems to
> > resolve the issue. I am assuming the releasing of the lock was some for=
m of
> > optimization but I am not certain so I am submitting this as an RFC.
>
> Hi Alexander,
>
> We are working on moving away from Multi-process QEMU and to using vfio-u=
ser
> based approach. The vfio-user patches are under review. I believe we woul=
d drop
> the Multi-process support once vfio-user is merged.
>
> We release the lock here while communicating with the remote process via =
the
> QIOChannel. It is to prevent lockup of the VM in case the QIOChannel hang=
s.
>
> I was able to reproduce this issue at my end. There is a deadlock between
> "mpqemu_msg_send() -> qemu_mutex_lock_iothread()" and
> "mpqemu_msg_send_and_await_reply() -> QEMU_LOCK_GUARD(&pdev->io_mutex)=E2=
=80=9D.
>
> From what I can tell, as soon as one vcpu thread drops the iothread lock,=
 another
> thread running mpqemu_msg_send_and_await_reply() holds on to it. That pre=
vents
> the first thread from completing. Attaching backtrace below.
>
> To avoid the deadlock, I think we should drop both the iothread lock and =
io_mutex
> and reacquire them in the correct order - first iothread and then io_mute=
x. Given
> multiprocess QEMU would be dropped in the near future, I suppose we don=
=E2=80=99t have
> to proceed further along these lines.
>
> I tested your patch, and that fixes the e1000 issue at my end also. I bel=
ieve we
> could adopt it.

Hi Jag,

I will go take a look at the vfio-user patches. I hadn't been
following the list lately so I didn't realize things were headed in
that direction. It may work out better for me depending on what is
enabled, as I was looking at working with PCIe config and MSI-X anyway
so if the vfio-user supports that already then it may save me some
work.

What you describe as being the issue doesn't sound too surprising, as
I had mentioned disabling SMP also solved the problem for me. It is
likely due to the fact that the e1000 has separate threads running for
handling stats and such and then the main thread handling the
networking. I would think we cannot drop the io_mutex though as it is
needed to enforce the ordering of the request send and the reply
receive. Rather if we need to drop the iothread lock I would think it
might be better to drop it before acquiring the io_mutex, or to at
least wait until after we release the io_mutex before reacquiring it.

If you want I can resubmit my patch for acceptance, but it sounds like
the code will be deprecated soon so I am not sure there is much point.
I will turn my focus to vfio-user and see if I can get it up and
running for my use case.

Thanks,

- Alex

