Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293803580FF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:41:16 +0200 (CEST)
Received: from localhost ([::1]:56354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUS67-0004VL-69
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUS4V-0003Ar-MI
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:39:37 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:39515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUS4Q-0006lk-0P
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:39:35 -0400
Received: by mail-ej1-x636.google.com with SMTP id v6so937092ejo.6
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 03:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5dy86MZ+a1hhbCDFfsycnRDK2wzTdo1HfEP1wMS46uE=;
 b=lsxOBei2/Rsfy0mZvPWZBNB0hgZaJplljz5RDMhE7K+1+iXlBF5YZgXPYhqW8Gee4n
 Ofw/P2hjjKoX3EKuwgqnPqeqhVfgHcOoT4HLLresjTqalBxH+MsbxOSVis3bLszNeNVN
 wvtqA6Dw/FNGvdNx1Ojhfp64T17H6iXQlcmqBgWG94ieftsxthXvdSxt+T8AvgX/l6B5
 78cD2l6t9q9ZmVkZT3uyIbJaU1ZoQr8F7vhKK5oo4Nd1UZlVRa/ierBfFSHuHZaMjjG4
 f6AhgGrlnclgazFaXSCxbE8e1YTpFx2a7sPGPH/ElRiREzXwuoyb1QHE1v3uolxIf19u
 vE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dy86MZ+a1hhbCDFfsycnRDK2wzTdo1HfEP1wMS46uE=;
 b=JZeJM4jqDELr57APZNt6ZWrH1/hX1zkzNVXxLSu9CgOJHh9dV8I2lFNMmQ6fzqwI5q
 YsZk5ETo8IUQZys4GkkG5C4Jz2LVWEUms7GpVJfJD1/o3A7vZ6dNswTiFZSftSg2H6Q5
 nZylVRmd7Suuu+DskWMWGW2fgJGC5KpqlBeSLlIKzbMIkRvX8nWWNwTz3LgbABX80uYL
 Fs4EmSdOQ5tnP29//Xlac7K0ubYQw2w7xLao/P41RWR5cyqQDKRkoaON9ceWACMIYmWn
 xl3V0n+QcV9X2gDPg6+IwXD2rmGWR2aHxxbet0rShdCgUhHi/Vda+sTMVvjXq2Zrzr7L
 SQfA==
X-Gm-Message-State: AOAM530+vLeb5rnCdplofe3++EPTzj+CDUU1HNeF/aG4jQZUZUM4CxFC
 D+RYq8iT+kMmwvRHGCBPj03TjclXTbFfpEmw0E97pA==
X-Google-Smtp-Source: ABdhPJxF9TNfKwlGpD05lsAg7s3R8m+GmnhgzdX9BCV6YopzN2de2DyQOxAW9i0JseUyhkGtUe5Loqp2olg13YnwWkw=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr9420013ejc.407.1617878368352; 
 Thu, 08 Apr 2021 03:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210407165257.237372-1-its@irrelevant.dk>
In-Reply-To: <20210407165257.237372-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 10:38:48 +0000
Message-ID: <CAFEAcA9QxVj=R6-pa9VTK1cNHi4r7r5wi2hyb+Xusea0_3GOZw@mail.gmail.com>
Subject: Re: [PULL for-6.0 v3 00/10] emulated nvme fixes for -rc3
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 17:53, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> Gitlab CI finally got back in business :)
>
> Note: only cover letter sent for this v3.
>
>
> The following changes since commit d0d3dd401b70168a353450e031727affee828527:
>
>   Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-20210407-pull-request
>
> for you to fetch changes up to 7645f21f409b67eb9aad9feef6283c2e186e3703:
>
>   hw/block/nvme: fix out-of-bounds read in nvme_subsys_ctrl (2021-04-07 10:48:33 +0200)
>
> ----------------------------------------------------------------
> emulated nvme fixes for -rc3
>
> v3:
>   - removed unnecessary deprecation warning
>
> v2:
>   - added missing patches
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

