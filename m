Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B583A32F42C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 20:42:57 +0100 (CET)
Received: from localhost ([::1]:48122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIGLg-0006fZ-LU
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 14:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lIGJu-0005Uu-HX
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:41:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lIGJs-0001GB-BM
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 14:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614973262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KT9VnlaZ6UEcmuSn9Db54edrZFWYxcYpVASfbrxxHNI=;
 b=X0m0wnOkV7nDxXVhs4LhXkNX2dCBdxuLvzokv7zC9OiLrZUo4w8uGgsVvBBDRMWnK+AoDS
 68MA1nq8t/CkB9qAatvVMoHDC2tr4txcNBz03xjAGpAcyCDx1c8LLY5G4kJUpe8eFd03zH
 Ts9t2ObCmLkMl2tsqXH1E5/Yycvb330=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-BnnBeFWMO-KFE6d2msiw3w-1; Fri, 05 Mar 2021 14:41:01 -0500
X-MC-Unique: BnnBeFWMO-KFE6d2msiw3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E656A1009470;
 Fri,  5 Mar 2021 19:40:59 +0000 (UTC)
Received: from [10.3.113.71] (ovpn-113-71.phx2.redhat.com [10.3.113.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A33CB60BF3;
 Fri,  5 Mar 2021 19:40:59 +0000 (UTC)
Subject: Re: [PATCH] docs: qsd: Explain --export nbd,name=... default
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210305094856.18964-1-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <260328cb-fcd5-44c8-7ccc-fae9870fa9ff@redhat.com>
Date: Fri, 5 Mar 2021 13:40:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305094856.18964-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 3:48 AM, Kevin Wolf wrote:
> The 'name' option for NBD exports is optional. Add a note that the
> default for the option is the node name (people could otherwise expect
> that it's the empty string like for qemu-nbd).
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  docs/tools/qemu-storage-daemon.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Hmm. If we are only exporting a single image, letting "" serve as the
default export name as a synonym for the non-empty node-name might be
nice.  But we can export more than one image at a time, at which point
"" has no sane default, so always requiring the client to know the node
name is tolerable.  And 'qemu-nbd --list' or 'nbdinfo --list' are
capable of showing which node name(s) an NBD server is exposing.

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
> index fe3042d609..086493ebb3 100644
> --- a/docs/tools/qemu-storage-daemon.rst
> +++ b/docs/tools/qemu-storage-daemon.rst
> @@ -80,8 +80,9 @@ Standard options:
>    requests for modifying data (the default is off).
>  
>    The ``nbd`` export type requires ``--nbd-server`` (see below). ``name`` is
> -  the NBD export name. ``bitmap`` is the name of a dirty bitmap reachable from
> -  the block node, so the NBD client can use NBD_OPT_SET_META_CONTEXT with the
> +  the NBD export name (if not specified, it defaults to the given
> +  ``node-name``). ``bitmap`` is the name of a dirty bitmap reachable from the
> +  block node, so the NBD client can use NBD_OPT_SET_META_CONTEXT with the
>    metadata context name "qemu:dirty-bitmap:BITMAP" to inspect the bitmap.
>  
>    The ``vhost-user-blk`` export type takes a vhost-user socket address on which
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


