Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13954E7586
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 15:58:05 +0100 (CET)
Received: from localhost ([::1]:42726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlO8-0004SR-Nd
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 10:58:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXlMA-0002RV-AR
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXlM8-0003wa-5W
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648220158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DVbcI0SOP4OgYrSWFMAxrFX4qiZaqc1AY+noDV/CqVA=;
 b=EsMgM5eyYx0O4ANocQIl/5v5hvCDrfec0gjE//Gc+FTJnWyzA9rVKCff93+mKw9vZE4Zx1
 BUJO4aVSBTCIef4dQrwCTT4ptf7V1j6Z1wPYBiCGNLZ1UmG+PK7bQ6zbNKh1odzz1My0Qb
 t0pg7wBa7sjDzRcxovsGpx2VL9vckzo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-TilV-4RsNMeVss3hCCryeA-1; Fri, 25 Mar 2022 10:55:53 -0400
X-MC-Unique: TilV-4RsNMeVss3hCCryeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 650AC80281D;
 Fri, 25 Mar 2022 14:55:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEE727AFA;
 Fri, 25 Mar 2022 14:55:48 +0000 (UTC)
Date: Fri, 25 Mar 2022 09:55:47 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 01/10] python/aqmp: add explicit GPLv2 license to legacy.py
Message-ID: <20220325145547.fjddkhdwfapmnokq@redhat.com>
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-2-jsnow@redhat.com>
 <CAFn=p-YM8VoXLMBz4nmkvkAMH8SHa+uT=Wx9F77Q-xKrea9GLg@mail.gmail.com>
 <YjwzCM3/wZ4S2fxf@redhat.com> <Yjwzy97JAHKhvCHn@redhat.com>
 <CAFn=p-Zj24yJYvPTpnXLA3wG-Fm8okVTXM-QG0rSAjp3AJuCvQ@mail.gmail.com>
 <YjyNcDjRLWZGiEwU@redhat.com>
 <CAFn=p-aAfEABN3E7in78HEWhSV3ywVzDGiB-aHaPU2an3e9qfw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-aAfEABN3E7in78HEWhSV3ywVzDGiB-aHaPU2an3e9qfw@mail.gmail.com>
User-Agent: NeoMutt/20211029-512-43304b
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 12:07:24PM -0400, John Snow wrote:
...
> > Yep, as I mentioned, I don't want to see us abandon copyleft either.
> >
> > Of course everyone has their own preferred license, so I'm sure
> > people who write apps with MIT, will think we should use MIT
> > too. Ultimately though, if we choose LGPL, they can still use
> > our module from an MIT licensed app, or any other licensed app
> > for that matter.
> >
> 
> OK, thanks for your input here. My plan right now, then, is:
> 
> (1) Relicense aqmp as LGPLv2+
> (2) Fork into new repo as discussed previously on qemu-devel
> (3) Work on dropping legacy.py (GPLv2) in favor of sync.py (LGPLv2+)

That plan works for me.  I'm happy for any of my contributions to be
widened to LGPLv2+, but not with the thought of abandoning copyleft by
going all the way to MIT.

> 
> I plan to version the fledgling forked repo as 0.0.z until I drop
> legacy.py, and then I'll version as 0.y.z for "a while", (A release or
> two for QEMU?), and then tag v1.0.0.
> (As we discussed earlier, with a non-finalized API, I'll be pinning
> QEMU to use specific versions until it stabilizes.)
> 
> I think you're right that we probably could relicense legacy.py
> without too much fuss, I think the most significant contributions that
> didn't come from Luiz or myself were made to docstrings, and only
> extremely few contributions came from non-RH addresses. Still, I plan
> to drop the whole file anyway, so I figured I'd side-step the
> relicensing justification there, even if it's doable.

I'm happy to relicense any of my contributions as needed (did I
actually write any, or just provide reviews?), but as you say,
sidestepping the process may get to the same end goal even faster.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


