Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345AA364905
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:28:15 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXgz-0003IO-Ra
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lYXf7-0002fz-Jz
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:26:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lYXf4-0006b3-Kg
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618853173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4IDGUzB9p3BLka7uSkzYkimJt0hsEfJqAPSwIlnD7KM=;
 b=E56UGEkEDgiiJEda3zUrxuCPqusgl/cLEYQp6Uxnojq9UaaWvU3y5Tey2DJCkbxSdsHdxW
 sb+/4JE2tjuZy/VeWeqeiCTd1n5H02RVjccunZotptQXhYrqRVM29HFhDFUxhRlAtXQH4i
 0sl7sdLaWgG6hs+ZrjZ9ue8dK9v3E2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-uiyz5_HBPEmYgEO5JcwT1w-1; Mon, 19 Apr 2021 13:26:11 -0400
X-MC-Unique: uiyz5_HBPEmYgEO5JcwT1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 878FA107ACCD;
 Mon, 19 Apr 2021 17:26:10 +0000 (UTC)
Received: from work-vm (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FCE3163CA;
 Mon, 19 Apr 2021 17:26:05 +0000 (UTC)
Date: Mon, 19 Apr 2021 18:26:03 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.0] migration: Drop redundant query-migrate result
 @blocked
Message-ID: <YH29K3Wa/gyceh72@work-vm>
References: <20210419162732.766055-1-armbru@redhat.com>
 <CAFEAcA_S7rvB73JxEAUj_aKcxNcKu4zSoFUsXiLHb=kU7=Qs1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_S7rvB73JxEAUj_aKcxNcKu4zSoFUsXiLHb=kU7=Qs1A@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 19 Apr 2021 at 17:27, Markus Armbruster <armbru@redhat.com> wrote:
> >
> > Result @blocked is true when and only when result @blocked-reasons is
> > present.  It's always non-empty when present.  @blocked is redundant;
> > drop.
> >
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>

So I'm OK with it in principal and I think the code is OK, so

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> "for-6.0" needs to be accompanied by a justification of why it's
> important to go in the release at this point...

I guess the argument is that when we hit 6.0 it becomes API and removing
the 'blocked' becomes a matter of deprecation which is a pain.

Hmm; I agree it's the right change, but I'm not sure I can justify it
this late in the release.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


