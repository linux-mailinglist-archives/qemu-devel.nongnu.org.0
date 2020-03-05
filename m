Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A5B17A800
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 15:45:40 +0100 (CET)
Received: from localhost ([::1]:50536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9rkp-0005fV-EJ
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 09:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rgL-00079t-A8
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:41:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rgI-0003Ml-VP
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:41:01 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:36802)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9rgI-0003Ll-P2
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:40:58 -0500
Received: by mail-ot1-x32d.google.com with SMTP id j14so5892063otq.3
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 06:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D6vD/BGwYDylDk/vNGZM2seMTRBYQaq3Klv4RkFKxvM=;
 b=SGCn/Oh+TnQDIGEk0YngKuAugUrJyoZ5mhpfmJOfTNn0lTE86/+n7C4072KJEMJsYX
 LFmRjow+w0f16Y7EdrJXtPcsvgR6bL/yWGreNvJWjJoxGIIx1lDhPPSVJ3tsiLVacbjD
 usiCZKY6h8w1awgIiyw8Gqh848wGUD/ZYzwqUyLzdSuOkPsgXb1mlmcu1Mt2EJsaM9To
 JDrC8xmBVsFmlVrXtibLsTPBjcLo9dhhLOEse1PSH69yFbmqh5kUTvHIN/QSI6htHGF1
 SegumCxNe0Kj2dA1//41tgBwJC0xAl3PAR3jA+i6kWnuRUO6crhb+YdL7OjjkbPc6JRV
 y1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D6vD/BGwYDylDk/vNGZM2seMTRBYQaq3Klv4RkFKxvM=;
 b=HMBY9H1q6VxiygPSnidkywRqe49yvj2Y9FRJFyJ7Jz+ueTbDfUEWGl211o+7VC9Ka4
 OsF74vm2Jhd71MoDQCuhqbOS7183Fe/5UCVijtMCGGI5hs4pt/r+Ot5PW4hu3rSfIajE
 UaZYXJ/XaVJpfqjbaicSDMV1QfzglFKCA67vroIvLqSkYCZdDyAcb2rVaCM+kkOM7XXO
 441NRTfOvBxmApM5aB+mdSHPJLlwcn7RzzYew3B5YIaq3I0ZXZl1SqnbnLiBDW4WfQyN
 JYXB2Y7lLhXs02zeDIz/VjLUi/r7V7+YcIQ3yBSXyZbcs8PivZXbO8/j9O6f42WpkcHA
 Cfmg==
X-Gm-Message-State: ANhLgQ2uqiEV4EN+y/sdcLkv9yE0wKYlYMvWwj+l+wLRBSRYpooDKpZE
 QErjBZ5XEQ4OnCU5pCqSkbDsEKZpFFnJ9xU2LjtzYw==
X-Google-Smtp-Source: ADFU+vvF7JApbA6/vvJB9PXdavpvB9sjfjpNiAHK9JGYnOMyVYM0Vv61cfUHca94q7WxqgJnZpH8z63OeTtbdETIAoY=
X-Received: by 2002:a05:6830:30ac:: with SMTP id
 g12mr5614302ots.221.1583419257500; 
 Thu, 05 Mar 2020 06:40:57 -0800 (PST)
MIME-Version: 1.0
References: <20200304100154.14822-1-alex.bennee@linaro.org>
In-Reply-To: <20200304100154.14822-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2020 14:40:46 +0000
Message-ID: <CAFEAcA_g6vusM99LxD=rakuABaDO5BXmktsiwYJmyxNqGsHasg@mail.gmail.com>
Subject: Re: [PULL 0/9] testing updates (tests/vm and acceptance tweaks)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32d
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

On Wed, 4 Mar 2020 at 10:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit abfa865014ab17941eb1fcb7cc2fa293a25843=
c4:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiof=
s-20200303' into staging (2020-03-03 15:20:12 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-040320-1
>
> for you to fetch changes up to c2e09ad8cdf4705a91eb6c20a9f3d4d90a0f46aa:
>
>   travis.yml: install python3 numpy and opencv libraries (2020-03-04 09:5=
7:33 +0000)
>
> ----------------------------------------------------------------
> Testing updates
>
>   - some clean-ups for tests/vm
>   - enable tools build for MacOSX
>   - bump avocado to a newer version
>   - bump travis env for avocado
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

