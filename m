Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF7431F9E7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:29:48 +0100 (CET)
Received: from localhost ([::1]:58678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5qt-0007fS-3N
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lD5oJ-0006K7-1C
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lD5oF-0003LR-DS
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613741221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aMXK0t7aAQwvehRpVPdXrlhytDUssMd6tUcQfNZNVFM=;
 b=NONS8o1nYvjuYnyrWY3kTmqQAXe3bhuOdk0i0XETJLoiDVhF5REEULsL0fbWRbKpdcvibd
 NfpwZp9SUrxG7swlVtvPouveX4DDYuX5S57coC/QAW8IYbBVPtepcYOAuWgDV6tVOI/lg7
 eM5GEUFEfyRMY1BlipnzBKw6GHt9tKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-tmvxv4i3OiuIdicwO3GpPQ-1; Fri, 19 Feb 2021 08:26:59 -0500
X-MC-Unique: tmvxv4i3OiuIdicwO3GpPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 184F7187CC6B;
 Fri, 19 Feb 2021 13:26:58 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-88.ams2.redhat.com [10.36.114.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F0085D9D5;
 Fri, 19 Feb 2021 13:26:56 +0000 (UTC)
Date: Fri, 19 Feb 2021 14:26:55 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH] iotests: Drop deprecated 'props' from object-add
Message-ID: <20210219132655.GD5750@merkur.fritz.box>
References: <20210216171653.6543-1-berto@igalia.com>
 <20210219122149.GC5750@merkur.fritz.box>
 <w51pn0wql96.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
In-Reply-To: <w51pn0wql96.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.02.2021 um 13:45 hat Alberto Garcia geschrieben:
> On Fri 19 Feb 2021 01:21:49 PM CET, Kevin Wolf <kwolf@redhat.com> wrote:
> >>  log(vm.qmp('object-add', qom_type='throttle-group', id='tg0',
> >> -           props={ 'x-bps-total': size }))
> >> +           x_bps_total=size))
> >
> > x-bps-total isn't a stable interface, I'd prefer to use limits.
> >
> > My patch from November [1] had this:
> 
> Do you want me to resend mine, or wait for yours, or what then? :)

It's your patch, you decide. :-)

I haven't compared the patches in detail yet, so if you think merging my
patch has the same result and is less work, I can do that. If not and
you send a v2, I'll take that. Or you see differences and post review
comments to my patch instead of a v2 of yours. I'm fine with any of
these options.

Kevin


