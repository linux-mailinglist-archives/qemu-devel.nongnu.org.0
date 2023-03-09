Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D796B1FEA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:25:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCV8-000556-8o; Thu, 09 Mar 2023 04:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1paCV5-00054V-SR; Thu, 09 Mar 2023 04:23:52 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1paCV4-0002xk-5K; Thu, 09 Mar 2023 04:23:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=oKcmFGELCf1PrGVhmGiSSWe0nPEmAotH3AQf0knJnJY=; b=dSncrQPOaTh0Y1al7G/9Gk3eO8
 oT5hdP7b407CQfhOBAikOt7OWRuty7T82iO25x7psZwka4ZguhRG3tSnqyj/nMIMnMcaTIjjMLI4F
 HnKXUHXgU5+Kl2FtfCFWG4Hm2mnzonqS5OCpD6SRL/Pdz7UyAzH6a860b88bABeF5YN5j2ZEJ35Ff
 gMZgNEn1tMVyOwrvWGlg+//+Jw9Zgax47fDhUalGDwxcAvEYFvL9W5t/GvCHAl7XIdO8tj5TLLJXJ
 MqbfWLBwAUr+wcLKZvENIFJ1sgZ1LZO3QTCXcYurecq0lH1YbsxnCF/7zLPiM7Hc22OeW+xWnQenZ
 +81NU77S4uQY8AEta2QPP+LgcYJzrhFXrt6DfyVENUfYFkdP5fZQmpom9xw7rIC59sJfzXQ7EA8aJ
 DppjVWDy0Utj1Vvrw3p/ovSx6pNef0L9cXTjMTT9bU8XFI8XsUlrqAA8MvKra8iVbadMzEwl1Uwdd
 16InbBDSjkNi2gnJf/v5OFB7NVYGqQBErLsuwGjRQIn7fTp0Pm30S26x0+OF/DQf6EiSm7ecrKJ8l
 meOnKpJAWOZUTkU4M67nMfgEsARfWCFalhI3tDeXN8skIs2AOPR38zfTMtGuTNk6LCI12FQyjz/Qp
 e87bHzmcqD9l26oN5oiOIcWC5UMo0hOgGorlg5IqY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 5/9] 9pfs: mark more coroutine_fns
Date: Thu, 09 Mar 2023 10:23:44 +0100
Message-ID: <6481614.xcOUY1sZLx@silver>
In-Reply-To: <20230309084456.304669-6-pbonzini@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
 <20230309084456.304669-6-pbonzini@redhat.com>
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

On Thursday, March 9, 2023 9:44:52 AM CET Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/9pfs/9p.h    | 4 ++--
>  hw/9pfs/codir.c | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 2fce4140d1e9..1b0d805b9c12 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -203,7 +203,7 @@ typedef struct V9fsDir {
>      QemuMutex readdir_mutex_L;
>  } V9fsDir;
>  
> -static inline void v9fs_readdir_lock(V9fsDir *dir)
> +static inline void coroutine_fn v9fs_readdir_lock(V9fsDir *dir)
>  {
>      if (dir->proto_version == V9FS_PROTO_2000U) {
>          qemu_co_mutex_lock(&dir->readdir_mutex_u);
> @@ -212,7 +212,7 @@ static inline void v9fs_readdir_lock(V9fsDir *dir)
>      }
>  }
>  
> -static inline void v9fs_readdir_unlock(V9fsDir *dir)
> +static inline void coroutine_fn v9fs_readdir_unlock(V9fsDir *dir)
>  {
>      if (dir->proto_version == V9FS_PROTO_2000U) {
>          qemu_co_mutex_unlock(&dir->readdir_mutex_u);
> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> index 7ba63be489e7..0d0ffa1d2ba8 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -68,9 +68,9 @@ int coroutine_fn v9fs_co_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
>   *
>   * See v9fs_co_readdir_many() (as its only user) below for details.
>   */
> -static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
> -                           struct V9fsDirEnt **entries, off_t offset,
> -                           int32_t maxsize, bool dostat)
> +static int coroutine_fn do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
> +                                        struct V9fsDirEnt **entries, off_t offset,
> +                                        int32_t maxsize, bool dostat)

You should probably fix wrapping here, as the line exceeds 80 characters.

Except of that:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>  {
>      V9fsState *s = pdu->s;
>      V9fsString name;
>




