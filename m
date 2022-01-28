Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0315549F77A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 11:39:41 +0100 (CET)
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDOfL-0007V8-Rs
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 05:39:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDOdA-0005mU-Ip
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:37:25 -0500
Received: from [2a00:1450:4864:20::42f] (port=37421
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDOd7-0001BJ-VT
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:37:23 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w11so10014988wra.4
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 02:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=84AYyjH2FP/xTg8VHAhvJDQVcdQRw691ZYINddeLNK0=;
 b=V0V/7y4b0uKsvuw3caJ5Dn0MtyMxjsBkTNxjsaszfJ+s/Hc+Q0tgMUYQ2A3Zmb4R7v
 7K9vSEByNzd1RmaaX73fF4/rIkOlHjBn/fp/OI6feAgy02Ovo5I51vb49ClIKKra1ISh
 sspySHxSPKBwF5CrEP40yOzQOuOH39yjUMF9erQWFOrENFarH1x8rqSiFIRNxfyx63ax
 v3DtfOK3tYfb7arNiWqobdux6VZYyHZQo2PghTwkTPubnFU7JGNEwbQ5aHG8zJ+ikaSD
 OP/Rhgwp+KgOariLPfPdczdpzeK0YygfvZf/4bcSF7uv9UGHxr2QxswhDDKwkuYroYAG
 REkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=84AYyjH2FP/xTg8VHAhvJDQVcdQRw691ZYINddeLNK0=;
 b=y0hvBIN7nP3Llr3Bf9FJex7hb66Wtvwpl1org5AQr/qr2vofG+j/2//cqHDBgeQkym
 BfPoQZU9yPk2b+3LwilogC6E1MD3i48RtNTGSxaJ265yeaO6FfJJ/wQG6WOTRgOTRIUE
 bRum6k5FfVX9YJRNTn8RJcBsvTTpJwMQfl05PKoDO7dRbVvYlvHXGiZkH5ENJJS0mLxO
 TnMKxjPcAC9gSX/Z5KtuackLgeDY+fKsuw4maUGkpTt8mvF0t6G8S9Iivi+KczfYCs+4
 ktvgzGsEJoQX9M5JylDgigjpDuNudsdKaXuTapSiOOUzNK4YSiMhSUHx85P1fpciGxCo
 lgrQ==
X-Gm-Message-State: AOAM531k3q1jQxzNYtvcbbaaG8t2foZQVGsIZdyWaxuq/IcXOj8QMvhp
 hiXHKi9RPOPnIz0kq48lg6Vx/kXPmYCJqN6NR4FsYA==
X-Google-Smtp-Source: ABdhPJxflE2O7rSHgv1x1NNZ67vSDm4eUryypICK+Q72+7h/GKkYgGcsMyyYSWN6X3JSn6H62s35puv7TMMpaPWpM/c=
X-Received: by 2002:a5d:438a:: with SMTP id i10mr6394931wrq.295.1643366233196; 
 Fri, 28 Jan 2022 02:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-37-imp@bsdimp.com>
 <B29CD011-011F-4BDB-81FD-84311EB562F9@bsdimp.com>
In-Reply-To: <B29CD011-011F-4BDB-81FD-84311EB562F9@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 10:37:02 +0000
Message-ID: <CAFEAcA_qp3f9hcJp3LvgaENb2vE+C-5+x-EeUUiyS39=YKUW9g@mail.gmail.com>
Subject: Re: [PATCH v2 36/40] bsd-user/signal.c: implement do_sigaction
To: Warner Losh <wlosh@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Stacey Son <sson@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "def@freebsd.org" <def@freebsd.org>,
 "jrtc27@freebsd.org" <jrtc27@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 22:46, Warner Losh <wlosh@bsdimp.com> wrote:
>
>
>
> > On Jan 24, 2022, at 6:29 PM, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Implement the meat of the sigaction(2) system call with do_sigaction an=
d
> > helper routiner block_signals (which is also used to implemement signal
> > masking so it's global).
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> >
> > Pending Comments from Peter Maydell <peter.maydell@linaro.org>
> >
> > (1) in block_signals, sigprocmast
> > For linux-user we rely on sigprocmask() in a multithreaded
> > program setting the signal mask for only the calling thread,
> > which isn't POSIX-mandated. (Arguably we should use
> > pthread_sigmask() instead, but we don't for basically
> > historical reasons since linux-user is host-OS-specific anyway.)
> > Does BSD have the same "this changes this thread's signal mask"
> > semantics for sigprocmask()?
>
> FreeBSD changes this on a per-thread basis for both
> sigprocmask and pthread_sigmask(). pthread_sigmask() just
> does some extra stuff with SIGCANCEL for pthread_cancel
> support which qemu doesn=E2=80=99t use. They are the same. I=E2=80=99m in=
clined
> to leave it as sigprocmask() since I=E2=80=99m unsure what the implicatio=
ns
> of doing funky things for SIGCANCEL would be.

Yes, that sounds like the right thing.

thanks
-- PMM

