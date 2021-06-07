Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD9F39E736
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:07:58 +0200 (CEST)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKbN-0007oF-Kb
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqKSj-00063R-IK
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:59:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqKSf-0006U5-9r
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 14:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623092336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/2iz8TMifcSG3zxZ53J28uLPK5ZLr+GblniXuJuf7es=;
 b=FcBRDHR3UBhEP9C6lyCmWL1R1A2Nk6nabHHzMwvu/+dWFe+nZ+PoDfcAmqMQCFtITR0Imn
 qu2yBDrtknzWeaAciUmZFEysHOebrCFYdhpmc4vcMGZjCBKIhd9ow9VN1JSAQG1RaUro2M
 WlGHfzCOH5nVUfF9uy5B+ATB9WZizb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-ZKN39_KBO4aUCZCGpxKbKg-1; Mon, 07 Jun 2021 14:58:55 -0400
X-MC-Unique: ZKN39_KBO4aUCZCGpxKbKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A1F3800D62;
 Mon,  7 Jun 2021 18:58:54 +0000 (UTC)
Received: from work-vm (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7580C60C04;
 Mon,  7 Jun 2021 18:58:50 +0000 (UTC)
Date: Mon, 7 Jun 2021 19:58:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] docs/tools/virtiofsd: Fix bad rst syntax
Message-ID: <YL5sZ8xprsuG/S0D@work-vm>
References: <20210607180015.924571-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607180015.924571-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Thomas Huth (thuth@redhat.com) wrote:
> For literal blocks, there has to be an empty line after the two colons,
> and the block itself should be indented.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  docs/tools/virtiofsd.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index 265a39b0cf..4911e797cb 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -239,7 +239,7 @@ xattr-mapping Examples
>  
>  ::
>  
> --o xattrmap=":prefix:all::user.virtiofs.::bad:all:::"
> + -o xattrmap=":prefix:all::user.virtiofs.::bad:all:::"
>  
>  
>  This uses two rules, using : as the field separator;
> @@ -250,7 +250,8 @@ the host set.
>  This is equivalent to the 'map' rule:
>  
>  ::
> --o xattrmap=":map::user.virtiofs.:"
> +
> + -o xattrmap=":map::user.virtiofs.:"
>  
>  2) Prefix 'trusted.' attributes, allow others through
>  
> @@ -277,7 +278,8 @@ through.
>  This is equivalent to the 'map' rule:
>  
>  ::
> --o xattrmap="/map/trusted./user.virtiofs./"
> +
> + -o xattrmap="/map/trusted./user.virtiofs./"
>  
>  3) Hide 'security.' attributes, and allow everything else
>  
> -- 
> 2.27.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


