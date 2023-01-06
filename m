Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DC3660392
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 16:41:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDoov-0003kl-4w; Fri, 06 Jan 2023 10:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDoos-0003kX-UV
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:39:46 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDoor-0004o6-4o
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:39:46 -0500
Received: by mail-pl1-x631.google.com with SMTP id g16so1983878plq.12
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 07:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fmjnrXHCgbgnirRJLxbFcMKRv+9RGMNEl9lbYHypX9M=;
 b=VDdIMWDtlljX+ZdGNPI+Zp/IHuizfWrRMaHZ7UbmI0Av2QRlavBYwxyhy0aWsFQboi
 Yi1cLo3B6gJmWPOD7DB9gHO004U4s0OlMRkLgsE9Wt87J5fEQBCsLVykWVVVo8oS2VNt
 dOjkaoa6aLa/ud8M/dRrya8NklnJ7apyin8KNZjRk9MdoQTTdf4Wh7rewuoG3q1IrFa7
 q/S4oYS538y873mX/a3m/dxlMPU1I+ktcFwffzw0LxBFh8F3OWaLvK5OnAIGHOkMmAnp
 n8bQmh2+HWD4KyHt2DvQB4AFV5So9bAH6KjrvwaJ1NWzyegwrFWUQAu7NtcAIFEu86aW
 o7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fmjnrXHCgbgnirRJLxbFcMKRv+9RGMNEl9lbYHypX9M=;
 b=kdM7o5ZBr8U2y/hJi27ecnXzs1vr8wqUQWV/Y9k24ypE7aqtFHxWdGuPuYU61LJ0OC
 moWgILDel9+GbaYxec1fMcde+LXvtP2ZtcPXDoF1HisMaSOJD34Y86Al57ImcSO12mXZ
 PawLu/Bo7Es/oFVM4KJFbM70HOa/XDYExOV15wSRGSSQ2JMt1CX+NtQjqW9/XMX5XFdD
 dAeivxHCaedq2It5HtNBwNGYEaa30BjNtBLrpOW+yxR9ILeRrcc2stUDBo9+SdXfllkt
 B4W24X1Pp15CbhJtM01QQzQnvrpvHbf2UF8Sbevq5V9MiOzaJlpLGjANW7umm4hPELeV
 yrDg==
X-Gm-Message-State: AFqh2ko5oDYiBj2WoM15A+kpIIV32oaQxxiHKHdTC0vOSpFKy9HYY4eU
 TyfhUsIA940Y5IwCWDlfPtWe53aVuv1TpvnM5x0CFQ==
X-Google-Smtp-Source: AMrXdXsqhgXTQ95Fsx1i+Q51gzG9Aq6DtnBBL9pq3OuzCpEr4kDmdGNcx5wwGQ7Wge320qH/oek09idxAmecvQBwl6E=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr4440878pjs.19.1673019583242; Fri, 06 Jan
 2023 07:39:43 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
 <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
In-Reply-To: <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 15:39:31 +0000
Message-ID: <CAFEAcA8Er1f=KzsOhBeMgt2+8-sTua6mQU_708fjRSSrzNu+CA@mail.gmail.com>
Subject: Re: intermittent hang, s390x host, bios-tables-test test, TPM
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 6 Jan 2023 at 15:16, Stefan Berger <stefanb@linux.ibm.com> wrote:
>
>
>
> On 1/6/23 07:10, Peter Maydell wrote:
> > I'm seeing an intermittent hang on the s390 CI runner in the
> > bios-tables-test test. It looks like we've deadlocked because:
> >
> >   * the TPM device is waiting for data on its socket that never arrives,
> >     and it's holding the iothread lock
> >   * QEMU is therefore not making forward progress;
> >     in particular it is unable to handle qtest queries/responses
> >   * the test binary thread 1 is waiting to get a response to its
> >     qtest command, which is not going to arrive
> >   * test binary thread 3 (tpm_emu_ctrl_thread) is has hit an
> >     assertion and is trying to kill QEMU via qtest_kill_qemu()
> >   * qtest_kill_qemu() is only a "SIGTERM and wait", so will wait
> >     forever, because QEMU won't respond to the SIGTERM while it's
> >     blocked waiting for the TPM device to release the iothread lock
> >   * because the ctrl-thread is waiting for QEMU to exit, it's never
> >     going to send the data that would unblock the TPM device emulation
> >
> [...]
>
> >
> > Thread 3 (Thread 0x3ff8dafe900 (LWP 2661316)):
> > #0  0x000003ff8e9c6002 in __GI___wait4 (pid=<optimized out>,
> > stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=<optimized out>,
> > usage=usage@entry=0x0) at ../sysdeps/unix/sysv/linux/wait4.c:27
> > #1  0x000003ff8e9c5f72 in __GI___waitpid (pid=<optimized out>,
> > stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=options@entry=0) at
> > waitpid.c:38
> > #2  0x000002aa0952a516 in qtest_wait_qemu (s=0x2aa0b42c9b0) at
> > ../tests/qtest/libqtest.c:206
> > #3  0x000002aa0952a58a in qtest_kill_qemu (s=0x2aa0b42c9b0) at
> > ../tests/qtest/libqtest.c:229
> > #4  0x000003ff8f0c288e in g_hook_list_invoke () from
> > /lib/s390x-linux-gnu/libglib-2.0.so.0
> > #5  <signal handler called>
> > #6  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> > #7  0x000003ff8e9240a2 in __GI_abort () at abort.c:79
> > #8  0x000003ff8f0feda8 in g_assertion_message () from
> > /lib/s390x-linux-gnu/libglib-2.0.so.0
> > #9  0x000003ff8f0fedfe in g_assertion_message_expr () from
> > /lib/s390x-linux-gnu/libglib-2.0.so.0
> > #10 0x000002aa09522904 in tpm_emu_ctrl_thread (data=0x3fff5ffa160) at
> > ../tests/qtest/tpm-emu.c:189
>
> This here seems to be the root cause. An unknown control channel command
> was received from the TPM emulator backend by the control channel thread
> and we end up in g_assert_not_reached().

Yeah. It would be good if we didn't deadlock without printing
the assertion, though...

I guess we could improve qtest_kill_qemu() so it doesn't wait
indefinitely for QEMU to exit but instead sends a SIGKILL 20
seconds after the SIGTERM. (Annoyingly, there is no convenient
"waitpid but with a timeout" function...)

thanks
-- PMM

