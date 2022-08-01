Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1508A586CDE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:31:59 +0200 (CEST)
Received: from localhost ([::1]:36800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWSb-0007cV-M6
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWPm-0004DP-2w; Mon, 01 Aug 2022 10:29:03 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWPk-00041N-BW; Mon, 01 Aug 2022 10:29:01 -0400
Received: by mail-yb1-xb32.google.com with SMTP id i62so17404260yba.5;
 Mon, 01 Aug 2022 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=kKcDFxiDRf+2N4e8QhF+i4cYteXbQYJpl5KGE+XbqaY=;
 b=foHp+t+z4fTqD2lc1Uu8Ggnvk+oNvDNuqvvZsJZmNSYdESZ4T/hvmgnXjl39/k9vkB
 qIxhVznryNzdH+7/GCjHf7F39+a5+YkWO6/xbhbD3HsVxQfHPWI2HMveBjlhne8ely2x
 +d8Hgj1lioQVL/Jzr0LzIM4vLTZS0+4VmbCNvS8W6HMCFTh6vHSWqUh/8xl56Q0pGyAo
 jzTVySuCbWlCq5o+ilyJMoU7KD96uXGtX6c6wX3WF+NtaiIqEEgSp7ycE08tT/2+wj2d
 pNZ9l2x6+RY0V5MBzry4i1hVhf/4D7I247F80ssyMjuhWpEskb+p/2aHB1COx9F2CSDe
 OP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=kKcDFxiDRf+2N4e8QhF+i4cYteXbQYJpl5KGE+XbqaY=;
 b=3oZHkD//UbEjVptVJgmCY0c8ktHE1t55wGPHg44fELiYk+Xq1Ix+/PaXorbAQrH8Kx
 B6+Xcv7CKcsEoJypePN6R+cyLUaapiSUucVjwU3nRHRT3FdkYyWuWUeb6WKqbXou/HT0
 Nc0p8vQXy0iQABG5MYtQ6EBy9HZKKFyn20DqVherONYnNJ0/cIWZPazianVykasklAsf
 nlZprtlYelbvsi7NawBUwxtdCYGiBYiaMKZPx6uFrNU4dcQsZTamU+3OSUc6rDJ6PdeP
 Q+2zF+fhWQHDida3L4OUX4vcFJlbq9FhgFeNRq+0oVc19ixAKr/8J3DR7U6IWo4n2SEI
 5OGw==
X-Gm-Message-State: ACgBeo06Y0/dfU3mM2HP1vxdFQ2dT2X3NUwPXeiQEJNpiJVGGj4+Bu85
 Xu9slti+hIgQI9VZ6FqY3wlC9yAX5WW9YLGFNNU=
X-Google-Smtp-Source: AA6agR7IZX87ZI7oRrXmvNsUkR/AefnITJMq0tAb4iPQUMg+ltvumMbf2c7VdCsJDLIvnQlrzcOZXGvUqFXZlVgA1To=
X-Received: by 2002:a25:e78e:0:b0:671:88ae:bee0 with SMTP id
 e136-20020a25e78e000000b0067188aebee0mr10831121ybh.58.1659364138788; Mon, 01
 Aug 2022 07:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220801013221.10427-1-faithilikerun@gmail.com>
In-Reply-To: <20220801013221.10427-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 1 Aug 2022 10:28:47 -0400
Message-ID: <CAJSP0QUOdxYzP8wL+a8tApLTf3+oy5LBFwZE9p_D5h=f=1iR7w@mail.gmail.com>
Subject: Re: [RFC v5 03/11] file-posix: introduce get_sysfs_long_val for the
 long sysfs attribute
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com, 
 dmitry.fomichev@wdc.com, hare@suse.de, stefanha@redhat.com, mst@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, 
 hreitz@redhat.com, eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Sun, 31 Jul 2022 at 21:39, Sam Li <faithilikerun@gmail.com> wrote:
>
> Use sysfs attribute files to get the long value of zoned device
> information.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/file-posix.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 48cd096624..bcf898f0cb 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1210,15 +1210,19 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
>  #endif
>  }
>
> -static int hdev_get_max_segments(int fd, struct stat *st)
> -{
> +/*
> + * Get zoned device information (chunk_sectors, zoned_append_max_bytes,
> + * max_open_zones, max_active_zones) through sysfs attribute files.
> + */
> +static long get_sysfs_long_val(int fd, struct stat *st,
> +                               const char *attribute) {
>  #ifdef CONFIG_LINUX
>      char buf[32];
>      const char *end;
>      char *sysfspath = NULL;
>      int ret;
>      int sysfd = -1;
> -    long max_segments;
> +    long val;
>
>      if (S_ISCHR(st->st_mode)) {
>          if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {

This code is specific to max_segments and not relevant to other
attributes. It's an alternative code path for SCSI generic types of
devices. It should be moved into hdev_get_max_segments() before
get_sysfs_long_val() is called.

> @@ -1231,8 +1235,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
>          return -ENOTSUP;
>      }
>
> -    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
> -                                major(st->st_rdev), minor(st->st_rdev));
> +    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> +                                major(st->st_rdev), minor(st->st_rdev),
> +                                attribute);
>      sysfd = open(sysfspath, O_RDONLY);
>      if (sysfd == -1) {
>          ret = -errno;
> @@ -1250,9 +1255,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
>      }
>      buf[ret] = 0;
>      /* The file is ended with '\n', pass 'end' to accept that. */
> -    ret = qemu_strtol(buf, &end, 10, &max_segments);
> +    ret = qemu_strtol(buf, &end, 10, &val);
>      if (ret == 0 && end && *end == '\n') {
> -        ret = max_segments;
> +        ret = val;
>      }
>
>  out:
> @@ -1266,6 +1271,10 @@ out:
>  #endif
>  }
>
> +static int hdev_get_max_segments(int fd, struct stat *st) {
> +    return get_sysfs_long_val(fd, st, "max_segments");
> +}
> +
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
> --
> 2.37.1
>
>

