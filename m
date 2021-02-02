Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF0430BBFB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 11:22:34 +0100 (CET)
Received: from localhost ([::1]:39264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6spN-0001Pg-Hm
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 05:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6snN-0000ru-K6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:20:29 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6snL-0007mQ-Aw
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:20:29 -0500
Received: by mail-ed1-x52c.google.com with SMTP id i5so46451edu.10
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 02:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=pMmbWWprP/ywlHONfKe9yu6j3DbkF6aYa1o+HIL4Xk0=;
 b=n3dD6rGXT7pICGQdmGEvBS/0yaKZ5+WBmUR6eOaCjlflto7Iy1xLwex0F5JVF47tUp
 H7Wgy4KILzPUiWk4NQ3zJK1jCkWHSKzpqvDl5dZeONgfV7mDuM3jbYLdAqXJv8y1up65
 FvabF4DOPNBeSnAOcw8O1daaucnSVVcCyo66HDi3Qmejxa8+14myptjw/B2QnluLMA8K
 bOU6iOyFFtZDOLVMXi+14Xkw92eymqxo/z00w6QSUZuSl7yf/V9pjzDYTtUsFMwWM4RK
 sxJSwRVq5qlGxtp8DTKphROBOGhxThyTxcVWpKLETJvxJDObpBA8yiatNITROKoJSUOW
 YcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=pMmbWWprP/ywlHONfKe9yu6j3DbkF6aYa1o+HIL4Xk0=;
 b=OyZ7XnaESuuh8R5aIG06MlXlQrlxnB+uXKWWVtQf/nUbHVbjQmCO06uyM3uatsAl5J
 xPMtUEydtdyWtdBSLQt1M/sPgfpwdriVYHDYGXv6S4FbeChBI1izRhCiT6WY0KsbvoUj
 CDdixNby8JQVy+E9FnGWd+A5nZQtJ+jBGBV44PECWkERAmkXbMPN0nQvcrJLcbFL6EHP
 y3BTfWOpAc17po+5nZBm8zdV8XDBBXDSMJ3noz07Gmanc8Z17KbwMZ9eJS+j0glV/lzq
 cxJHC+tH2rf7UGulGjT7acCkIhdU3bj87J66Sq1UOpRWZ7YvxXhfmqVBnv+/upW8rGbf
 YS9w==
X-Gm-Message-State: AOAM530KbVmrObULYW3xsW5AwJmlMsVOWybAOW7r8pitH6AtH+C5RTAn
 H/R3NUyAd3ofk3Aw4rSK4rP5Gw==
X-Google-Smtp-Source: ABdhPJwukkLv3we0AJzqemEx39gj2he+QSIjPUAqcncXLOxIjTS+snKHD0pTaH5mNZhlmLUv49pP0g==
X-Received: by 2002:aa7:d5d5:: with SMTP id d21mr23074073eds.252.1612261222604; 
 Tue, 02 Feb 2021 02:20:22 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id k6sm9193085ejb.84.2021.02.02.02.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 02:20:22 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id edab9290;
 Tue, 2 Feb 2021 10:20:21 +0000 (UTC)
To: Peter Lieven <pl@kamp.de>, qemu-block@nongnu.org
Subject: Re: [PATCH] qemu-img: add seek and -n option to dd command
In-Reply-To: <20210128140704.6547-1-pl@kamp.de>
References: <20210128140704.6547-1-pl@kamp.de>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
X-Now-Playing: Peter Gabriel - Up: The Barry Williams Show
Date: Tue, 02 Feb 2021 10:20:21 +0000
Message-ID: <cunmtwmlqje.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::52c;
 envelope-from=dme@dme.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2021-01-28 at 15:07:04 +01, Peter Lieven wrote:

> Signed-off-by: Peter Lieven <pl@kamp.de>
>
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index b615aa8419..7d4564c2b8 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -209,6 +209,10 @@ Parameters to dd subcommand:
>  
>  .. program:: qemu-img-dd
>  
> +.. option:: -n
> +
> +  Skip the creation of the output file
> +
>  .. option:: bs=BLOCK_SIZE
>  
>    Defines the block size
> @@ -229,6 +233,10 @@ Parameters to dd subcommand:
>  
>    Sets the number of input blocks to skip
>  
> +.. option:: sseek=BLOCKS
> +
> +  Sets the number of blocks to seek into the output
> +
>  Parameters to snapshot subcommand:
>  
>  .. program:: qemu-img-snapshot
> diff --git a/qemu-img.c b/qemu-img.c
> index 8597d069af..d7f390e382 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -213,12 +213,17 @@ static void QEMU_NORETURN help(void)
>             "  '-s' run in Strict mode - fail on different image size or sector allocation\n"
>             "\n"
>             "Parameters to dd subcommand:\n"
> +           "  '-n' skips the target volume creation (useful if the volume is created\n"
> +           "       prior to running qemu-img). Note that he behaviour is not identical to\n"

s/he/the/

> +           "       original dd option conv=nocreat. The output is neither truncated nor\n"
> +           "       is it possible to write past the end of an existing file.\n"
>             "  'bs=BYTES' read and write up to BYTES bytes at a time "
>             "(default: 512)\n"
>             "  'count=N' copy only N input blocks\n"
>             "  'if=FILE' read from FILE\n"
>             "  'of=FILE' write to FILE\n"
> -           "  'skip=N' skip N bs-sized blocks at the start of input\n";
> +           "  'skip=N' skip N bs-sized blocks at the start of input\n"
> +           "  'seek=N' seek N bs-sized blocks into the output\n";
>  
>      printf("%s\nSupported formats:", help_msg);
>      bdrv_iterate_format(format_print, NULL, false);
> @@ -4885,6 +4890,7 @@ static int img_bitmap(int argc, char **argv)
>  #define C_IF      04
>  #define C_OF      010
>  #define C_SKIP    020
> +#define C_SEEK    040
>  
>  struct DdInfo {
>      unsigned int flags;
> @@ -4964,6 +4970,19 @@ static int img_dd_skip(const char *arg,
>      return 0;
>  }
>  
> +static int img_dd_seek(const char *arg,
> +                       struct DdIo *in, struct DdIo *out,
> +                       struct DdInfo *dd)
> +{
> +    out->offset = cvtnum("seek", arg);
> +
> +    if (in->offset < 0) {
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
>  static int img_dd(int argc, char **argv)
>  {
>      int ret = 0;
> @@ -4980,7 +4999,7 @@ static int img_dd(int argc, char **argv)
>      const char *fmt = NULL;
>      int64_t size = 0;
>      int64_t block_count = 0, out_pos, in_pos;
> -    bool force_share = false;
> +    bool force_share = false, skip_create = false;
>      struct DdInfo dd = {
>          .flags = 0,
>          .count = 0,
> @@ -5004,6 +5023,7 @@ static int img_dd(int argc, char **argv)
>          { "if", img_dd_if, C_IF },
>          { "of", img_dd_of, C_OF },
>          { "skip", img_dd_skip, C_SKIP },
> +        { "seek", img_dd_seek, C_SEEK },
>          { NULL, NULL, 0 }
>      };
>      const struct option long_options[] = {
> @@ -5014,7 +5034,7 @@ static int img_dd(int argc, char **argv)
>          { 0, 0, 0, 0 }
>      };
>  
> -    while ((c = getopt_long(argc, argv, ":hf:O:U", long_options, NULL))) {
> +    while ((c = getopt_long(argc, argv, ":hf:O:Un", long_options, NULL))) {
>          if (c == EOF) {
>              break;
>          }
> @@ -5037,6 +5057,9 @@ static int img_dd(int argc, char **argv)
>          case 'U':
>              force_share = true;
>              break;
> +        case 'n':
> +            skip_create = true;
> +            break;
>          case OPTION_OBJECT:
>              if (!qemu_opts_parse_noisily(&qemu_object_opts, optarg, true)) {
>                  ret = -1;
> @@ -5116,22 +5139,25 @@ static int img_dd(int argc, char **argv)
>          ret = -1;
>          goto out;
>      }
> -    if (!drv->create_opts) {
> -        error_report("Format driver '%s' does not support image creation",
> -                     drv->format_name);
> -        ret = -1;
> -        goto out;
> -    }
> -    if (!proto_drv->create_opts) {
> -        error_report("Protocol driver '%s' does not support image creation",
> -                     proto_drv->format_name);
> -        ret = -1;
> -        goto out;
> -    }
> -    create_opts = qemu_opts_append(create_opts, drv->create_opts);
> -    create_opts = qemu_opts_append(create_opts, proto_drv->create_opts);
>  
> -    opts = qemu_opts_create(create_opts, NULL, 0, &error_abort);
> +    if (!skip_create) {
> +        if (!drv->create_opts) {
> +            error_report("Format driver '%s' does not support image creation",
> +                         drv->format_name);
> +            ret = -1;
> +            goto out;
> +        }
> +        if (!proto_drv->create_opts) {
> +            error_report("Protocol driver '%s' does not support image creation",
> +                         proto_drv->format_name);
> +            ret = -1;
> +            goto out;
> +        }
> +        create_opts = qemu_opts_append(create_opts, drv->create_opts);
> +        create_opts = qemu_opts_append(create_opts, proto_drv->create_opts);
> +
> +        opts = qemu_opts_create(create_opts, NULL, 0, &error_abort);
> +    }
>  
>      size = blk_getlength(blk1);
>      if (size < 0) {
> @@ -5145,22 +5171,25 @@ static int img_dd(int argc, char **argv)
>          size = dd.count * in.bsz;
>      }
>  
> -    /* Overflow means the specified offset is beyond input image's size */
> -    if (dd.flags & C_SKIP && (in.offset > INT64_MAX / in.bsz ||
> -                              size < in.bsz * in.offset)) {
> -        qemu_opt_set_number(opts, BLOCK_OPT_SIZE, 0, &error_abort);
> -    } else {
> -        qemu_opt_set_number(opts, BLOCK_OPT_SIZE,
> -                            size - in.bsz * in.offset, &error_abort);
> -    }
> +    if (!skip_create) {
> +        /* Overflow means the specified offset is beyond input image's size */
> +        if (dd.flags & C_SKIP && (in.offset > INT64_MAX / in.bsz ||
> +                                  size < in.bsz * in.offset)) {
> +            qemu_opt_set_number(opts, BLOCK_OPT_SIZE, 0, &error_abort);
> +        } else {
> +            qemu_opt_set_number(opts, BLOCK_OPT_SIZE,
> +                                out.bsz * out.offset + size -
> +                                in.bsz * in.offset, &error_abort);
> +        }
>  
> -    ret = bdrv_create(drv, out.filename, opts, &local_err);
> -    if (ret < 0) {
> -        error_reportf_err(local_err,
> -                          "%s: error while creating output image: ",
> -                          out.filename);
> -        ret = -1;
> -        goto out;
> +        ret = bdrv_create(drv, out.filename, opts, &local_err);
> +        if (ret < 0) {
> +            error_reportf_err(local_err,
> +                              "%s: error while creating output image: ",
> +                              out.filename);
> +            ret = -1;
> +            goto out;
> +        }
>      }
>  
>      /* TODO, we can't honour --image-opts for the target,
> @@ -5189,7 +5218,7 @@ static int img_dd(int argc, char **argv)
>  
>      in.buf = g_new(uint8_t, in.bsz);
>  
> -    for (out_pos = 0; in_pos < size; block_count++) {
> +    for (out_pos = out.offset * out.bsz; in_pos < size; block_count++) {
>          int in_ret, out_ret;
>  
>          if (in_pos + in.bsz > size) {
> -- 
> 2.17.1

dme.
-- 
But they'll laugh at you in Jackson, and I'll be dancin' on a Pony Keg.

