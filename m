Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF17C337FF7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 22:59:16 +0100 (CET)
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKTKt-00069R-EH
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 16:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKTJR-0005EE-Uy
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:57:45 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKTJP-0002if-Tr
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:57:45 -0500
Received: by mail-ed1-x52e.google.com with SMTP id o19so5103592edc.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 13:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d9xYkY2MxCvGymt8wYifB4E4QgydH71gNppjF1geobI=;
 b=UP2eHvbGqYj8xNXuJenXf2iYIuyNujAq9Mpttzm7a8lTMgPAe4aqHCp9DOT/Nn474o
 DTpTJyNvPZmSItmoydznsTG3iPIx9Ov7+jOBJj/rLbGW+Ztik1Xh0vdk1CRRZocAdta6
 DBilAPiKLKlUC5lYbvs1Yf0+tEI8k9j4KA35CETsqAd8oA4BGfq94irfyJBPTfnAiFWl
 kaGS1IU/dUrbQdDRnSNMkSiAubj1YJeVfPbk6Lp33GuHJY3dgQv6xjsRvxtYH+4txFth
 hFGLpOLRjyjCCbZiwO7C/SwQXmOf2zBdReb5CxX5Bu+6OrBLxKgX8mCXjtWQN54eXFE4
 Hcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d9xYkY2MxCvGymt8wYifB4E4QgydH71gNppjF1geobI=;
 b=THOfUaAlhS1JM0eYlikLvS5t+S9ZJHBn6knynWWEN3YoEoyWLECn9bFyzEWxWihXNQ
 SPeTOcinJBqjd9dMnlsZADGOcMUGZqCFi2xgCxN9Hj1wSd+1KFIavhUGVt8nKdjDgynk
 0YGnUT6RLxXN1mMqfgwS1gLDudIOEdIxyFNugJrkfW7LZ/lG+QF8STkOeHO3yAM5V1bP
 Grd6CE2nhznovuXAOGuCM9Kg7ZhUn7hiWTGQ+yOo45pFztbfacQwepy8BMK7xiWvCApH
 qM8HzO7fULIUaq6fg1ssm/szUFntz3CABon6TWIk8ttt5WG144sqD1ryyetlEjUxm5/c
 GqKg==
X-Gm-Message-State: AOAM533ZWMyhpO0qhQGk/RVmxbQYojEcd/rwKQfbT9rSBo0ZpBGHsvhS
 Yyp1D/NDv523d3iC65dx1P7uqdk7Fqwk6swJe7Topg==
X-Google-Smtp-Source: ABdhPJzG7GKgkgSlNtJeVlAIukwTeuGAMk+w1v7p2ldj413nmiSibDsUJQCUet51w0pBflqXDAp/W9MeS6qTg2n+SF8=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr10560218edt.251.1615499862189; 
 Thu, 11 Mar 2021 13:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20210311210934.1935587-1-laurent@vivier.eu>
 <20210311210934.1935587-6-laurent@vivier.eu>
In-Reply-To: <20210311210934.1935587-6-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 21:57:22 +0000
Message-ID: <CAFEAcA8jAYc06s8N4hsYYDN2=PSB4SxQwvoBeAea7_4Yj1XptQ@mail.gmail.com>
Subject: Re: [PULL 5/9] char: add goldfish-tty
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 21:22, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Implement the goldfish tty device as defined in
>
> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOL=
DFISH-VIRTUAL-HARDWARE.TXT
>
> and based on the kernel driver code:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/tty/goldfish.c
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20210309195941.763896-2-laurent@vivier.eu>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

I didn't notice this earlier, but this looks odd:

> +static uint64_t goldfish_tty_read(void *opaque, hwaddr addr,
> +                                  unsigned size)
> +{
> +    GoldfishTTYState *s =3D opaque;
> +    uint64_t value =3D 0;
> +
> +    switch (addr) {
> +    case REG_BYTES_READY:
> +        value =3D fifo8_num_used(&s->rx_fifo);
> +        break;
> +    case REG_VERSION:
> +        value =3D 0;

You report as a version 0 Goldfish TTY device.
This is the old kind that used guest virtual addresses,
unlike the more sensible version 1 ("ranchu") kind that uses
physical addresses.

You can see this in the kernel driver code:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/tty/goldfish.c
where it looks at qtty->version.

> +    case CMD_WRITE_BUFFER:
> +        len =3D s->data_len;
> +        ptr =3D s->data_ptr;
> +        while (len) {
> +            to_copy =3D MIN(GOLFISH_TTY_BUFFER_SIZE, len);
> +
> +            address_space_rw(&address_space_memory, ptr,
> +                             MEMTXATTRS_UNSPECIFIED, data_out, to_copy, =
0);
> +            qemu_chr_fe_write_all(&s->chr, data_out, to_copy);
> +
> +            len -=3D to_copy;
> +            ptr +=3D to_copy;
> +        }
> +        break;
> +    case CMD_READ_BUFFER:
> +        len =3D s->data_len;
> +        ptr =3D s->data_ptr;
> +        while (len && !fifo8_is_empty(&s->rx_fifo)) {
> +            buf =3D (uint8_t *)fifo8_pop_buf(&s->rx_fifo, len, &to_copy)=
;
> +            address_space_rw(&address_space_memory, ptr,
> +                            MEMTXATTRS_UNSPECIFIED, buf, to_copy, 1);
> +
> +            len -=3D to_copy;
> +            ptr +=3D to_copy;
> +        }

...but here you're treating the data pointer value from the
guest like a physical address. I'm not sure how this works.

(This is one of the areas where you need to be really cautious about
using the goldfish devices -- "device model gets virtual addresses from
guest OS" is a really bad design.)

thanks
-- PMM

