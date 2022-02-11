Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB64B24BE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:50:43 +0100 (CET)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIURm-0007lh-1a
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:50:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIUNw-0006YR-PG
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:46:44 -0500
Received: from [2a00:1450:4864:20::436] (port=35613
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIUNu-0006ha-Ua
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:46:44 -0500
Received: by mail-wr1-x436.google.com with SMTP id v12so14838778wrv.2
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 03:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pXVF/K9MG6JL1SoM6N0T2+KUtZJs5xHfJcKWgGV+YV8=;
 b=VFOpP0lMDl5GxIxsId/+1N+c88Pc13kPLmDSsMK4965QQoATuEL2XSqwGUKnTFBZOd
 0rb4S4C4jf7SNOFOOPDaETgpPGKWN3eZIkyyZpooyf25g2Dh6sijyYB1YD15Z6PNkDV4
 1kNbKIkQckZAsPSqfGUc8+WTpcqypNK8FcgtjkgD3Q5CUF4O5C3HCTn8ZV4wwA3SAGp9
 SRBul+Nyl0zclIaX6RUx+h5ogSx45Ea9SSBWULBYpY3JkEsuJgzBHkL3m96qosQkyEzq
 DP+DjL2w5puNFaswxLxeqJ/0DSfrPI8cWz1P8vEI0M40Qr8ZYlWFnTBeq1P3bfKSM3gT
 LCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pXVF/K9MG6JL1SoM6N0T2+KUtZJs5xHfJcKWgGV+YV8=;
 b=Cx1Xfr0aB7sx0qN6qhCpS0YzGo2LJSqi+mfzBxoZQPjDJeXm43BMSHlGu61FPZSRyF
 HaXCFs8GicelHMaH8Tkvc9N6oNgx8ylMk7PmnYXEsHO/AP10gPyTxP6IBZy15pZ52rPD
 CsbFQHhPAh2QPf4mRPYagjwc/3gV/+8ul2AIj8PSu4c54ttxJhZrULwblDkgAfaHGd6R
 aaQhWt+Ld9OkQEcg88RXpZ7titBwa/ja3o0hMSqh9/NnxlGozPhFCmjgCqNCHRFHvUBQ
 gt/j4rLBQlwE2ZCoGrrdjzgMxwpmYHhSnp4zddGXw9GIZdiZuopo6ki6bP3rYS2UZSAm
 jdJQ==
X-Gm-Message-State: AOAM531RqvkxZ0VnknNcSIfRPaudlAjn/J8IIJtqTqBhjBiisPILfQo9
 bDvGBV3gUvb6Jw5hw4LT+JQUuoBx/qaid2C+sqglSQ==
X-Google-Smtp-Source: ABdhPJw6mhvzljC3anNXQF4hFHsRHe22hYSyLae4L+RkVjG6PEQG6zmfRACIxj21gzAqdyoGzQxxUmm1kYbplqb1vZ4=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr1078570wrv.319.1644580000602; 
 Fri, 11 Feb 2022 03:46:40 -0800 (PST)
MIME-Version: 1.0
References: <20220209112207.3368139-1-alex.bennee@linaro.org>
 <518fd6d9-4b74-d8ad-3e72-360c5ca899f6@linaro.org>
In-Reply-To: <518fd6d9-4b74-d8ad-3e72-360c5ca899f6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Feb 2022 11:46:29 +0000
Message-ID: <CAFEAcA950Z2i+qemSaiTJ-EhQNmWydUGAkof_7_tQWrk3z3GkA@mail.gmail.com>
Subject: Re: [RFC PATCH] linux-user: trap internal SIGABRT's
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Laurent Vivier <Laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 22:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/9/22 22:22, Alex Benn=C3=A9e wrote:
> > linux-user wants to trap all signals in case they are related to the
> > guest. This however results in less than helpful core dumps when the
> > error is internal to QEMU. We can detect when an assert failure is in
> > progress by examining __glib_assert_msg and fall through to
> > cpu_abort() which will pretty print something before restoring the
> > default SIGABRT behaviour and dumping core.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >   linux-user/signal.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/linux-user/signal.c b/linux-user/signal.c
> > index 32854bb375..8ecc1215f7 100644
> > --- a/linux-user/signal.c
> > +++ b/linux-user/signal.c
> > @@ -809,6 +809,8 @@ static inline void rewind_if_in_safe_syscall(void *=
puc)
> >       }
> >   }
> >
> > +GLIB_VAR char *__glib_assert_msg;
> > +
> >   static void host_signal_handler(int host_sig, siginfo_t *info, void *=
puc)
> >   {
> >       CPUArchState *env =3D thread_cpu->env_ptr;
> > @@ -821,6 +823,10 @@ static void host_signal_handler(int host_sig, sigi=
nfo_t *info, void *puc)
> >       uintptr_t pc =3D 0;
> >       bool sync_sig =3D false;
> >
> > +    if (__glib_assert_msg) {
> > +        cpu_abort(cpu, "internal QEMU error, aborting...");
> > +    }
>
> I think we should not be trapping SIGABRT.  I think we can preserve all g=
uest behaviour
> wrt SIGABRT by stealing another SIGRTMIN value, and remapping the guest s=
ignal number.  We
> can produce the correct result for the system by mapping it back to host =
SIGABRT in
> core_dump_and_abort().

Stealing signal values is awkward, because you don't know what the guest
(either application or libc) might be trying to do with them. I think
we should prefer not to steal them, especially in this case where the
only reason for taking a signal value for our own use is to deal with
a "should never happen anyway" case. We've already had a few bugs/awkwardne=
sses
with the current level of signal stealing/rearranging we have to do.

thanks
-- PMM

