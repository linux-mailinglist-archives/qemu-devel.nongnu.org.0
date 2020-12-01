Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A802CA0C3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:03:37 +0100 (CET)
Received: from localhost ([::1]:51064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3RY-0006l9-8B
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3Q3-0005OZ-7M
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:02:03 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3Q1-0004q9-75
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:02:02 -0500
Received: by mail-ed1-x543.google.com with SMTP id q3so2545092edr.12
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pbMXNo0ESLK2TC4+ZsDk8V5G8dIaJKcSo5wTxxxScHU=;
 b=A+uEEXsTZaP42tebnCDaWuDAg+6VbLQdu9tSRsRkED92XUkyiIU1pQEQJMTf3frjkl
 T0efaNtl518IOMl4+Nk6BZe4yxBp6GHvWT8JQXS7B0iJaIq8ELT3W8yzkswYnNe9G+8Z
 tXbDiUvQUnTGWHgYrDaBme8LiHjt3Gk+w+7kDXK2EtOl8Sdl22kv6JWPQD44pHQNxHNb
 lU5YS6vjqdG0QkGPAsA8wsVLI5Bh68aC4HBsFb9U8n5BxFwzUkGg/UClfFOJEnr/m1T1
 /Qtzrgq+IdkjlzSPLjWt1JghFbS3pvi0TFTQg7w9t/STSDDt+K0Dh3nkw/K9BcoEp3Nt
 DlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pbMXNo0ESLK2TC4+ZsDk8V5G8dIaJKcSo5wTxxxScHU=;
 b=FmhSqoXdehr/F60WcMCmbFOuDojBIu7lVJFPBVqwGLgwbr4tyXQo8htb17/KPYR/vs
 0KZbaZHBebVdGvp02yc8oFQagOHi32khwOn9+V5NsQzI0FI7FKjQ3C1cY6Ku6janJ6Gv
 ZRRRqax1I0qzA4DlZquF2VumE47Tf3x+v9JzMThaotwgB/ssUecmqmzjNfMp6A/XX+WG
 caZUGoOnYI4ic7qrFQVZIGcyjcFGkdLVNFpk+MFQELb+rJ23sbQurLtruLYGnIICZq3d
 IyyoMD/viBqsawMnpYNe8sXzVLhTn0KyZVhQNZHIlwAwsvXmxwjDXqJ3ZGzSkPYJnEPi
 psXA==
X-Gm-Message-State: AOAM530xEP3DHLLf/WsGM9AcqRIMpGgtQCOWJICK41/G7kihwGTyKZJc
 U20Oto7XFQXIErsX64BxFIitSxCCbuG/Looo0/7PLQ==
X-Google-Smtp-Source: ABdhPJyxyIAGUQ2eMLcNZvZtBlUn93olrEKFKrcBqcHYKm268AclTc0SRwJszrsee0ukroB+o3NXm035f1GpS/C/OUo=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr2433772edb.100.1606820519616; 
 Tue, 01 Dec 2020 03:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20201201103502.4024573-1-pbonzini@redhat.com>
 <20201201103502.4024573-2-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-2-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 11:01:48 +0000
Message-ID: <CAFEAcA8xvU3Cg0gwZM10riw3znHNyxwNNJ-0bB2Johip05bh-g@mail.gmail.com>
Subject: Re: [PATCH v2 01/32] docs: temporarily disable the kernel-doc
 extension
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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

On Tue, 1 Dec 2020 at 10:35, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Preserve bisectability while we update scripts/kernel-doc from Linux.
> Without this patch, building with Sphinx 3 would break while we
> revert our own Sphinx 3 support and replace it with Linux's.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/sphinx/kerneldoc.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/docs/sphinx/kerneldoc.py b/docs/sphinx/kerneldoc.py
> index 3ac277d162..9124fcbff1 100644
> --- a/docs/sphinx/kerneldoc.py
> +++ b/docs/sphinx/kerneldoc.py
> @@ -75,6 +75,9 @@ class KernelDocDirective(Directive):
>          # Tell sphinx of the dependency
>          env.note_dependency(os.path.abspath(filename))
>
> +        # Disabled temporarily while scripts/kernel-doc is updated
> +        return []
> +
>          tab_width = self.options.get('tab-width', self.state.document.settings.tab_width)
>
>          # FIXME: make this nicer and more robust against errors

Oh, this is nicer than having to comment out every use of the extension :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

