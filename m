Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326F04F6A5
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jun 2019 17:45:08 +0200 (CEST)
Received: from [::1] (port=41332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heiCQ-0007G7-Pt
	for lists+qemu-devel@lfdr.de; Sat, 22 Jun 2019 11:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1heiBV-0006UE-Ax
 for qemu-devel@nongnu.org; Sat, 22 Jun 2019 11:44:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1heiBT-0005Ua-Bx
 for qemu-devel@nongnu.org; Sat, 22 Jun 2019 11:44:09 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:44637)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1heiBT-0005Qz-58
 for qemu-devel@nongnu.org; Sat, 22 Jun 2019 11:44:07 -0400
Received: by mail-ot1-x333.google.com with SMTP id b7so9254945otl.11
 for <qemu-devel@nongnu.org>; Sat, 22 Jun 2019 08:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1S3wAfhPo+AU+7zKMV9bLX4fs2CShMFGefODu2Jp0A4=;
 b=oyG5LA6Qi/k5f2eZBA1E6GZKm4EWAZmPqrPyLbOi71vEo8VkaqzyTrVVWjrKR706QU
 NRRh0vhr4DePkcICEVZiuqpLizVHRDQQAPG4w7iuP76W2yQuM9tvaA5TTVLKFENOMVpJ
 MMM35+66+K3wf5vgGNyIIhr5iqwD7y/SoBSCIfeX3OZ9eZV4is1yBxLCf9VplKXiWoFu
 JS5UJguJ2e9YnpFTFMaOeJPQy24R3w5L+s6FMOy3TYHxtuX0Iz8WzUKbmKKAtM7xddNz
 dpESJl988wS3aE6v7hd69qAFvbZ6lfbHwGmo/CkLXHsVOqKc33JylQPFn2oK4dsIjBPJ
 pxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1S3wAfhPo+AU+7zKMV9bLX4fs2CShMFGefODu2Jp0A4=;
 b=iFOiIBXrkqyz0y4SmdwGIKUQPZavpeLZ5hd1JJviu0co1EJdYhS/CyygzlGP91W9oK
 9STtvM674k9vbfiFemapwlbOj3bHw4r/3nTLXHrbeFG/rC+dMvwp5e+WKQOxmifL/4Ii
 4lPrIDAmH+qXJ8FUhAPi2n05f0ARx6dcVlvUlsWIStr3YbzCsT3IafgwKUzEmmMfJmuU
 orL6e1r6L7WR5Z3M3rW++OxPd83Seo56/Vfm1P6kHqLODU86Pg1Bb2UuTu7LUrA4cUbn
 6hApqoIfQp2MM7uZiBkH0kuo5Hp6GQodewY6BYbjs8sBTiC19gxytG3uRJ0rXDk5FTas
 IUBQ==
X-Gm-Message-State: APjAAAXjVh6gjRrEsK2Y/JeY1pLBtGb056KHyqtFce2oOl51BWa2Fp9j
 TfQiM/Cq9LOfCstZf4Ri6uIcAGo5U3clbo1fSTY+UA==
X-Google-Smtp-Source: APXvYqy3cM3G4sEhNfae543jHvTru3701oHOarSu8o2b+DSlty1Msso0CCp/318+hpi0hl/RQfmRR/RuYegkucCEjo0=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr10491095otk.232.1561218244315; 
 Sat, 22 Jun 2019 08:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <1561110888-14022-1-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1561110888-14022-1-git-send-email-aleksandar.markovic@rt-rk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Jun 2019 16:43:53 +0100
Message-ID: <CAFEAcA84hjRTbCXQ_Bk3xeQJq-VmgrRPniD2iTVmMjjthow_tA@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::333
Subject: Re: [Qemu-devel] [PULL 00/10] MIPS queue for June 21st, 2019
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 Jun 2019 at 10:54, Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
>
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>
> The following changes since commit 33d609990621dea6c7d056c86f707b8811320ac1:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2019-06-18 17:00:52 +0100)
>
> are available in the git repository at:
>
>   https://github.com/AMarkovic/qemu tags/mips-queue-jun-21-2019
>
> for you to fetch changes up to 14f5d874bcd533054648bb7cc767c7169eaf2f1c:
>
>   target/mips: Fix emulation of ILVR.<B|H|W> on big endian host (2019-06-21 11:31:13 +0200)
>
> ----------------------------------------------------------------
> MIPS queue for June 21st, 2019
>
> Highlights:
>
>   - minor MAINTAINERS cleaups
>   - minor translate.c style cleanups
>   - updates of MSA TCG tests
>   - fixes for some big-endian-host MSA problems
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

