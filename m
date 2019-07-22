Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526EC7068F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 19:13:24 +0200 (CEST)
Received: from localhost ([::1]:36152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpbsI-0007vG-Fd
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 13:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47693)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hpbs1-0007Ay-Jq
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 13:13:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hpbs0-0003mN-CR
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 13:13:05 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:35889)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hpbry-0003jV-Eb
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 13:13:02 -0400
Received: by mail-ot1-x335.google.com with SMTP id r6so41007869oti.3
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1nSzYMlze+Th3/XpU+P9FLAQjtl5izZfuqt8BgeKgWc=;
 b=fS53v/nJsxao5V+BEjdghJlXCWF5/CiiUHcIWob6u31d31e+so1glfjmzLjsCeAFA/
 gDL+118E14ezAVltvuOYV5voP4+PlldHPz5r7xKpEy9eZKZinKoR71dBytOQq8CXYIEk
 umHKOwGi42ofYCubT3oPHK5xvmpEleZ0T0Nr+eYVr3hEb/HoYB/309QKxQqre7HLzkzS
 RoEROB6lJB50kdGgmCY81JZ8dtjZhGj8eB1gTzXCqBZC/L3RUUunzc8sxHdsvUxwxcxt
 GBoTf89223HE/z2mMh8Nb7bCk8bLYBzuyRGCzdNDK4fkLddYENS4LX8JFI2+raomTptJ
 4MBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1nSzYMlze+Th3/XpU+P9FLAQjtl5izZfuqt8BgeKgWc=;
 b=cAD1NLky+jDELXdlYrnLiiEvUca0dfrSeZ5enFpOUofG8wIcFfXyqdh0x+tReomt9L
 yS6yhSYvebwlAJfDLP/rtHZrGwp8iSkWyZXZptJbfYvJDAt9UhHe1EGhJQKOLGkSG0L/
 QGq13EF1qg1lsyBWXRR9KgCOryOOkfZU+LE5oHuu/vniVZxA0IfBcE+/MkD7Sq7pUBTW
 inWOovRCDeRLqEzQ4+lvvMLnuNFCI/DGzUsk58/Exz9mkX1B1Q0C58YL+iIeuZ36uIC3
 4k+YqV64j5MbZgG5SANtBxT7SPM5UfQ3tZk2TIMyQ8NjPuRagyJwGj+U5T86M/wlVCAO
 Tbaw==
X-Gm-Message-State: APjAAAVlFZSPQjfr71Oa6QMpd+enk4OUbde8wH3A0td+9yPPgRaLQ0+l
 xiG9W4/BJaQWlzU9FELQ0C6iyQQ/TMndMuN9jXd7BQ==
X-Google-Smtp-Source: APXvYqz/8kD5JvSWsBAA5zPe9ZKG52BDtdaZXIOj45jT+dN2qcdIjSxQ5JAYxkAnZE71eZpxO8DBpNc/JAzZu/4Vwo8=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr22393221otn.135.1563815578762; 
 Mon, 22 Jul 2019 10:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190718104837.13905-1-philmd@redhat.com>
 <20190718104837.13905-2-philmd@redhat.com>
 <5e6b8a67-8f8a-3e3b-4f42-db2a31c03ad1@redhat.com>
 <d4d20337-b504-0610-8aaf-c8b0b13f0953@redhat.com>
 <053eeafe-4e93-aa96-f544-ea0606e244b6@redhat.com>
 <689b75f8-ae47-621f-44a5-f3ad07fe2661@redhat.com>
 <63ff0471-aa50-f60d-417b-c42d315e02e3@redhat.com>
In-Reply-To: <63ff0471-aa50-f60d-417b-c42d315e02e3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2019 18:12:48 +0100
Message-ID: <CAFEAcA-4xUJRJ1BKc5-NBLy+jfY1dShE8GaoVVq_+USzdfxYQg@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::335
Subject: Re: [Qemu-devel] [PATCH-for-4.1 v7 1/1] hw/block/pflash_cfi01: Add
 missing DeviceReset() handler
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, John Snow <jsnow@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Jul 2019 at 17:51, Laszlo Ersek <lersek@redhat.com> wrote:
>
> On 07/19/19 18:19, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Laszlo,
> >
> > On 7/18/19 9:35 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 7/18/19 8:38 PM, Laszlo Ersek wrote:
> >>> Regression-tested-by: Laszlo Ersek <lersek@redhat.com>
> >
> > Patchwork doesn't recognize your R-t-b tag:
> >
> > https://patchwork.ozlabs.org/patch/1133671/
> >
> > Should I change it for a Tested-by, or add as it?
>
> Please pick it up manually, as it is, if that's possible.
>
> I prefer to dedicate "Tested-by" to cases where my before-after
> comparison highlights a difference (i.e., bug disappears, or feature
> appears). I dedicate "R-t-b" to cases where nothing observable changes
> (in accordance with my expectation).

The counter-argument to this is that nobody else is using
this convention (there are exactly 0 instances of
"Regression-tested-by" in the project git log as far as
I can see), and so in practice people reading the commits
won't really know what you meant by it. Everybody else
on the project uses "Tested-by" to mean either of the
two cases you describe above, without distinction...

(At one point we talked about using checkpatch to enforce
that we used a particular set of tags, mostly to avoid
people managing to typo the tagname, but also partly to
retain some consistency of usage.)

thanks
-- PMM

