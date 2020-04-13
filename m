Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F9F1A6C73
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 21:26:57 +0200 (CEST)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jO4jQ-0004bU-Pb
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 15:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jO4iG-0003x2-QP
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 15:25:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jO4iF-00008n-Aw
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 15:25:44 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45449)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jO4iF-00008F-1M
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 15:25:43 -0400
Received: by mail-ot1-x344.google.com with SMTP id i22so840711otp.12
 for <qemu-devel@nongnu.org>; Mon, 13 Apr 2020 12:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FUf+H8dKqXuim1dEtKE1iqLexq2cBhVvgppr+OkRUk8=;
 b=TfJeV3hj5OMfu8etgETEd4J3AGbnkoi4tSS8uo7IxaFSnapf8rNvtQCLANoOsUK6I+
 1h4I6Eqalz+nawsZ81UrgM0h3PGleIElgZGgPO4B5TyiZM73cVJk+HR/tVIlw+zxGqiH
 wERF87JbvdtkRyqPSrYyAV7GwdCNFpcZWfRa3qX9mX7/2k91ec41V6yyNzJkb6C+bUh8
 lNJNB8fSzy266wD582NadeVkvSdx/gU1u+MKxaFCXke20k+uS3iQSnbc8qQp9DGwE+Tv
 zpeZ3vJshHoWoUPT6vO9m43lGooJuBvbv+seLnMvpRWCdoMUkh90z5bFqGeVEAu13nQo
 3U0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FUf+H8dKqXuim1dEtKE1iqLexq2cBhVvgppr+OkRUk8=;
 b=haG0XZ9w5z6Kr8RIaatrwr7LXRu70h2FVmFCemwBj+akM4l5azmKXLtI+vMtEe+mhD
 uJCJwi+q86Kdty2MMrf+uMM7ABii1FQKcfZgIdlvM5oL/xwgV4NPz5Sdh6j0DY66qIU1
 U6BDb8ouawkDu9bmf1nnZOjKvEE4IHhh+eZHi+TytyJwPSesw5Jt5wknTS2Jf5GR4JAY
 RCjAjo6BJBbOz1F01hNPavateiyVRsTH1ZFEotSssZP0VbSspOht2Hkn14R1kgut+tV2
 uY16GL7dRrHLguRQa/DeNl/8RKKxSFKPHRBLIu5l8Q6LkDdTknblvq7+m90lKtDa04a7
 FqYg==
X-Gm-Message-State: AGi0Pub3U/myT73/7Lgng1esoDEclvO5zjxL/wBRQCHz3RDUFEmzdzJz
 m6tFVpuiFBZgBfSLsmhNvyOscK3H1Yd0dqiJ5gHeQg==
X-Google-Smtp-Source: APiQypKkP+BjnCXCQuWrqtgjvMDhEr8NRyWLVGMleDyMgSe7KLfc0uEPQwy6+A8KzZzEdo4ktlJk0jnjnpSEOWBnvxM=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr15993069oth.135.1586805941933; 
 Mon, 13 Apr 2020 12:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200413110838.151374-1-mst@redhat.com>
In-Reply-To: <20200413110838.151374-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Apr 2020 20:25:30 +0100
Message-ID: <CAFEAcA-qr0HayaTvUL201GqDeLWdsu3JFkGBmhCOMgK_EsKUew@mail.gmail.com>
Subject: Re: [PULL 0/4] pc: bugfixes, maintainers
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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

On Mon, 13 Apr 2020 at 12:09, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit f3bac27cc1e303e1860cc55b9b6889ba39dee587:
>
>   Update version for v5.0.0-rc2 release (2020-04-07 23:13:37 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to ce4adc0b6e6167091373389ef8befd379c61fddb:
>
>   exec: Fix for qemu_ram_resize() callback (2020-04-13 06:55:54 -0400)
>
> ----------------------------------------------------------------
> pc: bugfixes, maintainers
>
> A couple of bugfixes.
> Add a new vhost-user-blk maintainer.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

