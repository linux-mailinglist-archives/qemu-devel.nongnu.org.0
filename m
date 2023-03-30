Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919136D0870
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:38:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phtPg-0007cq-JW; Thu, 30 Mar 2023 10:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1phtPe-0007cQ-Ok
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:38:02 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1phtPd-0004qx-3Y
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:38:02 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id e65so23692223ybh.10
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680187079;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4YjPwUznZDzymiSdl4S0eF4ZtPdG1NRAahCdNFbILws=;
 b=VmytF3oZx9Fx+xeAr2nL0wOcpl9wKztDC0P27eT2nsp5YNFhmHdytle/5zmtiKeFYZ
 IQaUB2Iv+UEmjBuQHdRPa2bHSoMeyXKUmj4Dz96iecwoYieUfttTjeCk9jXBhuZ+XR+t
 VOcJFje31FrWWZRK3159A2BRgkriDQYlLGrFfOh8EKczzEjWmVmzUTdr2/9tT4qSv2hR
 CdIaBIuinjZo/pDGcQmYV8ohB+QYma/05Z935EosR1zmq7sKXgCmpAiJGqo2cj5Ra+vd
 2fCsEZWusM7LzuE43uTegGM/5c1MVigRmL8VdUWho2xRPBHnygVFs/ADvzbR1MXdCECb
 8RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680187079;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4YjPwUznZDzymiSdl4S0eF4ZtPdG1NRAahCdNFbILws=;
 b=GZWe+egZUH3fqHtEAD3uukJ4pxzJ/YSELYWL8+R5/KyOi2Po0vkrYkdgs/QXJGIJO4
 zPOeeDrhQ8FKRQgW00iFEJaGUzfGa5D3NY+ZwxSagal83DbgoTfix0WDag4uBQrg97kc
 yWj5K/rLW8oCEwkELZrua2qf/lNS0jx/4f/CewPMg7NCMFEfzSRG1tmbYn1WXtZMNLPg
 KGutpnwQ589gpM9lWKLn5DTLvP4Bp/IfWTfGK/NOCgWb698tvZwsG4qyn1MuQnxWkrMx
 RIZHmHPcLc6JisMhGf06YwSOGBFW+7LTlB7uxIXzgn5OoOt//pHfq9JQByi1SWKYOTlr
 kXCw==
X-Gm-Message-State: AAQBX9e2IhGokwzMg48BOmxRrFu9GPCSH32BAMP2AcDVr09thbFMrw8h
 SU1n37fjd8cl6WRjBlWpwYm6gIiDednvENz2qMs=
X-Google-Smtp-Source: AKy350asAO1Rh3AKbGL2xc5g6ASXlkG0K6G99rkFNTGoLYWgg6xlIQRof92MvCNv1AeiLj91l5Q05qj6BhrKRoY27xs=
X-Received: by 2002:a05:6902:120f:b0:b73:caa7:f05e with SMTP id
 s15-20020a056902120f00b00b73caa7f05emr15566128ybu.2.1680187079280; Thu, 30
 Mar 2023 07:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230330095524.37691-1-dgilbert@redhat.com>
In-Reply-To: <20230330095524.37691-1-dgilbert@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 30 Mar 2023 10:37:47 -0400
Message-ID: <CAJSP0QWoh_D4X5CHnYiux9HJwy0UJ7+n0FQaNX1T1OqyTcWV+A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove and change David Gilbert maintainer
 entries
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, quintela@redhat.com, 
 dave@treblig.org, peter.maydell@linaro.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 30 Mar 2023 at 05:56, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> I'm leaving Red Hat next week, so clean up the maintainer entries.
>
> 'virtiofs' is just the device code now, so is pretty small, and
> Stefan is still a maintainer there.
>
> 'migration' still has Juan.
>
> For 'HMP' I'll swing that over to my personal email.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  MAINTAINERS | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef45b5e71e..f0f7fb3746 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2119,7 +2119,6 @@ T: git https://github.com/borntraeger/qemu.git s390-next
>  L: qemu-s390x@nongnu.org
>
>  virtiofs
> -M: Dr. David Alan Gilbert <dgilbert@redhat.com>
>  M: Stefan Hajnoczi <stefanha@redhat.com>
>  S: Supported
>  F: hw/virtio/vhost-user-fs*

Thank you for all the great work over the years, Dave! Doing virtiofs
together was a highlight.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

