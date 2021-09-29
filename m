Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8F41C987
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:04:39 +0200 (CEST)
Received: from localhost ([::1]:41248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVc4T-0001nq-HU
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1mVc0f-00073k-VO
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1mVc0R-0004lQ-AX
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632931223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gACHXx8HEa2d0VcDyO5QMyENpRFboboiGXesbFY2EcM=;
 b=EgonN2EH704foBum9p511aJFBGRivmM8MWSrggd9zRBBLQOjs+PuaCBtpdaKnB1aJ1m30V
 OYKJj5JdvLIhFyeWewh7c2Byb/JeEnfn0CcSUVPJmBxoH+sGSOa6DbVjNhzPRg9dXPo2DF
 07zTt2xJGKz8xX72i6cC5FQnA83iVJg=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-FLU0rTu5Nvqn6o4ynrVyvw-1; Wed, 29 Sep 2021 12:00:21 -0400
X-MC-Unique: FLU0rTu5Nvqn6o4ynrVyvw-1
Received: by mail-oo1-f69.google.com with SMTP id
 q3-20020a056820028300b002a9a312d6fdso2444678ood.21
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 09:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gACHXx8HEa2d0VcDyO5QMyENpRFboboiGXesbFY2EcM=;
 b=AWMNapqV/3LlgNL9RUbvvKFtgNJ/4aRKT9698caV+N/LpMNAXMZAWZdN8LKBLjyMpd
 +h8n0wFOGmjiuHJiltsjqraTtOA38pseILFu11AFLTgOZi7flfssghTbJYQYc9y7bQR+
 R/vzXZ7Mh2VzwN91bJOnI8HmYGMgl0pzpCaRNv+EkLdqnpLouSz7UN2GzKODXt/77tL3
 cPNnjBdB6J6rquAvt2U4saBp6RrTbsRkvh5fnlOdjjWsa5RmvertLrQe/d8GMA5BL6gE
 pmgVLJwYjMfRkbsEDD+vM6wiw9+s/8eLN9zA3Ov3n7Nq1ZRoUo63t5ULw5YUwEN4Q66x
 D7wA==
X-Gm-Message-State: AOAM532CPEtnYGaSl/eY5cqygfCTuraKv/HzVUx+V0OIhLT0/hILqY+n
 93bIuLk0K//Nl0DAvfdUbcMdb0p9P/TWHB0L+c8oDw9MMWYpJwIFdlTHpLKuFWqD6x9rQqYF3kA
 7im0qNUxfvYFKb7DDmOLXED57HiXg0ac=
X-Received: by 2002:a05:6830:24a8:: with SMTP id
 v8mr624887ots.185.1632931220344; 
 Wed, 29 Sep 2021 09:00:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8QRc/1Z/vq6RbpgegL48Cs9E46n6+0QDPEiBQOR+Xsl7Pu6pHQ+9yW0DhQClwp/xStKM83DUB0IkSNbWokR4=
X-Received: by 2002:a05:6830:24a8:: with SMTP id
 v8mr624859ots.185.1632931220046; 
 Wed, 29 Sep 2021 09:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210929133427.44923-1-vsementsov@virtuozzo.com>
 <20210929133427.44923-4-vsementsov@virtuozzo.com>
In-Reply-To: <20210929133427.44923-4-vsementsov@virtuozzo.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 29 Sep 2021 19:00:03 +0300
Message-ID: <CAMRbyyt4fmsUni0ZxaUTG-FKYgUQeK2N+p1Le9j9tWUOBLuQiA@mail.gmail.com>
Subject: Re: [PATCH 3/4] qemu-img: add --shallow option for qemu-img compare
 --stat
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <hreitz@redhat.com>, den@openvz.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 4:37 PM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> Allow compare only top images of backing chains. That's useful for
> comparing two increments from the same chain of incremental backups.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/tools/qemu-img.rst |  8 +++++++-
>  qemu-img.c              | 14 ++++++++++++--
>  qemu-img-cmds.hx        |  4 ++--
>  3 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index 4b382ca2b0..c8ae96be6a 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -176,6 +176,12 @@ Parameters to compare subcommand:
>      - If both files don't specify cluster-size, use default of 64K
>      - If only one file specify cluster-size, just use it.
>
> +.. option:: --shallow

We use the same term in oVirt when we upload/download one layer from a chain.

> +  Only allowed with ``--stat``. This option prevents opening and comparing
> +  any backing files. This is useful to compare incremental images from
> +  the chain of incremental backups.

This is useful also without --stat. Our current workaround in oVirt is
to use unsafe
rebase to disconnect the top image from the base image so we can compare
source and destination image after backup.

Here is an example of test code that could use --shallow (regardless of --stat):
https://github.com/oVirt/ovirt-imageio/blob/master/daemon/test/backup_test.py#L114

Do you have any reason to limit --shallow to --stats?

> +
>  Parameters to convert subcommand:
>
>  .. program:: qemu-img-convert
> @@ -395,7 +401,7 @@ Command description:
>
>    The rate limit for the commit process is specified by ``-r``.
>
> -.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] FILENAME1 FILENAME2
> +.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE] [--shallow]] FILENAME1 FILENAME2
>
>    Check if two images have the same content. You can compare images with
>    different format or settings.
> diff --git a/qemu-img.c b/qemu-img.c
> index 61e7f470bb..e8ae412c38 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -85,6 +85,7 @@ enum {
>      OPTION_SKIP_BROKEN = 277,
>      OPTION_STAT = 277,
>      OPTION_BLOCK_SIZE = 278,
> +    OPTION_SHALLOW = 279,
>  };
>
>  typedef enum OutputFormat {
> @@ -1482,7 +1483,7 @@ static int img_compare(int argc, char **argv)
>      int64_t block_end;
>      int ret = 0; /* return value - 0 Ident, 1 Different, >1 Error */
>      bool progress = false, quiet = false, strict = false;
> -    int flags;
> +    int flags = 0;
>      bool writethrough;
>      int64_t total_size;
>      int64_t offset = 0;
> @@ -1504,6 +1505,7 @@ static int img_compare(int argc, char **argv)
>              {"force-share", no_argument, 0, 'U'},
>              {"stat", no_argument, 0, OPTION_STAT},
>              {"block-size", required_argument, 0, OPTION_BLOCK_SIZE},
> +            {"shallow", no_argument, 0, OPTION_SHALLOW},
>              {0, 0, 0, 0}
>          };
>          c = getopt_long(argc, argv, ":hf:F:T:pqsU",
> @@ -1569,6 +1571,9 @@ static int img_compare(int argc, char **argv)
>                  exit(EXIT_SUCCESS);
>              }
>              break;
> +        case OPTION_SHALLOW:
> +            flags |= BDRV_O_NO_BACKING;
> +            break;
>          }
>      }
>
> @@ -1590,10 +1595,15 @@ static int img_compare(int argc, char **argv)
>          goto out;
>      }
>
> +    if (!do_stat && (flags & BDRV_O_NO_BACKING)) {
> +        error_report("--shallow can be used only together with --stat");
> +        ret = 1;
> +        goto out;
> +    }
> +
>      /* Initialize before goto out */
>      qemu_progress_init(progress, 2.0);
>
> -    flags = 0;
>      ret = bdrv_parse_cache_mode(cache, &flags, &writethrough);
>      if (ret < 0) {
>          error_report("Invalid source cache option: %s", cache);
> diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
> index 96a193eea8..a295bc6860 100644
> --- a/qemu-img-cmds.hx
> +++ b/qemu-img-cmds.hx
> @@ -40,9 +40,9 @@ SRST
>  ERST
>
>  DEF("compare", img_compare,
> -    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] filename1 filename2")
> +    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE] [--shallow]] filename1 filename2")
>  SRST
> -.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE]] FILENAME1 FILENAME2
> +.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat [--block-size BLOCK_SIZE] [--shallow]] FILENAME1 FILENAME2
>  ERST
>
>  DEF("convert", img_convert,
> --
> 2.29.2
>

Looks good as is, we can remove the limit later without breaking users.

Nir


