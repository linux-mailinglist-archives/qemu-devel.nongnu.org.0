Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A56B6B7819
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 13:54:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhgL-00083w-Sg; Mon, 13 Mar 2023 08:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pbhgH-00083D-L3
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:53:38 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pbhgF-0000dg-JU
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=pj4ntcBcxWDOBZSg91hlq67qdY3VMRXbP6KvHmlcIK4=; b=G+QXIQHkCTX0638BV2D26/YB/F
 DxWUhvGt4U/L7toBQN0VlXgYs5Ff+cJhZ6kgoZqNCWxv8wPHRxAQFxWjBpvEhnInlhUWEW9+VgFMm
 cytuWPuI/UDzz1yuXJ8eCmEdc+D+Ftj9JqqHYYbfJBjP4OqLiS8RDBn83a59hlhzGTEjBfy7Yrmnv
 R95W/h8PJv5xR5pUbMDVD1iZWLbhdMqoXmEU36txJ09MmF+ZL3gb8LXj3peFUJomHiIrZNfoUm+GB
 SHrc2kInQ2Mgdax6PpWcakiH1hDzKk1r17uMfDIVRz6QcaDVLDfWHzY3bNpdNdpjWGCBqKuPAo/w9
 8F/W9RMJ+6SSY2ItsjpBdfzKmS/Py22jxtJXF3cO9jD7+6BkwCRfSKt/mc1uZnVNCLWMe0zOpe+eH
 MTZzo9tRvBYT8rCVvm3w2RXmhiXcFOs40nLY4xlv/pDcLOJGu9zvulYPwvLshfNDlJbFT3LFhApCB
 kC+lOuAl2W9azKruLfK4WSXgchk6G7PFn9Q2s4cDtyX1kQnGaodZNZpNXuw5N+4WZIbF4pRyqBnHl
 YvE+RssKtXV6JRN8Sau4mC2xYnGIvwGjqu+ayY3TL8YuA2wTB8cRlQzLdLOVKLdtpM7GcDz3S3LNH
 tJdjThEU7h8zEkvgqVEBazLODflcbZquB7WJa7eNA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH v5 16/16] meson.build: Turn on virtfs for Windows
Date: Mon, 13 Mar 2023 13:53:30 +0100
Message-ID: <3650827.9nNZqsIlJu@silver>
In-Reply-To: <20230220100815.1624266-17-bin.meng@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <20230220100815.1624266-17-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Monday, February 20, 2023 11:08:15 AM CET Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> Enable virtfs configuration option for Windows host.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  meson.build         | 10 +++++-----
>  fsdev/meson.build   |  1 +
>  hw/9pfs/meson.build |  8 +++++---
>  3 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index a76c855312..9ddf254e78 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1755,16 +1755,16 @@ dbus_display = get_option('dbus_display') \
>    .allowed()
>  
>  have_virtfs = get_option('virtfs') \
> -    .require(targetos == 'linux' or targetos == 'darwin',
> -             error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
> -    .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
> +    .require(targetos == 'linux' or targetos == 'darwin' or targetos == 'windows',
> +             error_message: 'virtio-9p (virtfs) requires Linux or macOS or Windows') \
> +    .require(targetos == 'linux' or targetos == 'windows' or cc.has_function('pthread_fchdir_np'),
>               error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
> -    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
> +    .require(targetos == 'darwin' or targetos == 'windows' or (libattr.found() and libcap_ng.found()),
>               error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
>      .disable_auto_if(not have_tools and not have_system) \
>      .allowed()
>  
> -have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
> +have_virtfs_proxy_helper = targetos != 'darwin' and targetos != 'windows' and have_virtfs and have_tools
>  
>  if get_option('block_drv_ro_whitelist') == ''
>    config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
> diff --git a/fsdev/meson.build b/fsdev/meson.build
> index b632b66348..2aad081aef 100644
> --- a/fsdev/meson.build
> +++ b/fsdev/meson.build
> @@ -8,6 +8,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
>  ), if_false: files('qemu-fsdev-dummy.c'))
>  softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
>  softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
> +softmmu_ss.add_all(when: 'CONFIG_WIN32', if_true: fsdev_ss)
>  
>  if have_virtfs_proxy_helper
>    executable('virtfs-proxy-helper',
> diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
> index 12443b6ad5..aaa50e71f7 100644
> --- a/hw/9pfs/meson.build
> +++ b/hw/9pfs/meson.build
> @@ -2,7 +2,6 @@ fs_ss = ss.source_set()
>  fs_ss.add(files(
>    '9p-local.c',
>    '9p-posix-acl.c',
> -  '9p-proxy.c',
>    '9p-synth.c',
>    '9p-xattr-user.c',
>    '9p-xattr.c',
> @@ -13,8 +12,11 @@ fs_ss.add(files(
>    'coth.c',
>    'coxattr.c',
>  ))
> -fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
> -fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
> +fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-proxy.c',
> +                                               '9p-util-linux.c'))
> +fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-proxy.c',
> +                                                '9p-util-darwin.c'))
> +fs_ss.add(when: 'CONFIG_WIN32', if_true: files('9p-util-win32.c'))
>  fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))

This no longer applies on master because CONFIG_XEN has been renamed to
CONFIG_XEN_BUS.

>  softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
>  
> 




