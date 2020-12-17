Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B12DD9AE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 21:10:48 +0100 (CET)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpzbr-0002fo-AY
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 15:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpzaV-0001sY-Rt
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:09:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpzaP-0003dK-MB
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608235754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aB8jETliahrilXgXiJMflmzyN5jWs3s7Zw7MNOqgE1w=;
 b=cBLCwK6QJQnh2bgriCTmPODDUTm43d07+nf5L9tlxC1Ur08Db6cR9c7rhJJOnmZJjhLubd
 d0kkA+uDFJtfAuXELQbz50CWCAEUv7OWFRZUMlVV8Nsh6/8ZbO/4ye+m6YfcOVVRPjY0nZ
 jqfjfOVV5y5HYZWLsEpoSfjsvajB9gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-25savB41PLC_xFVniW5KBw-1; Thu, 17 Dec 2020 15:09:13 -0500
X-MC-Unique: 25savB41PLC_xFVniW5KBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DA2F107ACE3;
 Thu, 17 Dec 2020 20:09:11 +0000 (UTC)
Received: from work-vm (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 370C619EF2;
 Thu, 17 Dec 2020 20:09:10 +0000 (UTC)
Date: Thu, 17 Dec 2020 20:09:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtiofsd: Remove useless code about send_notify_iov
Message-ID: <20201217200907.GA43032@work-vm>
References: <20201214121615.29967-1-alex.chen@huawei.com>
 <20201214170045.GI620320@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201214170045.GI620320@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Alex Chen <alex.chen@huawei.com>, qemu-trivial@nongnu.org,
 zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Mon, Dec 14, 2020 at 12:16:15PM +0000, Alex Chen wrote:
> > The 'ch' will be NULL in the following stack:
> > send_notify_iov()->fuse_send_msg()->virtio_send_msg(), and
> > this may lead to NULL pointer dereferenced in virtio_send_msg().
> > But send_notify_iov() was never called, so remove the useless code
> > about send_notify_iov() to fix this problem.
> > 
> > Signed-off-by: Alex Chen <alex.chen@huawei.com>
> > ---
> >  tools/virtiofsd/fuse_lowlevel.c | 98 ---------------------------------
> >  1 file changed, 98 deletions(-)
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>


I've picked this up in my current virtiofsd pull I'm doing.

Queued

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


