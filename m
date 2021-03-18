Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEC8340BA6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:24:00 +0100 (CET)
Received: from localhost ([::1]:59186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwNK-0004BA-Md
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwAz-0001nQ-R7
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:11:13 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwAu-0000NX-FP
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:11:13 -0400
Received: by mail-ed1-x533.google.com with SMTP id y6so7628184eds.1
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dUqcREhOatYDu7zUqnyAotzWIQrRaoH1lj//xKihv4E=;
 b=RmV8cpEddZcz79opG/SPlH0y6SQDhbtqkZVtXKc9bTyITPZfih6mKdtLkboQG6aQdm
 avuBdw9tPaUWqvKrgls2M9b1W5gy18XFShNTEW9wDXbRIoJlW3I/XCkWHIDGo5KHGANn
 8Tq7iFZAOQmRRmlum3SaCEOnNUUF3Te8F8f8su6sa3SczJKRnR6Zn4QAtVvbMLoFSe9G
 quAMomLdKWIAa0zpnmX4qqtPf+vwmRsHStlcuosRqnFxpDnKR8FjLHeqG6kutl3u0fpa
 6S1kKYLoRfYRjlI2tfLarc7A4glgHCTo5Bk7m07exggSOaUR5cHXY3uROZipLhD5EYMr
 9aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dUqcREhOatYDu7zUqnyAotzWIQrRaoH1lj//xKihv4E=;
 b=iJ+7LSH45d4hp4eo/S0B0kBW8oQI1eJghvzI5w4UhlTM5YLcbC9NgcJVvm5rO09I//
 Dk2O7ZRUm8Vn40KwRs9V2vn2mIpRESRMl/uoYQ9xLJI+i615WJYtkvNN6VtBMXfdq+dd
 MWuTDABOlkBmqCSqtoT4b8AqxiBEdRWDCC8WsyfwSb6JyWnqefrLjfaPFfyiJfit1mQR
 Oyo6x+ozX2ohcLcquNG+rRhlrgNIhAKmD0VnNZhCWUzyazxghk5toc6OSO9+NHTkEDnC
 M40tifX06vhCZVtI4MVD7MyoCcHQITspKjTYbV57BhkSAsRW6TgZ6XPRVSiAMmaZjiZM
 wQgg==
X-Gm-Message-State: AOAM530dCQNjVlkgyVWobQ8GrFb5+0wXawC5d7jzQ0TCLPvZ4WT28PG2
 SijwOZDyC4vcTf49Vqc8cFaV+iD/7c+6Jo52vbKFnA==
X-Google-Smtp-Source: ABdhPJw65zOjXJKVTMSIrR3zBwsXph+7QLsRWImmznC09fCgcpMaHlY9sHyPO3Hjm1JNE+sNqVOVe+bhRYUe0PNoDzw=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr4956404edb.204.1616087465948; 
 Thu, 18 Mar 2021 10:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210317072216.16316-1-alex.bennee@linaro.org>
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 17:10:41 +0000
Message-ID: <CAFEAcA9nSK=4R4d8tpFnj9o9aAV3Y-q+0hAABeEQZW7gH5d+Xg@mail.gmail.com>
Subject: Re: [PULL v2 00/15] misc fixes (strtoz, plugins, guest-loader)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 07:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Apologies for the delay, it took several swings at the CI to get a
> clean pass. I've dropped the SYS_HEAPINFO and final kernel-doc
> integration patch for now. I've also nabbed rth's strtoz fix although
> that is also in another 1 change PR he submitted earlier.
>
> The following changes since commit 5b7f5586d182b0cafb1f8d558992a14763e295=
3e:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210315-pull-req=
uest' into staging (2021-03-16 13:17:54 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-misc-6.0-updates-170321-2
>
> for you to fetch changes up to 9e7118023fda7c29016038e2292d4d14129b63da:
>
>   hw/core: Only build guest-loader if libfdt is available (2021-03-17 07:=
17:46 +0000)
>
> ----------------------------------------------------------------
> Final fixes for 6.0
>
>   - plugins physical address changes
>   - syscall tracking plugin
>   - plugin kernel-doc comments (without integration)
>   - libfdt build fix for guest-loader
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

