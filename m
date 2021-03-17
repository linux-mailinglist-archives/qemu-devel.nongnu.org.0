Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE833FA3D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 22:01:51 +0100 (CET)
Received: from localhost ([::1]:43450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMdIb-0006vk-Lz
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 17:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMdHL-0006MB-OY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:00:31 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMdHJ-0006zg-UD
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:00:31 -0400
Received: by mail-ej1-x631.google.com with SMTP id ce10so533847ejb.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 14:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G68c/bvfH/CJ4HebxxrkcTd0+GhN46bBq9TtiOMW1W8=;
 b=z7M6eodGVg7PnxAdPe3ltiimnX33hSOtn/JTB5cCkQNOz0j+YvWMGFs71MOj4rXw4u
 scIffzznLaliuHUj1YJk7dJxYALACIBi4vhVYmGxsgFU0f0KAV7vqgKjOaKVbVaabU2d
 4SfCdj3p6ZIy+aSZrz0EViUJcAiKW09CuVUGRoCDwvgM3WeuRMmB+ynbwAI8C+yawUUU
 Q1a+yxsey48nm3t7Ip4UUbmQ1fx3vfZpQngTGHK+6la/JTfQNPYmxogT9he27dCnKmIi
 /6RztC6Pi86LUPFxm041ncRhkD7hPD3aYU9Q21VqSbX+pvcyVOju2kFQMXouP3Rn51ID
 cHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G68c/bvfH/CJ4HebxxrkcTd0+GhN46bBq9TtiOMW1W8=;
 b=A+3FVyXMfiZC7ggZNP7J6fLQe65BH2HlpuSkXbxbfECewAOrGgaGczMbLqGNxy20Fe
 4d+VvbvlAC+3lN3TqWeIp736ZVi9Qyj3eb7+4hpuBdBAQqxoWsfKlE+0pqoy2wfhil/7
 8LCIeYPXIZPAqyA97AXASg0onXQLQ/FX0pUUn0VwhUJxa2sBewoVqBRHqLaI5Y1b6QVb
 uHHrsYJzmMcgwxMTZdvkVAJYNGXWVSzkACZffvn4WHuPKVNMiNn/fqfRpJjd93ZEuPD6
 hcuHnrfLwY/hCT7F/anDzp/Q1OV4RUJqrxSyVdAoPEbY+sPcgbb7MA9caZ0aVmP2QTMk
 aD0A==
X-Gm-Message-State: AOAM5319G5rTmX2iYUcbTP0nNX2r4J1468+JS9NMXSeUkDyqz5gFVaQD
 gfoUa4QutgZd4DGAYW5KiCEcQU2u/Yr7hlXoe80vjw==
X-Google-Smtp-Source: ABdhPJy27zo6j4W4TbJCkb/1pOBBiu/D+cTiM9A8kEP6us8wdOryvxyyqZGkd9d5s97vdAz1+XLg8YUECbzApF0xaBU=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr37155591ejj.4.1616014825937; 
 Wed, 17 Mar 2021 14:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
In-Reply-To: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 21:00:02 +0000
Message-ID: <CAFEAcA_a90eLJ0dGjHM86+jjxpyW7M4vG8tLSjLTC8buEP719A@mail.gmail.com>
Subject: Re: [PULL 00/10] VFIO updates for QEMU 6.0
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Shenming Lu <lushenming@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Eric Auger <eric.auger@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 at 17:21, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> This is a resend of the same sent on 2021-03-11 where 00/10 and 02/10
> were eaten by the mail server.  Rebased to current staging and re-tagged.
>
> The following changes since commit 5b7f5586d182b0cafb1f8d558992a14763e295=
3e:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210315-pull-req=
uest' into staging (2021-03-16 13:17:54 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20210316.0
>
> for you to fetch changes up to 758b96b61d5cbc19204f340012d5a325f0a2105b:
>
>   vfio/migrate: Move switch of dirty tracking into vfio_memory_listener (=
2021-03-16 10:06:44 -0600)
>
> ----------------------------------------------------------------
> VFIO update 2021-03-16
>
>  * Fix "listerner" typo (Zenghui Yu)
>
>  * Inclusive language and MAINTAINERS update (Philippe Mathieu-Daud=C3=A9=
)
>
>  * vIOMMU unmap notifier fixes (Eric Auger)
>
>  * Migration fixes and optimizations (Shenming Lu)
>
>  * Use host page size for dirty bitmap (Kunkun Jiang)
>
>  * Use log_global_start/stop to switch dirty tracking (Keqian Zhu)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

