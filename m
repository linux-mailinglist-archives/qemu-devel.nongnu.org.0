Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32D729AB4A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 12:56:49 +0100 (CET)
Received: from localhost ([::1]:41722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXNaq-00042i-Nu
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 07:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXN9W-0007t2-Ns
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:28:34 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXN9U-0007CD-7N
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:28:34 -0400
Received: by mail-ej1-x632.google.com with SMTP id d6so1659938ejb.11
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 04:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oRf+zZMc0JSMFRPCPcYUCOrz4C2rHQQkxqO4nCV/6vE=;
 b=X/ky0bWIVnWRCKU5a6+9kRMQDBO990H+ZNJamkpLO3NjO1CRUSOSGWvO+cUitD0E5T
 8O+ySuYGX/3NzH96URvU1oNJStEGzXWmyW1Ep1USKmBJYEGZ8UVdphAOAK6i6UOwL2Gt
 ZviLbOK0O0DexDkgUKPN/SsDB1IuIoHR8NjhUQplri/ATF10NL1KHULACwaJINAop8fN
 +K7L18FDYDqbtTAkc/+yLgDOb0UF5cIATJg+uBckMcR8WosfX1JftG+SaNa1LSbUSAvK
 sumVQIQ4iV4W9s989e9/1qDeNGyxRMBsXp9p0pQwqG8i2m6G0wOp1GOm3DC75btayNgn
 EbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oRf+zZMc0JSMFRPCPcYUCOrz4C2rHQQkxqO4nCV/6vE=;
 b=E9XLIMZ+jbrw+5ui7U7ahCEwMMxTka2FzgNzxS+vRJAbM1dR0KlJC+CY7EFV0bvPk+
 dBe2DT9AGg2KTv8OBNP1xIE9ReWcCcBge5xEE/0R4lG6+Zuuo86f2vWrqLGM2gnO8y9g
 zuVP8eYchdJrLK4ajXEaf32yaoQZkAUk8BU7gpZYmK5FbPvJf53a7rxor6RRH+O9fu0C
 dxGMcxx+owZim51MN9aVEjbXJWb7dHYQQX9QURg/JAU9cbBVnqSYTWycmDe0eblexPbB
 xlUY2ZgrMZoUy/rknvBH/upzvUGPvSE15ryL5P0QKIWNf3mwYQph4WF8MTBYH+9e2QEm
 //5w==
X-Gm-Message-State: AOAM533OCJrM1CjUsrXyxRZRNWqUi+80na0PCTD8nrZdzRp7pwSlr4bg
 oaZtNE6N2VkPZGl/Wny6OnjR+Av0oKLMTrAtcPkl0A==
X-Google-Smtp-Source: ABdhPJzTkAO0LqGTReRKGpCxb/XfLHIOzLSTjgQzd54lfC9Zm6FllLQaTlAm8oCpIkLGk1+tt/kMJH/tEGCDS1XCohs=
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr1940200ejb.4.1603798109461; 
 Tue, 27 Oct 2020 04:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201026161952.149188-1-dgilbert@redhat.com>
In-Reply-To: <20201026161952.149188-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2020 11:28:18 +0000
Message-ID: <CAFEAcA_Nndqzs_j7b=td94SUR=dt=1cP6PSqrctrfqWFajBptQ@mail.gmail.com>
Subject: Re: [PULL 00/16] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Bihong Yu <yubihong@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Oct 2020 at 16:20, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit a46e72710566eea0f90f9c673a0f02da0064acce:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20201026' into staging (2020-10-26 14:50:03 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-migration-20201026a
>
> for you to fetch changes up to a47295014de56e108f359ec859d5499b851f62b8:
>
>   migration-test: Only hide error if !QTEST_LOG (2020-10-26 16:15:04 +0000)
>
> ----------------------------------------------------------------
> migration pull: 2020-10-26
>
> Another go at Peter's postcopy fixes
>
> Cleanups from Bihong Yu and Peter Maydell.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

