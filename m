Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D650344C49
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:49:56 +0100 (CET)
Received: from localhost ([::1]:38932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONkZ-0001Ju-5X
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lONjb-0000tS-9C
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lONjV-0001Go-8I
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616431727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E6cR6ogIpS0rX2cEEILEPvmgQ7y5P9q5oCIXTmAqe2s=;
 b=eOuKsVBlUDTMSRazlkxAooGIiyd8yPAsOb/2lRMIVA5LWsYea2MiHIIUb9ZFFgsiL02yF9
 qvxsI2CNSXHJiGUElswT4KTMz4EmVQRQVrR1LvltdCtM5yhbpE81Me5E+Y27NLNwxozJJZ
 6Tw5oME1v03w43jlLCAyTYwjHnaJdQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-pHaikwmGMH-I0plCU6VZyw-1; Mon, 22 Mar 2021 12:48:44 -0400
X-MC-Unique: pHaikwmGMH-I0plCU6VZyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 578D781623
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:48:43 +0000 (UTC)
Received: from work-vm (ovpn-115-19.ams2.redhat.com [10.36.115.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB6949CA0;
 Mon, 22 Mar 2021 16:48:19 +0000 (UTC)
Date: Mon, 22 Mar 2021 16:48:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: add virtio-fs mailing list
Message-ID: <YFjKUcuMTf44oGMk@work-vm>
References: <20210318154157.1357224-1-ckuehl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210318154157.1357224-1-ckuehl@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Connor Kuehl (ckuehl@redhat.com) wrote:
> General discussion and patch reviews take place on this list for both
> virtiofsd (tools/virtiofsd/*) and the guest kernel module.
> 
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 25fc49d1dc..8921bc2119 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1917,6 +1917,7 @@ F: tools/virtiofsd/*
>  F: hw/virtio/vhost-user-fs*
>  F: include/hw/virtio/vhost-user-fs.h
>  F: docs/tools/virtiofsd.rst
> +L: virtio-fs@redhat.com

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>  
>  virtio-input
>  M: Gerd Hoffmann <kraxel@redhat.com>
> -- 
> 2.30.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


