Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB04D045A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:43:20 +0100 (CET)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGS7-0006MO-Ha
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:43:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRGQo-0004zo-RZ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:41:58 -0500
Received: from [2607:f8b0:4864:20::22f] (port=43889
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRGQm-0006v1-GI
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:41:58 -0500
Received: by mail-oi1-x22f.google.com with SMTP id w127so5390800oig.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=THgD1NilAu38f0l7NZ0Tv1fJZ41kzRRoZS+Y0Dbna8A=;
 b=TWBmd6eIKPnF3hVQey51OI4AbU/97Kdh1NVOkDQ/CFZAK4kVLXnzTwyVaTUlvIUnN8
 svhWqiP4hDoop/fmQDBXuWN4P6zzuj9hXydyrdhxNxubroQUF8bm9927PomT1tQuJbPJ
 pEI42xNvNbXT9Yhz/j+VVUJ0IC7LEdmWw/s7wXSpf1dZt7YuG6OyMI01RvsQWIfzDU0Z
 0Emv1rCzXuiNz1JXwZQ7pqAFU0SJrU3FZ6H0rzLeTIGsWBp1zOEYNsHuLgpt+KOuKeY/
 F1d63zs21kf1Eg7KB1i7ce1aD8ofJQBKiBLquxEzs4bLraJ2oDwfveNTMl8eIQOpUziT
 hhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THgD1NilAu38f0l7NZ0Tv1fJZ41kzRRoZS+Y0Dbna8A=;
 b=D8U2EElXQrcucR9L/c5SZZ+t0uUPCkXRXrgPPp/Q3qcwWTi9bcE20zQ55TBpk+YMJ3
 OA3CLq7Gz2tTneU227hWnD4bEqzTcfqKwPR/n1sNYnw9W5j7yhMQFbaKfMJ1CS7SUOVU
 Odv9L3MpgWjQ+xEZQ5/gtc1wW78SGbCxV36fXjJ7Ow56tSVTYe9nyRJjjWc9oIOOUxcc
 i2C7uVj35JbUTRx4fyDloN9Uh7FnATQ9V6iDTc2dd11aJtvhoNAMLha0jONy/tvmd0Zl
 9Z+sL/onLpsf2A97LXaduGtgRcwN3HpjivBPQMtOf7ny+P7y295Qr8MHShep45p1o+k+
 pmjA==
X-Gm-Message-State: AOAM532bpiQgmBXPH1UBQrHKQ4Bmm4vs/D7YG8LE83T1TyJh5cVB+eVJ
 eU/CtVvPRUBuqRyaSI7JbfkzQKqytjiDmXr+VTY=
X-Google-Smtp-Source: ABdhPJxL9wVmNALuk07RJYZj0StB3xc4kNXK49MI8QqwQRRvR2nXvv2XtaU6yWnAsfhHoBfsg3lr+hGovws7IRwrN+E=
X-Received: by 2002:a05:6808:220d:b0:2d9:bdb3:15b2 with SMTP id
 bd13-20020a056808220d00b002d9bdb315b2mr5532557oib.88.1646671315401; Mon, 07
 Mar 2022 08:41:55 -0800 (PST)
MIME-Version: 1.0
References: <20220307151004.578069-1-pbonzini@redhat.com>
 <59f773ed-9a1f-10ff-637e-b41848aa534d@gmail.com>
 <CAFEAcA8XshU90eKJM_4+_mLRhUCN+ExWzCkPTveLht0bWBb8=w@mail.gmail.com>
 <CAMVc7JU=easTepCd=j0QHWBcFrry7iYXgX1BbQjs27fmxZGXrA@mail.gmail.com>
 <CAFEAcA8h0E5i=iJswVwC+v_=vs_u92-s90wMgq_C5ZjSTsrZSw@mail.gmail.com>
In-Reply-To: <CAFEAcA8h0E5i=iJswVwC+v_=vs_u92-s90wMgq_C5ZjSTsrZSw@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 8 Mar 2022 01:41:44 +0900
Message-ID: <CAMVc7JVZSTpD5VL1Ls8CcWZsoEMMzsZsGApZ+tNkuFhMc8_+cA@mail.gmail.com>
Subject: Re: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 1:35 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 7 Mar 2022 at 16:27, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > On Tue, Mar 8, 2022 at 1:14 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > The main benefit of Paolo's suggestion from my point of view is
> > > that it entirely eliminates the odd situation where cocoa.m wants to
> > > make calls back into QEMU code where it does not itself hold
> > > the iothread lock in the current thread, but instead knows that
> > > some other thread does and is waiting for it. Instead we end up
> > > with a much more straightforward situation of "every time we
> > > call into QEMU code we hold the iothread lock directly ourselves".
>
> > The current cocoa.m somehows calls back into QEMU code in main, but
> > that is not necessary as demonstrated in:
> > https://patchew.org/QEMU/20220307134946.61407-1-akihiko.odaki@gmail.com/
> >
> > With the code is moved, it becomes only a difference of the place
> > where the code without iothread is located, in main or in
> > [-QemuCocoaAppController applicationDidFinishLaunching:].
>
> That series doesn't remove the general design that has quite a bit
> of "we know some other thread holds the lock and waits for us" code.

Well, I don't think so. main no longer calls back QEMU code (and it
should never do so in my opinion).

> It also gives us the opposite problem that we're now calling a lot
> of Cocoa APIs from something other than the main Cocoa thread.

Basically NSView is the only thing prohibited from calling from
another thread so it shouldn't be a problem.

Regards,
Akihiko Odaki

>
> thanks
> -- PMM

