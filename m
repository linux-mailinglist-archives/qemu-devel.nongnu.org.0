Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D99A534E69
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:45:25 +0200 (CEST)
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBvf-0007m9-Iq
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nuBmX-0004mU-1H
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:35:59 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nuBmR-0000tF-Gh
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:35:53 -0400
Received: by mail-ej1-x62e.google.com with SMTP id i27so2388607ejd.9
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5lypPLbvLzzbun8JXdhu4HZa/AJ0MT2zAguXt9h2zAA=;
 b=hVTP493/EVpFtHKkdy3o5n9kBUh0759iP/QoBo/sbhavwfewwsf00cmBaLrUR3k/4k
 Vbc29DZmbWpqu/5sTyIv0cbRAU7onge5f9OdKfoVWD6c/Z/CC9tAZmPXJL3YhW2bah7+
 XrdSrJzRy2fIsGo22fE2IaitNzaCA0qw/j/f/lh3THqd86QEL6F1i1SMCZm/AkyFBLuq
 MGfbQXMnOWatzuFX47LG1ogOmm/ewMAc1V2MoziWGEvl6DJ15NICgZKV+AAE4nmjmpWm
 MjvihvzGnCdqJ66YGzrbKmn4joCbAuvEyr1Y6basXRjl8rntZjArrv/paWc0FYReUsH0
 CvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5lypPLbvLzzbun8JXdhu4HZa/AJ0MT2zAguXt9h2zAA=;
 b=lwcet2RvOy2+3SvJo+6FCfO8530Acy4g/6b/QI3YTNC+gnllOFmhSb7LbYj5RV6sqO
 hrgpaiURc51rZFnSZchzaIzD9dzHQz+h3FXn98Vnsk5yKU/9JmuZrZvHfbwbV+EPzt/Z
 DNpymh72zD9c0zqfL9tgjGynr8TokyMsFyCdOhWnjnwSt2c2FbXqG0nofL+ktKDh4aT/
 WnSF7mNMyl8jMBDdy4LVgU9ZCB/rjWRRLWpA9LKgiizy2CP43v2Zx+EgVl2c6nVXzXqS
 agC8jmoT/RdGvrc/i3am4gBBZ7+XerHSo59XcBTrzl54oY3jjbM7E2yTE/3ylLLtj6uN
 I3ew==
X-Gm-Message-State: AOAM532jOnoNVcv91BO02w+uxTxt9Rg3NdEMXEnk1ddGYagUuRTuZUnr
 WgBgAdHa+xWKJksoffWRoKmBiDeU21n2VLDJmJV6
X-Google-Smtp-Source: ABdhPJwKnd3+w/YpddzLbUUF5DFGCU4cdIC8yL1t22HUyqJGGhRX4NTIF1HoN+XDSeXEUwoVI2NvO2WUNjVi29eodI8=
X-Received: by 2002:a17:907:2d23:b0:6fe:8aef:b533 with SMTP id
 gs35-20020a1709072d2300b006fe8aefb533mr1995586ejc.650.1653564948904; Thu, 26
 May 2022 04:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220525121947.859820-1-stefanha@redhat.com>
In-Reply-To: <20220525121947.859820-1-stefanha@redhat.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 26 May 2022 19:36:35 +0800
Message-ID: <CACycT3tEDW0ePvRRDuiUNA=5-OshL97WdJGpXsp5xBSkg6FROg@mail.gmail.com>
Subject: Re: [PATCH] qsd: document vduse-blk exports
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 25, 2022 at 8:19 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Document vduse-blk exports in qemu-storage-daemon --help and the
> qemu-storage-daemon(1) man page.
>
> Based-on: <20220523084611.91-1-xieyongji@bytedance.com>
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/tools/qemu-storage-daemon.rst   | 21 +++++++++++++++++++++
>  storage-daemon/qemu-storage-daemon.c |  8 ++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
> index 8b97592663..1b461193e7 100644
> --- a/docs/tools/qemu-storage-daemon.rst
> +++ b/docs/tools/qemu-storage-daemon.rst
> @@ -77,6 +77,7 @@ Standard options:
>    --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
>    --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=fd,addr.str=<fd>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
>    --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off][,allow-other=on|off|auto]
> +  --export [type=]vduse-blk,id=<id>,node-name=<node-name>[,writable=on|off][,num-queues=<num-queues>][,queue-size=<queue-size>][,logical-block-size=<block-size>]
>
>    is a block export definition. ``node-name`` is the block node that should be
>    exported. ``writable`` determines whether or not the export allows write
> @@ -110,6 +111,26 @@ Standard options:
>    ``allow-other`` to auto (the default) will try enabling this option, and on
>    error fall back to disabling it.
>
> +  The ``vduse-blk`` export type uses the ``id`` as the VDUSE device name.
> +  ``num-queues`` sets the number of virtqueues (the default is 1).
> +  ``queue-size`` sets the virtqueue descriptor table size (the default is 256).
> +
> +  The instantiated VDUSE device must then be added to the vDPA bus using the
> +  vdpa(8) command from the iproute2 project::
> +
> +  # vdpa dev add <id> mgmtdev vduse

Should it be:

# vdpa dev add name <id> mgmtdev vduse

Thanks,
Yongji

