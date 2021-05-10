Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2745378736
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:35:46 +0200 (CEST)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg4CP-0001c3-Pw
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4Ak-0008Uw-W0
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:34:03 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4Aj-0006FI-Ag
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:34:02 -0400
Received: by mail-ej1-x62b.google.com with SMTP id b25so23950425eju.5
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 04:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hROKlgwy52M2EkE0jl8Sa0DRevp+adVjaCLzFKh3NI0=;
 b=a3Yl83l68Pu11LaVsXTnzDwcNe13XZB/0cp9UmFAy2HopEn/u8jE3MR2/wrybUDugJ
 xEwXASZPxlrrN+qeKsYzlVE6Ru483836xpNVW0k1n6rdz6/lruWZ027gLMzs95wq1gf8
 fEbwPRLRA5E+VXnWMYzAbc+QLyJhNXolYNj6VWbNc6ml/Xc1DMm/CuOIIIxpxSG11jtp
 P943TT4aGn4yppxVQC3OjZmP5FzjQUJKDQU8ZTVGQG3vJaEqkrh77dCrrcK3jKw59f7u
 doaakJCUZqD7GVntkGPKVl6vA4Gs9VFk7FGzOyY80JfGSVS7YqJThM/X3Cu6QIz7ddBh
 Pz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hROKlgwy52M2EkE0jl8Sa0DRevp+adVjaCLzFKh3NI0=;
 b=POahheP9MK91cy4hmW0tJjYhBjxTtM022Q6Zfek+g9k6ZBlJhvUZPDmQ51wr/o/OZ0
 QB7FFdiRcDq3wXesD+yhjB5MnWdqYYQs60rdeHkUVJ+4xhIR5Wq6ynUDfChanTAglxl1
 7GytBh3+x0Rls0kHVLE5P35b/X+XgjOK+9XvlLvjHjq49RoeDSQtDPH4JzvLunok6qHC
 hBux50VN5kHttm5mh5zotHfMnS8AuUCz6GiqoX55RmIA5Q2w6gzTqW7NoOmR6qfgDIh+
 QNHntox1bip7gy1w58B2nzdnGT1wBr8ppRngRF48sLp9dY4FKbbIZ6+BdY70/Vm6xZz5
 3BEw==
X-Gm-Message-State: AOAM532b1RPCdhVqWEegPgFneefthk90rbwayPAQdAC6nCbnAleuEICm
 npMpfSYlV+m4K/gqqcyfAWqMcjM13iDfmXK8qCcVwQ==
X-Google-Smtp-Source: ABdhPJzj+NNale63ruoQVmpqHEKIqkJ9+xlb0U5SLV0YxDgA9MS1A35MhkhuxIjRawLyzp8Lw3nRgDTBuDUgGqqlm7w=
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr25932571ejb.250.1620646439907; 
 Mon, 10 May 2021 04:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210504133109.508824-1-pbonzini@redhat.com>
In-Reply-To: <20210504133109.508824-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 May 2021 12:32:48 +0100
Message-ID: <CAFEAcA8wf-eyYNnhCfvipHKrnzD5_CEG8TVKth+EwJ98bTfu_w@mail.gmail.com>
Subject: Re: [PULL v2 00/11] Misc patches for 2021-04-30 (incl. NVMM
 accelerator)
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Tue, 4 May 2021 at 14:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit e93d8bcf9dbd5b8dd3b9ddbb1ece6a37e608f300:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/mips-20210502' into staging (2021-05-03 12:05:12 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 9ba5db49aea924175b8f23edd388fa2452206d20:
>
>   glib-compat: accept G_TEST_SLOW environment variable (2021-05-04 14:15:35 +0200)
>
> v1->v2: check for new-enough NetBSD, add another 0.57 preparation patch
>
> ----------------------------------------------------------------
> * NetBSD NVMM support
> * RateLimit mutex
> * Prepare for Meson 0.57 upgrade
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

