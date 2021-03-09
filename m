Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8933322CD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:17:11 +0100 (CET)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZQM-0003VW-JH
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJZOe-0002uo-Eg
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:15:24 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJZOc-0006WT-Di
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:15:24 -0500
Received: by mail-ed1-x535.google.com with SMTP id p1so19069822edy.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DwGfOTfHnSJEJcSNZYfHcLrCAS7nCYkm/Ru8TC/oGHQ=;
 b=bzwmxc5o9XKC6oa+FSV5WZfHa7JTGTPeMERSkBRcYVu1PPGyk4OWtqAQpQQEb9F7wU
 BJI7rzbJY06vyqCKbIC0yhiWAh9nDOIKsk4xHZSokh2N8otMWBRA30LklrVW6IAL6K+2
 jnx2bR7PfImEp+JHmigSLHC7YRusxBamfrxVdNCl3uW/ORFgWaElz1FTk0XtqetVmy0x
 lyHD7po+gTyQwF0IUhzeP63WxO2VOggo9p4dTamf0wFr/KULI7AcPvObmLjcoRvXRAdf
 KCK6Jte05CdLO4xeXN+AHd1Kdb73ydUc/tdwrhWnVmaPx7oJvMyEEDG0XUwNntxuJLXh
 ciqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DwGfOTfHnSJEJcSNZYfHcLrCAS7nCYkm/Ru8TC/oGHQ=;
 b=Hv79X10ffjSU+ie7oX/TMre1cfi3OpmcHsHS9JBelO0ZmnGUR+CUDnBcR0E8hzB300
 4vcU8+e368M2Na421NiSrRGzn0/9BrvLKM8d43mL8qgDsSS1y9jCp+U+Foo582gGA361
 IIql6vAPuM5eXMqhYQziOFsJTYURpPJtpivfm0C9c/q+WZ+FEbSAfsnV/JB4v8GXczhs
 j3DoPpio5F/IUTEygXerkKKJCdFy54571ktX0Ho9hGZGyi9bihf0BGwVtHWn1fIJpMqC
 80dHvKzR+sEOM2fRdDMAjwDQLmsN3vU/dM6XmKbocxPwTaqnOfsc5IrPAJPsBokEaloK
 Qf+g==
X-Gm-Message-State: AOAM530Fy1pGXk8ZLIFc5qgmss7oJlVzw65iOkF+w1aJNsRET5bU593b
 9GGHZTWUYFisHnA/PwvSxXpXqw0K6RZvyRLe3+ObXw==
X-Google-Smtp-Source: ABdhPJzswrzrNVSWfDP2vVrHfCImF1494fBIMxkraBPa1Ac+C+697aYhk9Z/8YG34pNAkSHhXAbI4qRn73iKxvhNCEU=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr3174678edv.44.1615284920943; 
 Tue, 09 Mar 2021 02:15:20 -0800 (PST)
MIME-Version: 1.0
References: <20210308224023.75187-1-imp@bsdimp.com>
In-Reply-To: <20210308224023.75187-1-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 10:15:04 +0000
Message-ID: <CAFEAcA9gOZyk_bXzt+GupOxD_gNaw3H5t7nFOM-AgR7fKo-fmw@mail.gmail.com>
Subject: Re: [PATCH v3] bsd-user: Add new maintainers
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 22:43, Warner Losh <imp@bsdimp.com> wrote:
>
> The FreeBSD project has a number of enhancements to bsd-user. These changes have
> evolved over the past 10 year, and aren't currently updated to the latest
> version of qemu due to fluxuations in staffing causing us to fall behind in the
> past. We're working on porting all the changes forward and contributing all the
> changes back to qemu. Add myself as maintainer and Kyle Evans as a reviewer for
> changes. In addition, add a pointer to our github repo in the interim while this
> work is ongoing.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26c9454823..ec0e935038 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2896,9 +2896,12 @@ F: thunk.c
>  F: accel/tcg/user-exec*.c
>
>  BSD user
> -S: Orphan
> +M: Warner Losh <imp@bsdimp.com>
> +R: Kyle Evans <kevans@freebsd.org>
> +S: Maintained
>  F: bsd-user/
>  F: default-configs/targets/*-bsd-user.mak
> +T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
>
>  Linux user
>  M: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

