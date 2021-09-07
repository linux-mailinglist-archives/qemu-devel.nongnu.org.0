Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29426402C87
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:04:43 +0200 (CEST)
Received: from localhost ([::1]:46706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdaT-0004Qu-08
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdXD-0008Hz-Dh
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:01:20 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdXA-0000an-0K
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:01:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id q26so14277979wrc.7
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7RexAM0wfnHymCCu6dxF4RTGRPaB8ypHnIQAWKnIP0g=;
 b=CX7adskvfuv9VnNV49wteePTUiqJN/4pnt749x91GHifUH4rIpxLv5YtQhM4fdn27s
 JRMgDHYT/su1OtKGqb4T+tOQDfCOhgvqtxpy2I2loBgk/UtHeGb+zLcaP/dFwc/dwR0h
 0cy9CNcwyaCBgTM+3K8VMo2lUMeB1oE7TF+2aJZMWFjBT7QAceYudemK2a7La9eIV8D4
 isv5/ounkb6iP57mF4VTR8CcDvbOFJg2KNJ4L3GL4PT9ZzeQZZNIEZyWBoq9BZBD6dLV
 2KDxhMIwAJLd8AM/zQrL0MdvRWXrcpG3kzA6Jt+sYphlvtjXS5kqYNg7aej5/oweDLO1
 DCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7RexAM0wfnHymCCu6dxF4RTGRPaB8ypHnIQAWKnIP0g=;
 b=gsfNYd6/yxe0tKCdNvwH+vaZK0QTfIMQgNLeRIEuc0xNa+ryki/z7WGLLHhYswsDVY
 0vpzSIqM7nnO/DpOI+cHzP4WCdAUkDhefwYv7IgVQtAm68jUcoLBP7ilKr/MN+YvF85b
 yjopD1lD4Yx5Muj5NIqzpOoRp5uqrRjtha4QCCUJhHynnZjWCwAKOI7o11ODI7Y0OxKc
 7eKEoemLO+oLHLIFKZwZmwXVdpoa5ZYL3D4u/vnliZ6p3df6QSrJa3blzfejLGXlsoYV
 BbsYYY8QI5roc/cPsBiFsWsZueRCOWO43Hepx375al1+z8MOF0rKS66vaKPmDCyGdPoS
 xT/g==
X-Gm-Message-State: AOAM533dPDEz198kyBatsFOX3n29sbWYIO69EPBO7Ox1U9/rWBTy8DA7
 bn2SbcMuRY2VOWViOuP1jB+hdDBh4Bdg0Ydh89p3Tw==
X-Google-Smtp-Source: ABdhPJwRmxknCIWvYpgYSZpeZ2NG6i/FIxL8w4tnasf2XpL51Ibs+/f/MZIII1MZybeEGmw1VTrFJ/rsyl0COkGiQrA=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr19471001wrq.263.1631030474122; 
 Tue, 07 Sep 2021 09:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210907071349.116329-1-pbonzini@redhat.com>
In-Reply-To: <20210907071349.116329-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 17:00:24 +0100
Message-ID: <CAFEAcA8f5s_vukFj=BZiGTtUp2kN00kXgVXOdce6aL3X=C459g@mail.gmail.com>
Subject: Re: [PULL v3 00/36] (Mostly) x86 changes for 2021-09-06
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

On Tue, 7 Sept 2021 at 08:16, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 935efca6c246c108253b0e4e51cc87648fc7ca10:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-09-06' into staging (2021-09-06 12:38:07 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 127c76bd1aa893122a22677b991c0f31ebef7f09:
>
>   doc: Add the SGX doc (2021-09-07 08:54:57 +0200)
>
> ----------------------------------------------------------------
> * SGX support (Sean, Yang)
> * vGIF and vVMLOAD/VMSAVE support (Lara)
> * Fix LA57 support in TCG (Daniel)
>
> ----------------------------------------------------------------

New warnings during 'make check':

qemu-system-i386: warning: Unknown firmware file in legacy mode:
etc/msr_feature_control
qemu-system-x86_64: warning: Unknown firmware file in legacy mode:
etc/msr_feature_control

(not sure which qtest produced these).


ppc produced a new meson warning:

Program cp found: YES (/bin/cp)
Program cp found: YES (/bin/cp)
Program cp found: YES (/bin/cp)
Program cp found: YES (/bin/cp)
Program sphinx-build-3 sphinx-build skipped: feature docs disabled
Program python3 found: YES (/usr/bin/python3)
WARNING: Project targeting '>=0.55.0' but tried to use feature
introduced in '0.57.0': test() timeout <= 0.
Program diff found: YES (/usr/bin/diff)
Program dbus-daemon found: YES (/usr/bin/dbus-daemon)
Program /usr/bin/gdbus-codegen found: YES (/usr/bin/gdbus-codegen)
Program initrd-stress.sh found: YES
(/home/pm215/qemu/tests/migration/initrd-stress.sh)
Program xgettext found: YES (/usr/bin/xgettext)
Build targets in project: 650
WARNING: Project specifies a minimum meson_version '>=0.55.0' but uses
features which were added in newer versions:
 * 0.57.0: {'test() timeout <= 0'}



(PS: why does meson report "Program /usr/bin/python3 found: YES
(/usr/bin/python3)" and
"Program cp found: YES (/bin/cp)" so many times ??)

-- PMM

