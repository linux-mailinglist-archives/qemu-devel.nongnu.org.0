Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449B82C1891
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 23:39:48 +0100 (CET)
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khKUs-0002XU-TZ
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 17:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khKTJ-0001v5-Al
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 17:38:10 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khKTG-0006f4-9s
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 17:38:08 -0500
Received: by mail-ej1-x62c.google.com with SMTP id bo9so19858957ejb.13
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=boMAaC7bgX4ifvj607te/uSBW36IgG9iwHLZMCqSHfE=;
 b=Jfnczh4IjlIGf/v/ZgQNhl0nb0gPCmZ21W274gwGRbW9BLNy3MA0+4qOlCkj+8uhaF
 mq7MQolqghkazkxEvkYdd7Tx/v1yDQzgUgGtKqw1C+ailZeAtoZkFZDPHbFcc1UpDVaP
 eEVGizgOs6RYG2SO39X176tkHKbWJcX9ayvNPt5gdNLIBfe384hCb0sB4sMN+asXM4fd
 GzYU5QijOSC1nccQW5h5R5FKcgiSGrEth2ZzuYxfo0ol7OLfk4e6tjMQD7iJTFAJQ17H
 kkKaqPlReJb4Dl4fYNQbVD9qeP5G2IfRbr1b411oqAwrObVBioPmgX+6EzCzXgZgrMr3
 K9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=boMAaC7bgX4ifvj607te/uSBW36IgG9iwHLZMCqSHfE=;
 b=pSi77fNazlWhid+HV+8zb7P7pEMSIFojToG431c1BV0ZJuEcD0muDrzufmacfeyDNf
 198YWC9jlQK0YnFQ7Mxn+BAznXPVMZ37Dhb97Un3a+gj1eTCMxuMI1HHJs2TjoB/hvVu
 WgEQoPtVxbU0YFt288l/0vZPZAK5CgDQydGH12muIPctakJ5Zlpf4WeYucW6jYFF/xaE
 XOH0jCtg3j+E+0UruBmieI1p95AIfMy/R2dVLP5v3Sk+ge//wXHsWpGMh437wQ4j5pkE
 a5oUvq1bu4hbEFkae480gFIpqd0DuV+7qUizCPsl/8Sh45+Z45/9PS7igdamtFVqHPeu
 zh1g==
X-Gm-Message-State: AOAM530GZU2AOe7cdjoQTtU3WcCBqhV/jgn45JgOIxsZWcE+2v7Z/NiW
 P1TfiPEo1b0aGny7eoUaSiNEZyph3Mrtpj/kHKCEZg==
X-Google-Smtp-Source: ABdhPJzaFeNl6F4hB4Vn6jDkWo+m8K2XIhGBHYeSfjtXIfnpq7Gkz50knvyUkCmPFFaCCEilL3xwLj8MWYAvncu1S+U=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr1565856ejd.382.1606171084382; 
 Mon, 23 Nov 2020 14:38:04 -0800 (PST)
MIME-Version: 1.0
References: <160615410107.26810.2586812803373008210.stgit@gimli.home>
In-Reply-To: <160615410107.26810.2586812803373008210.stgit@gimli.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 22:37:52 +0000
Message-ID: <CAFEAcA8CeGB=Xom=adn9rK5FNymbTYFR_XRVBOaiC1_2ejYuog@mail.gmail.com>
Subject: Re: [PULL 0/2] VFIO updates for QEMU 5.2-rc3
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 at 17:59, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> The following changes since commit 683685e72dccaf8cb9fe8ffa20f5c5aacea72118:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2020-11-23 13:03:13 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20201123.0
>
> for you to fetch changes up to bb0990d1740f6dced5b50a923677034c9399c213:
>
>   vfio: Change default dirty pages tracking behavior during migration (2020-11-23 10:05:58 -0700)
>
> ----------------------------------------------------------------
> VFIO update 2020-11-23
>
>  * Enable pre-copy dirty page tracking by default (Kirti Wankhede)
>
>  * Mark migration as experimental (Alex Williamson)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

