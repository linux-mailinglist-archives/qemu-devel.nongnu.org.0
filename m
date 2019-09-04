Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE54AA7D7F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 10:19:06 +0200 (CEST)
Received: from localhost ([::1]:54430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5QVN-0002Sm-Vw
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 04:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i5QTp-0001jH-4q
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i5QTl-0006bj-KW
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:17:28 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:41216)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i5QTd-0006Z7-VL
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 04:17:19 -0400
Received: by mail-oi1-x236.google.com with SMTP id h4so11744961oih.8
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 01:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ydIIYt3u6AgaGzYPHFFQf7+WcGMAkkrqlxJ9uxT9KRw=;
 b=sEB2a/oW68YaqX7ggOwkr+6VMV/W2hQkfUjxKlmFMN/7/dtgE74WPV31qqhdlWPlw7
 JTPzb0l2NJE7m8+OBYuJK+ci12/t5XMKD4F8+qex4qug84J3LwTecqsT58+FOFFfBkJy
 qUOxzzoaGsIbJty5Jp+Ln5D2evWdGdAOCZUAbndIZ2ZOSVkUon+/0Gs0VnPJ+57gf9NU
 2MyTbffLDw5Ud433d6KsaxPkrqwDwSLg2KStw6Gi8F3PhP1qaFa/ocla3iLxhU80pcj2
 oKsI8wVzWajNkrySv88zzGhwMEiiHV9KSDmaIe5ZJF7Z/niuvaWC3isyya/7iiqHbB0O
 hlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ydIIYt3u6AgaGzYPHFFQf7+WcGMAkkrqlxJ9uxT9KRw=;
 b=e+jzsD4PURByJd4vQ83di/KLKyj4u7im1r/O4nx0YIz3Lr9rdtVcdz7UVpKddfCrAM
 kHPA2cNu+fXN0xLRcexmcbvl3kVeGK2eNeOcC/UKgsh1fPZlMrxzWkUWRi/+pbweQXC8
 W0mvqt5Bwc+Lj1ugA+sfn6ol3v08oBHGCUvt0m54jUr5nfcVL1o+ly/tNQqusyjulZe/
 Mj6Z36D6CgoYNzUGJb88a2x7vKN8yqCSZT4Fr3EanD5huKLjzDQ1z0y6ZLq8fe+cLKBP
 +J3h6/l1y0jryJTIX8ic469hsaCTIRSAKUIPbT4I+vAO7R5nOW0kavXJ/rSkVIRpZG44
 X5ag==
X-Gm-Message-State: APjAAAWju7gmzn5fHMuCI7tZDVofnb2NcSB3+4vA4vpvhXn/uX1IZKrN
 q6ssFyzvhVQQSf6R8AYrnnfMbsaj4Pi/rDWYFFPvhA==
X-Google-Smtp-Source: APXvYqzpp2+U4563FPfiX7wYCRU+ylkLjpclLfuwxh8qJBLigMekuf0N/+ZhAB+Xr6kQctRVdRPHTYMZNwbgmIcqF+s=
X-Received: by 2002:aca:281a:: with SMTP id 26mr2413619oix.163.1567585037041; 
 Wed, 04 Sep 2019 01:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190829060827.25731-1-david@gibson.dropbear.id.au>
In-Reply-To: <20190829060827.25731-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Sep 2019 09:17:06 +0100
Message-ID: <CAFEAcA8DWFC6=CB0_L7f+pMbWD1sEksBkZiarROHxodxcGi3Qw@mail.gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::236
Subject: Re: [Qemu-devel] [PULL 00/19] ppc-for-4.2 queue 20190829
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Laurent Vivier <lvivier@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Aug 2019 at 07:08, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 23919ddfd56135cad3cb468a8f54d5a595f024f4:
>
>   Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20190827' into staging (2019-08-27 15:52:36 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/dgibson/qemu.git tags/ppc-for-4.2-20190829
>
> for you to fetch changes up to b1e815674343a171e51ce447495957e289091e9f:
>
>   spapr: Set compat mode in spapr_core_plug() (2019-08-29 09:46:07 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue 2018-08-29
>
> Another pull request for ppc-for-4.2.  Includes
>
>   * Several powernv patches which were pulled last minute from the
>     last PULL, now that some problems with them have been sorted out
>   * A fix for -no-reboot which has been broken since the
>     pseries-rhel4.1.0 machine type
>   * Add some host threads information which AIX guests will need to
>     properly scale the PURR and SPURR
>   * Change behaviour to match x86 when unplugging function 0 of a
>     multifunction PCI device
>   * A number of TCG fixes in FPU emulation
>
> And a handful of other assorted fixes and cleanups.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

