Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB7936B2C8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:13:38 +0200 (CEST)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb07N-0005q2-OF
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb05C-0005OA-Cr
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:11:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb05A-00042M-2P
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619439078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6nNEVAAntkq36IwtZx9X7ncHVB+XgvOD/ss+cYmXqPc=;
 b=Z56HmPz5Fp6vlC+E8V3X9/u4j8vqnvKbTKWIkbq9OmBU3lUAeq9Lnzs4R0PKM20L9u4Cfn
 cZ+T5rKu3j8RXRBNSeg6pI+WwglSuSnKIYEBD3I8YfM9TQUBhH9IOkWA74e/5Uwvn9IEHg
 z73r8uBCDUYioMZPTeIsX12HxK0rwgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-pE6pPjD1PPq605UUW5fpzA-1; Mon, 26 Apr 2021 08:11:16 -0400
X-MC-Unique: pE6pPjD1PPq605UUW5fpzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B553A8189CA;
 Mon, 26 Apr 2021 12:11:15 +0000 (UTC)
Received: from work-vm (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 238C36268B;
 Mon, 26 Apr 2021 12:11:13 +0000 (UTC)
Date: Mon, 26 Apr 2021 13:11:11 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Edge NFV <edgenfv@gmail.com>
Subject: Re: First time patch not reflected in the mailing list
Message-ID: <YIat3ynsNsdXS6AM@work-vm>
References: <CAED3YRq2yq+FOr5gGjHjrD8Ak=YiHMfvj1rReVefuw9-=9FR7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAED3YRq2yq+FOr5gGjHjrD8Ak=YiHMfvj1rReVefuw9-=9FR7Q@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Edge NFV (edgenfv@gmail.com) wrote:
> Hi
> 
> I sent a patch around four hours back but I doesn't seem to be reflected on
> to the mailing list. That patch was my first mail to this mail list. I
> understand that this a moderated list and the first message needs to be
> white listed by the moderator. Please let me know how long it will take to
> white list my patch message.

This list isn't moderated normally so shouldn't be a problem.

Still the list seems to be running a bit slowly today, I see your patch
has made it through though.

Dave

> E
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


