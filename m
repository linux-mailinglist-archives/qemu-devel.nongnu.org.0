Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0961D48D1A9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 05:31:53 +0100 (CET)
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7rmB-00010X-Fi
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 23:31:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n7rkn-0000FK-Jo
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 23:30:25 -0500
Received: from [2607:f8b0:4864:20::12d] (port=35350
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n7rkk-0006FK-W5
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 23:30:24 -0500
Received: by mail-il1-x12d.google.com with SMTP id b1so4545790ilj.2
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 20:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YCXdP6hCrItBGmK4DUyaoOdv4S9nY75o2QfAu2dNq/0=;
 b=dmse0DEYroSW6+qpfQZiw1Y3ZUiisT9GEAsI9NpeE77QwJS98OOnCQgacw1k91Uut8
 GSF8VaocsqFg2lfqP1zJBEiXXrgTSE9t/bKJgEMftBzP23BrUBI5CMJYWzxuLKvMUnz7
 7QPc3JZtOfzqOLwO2M729Plv0gE8aAqJseEoIuMkw8cDz8PRS/05k6CKkV9+TH/fnq2m
 vXpe7iV54ae1O3xjFlLtJeOAaQWw8mDUwIWOyHw58tfthe+sbK5Pe8Rcq4kr1xzpsJqO
 bQnc6NiK+j4imGXkMRZh86/hAt50YJY532ZFHyzGNC0AcgYHMUy3G+8LeVih3oloHLYH
 9IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCXdP6hCrItBGmK4DUyaoOdv4S9nY75o2QfAu2dNq/0=;
 b=otM/Rd4Xhi6c8n2JoaWM7XlByIj62VhWPb4d9n6mijeOY9l+UadocrQgkOcU9jT5Sm
 XqM7j6+XepbIXo6Jr4Xgo1vQNUmQuURUqmxnj5TKcTA0wC5OQAoDuF9lircSEQuLESat
 1v+CCgWHKxvmV6WDLheXDWXrhl8oJMbeUzjYYkyYr16N1LgnTwfYcBXIQs8i08ppLB0r
 5RurJIzbtCeBZP19o4Jd4nWaknBLsnJiB6lSCkcsl/4dqV7yAuhseKRjTNJ/yNjhFPvw
 DLR3heMmkTCfe1bBO5y70qs+5wrbT2GLjx0OPVTe5YCeDQELdMNh52V6WloLMMDqF31x
 SJXg==
X-Gm-Message-State: AOAM531/cXObwNZsFdOri0NivCNuB70IeeUJmn+LyTcOb+xX8D2qwMiL
 6uxxD1uLN0v2uRsdi1MzkCllM54AcO/6YkSFzdY=
X-Google-Smtp-Source: ABdhPJzSUxzWajIXo33kHc9/z4rqFLZ21lA6KZOBa6FSu4wcXcjcVQpXK6S9Ufl4d2aPt33e6r9pKexcsee3ex9yJ4M=
X-Received: by 2002:a92:3012:: with SMTP id x18mr795107ile.221.1642048221556; 
 Wed, 12 Jan 2022 20:30:21 -0800 (PST)
MIME-Version: 1.0
References: <20220111032758.27804-1-wangyanan55@huawei.com>
In-Reply-To: <20220111032758.27804-1-wangyanan55@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 Jan 2022 14:29:55 +1000
Message-ID: <CAKmqyKPsHG=ohDME04b+bTGPmzJ7_dAWEG7JGeXbginph-MsMg@mail.gmail.com>
Subject: Re: [PATCH] softmmu/device_tree: Remove redundant pointer assignment
To: Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

