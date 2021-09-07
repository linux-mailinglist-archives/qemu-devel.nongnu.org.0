Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BF402CA5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:10:38 +0200 (CEST)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdgD-0006bC-37
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdee-0004KE-Hi
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:09:00 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdec-0005sU-4n
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:09:00 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v10so15267772wrd.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 09:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UsSWuji2N7ufZOKhk2JvmVZauV9XbuaIjdQ2MmYW+tU=;
 b=mYmMc1xQLCLleRor20CUh7uzE7iyGGni2r07qOCVIANQ+tULoHLTWqyMSFn36dHzWl
 g9bglaIGjF9mH8pQ75rK+sjbBDCxtBFqjy54YreBe+Rmy+UtU2BTA+TinoreUDp7xRsp
 uED0vR0QmHxqWJI0YGpqRcyP7zn6YdjvSRFV0McpdbZ65MBM4HbQw8EYbyA3Jn+xjy6e
 YaVC5qpDnEXswZkk8TR/blc3tc9MbwGT+ciTB9ZDzgn76EmTTNJ1sy+JIaQgOYABCtBU
 3yeCAQZEzBUSbk+fmov46mSjVAUG3M2EJypFuhfeyxwiJCo2w+SqUPqgCDriEL8dFiIU
 HxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UsSWuji2N7ufZOKhk2JvmVZauV9XbuaIjdQ2MmYW+tU=;
 b=MlTBMkcHO0Gk3sj7QEOK5ArwtKi+bqOsL6S7B7nMouWxO2sda5kYslFi5toZcSNClI
 n13H9gxKabKFK8PBadAJozZ0IGBTQU8xnYNppJ8XVoJdIIuyqXf23y73ExsVq4gZ/3Jr
 GzXFeoc6cVn9lFNH8gfojjVM7uUXUD6mzoXY7IMGNq4+OLyeiN0OBJTDxcoBcroIBWBW
 qxjBUaS0s0AiGaMToIuFozpYu/ah21x1JFY4bqvhoSEyZT60Z0744BbhKiJnVfqSdAEX
 AmyAY/eNTyPUicMH0+idxGig7XgVp9NQhdOXalEuY3Lw7akJO+vnZleCv0MS34xgXUXS
 AvEw==
X-Gm-Message-State: AOAM531sS3LuC9bF5026fIcxcp6N8IzUaHaSshP1o4Mb/AL0kSfx2oWf
 jUWyfmW3/giNO4hDZUZ9cZYTauywkuQVp9bNaoUqFQ==
X-Google-Smtp-Source: ABdhPJyEPCXhGSyChTETcVcBfuJTZjCxCoZZNz0OPj/xuffJZCF6vSHLUGh2fgq3bz5zRedop+uOQ6+Nl2mN3C9lBpw=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr19092550wrr.376.1631030935639; 
 Tue, 07 Sep 2021 09:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210907155641.197844-1-pbonzini@redhat.com>
 <20210907155641.197844-2-pbonzini@redhat.com>
In-Reply-To: <20210907155641.197844-2-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 17:08:06 +0100
Message-ID: <CAFEAcA9pw1WXbBXGjMYBLVuZp=r_8-cKOOs0_pz=-FFQL=1udw@mail.gmail.com>
Subject: Re: [PATCH 1/5] docs: standardize book titles to === with overline
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

On Tue, 7 Sept 2021 at 16:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Documents within a Sphinx manual are separate files and therefore can use
> different conventions for headings.  However, keeping some consistency is
> useful so that included files are easy to get right.
>
> This patch uses a standard heading format for book titles, so that it is
> obvious when a file sits at the top level toctree of a book or man page.
> The heading is irrelevant for man pages, but keep it consistent as well.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

> --- a/docs/system/qemu-manpage.rst
> +++ b/docs/system/qemu-manpage.rst
> @@ -6,8 +6,9 @@
>     parts of the documentation that go in the manpage as well as the
>     HTML manual.
>
> -Title
> -=====
> +=======================
> +QEMU User Documentation
> +=======================

NB that this text is never rendered anywhere (unless you deliberately
edit URLs to go and look at
https://qemu-project.gitlab.io/qemu/system/qemu-manpage.html
which is only generated because AFAIK there is no way to tell
Sphinx "only render this file for this output builder type").

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

