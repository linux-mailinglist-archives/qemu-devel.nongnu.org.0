Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925EA233415
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 16:15:23 +0200 (CEST)
Received: from localhost ([::1]:52720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k19L8-0003fr-Gj
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 10:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1k19JR-00024r-Sv
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 10:13:37 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:37600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1k19JQ-0004LB-35
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 10:13:37 -0400
Received: by mail-io1-xd44.google.com with SMTP id w12so14723210iom.4
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 07:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fzfXo7gXkdd6ssqI2CMgwalvprzmIdLY53BMYQjeVpg=;
 b=TAvK7KtA2lu4UTl9gTGKeQhQt9/T3jpediACezYqjZ4zQO+gGYzedJbDVVzAIey8EK
 gUhQXm6F1oH7nSufJ7ywHykYU9nPM1dKILMU4T8uqBS5e8E4WpANkAr1BZgbs3v+uftB
 n0ABrvBw7g1T4+BpcYUXaZIdC0svnuHbz0gRhC45NzlSc3LXWT04GqR9+V8h5hPpoQ6r
 FCg8P+dkL+zVSSylyOPmyY0JwVJUQM3PhKUQHr3J6m7ocD3C2IOH8tJzzYFJqTNuO742
 Y9zhFkAtK1VxfMO89dXau7q1ur0RhfKlrhJBj2hB+kgT0oTfyWDl5mJ5zOyZ0Tpv4ZZl
 mCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fzfXo7gXkdd6ssqI2CMgwalvprzmIdLY53BMYQjeVpg=;
 b=YfSwQkGCGc6DR1f/ESmwOhbQS3OjgiyH5wt+o5dBF6mB4NY5CWoP61yLbZDyH4r1lE
 /XTz/XYhJHC4OpfbuUUWLsqeam/eJTRgJMTV8aaHeKglsAPNgR2vtUNICTFpBWmnjLpA
 jv9zDd25YOIhqYR8FKTxuLDTSfxyUMHPZJr796bq8YRgz1CfZsulqUC8JiEUqTIDvBuY
 SPCBqqq3sVAQItp3KOkDbbaVjOJHCeM7hfYeJ4tff+qhk8pLAGaOVSv74ZjqylxzlR45
 FO6EPjgCqOGkXFXiKteI/DCeAKuZe8sIkfwoQ87GhIkfrHhkNWfPBwAWGrWdjINXSkzV
 Rq/Q==
X-Gm-Message-State: AOAM531fB0OA8nZjtnQOR1raAO8nHJTo/g5CRr2Hj9vH8Vv0MCKl5Sl2
 mnaqCf1xB3PdS365+iHhChLjcgGGpW3QZO7LPUc=
X-Google-Smtp-Source: ABdhPJzeXtYeXbdcdcUWH/P+CqbWvomvwnIJ8q6EtWS2osfFAr+6ya8X052gdtrt7sQ+nCINU23/wxmjmOZB4bis1X0=
X-Received: by 2002:a02:6d5d:: with SMTP id e29mr3464579jaf.139.1596118414601; 
 Thu, 30 Jul 2020 07:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200730130519.168475-1-brogers@suse.com>
In-Reply-To: <20200730130519.168475-1-brogers@suse.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 30 Jul 2020 16:13:22 +0200
Message-ID: <CAM9Jb+iASQK49RqYJb3QhHsjUpU0oapx5dH37r4NnQV4HaCABg@mail.gmail.com>
Subject: Re: [PATCH] virtio-mem: Correct format specifier mismatch for RISC-V
To: Bruce Rogers <brogers@suse.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> This likely affects other, less popular host architectures as well.
> Less common host architectures under linux get QEMU_VMALLOC_ALIGN (from
> which VIRTIO_MEM_MIN_BLOCK_SIZE is derived) define to a variable of
> type uintptr, which isn't compatible with the format specifier used to
> print a user message. Since this particular usage of the underlying data
> seems unique to this file, the simple fix is to just cast
> QEMU_VMALLOC_ALIGN to uint32_t, which corresponds to the format specifier
> used.
>
> Signed-off-by: Bruce Rogers <brogers@suse.com>
> ---
>  hw/virtio/virtio-mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index c12e9f79b0..7740fc613f 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -36,7 +36,7 @@
>   * Use QEMU_VMALLOC_ALIGN, so no THP will have to be split when unplugging
>   * memory (e.g., 2MB on x86_64).
>   */
> -#define VIRTIO_MEM_MIN_BLOCK_SIZE QEMU_VMALLOC_ALIGN
> +#define VIRTIO_MEM_MIN_BLOCK_SIZE ((uint32_t)QEMU_VMALLOC_ALIGN)
>  /*
>   * Size the usable region bigger than the requested size if possible. Esp.
>   * Linux guests will only add (aligned) memory blocks in case they fully

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

