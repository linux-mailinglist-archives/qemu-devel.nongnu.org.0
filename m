Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F04C1AD028
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 21:09:40 +0200 (CEST)
Received: from localhost ([::1]:38258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP9tL-0002a6-3D
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 15:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP9s8-0001qL-BZ
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:08:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP9s6-0007Bn-Uj
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:08:23 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44971)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP9s6-0007Af-Pr
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 15:08:22 -0400
Received: by mail-oi1-x242.google.com with SMTP id o25so17472905oic.11
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 12:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O7E5lopwEEnVzllCsUbcW5YIdmLAhrF0JdZcqrZJSQg=;
 b=eUhNSTRgUONW1KU95uEO2ZfHJJCKmrvzR0kmK6/KEavnHZw1kyxTD+wQsKKDOst0Kd
 KIHUXNtdNJlooloCVAQ2cYVZdA8J+LRaIhD/+Qml5pdv7fCpUNIMi8qp1aZuCWunBK/u
 j++2rKDAIP0iSNaI1dToL1VhsDm7BVSxw9h/KF+QoqZVZVmufPKl6QPCGqbBCrt5rj07
 5asN8IHoVjrWym+ffqtNiJ5osh3aYG7WvbWZBQlqvacI/Gn+lN2jBLYQzqDBv27X+/K2
 N5PQ3QfHs2yxT8PKPnxIDXOvlbgX1icwWQMG7HZx1VPGm+EezTp6WCMICgldL33xHxow
 5Efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O7E5lopwEEnVzllCsUbcW5YIdmLAhrF0JdZcqrZJSQg=;
 b=Y+zIsfCeqdb+nZTX1xGwASTY58RcKtUln/cnvqRJVXjM6I9+hLAPVR4OLtU0x872QE
 Px9VBGxfPD+Vkx2JuyA0OVAW5nLjCWCNpsZuWDnJBgLIX64R4w/aJkidwISLMT4PexKS
 cr8AJ1iNHqyPdzuvvGJmwEnEcM/sOlF5qkGVrIljKjQ3kZGUH8xRkMqrfmV2EORnUK2G
 76WyQhaDuUMcf8HMCf1nyQ91ljjzLAYrpwBgaoD0O6Etrk1BgxiTR79akga/ndR8x9Gg
 8DuZjYp2sflX+mcSXx0q31IKxhmf0iyLJSjpRSyPdKQcgmAzL6aV5mzfFLWHIbHigqLq
 fA8Q==
X-Gm-Message-State: AGi0Pub4n0ktD9V0KmjOGBsRKdiLkJbDPWRgM+Qfgx18N6AwIghkCat4
 fGXznM4QE3q9kHzF0ant2YZVUPgwjqvHMMHIvgJazw==
X-Google-Smtp-Source: APiQypLtQuQar2c1tI6CGI0vtY9dq3N4lngp9O2mij3UYsEBP+3mzWL24/7wbwDu1xUppW2fn67biF2GwNOxdompbdM=
X-Received: by 2002:aca:3a8a:: with SMTP id h132mr3758551oia.146.1587064100555; 
 Thu, 16 Apr 2020 12:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200416152829.790561-1-laurent@vivier.eu>
 <CAFEAcA9J=H7RMEEY5BmL=2ObKJDzMQQeWvbUnYYJfxFsntbP6w@mail.gmail.com>
 <2ee4258c-cb88-cdd7-78c2-4f5ac4b008ae@vivier.eu>
In-Reply-To: <2ee4258c-cb88-cdd7-78c2-4f5ac4b008ae@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 20:08:08 +0100
Message-ID: <CAFEAcA-UWSJDvq5xmn2GTKY2zAgenkM7whdvn6FiY1+pUKBhcA@mail.gmail.com>
Subject: Re: [PULL 0/1] Linux user for 5.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Apr 2020 at 18:16, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 16/04/2020 =C3=A0 18:03, Peter Maydell a =C3=A9crit :
> > On Thu, 16 Apr 2020 at 16:29, Laurent Vivier <laurent@vivier.eu> wrote:
> >>
> >> The following changes since commit 20038cd7a8412feeb49c01f6ede89e36c89=
95472:
> >>
> >>   Update version for v5.0.0-rc3 release (2020-04-15 20:51:54 +0100)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://github.com/vivier/qemu.git tags/linux-user-for-5.0-pull-reques=
t
> >>
> >> for you to fetch changes up to 386d38656889a40d29b514ee6f34997ca18f741=
e:
> >>
> >>   linux-user/syscall.c: add target-to-host mapping for epoll_create1()=
 (2020-04-16 09:24:22 +0200)
> >>
> >> ----------------------------------------------------------------
> >> Fix epoll_create1() for qemu-alpha
> >>
> >> ----------------------------------------------------------------
> >
> > How critical is this bug fix? After rc3, I really don't want
> > to have to create an rc4 unless it's unavoidable...
>
> See the launchpad bug (https://bugs.gentoo.org/717548): on alpha, it
> prevents the use of python3 in gentoo chroot, and thus we can't use
> emerge to install packages. It also impacts cmake on debian (see
> https://bugs.launchpad.net/bugs/1860553).
>
> But it's not a regression, so up to you to reject it. It appears now
> because most of the distro have switched from python2 to python3.
>
> It's a low risk change, only in linux-user and for archs that have a
> different EPOLL_CLOEXEC value.

Thanks for the explanation. I think that I'll put it to one
side and if we need an rc4 for some other reason it can go in,
but it's not sufficiently major to merit an rc4 by itself.

-- PMM

