Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39B06987A0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 23:07:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSPuh-0004iN-Hh; Wed, 15 Feb 2023 17:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pSPuc-0004iC-H6
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 17:06:02 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pSPua-0003fe-MU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 17:06:02 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id b1so21278ybn.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 14:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gQvjybSWyVctoFCMbT2rogTOFg+EN/fBc/Om/kYgQ+8=;
 b=lZAvLQj1zNkZVztTzcDSnWSbtC4JQbfYJ+nrWD+ayDG7jPgVCfVoX1JfY/jQ9rsg1e
 gjp4DcVJJTa8mNXG1weLdR36Nyuk8B0TSf4sCkBG8FuMkgJV7La6GCr8VXNJ6OgkmSTg
 DnxRAcDMLLTcafKVZnY8k42LrM+rr1MkazgfxsUubPO7V3F/VH4WzL4y3rSB7J2tUwNZ
 wjB3AYUffmc6IaqY8M2n4bMNo0TfzRsQXlGCuV4/D72TxryCFO57+LCKyf52CbNIBiVH
 SZUP/SKhWo7s+/n5BYMOc3cKjWrxqKDy8a6e30vOg6ialq9jV5PMNp8WC3MMayZJISvL
 zJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gQvjybSWyVctoFCMbT2rogTOFg+EN/fBc/Om/kYgQ+8=;
 b=c4SYw+PsW3HCZGcJzRdD2rxZ2Xz8Ulh+v0Au1gA5Elwgpq2L5+uTFNUsMjE8AYkBDs
 m1RXVWvOKJeP9GVYPZ/pPj8PGaJw9BII/3zA0epHBCeegARXRCAzJVFJUaDgCOJAj4mi
 92TuiLXihWFUQ5QWkOuZawUg6TvJx7kwn53ahFLANrJGItJYAEMPgvjsSRtIElYQ7TOY
 hDqYLpl/bt3SkkZFv0SRDj5hEWtnVFz/5ZrC4Yu6j14LyTQqfSopeOfdxkelnzrzW5y5
 4yOUJLjs6a7Ix+xk457gR0je6S9z/OjRvNwnF1SqxiuOGEEwCHHm6eKbrKIHtStQuJm+
 aGbA==
X-Gm-Message-State: AO0yUKW9+eyNpMnVGYPT4GfFIJFkQtG5CYpn5JGHsE3q6qwT6OzEYbON
 6nwReCTznMe/B4DnD/stXc7WB+UaTb1XF+V2ZcI=
X-Google-Smtp-Source: AK7set8AZGm9CpU7cpQF4IT7yTCa2/Avb8lDC5oAy2ecJR7HW/Vat4xKbE05B/ZUBt5h7e769d5B9QpcSbAv5HMX3cA=
X-Received: by 2002:a5b:404:0:b0:8df:758f:68e6 with SMTP id
 m4-20020a5b0404000000b008df758f68e6mr495917ybp.356.1676498758870; Wed, 15 Feb
 2023 14:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20220607203221.966261-1-vsementsov@yandex-team.ru>
In-Reply-To: <20220607203221.966261-1-vsementsov@yandex-team.ru>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 15 Feb 2023 17:05:47 -0500
Message-ID: <CAJSP0QVNnGg+5OkDwpk3Kgc=kicsSt+f5QVg1tyd+ze76N_KVw@mail.gmail.com>
Subject: Re: [PATCH] qemu: make version available in coredump
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, 
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Jun 2022 at 16:33, Vladimir Sementsov-Ogievskiy
<vsementsov@yandex-team.ru> wrote:
>
> Add a variable with QEMU_FULL_VERSION definition. Then the content of
> the variable is easily searchable:
>
>    strings /path/to/core | grep QEMU_FULL_VERSION
>
> 'volatile' keyword is used to avoid removing the variable by compiler as
> unused.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>
> Hi all!
>
> Probably, I just don't know the correct way to get version from core
> file. If so, please teach me :)

I've never hit this issue because bug reports usually include the QEMU
distro package version. Keeping the version string in the core file
seems reasonable (unless there is already another way to do this).

Something I'm curious about: is the coredump guaranteed to contain
static const variables? I wondered if they might be located in the
.rodata ELF section and excluded from the coredump because they are
referenced in the NT_FILE mmap note instead. Maybe volatile prevents
this?

I CCed Laszlo because I think he worked on crash dumping in the past
and might know the answer to my question about coredumps.

Stefan

>
>  softmmu/vl.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 4c1e94b00e..1f51a713a0 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -164,6 +164,19 @@ typedef struct DeviceOption {
>      QTAILQ_ENTRY(DeviceOption) next;
>  } DeviceOption;
>
> +/*
> + * qemu_full_version_decl is for debugging. Assume you have coredump file, but
> + * don't know the version neither have original qemu binary file. You need to
> + * download a package with corresponding binary (and debug package with
> + * symbols), but which one? You need the version.
> + *
> + * This variable makes it simple to get the version by command
> + *
> + *     strings path/to/core | grep QEMU_FULL_VERSION
> + */
> +static volatile const char qemu_full_version_decl[] =
> +    "QEMU_FULL_VERSION: " QEMU_FULL_VERSION;
> +
>  static const char *cpu_option;
>  static const char *mem_path;
>  static const char *incoming;
> --
> 2.25.1
>
>

