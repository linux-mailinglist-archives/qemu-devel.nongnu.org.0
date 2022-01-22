Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E999496D3F
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:12:25 +0100 (CET)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBKsA-0005LR-G3
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:12:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nBKi5-0002gt-58
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:01:57 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:65040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nBKhe-0007lL-MB
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:01:54 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id AC77181A27
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 18:00:52 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jh3vS442Dz4YXw
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 18:00:52 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1642874452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=45g9YnQvv1jJFFsM7dtlkKSxKYrGPeZULx15g+eWsvw=;
 b=IRfpHysD+PzJiOA4HsxAoI18V9vPo9kyVqmozWftHHKCMCQF521q9fZn+ygpK8vRZQ3J3R
 cpPlWEnvfOiWxuPK7FMOianvlsk6ZxszGhTCd+oaXtKVQDAn2ZQ0Plvsq+n+tAk9q33edC
 VROGFtp1GpvUzVbOFTAg4sb9W5EYUe8KFaqpEszYakASdJCVmVTlkfBnN0Zao4dbKSK/iL
 pr+JygYUX1AXND3/TQimKDFkpvaGST1uKnJkQ3UsT3mvqTFgrZun4al2LC2oR5+gstsv3m
 KsDa9liA07/n8ElojGjHBd0vAgoooU3WkkmlZ9R7TABYNVzZSDzDWMvNKME9vw==
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 66CC18C53
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 18:00:52 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f174.google.com with SMTP id h15so14122748qtx.0
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:00:52 -0800 (PST)
X-Gm-Message-State: AOAM533s4M3wL7kxRpHgpt/JElPuOT0ikUgM4CZiIATvPfNQ0yr7cJW/
 ooWdwN1dwpVE1eZBy+zGegm/aXL8qHtnfvH8fbM=
X-Google-Smtp-Source: ABdhPJxzKDkx0wC+NQ/gLef1icSopgI9vx3O8EVntRazmDQjHb6IeeMrP2ikhSFXA4wzOO+s9Goi8svfzdN6bXSW2bs=
X-Received: by 2002:ac8:7fd0:: with SMTP id b16mr7412400qtk.123.1642874451893; 
 Sat, 22 Jan 2022 10:00:51 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-24-imp@bsdimp.com>
 <CAFEAcA_fc_-qXoY07uZuMpT6kAUT+oT8RD_G=8vGgSQqDmH-WA@mail.gmail.com>
 <CANCZdfrOaptXXb7myYHJ5oVzcczoz48rretVaGZy5FT2rCgk0w@mail.gmail.com>
In-Reply-To: <CANCZdfrOaptXXb7myYHJ5oVzcczoz48rretVaGZy5FT2rCgk0w@mail.gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sat, 22 Jan 2022 12:00:39 -0600
X-Gmail-Original-Message-ID: <CACNAnaGfsbat5E4eYsP28cAd5gy+TCsNuoVDBx3xhD7FAxWCxQ@mail.gmail.com>
Message-ID: <CACNAnaGfsbat5E4eYsP28cAd5gy+TCsNuoVDBx3xhD7FAxWCxQ@mail.gmail.com>
Subject: Re: [PATCH 23/30] bsd-user/signal.c: sigset manipulation routines.
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1642874452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=45g9YnQvv1jJFFsM7dtlkKSxKYrGPeZULx15g+eWsvw=;
 b=wScgqChGYcQ92Qj1swSRpXoN9RhOQF1Jv9F8jsiAunIvgmOG6v91ofJMCS3d3ES/Vo+S4G
 NSjQuVjEY7l6LoWV/xlbHb+eOlXcHhbREIhlQ51HD8MlqztYR1peD1TRPKl90DceGLcA+e
 BeyVn7zD/emHvjRJ6oHk7XopUlOyKSun62pqb3IBKk/YXruMjEigZ4cjN9TEdSz2hRpqTt
 EZeFQrdRZ+AgzcFIxedSE0o3TjqjZSKZdX4lp1id90HVItAY4QSBA54vBSMvFSCEWputct
 UCqEXJ319Cy60siYycJJ4GL6usxOoEcIe9PI4pMnDPm3RgGurxBLpm3uS8BiRw==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1642874452; a=rsa-sha256; cv=none;
 b=DaiPQ3L/tEoHyE7TK56Lp7lTROTMXkvw5WOAyTvmChFqmOg6G97n6umXZOUrEnthlC4YoP
 4IQ81nkDM8nCVA1SdK/M/BqNj0pVR0zoBmJPtV+DdzYch7ZeXBo/F5OluOmj+nhl9p0PiU
 JXv9MQrVxwmFXRLEyxPa4GQ5ZWCAkFOadYx7hgHP8PQsL6BJhwb/+/ExY+OYfeLR3V6wuw
 1MP8P+8HMExXkkO4sBApwDjoJaWZ/cBJyDhqvYOff5+QGsXwJiMcZ4qEPjIDwWOigRPAt/
 qKORPBIlzKSufCHAfA45II80kBpHRHWMdPon33X2MzGxMwqLASBAQUO6oxOZ2Q==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 22, 2022 at 10:44 AM Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Fri, Jan 14, 2022 at 4:14 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sun, 9 Jan 2022 at 16:53, Warner Losh <imp@bsdimp.com> wrote:
>> >
>> > target_sigemptyset: resets a set to having no bits set
>> > qemu_sigorset:      computes the or of two sets
>> > target_sigaddset:   adds a signal to a set
>> > target_sigismember: returns true when signal is a member
>> > host_to_target_sigset_internal: convert host sigset to target
>> > host_to_target_sigset: convert host sigset to target
>> > target_to_host_sigset_internal: convert target sigset to host
>> > target_to_host_sigset: convert target sigset to host
>> >
>> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
>> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
>> > Signed-off-by: Warner Losh <imp@bsdimp.com>
>> > ---
>> >  bsd-user/qemu.h   |  3 ++
>> >  bsd-user/signal.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++
>> >  2 files changed, 92 insertions(+)
>> >
>> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
>> > index e12617f5d69..e8c417c7c33 100644
>> > --- a/bsd-user/qemu.h
>> > +++ b/bsd-user/qemu.h
>> > @@ -223,7 +223,10 @@ void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
>> >  abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
>> >  int target_to_host_signal(int sig);
>> >  int host_to_target_signal(int sig);
>> > +void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
>> > +void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
>> >  void QEMU_NORETURN force_sig(int target_sig);
>> > +int qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t *right);
>> >
>> >  /* mmap.c */
>> >  int target_mprotect(abi_ulong start, abi_ulong len, int prot);
>> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
>> > index 93c3b3c5033..8dadc9a39a7 100644
>> > --- a/bsd-user/signal.c
>> > +++ b/bsd-user/signal.c
>> > @@ -32,6 +32,9 @@
>> >
>> >  static struct target_sigaction sigact_table[TARGET_NSIG];
>> >  static void host_signal_handler(int host_sig, siginfo_t *info, void *puc);
>> > +static void target_to_host_sigset_internal(sigset_t *d,
>> > +        const target_sigset_t *s);
>> > +
>> >
>> >  int host_to_target_signal(int sig)
>> >  {
>> > @@ -43,6 +46,44 @@ int target_to_host_signal(int sig)
>> >      return sig;
>> >  }
>> >
>> > +static inline void target_sigemptyset(target_sigset_t *set)
>> > +{
>> > +    memset(set, 0, sizeof(*set));
>> > +}
>> > +
>> > +#include <signal.h>
>>
>> Don't include system headers halfway through the file like this,
>> please : put the #include at the top of the file with the others.
>
>
> Yea, this isn't even needed, so I just removed it.
>
>>
>> > +
>> > +int
>> > +qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t *right)
>> > +{
>> > +    sigset_t work;
>> > +    int i;
>> > +
>> > +    sigemptyset(&work);
>> > +    for (i = 1; i < NSIG; ++i) {
>> > +        if (sigismember(left, i) || sigismember(right, i)) {
>> > +            sigaddset(&work, i);
>> > +        }
>> > +    }
>> > +
>> > +    *dest = work;
>> > +    return 0;
>> > +}
>>
>> FreeBSD's manpage says it has a native sigorset() --
>> https://www.freebsd.org/cgi/man.cgi?query=sigemptyset&sektion=3&apropos=0&manpath=freebsd
>> can you just use that ?
>
>
> Yes.
>

For some added context, I added sigorset() to libc after 11.3/12.1 in
response to bsd-user using it, then forgot to remove the transition
aide after they went EoL.

Thanks,

Kyle Evans

