Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897C137FDEE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 21:14:25 +0200 (CEST)
Received: from localhost ([::1]:34338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhGmu-0003ce-Ly
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 15:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhGlP-0002iY-Q1
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:12:52 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhGlM-0006sL-MV
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:12:51 -0400
Received: by mail-ej1-x633.google.com with SMTP id u21so41306323ejo.13
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qih8cY0/5K7BkszrcRcC3R2MT9DYvphAiqANgo3Jvtw=;
 b=fijzUPwz2UtENsxrAlOYasjEcalYZ19o82Qmeh0svOKYemLi1oLA+fmK+J0Y1YHS0H
 UIyvrUPb0o0bHRBARasu08rUGeTCjzFuXoAklfrahTilNR+NQfwBpeP1CoOK6zAg0cSC
 HzBWTNYJwvEKI6erSMD1raQncZ2x7zXXJU3DzPDLisihfyCl7qTt9gCm8HAWo8SNdnrP
 ukou0x0sTt9Dutg3260AKbww8gDUlxByAPSwcHkzNqEWFujxJUfW3nd+VE9Kdg6CFtuI
 ToMp1FlmVq4wESp6q8e51uXxybbRY3b2Y9VkplI6jT6XxKHzvgcPtOPo47NfCsYuQfai
 l1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qih8cY0/5K7BkszrcRcC3R2MT9DYvphAiqANgo3Jvtw=;
 b=d+W2+N1K++HgCReVBgx0uS+FG2pOQ/+Ad/Uq9UkPgbd0Nb1V1QhDczA2Uh7lzVi1JV
 i6Mu3YA/88cc324rpb95xEKz/jDLnKwCfdry6vkINfq+jeFV4D8xZ37Z1/rNO4KXYyru
 nEuSPqhbGGCJKlVA3NwCNxPjegFkhwsEyT4JHw5xD/a6aWOLEJ0Ud3yaWjEFzCnQib2J
 jFfSrljwnoWn2jAurxukASTChMmIxHK22ojUeL//Q8XRXRe10j+XraIQ0bM56DVvIY6k
 fJoA8Jp8P6j4o+AxbXRnXKITV3VBZJMqbzI5wFFHguwP0zqSIsKcLWYOcdAh4gvFmgLk
 FF9g==
X-Gm-Message-State: AOAM533laR4t7efvyhCH3ofxTJ4Rvw6CH6iD9CE63zKs3rvF3HpLTy0H
 7ff0jXsTBzbCf4RHvM0L4UP8wymlbMTHoM8GHgiouQ==
X-Google-Smtp-Source: ABdhPJyp4e2xzxXgD5kq+le8NCdQOHCSo8RZqA1sDCG7Hhua18WIdkLBAGsoVR3HYlg1ti/iaURmpWDgqp1jgRADAYk=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr630524ejb.482.1620933166790; 
 Thu, 13 May 2021 12:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210512084020.606871-1-pbonzini@redhat.com>
In-Reply-To: <20210512084020.606871-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:12:35 +0100
Message-ID: <CAFEAcA_EkFT2UCgGsgHYrFNZNn0S42aWOzw1DC+9OEzuerFvTw@mail.gmail.com>
Subject: Re: [PULL v2 00/32] Misc (mostly i386) patches for 2021-05-11
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 at 09:43, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit e58c7a3bba3076890592f02d2b0e596bf191b5=
c2:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
10510-1' into staging (2021-05-10 17:28:11 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to e804f892b90e58861edd79aafa4d1f4dbdeb3819:
>
>   coverity-scan: list components, move model to scripts/coverity-scan (20=
21-05-12 04:06:50 -0400)
>
> ----------------------------------------------------------------
> * AccelCPUClass and sysemu/user split for i386 (Claudio)
> * i386 page walk unification
> * Fix detection of gdbus-codegen
> * Misc refactoring
>
> ----------------------------------------------------------------
> v1->v2: dropped incorrect snapshot-load patch

Something weird has happened here.

I think I applied v1 of this pullreq (merge commit 31589644ba069ba06c5
now in master), and then when I came along to try to process this
one the tag was an entirely different set of commits.

Can you check whether what is in master is what you intended, and
send a revert/fixup patch if necessary, please?

PS: my scripts detected this issue:

    Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@redhat.com>
    Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@redhat.com>
ERROR: pull request includes tag with UTF-8 error in person name

which you probably want to fix before you send a future pullreq
with those commits in. (This error is what nudged me into looking
more closely and realizing something weird was going on...)

Side note: it is more robust if you don't reuse pullreq tag names...

thanks
-- PMM

