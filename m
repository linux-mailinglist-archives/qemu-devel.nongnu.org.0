Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9E43BF88B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:46:19 +0200 (CEST)
Received: from localhost ([::1]:33610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1RXu-0003C1-N5
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1m1RX3-0002OD-8j; Thu, 08 Jul 2021 06:45:25 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:46766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1m1RX1-0004Yy-9x; Thu, 08 Jul 2021 06:45:25 -0400
Received: by mail-il1-x133.google.com with SMTP id y6so5079563ilj.13;
 Thu, 08 Jul 2021 03:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L+fSmhy8sQMSwRPqzsT+Bra1oohWucSo7htykXx3Si8=;
 b=A/zsSZRD6+QQVCLuju8j6OKr3Essoe3RGYgpbVSKMIFuZA6i8oLDg5YEryrSam7vEU
 l/0I4+VGZQzYuTLnw2wiiDy/vkqTSdu0dnpfsj7ujMF2KbFpmrfmu111hAHI3IdV16ju
 QtP8pOKg5qdVj+ZCfuIDibDnaT2FSAXgLfepQfAtI8D8U6SSXh+zc/L/+vO427Qibbhv
 Rk0eqn+V2pgxx+yPUi0PmYjCJaImlB+8shbF/Tdrp1vlHufHAZ08h3HC0PMXggd7X75m
 rEfb4n0IbEFCgIwTqRIeHaBeNV0jmOWBK7OpjixQANYhgaGSRLCGndfbVHYHMnNq20kb
 CnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L+fSmhy8sQMSwRPqzsT+Bra1oohWucSo7htykXx3Si8=;
 b=gQqz3gIth/B3rsyImGkHd7iVn1h69McpbgJFMohLplN4p+d8QrIhVMugmahN+ecPFO
 Ko0TTkp+6j3oT5pars5tm90hvYsdU+VQmihaBajtIckWMzRGXvtmBiDqL8sRfGNFIz+5
 LMFjLz++yh5tH/5MKggazCq1B8jpAuvu2vrg8sFmV07TgVBScNGm0foeRQ3AYWscX1bm
 iYp5vaC9zA72Bgx0f12u2i9MxdBcHyIJUDvc7pee3QFqgYrHtAioLH1Zytn83iKNP0Kx
 bAFDJHgS6oDvWUsf6MfsbEybsYW1ZkdfbBkJ/0r5zz5RrlKQh5fMn7oysIXFPalkn9TC
 NsaQ==
X-Gm-Message-State: AOAM5321HxPkkOdAZKuPf/1ta+ZmHNI6eqii7iw1UiN8eND7m3ArzwN7
 HePd1eslUVMkql84XmBYMagrL/stxEqWSc/LEG8=
X-Google-Smtp-Source: ABdhPJx2tRnOcSAAIG1W/a5WglItbgCIjgmdGDfKAEzt6Zdqlz5T8YMTqQur/vyiled/8hUTWImx0WEZZFlvJX/Yij0=
X-Received: by 2002:a92:d10c:: with SMTP id a12mr15520626ilb.100.1625741121724; 
 Thu, 08 Jul 2021 03:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210707180449.32665-1-pl@kamp.de>
 <20210707180449.32665-2-pl@kamp.de>
In-Reply-To: <20210707180449.32665-2-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 8 Jul 2021 12:44:55 +0200
Message-ID: <CAOi1vP8bgSO+HhDiUZN-POYYd--3PEzn6TBW-YBSFh6X0Xt3Gw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update block/rbd.c maintainer
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=idryomov@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ilya Dryomov <idryomov@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 7, 2021 at 8:05 PM Peter Lieven <pl@kamp.de> wrote:
>
> adding myself as a designated reviewer.
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 516db737d1..cfda57e825 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3058,6 +3058,7 @@ F: block/vmdk.c
>
>  RBD
>  M: Ilya Dryomov <idryomov@gmail.com>
> +R: Peter Lieven <pl@kamp.de>
>  L: qemu-block@nongnu.org
>  S: Supported
>  F: block/rbd.c
> --
> 2.17.1
>
>

Nit: I would change the title to "MAINTAINERS: add block/rbd.c reviewer"
or something like that.

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks again for volunteering!

                Ilya

