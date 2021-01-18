Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01932F9C57
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:30:45 +0100 (CET)
Received: from localhost ([::1]:59482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Ro4-0006I2-Qe
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1Rlq-0005Lb-R1
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:28:26 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1Rlp-0003VX-2z
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:28:26 -0500
Received: by mail-ej1-x634.google.com with SMTP id ke15so15261044ejc.12
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 02:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=anmpIy4OMJTSHDCibpZzaSLjB1mwo9F96ST2lPZACkc=;
 b=eItk3JK8q8IAdDlJbtNRrfgC4BuTJZW+OMjwSgDHfu3VpFl5rvGRBxA4VpZAKs8zgW
 0jv5Yz2h5pAmX1CROoDF4sVdvtDLr/OeLXglxhe7suvPSWb7x1UBWjH3cnhGIdhwMJX6
 u7okasbLogqpgn2Viw+Lp3S+E3k04VlsJhZl4yJ5Fs/kZd7pTr9Qv+JJkWjd4ARRhY0r
 AkRCVxlR40G1GhdgggPUK8NiFHo9dMwvf8CiO+QsprJn3UehenbU5M4q45uW8UMI+1xq
 6bGHjCOzSkExE/M1WU2pi38tn1mAW5vmWwlqaoktPRKKFKVOaT4ynKIilwtTRwwZs/i9
 QEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=anmpIy4OMJTSHDCibpZzaSLjB1mwo9F96ST2lPZACkc=;
 b=H0QZDjPt6GPnOZ84PHXJY3sMLx9cxWSy25CECxPRWinyqvjvhV8TYUZTyv4rNmARzP
 Dt8PB9uwcT85xu57crsM6X3Khhl37CU0x0MeacZEzNc9pUX0KiatnzCEDA5GWR5xykKD
 fcgqqZa17wa8qtKuGbOqSB+buEBDBo19U7Q100yKGgS3KoqFS9aoD+lsVnVhZ3606XiB
 95j6jQ7KM3TNrZfcTs8Tiq3zSlIya3bxxx7+TBACwLMiu6YxsTETJFnxA5uchv5bn3wC
 VcrGd27crmBqi42LGgaMWhFM6qb2oFZV94Ol5UC/N1gIKFdMgj9LnjDDIiHEUME+o+iH
 Q+QQ==
X-Gm-Message-State: AOAM531oZy0uXJOU4/NURWQzU1DaT7VcznVzQTZdPgGrwkrzeV4UXcw7
 zRWvECoYL+ZSRC3Eq6dSePlkz+RyRPd/Oqg1Dw+0YQ==
X-Google-Smtp-Source: ABdhPJxQNCyMjuv0Nn2UUIjXSja9pHepDHquKmMGd1XtGXeTZ6n74SJrRD52Ry6Qf7auHzNjqvmpX5Ds4R2yJaFpPIA=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr4331006ejd.250.1610965703030; 
 Mon, 18 Jan 2021 02:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20210117114519.539647-1-mst@redhat.com>
In-Reply-To: <20210117114519.539647-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jan 2021 10:28:12 +0000
Message-ID: <CAFEAcA8As41j8qK2W=-uOvP2+dwTi7YxeqbQ=Kn3_3ZhAGd5sg@mail.gmail.com>
Subject: Re: [PULL 00/10] pc,pci,virtio: fixes, features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Sun, 17 Jan 2021 at 11:46, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit f8e1d8852e393b3fd524fb005e38590063d99bc0:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210112-1' into staging (2021-01-12 21:23:25 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to ccee1a8140211c569156ae649474cc520eb2a36b:
>
>   acpi: Update _DSM method in expected files (2021-01-17 06:42:54 -0500)
>
> ----------------------------------------------------------------
> pc,pci,virtio: fixes, features
>
> Fixes all over the place.
> PXB support for ARM.
> boot index for vhost-user-fs.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

