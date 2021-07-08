Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB73C13F2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:11:58 +0200 (CEST)
Received: from localhost ([::1]:36820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Tor-0000FJ-St
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1Tgh-00039Z-BL
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1Tgc-0007Pz-8E
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dNV+dxoMofcoELy7JkT7YQiHxVjbZ6BVRZMJxuQHiNY=;
 b=RMq2vg6sssJkMxsB6yYm3hCxZ1B0cXAWMdMZ6vW/ihRVMi1nKt8VKQYEaWQPRiK7fzm44Q
 JzE/Hn0iA6ezaud6RKHf1OwGrMBBxsLueMYLuBqdH4XTQHb8TOfvjS9EEp1EfkoLRKQcRd
 R9CbrmY+bSXL6VobaFNwXXbInpnOYes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-TZNmdxQnM_mQIljpbI8lbg-1; Thu, 08 Jul 2021 09:03:23 -0400
X-MC-Unique: TZNmdxQnM_mQIljpbI8lbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A36180BCAF;
 Thu,  8 Jul 2021 13:03:07 +0000 (UTC)
Received: from redhat.com (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE8C25D6A8;
 Thu,  8 Jul 2021 13:03:05 +0000 (UTC)
Date: Thu, 8 Jul 2021 15:03:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 0/2] Remove deprecated qemu-img backing file without format
Message-ID: <YOb3iK4dVYDejvkA@redhat.com>
References: <20210503213600.569128-1-eblake@redhat.com>
 <20210707211738.ioegdvuk3wjyohu7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707211738.ioegdvuk3wjyohu7@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.07.2021 um 23:17 hat Eric Blake geschrieben:
> On Mon, May 03, 2021 at 04:35:58PM -0500, Eric Blake wrote:
> > We've gone enough release cycles without noticeable pushback on our
> > intentions, so time to make it harder to create images that can form a
> > security hole due to a need for format probing rather than an explicit
> > format.
> > 
> > Eric Blake (2):
> >   qcow2: Prohibit backing file changes in 'qemu-img amend'
> >   qemu-img: Require -F with -b backing image
> 
> Ping.

Thanks, applied to the block branch.

For some reason, the CCs were missing on the cover letter. Please make
sure to CC me (and qemu-block) for the whole series if you want it to go
through my tree.

Kevin


