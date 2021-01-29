Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D353F30906F
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 00:06:31 +0100 (CET)
Received: from localhost ([::1]:34780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5cqU-0008Su-BM
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 18:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5cp3-0007cH-5r
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:05:01 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5cp0-0004aW-KC
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 18:05:00 -0500
Received: by mail-ej1-x629.google.com with SMTP id l9so15288695ejx.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 15:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FTx9TYcGzcPJvE3PkgVRlH08qDBzgMSXc0iFIoZ5ikA=;
 b=Eev3Wu0/RMQCwYGKcggP1q7bun0kijEcCaBKuCZ8mQHLU8VrvlVGGp0hwftAc4JwuZ
 EzmeRbGF7vP3C8eEnmmWjAP1PfSR0yMG7aFF1hXFCt1kzshGpiW0Ih+vEzUl8BY8kKkZ
 vp5whjjxRKaWptVblVawPhQF5HrR817FlxF3u0n+blmJYWGGS2T8lb3TCpQzuJ+BU3Fv
 gpS/tOHKbGL40/GtUVxi61ZNLy73f910qNCB9sNy2zXKxXeH0WaARQ4+RDYdgtOgtNdz
 PN+DRtSNZ4bPANxTS7uVeHb1GsljYTaW9w1lDEAb+bp0WTwNazERUtGbqpql9WTItqhN
 xyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FTx9TYcGzcPJvE3PkgVRlH08qDBzgMSXc0iFIoZ5ikA=;
 b=Y8kZCtZwHEEfreWOu4OosUXutnHBaANjQfMMlFfWB45KpMM2B+X6EcVAS3RAN67PPH
 KhNAvZGsXHUBw+nnPoMOicAcVPY2rcnjitWp9z4K9KJZjegUoABhd5GeQT2LnnK3rITK
 FCxj0lMNhe0XZIYIWJZM4M+1oboOguELCr56PoSORsPTeSB7hHFXpDV6JK61lpzBq+xb
 fUr4tM3mlb+mDT21I8EPo+1WfXrVaumzBpIX6rgVZYyADiMCA2ORGkb3CGFEuyl6j29R
 WAHX4mTSI6iDDg8HPfodPxs+rQ05LY/UQY+u8d4iKfQ+Or/drNdz4CsXQqqXXGgJgdww
 FQxg==
X-Gm-Message-State: AOAM531ba+R0OjxXUeRL2mjXrqeup9pA5GZtKaVCAalsaV7xcyWFS6Uh
 UlSO2sGW9CKbPnBpHVWnnc/Nd2vmLm8JS/WFlkBzRg==
X-Google-Smtp-Source: ABdhPJxbNqgvbWsP4vOJSvXtChuhG2zi4dRGS7uBcy4FHR4rlzhbLRH9nzDqEx3SP83gLw0HhZnyeLyrVCqQMg5pDx8=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr6981370ejd.250.1611961496981; 
 Fri, 29 Jan 2021 15:04:56 -0800 (PST)
MIME-Version: 1.0
References: <20210129171102.4109641-1-berrange@redhat.com>
In-Reply-To: <20210129171102.4109641-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 23:04:45 +0000
Message-ID: <CAFEAcA9Umg7M+H1vhTf1FFW7Syx+dWP=cu+=XM7oJZcV1Mg6SQ@mail.gmail.com>
Subject: Re: [PULL 00/13] Misc patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 17:27, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit 5101d00d2f1138a73344dc4833587f76d7a5fa=
5c:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6=
.0-p=3D
> ull-request' into staging (2021-01-29 10:10:43 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/misc-fixes-pull-request
>
> for you to fetch changes up to ecb98f5c7589ba8ecd15c8b1baa2ec7192e47c75:
>
>   tests: Replace deprecated ASN1 code (2021-01-29 17:07:53 +0000)
>
> ----------------------------------------------------------------
> * Replace --enable/disable-git-update with --with-git-submodules
>   to allow improved control over use of git submodules
> * Deprecate the -enable-fips option
> * Ensure docs use prefer format for bool options
> * Clarify platform support rules
> * Misc fixes to keymap conversions
> * Fix misc problems on macOS
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

