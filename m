Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008544CA7B0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:12:42 +0100 (CET)
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPib-00080I-46
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:12:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPORM-0004xm-3r
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:50:48 -0500
Received: from [2607:f8b0:4864:20::b32] (port=37886
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPORJ-0008EO-Sm
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:50:46 -0500
Received: by mail-yb1-xb32.google.com with SMTP id g1so3166377ybe.4
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bLvOAi9t7NYTwQvvRkFcSu2yodAM2byus3b1uSY67w4=;
 b=a/Xy3up+tmVblXb+UqLaJ1j0X/Ih42ydsi+ecZSOmRzHDPTxtV0AoUO5UkyVwA3/fx
 yoO9f5WnSoNZIh4K6PLPaLo1dNsL0bF9nSXJpEJ8rPtMBSAoFcsmnTHoCPK8vAQYDwpl
 nSp8wCWCCLHKU+aXHia+ej6fS2N8Ltdl5jyFeSpBoTyf5a3z9a6JwmWHzdzAtfcjKFfc
 PVhqh3WV57d+ahcAbSXQ+u9ex2FtYF1jifIx0tQbG5jYGnxmJNNT0zEnBywk5ObDylyR
 caY6JzVfiiaO2mypzEphoXXio2aOwSIh8CKwRe/7i81Umy3MN7bMsuLyxrnLocE0XuBv
 v0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bLvOAi9t7NYTwQvvRkFcSu2yodAM2byus3b1uSY67w4=;
 b=lQD5ixZevQsa7jufIa2J4iFIgp6/jH0BPsWocdo/FVb5+roqKMqBe/ADZDFaMhRK42
 mzEAquaKPp7WO0dC9bNPYtPu4jsVlRq3zQXWuRT170ttlP+j/E4oc/2iJ4u+Zhr+id0T
 AylQ7oYQLZI/mwXgpCDwZ5Ik9huiEro2WF645YUCiwd6DFV0HJMZigF7DTImH/KIRL3I
 JwLOhAp17bLMbMnHa7buRNoyqZojRjU3sDfDDggxxyho0SkocaaQS8Tob/Agk/pSnZWD
 YMfGhHcz3qwzGw3KUoJmfBnpUgVJwXbK5n8G7LHvuh3XcEjxNZgVgfjTZyP2MWc5Qywe
 CH8w==
X-Gm-Message-State: AOAM531W/DPkXWdPpuCmDEEyTbG7fSa+ZPG21L47afCcVMDQaLHDEPcm
 O1YB8wcSGUU4OEBGm3R5c60ZKw740kDw5DlzC1Q+2w==
X-Google-Smtp-Source: ABdhPJzEhZXbZK8tAfLup3/hAKNVSfBTZclCAgBDB1jZL0PJzJrADYzTEZK6bl6Scvxbq+3BudaMAIiqBlO7KyjVmU4=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr4190681ybc.288.1646225444764; Wed, 02
 Mar 2022 04:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-5-richard.henderson@linaro.org>
In-Reply-To: <20220227182125.21809-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 12:50:33 +0000
Message-ID: <CAFEAcA8_1fX-Sn7G0Em=PgSWKg0NwqaxpYSAw212Z=ZMOYdfnA@mail.gmail.com>
Subject: Re: [PATCH 4/7] target/nios2: Hoist R_ZERO check in rdctl
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 18:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will avoid having to replicate the check to additional cases.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

