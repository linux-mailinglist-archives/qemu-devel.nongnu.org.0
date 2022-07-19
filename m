Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C583D57A8F1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 23:24:54 +0200 (CEST)
Received: from localhost ([::1]:47866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDui5-0000dl-9s
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 17:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDug7-0007I1-1m
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 17:22:51 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDug2-0000Wm-3K
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 17:22:50 -0400
Received: by mail-pl1-x62b.google.com with SMTP id w7so1404861pll.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 14:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wOuvgmXSqf767EHpJD1J02YHqgTbLGSOoVRayR66lfQ=;
 b=dYke84uGL4Ie7iOKHqAYduHHHsTExa+b3MWP+ufOp1igVHaEOwOclCMuCwJdCmUdFb
 yRZJ+4rB0wGwknIJ2OJCOYhEdzL/3mNUUZt78eOHM7h05bUqRzYg+K9reh960+JjOoj9
 NGuGgj7LcVnnIHdQAXwdGwuIu/gKWTlFcjTADd6vCC0xRqI/CcTWvM1yoTnm4cuqx/q7
 05aX/WfK0yNhc85ES+i3GgNquKeneUa+vCV3OPU2skeEyEQuxXeDtZO6uGMtpIckHXb5
 yz4HxLngOjPqMmXUoUOsVr5jlCrM9reIp26pOidfVCBo99E4vob1M/0byI+ASrMu0JjH
 J4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wOuvgmXSqf767EHpJD1J02YHqgTbLGSOoVRayR66lfQ=;
 b=vVhtxgTXr9fb5mZ1ZP7ofy0dW6Y5QVnZsSCaXokxg9uMuobZMhzkwEmRCOmPUzloaw
 xFH/9Imi/td3jU/71Ji3LzvDkyUh0X+eUD4bWI5SRvvSCWBCIhdTvCVMYinUVn2mkVXI
 NEH8K5uUuM98YEBqkbgOnbalC0UxJTU8l6Bb9GMWHbkTt89/M6Og+BZGUmoo2q33YpEK
 RFybXmcIsnmk1Txr3B+25xPK/s7Ysu8Y2HCd6NxBJ++em3YiXGzgGh12TKw8k1qqPU4+
 Xr/Vhq6TvH2YQZbZQkXJl4802jerWZf5bISTzHqYCAu0hdXHyXtKhENhe54cC81Z+KwI
 vpeg==
X-Gm-Message-State: AJIora+6tyy8DBdKo0cwVBzZyWcMb5QgC+RVWti5jPqp2mTA0Ptso1fq
 TydvgQNITWi50YsccNdKNTBxW7cOpCM53PaSyCY=
X-Google-Smtp-Source: AGRyM1ufX4Bjuw69MExgg1k52sxjrKPo6FF36FHMrAVmhnzA1T4AU3qcnnk9wuj9f6aSLrOdCX+nup5GvUPpnP8F2GQ=
X-Received: by 2002:a17:902:690a:b0:16c:f877:d89d with SMTP id
 j10-20020a170902690a00b0016cf877d89dmr8948666plk.25.1658265764683; Tue, 19
 Jul 2022 14:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220719082635.3741878-1-bin.meng@windriver.com>
In-Reply-To: <20220719082635.3741878-1-bin.meng@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Jul 2022 07:22:18 +1000
Message-ID: <CAKmqyKP_kNgwdNPtO1dBV7=BN9+Ei4poS6SSMGZtkrEMDd_PFw@mail.gmail.com>
Subject: Re: [PATCH] docs: List kvm as a supported accelerator on RISC-V
To: Bin Meng <bin.meng@windriver.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tue, Jul 19, 2022 at 11:37 PM Bin Meng <bin.meng@windriver.com> wrote:
>
> Since commit fbf43c7dbf18 ("target/riscv: enable riscv kvm accel"),
> KVM accelerator is supported on RISC-V. Let's document it.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/about/build-platforms.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index ebde20f981..118a4c64dc 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -46,7 +46,7 @@ Those hosts are officially supported, with various accelerators:
>     * - PPC
>       - kvm, tcg
>     * - RISC-V
> -     - tcg
> +     - kvm, tcg
>     * - s390x
>       - kvm, tcg
>     * - SPARC
> --
> 2.25.1
>
>

