Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7883D308BA5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:40:04 +0100 (CET)
Received: from localhost ([::1]:33462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XkZ-0006Rc-Gt
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5XTx-0006cK-74
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:22:53 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5XTp-0003Jn-9x
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:22:52 -0500
Received: by mail-ej1-x62c.google.com with SMTP id a10so14120033ejg.10
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 09:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AJWB+awo7OwGTd/Ncmee9yEoJNZcviaJcPsGFvWnHqM=;
 b=iWksQVAN8KS81rlZznU9UGY4H+goUP4VY7dERR/Am5FG0HQ1K6geo4oDdn/Lkuznqc
 yUmsO2gEBlCeLWy2uwgAca3pQPgDP8ro7GP8xS7JFN/Srju31nU0Rahbrga5GX7fVnPl
 tFkQIgty/yotODYjRHK6td3FgLnh3BPfgbpnwm1iOy31xRGi1Q5JwlFZ+h5T0sK7c2PV
 QOvkPHsU22f7y6YYB+ichXqXu71cOjw3oAevf4gopnCjW3a7KpgQa2Kb0BdwTgZCSuuv
 egHhp7cPwKAXl/Fr9lchXbtvBXJRJTtJPf9nD/8lc2/BC9U8RUUJ7DEL0oIuyaupmnuY
 IO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJWB+awo7OwGTd/Ncmee9yEoJNZcviaJcPsGFvWnHqM=;
 b=feouN75gyhXThChObCtlWCnUiDHH7nmQK4a9cMufagVSxiKc4oCkeFg5UG6pqYg2VZ
 VlwF31hw+7RATLKn8E7A9RyZVcHuCBD/tr4jPSmIubwcVS4u4Vysd31HUDn1KVedkxH/
 FCgA7VEfltPX/Uy5pKGhu8itdxYJ4E1YKv7jEHL4+GUWU32i0GG/mzWEmmPfFE4DUfhr
 ZdFTptXyasZH+U+DjxpMGHiAfalHIA+sK/gYoddP0OodBMG3bL8Hu/HbaZlMCINJaJtO
 IilJWQQsrX4kSielx88+JRl1nsNdrpS/8/0HXX4f8ZhAAtg1fHAoVU+XJEw7kgDH7ZLq
 5Lnw==
X-Gm-Message-State: AOAM530Sg2Ymx7h8CSQFrxIIbvYUJl5Zhbmuj9pLg4QmXSWpqtJrRQi8
 Tbcp1YcEqiP5/NfJlixu8puMp51/oNHjM5bEA3F3FQ==
X-Google-Smtp-Source: ABdhPJw02dm4LjyMtRA9GMKfVoSdhorAg2/r2Sd0DIVM8AcQXUuiC87jwHebfk/L4hvIj56ydREGvpP03xAJly2FF/I=
X-Received: by 2002:a17:906:4002:: with SMTP id
 v2mr5702984ejj.85.1611940963253; 
 Fri, 29 Jan 2021 09:22:43 -0800 (PST)
MIME-Version: 1.0
References: <20210129145240.34104-1-kwolf@redhat.com>
 <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
In-Reply-To: <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 17:22:32 +0000
Message-ID: <CAFEAcA9otR2QS7EvH6vjJb+sePyiQ2jpO8bGkL12sG6Vt_Gm5A@mail.gmail.com>
Subject: Re: [PULL 0/2] block: Fix iotests to respect configured Python binary
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 16:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 29 Jan 2021 at 14:52, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > The following changes since commit 5101d00d2f1138a73344dc4833587f76d7a5fa5c:
> >
> >   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-01-29 10:10:43 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> >
> > for you to fetch changes up to 4cea90be62f4f15a63e1a8f7d5d0958f79fdf290:
> >
> >   tests/Makefile.include: export PYTHON for check-block.sh (2021-01-29 12:32:36 +0100)
> >
> > ----------------------------------------------------------------
> > Block layer patches:
> >
> > - Fix iotests to respect configured Python binary
> >
> > ----------------------------------------------------------------
>
> This is definitely better so I'm going to apply it, but it seems
> to reveal a pile of iotest failures on FreeBSD:

These seem to be intermittent -- a rerun was fine. (I have a theory
that the test framework handles "QEMU process died due to the VM
running out of memory" and similar kinds of error very badly:
I semi-regularly find that when the OpenBSD, FreeBSD and NetBSD
VM jobs are running in parallel on the same machine that one
might fail but succeed on a rerun.)

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

