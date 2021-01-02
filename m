Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9382E8862
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:07:25 +0100 (CET)
Received: from localhost ([::1]:56592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnBM-0007TS-Sz
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn9V-0006Is-Nk
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:05:30 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:41259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvn9U-0007eD-D1
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:05:29 -0500
Received: by mail-io1-f50.google.com with SMTP id t8so21448892iov.8
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CnJL9gXPJ/3F1dUQoeYfK4TyI3mRbyTkpZLoBua1xEk=;
 b=jGiOUEwOkvV/Cj0u1YjZ/b8SywX1MTwFSrHe0y6Hm3qk+hJ+BeBmjJeYHHZjUYj3o+
 wUMlbrS0EDlTDP0KIrMMlm7K1M8+EHCPOhnZc957RnCjMQyEBLI6e4Fso8MPCI2Sgyea
 R8mdmVJldoigSJRxEU4pWgHN/zhuWVMVB2JGRDj9zGZsdGMeYMKw2IzRLXH/4pXMmOsz
 N4XIUac+9nuhH/l6j/iHVDOjWxAJkKIA4SwBHRruDsLClDvFMfm0KeIPW4FRRs40Rn9v
 X3y1RU7w+D8gHpybOeT2PURN34/XHsC2XXo2He+28prVdwguMhIFlflKso8Rnq2POt2X
 VQYg==
X-Gm-Message-State: AOAM533URV7NsPK5f4uZm/LOZALmIwq0xPb+XYlO4JSQWmmyUnsn1LP9
 yVSG3KvGJh+RgHQEaWgnSoM0XkHz7v4=
X-Google-Smtp-Source: ABdhPJzBOsreS8UpqLpSvIJRLHUmg9pn5KAg4boLvPL+qERNT9rwYQqm09HXWjdq5ty97bhBddfi2A==
X-Received: by 2002:a02:63cd:: with SMTP id j196mr55985460jac.61.1609617926729; 
 Sat, 02 Jan 2021 12:05:26 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com.
 [209.85.166.170])
 by smtp.gmail.com with ESMTPSA id f2sm39007254iow.4.2021.01.02.12.05.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:05:26 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id t9so21778009ilf.2
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:05:26 -0800 (PST)
X-Received: by 2002:a05:6e02:154c:: with SMTP id
 j12mr36303088ilu.33.1609617926459; 
 Sat, 02 Jan 2021 12:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-14-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-14-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:05:15 -0800
X-Gmail-Original-Message-ID: <CA+E+eSBuaDPmW15N7jKcqth5tLfUtSCJYggHUbZr_hU89sd_DA@mail.gmail.com>
Message-ID: <CA+E+eSBuaDPmW15N7jKcqth5tLfUtSCJYggHUbZr_hU89sd_DA@mail.gmail.com>
Subject: Re: [PATCH v4 13/43] tcg: Adjust tb_target_set_jmp_target for split-wx
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.50; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass both rx and rw addresses to tb_target_set_jmp_target.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.h     |  2 +-
>  tcg/arm/tcg-target.h         |  2 +-
>  tcg/i386/tcg-target.h        |  6 +++---
>  tcg/mips/tcg-target.h        |  2 +-
>  tcg/ppc/tcg-target.h         |  2 +-
>  tcg/riscv/tcg-target.h       |  2 +-
>  tcg/s390/tcg-target.h        |  8 ++++----
>  tcg/sparc/tcg-target.h       |  2 +-
>  tcg/tci/tcg-target.h         |  6 +++---
>  accel/tcg/cpu-exec.c         |  4 +++-
>  tcg/aarch64/tcg-target.c.inc | 12 ++++++------
>  tcg/mips/tcg-target.c.inc    |  8 ++++----
>  tcg/ppc/tcg-target.c.inc     | 16 ++++++++--------
>  tcg/sparc/tcg-target.c.inc   | 14 +++++++-------
>  14 files changed, 44 insertions(+), 42 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

