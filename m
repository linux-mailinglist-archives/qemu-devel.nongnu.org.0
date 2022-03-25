Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E624E7209
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 12:10:00 +0100 (CET)
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXhpP-0007b1-6K
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 07:09:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXho3-0006nY-Gq
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 07:08:35 -0400
Received: from [2607:f8b0:4864:20::1129] (port=36842
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXhny-0003ux-5v
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 07:08:31 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2e64a6b20eeso79064177b3.3
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 04:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7GcXP47iwFO4z+o8orIr2MsoX04s4jcIl3r+WcNBbmE=;
 b=GitBdFRtYZlsK7ACMZW+QDyCEn7gKVpXFoGCm0h4SGKIaAUuzv1rg2wnXzw1A26ry+
 J8D24KV//QA6HS+IL0UK84vMhHs8hJl1Hww2Ug1L6g4PDjo18imxCKMEvjymrhxyfthF
 ztdQDwhjuNlS+CfHeRjhNH/RVnl9j6K1A0QJdLcdLmRzZeWXY+oi7XeVtYVAbC8cojlF
 ENU6vyhwgTb8cT9lbxJz9GXEacj6T7VRY/GJJVX4QnE7IIxdUt3S4ca5EqTxVMoNhWs8
 15+h+z3NVCNxAw0fM8iYV4yZ1W2nV1MhBt4zqGzjapeSHBo0Oq7afiQyUL05/zAvf/1y
 7oEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7GcXP47iwFO4z+o8orIr2MsoX04s4jcIl3r+WcNBbmE=;
 b=Vt8MPfnCLG7iGmPxrhkr0tExoBEyNxDrKOM3jnq//RV7kNi1fO0aelWxqVimgENBEp
 biFtNxu10hbtCVHeeU7YUzOQoxuhAffc3ZCQpQsELLTpPDKIRgtl2w0zAGD+i3Y5DEqY
 /10tvFKh1EvgMqGNvAv48mvRn+9hFHKDUcNrTkeKT7icpZr4ImZ1clu+Uud0IjrPUtvf
 /hozN43nJNNoN3Lvssk1medwvaBSGnNLVwluWEvuVdT5x5T/4/uctECBn8+Xa7Lp4fba
 428/IfYqqrYP2TMqhhJnK/xRxSsCnsxGkyHpDT5NRp/pfyXOuSTSVjJcAauHZDOQ5c8C
 hZ5w==
X-Gm-Message-State: AOAM5330+vnd39VWJw5gH61QtlWPIcHC3dspMj4FTRzD0V6vqeqV/3I+
 2sfxjH2kyUYIeMwKp+NIfsnbNKxzOx8zZph0e02HEQ==
X-Google-Smtp-Source: ABdhPJyiDjTX5uFFa4ETdAfRoCtpCqLEUeXjlE4gz1r25uwAa/9esQsMkXBPkWJF+YK7+Yl0OJvlOk1VxZWfFJwNIaY=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr9625524ywh.329.1648206509100; Fri, 25
 Mar 2022 04:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_X7d9-e+u3UpB5WvJrmJhhRKdw8EhUzCdFDNVfhFF8mg@mail.gmail.com>
 <2d9e3abd-99de-dc56-c6bd-93e54cd22b8e@redhat.com>
 <87zglee9w3.fsf@secure.mitica>
In-Reply-To: <87zglee9w3.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 11:08:15 +0000
Message-ID: <CAFEAcA_SbVX+uwThSC=UqTOr-Aqu-DmUJch=0vYTT01ctqTmcQ@mail.gmail.com>
Subject: Re: hang in migration-test (s390 host)
To: quintela@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Mar 2022 at 08:04, Juan Quintela <quintela@redhat.com> wrote:
> Laurent Vivier <lvivier@redhat.com> wrote:
> > Perhaps Juan or Thomas can help too (added to cc)
> >
> > Is this a regression?
> > It looks like a bug in QEMU as it doesn't move from cancelling to cancelled.
>
> Hi
>
> TCG never stops given.  And s390 makes things even more interesting.
> First of all, it is a pity that glib debug symbols are not loaded.


> Migration main thread in multifd_send_sync_main(), waiting for the
> semaphore in
>
>     for (i = 0; i < migrate_multifd_channels(); i++) {
>         MultiFDSendParams *p = &multifd_send_state->params[i];
>
>         trace_multifd_send_sync_main_wait(p->id);
>         qemu_sem_wait(&p->sem_sync);
>     }
>
> Knowing the value of i would be great.  See the end of the email, I
> think it is going to be 0.

Unfortunately something went wrong in my attempt to attach gdb
to the process, and the process got killed, so I no longer have
it to answer this question :-(

> >> [Inferior 1 (process 2772862) detached]
> >> ===========================================================
> >> PROCESS: 2772869
> >> gitlab-+ 2772869 2771497  0 Mar23 ?        00:00:00 [qemu-system-i38] <defunct>
> >> /proc/2772869/exe: No such file or directory.
> >> Could not attach to process.  If your uid matches the uid of the target
> >> process, check the setting of /proc/sys/kernel/yama/ptrace_scope, or try
> >> again as the root user.  For more details, see /etc/sysctl.d/10-ptrace.conf
> >> warning: process 2772869 is a zombie - the process has already terminated
> >> ptrace: Operation not permitted.
> >> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/2772869:
> >> No such file or directory.
>
> I have no clue what is this process and what this have to do with this
> run, what can it be?  We already have two qemu's and a test harness
> programm.  Can this be from a previous test case that we are still
> waiting for?

Your guess is as good as mine. I do note that when I've seen this
hang before it has always been with a zombie process in the
process tree.

-- PMM

