Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18532C53E7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:24:29 +0100 (CET)
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGK4-0004Vp-WB
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG9K-00058d-S7
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:13:24 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:35817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG9I-00045W-Mw
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:13:22 -0500
Received: by mail-ej1-x642.google.com with SMTP id f23so2644151ejk.2
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HfiQRBqqpZa6r4B3YqYWxqMLzBYtP43NHLHfGk1zREg=;
 b=l+BNsMce2RLMcohiU2/k5ikG1ebrC+crh0sDWgjouyy7nwazLbNjYIl+1qpVbFD2gJ
 8TiZQfJl6VkX8+OpbOmbS5b2tigdMobC6GphbsTeaQXbLZNOF9Cn2TiYsK0WqYVnUb1Y
 pYWkj9ohJg+Zvo1GkcvY2lghEQEcYlT897c5XSOGGbl24K9e7gZqgtD0RfeaJOAGqXqc
 m8i++/HrkZnrqKyzGvgg3li95IJMcDrMQF27RG8r5RXX/mnhzYUGDvwj2/Qty4kHlgSs
 6oEO71BiCr/BAeUwLFG6UbcgrRYK1YeFFzmogc+U+cV3Tz0gXH0C/ItzpuJTe9mTgR3B
 CgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HfiQRBqqpZa6r4B3YqYWxqMLzBYtP43NHLHfGk1zREg=;
 b=FzCiig9rA/qJMvW+Cri0ZsGL6ukswAmGAMIc4vuEQXZHG6QBe3CLHahJdYCNtcwicT
 uWKCuTUuM3sjHkFow9n6F10fGEf8K412okQFX4KGDh61WTI/CaU8zzRAIskK1AUECmz3
 3DYKGjCiF+PGdrkNLL7tpuQHrBZJWlCyjnImH0Pq4yUmOzwVFndoLK9gIVmNz71CzCKg
 Q2g4LfLH9GJ1dUHny5pynmjY86NmLXdQq3PXQ5SlK7VnTJdjz9pPvK274YkGmalnBPwt
 VmUvqRjyXmzUt+QNxHRGgwAvmLpJyaNEPcnSh7wkLhwZXSm/ZQ0aje4XAmzQyxZtunkG
 XkCA==
X-Gm-Message-State: AOAM533INUdl0b2Lpg1C9roGogF9ZdguRWQ3L+Xa2QRmXN8eYY0u8xZD
 ReZUMsLjmqRMPkheQvXYnucHKv1y9BggpglS2eO80A==
X-Google-Smtp-Source: ABdhPJxN5aS0lS74NgJYCQbyUBGKRHprzO0BijTPKknbpWygbNPNuUEpjCWqnqUKrCKGq/RhKkuJ6tVE7UfKlpE/xZE=
X-Received: by 2002:a17:906:2741:: with SMTP id
 a1mr2367132ejd.85.1606392799107; 
 Thu, 26 Nov 2020 04:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-3-marcandre.lureau@redhat.com>
 <CAFEAcA8QY_rt_JXy+O-3nOJUvbeAz7QMfXU3uDm78JigNvogiA@mail.gmail.com>
 <20201126120624.GE1122957@redhat.com>
In-Reply-To: <20201126120624.GE1122957@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 12:13:08 +0000
Message-ID: <CAFEAcA-uE7-NjWQLHz2QWznjOhRExuTKWH-J9vz6=kQ4fvwdKA@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] qemu/atomic: Drop special case for unsupported
 compiler
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 12:06, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Nov 26, 2020 at 11:49:28AM +0000, Peter Maydell wrote:
> > On Thu, 26 Nov 2020 at 11:29, <marcandre.lureau@redhat.com> wrote:
> > >
> > > From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > >
> > > Since commit efc6c070aca ("configure: Add a test for the
> > > minimum compiler version") the minimum compiler version
> > > required for GCC is 4.8, which has the GCC BZ#36793 bug fixed.
> > >
> > > We can safely remove the special case introduced in commit
> > > a281ebc11a6 ("virtio: add missing mb() on notification").
> > >
> > > With clang 3.8 (xenial amd64) __ATOMIC_RELAXED is defined, so the chu=
nk
> > > to remove (which is x86-specific), isn't reached.
> >
> > The minimum clang version enforced by configure is 3.4, not 3.8.
> > (Or Apple XCode clang 5.1 -- they use a different versioning scheme!)
>
> We picked clang 3.4 based on fact that is what ships in EPEL7, and
> Debian Jessie 3.5.  We then picked the XCode version to match.
>
> Based on our platform support matrix we no longer support Debian
> Jessie, and IMHO we also don't really need to consider 3rd party
> add-on repos shipping non-default toolschains. So IMHO we could
> entirely ignore clang in EPEL7 when picking min versions.
>
> IOW, we are likely justified in picking a new clang version if
> someone wants to research what is a suitable min version across
> our intended supported distros.

Sure, but if we do that then the series should start with the
"bump the minimum clang version" patch with accompanying
justification.

thanks
-- PMM

