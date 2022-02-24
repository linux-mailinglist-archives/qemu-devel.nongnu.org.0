Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500A4C3558
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:07:43 +0100 (CET)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJSo-0002dw-1Y
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:07:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNJ4N-0002Ph-0s
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:42:27 -0500
Received: from [2607:f8b0:4864:20::112e] (port=38196
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNJ4L-00045R-7X
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:42:26 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2d79394434dso8072477b3.5
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjj56VvjxUBb/HlsHhwl3485kjc+VpBQr5J4Y7FHj4c=;
 b=APuxUHLPTJL7lvgYGhTK+M5yVP15PHoYoCHdczwAX/uoXNGBLzrBHFMCbIPO41cLTx
 MVbav54/YXvoTI8lh+JZhL54zmU5VT76Y2kGCUy7g6rTW6v41LwVfMiUOyt2+9kAj/sC
 QMusOIRA35z2N/FdS4mdjhWBjSh9WbIrWQdWYkmkW5w0DVJRt+TayRqhaf+D3kZZ/fbW
 cUy2v3swpICLjIOioHiLSGV18278D11Q2Uw6ANxY9GrTJ4E1D50ppL3QahfAqDoc+ua1
 QV4huJ738MhrXXKYZnQQv5LlCbKIdPZeWFpKxbEn7xN5K5TTghdW8BWLc4iBW9NAMNuo
 PZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjj56VvjxUBb/HlsHhwl3485kjc+VpBQr5J4Y7FHj4c=;
 b=GLuwmju2jeQ6166evvrX2wEnwwwpBAeB422+kMf+xovS9mOOM5qeLo8z+fBjipw+Nk
 KAYLGAmTw5Qx6ztSc5A49/ygGQsvAA6JQQKASVXneVE0WF1uREJyVQIX9MaHyUkj4oRA
 rDYyR/iaY92j3GitDv+1bGqqSdDxnJCnaeBJbMvSXMZZ3aXkfcIUyls0LeYVWav4N7hY
 bZHWBxdaP4TdRhlQ/Jq0LmKH8NskEzRIS+GypbrU6WVNYf//D74FeeNU4+dH6C+2GcBt
 yGp63U9CeYo14JswDlCNPEWxRKFMZ1SjlRsY/udSfIgISpvemMupvEnfyDHS1R5RWx9c
 1h4w==
X-Gm-Message-State: AOAM533OqKP5WD7GWEc5lL6x0R8Sa7H7vx6D30Lc8eGVf1UKyiY+T54m
 6KHqSpPWebZhwPGHgZv+XJvpgZCC5Xm/tt3IYLsg+Q==
X-Google-Smtp-Source: ABdhPJwJFOfaIhw60MV2bUo+3OXoqtdAzknqa/oNoP2opgR6XbmFoKCdm9WKQqwGTBvIFm/XIn6yvqldk8XdlWsyFGI=
X-Received: by 2002:a81:8c9:0:b0:2d7:6801:3fcc with SMTP id
 192-20020a8108c9000000b002d768013fccmr3883721ywi.347.1645728143527; Thu, 24
 Feb 2022 10:42:23 -0800 (PST)
MIME-Version: 1.0
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-3-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1640199934-455149-3-git-send-email-steven.sistare@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 18:42:12 +0000
Message-ID: <CAFEAcA9OvfUdKrVtisL3hd-WqimimNPfgKpQDm-sFNOSnPOZZw@mail.gmail.com>
Subject: Re: [PATCH V7 02/29] migration: fix populate_vfio_info
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Dec 2021 at 19:45, Steve Sistare <steven.sistare@oracle.com> wrote:
>
> Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
> CONFIG_VFIO.

The commit message says "include CONFIG_DEVICES"...

> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  migration/target.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/migration/target.c b/migration/target.c
> index 907ebf0..4390bf0 100644
> --- a/migration/target.c
> +++ b/migration/target.c
> @@ -8,18 +8,22 @@
>  #include "qemu/osdep.h"
>  #include "qapi/qapi-types-migration.h"
>  #include "migration.h"
> +#include CONFIG_DEVICES

...and the code change does do that, but...

>
>  #ifdef CONFIG_VFIO
> +
>  #include "hw/vfio/vfio-common.h"
> -#endif
>
>  void populate_vfio_info(MigrationInfo *info)
>  {
> -#ifdef CONFIG_VFIO
>      if (vfio_mig_active()) {
>          info->has_vfio = true;
>          info->vfio = g_malloc0(sizeof(*info->vfio));
>          info->vfio->transferred = vfio_mig_bytes_transferred();
>      }
> -#endif
>  }
> +#else
> +
> +void populate_vfio_info(MigrationInfo *info) {}
> +
> +#endif /* CONFIG_VFIO */

...it also seems to be making a no-change-of-behaviour rewrite
of the rest of the file. Is there a reason I'm missing for doing
that ?

thanks
-- PMM

