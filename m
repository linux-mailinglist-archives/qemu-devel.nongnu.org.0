Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C918C139399
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 15:22:07 +0100 (CET)
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir0bW-0007rW-Sr
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 09:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34591)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ir0ZT-0006GV-A4
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 09:20:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ir0ZR-0007De-UB
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 09:19:59 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:34472)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ir0ZR-0007Ci-OJ
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 09:19:57 -0500
Received: by mail-ot1-x330.google.com with SMTP id a15so9069552otf.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 06:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=STzwmIRYOk61ICR8hTh3qshOxBGbS4k7FmWvD0R8AbQ=;
 b=zyB29RJeO2p6HmixO+kbYWZN3DE4kykhxin5ysJQZzibKaMS2yXUDmcdify7b4ig1b
 TbZqB4d0h+z6nT/HuzxX7EQHQX1nOKfNAJAbI/Xb/n0ITRupVvDDQH7CvYo0Hh9s8//k
 dNk3w1q4dmsN2BycyNDr4gEvVLFZ9pffU+3+wqY1iqmQzGSq+LBNXJXjt5gc+ghDU4oW
 KpHKYlRX8LqwIiW6zU2CQniCo95FMOKKvOBN+wAQuotnvGplWUjW52oG80z/oZYZf25L
 p4NkYnR6bmow91KDMrjpvs8gRchHnL5L6EVLNgZ48RzWBKJO6oIlW58nLw1tPkydCzH6
 z0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=STzwmIRYOk61ICR8hTh3qshOxBGbS4k7FmWvD0R8AbQ=;
 b=VrmF3toGhawIsBznHyPsv0mu4g1ysTMb/KqcfNgWcGGe0ljWlEdHEFcdeJ05bmX1ke
 JdBXk8s2Hv7/07XgoEqK+oRcAMJJkCt/gJ4XXxV4t/a9zjSC7R4AjDcIyYmVrAotE1BY
 dglXBIMh/N1SjbflEXlBYoODiLyqOPNKpPVcfdKwOafO9Shipo8gwcSMvd2N+AZEw4aq
 G4TpcdMR8T0gI2B3aQp32bq+LSdTPRmLzHJARRDsArPmO0KWe+olhLT98o64kAeHEMxB
 F34152USvAWr5A9Rlnn92RCbvG5GU8LIJGwnXwrv8E8I13SL00TfzZ+h1RF0APXnVbsz
 41ew==
X-Gm-Message-State: APjAAAXTMgAycVYsDcZwc/3W2ULAtnGkZTm91F8Fc4sh8QsdYcJN8zRM
 kfIKEFWpV3HnblMlJs6DYU3ATpAILz5hoR/cWpXc0w==
X-Google-Smtp-Source: APXvYqyO5w/PZebWBhfS4EunjTN7WdRCysgcvO7WFYbwOaMf0ncGXYtZv9SHuVqaJy9PRuoCTOkAYcO1/+YMa4T5KYs=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr13393639ota.232.1578925196719; 
 Mon, 13 Jan 2020 06:19:56 -0800 (PST)
MIME-Version: 1.0
References: <20200112112832.9450-1-thuth@redhat.com>
In-Reply-To: <20200112112832.9450-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jan 2020 14:19:45 +0000
Message-ID: <CAFEAcA9FZhx6HzjpVuYqzd_RF0FEccc53JP3iukh++=RpCZecQ@mail.gmail.com>
Subject: Re: [PULL v2 0/8] qtests and docs
To: Thomas Huth <thuth@redhat.com>
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 12 Jan 2020 at 11:28, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit dc65a5bdc9fa543690a775b50d4ffbeb22c56d6d:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-5.0-20200108'
>   into staging (2020-01-10 16:15:04 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-01-12
>
> for you to fetch changes up to 22108f333d16cbfbd5808bb4f661c394b08fe698:
>
>   docs: build an index page for the HTML docs (2020-01-12 11:42:41 +0100)
>
> ----------------------------------------------------------------
> * Move qtests into a separate directory
> * Build index.html for docs
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

