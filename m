Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF2D55B85F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:56:00 +0200 (CEST)
Received: from localhost ([::1]:38860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jbE-0001zb-1E
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1o5jDU-0006LD-Cq; Mon, 27 Jun 2022 03:31:28 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:49502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1o5jDS-00069E-54; Mon, 27 Jun 2022 03:31:27 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B96D721CA4;
 Mon, 27 Jun 2022 07:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656315084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GG8B4NadEXOMeeFq5HQuz6Yk5KdBBlrNdFl3Vzo9gS8=;
 b=WZOa6iGYO/49SmQWb9+Rn7G7TWGrVQ5rtBpM8ItXag9KGolxLl6/UhL4OMOJ6Z6ldK32gA
 CVFXdQ+I9lqi9+gGVy7FQgrrEw0EhBX3nqXZ4z3qDJWP7my3lVuCCrGpe9nvKiALabF7v7
 AMh50jSFJYp7L0Xt2FD3MgMEkXZx4d0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656315084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GG8B4NadEXOMeeFq5HQuz6Yk5KdBBlrNdFl3Vzo9gS8=;
 b=QI+tZBcn9O9q+Pt5qgXBmbYMBxMemJL/QPzjjBF02v2EVMPUMxcXeYNvUgjYtwL/IPbAqi
 6TaduDsLAtCPhNDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7889C13456;
 Mon, 27 Jun 2022 07:31:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VSufGsxcuWIwdAAAMHmgww
 (envelope-from <hare@suse.de>); Mon, 27 Jun 2022 07:31:24 +0000
Message-ID: <09739a27-358f-8150-fcb3-2d2b8be0caaf@suse.de>
Date: Mon, 27 Jun 2022 09:31:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC v3 3/5] file-posix: introduce get_sysfs_long_val for zoned
 device information.
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-4-faithilikerun@gmail.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20220627001917.9417-4-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=hare@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/27/22 02:19, Sam Li wrote:
> Use sysfs attribute files to get the zoned device information in case
> that ioctl() commands of zone management interface won't work. It can
> return long type of value like chunk_sectors, zoned_append_max_bytes,
> max_open_zones, max_active_zones.
> ---
>   block/file-posix.c | 37 +++++++++++++++++++++++++------------
>   1 file changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 1b8b0d351f..73c2cdfbca 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1216,15 +1216,19 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
>   #endif
>   }
>   
> -static int hdev_get_max_segments(int fd, struct stat *st)
> -{
> +/*
> + * Get zoned device information (chunk_sectors, zoned_append_max_bytes,
> + * max_open_zones, max_active_zones) through sysfs attribute files.
> + */
> +static long get_sysfs_long_val(int fd, struct stat *st,
> +                               const char *attribute) {
>   #ifdef CONFIG_LINUX
>       char buf[32];
>       const char *end;
>       char *sysfspath = NULL;
>       int ret;
>       int sysfd = -1;
> -    long max_segments;
> +    long val;
>   
>       if (S_ISCHR(st->st_mode)) {
>           if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> @@ -1237,8 +1241,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
>           return -ENOTSUP;
>       }
>   
> -    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
> -                                major(st->st_rdev), minor(st->st_rdev));
> +    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> +                                major(st->st_rdev), minor(st->st_rdev),
> +                                attribute);
>       sysfd = open(sysfspath, O_RDONLY);
>       if (sysfd == -1) {
>           ret = -errno;
> @@ -1256,9 +1261,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
>       }
>       buf[ret] = 0;
>       /* The file is ended with '\n', pass 'end' to accept that. */
> -    ret = qemu_strtol(buf, &end, 10, &max_segments);
> +    ret = qemu_strtol(buf, &end, 10, &val);
>       if (ret == 0 && end && *end == '\n') {
> -        ret = max_segments;
> +        ret = val;
>       }
>   
>   out:
> @@ -1272,6 +1277,15 @@ out:
>   #endif
>   }
>   
> +static int hdev_get_max_segments(int fd, struct stat *st) {
> +    int ret;
> +    ret = get_sysfs_long_val(fd, st, "max_segments");
> +    if (ret < 0) {
> +        return -1;
> +    }
> +    return ret;
> +}
> +
>   static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>   {
>       BDRVRawState *s = bs->opaque;
> @@ -1872,6 +1886,7 @@ static int handle_aiocb_zone_report(void *opaque) {
>   
>   static int handle_aiocb_zone_mgmt(void *opaque) {
>       RawPosixAIOData *aiocb = opaque;
> +    BlockDriverState *s = aiocb->bs;
>       int fd = aiocb->aio_fildes;
>       int64_t offset = aiocb->aio_offset;
>       int64_t len = aiocb->aio_nbytes;
> @@ -1884,11 +1899,9 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
>       int64_t zone_size_mask;
>       int ret;
>   
> -    ret = ioctl(fd, BLKGETZONESZ, &zone_size);
> -    if (ret) {
> -        return -1;
> -    }
> -
> +    g_autofree struct stat *file = g_new(struct stat, 1);
> +    stat(s->filename, file);
> +    zone_size = get_sysfs_long_val(fd, file, "chunk_sectors");
>       zone_size_mask = zone_size - 1;
>       if (offset & zone_size_mask) {
>           error_report("offset is not the start of a zone");

Round of applause.

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Felix Imendörffer

