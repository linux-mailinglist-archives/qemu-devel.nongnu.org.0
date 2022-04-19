Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F550771D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:11:01 +0200 (CEST)
Received: from localhost ([::1]:57060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsJY-0007TV-9c
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngsHH-00063l-Qf
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngsHF-0005pJ-Ko
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650391716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gOpyP4Qb17fy+PPhbKyjBulIZBSd2yvgQ5jatkFwS5A=;
 b=HmPO5NfSFR5l6uY72rj4AWEXR7wlvWzsj4ZFzwmsotl8ooF4BARtCKJn5Tm8JKk5Vfb2AO
 1lmxny87ddfB9+9/KXDc1nH5GpoiR0uxCJ6DqihvGma8Dh81BJBpY0Vg8zAru5GvtWlNOZ
 0A1P9ozzLamwWHlFCSvqbCD67QiNxQ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-7OuuvFcwOOy36FdT-j5AWw-1; Tue, 19 Apr 2022 14:08:33 -0400
X-MC-Unique: 7OuuvFcwOOy36FdT-j5AWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99CE585A5BE;
 Tue, 19 Apr 2022 18:08:33 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07B772166B4F;
 Tue, 19 Apr 2022 18:08:29 +0000 (UTC)
Date: Tue, 19 Apr 2022 13:08:28 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 03/26] nbd: remove incorrect coroutine_fn annotations
Message-ID: <20220419180815.ovptpidwpyku2qjf@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-4-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220415131900.793161-4-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 15, 2022 at 03:18:37PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/block/nbd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index a98eb665da..5c3710fa52 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -423,6 +423,6 @@ QIOChannel *coroutine_fn
>  nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
>                              bool blocking, Error **errp);
>  
> -void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
> +void nbd_co_establish_connection_cancel(NBDClientConnection *conn);

Should we rename this function to drop _co_ while at it?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


