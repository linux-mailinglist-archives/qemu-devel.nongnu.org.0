Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260DA63CD17
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 03:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0CRH-0008Mv-93; Tue, 29 Nov 2022 21:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0CRE-0008He-Iz; Tue, 29 Nov 2022 21:03:04 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0CRC-0006qR-U9; Tue, 29 Nov 2022 21:03:04 -0500
Received: by mail-yb1-xb35.google.com with SMTP id j196so19871530ybj.2;
 Tue, 29 Nov 2022 18:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6v5FexhonbC32Q/NRmfMF4MN305riOYR2GNSSJMEJrg=;
 b=VK+pC48EgX4ZPjT6+wmX+SZ5biSLkNfiiluNRw9Og2luYPjN/OKn6ITadOPzZ+BU/m
 /iWou7jM3t5ZDKUAC3W43Zc/RuWdES/cWv67pSh1ZGOKAPHq54gdvXmjyy4dk4fDHvgd
 TxTEIiR65NCRxDEFseUkD86Q40kWeJCcuIiWpn6xKSXsrUxsD64f2WrzoLxmSWdSSYkR
 Xq6qQBI9jmyPKWALvZAmTXeEE0w3UUb5124F21CInk+pW58Kgxwc6L3Dk/85iobfJU82
 As2inOGPnRDSUAJpv2FosXgqUN6oRL6vrf2sQ+5w5Ij2rKTF/4JahHXeR1e3hUk8PkaS
 CaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6v5FexhonbC32Q/NRmfMF4MN305riOYR2GNSSJMEJrg=;
 b=wSkMxFPlMfMVU8w5CGrnKCLTgBzgCfTZ12MYnifs54IP+0SO7cXz4b/jvGaYrpcPy2
 eOa2Whg5HG7p7CPYECdbeIYCy81GKqf/beB/cm9ottGPTU5JCFYNIvPw6XUgxPKD06Zw
 yKLfZLbHyKSp4AL5C0Ae6Y7AAJ59StZe2IXbH96WUwXdqDNrbCJ8M+AXhR/brbSxk3Js
 a6+ImSE+JA6C8+nKbjJ693eIztSgbsQYNbW0qjb5MmTLPQq95rSh0Wyk4l+72+jCIA9j
 xSGC/0zguDndQwmphJHpUlQr7xJEo9nZRRpPAwt8xhv3H1AQ1SzcIpgQa1Pcr2F7rOsT
 bLGw==
X-Gm-Message-State: ANoB5pktXcKXuj4+SwhJ893cP/grZ9T3gjRlv/NOe/ndF8qNJGTEpDSm
 kRXb9vJw9F7GiFLdE4Xy/QIjHhQ299i+vg7GO3Y=
X-Google-Smtp-Source: AA0mqf7yh9VwCc1dPifmZ/YrjJurRG7LBMtdsC4YRNwXJLXUlYk4rP4Mg5jt5hQYKgsXmT3+NJgEBNq6wAhkZpEiU94=
X-Received: by 2002:a25:664d:0:b0:6f9:1e10:af3b with SMTP id
 z13-20020a25664d000000b006f91e10af3bmr4647469ybm.366.1669773781529; Tue, 29
 Nov 2022 18:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20221027154504.20684-1-faithilikerun@gmail.com>
 <20221027154504.20684-8-faithilikerun@gmail.com>
In-Reply-To: <20221027154504.20684-8-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 29 Nov 2022 21:02:49 -0500
Message-ID: <CAJSP0QWRb4SXg-=2u0nCYW5=EmUsrS7=m8VihLD0iQ4+Q78AMw@mail.gmail.com>
Subject: Re: [PATCH v13 7/8] block: add some trace events for new block layer
 APIs
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, 
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org, stefanha@redhat.com, 
 Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, 
 dmitry.fomichev@wdc.com, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb35.google.com
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

On Thu, 27 Oct 2022 at 11:48, Sam Li <faithilikerun@gmail.com> wrote:
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/file-posix.c | 3 +++
>  block/trace-events | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 02476c011e..fe52e91da4 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -3259,6 +3259,7 @@ static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
>                                             BlockZoneDescriptor *zones) {
>      BDRVRawState *s = bs->opaque;
>      RawPosixAIOData acb;
> +    trace_zbd_zone_report(bs, *nr_zones, offset >> BDRV_SECTOR_BITS);
>
>      acb = (RawPosixAIOData) {
>          .bs         = bs,
> @@ -3337,6 +3338,8 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>          },
>      };
>
> +    trace_zbd_zone_mgmt(bs, op_name, offset >> BDRV_SECTOR_BITS,
> +                        len >> BDRV_SECTOR_BITS);
>      ret = raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
>      if (ret != 0) {
>          ret = -errno;
> diff --git a/block/trace-events b/block/trace-events
> index 48dbf10c66..3f4e1d088a 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -209,6 +209,8 @@ file_FindEjectableOpticalMedia(const char *media) "Matching using %s"
>  file_setup_cdrom(const char *partition) "Using %s as optical disc"
>  file_hdev_is_sg(int type, int version) "SG device found: type=%d, version=%d"
>  file_flush_fdatasync_failed(int err) "errno %d"
> +zbd_zone_report(void *bs, unsigned int nr_zones, int64_t sector) "bs %p report %d zones starting at sector offset 0x%" PRIx64 ""
> +zbd_zone_mgmt(void *bs, const char *op_name, int64_t sector, int64_t len) "bs %p %s starts at sector offset 0x%" PRIx64 " over a range of 0x%" PRIx64 " sectors"
>
>  # ssh.c
>  sftp_error(const char *op, const char *ssh_err, int ssh_err_code, int sftp_err_code) "%s failed: %s (libssh error code: %d, sftp error code: %d)"
> --
> 2.38.1
>
>

