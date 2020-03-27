Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFADB195E80
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 20:19:29 +0100 (CET)
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHuVs-0002q1-J6
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 15:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50496)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHuV2-0002Rb-HJ
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 15:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHuV1-0003Iy-AP
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 15:18:36 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35784)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHuV1-0003Ik-5Q
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 15:18:35 -0400
Received: by mail-ot1-x341.google.com with SMTP id v2so6384401oto.2
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 12:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7b8pd2PeUYEhhBSJLFprS4neuvrBP6ynD50ZhKLWaGY=;
 b=A8LQosPKI/wGGMDcW9ZT7P9yt2l0ZmXaCoTCA1ULPv3Cs3cz0ezYHNLMd4qYR9ppAb
 xfFUgVjxU8qIN+6uDF+4qAYPObLNAyCYbHJq8INlTprGRrxe4bBKin6dbjQnGtBxryv7
 aqSahcUkKWLbd4k3QA9ptzKdNdv6AhMIh7NomSSFYdICOe3PgCs8dPffOv5NPTQTbIz+
 +lKFMuu0f/NyFeOF7DJlMvytHWKiVU+OEe49rePetfDZDHnt0pp+qW2fEIg9bEFE0/vL
 DDSwlcJXDBXze1nDq7+Ss6NRIrkvkwTDdouPXP7SCPTDgUC6BWTSU01pkYrCXHL910Eo
 exVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7b8pd2PeUYEhhBSJLFprS4neuvrBP6ynD50ZhKLWaGY=;
 b=pu4qRfK+QQqIjY4I+tz8BQi02FkMKek0IkUbpX0hGxCZ1gx8UTu16TdrzdEaEF59l0
 UWI6mqAA9111TBpmdU49lG3WgTqZHLeJSVqfyMVskQQaJnx2ObhYiyFpRRNZEKG5Vbm+
 kb8VfFkAuGcD0aK/tspjKk0f47OUWBZjG0z+g83+UWAW1n3iXF+0MPtt8pojJ1MjcwLd
 2VTL69Weh9EGq9xZBwQQJdX/Lfk6gbpSDhKVUmWe5OHRWaC+dmF3AyYTzlKIPBlLX8Pp
 /XRtpGrdOQ4YIe9B0lHNEudiN7KHUQcol+RcPPh1FwgJV2tjEq/vzYGwaLDuMsCoqIkr
 qmsw==
X-Gm-Message-State: ANhLgQ0TL94RW8/WQDvLuXbDPeEJKMFJHAx6sC9D8zRWQJPE5u+SVrFB
 jrYlm8hLQVtgE9rIVT/NOs8B8PySGxWbQK7Br0GhhA==
X-Google-Smtp-Source: ADFU+vseEXbuq3RqLjMIyTOwgDL4J3B6y99uPnkxp0MNdXzXoU65ulCLhr9qV401tNjOKRSeRU3XC7jABe/KXk2eoaY=
X-Received: by 2002:a4a:a226:: with SMTP id m38mr810191ool.94.1585336713903;
 Fri, 27 Mar 2020 12:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200327181320.23329-1-alex.bennee@linaro.org>
In-Reply-To: <20200327181320.23329-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2020 19:18:22 +0000
Message-ID: <CAFEAcA-5ZApvBLiDrAa5oea_tygX9vyA8n3SFwqjnS5zEekodw@mail.gmail.com>
Subject: Re: [PULL v2 for 5.0 00/12] testing updates (+ one mttcg change)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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

On Fri, 27 Mar 2020 at 18:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit cfe68ae025f704f336d7dd3d1903ce37b44583=
1d:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.0-p=
ull-request' into staging (2020-03-26 20:55:54 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-270320-2
>
> for you to fetch changes up to 41e1f0e2256e4c21bc5671ecb64191e776477c35:
>
>   .travis.yml: Add a KVM-only s390x job (2020-03-27 13:43:20 +0000)
>
> ----------------------------------------------------------------
> Testing updates:
>
>   - docker updates (various dependencies)
>   - travis updates (s390x KVM build)
>   - tweak qemu/atomic.h headers in event of clash
>   - test/vm updates (NetBSD -> 9.0, FreeBSD -> 12.1)
>   - disable MTTCG for mips64/mips64el
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

