Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6852A1A8D
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Oct 2020 21:33:48 +0100 (CET)
Received: from localhost ([::1]:48052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYxZL-0005OX-Gw
	for lists+qemu-devel@lfdr.de; Sat, 31 Oct 2020 16:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYxYX-0004qk-42
 for qemu-devel@nongnu.org; Sat, 31 Oct 2020 16:32:57 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYxYV-0000hS-AE
 for qemu-devel@nongnu.org; Sat, 31 Oct 2020 16:32:56 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b9so7699edu.10
 for <qemu-devel@nongnu.org>; Sat, 31 Oct 2020 13:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x8ji8aPm95xZetcjBhRyIcuBTLoTcYa7M16ogiki1sE=;
 b=kn3GiYm0YwYqGM3+u1v5VpL6LZHg4xe/56gP2qYX8IhnYKGqVR8hgwh7gzCo1znWJb
 Bj4liEWeEQYOdFi4kZBj9nXtLiERYk/LdeJDH18Tz41N+WgfFsBDshNcAy24uPMZ1q08
 l3bEBU6Ss0uzuXKf1MXGYJmEpr4thXmZhI9YAiDHAL62buchqzWllSYTXGpp++NKkZCE
 dx2/wjPu0Ft/pt242wOu4yiZThoF3oWaAG10mqf3EslSAbJwDRywFQfbR3SJnv0flL1j
 6ZqmBnMML5CASQvufoC3qJ3mwOSHtNCrUQY8TZRqJZSbPidrrVREp2THXLu2KrqgUvI+
 hqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x8ji8aPm95xZetcjBhRyIcuBTLoTcYa7M16ogiki1sE=;
 b=FDpEzRf+2LwuNHF3xZjycd3Y95CgoNCu1cYBHU4Yr5up4IAPH/BYkrTY8hPFBI2BpY
 Ieee9oN949awZi0MfovSw4gsEjQP1U+B30uDQ3MlZ+ZeVNbeqvcdUb9RtfzKafZ8GZ0Q
 HhrXc7FgxMOWS99ykYmQRWJbwq2AE4nKHBwUVxheTlBKGrZuXaQdYSVvcyGsOHPCHVNe
 420C18ReGZPmxJFy9Z1LB2qdrOH+PmM9ih7qWZ48iSTc20YbOhEvwPlOIdkeVZHTc8wK
 WtQxd0b2nKZTV9eys2c36Bt1YGiL5woumJYd10uLC8zpqCH+g7NncRv8asVO7uL/Y/5s
 2mrw==
X-Gm-Message-State: AOAM532T3NbPDpnCOu+01x2CHJiIPnycnjPlblms02HWTBB+wUmlkjqx
 +lnKRZesmLNdmFqEk0P11QwPgmGToy6tGSn7sypFpg==
X-Google-Smtp-Source: ABdhPJytnFIbFGcWIsLcGCQqTLOSlpJKmdhROY7+7DKki5UPULTI4XWfULTwefl7GGHzoQMqTTmD8eaFDx+fCEcvC8U=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr9468642edb.52.1604176373712; 
 Sat, 31 Oct 2020 13:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201029100119.30696-1-berrange@redhat.com>
In-Reply-To: <20201029100119.30696-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 31 Oct 2020 20:32:42 +0000
Message-ID: <CAFEAcA89adSEnxTTvMB_fN9HeFGqxyRyPyreocjFHO6sLHOS7w@mail.gmail.com>
Subject: Re: [PULL 0/5] Misc next patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Oct 2020 at 10:04, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit bbc48d2bcb9711614fbe751c2c5ae13e172fbc=
a8:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/renesas-202010=
27' =3D
> into staging (2020-10-28 16:25:31 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/misc-next-pull-request
>
> for you to fetch changes up to dfc00eb7dea43bfb6d4a2ba38c4f6bc9745f3729:
>
>   util: include the target address in socket connect failures (2020-10-29=
 09:=3D
> 57:37 +0000)
>
> ----------------------------------------------------------------
> Misc fixes
>
>  * Improve socket cnnection failure error reporting
>  * Fix LGPL version number
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

