Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8C6966DF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:30:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwJc-0003Yj-Ie; Tue, 14 Feb 2023 09:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRwJa-0003MV-5K
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:29:50 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRwJY-0003ij-G7
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:29:49 -0500
Received: by mail-pj1-x102c.google.com with SMTP id bg2so5974630pjb.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 06:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pfD9Y1/jrN1IOTFBCZ7zFSPmKfuvgdASko4k7PYZ7/s=;
 b=t/ngjKluxx4jiehfm7N6kGcHNWSClVK+mM1Ih/hpw1F3/0cN600yrkRrzeZiwmFzeS
 GTRSIxzPDJrJcTYMcYdfoBej+3+80g1/u9icdiGkOBAafBYRCHgGcgkVQQ2px5d2npJA
 +5CX7wgsSRUm0R2eQpfOXcHTeQnyZg+rNr4bOsK4aqJ39hdn/ywOtAH9p9+q4UyQM2Hb
 ZkwO4Y1+04P690y39Uhlc8lEIimc9HVVzbbdCsnJJtIBd65PQMuuu9nZDJwjn44MdTFd
 eGkh8ianzmvkfwQo+oY2P0hXxkc6wjil2Ktf69SM7Bxh0Yy1WhqrWjEeAcAuQlrijb1J
 fQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pfD9Y1/jrN1IOTFBCZ7zFSPmKfuvgdASko4k7PYZ7/s=;
 b=sHQJfwwsEUsx/S1q6Hc2gTD8EoqK75n3zmMr5jP/LN3/KNtG0bD8cPazsfkuxHCmkc
 tztQP8QH8Bw7DF7uTdmc2xZ49yVs3LNHkXkCBMbv2C1x1dsP2KQuaGU9DiTQ2rKErrSZ
 9E2mioDaK7Rr4s9dnJg6vmQ51aqJJkVw/EP9KG8e6tMzwv/Sp8QB8MQes/hNH9OqLnIV
 Yyjm8OwZVq5BswLEmCdlSSnQe2PAB/IH57/kxPkYwyKqO2UEmlJZHCchoQZrFmmt7yLd
 /VHPP45lT4eaj213ZeMj14VBhGtlUafQNPF82LYjWCPv7BrlVNo2l+YdGsoOur8ZKNuA
 7YbA==
X-Gm-Message-State: AO0yUKXNMcUtI3EiL3He2w3QVNasMYRSJSTyS0QkCHSzQwgT1Ok11EmT
 NerCw1196+VgRW4Ead2f6Rv8HVuh5MU4HM1tOQpAJw==
X-Google-Smtp-Source: AK7set/gBxsGg/7LnYiY1TCU68WtQhdgeHKtEwpzKgbhnwp9bpX/OKpX2ofHhwXtfU1LF5cIKdTNULRnu2UFQ1XcUXM=
X-Received: by 2002:a17:90a:2a0a:b0:229:fe24:91c with SMTP id
 i10-20020a17090a2a0a00b00229fe24091cmr490278pjd.16.1676384986883; Tue, 14 Feb
 2023 06:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20230214061140.36696-1-jasowang@redhat.com>
In-Reply-To: <20230214061140.36696-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Feb 2023 14:29:35 +0000
Message-ID: <CAFEAcA937Q=KqVNbKO_hDDNwzbcP7BD_DQFm-rhzKGKBCp1XGA@mail.gmail.com>
Subject: Re: [PULL 00/10] Net patches
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 14 Feb 2023 at 06:11, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit f670b3eec7f5d1ed8c4573ef244e7b8c6b32001b:
>
>   Merge tag 'migration-20230213-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-13 11:54:05 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to e4b953a26da11d214f91516cb9b0542eab5afaa0:
>
>   vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-14 14:00:30 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------

xlnx-can-test fails on multiple CI hosts:

https://gitlab.com/qemu-project/qemu/-/jobs/3767000949
https://gitlab.com/qemu-project/qemu/-/jobs/3767000974
https://gitlab.com/qemu-project/qemu/-/jobs/3767000994
https://gitlab.com/qemu-project/qemu/-/jobs/3767000970
https://gitlab.com/qemu-project/qemu/-/jobs/3767001009
https://gitlab.com/qemu-project/qemu/-/jobs/3767000851
https://gitlab.com/qemu-project/qemu/-/jobs/3767000849

thanks
-- PMM

