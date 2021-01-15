Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79D62F87D1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:44:06 +0100 (CET)
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Wt3-0001e2-DM
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0WrK-0000et-Aa
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:42:18 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:45551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0WrI-0000Qz-H5
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:42:18 -0500
Received: by mail-io1-xd31.google.com with SMTP id n4so20911153iow.12
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MYcIDpRzEJf4M7Nj2w3zUjq6AIlC4rNxrHR01CqUzZk=;
 b=tbZq35mH1Gr+RoiEvWgY7KnBW7pnOsvhMlTwV634J3cM7TQO0dvRLy21ZhLo5J8/Z5
 7X0T+nxJ7BanI2G2gOBaFIeHeWD2N0ermc1DPBngfU2XtYc7Ej06H/Q6WuHe+ShDed2i
 tcUnXf7zmxO9ZJTOgWG/lQEb6j/RRyr44hI6avWZu7LhMUYTTaATh6daVdIKH4MB7E2P
 juq88hdfROTw18e3l9cA/xCw2iSCYHmLdeZdEDV9uUpfcWdBGOq9emTf1L5VuoWeezYx
 ozXTsDDpCM5lcXNEIEJlH4zK8CSI7qsRWmMuUw/tAFQAU8iQiR11VJdL0dllrnPTVeNE
 Nlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MYcIDpRzEJf4M7Nj2w3zUjq6AIlC4rNxrHR01CqUzZk=;
 b=JmuhyXxi/AOvHwyMNFK2yh0kOxvsW2CqIv/ihGXyzMYT/zSBFiw/ThGdDIqna6wNCT
 KpMXSUx9yIBVnUq1EaSwPLCtLNz7w9PG/NOZnZ++aLT5IuaPxsRB7BhGcASfXvAigJe4
 OcxmcUKfF8XBDXHlaj83QgvhAY5zPhsFmVER7lBSl/tzhSoBg90Q/fglni4QHh2zNYJR
 e7PtlJ5AYPzGchq5ApbGQulc0fjs5w1yBaXBPUU5Oe7MEzbXlqCQ+nuLE5oahfnsQBhN
 gV0mlIsykKPlLOXsJRVM15YuhLqsskCLM8KqN67ChAbw82xGqJghg1EstkeLLwZ4hu2H
 4Ekw==
X-Gm-Message-State: AOAM5337K9eo2EgIZztA4NLl3RNHqBOHgsTeoD7/4GLfSrC7fykvDEkG
 qwgHtSIsZcZG2uIP4oKgZoPCgZocVwYYFRvaNP0=
X-Google-Smtp-Source: ABdhPJyi4anhwnSj1CJuJI7oL6lES1iIbd0AAj6FZqQ2J1cRubAVaz6bDbaJqOZO/CX4nAe48llsMjfMunetuv7lqR8=
X-Received: by 2002:a92:c942:: with SMTP id i2mr12311122ilq.227.1610746934700; 
 Fri, 15 Jan 2021 13:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20201104092900.21214-1-green.wan@sifive.com>
In-Reply-To: <20201104092900.21214-1-green.wan@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 13:41:48 -0800
Message-ID: <CAKmqyKM7FcuQvZVApiH0U-sczEZA9QsWs57UkaR5ZWP-Gf1VxA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/sifive_u_otp: handling the fails of blk_pread and
 blk_pwrite
To: Green Wan <green.wan@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bmeng.cn@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 4, 2020 at 1:29 AM Green Wan <green.wan@sifive.com> wrote:
>
> Fix code coverage issues by checking return value and handling fail case
> of blk_pread() and blk_pwrite(). Return default value 0xff if read fails.
>
> Signed-off-by: Green Wan <green.wan@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/misc/sifive_u_otp.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> index 60066375ab..4314727d0d 100644
> --- a/hw/misc/sifive_u_otp.c
> +++ b/hw/misc/sifive_u_otp.c
> @@ -62,8 +62,13 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
>              if (s->blk) {
>                  int32_t buf;
>
> -                blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
> -                          SIFIVE_U_OTP_FUSE_WORD);
> +                if (blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
> +                              SIFIVE_U_OTP_FUSE_WORD) < 0) {
> +                    qemu_log_mask(LOG_GUEST_ERROR,
> +                                  "read error index<%d>\n", s->pa);
> +                    return 0xff;
> +                }
> +
>                  return buf;
>              }
>
> @@ -160,8 +165,12 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
>
>              /* write to backend */
>              if (s->blk) {
> -                blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
> -                           &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD, 0);
> +                if (blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
> +                               &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD,
> +                               0) < 0) {
> +                    qemu_log_mask(LOG_GUEST_ERROR,
> +                                  "write error index<%d>\n", s->pa);
> +                }
>              }
>
>              /* update written bit */
> @@ -248,12 +257,18 @@ static void sifive_u_otp_reset(DeviceState *dev)
>          int index = SIFIVE_U_OTP_SERIAL_ADDR;
>
>          serial_data = s->serial;
> -        blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
> -                   &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0);
> +        if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
> +                       &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "write error index<%d>\n", index);
> +        }
>
>          serial_data = ~(s->serial);
> -        blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
> -                   &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0);
> +        if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
> +                       &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "write error index<%d>\n", index + 1);
> +        }
>      }
>
>      /* Initialize write-once map */
> --
> 2.17.1
>

