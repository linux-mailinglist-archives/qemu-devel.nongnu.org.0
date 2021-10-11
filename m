Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA267429732
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 21:01:27 +0200 (CEST)
Received: from localhost ([::1]:32792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma0YA-00084L-S1
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 15:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0Vw-0006uw-Bp
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:59:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0Vu-0002bE-DX
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633978745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V551T266j0Bkf7Z+ScMcMDyTkmVyeFg37kxjpRKPTwQ=;
 b=Bsn+ociIrS9HmzPJv8wRAXAHiNugKhH5Hpf/lAqPp9kJKb2L+VGJLwtHYYgcCRsRIUR2OV
 E8R0Ab1Ab1ExpgbFwVnoVrruffrSFOmND008H7zOc+pH8Yke531loGjYnmLDhlbw+DTYLI
 iOrD0O3nO570PWRf+pMe2TeHIVEtOjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-9SH8iWPTMr6Gu5Rodg-WyQ-1; Mon, 11 Oct 2021 14:58:59 -0400
X-MC-Unique: 9SH8iWPTMr6Gu5Rodg-WyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D8EB84A5ED;
 Mon, 11 Oct 2021 18:58:58 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DF521017CF5;
 Mon, 11 Oct 2021 18:58:19 +0000 (UTC)
Date: Mon, 11 Oct 2021 13:58:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH RFC v2 5/5] block: Deprecate transaction type drive-backup
Message-ID: <20211011185817.czv4tmlsxiyhuqrp@redhat.com>
References: <20211009120944.2858887-1-armbru@redhat.com>
 <20211009120944.2858887-6-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009120944.2858887-6-armbru@redhat.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 09, 2021 at 02:09:44PM +0200, Markus Armbruster wrote:
> Several moons ago, Vladimir posted
> 
>     Subject: [PATCH v2 3/3] qapi: deprecate drive-backup
>     Date: Wed,  5 May 2021 16:58:03 +0300
>     Message-Id: <20210505135803.67896-4-vsementsov@virtuozzo.com>
>     https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01394.html
> 
> with this
> 
>     TODO: We also need to deprecate drive-backup transaction action..
>     But union members in QAPI doesn't support 'deprecated' feature. I tried
>     to dig a bit, but failed :/ Markus, could you please help with it? At
>     least by advice?
> 
> This is one way to resolve it.  Sorry it took so long.
> 
> John explored another way, namely adding feature flags to union
> branches.  Could also be useful, say to add different features to
> branches in multiple unions sharing the same tag enum.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/transaction.json | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/transaction.json b/qapi/transaction.json
> index d175b5f863..0564a893b3 100644
> --- a/qapi/transaction.json
> +++ b/qapi/transaction.json
> @@ -54,6 +54,9 @@
>  # @blockdev-snapshot-sync: since 1.1
>  # @drive-backup: Since 1.6
>  #
> +# Features:
> +# @deprecated: Member @drive-backup is deprecated.  Use FIXME instead.

Obviously, we'd need to flesh this out ("'blockdev-backup' with proper
node names"? something else?) before dropping RFC on this patch.

And we'd want to edit docs/about/deprecated.rst to match.

> +#
>  # Since: 1.1
>  ##
>  { 'enum': 'TransactionActionKind',
> @@ -62,7 +65,7 @@
>              'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
>              'blockdev-backup', 'blockdev-snapshot',
>              'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
> -            'drive-backup' ] }
> +            { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
>  
>  ##
>  # @AbortWrapper:
> -- 
> 2.31.1
>

But the idea is reasonable, and I'm not sure if we're any closer to
John's idea of feature flags on union branches.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


