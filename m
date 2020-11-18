Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB342B7E7A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 14:44:00 +0100 (CET)
Received: from localhost ([::1]:45494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfNkc-00039Y-PP
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 08:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfNjT-0002jG-Q1
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:42:47 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfNjP-0004d8-Ho
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:42:46 -0500
Received: by mail-ed1-x52a.google.com with SMTP id y4so2039607edy.5
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 05:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1BEXvF3aK31h2taPda0s7YeyAyo+4UPmGJCGjZPXF0=;
 b=hV7R43lv4RMqGKCQZDhBNqE+mSUW0UHeMKp+IlkHSxBg0mB8PTMM46JcWFmvr8ZgHl
 et/RnyHrkZOKhbeJbu4wfl563uZ1XRuSCaDc7SBD0/WwaHsLwhPJnO8PRgnGlj/yPcSo
 J/7rRJd0g9lxhsRCwG19gXjEWjYcwMB0e1QhKDhLEr+sQ4RBt/SIT64U+RUu5ou3iv1h
 eQCR7PTjw7lsQqRKn44dqGcxb7lk1+m1a4LvEOs7nPsxgQDRTj4dCArM4qqp/yOiJZRx
 CaUVORW99w5X6ryLPJo0ykF5j3bgRh5le4yw3/uNpdjCO2QQlzxO4xG82veB5TnH0ZNT
 Eg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1BEXvF3aK31h2taPda0s7YeyAyo+4UPmGJCGjZPXF0=;
 b=dIYD/5G68veOwZAnZbZUYKu7j89+M+5uviPAiUQwqVtaPFjYkdXh5vyB5OFGXJgrar
 PYez9QeCVk+iBMAxYN5tYM0XIdbjwSf+O5kLijWSrGfBBI5RNVGgFSfVSo8lfYOPP/a0
 fR3y3R5ILPFAzaGfkXTNRZYkVDB2r4Rfn6UnxBbhHGCj/Jy+o+vfPrVy9mmQocNK69dh
 aDJMQ+CuhGdW1vzCX1sLKBnESotDqHbkvB4BE05xGzRsFFixGUXLp7K4+Sq6xT+fc9j7
 fxgdCVVGOiNmQon5hEkhvjuY5pBuH9Kf1c4Nqt4ma4w/dFGFIQLXf6IIOX788oTccgB0
 44TQ==
X-Gm-Message-State: AOAM5313eVD3Hyy9RlrenllnVpIi33r6D0IEKFXazUUVumgIVlUViK3o
 U9eRq9YzEKyQaZt5IDSNv8jFOeYZdj/XaacmNiYSkw==
X-Google-Smtp-Source: ABdhPJwGLzaa8xuFJeiIZe0flpPNQLKlKdH1OKSZoySirpWDVChKBn3Zh++SV4T3ihT+2D5Ozfh66D1WlysKf9JTgIg=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr26552535edb.100.1605706961366; 
 Wed, 18 Nov 2020 05:42:41 -0800 (PST)
MIME-Version: 1.0
References: <20201118101940.132594-1-pbonzini@redhat.com>
In-Reply-To: <20201118101940.132594-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Nov 2020 13:42:30 +0000
Message-ID: <CAFEAcA_eFRPPqvr_CRO7LYebWjR9AA2Fw-n2DnVJZxYD9+O6BA@mail.gmail.com>
Subject: Re: [PULL 0/7] HVF and Windows changes for QEMU 5.2-rc
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Nov 2020 at 10:21, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 66a300a107ec286725bdc943601cbd4247b82158:
>
>   Update version for v5.2.0-rc2 release (2020-11-17 22:58:10 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 29cf16db23e605769f6d89c47a1d45ef3373b88e:
>
>   buildsys: Help git-diff adding .gitattributes config file (2020-11-18 09:33:16 +0100)
>
> ----------------------------------------------------------------
> Bugfixes for HVF and Windows builds.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

