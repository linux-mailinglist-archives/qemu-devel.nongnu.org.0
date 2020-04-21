Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B7D1B2465
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 12:52:30 +0200 (CEST)
Received: from localhost ([::1]:55646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQqVx-0003fP-C7
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 06:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQqUz-0002we-Rm
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 06:51:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQqUy-0006Q7-PW
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 06:51:29 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:38823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQqUy-0006OC-89
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 06:51:28 -0400
Received: by mail-oi1-x22c.google.com with SMTP id r66so11641045oie.5
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 03:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LzNZgF35O0zeqst9HHOxTxJyyfoJdkWppbu5OJDoCOY=;
 b=UUkHGLBldTzX/285XKVxSOKDntZfl5Mk7cWmnuwL2UNAIM/hDnNaBHOkzE3WhSagit
 xbJTPcLQvx1PbPjuUs6DSQdYd3AMF0X/97uu9B4N/gROElYauNhPACmOWDKeawPHkkow
 yQYAyGKACfUeQxW2Uzfx3q/bTuBw9gl7Y4cR6sFd71ExAB18NStW4q+DdO2hkBhmnjN0
 xMNqFhXEs6J8p1VKeiPzS26YW8gGJ0w00MPbQMjlcSn6sTqz/+PbMnZ+9rP281Q7I2yF
 uPsZIb8giZysTirbCQzSZiobp+ZsuSoFAok46ARuDKqXC/xot9QftOUySI8JNtdfbXgh
 knLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LzNZgF35O0zeqst9HHOxTxJyyfoJdkWppbu5OJDoCOY=;
 b=dKxiF8zXZG7MCwkP3K9rLZVAxVHjNcsEC3gpz8GnUSjrQgQB+Z6gAhDBIdAd0Lsyom
 UGJF90MPSP+gJC6qiV4qrgAZizAbk2vm9nagU349tLY+F1fakYMgXBZkndgVpAUZsc7m
 8vJoNlvxPd6NB+7DW9O60skThdgtUOsjdrY21tvEz2fHTuPE0YRs1wcZ0AZfN3BqiCzi
 LPxdlW8e7sOfuce75v5/J6J3dnd7svKYFk54YgZQ6OAbgH9QFBklIy/x4yCav99Rp5HZ
 k2ltik/s0RtwaH1IIA04NWGBLjU99H8atjENDMimZHUGCjaYw4xRH/WZx5GEA8sJFP5D
 aFoA==
X-Gm-Message-State: AGi0PuYk9unHxtIOYNES90fm/GP8z+y/MgkrkGsuULxjenSsd/tpTmD8
 RiFKOfzwZwBEKjzxoifM4Ka6oiE6aMz30KLkE60vdA==
X-Google-Smtp-Source: APiQypK+uA/yakW4WVMtzFbOOIuAkG5fkuqnelsf1fyORkjIICdHl7qJwwIGXzCck1OkQf8zBLpVMgonYIH11b2zXIY=
X-Received: by 2002:aca:3a8a:: with SMTP id h132mr2549856oia.146.1587466285979; 
 Tue, 21 Apr 2020 03:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAP+75-UisNwFqedDPfuGt=HFEEnPSO7sNq9JxpUuLPVdYDryuw@mail.gmail.com>
 <CAJ+F1C+YnbgCkYN1+7zpq0XvZYb2LWL6kbQXRSybJew1JnBgQQ@mail.gmail.com>
In-Reply-To: <CAJ+F1C+YnbgCkYN1+7zpq0XvZYb2LWL6kbQXRSybJew1JnBgQQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Apr 2020 11:51:14 +0100
Message-ID: <CAFEAcA81NT6yKndgE_5HqmQYR4OMpkZsLris-bS+Ojw2qoruCA@mail.gmail.com>
Subject: Re: SLiRP: use-afte-free in ip_reass() [CVE-2020-1983]
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x22c.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::22c
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Apr 2020 at 11:22, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Apr 21, 2020 at 11:18 AM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
> >
> > Hi Samuel and Marc-Andr=C3=A9,
> >
> > Peter is going to tag 5.0-rc4 (final before release) today.
> > Do you have plans to send a last minute pull-request to fix CVE-2020-19=
83?
> >
> > https://gitlab.freedesktop.org/slirp/libslirp/-/commit/9ac0371bb
>
> libslirp is not following qemu release schedule.

From the upstream QEMU perspective, this seems to be a bit
of a pain point resulting from the separation of slirp out
into its own module. I do not like being blindsided by
random "oh hey there's a CVE fix but it's in some other
git repository and it's mixed in with a bunch of other
non-critical fixes" news on the day of releasing the
final release candidate :-(

While slirp remains a submodule that is the usual way
that QEMU is built, it would be really helpful if you could
ensure that the submodule works on a release schedule that
works with QEMU rather than against it...

thanks
-- PMM

