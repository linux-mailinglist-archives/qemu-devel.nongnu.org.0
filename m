Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8014B8FBC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:55:48 +0100 (CET)
Received: from localhost ([::1]:35002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOWp-0004xP-4t
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:55:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKOAN-0002qQ-Cb
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:32:35 -0500
Received: from [2a00:1450:4864:20::333] (port=40848
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKOAL-0006qz-H0
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:32:35 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso4288091wme.5
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++fTbmkMBLkVeiR+z8tnlnrkRELylZf6wHcJGWx6mfE=;
 b=ygtnFFCPDbWhMveKCsLHZ7eUUAxS66lnF+YsrPK25e+r1E1CrW+GQ0AH5g1gpAD+T0
 XZe074tdYuqH2bvulytPUW5SbXeELxm6KinHz7HX4QDlJhdntzy8rllEXVjTVD48C12l
 B+xdv8Qaq7SxCgDLf9j6NlG0mWiybJL0Bg9tPggy4h2oONZSiGiWljUS/y5CvixmLFqI
 83j6uEory5T+2mREw993BMAzPcBCDSy03Hf7PikU4pXMbxOrPIu92S/j3YHTIbL2sBwY
 mCzVncwvUWG/6fkqAJ1N6Lx4nTKm3lkK6bGgQtRv6GJHd+Oi/ejtkd7VJIhZUz56tGg3
 9wQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++fTbmkMBLkVeiR+z8tnlnrkRELylZf6wHcJGWx6mfE=;
 b=zgMbrAflhm8Hqdk3zdu2kQW17ZCIe4Cj1q6Qmu3Dsurtfq0n7tkc5TmsVsflz9LCYf
 FWdlP4GnHRRdyq0T02SkrX7brV1cFA8JDMEWfI2dJrt3tV1dN3SffO4I1SrpRqneE5tr
 YJqeqSs/Cf9cbrqHJJ09L3FG5dOP48W7nrl/gfUzQcsArwh6byJnrysVqyVReA835kXY
 22xkJ2ssNfbwG55izREP0FjzuCPZaO6g4bDmNme4xV47/2XFo5tOCvh7+CdKeAw0X0wp
 EfMea77s1fAofUcnzHncdA0yiJDR31mpTJfhzhJJgpBWWY5LKBUc837kZH0cdjGD1irj
 CCUQ==
X-Gm-Message-State: AOAM532g7eXv6WegLR1L8hQksMqoLNyPdLNwaJQ9LLriA58id7toxUo8
 uxUhumatLSejpXsinichnjd0dBKhLktrhUzQYU+5Rw==
X-Google-Smtp-Source: ABdhPJwS9IGZCyjqbW4FMz02o/bFL2SBGP/a41AUDPpqIPTPI9Uph572I9s96ks/ZplSgN8HDUp39K+7QPeeGI4DTUg=
X-Received: by 2002:a1c:f705:0:b0:37d:f2e5:d8ec with SMTP id
 v5-20020a1cf705000000b0037df2e5d8ecmr2602315wmh.21.1645032751669; Wed, 16 Feb
 2022 09:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20220209124135.69183-1-agraf@csgraf.de>
 <20220209124135.69183-2-agraf@csgraf.de>
In-Reply-To: <20220209124135.69183-2-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:32:20 +0000
Message-ID: <CAFEAcA9W9bcSoTjrZEPop=ztCb95n-qQ=q5=OeLAj+vdZY6JtQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hvf: arm: Handle unknown ID registers as RES0
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-stable@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Ivan Babrou <ivan@cloudflare.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 12:41, Alexander Graf <agraf@csgraf.de> wrote:
>
> Recent Linux versions added support to read ID_AA64ISAR2_EL1. On M1,
> those reads trap into QEMU which handles them as faults.
>
> However, AArch64 ID registers should always read as RES0. Let's
> handle them accordingly.
>
> This fixes booting Linux 5.17 guests.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: Ivan Babrou <ivan@cloudflare.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

