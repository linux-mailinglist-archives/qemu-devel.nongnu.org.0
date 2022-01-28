Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F4049F7EA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 12:09:35 +0100 (CET)
Received: from localhost ([::1]:40256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDP8I-0005L1-AM
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 06:09:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDP4I-00031I-5m
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:05:26 -0500
Received: from [2a00:1450:4864:20::336] (port=44745
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDP4F-0005C7-Fn
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:05:25 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so3783204wms.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 03:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m9sJXmzq/+fkbAOd/q9jweToZmG1D5mLo56dAF5lKKM=;
 b=aD94kK1kYSzReq2yZXrWt9qFgs48cod7XXirDT8qy3uXzN7cK5xLPmJCuCXWl6Kfbf
 uBjdZTR0714xiD9rwtAmt4OIftTpUvT77k5/PYGfPy53TGqYATzgVvZJe/2PjEgVcCai
 UCSBtQcTHO6+m+YZcUGC0qgVo6Fdz5dY7+qhWocVqJ7PRGT4Y5iDrYn2edcUrDVJsZgN
 8v3sGMHHa3nQy5qhg6Py1j1Ts16gBRpnOeyNELM2WO6M9g0gyOgW6F0ncRrxgsHdUAZZ
 jVYxfX2h4F2FdLGOkVDFJoB/xAPj0lJXEWldNJf/5ZqNMHmXH2LkI2Z5dImQwAbe92nS
 zFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9sJXmzq/+fkbAOd/q9jweToZmG1D5mLo56dAF5lKKM=;
 b=eHD27HnX2KtjZD+UeI3zXivFtG1hvx+AKkF4Ar0gIBDrv49NsE0VbqUCYnWsWZfldD
 Q+M48yofEOZFhVtX3uUcbUWpHDmxOvlytmBVsyYGtp0bDmfRg52ebfRnGT8YuKOJNmN2
 fT7CeI8bS8NU/kleiht+hWkETssoS4MVa1qv6S6kr6UEm4ZaAuHpCLSsFDpmhV5k5/ln
 A1q4N+36y83tU04nAd3rLy2OTCy38Z4uB4JolgaiMya13fEeqO/m8MqO8Tb8HiLHGYns
 WEAUxMinLm8f34cWH5TVkAP4azGjgskjJy5964uNmW3l+b4ansRJl3PCzstmnabuut5V
 OTyg==
X-Gm-Message-State: AOAM531lBNO05N6ey9KYG6uYy12Ys4MKd23g1t46UYTW+s7t96jLt/q7
 nHbOsi3B3PkuO1qCTgwkv/21fwRYtauN6YrdEgqQcg==
X-Google-Smtp-Source: ABdhPJxNEKU6vpQtAGT653pFZMg9iAY8mMhJK71xRK49oMxGMTdnwtdEyaUoRxEkbVaAEKr6gQSh9QBPRImI0qtO1NM=
X-Received: by 2002:a05:600c:1e0f:: with SMTP id
 ay15mr6978459wmb.133.1643367921419; 
 Fri, 28 Jan 2022 03:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20220127150548.20595-1-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 11:05:10 +0000
Message-ID: <CAFEAcA9O_nZz=4VSvh+rFE4cXepUEBeUui2WdawBjjos+pqOeg@mail.gmail.com>
Subject: Re: [PULL 00/38] Migration 20220127 patches
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <Laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 15:06, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20220126' into staging (2022-01-26 10:59:50 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20220127-pull-request
>
> for you to fetch changes up to 4e29a822de430e8d0d8bf5c61aaff0561a713d84:
>
>   migration: Move temp page setup and cleanup into separate functions (2022-01-27 13:37:55 +0100)
>
> ----------------------------------------------------------------
> Migration Pull request
>
> Hi
>
> This pull request includes every patch ack'd on the list for migration.  In no particular order:
>
> - ram_transferred_add() - (Edmondson)
> - vmstate canary (dgilbert)
> - minimum_version_id_old removal (peter maydell)
> - postcopy cleanups (peter xu)
> - more cleanups (Philippe)
> - yet more cleanups (zheng)
> - colo and cleanups (zhang)

Hi; this fails because we hit this assert in the vmstate canary check
on some of the CI jobs, for instance:
https://gitlab.com/qemu-project/qemu/-/jobs/2024872142
and also on the NetBSD VM in tests/vm.

thanks
-- PMM

