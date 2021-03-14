Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C333A8DC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:38:05 +0100 (CET)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaJA-0000ro-7J
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lLaHp-0008Bk-Jl
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:36:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lLaHj-0006q3-HM
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615764994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YkRhFZf4Il/SPjWa6rQB3STwh1qR/Md0xVRzySZj194=;
 b=J1dbYMP2EtTzt/jLALXmiJHpRFEaveSsC2y3/rIpaZYBeLAh//+xuU8nthEx+sKNgXZB8H
 7Swja4MoAF3KuiDTx8ArcByp2bcnEr1b3/71FKdJNjiWDHJQaUdqd17a/nzMzG8rJgs/lG
 rqOkba5O4YYC9vzwT8KTm7nAkZhhW6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-Mze1R5uyMqeB5Jys6RpYZg-1; Sun, 14 Mar 2021 19:36:32 -0400
X-MC-Unique: Mze1R5uyMqeB5Jys6RpYZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF0A11074659;
 Sun, 14 Mar 2021 23:36:31 +0000 (UTC)
Received: from horse.redhat.com (ovpn-112-132.rdu2.redhat.com [10.10.112.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BAB05D9C0;
 Sun, 14 Mar 2021 23:36:28 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 1E14622054F; Sun, 14 Mar 2021 19:36:28 -0400 (EDT)
Date: Sun, 14 Mar 2021 19:36:28 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH 2/3] virtiofsd: Convert some functions to
 return bool
Message-ID: <20210314233628.GD223210@redhat.com>
References: <20210312141003.819108-1-groug@kaod.org>
 <20210312141003.819108-3-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210312141003.819108-3-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 03:10:02PM +0100, Greg Kurz wrote:
> Both currently only return 0 or 1.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Looks good to me.

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Vivek

> ---
>  tools/virtiofsd/passthrough_ll.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 27a6c636dcaf..f63016d35626 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -221,17 +221,17 @@ static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
>  static int xattr_map_client(const struct lo_data *lo, const char *client_name,
>                              char **out_name);
>  
> -static int is_dot_or_dotdot(const char *name)
> +static bool is_dot_or_dotdot(const char *name)
>  {
>      return name[0] == '.' &&
>             (name[1] == '\0' || (name[1] == '.' && name[2] == '\0'));
>  }
>  
>  /* Is `path` a single path component that is not "." or ".."? */
> -static int is_safe_path_component(const char *path)
> +static bool is_safe_path_component(const char *path)
>  {
>      if (strchr(path, '/')) {
> -        return 0;
> +        return false;
>      }
>  
>      return !is_dot_or_dotdot(path);
> -- 
> 2.26.2
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs


