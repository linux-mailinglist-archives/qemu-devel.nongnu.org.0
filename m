Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8F443931
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 23:58:52 +0100 (CET)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2jz-0000n2-Eb
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 18:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mi2bK-0001Eh-TZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:49:58 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:41958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mi2bI-0001J2-Gg
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:49:54 -0400
Received: by mail-lj1-x235.google.com with SMTP id g3so671731ljm.8
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M00lpJ8XRdwCrIu7kztrkJGW+KhRpYGlWLp99bAecIU=;
 b=Rdm7Z/khXkGaWhdQZxK3FiHvIjaShZYAXes9tT5Q5Y5CsMC4ecfrL3uOIVGJ+S0T8D
 FHd+kMaF4Bm4UBaO938JPdbZuXoO2X9qJVjbhONCBGezlkYCU7aNAJB9Ccz92KAxIZAm
 pvylHW3Y6Q0fclMO8koEvF6AsI75lWH2yQco0o46EUZVfWhUhjcn5bOZXLHnz2353uHK
 XYaLzfSDh+zu2ZE4TT1B7T4eZ9g4ZP3ICNcaSVSvv30t7NnYgMHDGQIvwKhDTNeMXPwd
 FeDf1QXW2j5lo5HohDrl5bVOnUqdQbSBersT7zZ3khyfN+v+vzJ2S8J9JY7ouVGF6wjF
 nqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M00lpJ8XRdwCrIu7kztrkJGW+KhRpYGlWLp99bAecIU=;
 b=EwC3Pg4wdVMseTPIqVA3NdpvTGZEbBsTnEq5c8hSj9UsLHauJ7XEhv6OhSv4v3fn2N
 tXF5wn+qHzVJqLT/f5cLQ2+l/Z1W3i4FYOJFQtyor2CWCf3+9KM4CaZTjnJ9/pTypdn6
 YUA3gOcMtcUm9T3wbLVns70sDka2CoxrXCnQfjTNAk8y3KMODZch4WC6FCPn6R0tiDQT
 DodUTwQkdI2lQUvBUwkywb5eJnoDTb173ttf1Cb/Pd2voAis1axbdWoMa5FwBq95/U6k
 gBfRGRshJu+i6YhHW6lACLcMXk/TlTQFRztQzwI3Xzz+q+pOPZXXon+N+Fxq8DngyC5H
 mUGw==
X-Gm-Message-State: AOAM533BobDz4pNyJW8JBJ5tbFGeK3Ae7loCSc2D3d3GFF1Im/594LkB
 p5E/8q4LkmW7utx5ZbFC6Rk4AqGeNxpqxfvOdjNRdQ==
X-Google-Smtp-Source: ABdhPJwtcO9gXC2QHakhnS/d4YCvr/isRxuDL1lP6MgCyT6HB0HyXPPfBw6XOIeM7TvByS9+dyrS1oKgVggxinzoKEI=
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr40111436ljg.115.1635893389149; 
 Tue, 02 Nov 2021 15:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211102182519.320319-1-richard.henderson@linaro.org>
 <20211102182519.320319-5-richard.henderson@linaro.org>
In-Reply-To: <20211102182519.320319-5-richard.henderson@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 2 Nov 2021 15:49:32 -0700
Message-ID: <CAGcCb123jbUPco+wX-R_x9q0ckEpN7rnq937gRNL3v+Zp6kAgw@mail.gmail.com>
Subject: Re: [PULL v2 04/12] tests/qtest/libqos: add SDHCI commands
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Shengtan Mao <stmao@google.com>, 
 Chris Rauer <crauer@google.com>, Tyrone Ting <KFTING@nuvoton.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005a85ca05cfd61c5c"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--0000000000005a85ca05cfd61c5c
Content-Type: text/plain; charset="UTF-8"

Hi,

I've sent a new patch set which uses memcpy here. Thank you!


On Tue, Nov 2, 2021 at 11:25 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Message-Id: <20211008002628.1958285-5-wuhaotsh@google.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/qtest/libqos/sdhci-cmd.h |  70 ++++++++++++++++++++
>  tests/qtest/libqos/sdhci-cmd.c | 116 +++++++++++++++++++++++++++++++++
>  tests/qtest/libqos/meson.build |   1 +
>  3 files changed, 187 insertions(+)
>  create mode 100644 tests/qtest/libqos/sdhci-cmd.h
>  create mode 100644 tests/qtest/libqos/sdhci-cmd.c
>
> diff --git a/tests/qtest/libqos/sdhci-cmd.h
> b/tests/qtest/libqos/sdhci-cmd.h
> new file mode 100644
> index 0000000000..64763c5a2a
> --- /dev/null
> +++ b/tests/qtest/libqos/sdhci-cmd.h
> @@ -0,0 +1,70 @@
> +/*
> + * MMC Host Controller Commands
> + *
> + * Copyright (c) 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "libqtest.h"
> +
> +/* more details at hw/sd/sdhci-internal.h */
> +#define SDHC_BLKSIZE 0x04
> +#define SDHC_BLKCNT 0x06
> +#define SDHC_ARGUMENT 0x08
> +#define SDHC_TRNMOD 0x0C
> +#define SDHC_CMDREG 0x0E
> +#define SDHC_BDATA 0x20
> +#define SDHC_PRNSTS 0x24
> +#define SDHC_BLKGAP 0x2A
> +#define SDHC_CLKCON 0x2C
> +#define SDHC_SWRST 0x2F
> +#define SDHC_CAPAB 0x40
> +#define SDHC_MAXCURR 0x48
> +#define SDHC_HCVER 0xFE
> +
> +/* TRNSMOD Reg */
> +#define SDHC_TRNS_BLK_CNT_EN 0x0002
> +#define SDHC_TRNS_READ 0x0010
> +#define SDHC_TRNS_WRITE 0x0000
> +#define SDHC_TRNS_MULTI 0x0020
> +
> +/* CMD Reg */
> +#define SDHC_CMD_DATA_PRESENT (1 << 5)
> +#define SDHC_ALL_SEND_CID (2 << 8)
> +#define SDHC_SEND_RELATIVE_ADDR (3 << 8)
> +#define SDHC_SELECT_DESELECT_CARD (7 << 8)
> +#define SDHC_SEND_CSD (9 << 8)
> +#define SDHC_STOP_TRANSMISSION (12 << 8)
> +#define SDHC_READ_MULTIPLE_BLOCK (18 << 8)
> +#define SDHC_WRITE_MULTIPLE_BLOCK (25 << 8)
> +#define SDHC_APP_CMD (55 << 8)
> +
> +/* SWRST Reg */
> +#define SDHC_RESET_ALL 0x01
> +
> +/* CLKCTRL Reg */
> +#define SDHC_CLOCK_INT_EN 0x0001
> +#define SDHC_CLOCK_INT_STABLE 0x0002
> +#define SDHC_CLOCK_SDCLK_EN (1 << 2)
> +
> +/* Set registers needed to send commands to SD */
> +void sdhci_cmd_regs(QTestState *qts, uint64_t base_addr, uint16_t blksize,
> +                    uint16_t blkcnt, uint32_t argument, uint16_t trnmod,
> +                    uint16_t cmdreg);
> +
> +/* Read at most 1 block of SD using non-DMA  */
> +ssize_t sdhci_read_cmd(QTestState *qts, uint64_t base_addr, char *msg,
> +                       size_t count);
> +
> +/* Write at most 1 block of SD using non-DMA  */
> +void sdhci_write_cmd(QTestState *qts, uint64_t base_addr, const char *msg,
> +                     size_t count, size_t blksize);
> diff --git a/tests/qtest/libqos/sdhci-cmd.c
> b/tests/qtest/libqos/sdhci-cmd.c
> new file mode 100644
> index 0000000000..2d9e518341
> --- /dev/null
> +++ b/tests/qtest/libqos/sdhci-cmd.c
> @@ -0,0 +1,116 @@
> +/*
> + * MMC Host Controller Commands
> + *
> + * Copyright (c) 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "sdhci-cmd.h"
> +#include "libqtest.h"
> +
> +static ssize_t read_fifo(QTestState *qts, uint64_t reg, char *msg, size_t
> count)
> +{
> +    uint32_t mask = 0xff;
> +    size_t index = 0;
> +    uint32_t msg_frag;
> +    int size;
> +    while (index < count) {
> +        size = count - index;
> +        if (size > 4) {
> +            size = 4;
> +        }
> +        msg_frag = qtest_readl(qts, reg);
> +        while (size > 0) {
> +            msg[index] = msg_frag & mask;
> +            if (msg[index++] == 0) {
> +                return index;
> +            }
> +            msg_frag >>= 8;
> +            --size;
> +        }
> +    }
> +    return index;
> +}
> +
> +static void write_fifo(QTestState *qts, uint64_t reg, const char *msg,
> +                       size_t count)
> +{
> +    size_t index = 0;
> +    uint32_t msg_frag;
> +    int size;
> +    int frag_i;
> +    while (index < count) {
> +        size = count - index;
> +        if (size > 4) {
> +            size = 4;
> +        }
> +        msg_frag = 0;
> +        frag_i = 0;
> +        while (frag_i < size) {
> +            msg_frag |= ((uint32_t)msg[index++]) << (frag_i * 8);
> +            ++frag_i;
> +        }
> +        qtest_writel(qts, reg, msg_frag);
> +    }
> +}
> +
> +static void fill_block(QTestState *qts, uint64_t reg, int count)
> +{
> +    while (--count >= 0) {
> +        qtest_writel(qts, reg, 0);
> +    }
> +}
> +
> +void sdhci_cmd_regs(QTestState *qts, uint64_t base_addr, uint16_t blksize,
> +                    uint16_t blkcnt, uint32_t argument, uint16_t trnmod,
> +                    uint16_t cmdreg)
> +{
> +    qtest_writew(qts, base_addr + SDHC_BLKSIZE, blksize);
> +    qtest_writew(qts, base_addr + SDHC_BLKCNT, blkcnt);
> +    qtest_writel(qts, base_addr + SDHC_ARGUMENT, argument);
> +    qtest_writew(qts, base_addr + SDHC_TRNMOD, trnmod);
> +    qtest_writew(qts, base_addr + SDHC_CMDREG, cmdreg);
> +}
> +
> +ssize_t sdhci_read_cmd(QTestState *qts, uint64_t base_addr, char *msg,
> +                       size_t count)
> +{
> +    sdhci_cmd_regs(qts, base_addr, count, 1, 0,
> +                   SDHC_TRNS_MULTI | SDHC_TRNS_READ |
> SDHC_TRNS_BLK_CNT_EN,
> +                   SDHC_READ_MULTIPLE_BLOCK | SDHC_CMD_DATA_PRESENT);
> +
> +    /* read sd fifo_buffer */
> +    ssize_t bytes_read = read_fifo(qts, base_addr + SDHC_BDATA, msg,
> count);
> +
> +    sdhci_cmd_regs(qts, base_addr, 0, 0, 0,
> +                   SDHC_TRNS_MULTI | SDHC_TRNS_READ |
> SDHC_TRNS_BLK_CNT_EN,
> +                   SDHC_STOP_TRANSMISSION);
> +
> +    return bytes_read;
> +}
> +
> +void sdhci_write_cmd(QTestState *qts, uint64_t base_addr, const char *msg,
> +                     size_t count, size_t blksize)
> +{
> +    sdhci_cmd_regs(qts, base_addr, blksize, 1, 0,
> +                   SDHC_TRNS_MULTI | SDHC_TRNS_WRITE |
> SDHC_TRNS_BLK_CNT_EN,
> +                   SDHC_WRITE_MULTIPLE_BLOCK | SDHC_CMD_DATA_PRESENT);
> +
> +    /* write to sd fifo_buffer */
> +    write_fifo(qts, base_addr + SDHC_BDATA, msg, count);
> +    fill_block(qts, base_addr + SDHC_BDATA, (blksize - count) / 4);
> +
> +    sdhci_cmd_regs(qts, base_addr, 0, 0, 0,
> +                   SDHC_TRNS_MULTI | SDHC_TRNS_WRITE |
> SDHC_TRNS_BLK_CNT_EN,
> +                   SDHC_STOP_TRANSMISSION);
> +}
> diff --git a/tests/qtest/libqos/meson.build
> b/tests/qtest/libqos/meson.build
> index 1f5c8f1053..4af1f04787 100644
> --- a/tests/qtest/libqos/meson.build
> +++ b/tests/qtest/libqos/meson.build
> @@ -5,6 +5,7 @@ libqos_srcs = files('../libqtest.c',
>          'fw_cfg.c',
>          'malloc.c',
>          'libqos.c',
> +        'sdhci-cmd.c',
>
>          # spapr
>          'malloc-spapr.c',
> --
> 2.25.1
>
>

--0000000000005a85ca05cfd61c5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;ve sent a new patch set which=
 uses memcpy here. Thank you!</div><div><br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 2, 2021 at 11=
:25 AM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org=
">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">From: Shengtan Mao &lt;<a href=3D"mailto:stma=
o@google.com" target=3D"_blank">stmao@google.com</a>&gt;<br>
<br>
Signed-off-by: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" target=
=3D"_blank">stmao@google.com</a>&gt;<br>
Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"=
_blank">wuhaotsh@google.com</a>&gt;<br>
Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_b=
lank">wuhaotsh@google.com</a>&gt;<br>
Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" target=3D=
"_blank">crauer@google.com</a>&gt;<br>
Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" target=
=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20211008002628.1958285-5-wuhaotsh@google.=
com" target=3D"_blank">20211008002628.1958285-5-wuhaotsh@google.com</a>&gt;=
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0tests/qtest/libqos/sdhci-cmd.h |=C2=A0 70 ++++++++++++++++++++<br>
=C2=A0tests/qtest/libqos/sdhci-cmd.c | 116 ++++++++++++++++++++++++++++++++=
+<br>
=C2=A0tests/qtest/libqos/meson.build |=C2=A0 =C2=A01 +<br>
=C2=A03 files changed, 187 insertions(+)<br>
=C2=A0create mode 100644 tests/qtest/libqos/sdhci-cmd.h<br>
=C2=A0create mode 100644 tests/qtest/libqos/sdhci-cmd.c<br>
<br>
diff --git a/tests/qtest/libqos/sdhci-cmd.h b/tests/qtest/libqos/sdhci-cmd.=
h<br>
new file mode 100644<br>
index 0000000000..64763c5a2a<br>
--- /dev/null<br>
+++ b/tests/qtest/libqos/sdhci-cmd.h<br>
@@ -0,0 +1,70 @@<br>
+/*<br>
+ * MMC Host Controller Commands<br>
+ *<br>
+ * Copyright (c) 2021 Google LLC<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT<br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License<br=
>
+ * for more details.<br>
+ */<br>
+<br>
+#include &quot;libqtest.h&quot;<br>
+<br>
+/* more details at hw/sd/sdhci-internal.h */<br>
+#define SDHC_BLKSIZE 0x04<br>
+#define SDHC_BLKCNT 0x06<br>
+#define SDHC_ARGUMENT 0x08<br>
+#define SDHC_TRNMOD 0x0C<br>
+#define SDHC_CMDREG 0x0E<br>
+#define SDHC_BDATA 0x20<br>
+#define SDHC_PRNSTS 0x24<br>
+#define SDHC_BLKGAP 0x2A<br>
+#define SDHC_CLKCON 0x2C<br>
+#define SDHC_SWRST 0x2F<br>
+#define SDHC_CAPAB 0x40<br>
+#define SDHC_MAXCURR 0x48<br>
+#define SDHC_HCVER 0xFE<br>
+<br>
+/* TRNSMOD Reg */<br>
+#define SDHC_TRNS_BLK_CNT_EN 0x0002<br>
+#define SDHC_TRNS_READ 0x0010<br>
+#define SDHC_TRNS_WRITE 0x0000<br>
+#define SDHC_TRNS_MULTI 0x0020<br>
+<br>
+/* CMD Reg */<br>
+#define SDHC_CMD_DATA_PRESENT (1 &lt;&lt; 5)<br>
+#define SDHC_ALL_SEND_CID (2 &lt;&lt; 8)<br>
+#define SDHC_SEND_RELATIVE_ADDR (3 &lt;&lt; 8)<br>
+#define SDHC_SELECT_DESELECT_CARD (7 &lt;&lt; 8)<br>
+#define SDHC_SEND_CSD (9 &lt;&lt; 8)<br>
+#define SDHC_STOP_TRANSMISSION (12 &lt;&lt; 8)<br>
+#define SDHC_READ_MULTIPLE_BLOCK (18 &lt;&lt; 8)<br>
+#define SDHC_WRITE_MULTIPLE_BLOCK (25 &lt;&lt; 8)<br>
+#define SDHC_APP_CMD (55 &lt;&lt; 8)<br>
+<br>
+/* SWRST Reg */<br>
+#define SDHC_RESET_ALL 0x01<br>
+<br>
+/* CLKCTRL Reg */<br>
+#define SDHC_CLOCK_INT_EN 0x0001<br>
+#define SDHC_CLOCK_INT_STABLE 0x0002<br>
+#define SDHC_CLOCK_SDCLK_EN (1 &lt;&lt; 2)<br>
+<br>
+/* Set registers needed to send commands to SD */<br>
+void sdhci_cmd_regs(QTestState *qts, uint64_t base_addr, uint16_t blksize,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint=
16_t blkcnt, uint32_t argument, uint16_t trnmod,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint=
16_t cmdreg);<br>
+<br>
+/* Read at most 1 block of SD using non-DMA=C2=A0 */<br>
+ssize_t sdhci_read_cmd(QTestState *qts, uint64_t base_addr, char *msg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0size_t count);<br>
+<br>
+/* Write at most 1 block of SD using non-DMA=C2=A0 */<br>
+void sdhci_write_cmd(QTestState *qts, uint64_t base_addr, const char *msg,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0size_t count, size_t blksize);<br>
diff --git a/tests/qtest/libqos/sdhci-cmd.c b/tests/qtest/libqos/sdhci-cmd.=
c<br>
new file mode 100644<br>
index 0000000000..2d9e518341<br>
--- /dev/null<br>
+++ b/tests/qtest/libqos/sdhci-cmd.c<br>
@@ -0,0 +1,116 @@<br>
+/*<br>
+ * MMC Host Controller Commands<br>
+ *<br>
+ * Copyright (c) 2021 Google LLC<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT<br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License<br=
>
+ * for more details.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;sdhci-cmd.h&quot;<br>
+#include &quot;libqtest.h&quot;<br>
+<br>
+static ssize_t read_fifo(QTestState *qts, uint64_t reg, char *msg, size_t =
count)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t mask =3D 0xff;<br>
+=C2=A0 =C2=A0 size_t index =3D 0;<br>
+=C2=A0 =C2=A0 uint32_t msg_frag;<br>
+=C2=A0 =C2=A0 int size;<br>
+=C2=A0 =C2=A0 while (index &lt; count) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D count - index;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &gt; 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg_frag =3D qtest_readl(qts, reg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (size &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg[index] =3D msg_frag &amp; ma=
sk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (msg[index++] =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return index;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg_frag &gt;&gt;=3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return index;<br>
+}<br>
+<br>
+static void write_fifo(QTestState *qts, uint64_t reg, const char *msg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0size_t count)<br>
+{<br>
+=C2=A0 =C2=A0 size_t index =3D 0;<br>
+=C2=A0 =C2=A0 uint32_t msg_frag;<br>
+=C2=A0 =C2=A0 int size;<br>
+=C2=A0 =C2=A0 int frag_i;<br>
+=C2=A0 =C2=A0 while (index &lt; count) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D count - index;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &gt; 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg_frag =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 frag_i =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (frag_i &lt; size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg_frag |=3D ((uint32_t)msg[ind=
ex++]) &lt;&lt; (frag_i * 8);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++frag_i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_writel(qts, reg, msg_frag);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void fill_block(QTestState *qts, uint64_t reg, int count)<br>
+{<br>
+=C2=A0 =C2=A0 while (--count &gt;=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_writel(qts, reg, 0);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+void sdhci_cmd_regs(QTestState *qts, uint64_t base_addr, uint16_t blksize,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint=
16_t blkcnt, uint32_t argument, uint16_t trnmod,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint=
16_t cmdreg)<br>
+{<br>
+=C2=A0 =C2=A0 qtest_writew(qts, base_addr + SDHC_BLKSIZE, blksize);<br>
+=C2=A0 =C2=A0 qtest_writew(qts, base_addr + SDHC_BLKCNT, blkcnt);<br>
+=C2=A0 =C2=A0 qtest_writel(qts, base_addr + SDHC_ARGUMENT, argument);<br>
+=C2=A0 =C2=A0 qtest_writew(qts, base_addr + SDHC_TRNMOD, trnmod);<br>
+=C2=A0 =C2=A0 qtest_writew(qts, base_addr + SDHC_CMDREG, cmdreg);<br>
+}<br>
+<br>
+ssize_t sdhci_read_cmd(QTestState *qts, uint64_t base_addr, char *msg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0size_t count)<br>
+{<br>
+=C2=A0 =C2=A0 sdhci_cmd_regs(qts, base_addr, count, 1, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDHC_=
TRNS_MULTI | SDHC_TRNS_READ | SDHC_TRNS_BLK_CNT_EN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDHC_=
READ_MULTIPLE_BLOCK | SDHC_CMD_DATA_PRESENT);<br>
+<br>
+=C2=A0 =C2=A0 /* read sd fifo_buffer */<br>
+=C2=A0 =C2=A0 ssize_t bytes_read =3D read_fifo(qts, base_addr + SDHC_BDATA=
, msg, count);<br>
+<br>
+=C2=A0 =C2=A0 sdhci_cmd_regs(qts, base_addr, 0, 0, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDHC_=
TRNS_MULTI | SDHC_TRNS_READ | SDHC_TRNS_BLK_CNT_EN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDHC_=
STOP_TRANSMISSION);<br>
+<br>
+=C2=A0 =C2=A0 return bytes_read;<br>
+}<br>
+<br>
+void sdhci_write_cmd(QTestState *qts, uint64_t base_addr, const char *msg,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0size_t count, size_t blksize)<br>
+{<br>
+=C2=A0 =C2=A0 sdhci_cmd_regs(qts, base_addr, blksize, 1, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDHC_=
TRNS_MULTI | SDHC_TRNS_WRITE | SDHC_TRNS_BLK_CNT_EN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDHC_=
WRITE_MULTIPLE_BLOCK | SDHC_CMD_DATA_PRESENT);<br>
+<br>
+=C2=A0 =C2=A0 /* write to sd fifo_buffer */<br>
+=C2=A0 =C2=A0 write_fifo(qts, base_addr + SDHC_BDATA, msg, count);<br>
+=C2=A0 =C2=A0 fill_block(qts, base_addr + SDHC_BDATA, (blksize - count) / =
4);<br>
+<br>
+=C2=A0 =C2=A0 sdhci_cmd_regs(qts, base_addr, 0, 0, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDHC_=
TRNS_MULTI | SDHC_TRNS_WRITE | SDHC_TRNS_BLK_CNT_EN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDHC_=
STOP_TRANSMISSION);<br>
+}<br>
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.buil=
d<br>
index 1f5c8f1053..4af1f04787 100644<br>
--- a/tests/qtest/libqos/meson.build<br>
+++ b/tests/qtest/libqos/meson.build<br>
@@ -5,6 +5,7 @@ libqos_srcs =3D files(&#39;../libqtest.c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;fw_cfg.c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;malloc.c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;libqos.c&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;sdhci-cmd.c&#39;,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# spapr<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;malloc-spapr.c&#39;,<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000005a85ca05cfd61c5c--

