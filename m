Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6C41DCB1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 16:50:55 +0200 (CEST)
Received: from localhost ([::1]:47558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxOg-0001JJ-6Z
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 10:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxMZ-0000bw-4M
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:48:43 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxMX-0001XU-8q
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:48:42 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q2so649550wrc.4
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0CaKVRCdvrgXYwSJ5KwcectnyY0wUxU/m7qWIqjA8tE=;
 b=xCPRIzKaMw/+RzfdDGK9Puz0PCznYpjZSD2C05t1e0WhHJSFMm7PmWbl5GLbevdI1V
 zuVRF6dTQ/yT7S4AgzUG6skV0+2IdboKtD8ETXBLr+4TMHPExqD6Bs685bepSRmmpo5c
 VFb6ip9+cocZ9zDippsRXsrTdhY3lKXL5dyKATaUP7GA52APaNtWDQUsByAY+/+9i9nl
 waQtPNAjNmG3uADeuVKB4G/o0cqCJewZGOfAMHu25h3cTKndYvwejfqjj40ahHGETjxc
 YZJSL+6CTyRCgl57RrQBcADJA8zRGvkOYaDFeGt29XYgxWcecrvpdr+6nF5R2YB7eh0T
 BXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0CaKVRCdvrgXYwSJ5KwcectnyY0wUxU/m7qWIqjA8tE=;
 b=w8SJz+B+qGre4q81/tgRWJYtzlTG4kbZTxsUwiDuCoR1kIi8PXQPm1ia2aUkRSVMPM
 AI7MyWYIN9z/1VColS9LQLM4IyAoGVKJ+G8hw72qVCl+n3umBCkultgFtXVcPn2Wc/jO
 TL5vUbrm22QqeN7oHIMjrpGtpL+BfQWVJp3Mf1gf5yV9oQl54WRqAurv3cKdrwIe+A50
 TKRbsNv5IdhVpgJPpX74m6p2OTzUu5ubPQMrwS0UA/XG/EfbnwwHuSZmBWdji1qnhCTw
 yzsYk2TSfIvvBgge35/qG9SWMKaFH6JpKDe23Cs+zyFAul2Nm7cD+NEoc4gQFz++77Pw
 0KiQ==
X-Gm-Message-State: AOAM531MpAyM+TuMoJtWgjXcIEiO8sXE7uX2asDP9ZoYH0/Q86HuaOdS
 vUownN+adSMq+dvnuRQUGsyQCz5RTt7Iys2i+MLUxA==
X-Google-Smtp-Source: ABdhPJzI21ikPSGGsJOutATLTdINyNZ0tSwP8dJPTdv8LgwDVLqbzd8jS4rWXsPfkRioO0tk2MyWhC6+41CROV0BuKs=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr6582664wrw.376.1633013319715; 
 Thu, 30 Sep 2021 07:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210930133250.181156-1-pbonzini@redhat.com>
 <20210930133250.181156-2-pbonzini@redhat.com>
In-Reply-To: <20210930133250.181156-2-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 15:47:46 +0100
Message-ID: <CAFEAcA_BPE47ibbkobDsa2qH3yTOKd_iU3YjR4t452wN-PzDaQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] docs: name included files ".rst.inc"
To: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

On Thu, 30 Sept 2021 at 14:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -8,6 +8,6 @@ found at::
>
>     https://wiki.qemu.org/Testing/CI
>
> -.. include:: ci-definitions.rst
> -.. include:: ci-jobs.rst
> -.. include:: ci-runners.rst
> +.. include:: ci-definitions.rst.inc
> +.. include:: ci-jobs.rst.inc
> +.. include:: ci-runners.rst.inc

Why are these includes anyway? I think we should either make them
proper separate documents (pulled in via a toctree), or just fold
the whole thing into a single file if we think it should only be
one page. I think it's probably better to reserve the include
directive for places where we really do need to textually pull in
another file, ie where we have the same text in several documents.

thanks
-- PMM

