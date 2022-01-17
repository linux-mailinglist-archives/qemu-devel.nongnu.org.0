Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DE3490C91
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 17:38:31 +0100 (CET)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9V1Z-0004eX-To
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 11:38:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9Uwz-0001bP-Qv
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:33:46 -0500
Received: from [2a00:1450:4864:20::336] (port=43702
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9Uwy-000242-56
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:33:45 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 s6-20020a7bc386000000b0034a89445406so833050wmj.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 08:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zGovJ4D+1nfAux2g9KphS39tgcVp/iJwdTLIKlw/kE4=;
 b=iwuCd1xjM60xpAm7UgMhv6KlvNydPVn7hiRYek23zNJyKbODdFz4hHRY3E3U1RJM2S
 J7tpw9JrRIWJlFDcAvv3mNBdlAjMu1lxdHLnF62BQlTAt4hG7owIQgCKbLhtG2pFFupr
 +jmAs+YlOFU31m+vBc9DNeEwJmjUOYVmyhG7AD4HuGqfKg8BT+80hOGJ2h1beu/t+WZ8
 mygCfwYdzGxlSiUW+HGZVMbrscMQYjpZu3bsie8P+NuCH7j1mZPtOEuanRWlMROWYgr7
 mg0Hmh/Q3prT0NUHhNfuAXqPsrTEAXOKwSoBSHSMmoTCvlXoAJ0ykVXRI+YHctChCl80
 qAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zGovJ4D+1nfAux2g9KphS39tgcVp/iJwdTLIKlw/kE4=;
 b=s6iGCr+82iDuajGt4H+8n+EWO4XkSGPXo5FRE3TmTxJnTh6W14q6QvxAFZ/eRcPULR
 gsv94bUPzv1H/18ABDx2b65IedKHBjgbwlPX5G1gRftti5X3ylG3TFrexigTgaNcpBxW
 emGdvKXyM42WLtWhm6MEHa0eNbvGL8KW8U+60HWgKH8gvP/4g1q/nLLo/F7L6XgBn5d3
 zhUCV/8oCTgPZnO9z3AvDyFFC4jud7OKJZN0G0fojrjeohBJ2E5jhjsdramYXZWVXSw8
 2/T1c1sxRtSraaH/DFCdparyqm4y8cOkd98V4NPuSrKHKDTTZpJiwG4IC/NpXMamOJdi
 2eOg==
X-Gm-Message-State: AOAM533/e7kZJP6zXEH2EREN5wKuGWG+WhYHl8UWrRirsYSEA6cvPBb2
 SFXSiZxMD5t0lOXiqo2ySN5vhfASNmYulEh4KP2JoQ==
X-Google-Smtp-Source: ABdhPJwtrRHTBA7UNbnQRctopHtWIJ7YantiXIG7JY+a9htYqN5aOw61vFp3M3iJuq6FEmHw6LMlIYRJTCwMTP6AjqM=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr20536580wrn.172.1642437218840; 
 Mon, 17 Jan 2022 08:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-23-imp@bsdimp.com>
 <CAFEAcA-wf3UDDocabE6Th4ixrVWd4Lsfy3pjvnHGwGfNupzK_w@mail.gmail.com>
 <CANCZdfrGAgVzGDMSf4qqq4B2KAs_9Lu4sj4dn96HdhfmkgWqxw@mail.gmail.com>
In-Reply-To: <CANCZdfrGAgVzGDMSf4qqq4B2KAs_9Lu4sj4dn96HdhfmkgWqxw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jan 2022 16:33:27 +0000
Message-ID: <CAFEAcA-irGJ9wEF7gyNU72QZU6-Yx0Af9ykk1t1afHbrOG19CA@mail.gmail.com>
Subject: Re: [PATCH 22/30] bsd-user/signal.c: Fill in queue_signal
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Jan 2022 at 16:22, Warner Losh <imp@bsdimp.com> wrote:
> On Thu, Jan 13, 2022 at 1:37 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> > +    /*
>> > +     * FreeBSD signals are always queued.  Linux only queues real time signals.
>> > +     * XXX this code is not thread safe.  "What lock protects ts->sigtab?"
>> > +     */
>>
>> ts->sigtab shouldn't need a lock, because it is per-thread,
>> like all of TaskState. (The TaskState structure is pointed
>> to by the CPUState 'opaque' field. CPUStates are per-thread;
>> the TaskState for a new thread's new CPUState is allocated
>> and initialized as part of the emulating of whatever the
>> "create new thread" syscall is. For Linux this is in
>> do_fork() for the CLONE_VM case. The TaskState for the
>> initial thread is allocated in main.c.) We do need to deal
>> with the fact that ts->sigtab can be updated by a signal
>> handler (which always runs in the thread corresponding to
>> that guest CPU): the linux-user process_pending_signals()
>> has been written with that in mind.
>
>
> Gotcha. That makes sense. Any reason that atomics aren't used
> for this between the different routines?

We use atomics in some places, eg the qatomic_read()/qatomic_set()
of ts->signal_pending in process_pending_signals. We deal with
some other races by blocking signals. sigtab's a cmplex
data structure, so simply making accesses to its individual
fields atomic isn't sufficient, and the more usual approach of
taking a lock doesn't work when the thing being protected against
is code running in a signal handler.

It's also quite possible that we missed some places
where we should be being stricter about using the atomic
accessors -- if you spot anything like that let us know.

thanks
-- PMM

