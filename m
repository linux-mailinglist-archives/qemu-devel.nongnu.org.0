Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0358495FAE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 15:15:30 +0200 (CEST)
Received: from localhost ([::1]:37382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i03yz-0007oi-2A
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 09:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41129)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i03xq-0007Ng-91
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 09:14:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i03xo-0004HS-Td
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 09:14:17 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:33875)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i03xo-0004H6-OC
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 09:14:16 -0400
Received: by mail-ot1-x330.google.com with SMTP id c7so4963613otp.1
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 06:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L+MN2gEe+BuDG/jJZ1I/A9WIoqAn/KWdf+rhAv+G5/I=;
 b=Fs//lMa1OzJrSDJy4UkHBJg3vuYgTuvrGPeSnPYT5nXp2pioVgxDmhMj2tsMpZQcrG
 BEim6IsahTVqQIBWbTlkT8/NxnK7xkLmxToEjsibZRzGAArsPn64dX9sHAGogqzMDkkg
 mG/ybtT4+7HUFx0PH0Kutaz/uSQxGZa8ynbDn+5+WhlmViyLh/q6s2hgk0lFdGma9NQX
 ZhS9oiWtRH4QDi/3RM64CfRk+PpR2oe+YZsuuoQJLk1yE0c8VawHkn79GA81Zg+v4QZO
 1UcomWvZFmx0InN+JOu2z142JcWp5D9Q16yEe7iS5ssZkSowevb0am5XBmaH1RbrTO97
 MyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L+MN2gEe+BuDG/jJZ1I/A9WIoqAn/KWdf+rhAv+G5/I=;
 b=dAT2dowDx6bfcvGpacWs1lDmi0/V1h9AH+0lvALtGBlsrvyzYfhp3/NLzkCvr957VT
 WklElMrcPFUaqLCHi6rDHpc0UqPOyHXhXZ1hWy5Ht7IoHGOEZRPoUHsQ4fRclwi+SdE9
 TcuV11w9IkQy6kQ2gM8nnZR98hNn8g/hkKsyYQBswuf+o1m21gxKmABiAA+Ibzh9cayc
 dAaAe04DfP83Rxb6n4MZKOfURMm+IRhZJUAz+p4271T0WI5knC0JIJC/eOl4YmI1Xznk
 DWMmhryuJI2bIz1zh1E9LUfLovaQzf/6WeK5VFJpO7aVRF+tcbxwqqkquGNLxJO168DD
 j/pw==
X-Gm-Message-State: APjAAAXv/oQNdblVLqv+rI2ZKY9ngb9tM0zAdN8LUlF90rtfVywILwxU
 L9UXq0MhuJ9IzeL7Fj0xiz7SFGMaOnxT6QHAwq4hKQ==
X-Google-Smtp-Source: APXvYqyMni49UaYNCJRfDCQZf3g3AXt8JO/qS+TuJANU2Upsqal7x7aZbZQPML+nNqKcRdXwbCCEoG0nTsO/43XZSQw=
X-Received: by 2002:a9d:4817:: with SMTP id c23mr20891465otf.97.1566306856021; 
 Tue, 20 Aug 2019 06:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <1566283083-21838-1-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1566283083-21838-1-git-send-email-aleksandar.markovic@rt-rk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Aug 2019 14:14:05 +0100
Message-ID: <CAFEAcA-CP3TfGzc7TZ7Kwb27y09qpvhjvWSwsijWRdpYLKBnAQ@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
Subject: Re: [Qemu-devel] [PULL 00/11] MIPS queue for August 20th, 2019
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

On Tue, 20 Aug 2019 at 07:38, Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
>
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>
> The following changes since commit 50d69ee0d82378c7c21f482492dacfe0916b4863:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-softfloat-headers-190819-1' into staging (2019-08-19 15:58:01 +0100)
>
> are available in the git repository at:
>
>   https://github.com/AMarkovic/qemu tags/mips-queue-aug-20-2019
>
> for you to fetch changes up to 6eed53f71b33c3716e5d94eba506e4706d8dace8:
>
>   target/mips: tests/tcg: Fix target configurations for MSA tests (2019-08-19 19:53:37 +0200)
>
> ----------------------------------------------------------------
>
> MIPS queue for August 20th, 2019
>
> Highlights:
>
>   - this pull request consists of selected patches from "target/mips:
>     Misc patches for 4.2" series; most of them are checkpatch cleanups,
>     and the rest are improvements of MSA TCG tests
>
> Note:
>
>   - an instance of checkpatch warning on updating MAINTAINERS for a patch
>     can be ignored
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

