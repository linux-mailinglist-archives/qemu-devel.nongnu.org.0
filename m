Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4802EB364
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Oct 2019 16:07:35 +0100 (CET)
Received: from localhost ([::1]:51264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQC2w-0006Yp-KC
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 11:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53407)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iQByn-0004Fk-6s
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 11:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iQByl-0005Su-MU
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 11:03:17 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:40598)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iQByl-0005R8-D6
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 11:03:15 -0400
Received: by mail-ot1-x330.google.com with SMTP id d8so5642757otc.7
 for <qemu-devel@nongnu.org>; Thu, 31 Oct 2019 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CTaYJ3JSihAeSaUzSwCWe8RWsR3KNagRcGJNXEI6Ogc=;
 b=QCKihRBoqMUXG6L30PLYSzoi1W+ImG75H2BkMPoHavkRxImxmcU6osdsF8up1KQ05i
 jIlQLTag4IOJxSKYr4bus3FPCPvBg5caGcKFQlE4CvM86aq/cfdnZlAz16ylyMHJtMVz
 vgn+rY2dbbjOyjDE8z/XORqLoCpk6xkVCg4UDVRqrvpId9kF5IqiiBQ7mGIKgd9EVPGp
 bWHoykHLi/uwa7ykkubQCByPpIFGBWb454gO9ey4aEErXCkF4C5zsr4va7F0Amjmpb6w
 N3J/L8W91Ov2J7z4yMswWVLyxFlUGrv4ThHgHSUhjTvzH37EJ3wEn599TCuKIoaDThJp
 Jrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTaYJ3JSihAeSaUzSwCWe8RWsR3KNagRcGJNXEI6Ogc=;
 b=qxqnl0riaH5mL5j8YCfISk/lCmJ8eBG0+Lqk6oLOoTYLtuWXK+GKGIi6FWhR/s9Qvk
 hmoHqFtnM6GJPqF1d5u06swkzSD54KqdoPcbOWfC3CyEuye2jYhmav9G8sP1wbwe8p6N
 0hF6MCrLISsYagmII4yLOD0WxU8n8wXdOmLSomjZIjlA6ezhWPpSQvDaYybWsA4XQ3NF
 Cddhwvm+ODji+WL4n24nfs4tNaxz1HL3z3XkiM+NLS4WpbsMVXje6DeYL5xUpxzzoHAU
 Y56ibdZJsXKPxwhWl2WcSMnDsPIbGQmiUnn0r+txOrLsIXZfp1rFWKVKPXpJtfbXJ+t+
 UaSg==
X-Gm-Message-State: APjAAAVDdfoDGsCHo8zzY3ZuUBc6GedJhmo9WfhO2XyGYmCsfmzhwOYc
 TLZTCryyg0Vy7RksU3LDNLCLfKRinWQHWEkWWxKKoQ==
X-Google-Smtp-Source: APXvYqxtjM719yLAU6p4R89DabVApN1o6GdHfXvOCXYnBQ18vizb4bX2pBK957vUaYtX80o+uE7e2NHCd1gER0B+LmE=
X-Received: by 2002:a9d:6845:: with SMTP id c5mr2366689oto.97.1572534193603;
 Thu, 31 Oct 2019 08:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191031105904.12194-1-jsnow@redhat.com>
In-Reply-To: <20191031105904.12194-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Oct 2019 15:02:58 +0000
Message-ID: <CAFEAcA964ibGcb02kTC_bTcX5xLu5r-=NJMz5Kykct0t7CVwnw@mail.gmail.com>
Subject: Re: [PULL 0/9] Ide patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Oct 2019 at 10:59, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit 68d8ef4ec540682c3538d4963e836e43a211dd17:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-tcg-plugins-281019-4' into staging (2019-10-30 14:10:32 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/jnsnow/qemu.git tags/ide-pull-request
>
> for you to fetch changes up to c35564caf20e8d3431786dddf0fa513daa7d7f3c:
>
>   hd-geo-test: Add tests for lchs override (2019-10-31 06:11:34 -0400)
>
> ----------------------------------------------------------------
> Pull request
>

Hi -- this passed the merge tests but it looks like you forgot
to add your signed-off by line as the submaintainer to Sam's
patches. Could you fix that up and resend, please?

thanks
-- PMM

