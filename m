Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BE118DAE6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 23:08:58 +0100 (CET)
Received: from localhost ([::1]:59708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFPp4-0008Nt-0d
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 18:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51011)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jFPo7-0007JH-HH
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 18:08:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jFPo6-0005fO-IC
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 18:07:59 -0400
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43]:43725)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jFPo6-0005ev-Dv
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 18:07:58 -0400
Received: by mail-vk1-xa43.google.com with SMTP id t3so2177842vkm.10
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 15:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h1k1A0VwuRw0M9pkZvpDqXi7mpNI2RN5sFEBkJJtHhM=;
 b=rucSOfwS5KPyLVSmARvnR0QfObn83csST9Ate8+fSPeMZPDDjxZYQZjhnVOTOQPmvt
 xuMiP/o2UkTqURHbdFKnCfISS2i87zyXMPtW2mDLgoPu1qWip4RJ/RvNQqOXI+CUDmVj
 TbRD4pjm0rf9zhnuylbV1vmekl1HMiy/tuDp9lkZsZuW2UJhTo0yjuwY0svew38hYH/I
 WZk+UIx0u8yFSI+n4EXUyhK8DnX+/ynT7mst7O4ln93fExy1BvFSLQRDHwkSx+5N2M12
 See/HYfXDj1Ukiq/c86rOZpFtQ97Q/Mw+oKVfWKJoVS3Ky+C7lX+4zgT1EK4SgoVI4ig
 Nmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h1k1A0VwuRw0M9pkZvpDqXi7mpNI2RN5sFEBkJJtHhM=;
 b=AU/qI1Ixo+fDqkVkH0HmhFBrIQ2BWLdF5ny+Xe2lgew5Df5euXJMy73gZxz0bMfpEp
 ovxGzGCm3lHn0TtTYPd6mNZc6kQwgl2CzQd0xCJYIhFDO2IgLkBSMzOPQERqG30ph9B/
 Kx3rkQ1IsWvifxS3LffDR6qbx1ys9gYeGgGSan+b7mcU7iwVPY2ZQpyvuXU2ZNdMFanz
 Mmzd76k9CA3uy40BsroZ8xZUkzr6MBQ0YfTAjHuZYGW+mDlexndSt9T2Li7Sm+H0ijWy
 WYOZbXeqZr13WUgaRC4kYY/MFZQy7Ry+6zeQWnw1wErgxzg8vJu1UuIomHd7c59t+j+8
 GLyw==
X-Gm-Message-State: ANhLgQ21clVEozzJP8ExWmSRqdEQ8GP0G4OEto9mcbVopUxe9LeZUOfU
 VwdSTzrsTnybgJUzr/B62UKH7WGwPD7JENvrsvQ=
X-Google-Smtp-Source: ADFU+vvyAwUQ88YCzxxhcRkCZAj1rikp4RWG6BP6fa157vzBOK07NdCKbiJxOt+Aek5porFAfMLJEIDfspfclkRwYAk=
X-Received: by 2002:a1f:5806:: with SMTP id m6mr8189496vkb.37.1584742077636;
 Fri, 20 Mar 2020 15:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200319040326.391090-1-leonardo@linux.ibm.com>
In-Reply-To: <20200319040326.391090-1-leonardo@linux.ibm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Mar 2020 14:59:59 -0700
Message-ID: <CAKmqyKOD9LTN6j157kEEodqjM3fXgdacd68qybG4AvbNyuXt3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] device_tree: Add info message when dumping dtb to
 file
To: Leonardo Bras <leonardo@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a43
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 18, 2020 at 9:03 PM Leonardo Bras <leonardo@linux.ibm.com> wrote:
>
> When dumping dtb to a file, qemu exits silently before starting the VM.
>
> Add info message so user can easily track why the proccess exits.
> Add error message if dtb dump failed.
>
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>

Thanks for the patch

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

I have sent a PR with this patch.

Alistair

> ---
>  device_tree.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/device_tree.c b/device_tree.c
> index f8b46b3c73..bba6cc2164 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -530,7 +530,12 @@ void qemu_fdt_dumpdtb(void *fdt, int size)
>
>      if (dumpdtb) {
>          /* Dump the dtb to a file and quit */
> -        exit(g_file_set_contents(dumpdtb, fdt, size, NULL) ? 0 : 1);
> +        if (g_file_set_contents(dumpdtb, fdt, size, NULL)) {
> +            info_report("dtb dumped to %s. Exiting.", dumpdtb);
> +            exit(0);
> +        }
> +        error_report("%s: Failed dumping dtb to %s", __func__, dumpdtb);
> +        exit(1);
>      }
>  }
>
> --
> 2.24.1
>
>

