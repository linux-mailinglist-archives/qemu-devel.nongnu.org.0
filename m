Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF745EA6B1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:58:54 +0200 (CEST)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnhG-00078B-1H
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocnf3-0005ND-O5
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:56:37 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocnf1-0007c6-Oz
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:56:37 -0400
Received: by mail-ej1-x636.google.com with SMTP id nb11so13874499ejc.5
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 05:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=rz3mlN4KbQjImCM3wC+X2Jb9p/lxfW4IHRyyTjdAQXE=;
 b=MMoyS0pHXmUTBqpuFERSTIQXL+fMgIz3LnDzhbqDMbLxfuuuggs/e3Ywr/g/uqfVms
 ShdH1N0tM2D7xliAYRg3PFqEKUKByrlFEoVdfWdiAaGMTSsr3DqOgYfPi5J2EgNy3SQZ
 EgT/u2TC6/7H2CQEMfphl/bSVKpiXS7CfMcQx7XH1fYYVUgesA8q8i0FO+AQkzBVUbxu
 HZSJIToH96Ua/xfWc/QXLBt5nK0BSOUNKAvbrcQRFJOxhLUXy5SOxzAicIqNmYe6Kc75
 7aViVYLkQt72HVq9GNqxF7+yH94vHfSo2NWeCJVsubtDG8hxsT0lKZU7Shu2+EVGkgvF
 2b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=rz3mlN4KbQjImCM3wC+X2Jb9p/lxfW4IHRyyTjdAQXE=;
 b=DDAgfkf+Z8DcHuH206ETnXrCWcvOg8dhtLbVV55PTL2vMWHqtd7UukfGDioG+Oad0j
 7H5GiF5nKKvJpc5HR7zyTpzSsKsdrKUPrMyhWDFSBSU/CH096wLJzXEloU6f6x3J6qqM
 D2V0/9Qt46yupIzcPDiazoO4BFFR/GzhkkqzYggku4yFwO37HnYdU/syCjT2046ufgiB
 5aGgZYyWt5J2WFIZREgb8uTvw1oOdv584ULra7JmbxAELLl1Fz6Gn6HTDEd7QubKqCRx
 0Ho45WoINT1XpbZWZ1OvHms1Qzsyk1aMTzMzjUCdKPS9veB+PlMwaRah7rnneuT88T2v
 vVpg==
X-Gm-Message-State: ACrzQf0towISQZYgbDAWQTnKELJdB1950HsXnTvxfAwT2F6U1aodpHcc
 M7Rx5HTuW4dOCP9QUhyp518q7qXBsIQggqCIidqy/g==
X-Google-Smtp-Source: AMsMyM6rAl/HCo4G1FcZNnsCazKAx7CoRu+Sy0E+RdwAgd/vxPaeIqwqU/A20MFL9vXBDGJ+QRoVpwqBURqiBDt+YCE=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr17676870ejc.365.1664196993426; Mon, 26
 Sep 2022 05:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220902172737.170349-1-mjrosato@linux.ibm.com>
 <20220902172737.170349-2-mjrosato@linux.ibm.com>
 <597a2761-f718-4a2c-c012-a0d25bf3c7fb@redhat.com>
In-Reply-To: <597a2761-f718-4a2c-c012-a0d25bf3c7fb@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 13:56:22 +0100
Message-ID: <CAFEAcA-8zWssi4TVF5TvHet9gxNkRvNreW6-hmTR0DgOu53Msw@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] linux-headers: update to 6.0-rc3
To: Thomas Huth <thuth@redhat.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org, 
 richard.henderson@linaro.org, "Daniel P. Berrange" <berrange@redhat.com>, 
 alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com, 
 farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com, 
 pasic@linux.ibm.com, borntraeger@linux.ibm.com, mst@redhat.com, 
 pbonzini@redhat.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Sept 2022 at 13:53, Thomas Huth <thuth@redhat.com> wrote:
>
> On 02/09/2022 19.27, Matthew Rosato wrote:
> > Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> > ---
> ...
> > diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
> > index bf6e96011d..46de10a809 100644
> > --- a/linux-headers/asm-x86/kvm.h
> > +++ b/linux-headers/asm-x86/kvm.h
> > @@ -198,13 +198,13 @@ struct kvm_msrs {
> >       __u32 nmsrs; /* number of msrs in entries */
> >       __u32 pad;
> >
> > -     struct kvm_msr_entry entries[0];
> > +     struct kvm_msr_entry entries[];
> >   };
>
> Yuck, this fails to compile with Clang:
>
>   https://gitlab.com/thuth/qemu/-/jobs/3084427423#L2206
>
>   ../target/i386/kvm/kvm.c:470:25: error: field 'info' with variable sized
> type 'struct kvm_msrs' not at the end of a struct or class is a GNU
> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>          struct kvm_msrs info;
>                          ^
>
> Anybody any ideas how to fix this best? Simply disable the compiler warning
> in QEMU?

There's already a patchset on list that does that:
https://patchew.org/QEMU/20220915091035.3897-1-chenyi.qiang@intel.com/

thanks
-- PMM

