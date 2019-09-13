Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280E5B1BC9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 12:54:14 +0200 (CEST)
Received: from localhost ([::1]:42326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8jDQ-0004sO-P6
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 06:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39587)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i8jBH-0003K3-E6
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:52:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i8jBG-0005b6-3Y
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:51:59 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:40440)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i8jBF-0005Zy-VO
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:51:58 -0400
Received: by mail-oi1-x235.google.com with SMTP id k9so796536oib.7
 for <qemu-devel@nongnu.org>; Fri, 13 Sep 2019 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L+uTwP8C90QX91X6FSPOMTTxyL46N1SifYkNDgjAXek=;
 b=beKl2NIS53Q5Eui0417hd2VnBQHtbSyt4TGaoqy74e51O1ttytcSBwD5PeWyV9rrum
 C+WPOO3rhK4H8e0flvsbIdJhv4yxC5MSzB9caTP2e5lwZs0qVY//0QWcEjyMGglbAbXb
 xu/6sHWScVgNnRHjFampb7BfmcWGgS8fOZi2dyug+eCy7gfq32T4D4nLZahl3Q13HFzC
 uZYFVZQA+b7/sp3Ll6I4qAoEDUCUyNGypvBitIqSmVYKgdIP3rRUB+jie6a46tom3N6B
 k0KfDUXfOQJzW8ROQZywYFggBpoFKfHHM3C80z8eDFRBS7+ga7brwrzKNaPLGcWkKpbL
 4+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L+uTwP8C90QX91X6FSPOMTTxyL46N1SifYkNDgjAXek=;
 b=O/trnfkiLK5FNBv/thbzlA51R/0MbByiD5zGzmpMK4BvvM06gZJtgO48yOSeO8v5ik
 5PO5cOG7OL/BGLN1lv3exkBStbaAeSN8xZibD0ch8YjFBNZOUjiiHOc7Yf6KbKUrF9RE
 3J3OzBCvboa50nzRpMLENMfUWFFWrlPR6Eeg4Lsa3rg5BB8BFR2RlezM2aZJEJjEMY19
 CnxGK7oAtotqSehqswpU9U56JZkXtX1Rn6eIjv8Wbn5KTdkb7TFJI/FXYJ65J7l/s3Mj
 Gss10cTBkAFTF8zIIVONPLUxilmmCH+HQT3FnpUUhQ9vAJLflZC1BwCd6b/9lE9g7Y3O
 Q5Gw==
X-Gm-Message-State: APjAAAXyX53AuPkcH+qXuinAxK4tfTO3qILgggtT/JDTrpuD7p0u/+YH
 ahXZ78n1y2YtrirTpAp5E24/ZBkUMGN+dbKPtXVYdA==
X-Google-Smtp-Source: APXvYqzm2cIu16giCSNqckswWTTAQCyTuJ241p+mWglwhDImt5KMWxMLAuKXxtI3Va7TUJCKOY9FbEcNEx/lNPvxEqg=
X-Received: by 2002:aca:281a:: with SMTP id 26mr1681256oix.163.1568371916182; 
 Fri, 13 Sep 2019 03:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190911093135.27010-1-berrange@redhat.com>
In-Reply-To: <20190911093135.27010-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Sep 2019 11:51:45 +0100
Message-ID: <CAFEAcA__7HXc6y3PrQLEYpgMZ_b9bCn=7POGvdtTXDviMrNEEQ@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::235
Subject: Re: [Qemu-devel] [PULL 0/1] Filemon test patches
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

On Wed, 11 Sep 2019 at 10:33, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit 89ea03a7dc83ca36b670ba7f787802791fcb04=
b1:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/m68k-pull-2019-0=
9-07' into staging (2019-09-09 09:48:34 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/berrange/qemu tags/filemon-test-pull-request
>
> for you to fetch changes up to bf9e0313c27d8e6ecd7f7de3d63e1cb25d8f6311:
>
>   tests: make filemonitor test more robust to event ordering (2019-09-11 =
10:29:27 +0100)
>
> ----------------------------------------------------------------
> Fix filemonitor test broken with newest Linux kernel
>
> ----------------------------------------------------------------
>
> Daniel P. Berrang=C3=A9 (1):
>   tests: make filemonitor test more robust to event ordering
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

