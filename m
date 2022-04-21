Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2117C50A68E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:07:06 +0200 (CEST)
Received: from localhost ([::1]:57060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaGn-0003gL-1f
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZTJ-000806-KV
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:15:57 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:42783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZTI-0007BO-4w
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:15:57 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ef5380669cso57470347b3.9
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z9u8Xy5HBCQXZ7zOwo4qOL0k6WBJRHNMRD/wfdUkQzw=;
 b=g5a0K/8aFZ18XZtnLl2bCuDK4XuYlZ7mKkTKDN7WShDMEZ9WrO60pgsHtlUKSpktl0
 StGEhw915oB8yjIql1q9uyUIA1+p/k/xd7ay1gJ/6tjzQ+nMczpCiwzCwX0qcpAK2kwt
 GuFy/THde3ZXFfOuV7go8oznk9myJv5wAravd3iuJQD3NtKro9c45RI1xl4Y3wM9wcMI
 PQVDdy9wgmetUsviP4Yh+sf99fVC1N/uH5BPjDin91+EC/NFnYmDcFSBeHgVHN3xVicu
 sbxfAIYBx/f73sjdY0w0ZOYXzXxRAfSk0DAaf7r5b3r2m51J9TghsSQnhQJ5GzRC4rZc
 +RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z9u8Xy5HBCQXZ7zOwo4qOL0k6WBJRHNMRD/wfdUkQzw=;
 b=F+PCSMZUIMnmAnIppG4fwjcb50egNbWHn9LmQC2/VknYETLWEMFp2eROBV0zgdbX/r
 mjUhRc53Qt/HtBx0FzStomiqT3NW0t6yZ9/TvTRNYhkOSo1LopwChI9zILojbSPvU2T5
 LFsNIVJ5GrGoLbsY4JfwmewL2S9VX3G7NjSIHcojUKCyVD3zgCJxBKHKniwEraz4ygcL
 s+pk3JZgvfdvsyYTWe2F/T1zKoD45k6riUz972NDJcA9Q9vtOyCI/iv1YCcu11PUM7j/
 i2kw/dMhh5Mk8vk4fKmMfjW2M3Y1aFI3VodXgbtkc4Or+v5GdJopY1PWi+P9gD/dTj/i
 udVg==
X-Gm-Message-State: AOAM530al551RwZopaSJAK5h1Iue6Ywr8Nz+zCe1fmCCYYED5P5JhzSX
 GvLUCBdhCAezt6WmMcPFgOgZW1hLp6l2YpmbeHjleK391Lo=
X-Google-Smtp-Source: ABdhPJzItVa1VyVXY2YaqJh0eKqdw7G4f+8aNx/ey48BtDwY5IAER3JyTW5mIUjYy82M/rGo85y2QYZS3Ihi9q1m4F8=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr406557ywj.329.1650557754983; Thu, 21
 Apr 2022 09:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-9-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:15:44 +0100
Message-ID: <CAFEAcA8=3ut2_jV5Q2vp2n+NLYF2-m+mBT6BEEkKdnaVoTS3aQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/60] target/arm: Change DisasContext.thumb to bool
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 18:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Bool is a more appropriate type for this value.
> Move the member down in the struct to keep the
> bool type members together and remove a hole.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

