Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D91E3CF10E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:02:07 +0200 (CEST)
Received: from localhost ([::1]:50146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5e98-00024T-KO
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5e7M-00013Q-Uk
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:00:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5e7K-0008ML-Om
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626742814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ZRnMGx7Dp0ifeNRtx/z2ywcKe6/IXq/lIlEQhiBqp0=;
 b=E7Gkc0IFENvBY03gS4HoZb+K2TpB7Dyki+Cynd8OSqLuzLipF8ui/DKQWMHMmYmVT6ZhQs
 XtR1o2vpDTrLhKi+6jMOmAN1CPXYjyQZzIPYmYi+bMyIy5MbnZ+xZ9zNXNDzTnYGGP4/OQ
 rie55jHIuoQi8eHdgI5nMOOncihmPi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-fCj9XNBjPTmOY02jaa5Hcg-1; Mon, 19 Jul 2021 21:00:12 -0400
X-MC-Unique: fCj9XNBjPTmOY02jaa5Hcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEAD118D6A2A
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 01:00:11 +0000 (UTC)
Received: from redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DDA810074E1;
 Tue, 20 Jul 2021 01:00:07 +0000 (UTC)
Date: Mon, 19 Jul 2021 20:00:05 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] qom: use correct field name when getting/setting
 alias properties
Message-ID: <20210720010005.vegqnbb5qhfxh7ow@redhat.com>
References: <20210719104033.185109-1-pbonzini@redhat.com>
 <20210719104033.185109-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210719104033.185109-3-pbonzini@redhat.com>
User-Agent: NeoMutt/20210205-614-b535a5
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, alex.williamson@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 12:40:33PM +0200, Paolo Bonzini wrote:
> Alias targets have a different name than the alias property itself
> (e.g. a machine's pflash0 might be an alias of a property named 'drive').
> When the target's getter or setter invokes the visitor, it will use
> a different name than what the caller expects, and the visitor will
> not be able to find it (or will consume erroneously).
> 
> The solution is for alias getters and setters to wrap the incoming
> visitor, and forward the sole field that the target is expecting while
> renaming it appropriately.
> 
> This bug has been there forever, but it was exposed after -M parsing
> switched from QemuOptions and StringInputVisitor to keyval and
> QObjectInputVisitor.  Before, the visitor ignored the name. Now, it
> checks "drive" against what was passed on the command line and finds
> that no such property exists.
> 
> Fixes: #484
> Reported-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qom/object.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Deceptively simple; all the work was in the previous patch writing up
the forwarding visitor.  I still wonder if Kevin's QAPI aliases will
do this more gracefully, but if we're trying to justify this as a bug
fix worthy of 6.1, this is certainly a smaller approach than Kevin's.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


