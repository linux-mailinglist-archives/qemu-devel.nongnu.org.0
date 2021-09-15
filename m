Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B020440C1DE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 10:35:45 +0200 (CEST)
Received: from localhost ([::1]:37828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQOO-0003n8-DM
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 04:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mQQMI-0002yZ-DH
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 04:33:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mQQMG-0003gG-EI
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 04:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631694811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQHJHx2drUiYuFxNFDUXaiMsL2cSKNIyqjgdwP8TJQY=;
 b=YIdS1sdi1Uq/eXFAiUa5GkQy7tpMrBlgkA0d8FUq7oufiIps8H8Uvur3S5uXYxj2GtUVAX
 Aiwyn4p0Kpad1n3ec9vIeYYK7jwjduOjx8Z69ENFxbxxyr20F4SirF3umsGfNO5FCulC2a
 Qj+q9xhkLwcYYSn5+sqwhPZZt3KuHqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-II2yO8y8PA2jhNeVA-jC_w-1; Wed, 15 Sep 2021 04:33:28 -0400
X-MC-Unique: II2yO8y8PA2jhNeVA-jC_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58584DF8AE;
 Wed, 15 Sep 2021 08:33:27 +0000 (UTC)
Received: from starship (unknown [10.35.206.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6DC82B0B2;
 Wed, 15 Sep 2021 08:33:25 +0000 (UTC)
Message-ID: <4a90e6c93ec2b8f4b6283538bc97a82dfe96ae38.camel@redhat.com>
Subject: Re: [PATCH] qemu-img: Add -F shorthand to convert
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Date: Wed, 15 Sep 2021 11:33:24 +0300
In-Reply-To: <20210913131735.1948339-1-eblake@redhat.com>
References: <20210913131735.1948339-1-eblake@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-09-13 at 08:17 -0500, Eric Blake wrote:
> Although we have long supported 'qemu-img convert -o
> backing_file=foo,backing_fmt=bar', the fact that we have a shortcut -B
> for backing_file but none for backing_fmt has made it more likely that
> users accidentally run into:
> 
> qemu-img: warning: Deprecated use of backing file without explicit backing format
> 
> when using -B instead of -o.  For similarity with other qemu-img
> commands, such as create and compare, add '-F $fmt' as the shorthand
> for '-o backing_fmt=$fmt'.  Update iotest 122 for coverage of both
> spellings.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> This stemmed from an IRC conversation; I'd add a Reported-by: line if
> I can figure out how to credit more than just the nick bparker_.
> 
>  docs/tools/qemu-img.rst |  4 ++--
>  qemu-img.c              | 10 +++++++---
>  qemu-img-cmds.hx        |  2 +-
>  tests/qemu-iotests/122  |  2 +-
>  4 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index b7d602a28804..e02880c1c5dc 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -414,7 +414,7 @@ Command description:
>    4
>      Error on reading data
> 
> -.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps [--skip-broken-bitmaps]] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
> +.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps [--skip-broken-bitmaps]] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE [-F backing_fmt]] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
> 
>    Convert the disk image *FILENAME* or a snapshot *SNAPSHOT_PARAM*
>    to disk image *OUTPUT_FILENAME* using format *OUTPUT_FMT*. It can
> @@ -438,7 +438,7 @@ Command description:
>    You can use the *BACKING_FILE* option to force the output image to be
>    created as a copy on write image of the specified base image; the
>    *BACKING_FILE* should have the same content as the input's base image,
> -  however the path, image format, etc may differ.
> +  however the path, image format (as given by *BACKING_FMT*), etc may differ.
> 
>    If a relative path name is given, the backing file is looked up relative to
>    the directory containing *OUTPUT_FILENAME*.
> diff --git a/qemu-img.c b/qemu-img.c
> index d77f3e76a9b6..290368da7d6d 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -2183,7 +2183,8 @@ static int img_convert(int argc, char **argv)
>      int c, bs_i, flags, src_flags = BDRV_O_NO_SHARE;
>      const char *fmt = NULL, *out_fmt = NULL, *cache = "unsafe",
>                 *src_cache = BDRV_DEFAULT_CACHE, *out_baseimg = NULL,
> -               *out_filename, *out_baseimg_param, *snapshot_name = NULL;
> +               *out_filename, *out_baseimg_param, *snapshot_name = NULL,
> +               *backing_fmt = NULL;
>      BlockDriver *drv = NULL, *proto_drv = NULL;
>      BlockDriverInfo bdi;
>      BlockDriverState *out_bs;
> @@ -2223,7 +2224,7 @@ static int img_convert(int argc, char **argv)
>              {"skip-broken-bitmaps", no_argument, 0, OPTION_SKIP_BROKEN},
>              {0, 0, 0, 0}
>          };
> -        c = getopt_long(argc, argv, ":hf:O:B:Cco:l:S:pt:T:qnm:WUr:",
> +        c = getopt_long(argc, argv, ":hf:O:B:CcF:o:l:S:pt:T:qnm:WUr:",
>                          long_options, NULL);
>          if (c == -1) {
>              break;
> @@ -2253,6 +2254,9 @@ static int img_convert(int argc, char **argv)
>          case 'c':
>              s.compressed = true;
>              break;
> +        case 'F':
> +            backing_fmt = optarg;
> +            break;
>          case 'o':
>              if (accumulate_options(&options, optarg) < 0) {
>                  goto fail_getopt;
> @@ -2521,7 +2525,7 @@ static int img_convert(int argc, char **argv)
> 
>          qemu_opt_set_number(opts, BLOCK_OPT_SIZE,
>                              s.total_sectors * BDRV_SECTOR_SIZE, &error_abort);
> -        ret = add_old_style_options(out_fmt, opts, out_baseimg, NULL);
> +        ret = add_old_style_options(out_fmt, opts, out_baseimg, backing_fmt);
>          if (ret < 0) {
>              goto out;
>          }
> diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
> index b3620f29e50c..4c4d94ab2267 100644
> --- a/qemu-img-cmds.hx
> +++ b/qemu-img-cmds.hx
> @@ -46,7 +46,7 @@ SRST
>  ERST
> 
>  DEF("convert", img_convert,
> -    "convert [--object objectdef] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f fmt] [-t cache] [-T src_cache] [-O output_fmt] [-B backing_file] [-o options] [-l snapshot_param] [-S sparse_size] [-r rate_limit] [-m num_coroutines] [-W] [--salvage] filename [filename2 [...]] output_filename")
> +    "convert [--object objectdef] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f fmt] [-t cache] [-T src_cache] [-O output_fmt] [-B backing_file [-F backing_fmt]] [-o options] [-l snapshot_param] [-S sparse_size] [-r rate_limit] [-m num_coroutines] [-W] [--salvage] filename [filename2 [...]] output_filename")
>  SRST
>  .. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] [--salvage] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
>  ERST
> diff --git a/tests/qemu-iotests/122 b/tests/qemu-iotests/122
> index 5d550ed13ea3..efb260d822db 100755
> --- a/tests/qemu-iotests/122
> +++ b/tests/qemu-iotests/122
> @@ -67,7 +67,7 @@ echo
>  _make_test_img -b "$TEST_IMG".base -F $IMGFMT
> 
>  $QEMU_IO -c "write -P 0 0 3M" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_testdir
> -$QEMU_IMG convert -O $IMGFMT -B "$TEST_IMG".base -o backing_fmt=$IMGFMT \
> +$QEMU_IMG convert -O $IMGFMT -B "$TEST_IMG".base -F $IMGFMT \
>      "$TEST_IMG" "$TEST_IMG".orig
>  $QEMU_IO -c "read -P 0 0 3M" "$TEST_IMG".orig 2>&1 | _filter_qemu_io | _filter_testdir
>  $QEMU_IMG convert -O $IMGFMT -c -B "$TEST_IMG".base -o backing_fmt=$IMGFMT \

I have seen that warning few times already in my scripts, so good to have this option.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky




