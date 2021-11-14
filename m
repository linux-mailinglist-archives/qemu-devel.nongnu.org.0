Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E505344F9BE
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 18:18:13 +0100 (CET)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmJ8u-0002oN-LE
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 12:18:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmJ7m-0001jb-SQ
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 12:17:03 -0500
Received: from [2a00:1450:4864:20::334] (port=54843
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmJ7j-0007L6-20
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 12:17:02 -0500
Received: by mail-wm1-x334.google.com with SMTP id i12so11077283wmq.4
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 09:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H0odeAoTZvkvjMmwm76MF7avihyBGqhH209sxkd5DnQ=;
 b=xgTvJHYPz8NcBGOBj7GB1eKc8A3/0UK3qZKbFKcKdCOI1TPVYDv1XM1Q6xK9vwhgKE
 ao/qV6B898+6iM+eNlxNdO6rfAwzHFSeNyjj8948NnZsb15Fvlk+dqlgEEL63wAbEuZ5
 xXLBFSxR4RJSva9zvWwCZtkhEye/F3z0CMHFCTK250IQ5WhUTkyKR5hgiA3WIeb6DoRp
 o9mWY2IOrdB7EJr7iE2DkR32km2CXK6WHG0qLezJ9OuRh17ZSagWenpu1MSf7udV4w+K
 2yppWz6pWBsPk5lTRPFFTpLyYKmKN/lKN8Dn4GOCg0x4BLds/zBEMxSFwEq5rx5NJKDP
 aeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H0odeAoTZvkvjMmwm76MF7avihyBGqhH209sxkd5DnQ=;
 b=t+yCJahyftW6a4vmt5Wdwh4aXS3V3KvxEqGfFkobOkFGTbvOY92niKD2cS9bZrCyUH
 Nrr9rszrlZHyvHswXfHj9NeCWdtXEmt/OPkdM2XXf1Z+yoCD0kQCYI899+Ow3wg01HqM
 0FD9wqj9VOhRw/MuedYpWiR3M7TTcdfYkfD6pJJYPWQA0bxoLWPu9Cg3INMyX9OEOeR6
 brU1ies5QrB393/0hxO9GRJz1BqOMq4/UVbXUn+By/V8bpo8TjsFwReJCY2nqgmUx3eZ
 EcwpSt5iQeTW+RK6WhCMZG1Sq7JryrV+oNmOyl4NxEkcCAfM1F7R1hmuJoE770eKkGAo
 dw2w==
X-Gm-Message-State: AOAM5307GTsYyKuhzG4DtnT0KMI9MA9lWFIe2vBu65uHBcX+tWGomzID
 NYoElsFbiHdkAys5i/kHNppLSdttc/Xv6xA/beM1IA==
X-Google-Smtp-Source: ABdhPJxmomajBEHsw65wc2nktD4yWHQ5JtTXjaDrnvVyxRFmF5R3HrPRIK1Zc5wo/0bK6yHJSOAy946b+/jx5qx+KCU=
X-Received: by 2002:a1c:e906:: with SMTP id q6mr52994082wmc.126.1636910206819; 
 Sun, 14 Nov 2021 09:16:46 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
 <87r1bxzl5c.fsf@dusky.pond.sub.org>
 <e7ec3afc-6db9-822e-5a5e-dee7c4db8f34@redhat.com>
 <87pmr5cxbt.fsf@dusky.pond.sub.org>
In-Reply-To: <87pmr5cxbt.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Nov 2021 17:16:35 +0000
Message-ID: <CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com>
Subject: Re: does drive_get_next(IF_NONE) make sense?
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Hao Wu <wuhaotsh@google.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Nov 2021 at 13:34, Markus Armbruster <armbru@redhat.com> wrote:
>
> Thomas Huth <thuth@redhat.com> writes:
>
> > On 03/11/2021 09.41, Markus Armbruster wrote:
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>
> >>> Does it make sense for a device/board to do drive_get_next(IF_NONE) ?
> >> Short answer: hell, no!  ;)
> >
> > Would it make sense to add an "assert(type != IF_NONE)" to drive_get()
> > to avoid such mistakes in the future?
>
> Worth a try.

You need to fix the sifive_u_otp device first :-)

-- PMM

