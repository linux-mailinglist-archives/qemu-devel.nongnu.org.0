Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B46F3E5415
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 09:06:09 +0200 (CEST)
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDLpw-00082t-1b
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 03:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mDLoR-0007Np-Mg
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 03:04:35 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:46050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mDLoO-00030E-27
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 03:04:35 -0400
Received: by mail-il1-x135.google.com with SMTP id a4so5120129ilj.12
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 00:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J8+BujW/Pg3rs7smmSdxE+dz/CyzehMvbWjePahnbSs=;
 b=ec67rEv2YJ4jXUQmQsq48ka0iiRRulRvmvP7zjOzbSAECMqDi8iNQAzcUHmcvI05+q
 ZFYAp6U2PLqPz9kd984akqJYhRvixUMW1XbX00lyCxTGSfSOROrGCNU3feAEGL7EWDH9
 MS4R6N1BTgzUoiuvqvnQRgju2p4RAI1oGrwmdKy2vi5kXtncLDL5c5JFI27tv/TsU00j
 Bsmu7s7nVAzvlsCONPcfYCcVtp3h5D6bRtbMvH0wbq38NarRX9MVBgEC3r+MIJPgk8ES
 dCvB9fz+eo4aLiIuoy3msyd0Vvp0eosVzJgMQcrSt0WQ/qZSJnxdAAF/JpspoWvrpvkW
 enxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J8+BujW/Pg3rs7smmSdxE+dz/CyzehMvbWjePahnbSs=;
 b=kiH5q2/iP9s9jJdzpFHqJTBJeWgWFeA7XQcPhXdzFdPbzHsmdA2CGY0gEOXllKOKCp
 w4Ncq9z+yMu/DbXRBT2gagDSSiaSFtBkRVr4V9vAWoShnN9Do6EH+EFscO/drCCybr0S
 17/7Z0E0rOXZKvMGujM8hW8ixPmujh8BWi+xdvfyduJ+/i+YqfX6ksG6DxBjTB5mAQ2z
 ewuU157N/SV/zM+Xup6PeFq72LnFFwiVhsaHerUZQpSG36WE9+K4nwUAwCK8jbBpJhmH
 IzWIJJ2g26voxj/hZKh2jwPOFFlFubmDEvTwdqGoOoUEF020hSTCCQp0Irj4/JVUL7Qm
 TDrg==
X-Gm-Message-State: AOAM531oO5KjXgysq6ghAan7i1VbsxEI0fTjkOiWR0TeRdaHplbrStGW
 mwIQPYr46u33bvdJikIdhuRYf6/TjNulBNHTDEA=
X-Google-Smtp-Source: ABdhPJxzIY4JAlSUJwLTf0cxa3ruDmQrmPUxvrPRMtIZW/H4e52tdmMKeDMDUWPEc+h7QvhIhbTg/QL8o8oGFNkc0LA=
X-Received: by 2002:a92:3610:: with SMTP id d16mr130437ila.16.1628579069845;
 Tue, 10 Aug 2021 00:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTYPpo680Ub6CCx7-N2o=Q6Q6Kh=DLNCcUq-1F0JbCThOw@mail.gmail.com>
 <CAFEAcA89Dua-t14v3DH-LFG+4UDtU81PuaTOruLTQJw+T25eiA@mail.gmail.com>
In-Reply-To: <CAFEAcA89Dua-t14v3DH-LFG+4UDtU81PuaTOruLTQJw+T25eiA@mail.gmail.com>
From: Duo jia <jiaduo19920301@gmail.com>
Date: Tue, 10 Aug 2021 15:04:19 +0800
Message-ID: <CALUzjTYnq37VQMzFTU-uzZvBPhfYDQg_g+zc=0KmDxMOUTE0zQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_How_does_qemu_detect_the_completion_of_interrupt?=
 =?UTF-8?Q?_execution=EF=BC=9F?=
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for the detailed explanation.

Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B48=E6=9C=886=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:16=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Fri, 6 Aug 2021 at 07:24, Duo jia <jiaduo19920301@gmail.com> wrote:
> > I am simulating a device. When an interrupt occurs, another interrupt
> > comes, and the second interrupt will not be triggered because the
> > first interrupt has not yet finished.
> >
> > I want to know whether qemu can detect whether the interrupt has been
> > executed, will there be a callback here?
> > Or how can I deal with this situation?
>
> End of interrupt handling is entirely dependent on what the
> guest hardware being emulated is. Usually the guest software
> will indicate "interrupt handled" back to the interrupt
> controller (perhaps by writing a register; depends on the
> interrupt controller), and the interrupt controller will
> then look at what the next highest priority pending interrupt
> is and signal that back to the CPU, or do nothing if there's
> no new interrupt. So the second interrupt will automatically
> be taken and handled once the first one has finished,
> as a result of this interrupt controller and guest OS
> interaction.
>
> The original device usually doesn't get told when this
> happens, and it doesn't need to know. For example, one common
> form of device interrupt is level-triggered. Here the device
> has some condition (perhaps "FIFO full") that causes an
> interrupt. So it raises its outbound IRQ line when the FIFO
> is full, and it doesn't lower it again until whatever the
> device specification says is the condition (eg when the
> guest reads from the FIFO, or if the guest writes to some
> 'clear interrupt' register on the device). It's the job of
> the guest software to make sure that when it gets an interrupt
> from the device that it handles it such that the device has
> been satisfied and lowered the interrupt.
>
> More rarely, some devices are specified to pulse their interrupt
> line when a condition occurs.
>
> In summary, you need to look at the specification of the device
> you're emulating to find out when and how it is supposed to
> raise or lower its interrupt line. ("I didn't get a second
> interrupt" bugs might also be caused by bugs in the interrupt
> controller or in the guest software device driver -- if you're
> just using an existing known-to-work QEMU interrupt controller
> model and a known-to-work device driver and OS, then the
> bug is very likely in your device model. If you're also
> writing the OS device driver at the same time then the bug
> could be there instead.)
>
> -- PMM

