Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641A34930EE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 23:39:49 +0100 (CET)
Received: from localhost ([::1]:37174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9x8l-0003Lg-Ao
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 17:39:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9x4R-0006YU-Ib; Tue, 18 Jan 2022 17:35:19 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=46887
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9x4P-0004Rs-5d; Tue, 18 Jan 2022 17:35:18 -0500
Received: by mail-io1-xd2e.google.com with SMTP id e79so457041iof.13;
 Tue, 18 Jan 2022 14:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aj58BZftjsOalvpIFoNMwHjw8L2LEe11sJbVpaEDUu4=;
 b=kfBjnc6cDJwFcSNWeCE8+BknNVJBPJ3s0CDU2rV9fttyRJxqF+5hoZvhxGhfWQh/iM
 8jHYpzOAkUdgOOxFEOygVrVwm4mpogb6wynDvJAn/GL6I5rzLNbDkhR+YnMdDZ1I4OP4
 idN7ZuhkZ+dc6stzOsDiKx7ZJt2c0N6Fmx04hqF3Sq/5T567V0B5qxF9Xc8LSJlJ8UZ2
 MEx1HxauF5kCSJxn78fa+TiBpAotiJx8vQ3ykHNGZi6B4Zl0EbCVGWxL7FHZQhgUjTPZ
 YVs5M4mZfuY5TtRLvAvGYRh7JBPYnUTSrDe9JdiNWs+0s75l4vxPSjtYtRb7NBT2eaGd
 8qHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aj58BZftjsOalvpIFoNMwHjw8L2LEe11sJbVpaEDUu4=;
 b=THePwuufjl0s5xdkL/zVrPkKsEtESwYw1WPqmNcKw04JHrLJn7z47UZgXmGHVe/NS6
 cTGXhI8xFO5lCx5seV3BsnkEUx0jxZsS8Z2wqTJy6kEpgj+i2W3msJ/0RhvU+jOVc9XC
 z0a6trggWvux158U2FZTYg7oWetS5DBwa8Rn2NhPqwEIPu9dCPfdiDD/RtOcZ/O8LToT
 Hls+yIeeFuTghvdiL7wQy515T5rP44jk1SUq84DlWw3C3pOhjeUn2ykVhfqCgG4UAGJw
 xaCvQBrc4K1VYGyKWfTWcLim5GGFUgCo2O+yxhWLVqqZFHmYlVT5MK2s7ju3dbfE0QsU
 S7qA==
X-Gm-Message-State: AOAM533Ry3aYnPI4hKRF4SFWm6OuhBQenu2cBBDLAa8qrztISzrImdYn
 VynPfHnI1v8+NIXnhkmHNIMKW3UrLU7w/1dx9z4=
X-Google-Smtp-Source: ABdhPJzIDDzRDJ5ZXYvR1b/twWZXIpP1yf355p0Ur3c48x2iI+s/3j4NGjwOkHZbKozXIyPgoQ+NghHnTjcqe0XVGRE=
X-Received: by 2002:a02:6954:: with SMTP id e81mr12834453jac.63.1642545315693; 
 Tue, 18 Jan 2022 14:35:15 -0800 (PST)
MIME-Version: 1.0
References: <20220118170548.97288-1-thuth@redhat.com>
In-Reply-To: <20220118170548.97288-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 08:34:49 +1000
Message-ID: <CAKmqyKMFGynZXLtQMqodnbt4-JVf4HQwF+2Leac-VXF34vtJdQ@mail.gmail.com>
Subject: Re: [PATCH] meson.build: Use a function from libfdt 1.5.1 for the
 library check
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 3:42 AM Thomas Huth <thuth@redhat.com> wrote:
>
> The fdt version test in meson.build uses a function from libfdt v1.4.7,
> but we require version 1.5.1 nowadays. Thus use a function that has
> been introduced in that version instead.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/822
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 762d7cee85..d1cc04c7a2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2276,7 +2276,7 @@ if have_system
>      if fdt.found() and cc.links('''
>         #include <libfdt.h>
>         #include <libfdt_env.h>
> -       int main(void) { fdt_check_full(NULL, 0); return 0; }''',
> +       int main(void) { fdt_find_max_phandle(NULL, NULL); return 0; }''',
>           dependencies: fdt)
>        fdt_opt = 'system'
>      elif fdt_opt == 'system'
> --
> 2.27.0
>
>

