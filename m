Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D99368F1D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 10:55:54 +0200 (CEST)
Received: from localhost ([::1]:34976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZrbN-0001nP-5W
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 04:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZrZX-0000vw-7F
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:53:59 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZrZV-00042z-JV
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:53:58 -0400
Received: by mail-ed1-x536.google.com with SMTP id k17so17104450edr.7
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ic9ZW2BJ62vOLFFqNV/McaWxXLf+UbbfBz8cuTPb6LQ=;
 b=V9uJ68jGjAQQdXaNgHyRHizxxRCjmYZXpuLLHX0nOKmCKrBj9qagdPIiwpQVUiAfXy
 QLfylZKKt7A0ne4l4eo2LUhIgD624kNIsCfD1CuJkzddLa8ss2fU8jSh2fqPOs2MgnDz
 gqhQ0hi65MhcoS3V0Cg64N0q3C0WElnbSvfgObDhSV/FkPbbmrlP7IcZGCS/nGY1CL3y
 liXFnfZUIdvMssybBeMRvTdIDEkTLRKb02xSeCDwvAgdOEweJ0T6YG2gXI+XPg1FDf2T
 e0vr6mu5tgEyECY1l+YmrFPKVKBv2Skwvnhpm95RJT/CUEygr9ixys6BTasc2mri8pgV
 PTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ic9ZW2BJ62vOLFFqNV/McaWxXLf+UbbfBz8cuTPb6LQ=;
 b=snKEuTdmUVCjpMiOSlcIJv8PhnExBx3wa8IZXZVZszW0jRwcJiJ2+ItmjO0ZPdy9KU
 iV/Y4sJYDRCg3vDvAdr8kTMEix0rRXCeXhgVwEITpCQukl7RWfR2NR4V5c7KrG2uPgpv
 VD+QuCyg+JLslrPcHuzQbSEJRws0JN51INFJSVIWwSNzaxSnds8cDB4km4IWL5SrhIsh
 pifwyZQzl39M5T3WDSAMgtM3pA1WJkffkC+x2iVyTb2gGMBO9FKhpY4MXIW93IqXi+0L
 Q5pNi7kWDwPoNn4/V15KVtdu4ExgjEmxel9iklAVhnVNsmraoDXnnap+tyQHMRYOTlc4
 K8hg==
X-Gm-Message-State: AOAM532p+3mUKFghTBOntX9oDjAY9WuE7vKayOYeEVw/ZTV6P+lhY/MU
 mJBdWYK87g6mkt26HNKf08CHDpMfhILo0zBvhJ7nbQ==
X-Google-Smtp-Source: ABdhPJykWyTEHuRoX2C7P/ZgmRBsWRngsk8EEwcsjT/SSgqL7d5m1zORT9Nlni/KNdJDTHiqo+TlBJ65Vo2ojN0aRKU=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr3161327edv.44.1619168035995; 
 Fri, 23 Apr 2021 01:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210422222429.183108-1-mst@redhat.com>
In-Reply-To: <20210422222429.183108-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 09:53:01 +0100
Message-ID: <CAFEAcA9kKFgO2UAgUVOO0ZX1G2aT1H90mpUamrKdspKCDNgmRw@mail.gmail.com>
Subject: Re: [PULL 0/2] pc: last minute bugfixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Thu, 22 Apr 2021 at 23:24, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit d83f46d189a26fa32434139954d264326f199a45:
>
>   virtio-pci: compat page aligned ATS (2021-04-06 07:11:36 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 9106db1038bf3db5e4f8007038b3a1962018fa07:
>
>   x86: acpi: use offset instead of pointer when using build_header() (2021-04-22 18:22:01 -0400)
>
> ----------------------------------------------------------------
> pc: last minute bugfixes
>
> Two bugfixes - both seem pretty obvious and safe ...
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------

Come on, you should know the rules by now. Any pullrequest at this
point needs to have a detailed justification in the cover letter of
why it is such a release critical bug that we need to roll a new
release candidate and delay the release for it.

thanks
-- PMM

