Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585AF702639
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 09:41:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pySpK-0003Tf-PA; Mon, 15 May 2023 03:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1pySpH-0003TD-Px
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:41:00 -0400
Received: from apollo.dupie.be ([2001:bc8:3f2a:101::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1pySpF-00064C-Vr
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:40:59 -0400
Received: from [IPV6:2a02:a03f:eaf7:ff01:cc6b:6666:e19c:b63f] (unknown
 [IPv6:2a02:a03f:eaf7:ff01:cc6b:6666:e19c:b63f])
 by apollo.dupie.be (Postfix) with ESMTPSA id 21C381520C8C;
 Mon, 15 May 2023 09:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dupond.be; s=dkim;
 t=1684136454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMQgSvyAS7689AHXbktCfeMd6wVhxD75UZF4S15Pp0o=;
 b=gbhiwP6p/5XNmbhK1yF1uymxHg66NfmpUdGC6l/gnrL7GlfHSX6Sx8T/s2FCzmoyr/05Or
 DT0LHCp1uppHc7Tap/JY/zZhqiyEmElTHHRwD0kK+8EpTLpfd06mUUYJi8rt3tmjXmhT9Y
 E7fVGnIVg8IpdYwP4ITp0eOZ3fFeZoZI2FQzmqYPROtFgj/nfw0nnJBprHKqwyZeU4TD5n
 VOwrwA9ysD29dSb6FgH76EV6s5jbM+K97wvrgH67dMSQJso0QKDGlDgmzPRB3WhrlBgoDT
 FcXy9XT+NOieNjpTTWS78d0Zx3Qg/qVkVIlwo7yxKQP+YpJaj42LHMRGf3XYrA==
Message-ID: <8614ebb6-5c03-be09-4778-977dd68920ed@dupond.be>
Date: Mon, 15 May 2023 09:40:53 +0200
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] block: Add zeroes discard option
To: qemu-devel@nongnu.org, stefanha@redhat.com, fam@euphon.net,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230510142720.71894-1-jean-louis@dupond.be>
Content-Language: en-US
From: Jean-Louis Dupond <jean-louis@dupond.be>
In-Reply-To: <20230510142720.71894-1-jean-louis@dupond.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:bc8:3f2a:101::1;
 envelope-from=jean-louis@dupond.be; helo=apollo.dupie.be
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Uploaded a new patch which might be better/cleaner :)
"[PATCH] qcow2: add discard-no-unref option"

That patch only applies to qcow2 and also passes unmap further down the 
storage stack.

On 10/05/2023 16:27, Jean-Louis Dupond wrote:
> When we for example have a sparse qcow2 image and discard: unmap is enabled,
> there can be a lot of fragmentation in the image after some time. Surely on VM's
> that do a lot of writes/deletes.
> This causes the qcow2 image to grow even over 110% of its virtual size,
> because the free gaps in the image get to small to allocate new
> continuous clusters. So it allocates new space as the end of the image.
>
> Disabling discard is not an option, as discard is needed to keep the
> incremental backup size as low as possible. Without discard, the
> incremental backups would become large, as qemu thinks it's just dirty
> blocks but it doesn't know the blocks are empty/useless.
> So we need to avoid fragmentation but also 'empty' the useless blocks in
> the image to have a small incremental backup.
>
> There are multiple ways to properly resolve this. One way is to not
> discard the blocks on a discard request, but just zero them. This causes
> the allocation the still exist, and results in no gaps.
> This should also cause a perfectly continuous image when using full
> preallocation.
>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1621
> Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
> ---
>   block.c                              | 2 ++
>   block/io.c                           | 7 ++++++-
>   include/block/block-common.h         | 1 +
>   qapi/block-core.json                 | 3 ++-
>   qemu-nbd.c                           | 2 +-
>   qemu-options.hx                      | 2 +-
>   storage-daemon/qemu-storage-daemon.c | 2 +-
>   7 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/block.c b/block.c
> index 5ec1a3897e..ed21d115dd 100644
> --- a/block.c
> +++ b/block.c
> @@ -1146,6 +1146,8 @@ int bdrv_parse_discard_flags(const char *mode, int *flags)
>           /* do nothing */
>       } else if (!strcmp(mode, "on") || !strcmp(mode, "unmap")) {
>           *flags |= BDRV_O_UNMAP;
> +    } else if (!strcmp(mode, "zeroes")) {
> +        *flags |= BDRV_O_UNMAP_ZERO;
>       } else {
>           return -1;
>       }
> diff --git a/block/io.c b/block/io.c
> index 6fa1993374..dc7592e938 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -2988,10 +2988,15 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
>       }
>   
>       /* Do nothing if disabled.  */
> -    if (!(bs->open_flags & BDRV_O_UNMAP)) {
> +    if (!(bs->open_flags & BDRV_O_UNMAP) &&
> +        !(bs->open_flags & BDRV_O_UNMAP_ZERO)) {
>           return 0;
>       }
>   
> +    if (bs->open_flags & BDRV_O_UNMAP_ZERO) {
> +        return bdrv_co_pwrite_zeroes(child, offset, bytes, 0);
> +    }
> +
>       if (!bs->drv->bdrv_co_pdiscard && !bs->drv->bdrv_aio_pdiscard) {
>           return 0;
>       }
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index b5122ef8ab..079ee390c3 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -179,6 +179,7 @@ typedef enum {
>   #define BDRV_O_AUTO_RDONLY 0x20000 /* degrade to read-only if opening
>                                         read-write fails */
>   #define BDRV_O_IO_URING    0x40000 /* use io_uring instead of the thread pool */
> +#define BDRV_O_UNMAP_ZERO  0x80000 /* rewrite guest unmap to zero */
>   
>   #define BDRV_O_CACHE_MASK  (BDRV_O_NOCACHE | BDRV_O_NO_FLUSH)
>   
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index c05ad0c07e..0f91d1a6b6 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2971,11 +2971,12 @@
>   #
>   # @ignore: Ignore the request
>   # @unmap: Forward as an unmap request
> +# @zeroes: Zero the clusters instead of unmapping (since 8.1)
>   #
>   # Since: 2.9
>   ##
>   { 'enum': 'BlockdevDiscardOptions',
> -  'data': [ 'ignore', 'unmap' ] }
> +  'data': [ 'ignore', 'unmap', 'zeroes' ] }
>   
>   ##
>   # @BlockdevDetectZeroesOptions:
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 6ff45308a9..6c0b326db4 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -148,7 +148,7 @@ static void usage(const char *name)
>   "                            valid options are: 'none', 'writeback' (default),\n"
>   "                            'writethrough', 'directsync' and 'unsafe'\n"
>   "      --aio=MODE            set AIO mode (native, io_uring or threads)\n"
> -"      --discard=MODE        set discard mode (ignore, unmap)\n"
> +"      --discard=MODE        set discard mode (ignore, unmap, zeroes)\n"
>   "      --detect-zeroes=MODE  set detect-zeroes mode (off, on, unmap)\n"
>   "      --image-opts          treat FILE as a full set of image options\n"
>   "\n"
> diff --git a/qemu-options.hx b/qemu-options.hx
> index b5efa648ba..7e9d383499 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1209,7 +1209,7 @@ SRST
>   ERST
>   
>   DEF("blockdev", HAS_ARG, QEMU_OPTION_blockdev,
> -    "-blockdev [driver=]driver[,node-name=N][,discard=ignore|unmap]\n"
> +    "-blockdev [driver=]driver[,node-name=N][,discard=ignore|unmap|zeroes]\n"
>       "          [,cache.direct=on|off][,cache.no-flush=on|off]\n"
>       "          [,read-only=on|off][,auto-read-only=on|off]\n"
>       "          [,force-share=on|off][,detect-zeroes=on|off|unmap]\n"
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index 0e9354faa6..08e8b1b3d9 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -86,7 +86,7 @@ static void help(void)
>   "                         specify tracing options\n"
>   "  -V, --version          output version information and exit\n"
>   "\n"
> -"  --blockdev [driver=]<driver>[,node-name=<N>][,discard=ignore|unmap]\n"
> +"  --blockdev [driver=]<driver>[,node-name=<N>][,discard=ignore|unmap|zeroes]\n"
>   "             [,cache.direct=on|off][,cache.no-flush=on|off]\n"
>   "             [,read-only=on|off][,auto-read-only=on|off]\n"
>   "             [,force-share=on|off][,detect-zeroes=on|off|unmap]\n"

