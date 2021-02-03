Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E4630D7FA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:54:03 +0100 (CET)
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FnO-00050H-KV
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7Fmc-0004Vu-AR
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:53:14 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7Fma-0002xq-Gq
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:53:14 -0500
Received: by mail-ej1-x62c.google.com with SMTP id sa23so18637666ejb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 02:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RZRUhogWzsEZ5Tk8956jY9Z3mL04C9+6EnBRSKg4hb8=;
 b=ILozTcJT63j6Ebse/4ovbmwc57MdZechSiVT/gB2z4X3TBwVRbHU3f41kWWAzrsl1W
 IO2dnIAs6MtiYl/FyeL9fmvhMv6Z7OQp6EusCOYAkO9qbSvmX7N5wP91khEfy9V88j6h
 iFMDXvSCoPl6qVxsklgvbUnacRqAENS42onBYdw4UBr6ixgZw0P5OXqFVCl9S8gMFpY6
 DyRwgFkrBZkQUJp0obM8KYVkP05U3ATBzfIb4XgCu8Cw9thRRfr+Sr96Jm7g6BcHqWd0
 eNsQALChZPLohIAV8FYXzxbbvVPsMzitHGX2r8BFFivwXFaWPCt5t4rs/ZdHQyCm2FbC
 LkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RZRUhogWzsEZ5Tk8956jY9Z3mL04C9+6EnBRSKg4hb8=;
 b=NDsdrZtIUuKFl2VGGpD4lODOBR550SKo6gctEzFILzUGQC/cUowBE6fmhR5fnXVU8S
 tZoOCSzH0VUEUVmetSiNgoPW4p8mH8q55KMSthWDWiIxrqRrZh1eUPTTbo3JmoIeneSr
 A+R3eHpODSCGBXBo4jASLBXJvH7cUHyjnszMh5jme7T5cY6XMZ4NP1NVaGLTM6GDo76I
 +V6BHz/oGg8HPSzw3hrmFB2DOgHprFtYtavLnTIj9cjx6b8DVbmVyNl3FgAkFdncD4us
 BWAn3Ib9K9GFhW0QRYoVRtEV2MHW1KfycHL6r4qkJ20JmiyXbGmgNczL+MqlJLTVM0++
 DiZA==
X-Gm-Message-State: AOAM530lscRTxzM74pDEFvafzSAt8XCy2djmK1QBGv36Y1DsQuK6N3kY
 DCnrZOoAJ7nA5DKJ6CtXGhk7rbGMqxobU7gV5kU5jQ==
X-Google-Smtp-Source: ABdhPJy6fBX+upd+aD2Bfcv9kA2eVw/Fnvvl9379tV4dO8Oc7aRphTWzxBgCkSVW/lo2aohBgXaYANl8ruw/jyFS52c=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr2574334eji.407.1612349590889; 
 Wed, 03 Feb 2021 02:53:10 -0800 (PST)
MIME-Version: 1.0
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
 <20210203102758.GC2950@work-vm>
 <CAFEAcA9_mcXHd5m+Z2M1jvk58kGVEcYKF+0kVsLJTjwB9MZcfw@mail.gmail.com>
 <20210203104920.GE2950@work-vm>
In-Reply-To: <20210203104920.GE2950@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 10:52:59 +0000
Message-ID: <CAFEAcA9DdiBA+-5cQ87NR6fHFFFJAtDVbAEc+AJQNMNo4bVB+A@mail.gmail.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 at 10:49, Dr. David Alan Gilbert <dgilbert@redhat.com> w=
rote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Wed, 3 Feb 2021 at 10:28, Dr. David Alan Gilbert <dgilbert@redhat.co=
m> wrote:
> > >
> > > * Philippe Mathieu-Daud=C3=A9 (philmd@redhat.com) wrote:
> > > > Cc'ing migration team and qemu-arm@ list.
> > >
> > > I'll have to leave the detail of that to the ARM peole; but from a
> > > migration point of view I think we do want the 64 bit ARM migrations =
to
> > > be stable now.  Please tie incompatible changes to machine types.
> >
> > That is the intention, but because there's no upstream testing
> > of migration compat, we never notice if we get it wrong.
> > What is x86 doing to keep cross-version migration working ?
>
> I know there used to be some of our team running Avocado tests for
> compatibility regularly, I'm not sure of the current status.
> It's something we also do regularly around when we do downstream
> releases, so we tend to catch them then, although even on x86 that
> often turns out to be a bit late.

So downstream testing only? I think that unless we either (a) start
doing migration-compat testing consistently upstream or (b) RedHat or
some other downstream start testing and reporting compat issues
to us for aarch64 as they do for x86-64, in practice we're just
not going to have working migration compat despite our best
intentions. (None of the issues Aaron raises were deliberate
compat breaks -- they're all "we made a change we didn't think
affected migration but it turns out that it does".)

thanks
-- PMM

