Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79286701831
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 18:31:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxs7z-0000vd-JC; Sat, 13 May 2023 12:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pxs7x-0000vN-9Z
 for qemu-devel@nongnu.org; Sat, 13 May 2023 12:29:49 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pxs7v-00022y-8c
 for qemu-devel@nongnu.org; Sat, 13 May 2023 12:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Qi4RiStaL5jvkHpybIlYNAOVvNvNrDOPR6cDKyPHUNQ=; b=aEGkaYP/OKM7CHW3+niJH32D6C
 gbUriJ1/fH6nA8JMaiHX63C84hBv+E/WhbgeO9Cu3E48TLvtpVVTVuLgGHMkzzNzmm6SFeRq3PoLh
 iClAQdhHwaYl0+6dUSFLhOBkCT3iNi5WVx6n3kGKnhyWEdOvY5QUu2eAhwpTKu4+/g18523VRoY07
 7q1WLkToBBjrytjSqrrAw8gIqAaKcdc9KIDLfEolw/m3DxFFm9QU4uPm+ej/1WWgLK4Blv126eSOk
 uNsVNXXZKLfu+KBjADwy53qvp7UlKMFkeWpfwohFTOElJy6RjkvtAk3yZ327BOYI0ROySuJ9rxKFI
 ATwn4N9QPW4lVbWNdHKcIEs9GQO18O0LTSKO1qPiYiiVOrfPN8FoinvPVZr/6ZRhRrZKEGwui8BrR
 HjMcIUyOTNfziwWwVOvKA9Xra+UVNIDhTDLyu33/2K/jGv7TIPVxNGT1eIkOSAqVYAb92ShNbrD4+
 hsXAnn7HdhFjgdP/T7dF6uR3bAv1TqacSBWrakIo8uTVoeg9FyjfsBwi8DZL8Bl4gOYR5mcUnwBwx
 2FWG2H1p7IDiKXQXBqDEjt6mC9Aw2wBQLiYq+ny/Hcfc2mb/S+NGG99VULVWhMqTldI0lBdJSrm8+
 sluSjbDFb9MJIQYGNTkZ+nytJuSn7zdz3PC8XLxOg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] configure: make clear that VirtFS is 9p
Date: Sat, 13 May 2023 18:29:42 +0200
Message-ID: <3063261.pT3by1Vr1v@silver>
In-Reply-To: <E1px7Id-0000NE-OQ@lizzy.crudebyte.com>
References: <E1px7Id-0000NE-OQ@lizzy.crudebyte.com>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, May 11, 2023 4:12:34 PM CEST Christian Schoenebeck wrote:
> Add '9P' to the summary output section of 'VirtFS' to avoid being
> confused with virtiofs.
> 
> Based-on: <20230503130757.863824-1-pefoley@google.com>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck

> diff --git a/meson.build b/meson.build
> index 5d8373b608..5d65f53fec 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3922,8 +3922,8 @@ if have_block
>    summary_info += {'Block whitelist (rw)': get_option('block_drv_rw_whitelist')}
>    summary_info += {'Block whitelist (ro)': get_option('block_drv_ro_whitelist')}
>    summary_info += {'Use block whitelist in tools': get_option('block_drv_whitelist_in_tools')}
> -  summary_info += {'VirtFS support':    have_virtfs}
> -  summary_info += {'VirtFS Proxy Helper support': have_virtfs_proxy_helper}
> +  summary_info += {'VirtFS (9P) support':    have_virtfs}
> +  summary_info += {'VirtFS (9P) Proxy Helper support': have_virtfs_proxy_helper}
>    summary_info += {'Live block migration': config_host_data.get('CONFIG_LIVE_BLOCK_MIGRATION')}
>    summary_info += {'replication support': config_host_data.get('CONFIG_REPLICATION')}
>    summary_info += {'bochs support':     get_option('bochs').allowed()}
> 



