Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8793953FA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 04:46:28 +0200 (CEST)
Received: from localhost ([::1]:58042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnXwh-0001JT-Go
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 22:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnXvf-0000aW-KY
 for qemu-devel@nongnu.org; Sun, 30 May 2021 22:45:23 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnXvb-00089l-UA
 for qemu-devel@nongnu.org; Sun, 30 May 2021 22:45:23 -0400
Received: by mail-pg1-x532.google.com with SMTP id q15so7238139pgg.12
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 19:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kYDjop2Q8s/vp7Ihzf0icChQU1L7hEV0pDG5TQ0MNCI=;
 b=eAys3XQKWwmWvw41Jc5FY7M7C6fCQWibWyk13xJesw4kI543/XlF1Nd7GCu/ASPxTz
 4pZLr1epqx56y2QiU+sMb++hqKBKJ5qV0/2ddiZD0S93I3s/bc9X8AYyTinVHDlnNn4E
 PZV31GNtsRpVxezwTHoOqhC2F+wcguz8kJIOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kYDjop2Q8s/vp7Ihzf0icChQU1L7hEV0pDG5TQ0MNCI=;
 b=EbIyvvUyTV42/RdN+nUgubtrmJl3f72e0s0e9lFwmF6IsukvjmzjBLopSWxlglJMJh
 fN1XQ45gOKUfGm6/wB5nyXvdM7xil2ZbdDx1w/5KLhU5buqiLFf3ScDex0LyR0DayBkv
 ng9ntTNAyPH45gPRkTbcjfI9c8hVmgtEhvoUwWOkJVLw/BPZAqr6904J4mfGscJck32x
 I/isCEnnmlC+zGKGP0UJUiy6QtUhUCepZ+izD1q/VwIqAxbq34Y0ssMjVjmMCcLcgDR9
 9fH6fbBvCjDOvETJzU/PiFRXYNSgjTtT2JUb0enibZ+xAlpRNsXeOygiw0FfIZnbcdz2
 loWA==
X-Gm-Message-State: AOAM530TihbCmYTH5rzdhom/hwMoqMfmT0ZxMZLfu3ObM4EGr2s9JP6l
 +Fft8YIXF7TQvBPCy4fengZeYu5hugBHG8sGD10ZBw==
X-Google-Smtp-Source: ABdhPJyEV0N3IHpx7/2Tb1AIRW4PZCoZ3tuPal0ypnwyrl2+knSoxG9PGqqQqqNa3o1DJ/HLcwyoqP6jS2N2ggPvDTs=
X-Received: by 2002:a65:624e:: with SMTP id q14mr20349332pgv.103.1622429117573; 
 Sun, 30 May 2021 19:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210524045412.15152-1-yamamoto@midokura.com>
 <87cztg3tv0.fsf@linaro.org>
 <CAH=wFzQjYJHN3xH1QhyxzZNDXGjQDw5UxhwH2NEiQoYjWcqh-g@mail.gmail.com>
 <CAH=wFzR3=Q1ukE-5Wp1jQ47n0p2Y6wwv8vFVtycTJZYdajtctA@mail.gmail.com>
 <87y2c01f7j.fsf@linaro.org>
In-Reply-To: <87y2c01f7j.fsf@linaro.org>
From: Takashi Yamamoto <yamamoto@midokura.com>
Date: Mon, 31 May 2021 11:45:06 +0900
Message-ID: <CAH=wFzSuyi7NcD==W6_FUX9ceoByv69_3QPLSR6J+zKbVBnW-Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] linux-user changes to run docker
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=yamamoto@midokura.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 27, 2021 at 10:25 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>
> Takashi Yamamoto <yamamoto@midokura.com> writes:
>
> > On Tue, May 25, 2021 at 8:22 AM Takashi Yamamoto <yamamoto@midokura.com=
> wrote:
> >>
> >> On Tue, May 25, 2021 at 2:49 AM Alex Benn=C3=A9e <alex.bennee@linaro.o=
rg> wrote:
> >> >
> >> >
> >> > YAMAMOTO Takashi <yamamoto@midokura.com> writes:
> >> >
> >> > > These patches, along with a few more hacks [1] I didn't include
> >> > > in this patchset, allowed me to run arm64 and armv7 version of
> >> > > dind image on amd64.
> >> > >
> >> > > [1] https://github.com/yamt/qemu/tree/linux-user-for-docker
> >> >
> >> > Might be worth posting those patches next time (even if they have a =
RFC
> >> > or !MERGE in the title for now).
> >>
> >> ok.
> >
> > while RFC is mentioned in eg. git format-patch --help,
> > i couldn't find what !MERGE is.
> > can you provide a reference?
>
> It's usually just an annotation to the subject line of the commit, e.g:
>
>   foo/bar: hacky fix to frobulator (!MERGE)
>
>   rest of commit message
>
> or something like:
>
>   baz/quack: invert the tachyon beam (WIP)
>
>   reason for the fix.
>
>   [AJB: still WIP as this breaks foo]
>
> AFAIK the only subject lines supported by the tooling are the squash:
> and fixup: prefixes.
>
> > is there a nice way to express that some patches in a post are meant
> > for application and the others are RFC?
>
> Aside from a description in the cover letter not really. The main reason
> to include patches that aren't ready for merging is to show where your
> work is going so the full context of earlier changes can be seen. Having
> an ALL CAPS tag in the subject line is just handy for the maintainer
> when scanning what might get cherry picked. Obviously if a patch totally
> breaks the build it's not worth including as it just makes review harder
> when giving the patches a spin so you should exercise your judgement.

ok. thank you for the explanation.

>
> --
> Alex Benn=C3=A9e

