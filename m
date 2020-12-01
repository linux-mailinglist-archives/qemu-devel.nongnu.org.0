Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8548A2CA0EC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:09:45 +0100 (CET)
Received: from localhost ([::1]:38360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3XU-0004w3-IB
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3VT-0003gc-IZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:07:39 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:37928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3VR-0006ie-Sa
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:07:39 -0500
Received: by mail-ed1-x541.google.com with SMTP id y4so2614510edy.5
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=waSweirLMmn+QizrWaAjbHQXDQi/j0PExSKCXfx00jU=;
 b=LnijrmIXPAVZdORq4wq9ShTdF8pDsOyFrs7xRrNpAetVzfbDH2mlUyWcaXq8U6Tf3P
 qQVjIl3NGa8TzNk1YtdkDAvZcNuVN1yODLn08qBq+jH/EtGQYmUbnLW1XM8Cq5MrnHGF
 Nal9bw0mRt005RywzTiyPaIfP7YHlx/wCwla4DHPTXov9yBB5RWqGtHafaxr6iLLGraU
 NiiHXlHjhU0By/8i+CQSCvePXyDNFj6G/3qFtBg3PaJJ6Vr/RLfrB7Iv7qTyxRBbnYV5
 DSGxKBvQ3Yanoa1WBpD5VYD0tEwiAzPmxRmK4GiXn81Zfojl4JREA5SO30M2XYcvjoUf
 DRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=waSweirLMmn+QizrWaAjbHQXDQi/j0PExSKCXfx00jU=;
 b=eMmrUBDkNl3blNUpR5j4foIiT/YB+br/kms2EBLp5P1IGlErkv5+QjoVIxSnaYIPID
 3rN5sh4kjZ5EtGfUI4kchqTVlBkKBClN9u3Q1RflevuT5Hg19MWWRsuc9FEDOK8s23Jo
 ne405L4jrZlVBSrcGI4vpfZKEjb6uWD1JRsc8wqsJhpQdZ/ff7sFGho+i8QObsPXojMG
 uYVgyXu+Zbzl9gvAdox7V6f2qx6QncYqV4TrX/vN+SmytJrRP4mDBNHFd8PCWAz52Erp
 tIRiaYH1GX9DTbMcrmekh0y50rvtoZeoVk7PqHwy3+LpubrvRXrqiNtkmEH2Zh9t6IEx
 oKQQ==
X-Gm-Message-State: AOAM533/f2i3kcjrl3452SHe+S0Bn90aaAqgK6EEA712ZPi5vaRiHIK5
 J7obuoxvpcajxSManEeeB6N1P9WwtkvWcVfDjblt8w==
X-Google-Smtp-Source: ABdhPJzpgCris2ZPj4WPm/7wKOejjU3I39p2P1tufFE6wZf1wD/MyApBZMv7CZWKsDAGKC+T/RzX7HzTZ8nzx7iuAIU=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr2440767edr.44.1606820856147; 
 Tue, 01 Dec 2020 03:07:36 -0800 (PST)
MIME-Version: 1.0
References: <20201201103502.4024573-1-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 11:07:25 +0000
Message-ID: <CAFEAcA9te0Xw0mDCusQLHx4tnQ2ZVXtE8euntLz_zbzNT7WifA@mail.gmail.com>
Subject: Re: [PATCH v2 00/32] kernel-doc: update from Linux 5.10
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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

On Tue, 1 Dec 2020 at 10:35, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> v1->v2: fix bisectability (by disabling kernel-doc altogether)
>         pass Sphinx version from docs/sphinx/kerneldoc.py
>         remove unnecessary s/atomic_/qatomic_/ difference

Tested-by: Peter Maydell <peter.maydell@linaro.org>
(build-tested on sphinx 1.6, 2.0, 2.4, 3.0, 3.2).
It doesn't seem sensible to "review" the upstream kernel
changes, but I think this is good to apply.

(We can update docs/sphinx/kerneldoc.py later I guess.)

thanks
-- PMM

