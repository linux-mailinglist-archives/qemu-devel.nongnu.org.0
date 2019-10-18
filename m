Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916BDC5DB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 15:16:36 +0200 (CEST)
Received: from localhost ([::1]:39884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLS7P-0002Ph-Au
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 09:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48508)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLS4A-0008NL-O4
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:13:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLS49-000418-Bg
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:13:14 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:46272)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLS49-00040d-70
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:13:13 -0400
Received: by mail-oi1-x22e.google.com with SMTP id k25so5119294oiw.13
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 06:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GkGWRlPvcyznc+MnaIZL8/SVyGRtJXSSli8QHCfpFOE=;
 b=cz46FwttxbzADnV5IW8Jp923NxHJ8+hnjac7WxIJJCYucQHhUxUl8/VNTytVlQ7DDf
 4hIFPvrUXnzAo8mK1xdUWlmnkQ1UJNKv7N+5qpKlmAc19ML3DvSblzYycCwyDb1IjECi
 gsYXCu5oUTjp1JfmoKeTKRT2su8FzN8/RMZ06KsczlSWk8yHIJcMnjk384TQdI3s0iXq
 PjpNNn2/S+O/ChrJcQFHjevEgx+Bm1T7V4xA7ySBWBBiOuFx+HYG3E/wpoYJcwDtsKdO
 xI2+b2VYNBm5KvcjcxI0QzXjSdcoQO/qmbDuufOGRviciukc0PFy7Ho6vfU6dOlFTTly
 W79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GkGWRlPvcyznc+MnaIZL8/SVyGRtJXSSli8QHCfpFOE=;
 b=XovqHTd4arZspHsFZVJedCSJKCSZlaP4P3FO8oguBCUtMRa42vtAhyW8QewGXHbmHu
 TtfPA599f63Up8tAyuprBx8QECrdl2IdAARo3OSRPFXhwEjIvaDjmXwlE6x5OTSKbM3F
 /T86S64lOqX9LeK6PAohy5Ea/XjX4cNKch/u2qDvW6DXp+QXzZaug4i0FL0aCrokgJns
 Jp6uzLhnBRKh7mcclq7EN/UeZak13ixt1xfWpPi2MpNw6MRiaHtyLNOYMPzLJ+kSn5b0
 WmqtgEIdpiIZZjkpgUW8ri4OTjLKLy8ZtrnuyodaWUNLtEsv/s9wbyhB2mp8CneGP/+Z
 pQgQ==
X-Gm-Message-State: APjAAAVmXxCWffs5TXxVRgZWfiaWqVKU3laGlg/H9E4Ruy2OR0yjWxdU
 4Gn3R/s0sq42WGeW0ViKerVa57ZpCy6q6s2/ASqAVw==
X-Google-Smtp-Source: APXvYqxRVmd89ldJjoPDYTEchxdpYJgDWhRYh0M9CTibvUlMudbHpJeJAH0+s+c55slFBrQ7L1Eu+azUF4HqSwGrHl4=
X-Received: by 2002:aca:49c2:: with SMTP id w185mr8125706oia.163.1571404391802; 
 Fri, 18 Oct 2019 06:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191017215436.14252-1-jsnow@redhat.com>
In-Reply-To: <20191017215436.14252-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 14:13:00 +0100
Message-ID: <CAFEAcA_w1BYZNS6gzZ4SmxX_7qCZPzMpZAYTefH3-aP-WDvcAA@mail.gmail.com>
Subject: Re: [PULL v3 00/19] Bitmaps patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22e
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Libvirt <libvir-list@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Oct 2019 at 22:54, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit f22f553efffd083ff624be116726f843a39f1148:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20191013' into staging (2019-10-17 16:48:56 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/jnsnow/qemu.git tags/bitmaps-pull-request
>
> for you to fetch changes up to 3264ffced3d087bbe72d759639ef84fd5bd924cc:
>
>   dirty-bitmaps: remove deprecated autoload parameter (2019-10-17 17:53:28 -0400)
>
> ----------------------------------------------------------------
> pull request
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

