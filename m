Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C064911F6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 23:52:34 +0100 (CET)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9arY-0001SR-Uf
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 17:52:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9anX-0000eX-WE
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 17:48:24 -0500
Received: from [2607:f8b0:4864:20::d32] (port=35433
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9anV-0000MP-A9
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 17:48:23 -0500
Received: by mail-io1-xd32.google.com with SMTP id p7so23412136iod.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 14:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mn58rj0ZliGxXdjzC3bpj2ZdbEk9ZadbWstsQH6mJsg=;
 b=U28wGIL2w8eLG1NV1o1oDWojKZ9nUIk8O0Bg13u/tS6ucqtzHkcQX2CItYP5QZbRoO
 9SACSqRwaBM001/qAIQQs363HhzXwhgCQhj1Ha+FEt3LEXBMX74mS5KLLQwqJOU0OrQo
 rlxoXm0PuocfWUiMswc14GkH0WDyGoNKkoj0d3b9Ti63uDR4mLMETn9gJY4gyovB4cEH
 sZlvFIRFwWfwUnVDD5adv1DyZ6X5adOxwraFv2RRNNt62MpaPxIfFXjNsU6HkiR8lMCI
 PynYCo4lmKSoh8/vIv2uJRSyXg6C3xn6rT882ZXan4dhXTACO7POBWIapRcyL+hRQF6M
 cvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mn58rj0ZliGxXdjzC3bpj2ZdbEk9ZadbWstsQH6mJsg=;
 b=QpnzAU/7XoSoj/ql1lGBN73nwntTAp4PpbVwFKtFcfi9gt4swj3l3J4F8Yv2VvhTBX
 4UfW1GLEBRUZf099Io47DximB4mVLaei7FsYkLmaNTAlJSz3HXa9vaI6WCCYnMRTNH16
 6KJldgrWs9KBk7SEoU/UloLebF4I1Eb+vjZ7bItc3+tXAA6G9J+g95e3VvaTa0W10dbl
 rLQnytjQMFiOXRuOajZM6adlUhmOMIZClav2Lg1dZhhjDkOWqa4Hp/tPxISVMJkPAdwZ
 FYK36JburJ0+HK+rV5xB7/K6mzHtHxioo9GLVNLARPBln34pxelDxKm3yxcd+rf3BtRz
 x1rA==
X-Gm-Message-State: AOAM5310PLIXJ7zif7ZR0cXGmAz6rKUOCIwGNK+I7ID7sIPSeHrvPFAB
 wBxb7J2Resd5BNXKEivCCcOEgOSLdAtm2xN4wq4=
X-Google-Smtp-Source: ABdhPJya2hTLG6XI6qWy9kL7gQpkP3z0jPD/0XFzYgDjMAgp2O4z/POqIuIUYRTYY6amZqe/qnoU34PW9TCHCjV5GvU=
X-Received: by 2002:a05:6602:14cd:: with SMTP id
 b13mr5633844iow.57.1642459700268; 
 Mon, 17 Jan 2022 14:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20220111032758.27804-1-wangyanan55@huawei.com>
In-Reply-To: <20220111032758.27804-1-wangyanan55@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:47:54 +1000
Message-ID: <CAKmqyKPFU+JWfrdANmWWAKjTL=eDXmuG8xh=8exnQxm0BLYBAQ@mail.gmail.com>
Subject: Re: [PATCH] softmmu/device_tree: Remove redundant pointer assignment
To: Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Thomas Huth <thuth@redhat.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 1:28 PM Yanan Wang via <qemu-devel@nongnu.org> wrote:
>
> The pointer assignment "const char *p = path;" in function
> qemu_fdt_add_path is unnecessary. Let's remove it and just
> use the "path" passed in. No functional change.
>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Based on: softmmu/device_tree: Silence compiler warning with --enable-sanitizers
> https://patchew.org/QEMU/20220107133844.145039-1-thuth@redhat.com/
> ---
>  softmmu/device_tree.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 9e96f5ecd5..8897c79ea4 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -556,7 +556,6 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>  int qemu_fdt_add_path(void *fdt, const char *path)
>  {
>      const char *name;
> -    const char *p = path;
>      int namelen, retval;
>      int parent = 0;
>
> @@ -565,9 +564,9 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>      }
>
>      do {
> -        name = p + 1;
> -        p = strchr(name, '/');
> -        namelen = p != NULL ? p - name : strlen(name);
> +        name = path + 1;
> +        path = strchr(name, '/');
> +        namelen = path != NULL ? path - name : strlen(name);
>
>          retval = fdt_subnode_offset_namelen(fdt, parent, name, namelen);
>          if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
> @@ -584,7 +583,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
>          }
>
>          parent = retval;
> -    } while (p);
> +    } while (path);
>
>      return retval;
>  }
> --
> 2.27.0
>
>

