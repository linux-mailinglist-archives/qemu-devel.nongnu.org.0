Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD6B46EC27
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:48:27 +0100 (CET)
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvLek-0006bC-KG
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:48:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvLdB-0005HP-0V
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:46:49 -0500
Received: from [2a00:1450:4864:20::435] (port=45834
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvLd7-0002OH-8P
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:46:47 -0500
Received: by mail-wr1-x435.google.com with SMTP id o13so10368835wrs.12
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 07:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EABrqejqG9CdMqBgKWZyDbCM+dW1LsbXU1pxlh78y9Y=;
 b=Sl6jsBG6ZRrOte8rFUBv9qBjK/iytKNyZo3hIBhuyyXmJrIHeBX74jdFa+M81R8u2p
 CLf2WqbLB8PhQ92mxXN4hMGgHQl6tHEwFoZzWw1muWe24HBopl6r1/4o2bma2sLi1IEw
 piWFSlNIR3ew2lzW0EesX4EKBHV1c5FtwMq5mQ/oyQ+SWVxzf16I7hDFpWzHqmy8il8n
 7Vs+lOMy+gVIrIDy2QrCfEnOuJgBfZjFly8Li472TsET7bJLLYhBCAwkviZ3lS7QhVAQ
 sVMTflC306nGylG2EU9BL+5X7rRWnPQGEoZtLaYMQjAADrJ1yFv2GOnKdAsxBRVISY5G
 +t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EABrqejqG9CdMqBgKWZyDbCM+dW1LsbXU1pxlh78y9Y=;
 b=wGZblhf83ZKY3gzLbzxNVNGYsvza13GzrNWJfe+37mBZCk1oLgt/DpdN0FyZrdy2kI
 dciusapoosGpX5CzSNE7P4WWxVGyZTSNoyepWICXmRZZDj2GCZ7jjOWlHhu/l2hHgUAE
 i0SQLmCTmjuluXjDg/r7ODnneTbjJrrFNMnISR18vXkU4Yue2FUrIWrW9RFmDBJWG7HQ
 nYL4FUO/5QbMuMJQ5yHspn8RnX/YoMH686Pg8LOMd+pCOQQ/PUWs10BcsguvowBdBkyI
 EFzKNN2/9quV6+T7PtTBRNjb8eUU+QijHedfHRkYYbjgjCyYTSLQzMLOp5DDjDT7fV/1
 JX7A==
X-Gm-Message-State: AOAM533PrwREZfb2J29dj9zJzs0parDFiK8LbirMlcQNlM90ELdeo1dz
 iwPjDxwyVoUoOh55CpQHqMJtQqbgxkoX/xFTqHGUkEJw0k0=
X-Google-Smtp-Source: ABdhPJyPjv/ELjAQci8SfqzDMULdrge7azHjQWUpNpS1qpete/rUKKl2qWrFtWWpRS0ie5xLXQskRhd4YRmNX2DfMaM=
X-Received: by 2002:a05:6000:156a:: with SMTP id
 10mr7235542wrz.87.1639064800459; 
 Thu, 09 Dec 2021 07:46:40 -0800 (PST)
MIME-Version: 1.0
References: <20211209152117.383832-1-stefanha@redhat.com>
In-Reply-To: <20211209152117.383832-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Dec 2021 15:46:29 +0000
Message-ID: <CAFEAcA8mpWWZ0YS-FX8zCy6fZmCi_oznZ8c0N9mzyOqzVX1HMA@mail.gmail.com>
Subject: Re: [PULL 0/1] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Dec 2021 at 15:21, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit a3607def89f9cd68c1b994e1030527df33aa91d0:
>
>   Update version for v6.2.0-rc4 release (2021-12-07 17:51:38 -0800)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to cf4fbc3030c974fff726756a7ceef8386cdf500b:
>
>   block/nvme: fix infinite loop in nvme_free_req_queue_cb() (2021-12-09 09:19:49 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> An infinite loop fix for the userspace NVMe driver.
>
> ----------------------------------------------------------------

I'm not running the release cycle this time around, but: it's
already rc4, pull requests by this point need a clear justification
in the cover letter for why they're really release critical.

-- PMM

