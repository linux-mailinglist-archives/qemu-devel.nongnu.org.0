Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B4A3F1A4D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:24:47 +0200 (CEST)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGi2I-0007Ao-Q0
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGi0U-0005Zu-Ca
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:22:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGi0S-0006Gb-Gm
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:22:54 -0400
Received: by mail-ed1-x534.google.com with SMTP id cn28so8855986edb.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M0R5cxpyeP49exxiL7ER7+OQkThVaQawoCW6jicQHQw=;
 b=cuHPUXXn8Vphfg/SdtVh4qUfzQLMZzsGE+bBOHrnx/deAwufaJNY1xIqFFNxgZO3Ur
 d41tLmX0zWTk8UHFw1/J1d9+CnK1kauqaBE4PlnPhEJ3I5kdeqkdFIxTNwu3tWTs0tlQ
 L9ZnqTSTvkVWR4T+7tYQUvbl7Z3XPA0efEOtsfgbnR8Z1ukEZT47tqdneS8u5BDV0U8d
 oxhSPU26aEfBMhN87US1bjNtMwLdCmDSH5DuknPFimh0/Y38HvcBUlDIT82oR1I6+HBU
 rVcyErSAV90NDywq+rlBmjxVYQRl4RgFHtH7RP2Tu5FQav6qEDP4o3sYQPujNyywkrg1
 6Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M0R5cxpyeP49exxiL7ER7+OQkThVaQawoCW6jicQHQw=;
 b=q7UEOCJR8AVqwpmhdrUU5OII1aNPcsJcbXMqtGAryvczHTNsJiNjY6hdoe5FIcw24+
 zsvDsGwTomiGp3bWYgoJbfTkPbWL+FsKEtpf62LuJA+f915BH8KW9YxjETi411tMJKkU
 s/d5nxbqyLQj14nfU/NoLSLkmhieNDlOHsFGyqfsjicvZl6OJ1XvxrYLp+hV0rq1msbG
 ztre6Dta1mv8UOa0SdeasYeIki9Wi9mTOBMkTgnoL0s11t0f3m8ZvGz8zuN8Km/0qpa4
 0/xbJ4+Be/nTILa1aD9fuLt+VlgY6/QxSfe1czJYIPyHZDvshUDkUH8ju0BbX/pUC2v2
 Q6Ag==
X-Gm-Message-State: AOAM532g74ZqqDxpeDTDKqbP0ULeSSTA35UYtyB/LDKkrFzK/2wqq9Ca
 fl640CmLJ/KL8Y8VHn2I1RkRg1sLM3RkFr+/qPfdyQ==
X-Google-Smtp-Source: ABdhPJxFgc9EGnQSoPWanxnHEkE7OIjv8m2irSV6VdoYjllkztNvRvyWWTsfBd6H02ucwLVv/xsxtMnzYzGzkrgbwrg=
X-Received: by 2002:aa7:c4cd:: with SMTP id p13mr16140684edr.251.1629379371129; 
 Thu, 19 Aug 2021 06:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-11-shashi.mallela@linaro.org>
In-Reply-To: <20210812165341.40784-11-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:22:05 +0100
Message-ID: <CAFEAcA_bEnT=Jb-zy23O1G4Q+iUOZDfs=zs4tVh3TtuSfV-raQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] tests/data/acpi/virt: Update IORT files for ITS
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 17:53, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Updated expected IORT files applicable with latest GICv3
> ITS changes.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

