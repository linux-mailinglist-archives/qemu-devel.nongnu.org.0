Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181EC544D95
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:26:13 +0200 (CEST)
Received: from localhost ([::1]:41488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIAu-0005PP-4C
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG53-0004cV-Qr
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:12:02 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:44316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG50-00020U-1O
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:11:59 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-30ec2aa3b6cso236868407b3.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=POlmq45u+/gnFOfC2GXSeZYmJsPhKq8pgz/3peUzmjU=;
 b=H+n0QjzF0fhUHHfp1rFK3386TO+bWvXg4ny/Xr2nw+CWFVGA53UFsTapXKeV4f8w0i
 33AzAe4IZ1wBnmGzNZILHTqneBAy+4nwIWpLfI2edhj3Jj+lBTD0sNCbQpVIbfSmh+jb
 SkTXCSiKhlrs41yydQpzwEDLGyy/ZwhNIqKu8c0fLsMKx1dw348Qo/f6in/ObeU+Hu1P
 FjTWi5eVhEI3ZDVIouuyoAgnMNTl07CLCM3kxOCF+CNb2bw1SiPspC/TcRxZaR660Rs9
 fvXfucAdLIrdychk28Ab7IHTsCTyzb7XvKAE5B/QgbWnPQ6qbdNHI21x9zQ0b4rG0s+z
 9+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=POlmq45u+/gnFOfC2GXSeZYmJsPhKq8pgz/3peUzmjU=;
 b=yt1PFCmjycFYXb3ag0KAXqqTXHxb/NZWEfDCf58CllDpBg0Vr/R42s4m8lzoh5hEZp
 YCnjOn58g43O6q6rHHhIHL0autcTnOLAaopIKLC0UQHlzVlSEa6+nQzuvrlO21ZtPAhT
 e2gRuWZ2TWJR/6mxuuhKe5bZRbrhJDq0Asq/qtu7RgaQv4+ygbjJ9GQ83KCczilHK1yu
 tn11r0ds+R4VF5krnusDmV/EknMGLpQfKY/w08Yn/ScyBtjlSAUGAai6ICanFZrFv6Vr
 OeOV6r/96va0OkO6osl+HBbl9GpCA+35sx/KkDjI58Sdt3TW+KTUIaLorGfONkrWqdU4
 hZSQ==
X-Gm-Message-State: AOAM530/oZRUmBiTBXa74QgWoZMQE5x2xaQrh8TDYpsnq8Yb82Cletc2
 tfl+wpnxzqI0ts7XSoxHOIRDF+RPCDVWy4J7kB7VIA==
X-Google-Smtp-Source: ABdhPJxcTP1DyCy2SnYUzgc6xFaVqNDm1TCpZJsTCgKVe0OBuvxuNZRyn55xdaCc3pY7hORKnikHAo8hUPvZfkl41iE=
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr43949753ywd.469.1654773116985; Thu, 09
 Jun 2022 04:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-43-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-43-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:11:46 +0100
Message-ID: <CAFEAcA_xUQaPnOHx1ZEiio52PC5Qv5tCNvnxXeC9aiNKWVhhVA@mail.gmail.com>
Subject: Re: [PATCH 42/50] lasips2: move initialisation of PS2 ports from
 lasi_initfn() to lasi_init()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This can be improved once the ps2_kbd_init() and ps2_mouse_init() functions have
> been removed, but for now move the existing logic from lasi_initfn() to
> lasi_init(). At the same time explicitly set keyboard port id to 0, even if it
> isn't technically required.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

