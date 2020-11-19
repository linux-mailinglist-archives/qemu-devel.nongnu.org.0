Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9942B9BEC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:22:01 +0100 (CET)
Received: from localhost ([::1]:50360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfqRM-00012R-FW
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kfq9h-0002Ao-Ca; Thu, 19 Nov 2020 15:03:45 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kfq9I-0002wC-Ht; Thu, 19 Nov 2020 15:03:44 -0500
Received: by mail-io1-xd44.google.com with SMTP id d17so7472831ion.4;
 Thu, 19 Nov 2020 12:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qPTWeo6sJ8+COkYnW7wddR21z8R0rLglTzXlni0Wlcw=;
 b=AnkfTQEP917cEoa4AazK6DrUW1sUvskak/v41iWRUymNXJhn2Xi/gy6zp7o55RgU8r
 /x/1alsFVWSB2eFI/QSADD9Uy166bmPsJGOm6L+Qr7mRTaqVrk933ptKpxeifeCma/1F
 7D8fNwzYfNBJoVcCvdPd6VKUw34fVltqNll0nQ+OGpKbDFjWBVnKFE6O8CplpfJoMGaf
 kZL3irH3TbMLudhBFdJN7eREGblpxHSQohNgLP/BNMjLlii2zG8HxQ/yZWlXCKyd+nmI
 etNi3C+NeKEG+pCYMz4RJMDBAqNqMXS50afqDS15hzly3l27uHtIzaOkh0QDQGlnKTPX
 25rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qPTWeo6sJ8+COkYnW7wddR21z8R0rLglTzXlni0Wlcw=;
 b=A2rbXsu3WyyEsVzJ4jdly0MDEXT4xOgAX+TqhDCKDrUPXh0OGRnEmXUxlDL4sfM1ae
 lNK99tmMuGKh/fHtVpUgmCPgaPYadDS9BgqyzpjRdievfDI2yqxvw+NwXIInF/pMBuBO
 yhuaLMAHIVdOXm+oBYcCKyXpC82MxkOvlh7CHuW1dCSR+xD9qpbm9UhBgoM02emyuHuW
 q2xT44/fn2MfbMKg41VtuU4phO7jBk6uHAsDZUMmUS/ZGME84tAJQ4/ffyJ4efwT1o+y
 oRZpBW54HVpqea9+vdYbuC1+VZyhmbe6xU4I++qYcrHWqb5aSvAsk621V5lnmqSYZc3n
 mqeA==
X-Gm-Message-State: AOAM531iKUzIT3ViqBNL9Qu1HsJQPnm8jmbHAUmd7buUvZD+FQ6c46Iw
 gzmuHa4ftaTnKFd0+4Txl+yHfZ07pdkcqt4kF9Q=
X-Google-Smtp-Source: ABdhPJxlc4+dZHpHBxvj1J5zk1V/gG2ZK3FxDn4QrJYCG6er0lF8RcB4/i13jUW8zHhXNyyW/ENQ8sa/qxxiOYj1bQA=
X-Received: by 2002:a6b:b30b:: with SMTP id c11mr7232104iof.175.1605816169485; 
 Thu, 19 Nov 2020 12:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20201116140148.2850128-1-zhangxinhao1@huawei.com>
In-Reply-To: <20201116140148.2850128-1-zhangxinhao1@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Nov 2020 11:50:25 -0800
Message-ID: <CAKmqyKPz3Lfc2JjPRkeQReWpPsY=thSoT6jPUM8SjcqM8mehZg@mail.gmail.com>
Subject: Re: [PATCH] hw/core/register.c: Don't use '#' flag of printf format
To: Xinhao Zhang <zhangxinhao1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
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
Cc: AlexChen <alex.chen@huawei.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "dengkai \(A\)" <dengkai1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 6:07 AM Xinhao Zhang <zhangxinhao1@huawei.com> wrote:
>
> Fix code style. Don't use '#' flag of printf format ('%#') in
> format strings, use '0x' prefix instead
>
> Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
> Signed-off-by: Kai Deng <dengkai1@huawei.com>

Thanks for the patch!

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

I'm going to take this via the RISC-V tree when the 6.0 development
process starts.

Alistair

> ---
>  hw/core/register.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/core/register.c b/hw/core/register.c
> index 31038bd7cc..7986913130 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -80,7 +80,7 @@ void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
>
>      if (!ac || !ac->name) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: write to undefined device state "
> -                      "(written value: %#" PRIx64 ")\n", prefix, val);
> +                      "(written value: 0x%" PRIx64 ")\n", prefix, val);
>          return;
>      }
>
> @@ -89,14 +89,14 @@ void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
>      test = (old_val ^ val) & ac->rsvd;
>      if (test) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: change of value in reserved bit"
> -                      "fields: %#" PRIx64 ")\n", prefix, test);
> +                      "fields: 0x%" PRIx64 ")\n", prefix, test);
>      }
>
>      test = val & ac->unimp;
>      if (test) {
>          qemu_log_mask(LOG_UNIMP,
> -                      "%s:%s writing %#" PRIx64 " to unimplemented bits:" \
> -                      " %#" PRIx64 "\n",
> +                      "%s:%s writing 0x%" PRIx64 " to unimplemented bits:" \
> +                      " 0x%" PRIx64 "\n",
>                        prefix, reg->access->name, val, ac->unimp);
>      }
>
> @@ -112,7 +112,7 @@ void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
>      }
>
>      if (debug) {
> -        qemu_log("%s:%s: write of value %#" PRIx64 "\n", prefix, ac->name,
> +        qemu_log("%s:%s: write of value 0x%" PRIx64 "\n", prefix, ac->name,
>                   new_val);
>      }
>
> @@ -150,7 +150,7 @@ uint64_t register_read(RegisterInfo *reg, uint64_t re, const char* prefix,
>      }
>
>      if (debug) {
> -        qemu_log("%s:%s: read of value %#" PRIx64 "\n", prefix,
> +        qemu_log("%s:%s: read of value 0x%" PRIx64 "\n", prefix,
>                   ac->name, ret);
>      }
>
> @@ -193,7 +193,7 @@ void register_write_memory(void *opaque, hwaddr addr,
>
>      if (!reg) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: write to unimplemented register " \
> -                      "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
> +                      "at address: 0x%" PRIx64 "\n", reg_array->prefix, addr);
>          return;
>      }
>
> @@ -222,7 +222,7 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
>
>      if (!reg) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s:  read to unimplemented register " \
> -                      "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
> +                      "at address: 0x%" PRIx64 "\n", reg_array->prefix, addr);
>          return 0;
>      }
>
> --
> 2.29.0-rc1
>
>

