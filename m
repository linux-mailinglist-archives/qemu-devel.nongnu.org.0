Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F90392881
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:26:54 +0200 (CEST)
Received: from localhost ([::1]:43946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAPt-0001lP-4X
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lmAEJ-0002mn-3Z
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:14:55 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:39782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lmADp-0005eq-4e
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:14:54 -0400
Received: by mail-yb1-xb36.google.com with SMTP id f9so5764194ybo.6
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 00:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=clE4FttrJVXdBOBEsDLZMMwTNTrLLLYk3qNyQRcHQ7k=;
 b=bG2TF7o8XM6Husa1yZL5nPGXPtD8XrxeAWRnoB7a1gIlAx0zt07XxeQWk0RXVpfH6D
 vA35aiIWO75sxKLZoF8SbdxjGHcW5Icr/v/YbTG1P6jc+tDau5NJK9NzxuhHw8COU3OJ
 gmY5w3fwCngpw/vt8SxT6HMiDvjCTpGbjYP2leHmBYhuv5hyh4mLTJOcYZtu87/0Fd2/
 YP0+OTqkDVymfCfjpxoaZbbZlJe5hL/pcZRiSgiw3aCnz/knnPHehyTJD9wGpwrUNg8T
 liQ1TYNp/FL14kkUR1gIfMiT7aO4uZo2OjBbtFnd/XZBIQBMCpTP/S0STTs9+RfuWCjY
 KyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=clE4FttrJVXdBOBEsDLZMMwTNTrLLLYk3qNyQRcHQ7k=;
 b=IGqirBXgxWTC4s4/NvKLThvYfEtLpgGVIfp9fAXWR3YqZaBD/IpJ7cYZbbUXOhI0Tx
 VUOX7QlVidvs98XQtR1rHxYJRVb2ea+QxA8feqAPfafjUr5BY+Zg8b7hJ2k3bYh/6EZY
 uyhDZJ8rw6jkAqiGZddCRO+8/z9vQx9zOiiNOyW/U+ne/bHY2QLCXkMvjJPcWilhMwTA
 1ITeOWFF4DgGbVaB8h1ZOEO1cTE1Wo3shyJznuHJ7ymRC7XXMl6vayHxM86lsDNtn0ly
 KARb+j6GkjG3dgocfw/uTYZyrtMou8YfisON2JwC6nBbFMGhETVqE+lr6I3OS6So624z
 HpgA==
X-Gm-Message-State: AOAM532EknPjqvxJOlKlSbAgPldn16Q8TgKTUDIHFtL3+w0IDgNOzRwZ
 02kAH04OB5TGj4BMUbo+Jt2YMls1oY41bIP0CJQ=
X-Google-Smtp-Source: ABdhPJxKkMP888ic5ggZU+JKj/7EhOfW0mdFgED4L29Yg290hbzCYYpAwW0YuXMzKGvkx+a3EGd/LLhhfm+4Uv4/cqA=
X-Received: by 2002:a05:6902:100c:: with SMTP id
 w12mr2808665ybt.122.1622099663271; 
 Thu, 27 May 2021 00:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <1622089478-5426-1-git-send-email-jasowang@redhat.com>
 <CAEUhbmW2dHstLd6gE43gdyBr+xpoGXjZSuh+6fwKwtSrQjmuWg@mail.gmail.com>
 <43e3dd04-edac-f0a5-0b99-9a8c8b9d1a5f@redhat.com>
In-Reply-To: <43e3dd04-edac-f0a5-0b99-9a8c8b9d1a5f@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 27 May 2021 15:14:11 +0800
Message-ID: <CAEUhbmUJG9vckLWE_r=SCRpW5z1T_NZJkRy4fhUrMHAP_zbW4Q@mail.gmail.com>
Subject: Re: [PULL V2 0/3] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 27, 2021 at 2:35 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/5/27 =E4=B8=8B=E5=8D=882:13, Bin Meng =E5=86=99=E9=81=93:
> > Hi Jason,
> >
> > On Thu, May 27, 2021 at 12:24 PM Jason Wang <jasowang@redhat.com> wrote=
:
> >> The following changes since commit d90f154867ec0ec22fd719164b88716e8fd=
48672:
> >>
> >>    Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20=
210504' into staging (2021-05-05 20:29:14 +0100)
> >>
> >> are available in the git repository at:
> >>
> >>    https://github.com/jasowang/qemu.git tags/net-pull-request
> >>
> >> for you to fetch changes up to 4f8a39494aded9f2026a26b137378ea2ee3d533=
8:
> >>
> >>    tap-bsd: Remove special casing for older OpenBSD releases (2021-05-=
27 11:03:55 +0800)
> >>
> >> ----------------------------------------------------------------
> >>
> >> ----------------------------------------------------------------
> >> Brad Smith (1):
> >>        tap-bsd: Remove special casing for older OpenBSD releases
> >>
> >> Guenter Roeck (1):
> >>        hw/net/imx_fec: return 0xffff when accessing non-existing PHY
> >>
> >> Laurent Vivier (1):
> >>        virtio-net: failover: add missing remove_migration_state_change=
_notifier()
> >>
> >>   hw/net/imx_fec.c    | 8 +++-----
> >>   hw/net/trace-events | 2 ++
> >>   hw/net/virtio-net.c | 1 +
> >>   net/tap-bsd.c       | 8 --------
> >>   4 files changed, 6 insertions(+), 13 deletions(-)
> > What happened to patch 5-12 in the following series?
> > http://patchwork.ozlabs.org/project/qemu-devel/cover/20210317062638.726=
26-1-bmeng.cn@gmail.com/
>
>
> I want to do some test before the merging. Or if possible, could you
> please write a test for this function?
>

For each of these network adapter models? What kind of tests are
needed? Any pointers?

Regards,
Bin

