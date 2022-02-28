Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313BD4C6DBC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:18:21 +0100 (CET)
Received: from localhost ([::1]:33582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOfut-00035K-R1
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:18:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nOfo6-0000hm-CI
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:11:18 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:49241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nOfo4-0002zo-2W
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=yDhuXvPcBGPvHvOtIdpIVJ/a9YMuqazOcpqFZWHEI88=; b=EP+xG8vzCxcBw4qMaA7wh2u+Pr
 0rLoeIrSK5o60lr5oBQA51Bq710f+mc7iA5gLzIGUaTcurb1iFrE2QdAT/y4HKehVfu01aKqyQ+R3
 2f6AfXlfiy0pjPNGJ96NqOFqZ03kqB/ypW8So3bBwGBflHkPuGXdcvRtATo8yL5NHZRbMEVhXoopD
 DcXUrpGKZT6LgwszGXG+zpSKh5gWj2qfgUN2G/XGXCv9ZuxPgKncQ/CUYwu6AxmLf8SppRykY/5ZK
 YKQAQv26B6B+rNS/1rK7cLotyNLj1ewjwf66BsB8MDhBmVAhZnV/Mih8NmwJaImO20O6Lfndx2290
 d0TR9ut/v5ZqipIP2pUdr5GFQUwk5DEXnJT1EcqCHU22FsdYxr38wzVsXUfxS64Ul/Xmbqr2ncssQ
 gb2qlgEAFu9MvILizWzPnch3Lj6VvO/1ZjEIl6YuK3Sha9FSWfOSXCWfJ+K79B7Kg6DGdHztgQ9/T
 OH0vNf9jxzh8vWN6HRe9sk1203nb5/BY/RBrB3NGctEQ94/IUB66TwE+cbhDKjOkZ8hzrXo/C6sPi
 lSbuxsY+IwNano3Xj3yMLKQbBKbQgo8lHTEY3r4Rt1Cqq3JJIfL+WO2eBg694DTohXjgfniFV0Wdb
 p7nT933YMDHL+ig+kilI8a21RQFpFSzm+qwONbyv8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v9 11/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Mon, 28 Feb 2022 14:11:09 +0100
Message-ID: <2695789.GFM3nsWq8U@silver>
In-Reply-To: <20220227223522.91937-12-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <20220227223522.91937-12-wwcohen@gmail.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sonntag, 27. Februar 2022 23:35:22 CET Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> To allow VirtFS on darwin, we need to check that pthread_fchdir_np is
> available, which has only been available since macOS 10.12.
> 
> Additionally, virtfs_proxy_helper is disabled on Darwin. This patch
> series does not currently provide an implementation of the proxy-helper,
> but this functionality could be implemented later on.
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> [Michael Roitzsch: - Rebase for NixOS]
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Rebase to master]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo, could you have a look at this patch, please? It has changed quite a bit
since your review.

Best regards,
Christian Schoenebeck

> [Will Cohen: - Add check for pthread_fchdir_np to virtfs
>              - Add comments to patch commit
>              - Note that virtfs_proxy_helper does not work
>                on macOS
>              - Fully adjust meson virtfs error note to specify
>                macOS
>              - Rebase to master]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  fsdev/meson.build |  1 +
>  meson.build       | 12 +++++++-----
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/fsdev/meson.build b/fsdev/meson.build
> index adf57cc43e..b632b66348 100644
> --- a/fsdev/meson.build
> +++ b/fsdev/meson.build
> @@ -7,6 +7,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
>    'qemu-fsdev.c',
>  ), if_false: files('qemu-fsdev-dummy.c'))
>  softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
> +softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
> 
>  if have_virtfs_proxy_helper
>    executable('virtfs-proxy-helper',
> diff --git a/meson.build b/meson.build
> index 3f8dca2c7a..ba52ed9e9a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1450,14 +1450,16 @@ dbus_display = get_option('dbus_display') \
>    .allowed()
> 
>  have_virtfs = get_option('virtfs') \
> -    .require(targetos == 'linux',
> -             error_message: 'virtio-9p (virtfs) requires Linux') \
> -    .require(libattr.found() and libcap_ng.found(),
> -             error_message: 'virtio-9p (virtfs) requires libcap-ng-devel and libattr-devel') \
> +    .require(targetos == 'linux' or targetos == 'darwin',
> +             error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
> +    .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
> +             error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
> +    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
> +             error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
>      .disable_auto_if(not have_tools and not have_system) \
>      .allowed()
> 
> -have_virtfs_proxy_helper = have_virtfs and have_tools
> +have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
> 
>  foreach k : get_option('trace_backends')
>    config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)



