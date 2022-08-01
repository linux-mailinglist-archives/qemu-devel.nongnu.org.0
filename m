Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320EC586D2B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:44:17 +0200 (CEST)
Received: from localhost ([::1]:47542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWeW-00073I-8w
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWcc-0004wU-9w; Mon, 01 Aug 2022 10:42:19 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:36798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIWcY-00068p-R0; Mon, 01 Aug 2022 10:42:17 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31e7ca45091so111275227b3.3; 
 Mon, 01 Aug 2022 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=q4arDf/b8ovM2AjeJlwp5TkW3GoTp1joBiB9fvxbM6g=;
 b=V4C7/6/dHoSdqqUeQAaX2cA0hbMbseE25Ll/AP7WLpu8idffpHJcdqN6sewVSXcMkM
 9z3bZNF3YuNSz0+j/MDuzPDQd4xflkfmCdLxsGcY5rs5M116giVnfabgFLnR6uytoypQ
 BM/tKrU3Jfg+4CGZ6HLH0tH2ltlRvCJ3k8yzkmATk5Nua8RtklxF56r98Tw92OCizJBJ
 g79ferS5XyKguLcv0YroTFWEmpJitV4RFDBWoQ0HpF9niXUnFJfS50slLFJDL2dJfgcv
 TsTXUwao3DnK53gTL1lAgcSD9aeaHu6oDKGn5DGdOTEUWPvvpHKrWbMXN/QXWZh0LbEk
 PPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=q4arDf/b8ovM2AjeJlwp5TkW3GoTp1joBiB9fvxbM6g=;
 b=2l8PVM5o6nKKaFvzOxz/a13BbzhbXUpsW7DJSh/0n1W5/iYmWDFOCDWq0QsDUeMgBl
 KlIMQ3Qj/srbXpNWRcrYJDnFDJVt4/QZMF9dF7hx653H+7HqfnUdRyx4y4pKA3NffJ+Z
 J4agAyR1l+amjDPvUbdz058ZViSrOVMdUgwXrq+JN0bBvKi2nc4u7Gh0GL93FbQIIu1p
 pKUt5NmGxmnESLU1YLrudf0xaSFrMr8+7PafvOPiynHB6XrYPc/NGNp3oTFAEOBivd0A
 MwTw/dcFwpYqlFhF3FWOVvTj+I0pnt2UPnNS+8Tz6ehlilxU8jMJKaCOGHjutS9eq+/o
 XN0g==
X-Gm-Message-State: ACgBeo1QLAqv6+yVPR0zzak6z/lj5YM8R0i07hWh6EI4MxIcxXsZp3R+
 6XvJocleJJEj5cgLNj0uVfZto7X3hRTpMKw0HyM=
X-Google-Smtp-Source: AA6agR7Hol2+MnOpNcaRdvSXKaEDp+ITz+aSvWUVbWl4rBp86b4TO/EPvBLw0LOq/A1PoOVdj1pNDnQ+htcJHDjnvsU=
X-Received: by 2002:a81:55c2:0:b0:31f:645b:9858 with SMTP id
 j185-20020a8155c2000000b0031f645b9858mr14034389ywb.296.1659364932754; Mon, 01
 Aug 2022 07:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220801013248.10468-1-faithilikerun@gmail.com>
In-Reply-To: <20220801013248.10468-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 1 Aug 2022 10:42:00 -0400
Message-ID: <CAJSP0QWb8DfzP4jHod6t4oRNwGBj3YugkmN0nZtAYEXSeY11oQ@mail.gmail.com>
Subject: Re: [RFC v5 04/11] file-posix: introduce get_sysfs_str_val for device
 zoned model
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com, 
 dmitry.fomichev@wdc.com, hare@suse.de, stefanha@redhat.com, mst@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, 
 hreitz@redhat.com, eblake@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1136.google.com
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

On Sun, 31 Jul 2022 at 21:34, Sam Li <faithilikerun@gmail.com> wrote:
>
> Use sysfs attribute files to get the string value of device
> zoned model. Then get_sysfs_zoned_model can convert it to
> BlockZoneModel type in QEMU.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/file-posix.c               | 86 ++++++++++++++++++++++++++++++++
>  include/block/block_int-common.h |  3 ++
>  2 files changed, 89 insertions(+)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index bcf898f0cb..0d8b4acdc7 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1271,6 +1271,85 @@ out:
>  #endif
>  }
>
> +/*
> + * Convert the zoned attribute file in sysfs to internal value.
> + */
> +static int get_sysfs_str_val(int fd, struct stat *st,
> +                              const char *attribute,
> +                              char **val) {
> +#ifdef CONFIG_LINUX
> +    char buf[32];
> +    char *sysfspath = NULL;

This can be g_autofree and then the explicit g_free(sysfspath) call is
no longer necessary.

> +    int ret, offset;
> +    int sysfd = -1;
> +
> +    if (S_ISCHR(st->st_mode)) {
> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> +            return ret;
> +        }
> +        return -ENOTSUP;
> +    }

This is for max_segments only. See my comment on the previous patch.

> +
> +    if (!S_ISBLK(st->st_mode)) {
> +        return -ENOTSUP;
> +    }
> +
> +    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> +                                major(st->st_rdev), minor(st->st_rdev),
> +                                attribute);

The code that follows can be replaced by a call to g_file_get_contents():
https://docs.gtk.org/glib/func.file_get_contents.html

Then the caller doesn't need to pre-allocate a 32-byte buffer. Instead
this function returns a string on the heap. The caller can free it
with g_free().

> +    sysfd = open(sysfspath, O_RDONLY);
> +    if (sysfd == -1) {
> +        ret = -errno;
> +        goto out;
> +    }
> +    offset = 0;
> +    do {
> +        ret = read(sysfd, buf + offset, sizeof(buf) - 1 + offset);
> +        if (ret > 0) {
> +            offset += ret;
> +        }
> +    } while (ret == -1);

I think this should be:

  } while (ret == -1 && errno == EINTR);

  if (ret < 0) {
      ret = -errno;
      goto out;
  }

Otherwise there is an infinite loop when an unrecoverable error occurs.

> +    /* The file is ended with '\n' */
> +    if (buf[ret - 1] == '\n') {
> +        buf[ret - 1] = '\0';
> +    }
> +
> +    if (!strncpy(*val, buf, ret)) {
> +        goto out;
> +    }
> +
> +out:
> +    if (sysfd != -1) {
> +        close(sysfd);
> +    }
> +    g_free(sysfspath);
> +    return ret;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
> +static int get_sysfs_zoned_model(int fd, struct stat *st,
> +                                 BlockZoneModel *zoned) {
> +    g_autofree char *val = NULL;
> +    val = g_malloc(32);
> +    get_sysfs_str_val(fd, st, "zoned", &val);
> +    if (!val) {
> +        return -ENOTSUP;
> +    }
> +
> +    if (strcmp(val, "host-managed") == 0) {
> +        *zoned = BLK_Z_HM;
> +    } else if (strcmp(val, "host-aware") == 0) {
> +        *zoned = BLK_Z_HA;
> +    } else if (strcmp(val, "none") == 0) {
> +        *zoned = BLK_Z_NONE;
> +    } else {
> +        return -ENOTSUP;
> +    }
> +    return 0;
> +}
> +
>  static int hdev_get_max_segments(int fd, struct stat *st) {
>      return get_sysfs_long_val(fd, st, "max_segments");
>  }
> @@ -1279,6 +1358,8 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
>      struct stat st;
> +    int ret;
> +    BlockZoneModel zoned;
>
>      s->needs_alignment = raw_needs_alignment(bs);
>      raw_probe_alignment(bs, s->fd, errp);
> @@ -1316,6 +1397,11 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>              bs->bl.max_hw_iov = ret;
>          }
>      }
> +
> +    ret = get_sysfs_zoned_model(s->fd, &st, &zoned);
> +    if (ret < 0)
> +        zoned = BLK_Z_NONE;

QEMU coding style always uses {}:

  if (ret < 0) {
      zoned = BLK_Z_NONE;
  }

> +    bs->bl.zoned = zoned;
>  }
>
>  static int check_for_dasd(int fd)
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 8947abab76..7f7863cc9e 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -825,6 +825,9 @@ typedef struct BlockLimits {
>
>      /* maximum number of iovec elements */
>      int max_iov;
> +
> +    /* device zone model */
> +    BlockZoneModel zoned;
>  } BlockLimits;
>
>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> --
> 2.37.1
>
>

