Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D323D0C0D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:13:30 +0200 (CEST)
Received: from localhost ([::1]:60448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69EH-0004Na-PZ
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m693S-0004Md-Hg
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:02:18 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m693Q-0007xB-KH
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:02:18 -0400
Received: by mail-ej1-x62b.google.com with SMTP id c17so2322561ejk.13
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w4XO+C+R+93hft8r2hoZp4z3Hr+MJ+xC4WUpLSvu3yY=;
 b=wYTjNDH602MXjrZPjvhoSE4/UBvh13NVHOvfsWdFg1oyUpYFluaXxx5+u38LPGQcMM
 q+UQyUZdkxqWAPUkwDsemuJSmlAZHBTVj9O1dFpr9hJxDaY1Xwn5bRlKWiXpLCwaWuLY
 RA9qa9jyCz3a6AMacJ7Mmbp6hAu/uymONHpX8A2St3x+pQJq4JHUvn48cu7W3v5VjKTp
 TRELIWRwm0e72wUejsWrLuAUNxF+nlnr3zx3rWACPiUPsxkC0NJNB13aJ2hpWu2iaSBH
 G0fArrRwV4RgzR7DipPl7V9mlmOwzCGfsBeOQj7DqgeZDBFgoyw+n0jgIDQnW3B2ku20
 NuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w4XO+C+R+93hft8r2hoZp4z3Hr+MJ+xC4WUpLSvu3yY=;
 b=e6u/8Zj8sAxuJFWgOCwdTjUV0g0CSIuhPrxErYfdItKqemNwAZ09naZd1keKMZrIoU
 5mMblbIaPSnb8/7SOHtGRtBtaAQkF7ca8Cr+MnDHDQ2vZG+mJPPApSaiQhQizRmJ+0/K
 AH0CCXHKEjoNHou0LYUWX0uA8vAIRofC4Fj095EsRcvjxKtTQzhuzc3fDzFrSZT0V7sW
 BOschl8mzmanoOLR+dY6UbaKl26tjjHNiUP8ityTd9YzMcc3VJk8Rs8BHIeDCtCSPW0i
 NZxKIfRkwI+RbAf8bC9j0cg4TTg7tGOaGoorMY/hd7xlu2WHAeEBGS2Y8ECi0NIsfWq/
 AxMg==
X-Gm-Message-State: AOAM530t9EArihJWqMy+2lYa3ZXUZf+Hrsbm2i7mFNxf+LcBlkHGNVlG
 PximZvfSuARxuMtKzFKG1U84904l3nn27SxigaqHKg==
X-Google-Smtp-Source: ABdhPJxYmQtyR9JzVQWXVtUmWxljGN7QY6Qy2i8DhCL7p+gnlbyMo3TLMWEe67Id45yyaKMufHUWYMEC/uXgENphhHk=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr37063531ejy.407.1626861735065; 
 Wed, 21 Jul 2021 03:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210720154141.3919817-1-philmd@redhat.com>
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jul 2021 11:01:34 +0100
Message-ID: <CAFEAcA8ZQUQe4z0M5JBue2u52vROK5Q=1HJF95WDxmC38LoYZQ@mail.gmail.com>
Subject: Re: [PULL 00/17] Kconfig patches for 2021-07-20
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Tue, 20 Jul 2021 at 16:43, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> The following changes since commit 7457b407edd6e8555e4b46488aab2f13959fcc=
f8:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-20=
21-07-19' into staging (2021-07-19 11:34:08 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/kconfig-20210720
>
> for you to fetch changes up to 3fac1da88f95f5338bb79420682427ab06adf99e:
>
>   hw/tricore: fix inclusion of tricore_testboard (2021-07-20 17:17:07 +02=
00)
>
> ----------------------------------------------------------------
> Kconfig patches queue
>
> Various Kconfig patches collected during v6.1 development cycle.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

