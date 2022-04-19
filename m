Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507AE506D10
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 15:04:42 +0200 (CEST)
Received: from localhost ([::1]:51838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngnX5-0007eu-SI
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 09:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ngnUC-0005cH-7O
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 09:01:40 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:45786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ngnUA-0003Mb-GA
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 09:01:39 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id s33so3445174ybi.12
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 06:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m9UWdcW2XcdsSia2B6/AHjMYTETRk50HX/lDFGJcy24=;
 b=glZlwTE5xA2n//h00HSAZZfdq6screIYdgcQX9CttkVdqQiesFEcnmntKxj3WDIm6u
 EZhVDfkOzeu0M/aWFoK5/2+WQB2uuSWl0YWrNdbu/sY7PR/pGqPtfvkWC4KAgpKMQ3RY
 qSLsFnnmWndU5mc0DfIaF6DEn0uwqI5nH9qgwCfjHH5bFVTZ5xASVh8We9e3+bo0rJMN
 8+Ed5NBEPqMAN9L0E7f9YWH3xWgP+hRodzV1acrnFsTSHDF123TR+dM5pguIJd5+g2ju
 EPOXa/ysV2Kqa1GJpqJ+O5HWVQWq+jxqaT9dOY130tXBEjG9Awy/KtBpOh2RYV0z8rNw
 hP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9UWdcW2XcdsSia2B6/AHjMYTETRk50HX/lDFGJcy24=;
 b=WVJ7K2k+5Ubf0eW6dvp4RO0+E5BSvEZ38rhc/OUNRd/f99z73hXBDNV1QdGcEMfQab
 ahW8lt1yP80TO70CYtwPbyhBqTiMEnDYXcd3C0jVPosjvtIHL/kznM+CuWGH7DJM9QwQ
 4+ZvMGyenXBL1qFC1Dx8tt7gFAdq+JM9tIvweElCvN6/2XMkI/GJ+AJ2HksFM2/cnTF6
 igJ0GmIvNg4+yBccKElw6Rq3USuZIH4bkv7hqIthyge76fzHeD1GUBDA95KICJ8q/rD9
 WYjp/tIAyBAxKB3hFCbtqIbXB6SGPo7a0scM4khrQvmXUX74pwzslpLM3nky0XiZpBg6
 DjQw==
X-Gm-Message-State: AOAM5310POLDArXY8dHcyqlrQfWUO/96JUCScCy56qO29oVj93WjRd9S
 0m0FSI0ceqHHuNwr6dT0IzhNHOe5uggHcyl4cpRaYQ==
X-Google-Smtp-Source: ABdhPJyzycCY9/xmwzVPtfW2+HbwH16PzsOyBNly/MOg8BsKwgZhiE/nQQn5dsDIRV8N2YOE8+S4By5cAUC/LvicgcU=
X-Received: by 2002:a25:5014:0:b0:641:f856:aa1f with SMTP id
 e20-20020a255014000000b00641f856aa1fmr13891869ybb.140.1650373297232; Tue, 19
 Apr 2022 06:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <164981069655.421503.5359017463823038503@amd.com>
 <7f327c01-40e6-720e-860f-bc5d70ce07de@weilnetz.de>
In-Reply-To: <7f327c01-40e6-720e-860f-bc5d70ce07de@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Apr 2022 14:01:26 +0100
Message-ID: <CAFEAcA_DU5XGLojqozgPgWiRVqNUKdjDb9A3w4zY-Cq_Q3dZhw@mail.gmail.com>
Subject: Re: [ANNOUNCE] QEMU 7.0.0-rc4 is now available
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Apr 2022 at 19:14, Stefan Weil <sw@weilnetz.de> wrote:
>
> Am 13.04.22 um 02:44 schrieb Michael Roth:
> > A note from the maintainer:
> >
> >    rc4 contains three fixes for late-breaking security bugs. The plan
> >    is to make the final 7.0 release in a week's time on the 19th April,
> >    with no further changes, unless we discover some last-minute
> >    catastrophic problem.
> >
> > You can help improve the quality of the QEMU 7.0 release by testing this
> > release and reporting bugs using our GitLab issue tracker:
>
> QEMU 7.0 seems to trigger an issue with makensis which is used for
> building the QEMU installer for Windows: it terminates with different
> kinds to errors (SIGBUS, SIGSEGV and mmap related errors) depending on
> the details of the build environment.

Unfortunately our CI doesn't notice this because although it
builds the installer it doesn't do it for an "all targets at
once" config, only for a couple of "some targets, not all" builds.

> I currently think that this is related to the total size of the
> installed components which exceeds 2 GiB. Maybe a 32 bit int value is
> used somewhere in makensis.

Searching around it does seem like there's a 2GB limit to
the installer, that's been known about for some years.
(There's a fork 'nsisbi' which raises it to 4GB.)

> Stripping the executables might also help to stay below the critical size.

That seems like it would be a good idea anyway -- does it
have any downsides ?

I think we probably can't really fix this for 7.0, unfortunately:
we found it too late.

thanks
-- PMM

